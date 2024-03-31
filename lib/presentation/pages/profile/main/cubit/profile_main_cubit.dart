import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_main_state.dart';
part 'profile_main_cubit.freezed.dart';

class ProfileMainCubit extends Cubit<ProfileMainState> {
  ProfileMainCubit() : super(ProfileMainState.initial());
}
