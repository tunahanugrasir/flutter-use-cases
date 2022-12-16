import '../filter_view.dart';

enum Cities {
  istanbul('İstanbul'),
  izmir('İzmir'),
  ankara('Ankara');

  final String uniqueName;
  const Cities(this.uniqueName);

  static List<String> get names => Cities.values.map((e) => e.uniqueName).toList();

  static List<City> get cities => Cities.values.map((e) => City(e)).toList();
}

class City extends IFilter {
  final Cities city;

  City(this.city);

  @override
  int get id => city.index;

  @override
  String get key => city.uniqueName;
}
