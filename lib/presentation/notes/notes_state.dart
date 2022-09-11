import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/note.dart';

part 'notes_state.freezed.dart';
part 'notes_state.g.dart';

@freezed
class NotesState with _$NotesState {
  const factory NotesState({
    required List<Note> notes,
  }) = _NotesState;
  
  factory NotesState.fromJson(Map<String, Object?> json) => _$NotesStateFromJson(json);
}