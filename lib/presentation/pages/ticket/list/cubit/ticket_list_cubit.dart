import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:next_starter/data/models/ticket/ticket_model.dart';
import 'package:next_starter/data/repositories/ticket_repository.dart';
import 'package:next_starter/presentation/utils/date.dart';

part 'ticket_list_cubit.freezed.dart';
part 'ticket_list_state.dart';

@injectable
class TicketListCubit extends Cubit<TicketListState> {
  TicketListCubit(this.repository) : super(const TicketListState.initial());

  final TicketRepository repository;

  Future<void> get({String? start, String? end}) async {
    emit(const TicketListState.loading());

    final response = await repository.getAllTicket(start: start, end: end);

    response.fold(
      (l) => emit(TicketListState.failure(l.message)),
      (r) => emit(TicketListState.success(r)),
    );
  }

  Future<void> update({required id, required status}) async {
    emit(const TicketListState.loading());

    final response = await repository.updateTicket(id: id, status: status);

    var start = DateTime(DateTime.now().year, DateTime.now().month, 1);
    var end = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

    response.fold(
      (l) => emit(TicketListState.failure(l.message)),
      (r) => get(start: toMysqlDate(start), end: toMysqlDate(end)),
    );
  }
}
