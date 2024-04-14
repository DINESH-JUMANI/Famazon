import 'package:famazon/common/widgets/loader.dart';
import 'package:famazon/features/account/services/account_services.dart';
import 'package:famazon/features/account/widgets/account_button.dart';
import 'package:famazon/features/admin/models/sales.dart';
import 'package:famazon/features/admin/services/admin_services.dart';
import 'package:famazon/features/admin/widgets/category_products_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales = 0;
  List<Sales>? earnings;
  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSales == null
        ? const Loader()
        : Column(
            children: [
              Text(
                '₹$totalSales',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CategoryProductsChart(),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 200,
                child: AccountButton(
                  text: 'Log Out',
                  onPressed: () => AccountServices().logOut(context),
                ),
              ),
            ],
          );
  }
}
