part of 'ticket_list_cubit.dart';

@freezed
class TicketListState with _$TicketListState {
  const factory TicketListState.initial() = _Initial;
  const factory TicketListState.loading() = _Loading;
  const factory TicketListState.failure(String message) = _Failure;
  const factory TicketListState.success(List<TicketModel> payload) = _Success;
}
