part of 'profile_site_cubit.dart';

@freezed
class ProfileSiteState with _$ProfileSiteState {
  const factory ProfileSiteState.initial() = _Initial;
  const factory ProfileSiteState.loading() = _Loading;
  const factory ProfileSiteState.failure(String message) = _Failure;
  const factory ProfileSiteState.success(List<SiteModel> payload) = _Success;
}
