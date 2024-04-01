import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:next_starter/data/models/site/site_detail_mode.dart';
import 'package:next_starter/data/repositories/site_repository.dart';

part 'profile_unit_cubit.freezed.dart';
part 'profile_unit_state.dart';

@injectable
class ProfileUnitCubit extends Cubit<ProfileUnitState> {
  ProfileUnitCubit(this.repository) : super(const ProfileUnitState.initial());

  final SiteRepository repository;

  Future<void> get({required int id}) async {
    emit(const ProfileUnitState.loading());

    final response = await repository.getDetailSite(id: id);

    response.fold(
      (l) => emit(ProfileUnitState.failure(l.message)),
      (r) => emit(ProfileUnitState.success(r)),
    );
  }
}
