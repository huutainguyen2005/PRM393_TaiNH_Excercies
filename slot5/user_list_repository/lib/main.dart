import 'package:flutter/material.dart';

import 'data/datasources/user_fake_datasource.dart';
import 'data/repositories/user_repository.dart';
import 'data/repositories/user_repository_impl.dart';
import 'screens/user_screen.dart';

void main() {
  final dataSource = UserFakeDataSource();
  final UserRepository repository = UserRepositoryImpl(dataSource);

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final UserRepository repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserScreen(repository: repository),
    );
  }
}
