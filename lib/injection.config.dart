// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i7;

import 'application/auth/auth_cubit.dart' as _i40;
import 'application/bloc/pagination_bloc.dart' as _i42;
import 'common/network/network_info.dart' as _i8;
import 'common/permission/permission.dart' as _i9;
import 'common/permission/permission_impl.dart' as _i10;
import 'common/storage/shared_pref_storage.dart' as _i11;
import 'common/storage/storage.dart' as _i20;
import 'common/storage/storage_path.dart' as _i12;
import 'common/utils/image_resize.dart' as _i6;
import 'data/datasources/network/network_source.dart' as _i43;
import 'data/datasources/remote_datasources/auth_remote/auth_remote.dart'
    as _i27;
import 'data/datasources/remote_datasources/auth_remote/auth_remote_impl.dart'
    as _i28;
import 'data/datasources/remote_datasources/inquiry_remote/inquiry_remote.dart'
    as _i30;
import 'data/datasources/remote_datasources/inquiry_remote/inquiry_remote_impl.dart'
    as _i31;
import 'data/datasources/remote_datasources/post_remote/post_remote.dart'
    as _i34;
import 'data/datasources/remote_datasources/post_remote/post_remote_impl.dart'
    as _i35;
import 'data/datasources/remote_datasources/profile_remote/profile_remote.dart'
    as _i37;
import 'data/datasources/remote_datasources/profile_remote/profile_remote_impl.dart'
    as _i38;
import 'data/datasources/remote_datasources/setting_remote/setting_remote.dart'
    as _i14;
import 'data/datasources/remote_datasources/setting_remote/setting_remote_impl.dart'
    as _i15;
import 'data/datasources/remote_datasources/site_remote/site_remote.dart'
    as _i17;
import 'data/datasources/remote_datasources/site_remote/site_remote_impl.dart'
    as _i18;
import 'data/datasources/remote_datasources/ticket_remote/ticket_remote.dart'
    as _i21;
import 'data/datasources/remote_datasources/ticket_remote/ticket_remote_impl.dart'
    as _i22;
import 'data/datasources/remote_datasources/unit_remote/unit_remote.dart'
    as _i24;
import 'data/datasources/remote_datasources/unit_remote/unit_remote_impl.dart'
    as _i25;
import 'data/datasources/session/session_source.dart' as _i13;
import 'data/repositories/auth_repository.dart' as _i29;
import 'data/repositories/inquiry_repository.dart' as _i32;
import 'data/repositories/post_repository.dart' as _i36;
import 'data/repositories/profile_repository.dart' as _i39;
import 'data/repositories/setting_repository.dart' as _i16;
import 'data/repositories/site_repository.dart' as _i19;
import 'data/repositories/ticket_repository.dart' as _i23;
import 'data/repositories/unit_repository.dart' as _i26;
import 'presentation/pages/auth/login/cubit/login_cubit.dart' as _i33;
import 'presentation/pages/inquiry/form/cubit/inquiry_form_cubit.dart' as _i41;
import 'presentation/routes/app_router.dart' as _i3;

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
  gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
  gh.lazySingleton<_i4.Dio>(() => apiService.dio());
  gh.lazySingleton<_i5.ImagePicker>(() => apiService.imagePicker);
  gh.lazySingleton<_i6.ImageResizeUtils>(() => _i6.ImageResizeUtils());
  gh.lazySingleton<_i7.InternetConnection>(
      () => apiService.internetConnectionChecker());
  gh.lazySingleton<_i8.NetworkInfo>(
      () => _i8.NetworkInfoImpl(gh<_i7.InternetConnection>()));
  gh.lazySingleton<_i9.PermissionInterface>(
      () => const _i10.KendaliPermission());
  gh.lazySingleton<_i11.SharedPrefStorageInterface>(
      () => _i11.SharedPreferenceStorage());
  await gh.factoryAsync<_i12.StoragePathInterface>(
    () => apiService.init(),
    preResolve: true,
  );
  gh.lazySingleton<_i13.SessionSource>(
      () => _i13.SessionSource(storage: gh<_i11.SharedPrefStorageInterface>()));
  gh.lazySingleton<_i14.SettingRemote>(() => _i15.SettingRemoteImpl(
        gh<_i4.Dio>(),
        gh<_i13.SessionSource>(),
      ));
  gh.lazySingleton<_i16.SettingRepository>(() => _i16.SettingRepository(
        gh<_i8.NetworkInfo>(),
        gh<_i14.SettingRemote>(),
      ));
  gh.lazySingleton<_i17.SiteRemote>(() => _i18.SiteRemoteImpl(
        gh<_i4.Dio>(),
        gh<_i13.SessionSource>(),
      ));
  gh.lazySingleton<_i19.SiteRepository>(() => _i19.SiteRepository(
        gh<_i8.NetworkInfo>(),
        gh<_i17.SiteRemote>(),
      ));
  gh.lazySingleton<_i20.StorageInterface>(() => _i20.Storage(
        permission: gh<_i9.PermissionInterface>(),
        storagePath: gh<_i12.StoragePathInterface>(),
      ));
  gh.lazySingleton<_i21.TicketRemote>(() => _i22.TicketRemoteImpl(
        gh<_i4.Dio>(),
        gh<_i13.SessionSource>(),
      ));
  gh.lazySingleton<_i23.TicketRepository>(() => _i23.TicketRepository(
        gh<_i8.NetworkInfo>(),
        gh<_i21.TicketRemote>(),
      ));
  gh.lazySingleton<_i24.UnitRemote>(() => _i25.UnitRemoteImpl(
        gh<_i4.Dio>(),
        gh<_i13.SessionSource>(),
      ));
  gh.lazySingleton<_i26.UnitRepository>(() => _i26.UnitRepository(
        gh<_i8.NetworkInfo>(),
        gh<_i24.UnitRemote>(),
      ));
  gh.lazySingleton<_i27.AuthRemote>(() => _i28.AuthRemoteImpl(
        gh<_i4.Dio>(),
        gh<_i13.SessionSource>(),
      ));
  gh.lazySingleton<_i29.AuthRepository>(() => _i29.AuthRepository(
        gh<_i8.NetworkInfo>(),
        gh<_i27.AuthRemote>(),
        gh<_i13.SessionSource>(),
      ));
  gh.lazySingleton<_i30.InquiryRemote>(() => _i31.InquiryRemoteImpl(
        gh<_i4.Dio>(),
        gh<_i13.SessionSource>(),
      ));
  gh.lazySingleton<_i32.InquiryRepository>(() => _i32.InquiryRepository(
        gh<_i8.NetworkInfo>(),
        gh<_i30.InquiryRemote>(),
      ));
  gh.factory<_i33.LoginCubit>(() => _i33.LoginCubit(gh<_i29.AuthRepository>()));
  gh.lazySingleton<_i34.PostRemote>(() => _i35.PostRemoteImpl(
        gh<_i4.Dio>(),
        gh<_i13.SessionSource>(),
      ));
  gh.lazySingleton<_i36.PostRepository>(() => _i36.PostRepository(
        gh<_i8.NetworkInfo>(),
        gh<_i34.PostRemote>(),
      ));
  gh.lazySingleton<_i37.ProfileRemote>(() => _i38.ProfileRemoteImpl(
        gh<_i4.Dio>(),
        gh<_i13.SessionSource>(),
      ));
  gh.lazySingleton<_i39.ProfileRepository>(() => _i39.ProfileRepository(
        gh<_i8.NetworkInfo>(),
        gh<_i37.ProfileRemote>(),
      ));
  gh.factory<_i40.AuthCubit>(() => _i40.AuthCubit(gh<_i29.AuthRepository>()));
  gh.factory<_i41.InquiryFormCubit>(
      () => _i41.InquiryFormCubit(gh<_i32.InquiryRepository>()));
  gh.factory<_i42.PaginationBloc>(
      () => _i42.PaginationBloc(gh<_i36.PostRepository>()));
  return getIt;
}

class _$ApiService extends _i43.ApiService {}
