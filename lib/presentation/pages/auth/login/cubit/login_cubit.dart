import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:next_starter/data/repositories/auth_repository.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repository) : super(const LoginState.initial());

  final AuthRepository repository;

  Future<void> login({required String email, required String password}) async {
    emit(const LoginState.loading());

    final response = await repository.login({'email': email, 'password': password});

    response.fold(
      (l) => emit(LoginState.failure(l.message)),
      (r) => emit(const LoginState.success()),
    );
  }
}
