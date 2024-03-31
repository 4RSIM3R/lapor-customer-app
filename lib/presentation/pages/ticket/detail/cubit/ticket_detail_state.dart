part of 'ticket_detail_cubit.dart';

@freezed
class TicketDetailState with _$TicketDetailState {
  const factory TicketDetailState.initial() = _Initial;
  const factory TicketDetailState.loading() = _Loading;
  const factory TicketDetailState.failure(String message) = _Failure;
  const factory TicketDetailState.success(TicketDetailModel payload) = _Success;
}
