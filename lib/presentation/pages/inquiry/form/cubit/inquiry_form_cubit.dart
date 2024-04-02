import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:next_starter/data/repositories/inquiry_repository.dart';

part 'inquiry_form_cubit.freezed.dart';
part 'inquiry_form_state.dart';

@injectable
class InquiryFormCubit extends Cubit<InquiryFormState> {
  InquiryFormCubit(this.repository) : super(const InquiryFormState.initial());

  final InquiryRepository repository;

  Future<void> submitInquiry({
    required Map<String, dynamic> payload,
    required List<XFile?> image,
  }) async {
    emit(const InquiryFormState.loading());

    var body = Map.of(payload);

    for (var e in image) {
      body['photo[${image.indexOf(e)}]'] = await MultipartFile.fromFile(e!.path);
    }

    final data = FormData.fromMap(body);

    final response = await repository.submitInquiry(payload: data);

    response.fold(
      (l) => emit(InquiryFormState.failure(l.message)),
      (r) => emit(const InquiryFormState.success()),
    );
  }
}
