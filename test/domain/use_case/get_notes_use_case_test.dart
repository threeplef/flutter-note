import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:note/domain/model/note.dart';
import 'package:note/domain/repository/note_repository.dart';
import 'package:note/domain/use_case/get_notes_use_case.dart';
import 'package:note/domain/util/note_order.dart';
import 'package:note/domain/util/order_type.dart';

import 'get_notes_use_case_test.mocks.dart';

@GenerateMocks([NoteRepository])
void main() {
  test('정렬 기능이 잘 동작해야 한다', () async {
    final repository = MockNoteRepository();
    final getNotes = GetNotesUseCase(repository);

    // 동작 정의
    when(repository.getNotes()).thenAnswer((_) async => [
      const Note(title: 'title1', content: 'content1', color: 1, timestamp: 1),
      const Note(title: 'title2', content: 'content2', color: 2, timestamp: 2),
    ]);

    List<Note> result = await getNotes(const NoteOrder.date(OrderType.descending()));
    expect(result, isA<List<Note>>());
    expect(result[0].timestamp, 2);
    
    result = await getNotes(const NoteOrder.date(OrderType.ascending()));
    expect(result.first.timestamp, 1);
  });
}