import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:next_starter/data/repositories/inquiry_repository.dart';

part 'inquiry_form_cubit.freezed.dart';
part 'inquiry_form_state.dart';

@injectable
class InquiryFormCubit extends Cubit<InquiryFormState> {
  InquiryFormCubit(this.repository) : super(const InquiryFormState.initial());

  final InquiryRepository repository;

}
