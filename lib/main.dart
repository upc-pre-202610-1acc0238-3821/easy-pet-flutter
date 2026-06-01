import 'package:easy_vet/core/di/dependency_injection.dart';
import 'package:easy_vet/features/home/presentation/home_page.dart';
import 'package:easy_vet/features/home/presentation/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => getIt<HomeViewModel>(),
          child: HomePage(),
        ),
      ),
    );
  }
}
