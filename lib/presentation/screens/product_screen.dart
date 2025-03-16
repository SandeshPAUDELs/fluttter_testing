import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/bloc/product/product_bloc.dart';
import 'package:flutter_application_2/presentation/bloc/product/product_event.dart';
import 'package:flutter_application_2/presentation/bloc/product/product_state.dart';
import 'package:flutter_application_2/presentation/screens/products_details_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductBloc>().add(FetchProducts());
    });

    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductInitial) {
            
            return Center(
              child: Text('Initial state, products not fetched yet.'),
            );
          } else if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductSuccess) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductsDetailsScreen(
                            productId: state.products[index].id,
                          );
                        },
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(state.products[index].title),
                    subtitle: Text(state.products[index].description),
                  ),
                );
              },
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
