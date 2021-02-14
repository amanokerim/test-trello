import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:testtrello/data/api.dart';
import 'package:testtrello/data/models/trello_card.dart';

part 'trello_state.dart';

class TrelloCubit extends Cubit<TrelloState> {
  TrelloApi _api = TrelloApi();
  String _token;
  bool get isLoggedIn => _token.isNotEmpty;

  TrelloCubit() : super(TrelloLogin());

  login(String username, String password) async {
    emit(TrelloLoading());

    try {
      _token = await _api.login(username, password);
      List<TrelloCard> res = await _api.getCards(_token);

      List<List<TrelloCard>> cards = [];
      for (int tab = 0; tab < 4; tab++)
        cards.add(res.where((card) => card.row == tab).toList());
      emit(TrelloShowCards(0, cards));
    } catch (e) {
      emit(TrelloLoginError(e.toString()));
    }
  }

  logout() {
    _token = "";
    emit(TrelloLogin());
  }
}
