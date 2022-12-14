import 'package:vexana/vexana.dart';

import '../model/tv_show_model.dart';

abstract class ITvService {
  ITvService({required INetworkManager networkManager}) : _manager = networkManager;

  Future<List<TvShowModel>?> fetchItems(String key);
  final INetworkManager _manager;
}

class TvService extends ITvService {
  TvService({required super.networkManager});

  @override
  Future<List<TvShowModel>?> fetchItems(String key) async {
    final response = await _manager.send<TvShowModel, List<TvShowModel>>(
      _TvServicePath.search.withDivider,
      urlSuffix: _TvServicePath.shows.withDivider,
      queryParameters: Map.fromEntries([_Queries.q.value(key)]),
      parseModel: TvShowModel(),
      method: RequestType.GET,
    );
    return response.data;
  }
}
//https://api.tvmaze.com/search/shows?q=men

enum _TvServicePath {
  search,
  shows;

  String get withDivider => '/$name';
}

enum _Queries {
  q;

  MapEntry<String, String> value(String value) {
    return MapEntry(name, value);
  }
}
