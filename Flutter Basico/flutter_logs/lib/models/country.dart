class Country {
  final String name;
  final String alpha3Code;
  final String capital;
  final String flag;

  Country(
      {required this.name,
      required this.alpha3Code,
      required this.capital,
      required this.flag});

  static Country empty() => Country(
      name: '',
      alpha3Code: '',
      capital: '',
      flag: 'https://via.placeholder.com/150');

  static Country fromJson(Map json) {
    return Country(
      name: json['name'],
      flag: json['flag'],
      alpha3Code: json['alpha3Code'],
      capital: json['capital'],
    );
  }

  @override
  String toString() {
    return 'Instance of Country: $name';
  }
}
