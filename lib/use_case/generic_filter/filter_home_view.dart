import 'package:flutter/material.dart';

import 'filter_view.dart';
import 'mixin/show_sheet_mixin.dart';
import 'model/city_model.dart';

class FilterHomeView extends StatefulWidget {
  const FilterHomeView({Key? key}) : super(key: key);
  @override
  State<FilterHomeView> createState() => _FilterHomeViewState();
}

class _FilterHomeViewState extends State<FilterHomeView> {
  final List<City> _cities = Cities.cities;

  String _name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_name),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await ShowSheetMixin.showCustomBottomSheet(
            context: context,
            child: FilterView<City>(values: Cities.cities),
          );
          if (result == null) return;
          setState(() {
            _name = result.key;
          });
        },
      ),
    );
  }
}
