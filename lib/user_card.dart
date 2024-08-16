import 'package:flutter/material.dart';
import 'package:myapp/notes_model.dart';

class UserCard extends StatelessWidget {
  final NotesModel note;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  UserCard({required this.note, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Work Order: ${note.workOrder}', style: TextStyle(fontSize: 16.0)),
            Text('Date: ${note.date}', style: TextStyle(fontSize: 16.0)),
            Text('Word OR: ${note.wordOR}', style: TextStyle(fontSize: 16.0)),
            Text('Employee Name: ${note.empName}', style: TextStyle(fontSize: 16.0)),
            Text('Employee ID: ${note.empID}', style: TextStyle(fontSize: 16.0)),
            Text('Employee Designation: ${note.empDesignation}', style: TextStyle(fontSize: 16.0)),
            Text('Email: ${note.email}', style: TextStyle(fontSize: 16.0)),
            Text('Phone: ${note.phone}', style: TextStyle(fontSize: 16.0)),
            Text('Department: ${note.depart}', style: TextStyle(fontSize: 16.0)),
            Text('Request Type: ${note.requestType}', style: TextStyle(fontSize: 16.0)),
            Text('Description: ${note.description}', style: TextStyle(fontSize: 16.0)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
