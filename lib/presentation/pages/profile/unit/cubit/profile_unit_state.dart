part of 'profile_unit_cubit.dart';

@freezed
class ProfileUnitState with _$ProfileUnitState {
  const factory ProfileUnitState.initial() = _Initial;
  const factory ProfileUnitState.loading() = _Loading;
  const factory ProfileUnitState.failure(String message) = _Failure;
  const factory ProfileUnitState.success(SiteDetailModel payload) = _Success;
}
