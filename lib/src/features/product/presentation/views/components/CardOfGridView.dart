import 'package:flutter/material.dart';
import 'package:tasck_clean_architecture/src/features/product/domain/entities/product.dart';

class CardOfGridView extends StatelessWidget {
  const CardOfGridView({super.key, required this.model});
  final ProductEntity model;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 2),
        ),
        width: double.infinity,
        child: Column(
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
