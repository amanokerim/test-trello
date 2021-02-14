part of 'auth_cubit.dart';

abstract class TrelloState extends Equatable {
  const TrelloState();

  @override
  List<Object> get props => [];
}

class TrelloLogin extends TrelloState {}

class TrelloLoginError extends TrelloState {
  // final String errorText;
}

class TrelloLoading extends TrelloState {}

class TrelloShowCards extends TrelloState {
  final List<List<TrelloCard>> cards;
  final int row;
  TrelloShowCards(this.row, this.cards);
}
