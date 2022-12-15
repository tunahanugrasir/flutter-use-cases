import 'package:flutter/material.dart';

import 'core/logger_mixin.dart';
import 'generic_home_detail_view.dart';

class GenericHomeView extends StatefulWidget {
  const GenericHomeView({Key? key}) : super(key: key);
  @override
  State<GenericHomeView> createState() => _GenericHomeViewState();
}

class _GenericHomeViewState extends State<GenericHomeView> with Logger {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Text('$index'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GenericHomeDetailView(id: '$index'),
                ));
              },
            ),
          );
        },
      ),
    );
  }

  @override
  final PageSpecialKeys key = PageSpecialKeys.home;

  @override
  CustomModel get model => CustomModel(description: 'This is a home view');
}
