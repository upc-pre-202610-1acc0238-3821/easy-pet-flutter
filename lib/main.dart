import 'package:easy_vet/core/di/dependency_injection.dart';
import 'package:easy_vet/features/auth/presentation/login_page.dart';
import 'package:easy_vet/features/auth/presentation/login_view_model.dart';
import 'package:easy_vet/features/cart/presentation/cart_view_model.dart';
import 'package:easy_vet/features/home/presentation/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  setup();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) => getIt<HomeViewModel>(),
        ),
        BlocProvider<LoginViewModel>(
          create: (context) => getIt<LoginViewModel>(),
        ),
        ChangeNotifierProvider<CartViewModel>(
          create: (context) => getIt<CartViewModel>(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage());
  }
}
