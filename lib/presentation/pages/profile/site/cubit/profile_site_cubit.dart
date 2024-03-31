import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_site_state.dart';
part 'profile_site_cubit.freezed.dart';

class ProfileSiteCubit extends Cubit<ProfileSiteState> {
  ProfileSiteCubit() : super(ProfileSiteState.initial());
}
