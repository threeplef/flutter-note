import 'package:flutter/material.dart';
import 'package:note/ui/colors.dart';

class AddEditNoteScreen extends StatefulWidget {
  const AddEditNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  final List<Color> noteColors = [
    roseBud,
    primrose,
    wisteria,
    skyBlue,
    illusion
  ];

  Color _color = roseBud;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
      body: SafeArea(
        child: AnimatedContainer(
          color: _color,
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
                              setState(() {
                                _color = color;
                              });
                            },
                            child: _buildBackgroundColor(
                                color: color, selected: _color == color),
                          ),
                        )
                        .toList(),
                  ),
                ),
                TextField(
                  controller: _titleController,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
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
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
