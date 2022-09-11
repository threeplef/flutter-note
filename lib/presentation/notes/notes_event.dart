import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/note.dart';

part 'notes_event.freezed.dart';

@freezed
class NotesEvent<T> with _$NotesEvent<T> {
  const factory NotesEvent.loadNotes() = LoadNotes;
  const factory NotesEvent.deleteNote(Note note) = DeleteNote;
  const factory NotesEvent.restoreNote() = RestoreNote;
}