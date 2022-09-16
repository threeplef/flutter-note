import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../data/data_source/note_db_helper.dart';
import '../data/repository/note_repository_impl.dart';
import '../domain/repository/note_repository.dart';
import '../domain/use_case/add_note_use_case.dart';
import '../domain/use_case/delete_note_use_case.dart';
import '../domain/use_case/get_note_use_case.dart';
import '../domain/use_case/get_notes_use_case.dart';
import '../domain/use_case/update_note_use_case.dart';
import '../domain/use_case/use_cases.dart';
import '../presentation/add_edit_note/add_edit_note_view_model.dart';
import '../presentation/notes/notes_view_model.dart';

Future<List<SingleChildWidget>> getProviders() async {
  Database database =
      await openDatabase('notes_db', version: 1, onCreate: (db, version) async {
    await db.execute(
      'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)',
    );
  });

  NoteDbHelper noteDbHelper = NoteDbHelper(database);
  NoteRepository repository = NoteRepositoryImpl(noteDbHelper);
  UseCases useCases = UseCases(
      addNoteUseCase: AddNoteUseCase(repository),
      deleteNoteUseCase: DeleteNoteUseCase(repository),
      getNoteUseCase: GetNoteUseCase(repository),
      getNotesUseCase: GetNotesUseCase(repository),
      updateNoteUseCase: UpdateNoteUseCase(repository));
  NotesViewModel notesViewModel = NotesViewModel(useCases);
  AddEditNoteViewModel addEditNoteViewModel = AddEditNoteViewModel(repository);

  return [
    ChangeNotifierProvider(create: (_) => notesViewModel),
    ChangeNotifierProvider(create: (_) => addEditNoteViewModel),
  ];
}
