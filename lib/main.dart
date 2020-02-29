import 'package:expenses/screens/home.dart';
import 'package:expenses/services/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/budget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Budget>(
          create: (_) => Budget(0),
        ),
        ChangeNotifierProvider<WidgetsList>(
          create: (_) => WidgetsList(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        theme: ThemeData.light(),
        home: Home(),
      ),
    );
  }
}
