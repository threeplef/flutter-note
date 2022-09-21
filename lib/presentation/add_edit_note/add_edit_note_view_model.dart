import 'dart:async';

import 'package:flutter/material.dart';

import '../../domain/model/note.dart';
import '../../domain/repository/note_repository.dart';
import '../../ui/colors.dart';
import 'add_edit_note_event.dart';
import 'add_edit_note_state.dart';
import 'add_edit_note_ui_event.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteRepository repository;

  AddEditNoteState _state = AddEditNoteState(color: roseBud.value);

  final _eventController = StreamController<AddEditNoteUiEvent>.broadcast();
  Stream<AddEditNoteUiEvent> get eventStream => _eventController.stream;

  AddEditNoteViewModel(this.repository, {Note? note}) {
    _state = state.copyWith(
      note: note,
      color: note?.color ?? roseBud.value,
    );
    notifyListeners();
  }

  AddEditNoteState get state => _state;

  void onEvent(AddEditNoteEvent event) {
    event.when(changeColor: _changeColor, saveNote: _saveNote);
  }

  Future<void> _changeColor(int color) async {
    _state = state.copyWith(color: color);
    notifyListeners();
  }

  Future<void> _saveNote(int? id, String title, String content) async {
    if (title.isEmpty || content.isEmpty) {
      _eventController
          .add(const AddEditNoteUiEvent.showSnackBar('제목이나 내용이 비어있습니다'));
      return;
    }
    if (id == null) {
      await repository.insertNote(
        Note(
          title: title,
          content: content,
          color: _state.color,
          timestamp: DateTime.now().millisecondsSinceEpoch,
        ),
      );
    } else {
      await repository.updateNote(
        Note(
          id: id,
          title: title,
          content: content,
          color: _state.color,
          timestamp: DateTime.now().millisecondsSinceEpoch,
        ),
      );
    }
    _eventController.add(const AddEditNoteUiEvent.saveNote());
  }
}
