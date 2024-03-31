import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_detail_state.dart';
part 'ticket_detail_cubit.freezed.dart';

class TicketDetailCubit extends Cubit<TicketDetailState> {
  TicketDetailCubit() : super(TicketDetailState.initial());
}
