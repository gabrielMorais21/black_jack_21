class CardTableMock {
  Map<String, dynamic> shuffleTheCardsSuccess() {
    return {
      "success": true,
      "deck_id": "3p40paa87x90",
      "shuffled": true,
      "remaining": 52,
    };
  }

  Map<String, dynamic> shuffleTheCardsFail() {
    return {"success": false, "error": "The max number of Decks is 20."};
  }

  Map<String, dynamic> reshuffleTheCardsSuccess() {
    return {
      "success": true,
      "deck_id": "3p40paa87x90",
      "shuffled": true,
      "remaining": 52,
    };
  }

  Map<String, dynamic> reshuffleTheCardsFail() {
    return {"success": false, "error": "Deck ID does not exist."};
  }

  Map<String, dynamic> drawCardSuccess() {
    return {
      "success": true,
      "deck_id": "kxozasf3edqu",
      "cards": [
        {
          "code": "6H",
          "image": "https://deckofcardsapi.com/static/img/6H.png",
          "images": {"svg": "https://deckofcardsapi.com/static/img/6H.svg", "png": "https://deckofcardsapi.com/static/img/6H.png"},
          "value": "6",
          "suit": "HEARTS"
        },
        {
          "code": "5S",
          "image": "https://deckofcardsapi.com/static/img/5S.png",
          "images": {"svg": "https://deckofcardsapi.com/static/img/5S.svg", "png": "https://deckofcardsapi.com/static/img/5S.png"},
          "value": "5",
          "suit": "SPADES"
        }
      ],
      "remaining": 50
    };
  }

  Map<String, dynamic> drawCardFail() {
    return {
      "success": false,
      "error": "Deck ID does not exist.",
    };
  }
}
