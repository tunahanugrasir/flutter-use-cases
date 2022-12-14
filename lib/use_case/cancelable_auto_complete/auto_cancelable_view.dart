import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import 'durations.dart';
import 'model/tv_show_model.dart';
import 'service/tv_service.dart';

class AutoCancelableView extends StatefulWidget {
  const AutoCancelableView({Key? key}) : super(key: key);
  @override
  State<AutoCancelableView> createState() => _AutoCancelableViewState();
}

class _AutoCancelableViewState extends State<AutoCancelableView> with _AutoCancel {
  @override
  void initState() {
    super.initState();
    tvService = TvService(
      networkManager: NetworkManager<INetworkModel<TvShowModel>>(
        options: BaseOptions(
          baseUrl: 'https://api.tvmaze.com/',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Autocomplete<TvShowModel>(
        displayStringForOption: (option) {
          return option.show?.name ?? '';
        },
        optionsBuilder: (textEditingValue) async {
          return await search(textEditingValue.text);
        },
      ),
    );
  }
}

mixin _AutoCancel on State<AutoCancelableView> {
  late final ITvService tvService;

  CancelableOperation<void>? _cancelableOperation;
  Future<List<TvShowModel>> search(String key) async {
    _cancelableOperation?.cancel();
    _cancelableOperation = CancelableOperation.fromFuture(
      Future.delayed(Durations.low.value),
    );

    List<TvShowModel> items = [];
    await _cancelableOperation?.value.then((result) async {
      items = await tvService.fetchItems(key) ?? [];
    });
    return items;
  }
}
