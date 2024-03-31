import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_repository.dart';
import 'package:next_starter/data/datasources/remote_datasources/inquiry_remote/inquiry_remote.dart';

@LazySingleton()
class InquiryRepository extends BaseRepository {
  final InquiryRemote remote;

  InquiryRepository(super.networkInfo, this.remote);
}
