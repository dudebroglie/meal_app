import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;

  bool _vegetarian = false;

  bool _vegan = false;

  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String text,
    String description,
    bool currValue,
    void Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(text),
      value: currValue,
      subtitle: Text(description),
      onChanged: (newValue) {
        setState(() {
          currValue = newValue;
        });
        updateValue(newValue);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Section',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                'Gluten-Free',
                'Only Include Gluten-Free Meals.',
                _glutenFree,
                (newvalue) {
                  _glutenFree = newvalue;
                },
              ),
              _buildSwitchListTile(
                'Lactose-Free',
                'Only Include Lactose-Free Meals.',
                _lactoseFree,
                (newvalue) {
                  _lactoseFree = newvalue;
                },
              ),
              _buildSwitchListTile(
                'Vegetarian',
                'Only Include vegetarian Meals.',
                _vegetarian,
                (newvalue) {
                  _vegetarian = newvalue;
                },
              ),
              _buildSwitchListTile(
                'Vegan',
                'Only Include Vegan Meals.',
                _vegan,
                (newvalue) {
                  _vegan = newvalue;
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
