import 'package:flutter/material.dart';

import 'package:myapp/notes_model.dart';


class UserProvider extends ChangeNotifier {
  final List<NotesModel> _notes = [];

  List<NotesModel> get notes => _notes;

  void addNote(NotesModel note) {
    _notes.add(note);
    notifyListeners();
  }

  void deleteNoteAt(int index) {
    _notes.removeAt(index);
    notifyListeners();
  }

  void updateNoteAt(int index, NotesModel note) {
    _notes[index] = note;
    notifyListeners();
  }
}
