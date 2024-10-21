import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register/provider/users.dart';
import 'package:register/routes/app_routes.dart';
import 'package:register/views/user_form.dart';
import 'package:register/views/user_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return Users();
          },
        )
      ],
      child: MaterialApp(
          title: 'User Cards',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: {
            AppRoutes.home: (_) => const UserList(),
            AppRoutes.userForm: (_) => const UserForm(),
          }),
    );
  }
}
