import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_type.dart';

part 'note_order.freezed.dart';

@freezed
class NoteOrder with _$NoteOrder {
  const factory NoteOrder.title(OrderType orderType) = NoteOrderTitle;
  const factory NoteOrder.date(OrderType orderType) = NoteOrderDate;
  const factory NoteOrder.color(OrderType orderType) = NoteOrderColor;
}
