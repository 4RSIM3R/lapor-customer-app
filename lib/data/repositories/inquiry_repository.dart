import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_repository.dart';
import 'package:next_starter/common/typedefs/typedefs.dart';
import 'package:next_starter/data/datasources/remote_datasources/inquiry_remote/inquiry_remote.dart';
import 'package:next_starter/data/models/inquiry/inquiry_model.dart';

@LazySingleton()
class InquiryRepository extends BaseRepository {
  final InquiryRemote remote;

  InquiryRepository(super.networkInfo, this.remote);

  EitherResponse<List<InquiryModel>> getAllInquiry({String? start, String? end, String? status}) {
    var params = {'start': start, 'end': end, 'status': status};
    params.removeWhere((key, value) => value == null);
    return handleNetworkCall(
      call: remote.getAllInquiry(params: params),
      onSuccess: (r) => r,
    );
  }

  EitherResponse<bool> submitInquiry({required FormData payload}) {
    return handleNetworkCall(
      call: remote.submitInquiry(payload: payload),
      onSuccess: (r) => r,
    );
  }
}
