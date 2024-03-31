import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/data/datasources/remote_datasources/ticket_remote/ticket_remote.dart';

@LazySingleton(as: TicketRemote)
class TicketRemoteImpl extends BaseDioRemoteSource implements TicketRemote {
  TicketRemoteImpl(super.dio, super.session);
  
}