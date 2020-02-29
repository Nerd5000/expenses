import 'package:expenses/services/budget.dart';
import 'package:expenses/services/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _budgetFormKey = GlobalKey<FormState>();
  final _addFormKey = GlobalKey<FormState>();
  double _cutBudget;
  String _cutBudgetTitle;
  double _budgetNum;
  @override
  Widget build(BuildContext context) {
    final _budget = Provider.of<Budget>(context);
    final _widgets = Provider.of<WidgetsList>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Form(
                        key: _budgetFormKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  suffixText: 'EGP',
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 2.0,
                                  ),
                                  icon: Icon(Icons.monetization_on),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0xffff7c54,
                                      ),
                                    ),
                                  ),
                                  hintText: 'Cash',
                                ),
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  _budgetNum = double.parse(value ?? 0);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlatButton(
                                child: Text('Add'),
                                color: Color(0xffff7c54),
                                onPressed: () {
                                  _budget.setBudget(_budgetNum);
                                  if (_budgetFormKey.currentState.validate()) {
                                    _budgetFormKey.currentState.save();
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: new BoxDecoration(
                  color: Color(0xffff7c54),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Money',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      _budget.getBudget.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: _widgets.isEmpty
                ? Center(
                    child: Text('Nothing YET!!!'),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: _widgets.getlist,
                    ),
                  ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 8.0,
              ),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 10.0,
                ),
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
                color: Colors.red,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Form(
                          key: _addFormKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    suffixText: 'EGP',
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 2.0,
                                    ),
                                    icon: Icon(Icons.monetization_on),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xffff7c54,
                                        ),
                                      ),
                                    ),
                                    hintText: 'Cut',
                                  ),
                                  maxLines: 1,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  onChanged: (value) {
                                    _cutBudget = double.parse(value ?? 0);
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 2.0,
                                    ),
                                    icon: Icon(Icons.title),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xffff7c54,
                                        ),
                                      ),
                                    ),
                                    hintText: 'Title',
                                  ),
                                  maxLines: 1,
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.center,
                                  onChanged: (value) {
                                    _cutBudgetTitle = value;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FlatButton(
                                  child: Text('Add'),
                                  color: Color(0xffff7c54),
                                  onPressed: () {
                                    if (_addFormKey.currentState.validate()) {
                                      _widgets.addToList(
                                        _cutBudgetTitle,
                                        _cutBudget,
                                      );
                                      _budget.cutBudget(_cutBudget);
                                      _addFormKey.currentState.save();
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
