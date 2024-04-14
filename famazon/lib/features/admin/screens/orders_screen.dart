import 'package:famazon/common/widgets/loader.dart';
import 'package:famazon/features/account/widgets/single_product.dart';
import 'package:famazon/features/admin/services/admin_services.dart';
import 'package:famazon/features/order_details/screens/order_details_screen.dart';
import 'package:famazon/models/order.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Order>? orders;
  final AdminServices adminServices = AdminServices();
  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  fetchOrders() async {
    orders = await adminServices.fetchAllOrders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : GridView.builder(
            itemCount: orders!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              final orderData = orders![index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    OrderDetailsScreen.routeName,
                    arguments: orderData,
                  );
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 140,
                      child:
                          SingleProduct(image: orderData.products[0].images[0]),
                    ),
                    Text(
                      orderData.userId,
                      style: const TextStyle(fontSize: 12.5),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
