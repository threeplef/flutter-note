import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/note.dart';
import '../../domain/util/note_order.dart';

part 'notes_state.freezed.dart';

@freezed
class NotesState with _$NotesState {
  const factory NotesState({
    required List<Note> notes,
    required NoteOrder noteOrder
  }) = _NotesState;
}