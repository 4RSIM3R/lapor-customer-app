import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:next_starter/data/models/inquiry/inquiry_model.dart';
import 'package:next_starter/data/repositories/inquiry_repository.dart';

part 'inquiry_list_cubit.freezed.dart';
part 'inquiry_list_state.dart';

@injectable
class InquiryListCubit extends Cubit<InquiryListState> {
  InquiryListCubit(this.repository) : super(const InquiryListState.initial());

  final InquiryRepository repository;

  Future<void> getAllInquiry({String? start, String? end, String? status}) async {
    emit(const InquiryListState.loading());
    final response = await repository.getAllInquiry(start: start, end: end, status: status);
    response.fold(
      (l) => emit(InquiryListState.failure(l.message)),
      (r) => emit(InquiryListState.success(r)),
    );
  }
}
