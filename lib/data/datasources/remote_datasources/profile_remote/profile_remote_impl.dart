import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/data/datasources/remote_datasources/profile_remote/profile_remote.dart';

@LazySingleton(as: ProfileRemote)
class ProfileRemoteImpl extends BaseDioRemoteSource implements ProfileRemote {
  ProfileRemoteImpl(super.dio, super.session);
  
}