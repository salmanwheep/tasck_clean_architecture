import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image(
              // fit: BoxFit.scaleDown,
              // width: double.infinity,
              image: NetworkImage(
                "https://tse1.mm.bing.net/th/id/OIP.lyV9l3UKqj00mJJQ00sC5wHaHa?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=35",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "data",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
