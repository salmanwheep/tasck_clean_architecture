import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasck_clean_architecture/src/features/product/presentation/bloc/product_event.dart';
import 'package:tasck_clean_architecture/src/features/product/presentation/views/components/loadedWidget.dart';
import '../bloc/product_bloc.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return RefreshIndicator(
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: (state is ProductLoading)
                        ? Center(child: CircularProgressIndicator())
                        : (state is ProductError)
                        ? Center(
                            child: Text(
                              state.message,
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        : (state is ProductLoaded)
                        ? Column(
                            children: [
                              Expanded(
                                child: Loadedwidget(
                                  productList: state.products,
                                  isList: state.isList,
                                ),
                              ),
                              SizedBox(height: 10),
                              state.isLoadMore
                                  ? CircularProgressIndicator()
                                  : Container(),
                              SizedBox(height: 20),
                            ],
                          )
                        : Center(child: Text('Fetch Data')),
                  ),
                ],
              );
            },
          ),
          onRefresh: () async {
            context.read<ProductBloc>().add(RefreshProduct());
          },
        );
      },
    );
  }
}
