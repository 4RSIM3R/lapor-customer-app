import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_repository.dart';
import 'package:next_starter/common/typedefs/typedefs.dart';
import 'package:next_starter/data/datasources/remote_datasources/ticket_remote/ticket_remote.dart';
import 'package:next_starter/data/models/ticket/ticket_detail_model.dart';
import 'package:next_starter/data/models/ticket/ticket_model.dart';

@LazySingleton()
class TicketRepository extends BaseRepository {
  final TicketRemote remote;

  TicketRepository(super.networkInfo, this.remote);

  EitherResponse<List<TicketModel>> getAllTicket({String? start, String? end}) {
    return handleNetworkCall(
      call: remote.getAllTicket(start: start, end: end),
      onSuccess: (r) => r,
    );
  }

  EitherResponse<TicketDetailModel> getTicketDetail({required id}) {
    return handleNetworkCall(
      call: remote.getDetailTicket(id: id),
      onSuccess: (r) => r,
    );
  }

  EitherResponse<void> updateTicket({required id, required status}) {
    return handleNetworkCall(
      call: remote.updateTicket(id: id, status: status),
      onSuccess: (r) => r,
    );
  }
}
