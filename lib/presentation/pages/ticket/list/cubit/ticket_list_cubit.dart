import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_list_state.dart';
part 'ticket_list_cubit.freezed.dart';

class TicketListCubit extends Cubit<TicketListState> {
  TicketListCubit() : super(TicketListState.initial());
}
