import 'package:next_starter/data/models/ticket/ticket_detail_model.dart';
import 'package:next_starter/data/models/ticket/ticket_model.dart';

abstract class TicketRemote {
  Future<List<TicketModel>> getAllTicket({String? start, String? end});
  Future<TicketDetailModel> getDetailTicket({required dynamic id});
  Future<void> updateTicket({required dynamic id, required dynamic status});
}
