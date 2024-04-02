import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/common/utils/api_path.dart';
import 'package:next_starter/data/datasources/remote_datasources/ticket_remote/ticket_remote.dart';
import 'package:next_starter/data/models/ticket/ticket_detail_model.dart';
import 'package:next_starter/data/models/ticket/ticket_model.dart';

@LazySingleton(as: TicketRemote)
class TicketRemoteImpl extends BaseDioRemoteSource implements TicketRemote {
  TicketRemoteImpl(super.dio, super.session);

  @override
  Future<List<TicketModel>> getAllTicket({String? start, String? end}) {
    return networkRequest(
      isAuth: true,
      request: (dio) => dio.get(ApiPath.ticket, queryParameters: {'start': start, 'end': end}),
      onResponse: (json) => json != null
          ? (json['data'] as List).map<TicketModel>((post) => TicketModel.fromJson(post)).toList()
          : [],
    );
  }

  @override
  Future<TicketDetailModel> getDetailTicket({required ticketId}) {
    return networkRequest(
      isAuth: true,
      request: (dio) => dio.get('${ApiPath.ticketDetail}/$ticketId'),
      onResponse: (json) => TicketDetailModel.fromJson(json['data']),
    );
  }
}
