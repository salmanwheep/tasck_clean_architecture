import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_bloc.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product')),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          final bloc = context.watch<ProductBloc>();
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return Center(child: Text(state.data));
          } else if (state is ProductError) {
            return Center(child: Text(state.message, style: TextStyle(color: Colors.red)));
          }
          return Center(
            child: ElevatedButton(
              onPressed: () => bloc.add(FetchProduct()),
              child: Text('Fetch Data'),
            ),
          );
        },
      ),
    );
  }
}