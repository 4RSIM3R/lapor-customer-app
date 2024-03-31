import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/data/datasources/remote_datasources/site_remote/site_remote.dart';

@LazySingleton(as: SiteRemote)
class SiteRemoteImpl extends BaseDioRemoteSource implements SiteRemote {
  SiteRemoteImpl(super.dio, super.session);
  
}