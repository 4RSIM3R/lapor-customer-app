// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i7;

import 'application/auth/auth_cubit.dart' as _i35;
import 'application/bloc/pagination_bloc.dart' as _i45;
import 'common/network/network_info.dart' as _i13;
import 'common/permission/permission.dart' as _i10;
import 'common/permission/permission_impl.dart' as _i11;
import 'common/storage/shared_pref_storage.dart' as _i9;
import 'common/storage/storage.dart' as _i12;
import 'common/storage/storage_path.dart' as _i3;
import 'common/utils/image_resize.dart' as _i4;
import 'data/datasources/network/network_source.dart' as _i48;
import 'data/datasources/remote_datasources/auth_remote/auth_remote.dart'
    as _i17;
import 'data/datasources/remote_datasources/auth_remote/auth_remote_impl.dart'
    as _i18;
import 'data/datasources/remote_datasources/inquiry_remote/inquiry_remote.dart'
    as _i21;
import 'data/datasources/remote_datasources/inquiry_remote/inquiry_remote_impl.dart'
    as _i22;
import 'data/datasources/remote_datasources/post_remote/post_remote.dart'
    as _i15;
import 'data/datasources/remote_datasources/post_remote/post_remote_impl.dart'
    as _i16;
import 'data/datasources/remote_datasources/profile_remote/profile_remote.dart'
    as _i31;
import 'data/datasources/remote_datasources/profile_remote/profile_remote_impl.dart'
    as _i32;
import 'data/datasources/remote_datasources/setting_remote/setting_remote.dart'
    as _i27;
import 'data/datasources/remote_datasources/setting_remote/setting_remote_impl.dart'
    as _i28;
import 'data/datasources/remote_datasources/site_remote/site_remote.dart'
    as _i23;
import 'data/datasources/remote_datasources/site_remote/site_remote_impl.dart'
    as _i24;
import 'data/datasources/remote_datasources/ticket_remote/ticket_remote.dart'
    as _i25;
import 'data/datasources/remote_datasources/ticket_remote/ticket_remote_impl.dart'
    as _i26;
import 'data/datasources/remote_datasources/unit_remote/unit_remote.dart'
    as _i19;
import 'data/datasources/remote_datasources/unit_remote/unit_remote_impl.dart'
    as _i20;
import 'data/datasources/session/session_source.dart' as _i14;
import 'data/repositories/auth_repository.dart' as _i29;
import 'data/repositories/inquiry_repository.dart' as _i41;
import 'data/repositories/post_repository.dart' as _i38;
import 'data/repositories/profile_repository.dart' as _i37;
import 'data/repositories/setting_repository.dart' as _i34;
import 'data/repositories/site_repository.dart' as _i43;
import 'data/repositories/ticket_repository.dart' as _i30;
import 'data/repositories/unit_repository.dart' as _i33;
import 'presentation/pages/auth/login/cubit/login_cubit.dart' as _i36;
import 'presentation/pages/inquiry/form/cubit/inquiry_form_cubit.dart' as _i42;
import 'presentation/pages/profile/main/cubit/profile_main_cubit.dart' as _i44;
import 'presentation/pages/profile/site/cubit/profile_site_cubit.dart' as _i46;
import 'presentation/pages/profile/unit/cubit/profile_unit_cubit.dart' as _i47;
import 'presentation/pages/ticket/detail/cubit/ticket_detail_cubit.dart'
    as _i39;
import 'presentation/pages/ticket/list/cubit/ticket_list_cubit.dart' as _i40;
import 'presentation/routes/app_router.dart' as _i8;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final apiService = _$ApiService();
  await gh.factoryAsync<_i3.StoragePathInterface>(
    () => apiService.init(),
    preResolve: true,
  );
  gh.lazySingleton<_i4.ImageResizeUtils>(() => _i4.ImageResizeUtils());
  gh.lazySingleton<_i5.ImagePicker>(() => apiService.imagePicker);
  gh.lazySingleton<_i6.Dio>(() => apiService.dio());
  gh.lazySingleton<_i7.InternetConnection>(
      () => apiService.internetConnectionChecker());
  gh.lazySingleton<_i8.AppRouter>(() => _i8.AppRouter());
  gh.lazySingleton<_i9.SharedPrefStorageInterface>(
      () => _i9.SharedPreferenceStorage());
  gh.lazySingleton<_i10.PermissionInterface>(
      () => const _i11.KendaliPermission());
  gh.lazySingleton<_i12.StorageInterface>(() => _i12.Storage(
        permission: gh<_i10.PermissionInterface>(),
        storagePath: gh<_i3.StoragePathInterface>(),
      ));
  gh.lazySingleton<_i13.NetworkInfo>(
      () => _i13.NetworkInfoImpl(gh<_i7.InternetConnection>()));
  gh.lazySingleton<_i14.SessionSource>(
      () => _i14.SessionSource(storage: gh<_i9.SharedPrefStorageInterface>()));
  gh.lazySingleton<_i15.PostRemote>(() => _i16.PostRemoteImpl(
        gh<_i6.Dio>(),
        gh<_i14.SessionSource>(),
      ));
  gh.lazySingleton<_i17.AuthRemote>(() => _i18.AuthRemoteImpl(
        gh<_i6.Dio>(),
        gh<_i14.SessionSource>(),
      ));
  gh.lazySingleton<_i19.UnitRemote>(() => _i20.UnitRemoteImpl(
        gh<_i6.Dio>(),
        gh<_i14.SessionSource>(),
      ));
  gh.lazySingleton<_i21.InquiryRemote>(() => _i22.InquiryRemoteImpl(
        gh<_i6.Dio>(),
        gh<_i14.SessionSource>(),
      ));
  gh.lazySingleton<_i23.SiteRemote>(() => _i24.SiteRemoteImpl(
        gh<_i6.Dio>(),
        gh<_i14.SessionSource>(),
      ));
  gh.lazySingleton<_i25.TicketRemote>(() => _i26.TicketRemoteImpl(
        gh<_i6.Dio>(),
        gh<_i14.SessionSource>(),
      ));
  gh.lazySingleton<_i27.SettingRemote>(() => _i28.SettingRemoteImpl(
        gh<_i6.Dio>(),
        gh<_i14.SessionSource>(),
      ));
  gh.lazySingleton<_i29.AuthRepository>(() => _i29.AuthRepository(
        gh<_i13.NetworkInfo>(),
        gh<_i17.AuthRemote>(),
        gh<_i14.SessionSource>(),
      ));
  gh.lazySingleton<_i30.TicketRepository>(() => _i30.TicketRepository(
        gh<_i13.NetworkInfo>(),
        gh<_i25.TicketRemote>(),
      ));
  gh.lazySingleton<_i31.ProfileRemote>(() => _i32.ProfileRemoteImpl(
        gh<_i6.Dio>(),
        gh<_i14.SessionSource>(),
      ));
  gh.lazySingleton<_i33.UnitRepository>(() => _i33.UnitRepository(
        gh<_i13.NetworkInfo>(),
        gh<_i19.UnitRemote>(),
      ));
  gh.lazySingleton<_i34.SettingRepository>(() => _i34.SettingRepository(
        gh<_i13.NetworkInfo>(),
        gh<_i27.SettingRemote>(),
      ));
  gh.factory<_i35.AuthCubit>(() => _i35.AuthCubit(gh<_i29.AuthRepository>()));
  gh.factory<_i36.LoginCubit>(() => _i36.LoginCubit(gh<_i29.AuthRepository>()));
  gh.lazySingleton<_i37.ProfileRepository>(() => _i37.ProfileRepository(
        gh<_i13.NetworkInfo>(),
        gh<_i31.ProfileRemote>(),
      ));
  gh.lazySingleton<_i38.PostRepository>(() => _i38.PostRepository(
        gh<_i13.NetworkInfo>(),
        gh<_i15.PostRemote>(),
      ));
  gh.factory<_i39.TicketDetailCubit>(
      () => _i39.TicketDetailCubit(gh<_i30.TicketRepository>()));
  gh.factory<_i40.TicketListCubit>(
      () => _i40.TicketListCubit(gh<_i30.TicketRepository>()));
  gh.lazySingleton<_i41.InquiryRepository>(() => _i41.InquiryRepository(
        gh<_i13.NetworkInfo>(),
        gh<_i21.InquiryRemote>(),
      ));
  gh.factory<_i42.InquiryFormCubit>(
      () => _i42.InquiryFormCubit(gh<_i41.InquiryRepository>()));
  gh.lazySingleton<_i43.SiteRepository>(() => _i43.SiteRepository(
        gh<_i13.NetworkInfo>(),
        gh<_i23.SiteRemote>(),
      ));
  gh.factory<_i44.ProfileMainCubit>(
      () => _i44.ProfileMainCubit(gh<_i37.ProfileRepository>()));
  gh.factory<_i45.PaginationBloc>(
      () => _i45.PaginationBloc(gh<_i38.PostRepository>()));
  gh.factory<_i46.ProfileSiteCubit>(
      () => _i46.ProfileSiteCubit(gh<_i43.SiteRepository>()));
  gh.factory<_i47.ProfileUnitCubit>(
      () => _i47.ProfileUnitCubit(gh<_i43.SiteRepository>()));
  return getIt;
}

class _$ApiService extends _i48.ApiService {}
