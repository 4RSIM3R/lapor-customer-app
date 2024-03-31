part of 'inquiry_form_cubit.dart';

@freezed
class InquiryFormState with _$InquiryFormState {
  const factory InquiryFormState.initial() = _Initial;
  const factory InquiryFormState.loadig() = _Loading;
  const factory InquiryFormState.failure(String message) = _Failure;
  const factory InquiryFormState.success() = _Success;
}
