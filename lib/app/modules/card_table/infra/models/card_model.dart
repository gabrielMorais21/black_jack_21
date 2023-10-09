class CardModel {
  String? deckId;
  List<Cards>? cards;
  int? remaining;

  CardModel({this.deckId, this.cards, this.remaining});

  CardModel.fromJson(Map<String, dynamic> json) {
    deckId = json['deck_id'];
    if (json['cards'] != null) {
      cards = <Cards>[];
      json['cards'].forEach((v) {
        cards!.add(Cards.fromJson(v));
      });
    }
    remaining = json['remaining'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['deck_id'] = deckId;
    if (cards != null) {
      data['cards'] = cards!.map((v) => v.toJson()).toList();
    }
    data['remaining'] = remaining;
    return data;
  }
}

class Cards {
  String? code;
  String? image;
  Images? images;
  String? value;
  String? suit;

  Cards({this.code, this.image, this.images, this.value, this.suit});

  Cards.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    image = json['image'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    value = json['value'];
    suit = json['suit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['code'] = code;
    data['image'] = image;
    if (images != null) {
      data['images'] = images!.toJson();
    }
    data['value'] = value;
    data['suit'] = suit;
    return data;
  }
}

class Images {
  String? svg;
  String? png;

  Images({this.svg, this.png});

  Images.fromJson(Map<String, dynamic> json) {
    svg = json['svg'];
    png = json['png'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['svg'] = svg;
    data['png'] = png;
    return data;
  }
}
