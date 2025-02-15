import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mayomart_dashboard/Firebase/firebase_functions.dart';
import 'package:mayomart_dashboard/Items/order_item.dart';

class OrderPage extends StatefulWidget {
  OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1920, 1080));
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 900.w,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: SearchBar(
              controller: searchController,
              trailing: Iterable.generate(
                0,
                (index) => IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search)),
              ),
              hintText: AppLocalizations.of(context)!.searchHere,
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: getOrder(),
                  builder: (context, snapshot) {
                    var orders = snapshot.data?.docs
                            .map((order) => order.data())
                            .toList() ??
                        [];
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Card();
                    } else {
                      return ListView.builder(
                        itemCount: orders.length,
                        itemBuilder: (BuildContext context, int index) =>
                            OrderItem(order: orders[index]),
                      );
                    }
                  }))
        ],
      ),
    );
  }
}
