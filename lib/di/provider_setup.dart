import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

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

final getIt = GetIt.instance;

Future setUpDi() async {
  getIt.registerSingletonAsync(() => openDatabase(
    'notes_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)');
    },
  ));
  getIt.registerSingleton(NoteDbHelper(await getIt.getAsync()));
  getIt.registerSingleton<NoteRepository>(NoteRepositoryImpl(getIt.get()));
  getIt.registerSingleton(AddNoteUseCase(getIt.get()));
  getIt.registerSingleton(DeleteNoteUseCase(getIt.get()));
  getIt.registerSingleton(GetNoteUseCase(getIt.get()));
  getIt.registerSingleton(GetNotesUseCase(getIt.get()));
  getIt.registerSingleton(UpdateNoteUseCase(getIt.get()));

  getIt.registerFactory(
        () => NotesViewModel(
      UseCases(
        addNoteUseCase: getIt.get(),
        deleteNoteUseCase: getIt.get(),
        getNoteUseCase: getIt.get(),
        getNotesUseCase: getIt.get(),
        updateNoteUseCase: getIt.get(),
      ),
    ),
  );

  getIt.registerFactory(() => AddEditNoteViewModel(getIt.get()));
}