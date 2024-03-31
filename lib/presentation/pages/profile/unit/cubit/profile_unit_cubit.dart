import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_unit_state.dart';
part 'profile_unit_cubit.freezed.dart';

class ProfileUnitCubit extends Cubit<ProfileUnitState> {
  ProfileUnitCubit() : super(ProfileUnitState.initial());
}
