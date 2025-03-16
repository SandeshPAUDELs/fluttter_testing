import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/bloc/product/product_bloc.dart';
import 'package:flutter_application_2/presentation/bloc/product/product_event.dart';
import 'package:flutter_application_2/presentation/bloc/product/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsDetailsScreen extends StatelessWidget {
  final int productId;
  const ProductsDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
     WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductBloc>().add(FetchProductById(id: productId)); 
    });
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductByIdSuccess) {
            return Column(
              children: [
                Image.network(state.product.image),
                Text(state.product.title),
                Text(state.product.description),
              ],
            );
          } else if (state is ProductFailure) {
            return Center(child: Text(state.error));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}