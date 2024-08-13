import 'dart:async';

import 'package:sixam_mart_delivery/controller/order_controller.dart';
import 'package:sixam_mart_delivery/util/dimensions.dart';
import 'package:sixam_mart_delivery/view/base/custom_app_bar.dart';
import 'package:sixam_mart_delivery/view/screens/request/widget/order_requset_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../order/widget/history_order_widget.dart';

class OrderRequestScreen extends StatefulWidget {
  final Function onTap;
  OrderRequestScreen({required this.onTap});

  @override
  _OrderRequestScreenState createState() => _OrderRequestScreenState();
}

class _OrderRequestScreenState extends State<OrderRequestScreen> {
  late Timer _timer;

  @override
  initState() {
    super.initState();

    Get.find<OrderController>().getLatestOrders();
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      Get.find<OrderController>().getLatestOrders();
    });
  }

  @override
  void dispose() {
    super.dispose();

    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'order_request'.tr, isBackButtonExist: false),
      body: GetBuilder<OrderController>(builder: (orderController) {

        return orderController.currentOrderList != null ? orderController.currentOrderList!.length > 0 ? RefreshIndicator(
          onRefresh: () async {
            await orderController.getCurrentOrders();
          },
          child: Scrollbar(child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Center(child: SizedBox(
              width: 1170,
              child: ListView.builder(
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                itemCount: orderController.currentOrderList!.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return HistoryOrderWidget(orderModel: orderController.currentOrderList![index], isRunning: true, index: index);
                },
              ),
            )),
          )),
        ) : Center(child: Text('no_order_found'.tr)) : Center(child: CircularProgressIndicator());
      }),
    );
  }
}
