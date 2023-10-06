class DeckModel {
  String? deckId;
  bool? shuffled;
  int? remaining;

  DeckModel({this.deckId, this.shuffled, this.remaining});

  DeckModel.fromJson(Map<String, dynamic> json) {
    deckId = json['deck_id'];
    shuffled = json['shuffled'];
    remaining = json['remaining'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['deck_id'] = deckId;
    data['shuffled'] = shuffled;
    data['remaining'] = remaining;
    return data;
  }
}
