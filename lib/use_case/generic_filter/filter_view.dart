import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

abstract class IFilter {
  String get key;
  int get id;
}

class FilterView<T extends IFilter> extends StatefulWidget {
  final List<T> _values;
  const FilterView({
    Key? key,
    required List<T> values,
  })  : _values = values,
        super(key: key);

  @override
  State<FilterView> createState() => _FilterViewState<T>();
}

class _FilterViewState<T> extends State<FilterView> {
  late final List<IFilter> _cities;
  List<IFilter> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _cities = widget._values;
    _filteredItems = widget._values;
  }

  void _findItems(String value) {
    setState(() {
      _filteredItems = _cities
          .where(
            (element) => element.key.toLowerCase().contains(
                  value.toLowerCase(),
                ),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(onChanged: _findItems),
        Expanded(
          child: ListView.builder(
            itemCount: _cities.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  context.pop(_filteredItems[index]);
                },
                leading: Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
                title: Text(_filteredItems[index].key),
              );
            },
          ),
        )
      ],
    );
  }
}
