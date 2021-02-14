class Card {
  final int id;
  final int row;
  final int seqNum;
  final String text;

  Card({this.id, this.row, this.seqNum, this.text});

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      id: json["id"],
      row: json["row"],
      seqNum: json["seq_num"],
      text: json["text"],
    );
  }
}
