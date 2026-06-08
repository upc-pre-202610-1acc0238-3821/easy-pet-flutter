import 'package:easy_vet/features/cart/presentation/cart_state.dart';
import 'package:easy_vet/features/cart/presentation/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartViewModel viewModel = context.watch<CartViewModel>();
    final CartState state = viewModel.cartState;

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null) {
      return Center(child: Text(state.errorMessage!));
    }

    return ListView.builder(
      itemCount: state.items.length,
      itemBuilder: (context, index) => Text(state.items[index].title),
    );
  }
}
