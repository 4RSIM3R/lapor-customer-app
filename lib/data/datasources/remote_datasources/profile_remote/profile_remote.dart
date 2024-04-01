import 'package:next_starter/data/models/profile/profile_model.dart';

abstract class ProfileRemote {
  Future<ProfileModel> getProfile();
}
