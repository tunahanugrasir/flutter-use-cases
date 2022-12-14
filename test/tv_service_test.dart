import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_use_cases/use_case/cancelable_auto_complete/model/tv_show_model.dart';
import 'package:flutter_use_cases/use_case/cancelable_auto_complete/service/tv_service.dart';
import 'package:vexana/vexana.dart';

void main() {
  late ITvService tvService;
  setUp(() {
    tvService = TvService(
      networkManager: NetworkManager<INetworkModel<TvShowModel>>(
        options: BaseOptions(
          baseUrl: 'https://api.tvmaze.com/',
        ),
        isEnableLogger: true,
      ),
    );
  });
  test('Fetch kids Show', () async {
    final response = await tvService.fetchItems('kids');
    expect(response, isNotNull);
  });
}
