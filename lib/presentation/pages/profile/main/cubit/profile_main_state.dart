part of 'profile_main_cubit.dart';

@freezed
class ProfileMainState with _$ProfileMainState {
  const factory ProfileMainState.initial() = _Initial;
  const factory ProfileMainState.loading() = _Loading;
  const factory ProfileMainState.failure(String message) = _Failure;
  const factory ProfileMainState.succcess(ProfileModel payload) = _Success;
}
