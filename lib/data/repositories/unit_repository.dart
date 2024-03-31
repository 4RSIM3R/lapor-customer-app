import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_repository.dart';
import 'package:next_starter/data/datasources/remote_datasources/unit_remote/unit_remote.dart';

@LazySingleton()
class UnitRepository extends BaseRepository {
  final UnitRemote remote;

  UnitRepository(super.networkInfo, this.remote);
}
