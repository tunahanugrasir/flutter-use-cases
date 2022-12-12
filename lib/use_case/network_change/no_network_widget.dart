import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'network_change_manager.dart';

class NoNetworkWidget extends StatefulWidget {
  const NoNetworkWidget({super.key});

  @override
  State<NoNetworkWidget> createState() => _NoNetworkWidgetState();
}

class _NoNetworkWidgetState extends State<NoNetworkWidget> {
  late final INetworkChangeManager _networkChange;
  NetworkResult? _networkResult;

  @override
  void initState() {
    super.initState();
    _networkChange = NetworkChangeManager();
    fetchFirstResult();
    _networkChange.handleNetworkChange((result) {
      _updateView(result);
    });
  }

  Future<void> fetchFirstResult() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final result = _networkResult = await _networkChange.checkNetworkFirstTime();
      _updateView(result);
    });
  }

  void _updateView(NetworkResult result) {
    setState(() {
      _networkResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: Container(
          height: 50,
          color: Colors.black,
        ),
        secondChild: const SizedBox(),
        crossFadeState: _networkResult == NetworkResult.off ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: context.durationLow);
  }
}
