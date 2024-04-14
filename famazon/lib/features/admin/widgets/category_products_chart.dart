import 'package:flutter/material.dart';

class CategoryProductsChart extends StatelessWidget {
  const CategoryProductsChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      color: Colors.grey.shade100,
      child: const Center(
          child: Text(
        'Chart to be added here!',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      )),
    );
  }
}
