import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_repository.dart';
import 'package:next_starter/data/datasources/remote_datasources/setting_remote/setting_remote.dart';

@LazySingleton()
class SettingRepository extends BaseRepository {
  final SettingRemote remote;

  SettingRepository(super.networkInfo, this.remote);
}
