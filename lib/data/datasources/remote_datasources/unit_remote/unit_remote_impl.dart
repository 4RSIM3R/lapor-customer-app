import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/data/datasources/remote_datasources/unit_remote/unit_remote.dart';

@LazySingleton(as: UnitRemote)
class UnitRemoteImpl extends BaseDioRemoteSource implements UnitRemote {
  UnitRemoteImpl(super.dio, super.session);
}
