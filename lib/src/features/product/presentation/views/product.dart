import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasck_clean_architecture/src/features/product/presentation/views/components/loadedWidget.dart';
import '../bloc/product_bloc.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        final bloc = context.watch<ProductBloc>();
        if (state is ProductLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          return Center(
            child: Loadedwidget(productList: state.products, isList: true),
          );
        } else if (state is ProductError) {
          return Center(
            child: Text(state.message, style: TextStyle(color: Colors.red)),
          );
        } else if (state is ProductLoadedGridView) {
          return Center(
            child: Loadedwidget(productList: state.products, isList: false),
          );
        } else if (state is ProductLoadedListView) {
          return Center(
            child: Loadedwidget(productList: state.products, isList: true),
          );
        }
        return Center(child: Text('Fetch Data'));
      },
    );
  }
}
