import 'package:flutter/material.dart';
import 'package:myapp/notes_model.dart';
import 'package:myapp/pdf_generator.dart';
import 'package:myapp/user_card.dart';
import 'package:myapp/userprovider.dart';
import 'package:pdf/pdf.dart';
import 'package:provider/provider.dart';
import 'package:printing/printing.dart';

class AdminHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Admin Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.print),
            onPressed: () => _printNotes(context),
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 82, 82, 82),
                Color.fromARGB(255, 97, 175, 101)
              ],
            ),
          ),
          child: Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              return ListView.builder(
                itemCount: userProvider.notes.length,
                itemBuilder: (context, index) {
                  final note = userProvider.notes[index];
                  return UserCard(
                    note: note,
                    onEdit: () {
                      _showEditDialog(context, note, userProvider, index);
                    },
                    onDelete: () {
                      userProvider.deleteNoteAt(index);
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, NotesModel note, UserProvider userProvider, int index) {
    final _workOrderController = TextEditingController(text: note.workOrder);
    final _dateController = TextEditingController(text: note.date);
    final _wordORController = TextEditingController(text: note.wordOR);
    final _empNameController = TextEditingController(text: note.empName);
    final _empIDController = TextEditingController(text: note.empID);
    final _empDesignationController = TextEditingController(text: note.empDesignation);
    final _emailController = TextEditingController(text: note.email);
    final _phoneController = TextEditingController(text: note.phone);
    final _departController = TextEditingController(text: note.depart);
    final _requestTypeController = TextEditingController(text: note.requestType);
    final _descriptionController = TextEditingController(text: note.description);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Note'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _workOrderController,
                  decoration: InputDecoration(labelText: 'Work Order'),
                ),
                TextField(
                  controller: _dateController,
                  decoration: InputDecoration(labelText: 'Date'),
                ),
                TextField(
                  controller: _wordORController,
                  decoration: InputDecoration(labelText: 'Word OR'),
                ),
                TextField(
                  controller: _empNameController,
                  decoration: InputDecoration(labelText: 'Employee Name'),
                ),
                TextField(
                  controller: _empIDController,
                  decoration: InputDecoration(labelText: 'Employee ID'),
                ),
                TextField(
                  controller: _empDesignationController,
                  decoration: InputDecoration(labelText: 'Employee Designation'),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone'),
                ),
                TextField(
                  controller: _departController,
                  decoration: InputDecoration(labelText: 'Department'),
                ),
                TextField(
                  controller: _requestTypeController,
                  decoration: InputDecoration(labelText: 'Request Type'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final updatedNote = NotesModel(
                  workOrder: _workOrderController.text,
                  date: _dateController.text,
                  wordOR: _wordORController.text,
                  empName: _empNameController.text,
                  empID: _empIDController.text,
                  empDesignation: _empDesignationController.text,
                  email: _emailController.text,
                  phone: _phoneController.text,
                  depart: _departController.text,
                  requestType: _requestTypeController.text,
                  description: _descriptionController.text,
                  userId: note.userId,
                );

                userProvider.updateNoteAt(index, updatedNote);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _printNotes(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final notes = userProvider.notes;

    if (notes.isNotEmpty) {
      final pdfData = await generateNotesPdf(notes);
      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdfData,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No notes available to print')));
    }
  }
}
