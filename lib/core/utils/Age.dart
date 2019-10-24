class Age {
  static by(DateTime data) {
    final d = new DateTime.now();
    final anoAtual = d.year;
    final mesAtual = d.month + 1;
    final diaAtual = d.day;

    final anoAniversario = data.year;
    final mesAniversaio = data.month;
    final diaAniversario = data.day;

    var quantosAnos = anoAtual - anoAniversario;

    if (mesAtual < mesAniversaio ||
        mesAtual == mesAniversaio && diaAtual < diaAniversario) {
      quantosAnos--;
    }

    return quantosAnos < 0 ? 0 : quantosAnos;
  }
}
