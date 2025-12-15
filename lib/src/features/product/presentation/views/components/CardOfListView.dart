import 'package:flutter/material.dart';
import 'package:tasck_clean_architecture/src/features/product/data/models/product.dart';
import 'package:tasck_clean_architecture/src/features/product/domain/entities/product.dart';

class CardOfListView extends StatelessWidget {
  const CardOfListView({super.key, required this.model});
  final ProductEntity model;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: Image.network(model.image)),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      model.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(model.shippingInformation),
                    Text(
                      "\$" + model.price.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          Icon(
                            Icons.star,
                            color: (model.rating > i)
                                ? Color.fromARGB(255, 2, 184, 178)
                                : Colors.black,
                          ),
                        Text(model.reviewsCount.toString() + "\t Reviews "),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(color: Colors.black),
        ],
      ),
    );
  }
}
