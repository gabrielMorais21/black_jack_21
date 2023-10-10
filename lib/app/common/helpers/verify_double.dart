  bool isDouble(String texto) {
    try {
      double.parse(texto);
      return true;
    } catch (e) {
      return false;
    }
  }