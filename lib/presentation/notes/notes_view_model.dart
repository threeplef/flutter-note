import 'package:flutter/material.dart';

import '../../domain/model/note.dart';
import '../../domain/repository/note_repository.dart';
import 'notes_event.dart';
import 'notes_state.dart';

class NotesViewModel with ChangeNotifier {
  final NoteRepository repository;

  NotesState _state = const NotesState(notes: []);

  NotesState get state => _state;

  Note? _recentlyDeletedNote;

  NotesViewModel(this.repository) {
    _loadNotes();
  }

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: _restoreNote,
    );
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await repository.getNotes();
    _state = state.copyWith(
      notes: notes,
    );
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await repository.deleteNote(note);

    _recentlyDeletedNote = note;

    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await repository.insertNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;

      _loadNotes();
    }
  }
}
