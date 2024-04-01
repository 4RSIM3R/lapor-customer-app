import 'package:dio/dio.dart';
import 'package:next_starter/data/models/inquiry/inquiry_model.dart';

abstract class InquiryRemote {
  Future<List<InquiryModel>> getAllInquiry({required Map<String, dynamic> params});
  Future<bool> submitInquiry({required FormData payload});
}
