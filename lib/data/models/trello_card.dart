class TrelloCard {
  final int id;
  final int row;
  final int seqNum;
  final String text;

  TrelloCard({this.id, this.row, this.seqNum, this.text});

  factory TrelloCard.fromJson(Map<String, dynamic> json) {
    return TrelloCard(
      id: json["id"],
      row: int.parse(json["row"]),
      seqNum: json["seq_num"],
      text: json["text"],
    );
  }
}
