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
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  initState(){
    bool _glutenFree = widget.currentFilters['gluten'];
    bool _lactoseFree = widget.currentFilters['lactos'];
    bool _vegetarian = widget.currentFilters['vegetarian'];
    bool _vegan = widget.currentFilters['vegan'];

    super.initState();
  }


  Widget builtSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Filters"), actions: [
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () {
            final Map<String, bool>selectedFilters = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            };
            widget.saveFilters(selectedFilters);
          },

            ),
            ],),
            body: Column(
            children: [
            Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjast your meal selection.",
            style: Theme.of(context).textTheme.title),
            ),
            Expanded(
            child: ListView(
            children: [
            builtSwitchListTile(
            'Glutent-free',
            'Only include gluten-free meal',
            _glutenFree,
            (newValue) {
            setState(() {
            _glutenFree = newValue;
            });
            }),
            builtSwitchListTile(
            'lactose-free',
            'Only include lactose-free meal',
                _lactoseFree,
                        (newValue) {
                      setState(() {
                        _lactoseFree  = newValue;
                      });
                    }),
                builtSwitchListTile(
                    'Vegaterian',
                    'Only include Vegaterian meal',
                    _vegetarian,
                        (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                builtSwitchListTile(
                    'Vegan',
                    'Only include Vegan meal',
                    _vegan,
                        (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
