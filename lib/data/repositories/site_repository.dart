import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_repository.dart';
import 'package:next_starter/common/typedefs/typedefs.dart';
import 'package:next_starter/data/datasources/remote_datasources/site_remote/site_remote.dart';
import 'package:next_starter/data/models/site/site_model.dart';

@LazySingleton()
class SiteRepository extends BaseRepository {
  final SiteRemote remote;

  SiteRepository(super.networkInfo, this.remote);

  EitherResponse<List<SiteModel>> getAllSite() async {
    return handleNetworkCall(
      call: remote.getAllSite(),
      onSuccess: (r) => r,
    );
  }
}
