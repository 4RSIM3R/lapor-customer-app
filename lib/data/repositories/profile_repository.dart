import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_repository.dart';
import 'package:next_starter/data/datasources/remote_datasources/profile_remote/profile_remote.dart';

@LazySingleton()
class ProfileRepository extends BaseRepository {
  final ProfileRemote remote;

  ProfileRepository(super.networkInfo, this.remote);
}
