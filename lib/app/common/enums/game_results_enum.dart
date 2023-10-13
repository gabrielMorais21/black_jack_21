enum GameResults {
  win("Você Ganhou"),
  loss("Você Perdeu"),
  draw("Empate");

  const GameResults(this.value);
  final String value;
}
