import 'package:injectable/injectable.dart';

import 'add_note_use_case.dart';
import 'delete_note_use_case.dart';
import 'get_note_use_case.dart';
import 'get_notes_use_case.dart';
import 'update_note_use_case.dart';

@singleton
class UseCases {
  final AddNoteUseCase addNoteUseCase;
  final DeleteNoteUseCase deleteNoteUseCase;
  final GetNoteUseCase getNoteUseCase;
  final GetNotesUseCase getNotesUseCase;
  final UpdateNoteUseCase updateNoteUseCase;

  UseCases({
    required this.addNoteUseCase,
    required this.deleteNoteUseCase,
    required this.getNoteUseCase,
    required this.getNotesUseCase,
    required this.updateNoteUseCase,
  });
}