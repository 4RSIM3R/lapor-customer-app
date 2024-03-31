import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_repository.dart';
import 'package:next_starter/data/datasources/remote_datasources/ticket_remote/ticket_remote.dart';

@LazySingleton()
class TicketRepository extends BaseRepository {
  final TicketRemote remote;

  TicketRepository(super.networkInfo, this.remote);
}
