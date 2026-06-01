import 'package:easy_vet/features/home/presentation/home_view_model.dart';
import 'package:easy_vet/features/home/presentation/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = context.watch<HomeViewModel>();

    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.errorMessage != null) {
      return Center(child: Text(viewModel.errorMessage!));
    }

    return ListView.builder(
      itemCount: viewModel.products.length,
      itemBuilder: (context, index) =>
          ProductItem(product: viewModel.products[index]),
    );
  }
}
