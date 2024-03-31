import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/data/datasources/remote_datasources/inquiry_remote/inquiry_remote.dart';

@LazySingleton(as: InquiryRemote)
class InquiryRemoteImpl extends BaseDioRemoteSource implements InquiryRemote {
  InquiryRemoteImpl(super.dio, super.session);
  
}