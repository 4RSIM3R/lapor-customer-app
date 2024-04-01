part of 'inquiry_list_cubit.dart';

@freezed
class InquiryListState with _$InquiryListState {
  const factory InquiryListState.initial() = _Initial;
  const factory InquiryListState.loading() = _Loading;
  const factory InquiryListState.failure(String message) = _Failure;
  const factory InquiryListState.success(List<InquiryModel> payload) = _Success;
}
