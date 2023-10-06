class ApiRoutes {
  static const String getShuffleCards = 'https://www.deckofcardsapi.com/api/deck/new/shuffle/?deck_count=<<count>>';
  static const String postDrawCard = 'https://www.deckofcardsapi.com/api/deck/<<deck_id>>/draw/?count=<<count>>';
  static const String getReshuffleCards = 'https://www.deckofcardsapi.com/api/deck/<<deck_id>>/shuffle/?remaining=true';
  static const String getNewDeck = 'https://www.deckofcardsapi.com/api/deck/new/';
}
