import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testtrello/data/api.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  TrelloApi _api = TrelloApi();
  String _token;
  bool get isLoggedIn => _token.isNotEmpty;

  AuthCubit() : super(AuthInitial());

  load(String username, String password) async {
    emit(AuthLoading());

    try {
      _token = await _api.login(
          "armada", "FSH6zBZ0p9yH"); //login(username, password);
      _api.getCards(_token);

      emit(AuthSuccess());
    } catch (e) {
      print(e);
      emit(AuthError());
    }
  }
}
