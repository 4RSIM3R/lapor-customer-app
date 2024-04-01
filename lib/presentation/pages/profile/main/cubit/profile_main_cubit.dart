import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:next_starter/data/models/profile/profile_model.dart';
import 'package:next_starter/data/repositories/profile_repository.dart';

part 'profile_main_cubit.freezed.dart';
part 'profile_main_state.dart';

@injectable
class ProfileMainCubit extends Cubit<ProfileMainState> {
  ProfileMainCubit(this.repository) : super(const ProfileMainState.initial());

  final ProfileRepository repository;

  Future<void> get() async {
    emit(const ProfileMainState.loading());
    final response = await repository.getProfile();
    response.fold(
      (l) => emit(ProfileMainState.failure(l.message)),
      (r) => emit(ProfileMainState.succcess(r)),
    );
  }
}
