import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_repository.dart';
import 'package:next_starter/data/datasources/remote_datasources/site_remote/site_remote.dart';

@LazySingleton()
class SiteRepository extends BaseRepository {
  final SiteRemote remote;

  SiteRepository(super.networkInfo, this.remote);
}
