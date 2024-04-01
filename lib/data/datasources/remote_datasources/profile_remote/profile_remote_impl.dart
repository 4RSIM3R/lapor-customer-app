import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/common/utils/api_path.dart';
import 'package:next_starter/data/datasources/remote_datasources/profile_remote/profile_remote.dart';
import 'package:next_starter/data/models/profile/profile_model.dart';

@LazySingleton(as: ProfileRemote)
class ProfileRemoteImpl extends BaseDioRemoteSource implements ProfileRemote {
  ProfileRemoteImpl(super.dio, super.session);

  @override
  Future<ProfileModel> getProfile() async {
    return networkRequest(
      isAuth: true,
      request: (dio) => dio.get(ApiPath.profile),
      onResponse: (json) => ProfileModel.fromJson(json['data']),
    );
  }
}
