import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:myapp/notes_model.dart';

Future<Uint8List> generateNotesPdf(List<NotesModel> notes) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: notes.map((note) {
            return pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 10),
              padding: const pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.black, width: 1),
                borderRadius: pw.BorderRadius.circular(10),
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Work Order: ${note.workOrder}'),
                  pw.Text('Date: ${note.date}'),
                  pw.Text('Word OR: ${note.wordOR}'),
                  pw.Text('Employee Name: ${note.empName}'),
                  pw.Text('Employee ID: ${note.empID}'),
                  pw.Text('Employee Designation: ${note.empDesignation}'),
                  pw.Text('Email: ${note.email}'),
                  pw.Text('Phone: ${note.phone}'),
                  pw.Text('Department: ${note.depart}'),
                  pw.Text('Request Type: ${note.requestType}'),
                  pw.Text('Description: ${note.description}'),
                ],
              ),
            );
          }).toList(),
        );
      },
    ),
  );

  return pdf.save();
}
