import 'package:flutter/material.dart';
import 'package:tasck_clean_architecture/src/features/product/data/models/product.dart';
import 'package:tasck_clean_architecture/src/features/product/domain/entities/product.dart';

class CardOfGridView extends StatelessWidget {
  const CardOfGridView({required this.model});
  final ProductEntity model;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 2),
        ),
        width: double.infinity,
        child: Column(
          // mainAxisSize: MainAxisSize.minFF
          children: [
            Expanded(child: Image.network(model.image)),
            const Divider(color: Colors.black, thickness: 1.5),
            Container(
              padding: EdgeInsets.all(20),

              width: double.infinity,
              child: Text(
                model.title,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
