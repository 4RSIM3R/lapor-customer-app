import 'package:appflowy_board/appflowy_board.dart';
import 'package:next_starter/data/models/ticket/ticket_model.dart';

class TextItem extends AppFlowyGroupItem {
  final String s;
  final TicketModel model;

  TextItem(this.s, this.model);

  @override
  IsDraggable get draggable => false;

  @override
  String get id => s;
}
