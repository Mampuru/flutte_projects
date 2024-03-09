import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tdd_app/screens/active_user.dart';
import 'package:tdd_app/screens/add_user.dart';
import 'package:tdd_app/screens/archived_users.dart';
import 'database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final Widget? child;
  const MyApp({this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Database(),
        child: MaterialApp(
          title: 'TDD APP',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
            useMaterial3: true,
          ),
          initialRoute: '/',
          routes: {
            "/": (context) => child ?? const ActiveUsers(),
            "/addUser": (context) => AddUser(),
            "/archive": (context) => const ArchivedUsers(),
          },
        ));
  }
}

