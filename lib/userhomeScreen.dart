import 'package:flutter/material.dart';
import 'package:myapp/adminhomeScreen.dart';
import 'package:myapp/notes_model.dart';
import 'package:myapp/userprovider.dart';
import 'package:provider/provider.dart';

class UserHomeScreen extends StatelessWidget {
  final String username;

  UserHomeScreen({required this.username});

  final TextEditingController _workOrderController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _wordORController = TextEditingController();
  final TextEditingController _empNameController = TextEditingController();
  final TextEditingController _empIDController = TextEditingController();
  final TextEditingController _empDesignationController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _departController = TextEditingController();
  final TextEditingController _requestTypeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('User Home'),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 82, 82, 82),
                Color.fromARGB(255, 97, 175, 101)
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Text('Welcome, $username'),
                  const SizedBox(height: 10,),
                  _buildTextField(_workOrderController, 'Work Order'),
                  const SizedBox(height: 10,),
                  _buildTextField(_dateController, 'Date'),
                  const SizedBox(height: 10,),
                  _buildTextField(_wordORController, 'Word OR'),
                  const SizedBox(height: 10,),
                  _buildTextField(_empNameController, 'Employee Name'),
                  const SizedBox(height: 10,),
                  _buildTextField(_empIDController, 'Employee ID'),
                  const SizedBox(height: 10,),
                  _buildTextField(_empDesignationController, 'Employee Designation'),
                  const SizedBox(height: 10,),
                  _buildTextField(_emailController, 'Email'),
                  const SizedBox(height: 10,),
                  _buildTextField(_phoneController, 'Phone'),
                  const SizedBox(height: 10,),
                  _buildTextField(_departController, 'Department'),
                  const SizedBox(height: 10,),
                  _buildTextField(_requestTypeController, 'Request Type'),
                  const SizedBox(height: 10,),
                  _buildTextField(_descriptionController, 'Description'),
                  const SizedBox(height: 18,),
                  ElevatedButton(
                    onPressed: () {
                      if (_areAllFieldsFilled()) {
                        final newNote = NotesModel(
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
                          userId: username,
                        );
                        Provider.of<UserProvider>(context, listen: false).addNote(newNote);
                        _clearAllFields();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminHomeScreen(),
                          ),
                        );
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextField _buildTextField(TextEditingController controller, String labelText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 2.0),
        ),
      ),
    );
  }

  bool _areAllFieldsFilled() {
    return _workOrderController.text.isNotEmpty &&
        _dateController.text.isNotEmpty &&
        _wordORController.text.isNotEmpty &&
        _empNameController.text.isNotEmpty &&
        _empIDController.text.isNotEmpty &&
        _empDesignationController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _departController.text.isNotEmpty &&
        _requestTypeController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty;
  }

  void _clearAllFields() {
    _workOrderController.clear();
    _dateController.clear();
    _wordORController.clear();
    _empNameController.clear();
    _empIDController.clear();
    _empDesignationController.clear();
    _emailController.clear();
    _phoneController.clear();
    _departController.clear();
    _requestTypeController.clear();
    _descriptionController.clear();
  }
}
