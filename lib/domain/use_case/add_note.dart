import 'package:note/domain/repository/note_repository.dart';

import '../model/note.dart';

class AddNote {
  final NoteRepository repository;

  AddNote(this.repository);

  Future<void> call(Note note) async {
    await repository.insertNote(note);
  }
}