import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/common/utils/api_path.dart';
import 'package:next_starter/data/datasources/remote_datasources/inquiry_remote/inquiry_remote.dart';
import 'package:next_starter/data/models/inquiry/inquiry_model.dart';

@LazySingleton(as: InquiryRemote)
class InquiryRemoteImpl extends BaseDioRemoteSource implements InquiryRemote {
  InquiryRemoteImpl(super.dio, super.session);

  @override
  Future<List<InquiryModel>> getAllInquiry({required Map<String, dynamic> params}) {
    return networkRequest(
      isAuth: true,
      request: (dio) => dio.get(ApiPath.inquiry, queryParameters: params),
      onResponse: (json) => (json['data'] as List).map((e) => InquiryModel.fromJson(e)).toList(),
    );
  }

  @override
  Future<bool> submitInquiry({required FormData payload}) {
    return networkRequest(
      isAuth: true,
      request: (dio) => dio.post(ApiPath.inquiryCreate, data: payload),
      onResponse: (json) => true,
    );
  }
}
