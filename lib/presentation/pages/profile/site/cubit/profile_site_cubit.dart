import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:next_starter/data/models/site/site_model.dart';
import 'package:next_starter/data/repositories/site_repository.dart';

part 'profile_site_cubit.freezed.dart';
part 'profile_site_state.dart';

@injectable
class ProfileSiteCubit extends Cubit<ProfileSiteState> {
  ProfileSiteCubit(this.repository) : super(const ProfileSiteState.initial());

  final SiteRepository repository;

  Future<void> get() async {
    emit(const ProfileSiteState.loading());

    final response = await repository.getAllSite();

    response.fold(
      (l) => emit(ProfileSiteState.failure(l.message)),
      (r) => emit(ProfileSiteState.success(r)),
    );
  }
}
