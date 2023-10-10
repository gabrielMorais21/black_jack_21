enum GameResults {
  win("Você hanhou"),
  loss("Você perdeu"),
  draw("Empata");

  const GameResults(this.value);
  final String value;
}