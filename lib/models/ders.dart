class Ders {
  final String ad;
  final double not;
  final int kredi;

  const Ders({required this.ad, required this.kredi, required this.not});

  @override
  String toString() {
    return "Ad: $ad - Not: $not - Kredi: $kredi";
  }
}
