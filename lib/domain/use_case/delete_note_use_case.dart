import 'package:injectable/injectable.dart';
import 'package:note/domain/repository/note_repository.dart';

import '../model/note.dart';

@singleton
class DeleteNoteUseCase {
  final NoteRepository repository;

  DeleteNoteUseCase(this.repository);

  Future<void> call(Note note) async {
    await repository.deleteNote(note);
  }
}