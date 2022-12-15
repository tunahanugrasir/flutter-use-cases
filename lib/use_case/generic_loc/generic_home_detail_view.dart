import 'package:flutter/material.dart';

import 'core/logger_mixin.dart';

class GenericHomeDetailView extends StatefulWidget {
  final String id;
  const GenericHomeDetailView({Key? key, required this.id}) : super(key: key);
  @override
  State<GenericHomeDetailView> createState() => _GenericHomeDetailViewState();
}

class _GenericHomeDetailViewState extends State<GenericHomeDetailView> with Logger {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(widget.id)),
    );
  }

  @override
  PageSpecialKeys get key => PageSpecialKeys.detail;

  @override
  CustomModel get model => CustomModel(id: widget.id, description: 'This is a Home Detail View');
}
