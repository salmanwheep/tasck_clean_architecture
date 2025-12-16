import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasck_clean_architecture/src/features/product/domain/entities/product.dart';
import 'package:tasck_clean_architecture/src/features/product/presentation/bloc/product_bloc.dart';
import 'package:tasck_clean_architecture/src/features/product/presentation/bloc/product_event.dart';
import 'package:tasck_clean_architecture/src/features/product/presentation/views/components/CardOfGridView.dart';
import 'package:tasck_clean_architecture/src/features/product/presentation/views/components/CardOfListView.dart';

class Loadedwidget extends StatelessWidget {
  final List<ProductEntity> productList;
  final bool isList;
  final ScrollController? scrollController = ScrollController();
  Loadedwidget({
    super.key,
    required this.productList,
    required this.isList,
    // this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    scrollController!.addListener(() async {
      double scroll = scrollController!.position.maxScrollExtent;
      if (scrollController!.position.pixels ==
          scrollController!.position.maxScrollExtent) {
        context.read<ProductBloc>().add(LoadingMore());
        scrollController!.position.setPixels(scroll);
      }
      print(scrollController!.position.pixels);
    });
    return Center(
      child: isList
          ? ListView.builder(
              itemBuilder: (context, index) =>
                  CardOfListView(model: productList[index]),

              itemCount: productList.length,
              controller: scrollController,
            )
          : GridView.builder(
              controller: scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: productList.length,
              itemBuilder: (context, i) =>
                  CardOfGridView(model: productList[i]),
            ),
    );
  }
}
