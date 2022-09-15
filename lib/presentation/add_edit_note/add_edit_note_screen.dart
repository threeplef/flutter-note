import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/model/note.dart';
import '../../ui/colors.dart';
import 'add_edit_note_event.dart';
import 'add_edit_note_view_model.dart';

class AddEditNoteScreen extends StatefulWidget {
  final Note? note;

  const AddEditNoteScreen({Key? key, this.note}) : super(key: key);

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  StreamSubscription? _streamSubscription;

  final List<Color> noteColors = [
    roseBud,
    primrose,
    wisteria,
    skyBlue,
    illusion
  ];

  @override
  void initState() {
    super.initState();

    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }

    Future.microtask(() {
      final viewModel = context.read<AddEditNoteViewModel>();

      _streamSubscription = viewModel.eventStream.listen((event) {
        event.when(
          saveNote: () {
            Navigator.pop(context, true);
          },
          showSnackBar: (String message) {
            final snackBar = SnackBar(
              content: Text(message),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        );
      });
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddEditNoteViewModel>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.onEvent(AddEditNoteEvent.saveNote(
              widget.note == null ? null : widget.note!.id,
              _titleController.text,
              _contentController.text));
        },
        child: const Icon(Icons.save),
      ),
      body: SafeArea(
        child: AnimatedContainer(
          color: Color(viewModel.color),
          duration: const Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: noteColors
                        .map(
                          (color) => InkWell(
                        onTap: () {
                          viewModel.onEvent(
                              AddEditNoteEvent.changeColor(color.value));
                        },
                        child: _buildBackgroundColor(
                            color: color,
                            selected: viewModel.color == color.value),
                      ),
                    )
                        .toList(),
                  ),
                ),
                TextField(
                  controller: _titleController,
                  maxLines: 1,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline5!
                      .copyWith(
                    color: darkGray,
                  ),
                  decoration: const InputDecoration(
                    hintText: '제목을 입력하세요.',
                    border: InputBorder.none,
                  ),
                ),
                TextField(
                  controller: _contentController,
                  maxLines: null,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(
                    color: darkGray,
                  ),
                  decoration: const InputDecoration(
                    hintText: '내용을 입력하세요.',
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundColor({required Color color, required bool selected}) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: darkGray.withOpacity(0.2),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ],
        border: selected
            ? Border.all(
                color: darkGray,
                width: 3.0,
              )
            : null,
      ),
    );
  }
}
