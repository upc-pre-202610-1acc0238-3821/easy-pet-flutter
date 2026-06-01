import 'package:easy_vet/features/home/presentation/home_state.dart';
import 'package:easy_vet/features/home/presentation/home_view_model.dart';
import 'package:easy_vet/features/home/presentation/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = context.watch<HomeViewModel>();
    final HomeState state = viewModel.state;

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null) {
      return Center(child: Text(state.errorMessage!));
    }

    return ListView.builder(
      itemCount: state.products.length,
      itemBuilder: (context, index) =>
          ProductItem(product: state.products[index]),
    );
  }
}
