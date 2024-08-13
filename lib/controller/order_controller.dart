// import 'package:geocoding/geocoding.dart'; 11111111111111111111111111111111111111111111111111111111111111111111111111111111
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sixam_mart_delivery/controller/auth_controller.dart';
import 'package:sixam_mart_delivery/controller/splash_controller.dart';
import 'package:sixam_mart_delivery/data/api/api_checker.dart';
import 'package:sixam_mart_delivery/data/model/body/record_location_body.dart';
import 'package:sixam_mart_delivery/data/model/body/update_status_body.dart';
import 'package:sixam_mart_delivery/data/model/response/ignore_model.dart';
import 'package:sixam_mart_delivery/data/model/response/order_details_model.dart';
import 'package:sixam_mart_delivery/data/model/response/order_model.dart';
import 'package:sixam_mart_delivery/data/repository/order_repo.dart';
import 'package:sixam_mart_delivery/util/app_constants.dart';
import 'package:sixam_mart_delivery/view/base/custom_snackbar.dart';

class OrderController extends GetxController implements GetxService {
  final OrderRepo orderRepo;
  OrderController({required this.orderRepo});

  List<OrderModel>? _allOrderList;
  List<OrderModel>? _currentOrderList;
  List<OrderModel>? _deliveredOrderList;
  List<OrderModel>? _completedOrderList;
  List<OrderModel>? _latestOrderList;
  List<OrderDetailsModel>? _orderDetailsModel;
  List<IgnoreModel> _ignoredRequests = [];
  bool _isLoading = false;
  Position _position = Position(longitude: 0, latitude: 0, timestamp: DateTime.now(), accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1, altitudeAccuracy: 0, headingAccuracy: 0);
  // Placemark _placeMark = Placemark(name: 'Unknown', subAdministrativeArea: 'Location', isoCountryCode: 'Found'); 11111111111111111111111111111111111111111111111111111111111111111111111111111111
  String _otp = '';
  bool _paginate = false;
  late int _pageSize;
  List<int> _offsetList = [];
  int _offset = 1;

  List<OrderModel>? get allOrderList => _allOrderList;
  List<OrderModel>? get currentOrderList => _currentOrderList;
  List<OrderModel>? get deliveredOrderList => _deliveredOrderList;
  List<OrderModel>? get completedOrderList => _completedOrderList;
  List<OrderModel>? get latestOrderList => _latestOrderList;
  List<OrderDetailsModel>? get orderDetailsModel => _orderDetailsModel;
  bool get isLoading => _isLoading;
  Position get position => _position;
  // Placemark get placeMark => _placeMark;11111111111111111111111111111111111111111111111111111111111111111111111111111111
  // String get address => '${_placeMark.name} ${_placeMark.subAdministrativeArea} ${_placeMark.isoCountryCode}';11111111111111111111111111111111111111111111111111111111111111111111111111111111
  String get otp => _otp;
  bool get paginate => _paginate;
  int get pageSize => _pageSize;
  int get offset => _offset;
  TextEditingController controller = TextEditingController();


  Future<void> getAllOrders() async {
    Response response = await orderRepo.getAllOrders();
    if (response.statusCode == 200) {
      _allOrderList = [];
      response.body.forEach((order) => _allOrderList!.add(OrderModel.fromJson(order)));
      _deliveredOrderList = [];
      _allOrderList!.forEach((order) {
        if (order.orderStatus == AppConstants.DELIVERED) {
          _deliveredOrderList!.add(order);
        }
      });
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> getCompletedOrders(int offset) async {
    if (offset == 1) {
      _offsetList = [];
      _offset = 1;
      _completedOrderList = [];
      update();
    }
    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);
      Response response = await orderRepo.getCompletedOrderList(offset);
      if (response.statusCode == 200) {
        if (offset == 1) {
          _completedOrderList = [];
        }
        var paginatedOrderModel = PaginatedOrderModel.fromJson(response.body);
        if (paginatedOrderModel.orders != null) {
          _completedOrderList!.addAll(paginatedOrderModel.orders!);
        }
        _pageSize = paginatedOrderModel.totalSize!;
        _paginate = false;
        update();
      } else {
        ApiChecker.checkApi(response);
      }
    } else {
      if (_paginate) {
        _paginate = false;
        update();
      }
    }
  }
  void showBottomLoader() {
    _paginate = true;
    update();
  }

  void setOffset(int offset) {
    _offset = offset;
  }

  Future<void> getCurrentOrders() async {
    Response response = await orderRepo.getCurrentOrders();
    if (response.statusCode == 200) {
      _currentOrderList = [];
      response.body.forEach((order) => _currentOrderList!.add(OrderModel.fromJson(order)));
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> getLatestOrders() async {
    Response response = await orderRepo.getLatestOrders();
    if (response.statusCode == 200) {
      _latestOrderList = [];
      List<int> _ignoredIdList = [];
      _ignoredRequests.forEach((ignore) {
        _ignoredIdList.add(ignore.id!);
      });
      response.body.forEach((order) {
        var orderModel = OrderModel.fromJson(order);
        if (orderModel != null && !_ignoredIdList.contains(orderModel.id)) {
          _latestOrderList!.add(orderModel);
        }
      });
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> recordLocation(RecordLocationBody recordLocationBody) async {
    Response response = await orderRepo.recordLocation(recordLocationBody);
    if (response.statusCode == 200) {
    } else {
      ApiChecker.checkApi(response);
    }
  }

  Future<bool> updateOrderStatus(int index, String status, {bool back = false, String? reason}) async {
    _isLoading = true;
    update();
    UpdateStatusBody _updateStatusBody = UpdateStatusBody(
      orderId: _currentOrderList![index].id,
      status: status,
      reason: reason ?? '',
      otp: status == AppConstants.DELIVERED ? _otp : null,
    );
    Response response = await orderRepo.updateOrderStatus(_updateStatusBody);
    Get.back();
    bool _isSuccess;
    if (response.statusCode == 200) {
      if (back) {
        Get.back();
      }
      Get.find<AuthController>().getProfile();
      getCurrentOrders();
      _currentOrderList![index].orderStatus = status;
      showCustomSnackBar(response.body['message'], isError: false);
      _isSuccess = true;
    } else {
      print(response.body['message']);
      ApiChecker.checkApi(response);
      _isSuccess = false;
    }
    _isLoading = false;
    update();
    return _isSuccess;
  }

  Future<void> updatePaymentStatus(int index, String status) async {
    _isLoading = true;
    update();
    UpdateStatusBody _updateStatusBody = UpdateStatusBody(orderId: _currentOrderList![index].id, status: status);
    Response response = await orderRepo.updatePaymentStatus(_updateStatusBody);
    if (response.statusCode == 200) {
      _currentOrderList![index].paymentStatus = status;
      showCustomSnackBar(response.body['message'], isError: false);
    } else {
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  Future<void> getOrderDetails(int orderID, bool parcel) async {
    if (parcel) {
      _orderDetailsModel = [];
    } else {
      _orderDetailsModel = _orderDetailsModel;
      Response response = await orderRepo.getOrderDetails(orderID);
      if (response.statusCode == 200) {
        _orderDetailsModel = [];
        response.body.forEach((orderDetails) => _orderDetailsModel!.add(OrderDetailsModel.fromJson(orderDetails)));
      } else {
        ApiChecker.checkApi(response);
      }
      update();
    }
  }

  Future<bool> acceptOrder(int orderID, int index, OrderModel orderModel) async {
    _isLoading = true;
    update();
    Response response = await orderRepo.acceptOrder(orderID);
    Get.back();
    bool _isSuccess;
    if (response.statusCode == 200) {
      _latestOrderList!.removeAt(index);
      _currentOrderList!.add(orderModel);
      _isSuccess = true;
    } else {
      ApiChecker.checkApi(response);
      _isSuccess = false;
    }
    _isLoading = false;
    update();
    return _isSuccess;
  }

  void getIgnoreList() {
    _ignoredRequests = [];
    _ignoredRequests.addAll(orderRepo.getIgnoreList());
  }

  void ignoreOrder(int index) {
    _ignoredRequests.add(IgnoreModel(id: _latestOrderList![index].id, time: DateTime.now()));
    _latestOrderList!.removeAt(index);
    orderRepo.setIgnoreList(_ignoredRequests);
    update();
  }

  void removeFromIgnoreList() {
    List<IgnoreModel> _tempList = [];
    _tempList.addAll(_ignoredRequests);
    for (int index = 0; index < _tempList.length; index++) {
      if (Get.find<SplashController>().currentTime.difference(_tempList[index].time!).inMinutes > 10) {
        _tempList.removeAt(index);
      }
    }
    _ignoredRequests = [];
    _ignoredRequests.addAll(_tempList);
    orderRepo.setIgnoreList(_ignoredRequests);
  }

  Future<void> getCurrentLocation() async {
    Position _currentPosition = await Geolocator.getCurrentPosition();
    if (!GetPlatform.isWeb) {
      try {
        // List<Placemark> _placeMarks = await placemarkFromCoordinates(_currentPosition.latitude, _currentPosition.longitude);11111111111111111111111111111111111111111111111111111111111111111111111111111111
        // _placeMark = _placeMarks.first;11111111111111111111111111111111111111111111111111111111111111111111111111111111
      } catch (e) {}
    }
    _position = _currentPosition;
    update();
  }

  void setOtp(String otp) {
    _otp = otp;
    if (otp != '') {
      update();
    }
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;

    for (var orderDetails in orderDetailsModel!) {
      double productPrice = (orderDetails.price! - orderDetails.discountOnItem!);
      totalPrice += productPrice;
    }

    if (_completedOrderList != null && _completedOrderList!.isNotEmpty) {
      totalPrice += _completedOrderList!.first.deliveryCharge!;
    }
    return totalPrice;
  }

}
