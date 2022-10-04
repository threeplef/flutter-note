import 'package:injectable/injectable.dart';
import 'package:note/domain/repository/note_repository.dart';

import '../model/note.dart';

@singleton
class AddNoteUseCase {
  final NoteRepository repository;

  AddNoteUseCase(this.repository);

  Future<void> call(Note note) async {
    await repository.insertNote(note);
  }
}