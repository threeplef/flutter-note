import 'package:flutter/material.dart';
import 'package:note/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:note/presentation/notes/notes_event.dart';
import 'package:note/presentation/notes/notes_view_model.dart';
import 'package:note/ui/colors.dart';
import 'package:provider/provider.dart';

import '../../domain/model/note.dart';
import 'components/note_item.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NotesViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Note',
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          ),
        ],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
         bool? isSaved = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEditNoteScreen()),
          );

         if (isSaved != null && isSaved) {
           viewModel.onEvent(const NotesEvent.loadNotes());
         }
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: state.notes
              .map(
                (note) => NoteItem(
                  note: note,
                  onDeletePressed: () {
                    viewModel.onEvent(NotesEvent.deleteNote(note));
                    
                    final snackBar = SnackBar(content: const Text('노트가 삭제되었습니다.'),
                    action: SnackBarAction(
                      label: '취소',
                      onPressed: () {
                        viewModel.onEvent(const NotesEvent.restoreNote());
                      },
                    ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
