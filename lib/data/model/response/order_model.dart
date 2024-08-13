class PaginatedOrderModel {
  int? totalSize;
  String? limit;
  String? offset;
  List<OrderModel>? orders;

  PaginatedOrderModel({this.totalSize, this.limit, this.offset, this.orders});

  PaginatedOrderModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'].toString();
    offset = json['offset'].toString();
    if (json['orders'] != null) {
      orders = [];
      json['orders'].forEach((v) {
        orders?.add(OrderModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total_size'] = totalSize;
    data['limit'] = limit;
    data['offset'] = offset;
    if (orders != null) {
      data['orders'] = orders?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderModel {
  int? id;
  int? itemCampaignId;
  int? userId;
  double? orderAmount;
  double? couponDiscountAmount;
  String? paymentStatus;
  String? orderStatus;
  double? totalTaxAmount;
  String? paymentMethod;
  String? transactionReference;
  int? deliveryAddressId;
  int? deliveryManId;
  String? orderType;
  int? storeId;
  String? createdAt;
  String? updatedAt;
  double? deliveryCharge;
  double? originalDeliveryCharge;
  String? scheduleAt;
  String? storeName;
  String? storeAddress;
  String? storeLat;
  String? storeLng;
  String? storeLogo;
  String? storePhone;
  int? detailsCount;
  String? orderNote;
  String? orderAttachment;
  String? chargePayer;
  String? moduleType;
  DeliveryAddress? deliveryAddress;
  DeliveryAddress? receiverDetails;
  ParcelCategory? parcelCategory;
  Customer? customer;

  OrderModel({
    this.id,
    this.itemCampaignId,
    this.userId,
    this.orderAmount,
    this.couponDiscountAmount,
    this.paymentStatus,
    this.orderStatus,
    this.totalTaxAmount,
    this.paymentMethod,
    this.transactionReference,
    this.deliveryAddressId,
    this.deliveryManId,
    this.orderType,
    this.storeId,
    this.createdAt,
    this.updatedAt,
    this.deliveryCharge,
    this.originalDeliveryCharge,
    this.scheduleAt,
    this.storeName,
    this.storeAddress,
    this.storeLat,
    this.storeLng,
    this.storeLogo,
    this.storePhone,
    this.detailsCount,
    this.chargePayer,
    this.orderAttachment,
    this.orderNote,
    this.moduleType,
    this.deliveryAddress,
    this.receiverDetails,
    this.parcelCategory,
    this.customer,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      itemCampaignId: json['item_campaign_id'],
      userId: json['user_id'],
      orderAmount: json['order_amount']?.toDouble(),
      couponDiscountAmount: json['coupon_discount_amount']?.toDouble(),
      paymentStatus: json['payment_status'],
      orderStatus: json['order_status'],
      totalTaxAmount: json['total_tax_amount']?.toDouble(),
      paymentMethod: json['payment_method'],
      transactionReference: json['transaction_reference'],
      deliveryAddressId: json['delivery_address_id'],
      deliveryManId: json['delivery_man_id'],
      orderType: json['order_type'],
      storeId: json['store_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deliveryCharge: json['delivery_charge']?.toDouble(),
      originalDeliveryCharge: json['original_delivery_charge']?.toDouble(),
      scheduleAt: json['schedule_at'],
      storeName: json['store_name'],
      storeAddress: json['store_address'],
      storeLat: json['store_lat'],
      storeLng: json['store_lng'],
      storeLogo: json['store_logo'],
      storePhone: json['store_phone'],
      detailsCount: json['details_count'],
      orderNote: json['order_note'],
      chargePayer: json['charge_payer'],
      moduleType: json['module_type'],
      orderAttachment: json['order_attachment'],
      deliveryAddress: json['delivery_address'] != null ? DeliveryAddress.fromJson(json['delivery_address']) : null,
      receiverDetails: json['receiver_details'] != null ? DeliveryAddress.fromJson(json['receiver_details']) : null,
      parcelCategory: json['parcel_category'] != null ? ParcelCategory.fromJson(json['parcel_category']) : null,
      customer: json['customer'] != null ? Customer.fromJson(json['customer']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'item_campaign_id': itemCampaignId,
      'user_id': userId,
      'order_amount': orderAmount,
      'coupon_discount_amount': couponDiscountAmount,
      'payment_status': paymentStatus,
      'order_status': orderStatus,
      'total_tax_amount': totalTaxAmount,
      'payment_method': paymentMethod,
      'transaction_reference': transactionReference,
      'delivery_address_id': deliveryAddressId,
      'delivery_man_id': deliveryManId,
      'order_type': orderType,
      'store_id': storeId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'delivery_charge': deliveryCharge,
      'original_delivery_charge': originalDeliveryCharge,
      'schedule_at': scheduleAt,
      'store_name': storeName,
      'store_address': storeAddress,
      'store_lat': storeLat,
      'store_lng': storeLng,
      'store_logo': storeLogo,
      'store_phone': storePhone,
      'details_count': detailsCount,
      'order_attachment': orderAttachment,
      'charge_payer': chargePayer,
      'order_note': orderNote,
      'module_type': moduleType,
    };
    if (deliveryAddress != null) {
      data['delivery_address'] = deliveryAddress!.toJson();
    }
    if (receiverDetails != null) {
      data['receiver_details'] = receiverDetails!.toJson();
    }
    if (parcelCategory != null) {
      data['parcel_category'] = parcelCategory!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    return data;
  }
}
class DeliveryAddress {
  int? id;
  String? addressType;
  String?  contactPersonNumber;
  String? address;
    String?  latitude;
    String? longitude;
  int? userId;
    String? contactPersonName;
  String? createdAt;
  String? updatedAt;
  int? zoneId;
  String? streetNumber;
  String? house;
  String? floor;


  DeliveryAddress(
      {this.id,
        this.addressType,
          this.contactPersonNumber,
        this.address,
          this.latitude,
          this.longitude,
        this.userId,
          this.contactPersonName,
        this.createdAt,
        this.updatedAt,
        this.zoneId,
        this.streetNumber,
        this.house,
        this.floor});

  DeliveryAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressType = json['address_type'];
    contactPersonNumber = json['contact_person_number'];
    address = json['address'];
    latitude = json['latitude'].toString();
    longitude = json['longitude'].toString();
    userId = json['user_id'];
    contactPersonName = json['contact_person_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    zoneId = json['zone_id'];
    streetNumber = json['road'];
    house = json['house'];
    floor = json['floor'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address_type'] = this.addressType;
    data['contact_person_number'] = this.contactPersonNumber;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['user_id'] = this.userId;
    data['contact_person_name'] = this.contactPersonName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['zone_id'] = this.zoneId;
    data['road'] = this.streetNumber;
    data['house'] = this.house;
    data['floor'] = this.floor;
    return data;
  }
}

class Customer {
  int? id;
  String? fName;
  String? lName;
  String? phone;
  String? email;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? cmFirebaseToken;

  Customer(
      {this.id,
        this.fName,
        this.lName,
        this.phone,
        this.email,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.cmFirebaseToken});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cmFirebaseToken = json['cm_firebase_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['cm_firebase_token'] = this.cmFirebaseToken;
    return data;
  }
}

class ParcelCategory {
  int? id;
  String? image;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;

  ParcelCategory(
      {this.id,
        this.image,
        this.name,
        this.description,
        this.createdAt,
        this.updatedAt});

  ParcelCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


//[
//     {
//         "id": 553,
//         "item_id": 274,
//         "order_id": 100002,
//         "store_id": 11,
//         "module_id": 4,
//         "order_super_id": 100002,
//         "order_status": "picked_up",
//         "price": 120,
//         "item_details": {
//             "id": 274,
//             "name": "عيش فينو",
//             "description": ".",
//             "image": "2024-04-30-66308696f39e2.png",
//             "category_id": 375,
//             "category_ids": [
//                 {
//                     "id": "375",
//                     "position": 0,
//                     "name": "الفواكهة"
//                 },
//                 {
//                     "id": "0",
//                     "position": 1,
//                     "name": "NA"
//                 }
//             ],
//             "variations": [],
//             "add_ons": [],
//             "attributes": [],
//             "choice_options": [],
//             "price": 120,
//             "tax": 3,
//             "tax_type": "percent",
//             "discount": 0,
//             "discount_type": "amount",
//             "available_time_starts": "00:00:00",
//             "available_time_ends": "23:59:59",
//             "veg": 0,
//             "status": 1,
//             "store_id": 11,
//             "created_at": "2024-04-30T07:25:58.000000Z",
//             "updated_at": "2024-05-21T07:04:21.000000Z",
//             "order_count": 0,
//             "avg_rating": 0,
//             "rating_count": 0,
//             "module_id": 4,
//             "stock": 97,
//             "unit_id": null,
//             "images": [],
//             "food_variations": [],
//             "slug": null,
//             "recommended": 0,
//             "organic": 0,
//             "maximum_cart_quantity": null,
//             "is_approved": 1,
//             "store_name": "Test 1",
//             "is_campaign": 0,
//             "module_type": "grocery",
//             "zone_id": 7,
//             "flash_sale": 0,
//             "store_discount": 0,
//             "schedule_order": false,
//             "min_delivery_time": 30,
//             "max_delivery_time": 60,
//             "common_condition_id": 0,
//             "is_basic": 0,
//             "unit_type": null,
//             "module": {
//                 "id": 4,
//                 "module_name": "خضروات وفواكه",
//                 "module_type": "grocery",
//                 "thumbnail": "2024-04-24-66291de2f2f94.png",
//                 "status": "1",
//                 "stores_count": 2,
//                 "created_at": "2024-03-10T12:17:59.000000Z",
//                 "updated_at": "2024-04-30T07:23:11.000000Z",
//                 "icon": "2024-04-24-66291de2f2d2a.png",
//                 "theme_id": 1,
//                 "description": "<p>خضروات وفواكه</p>",
//                 "all_zone_service": 0,
//                 "translations": [
//                     {
//                         "id": 75,
//                         "translationable_type": "App\\Models\\Module",
//                         "translationable_id": 4,
//                         "locale": "ar",
//                         "key": "module_name",
//                         "value": "خضروات وفواكه",
//                         "created_at": null,
//                         "updated_at": null
//                     },
//                     {
//                         "id": 76,
//                         "translationable_type": "App\\Models\\Module",
//                         "translationable_id": 4,
//                         "locale": "ar",
//                         "key": "description",
//                         "value": "<p>خضروات وفواكه</p>",
//                         "created_at": null,
//                         "updated_at": null
//                     }
//                 ]
//             },
//             "translations": [],
//             "unit": null
//         },
//         "variation": [],
//         "add_ons": [],
//         "discount_on_item": 0,
//         "discount_type": "product_discount",
//         "quantity": 1,
//         "tax_amount": 4,
//         "variant": "\"\"",
//         "created_at": "2024-05-31T18:52:19.000000Z",
//         "updated_at": "2024-06-01T18:13:24.000000Z",
//         "item_campaign_id": null,
//         "total_add_on_price": 0
//     },
//     {
//         "id": 554,
//         "item_id": 275,
//         "order_id": 100002,
//         "store_id": 11,
//         "module_id": 4,
//         "order_super_id": 100002,
//         "order_status": "picked_up",
//         "price": 12,
//         "item_details": {
//             "id": 275,
//             "name": "عيش بلدي",
//             "description": ".",
//             "image": "2024-04-30-663086e59f77c.png",
//             "category_id": 375,
//             "category_ids": [
//                 {
//                     "id": "375",
//                     "position": 0,
//                     "name": "الفواكهة"
//                 },
//                 {
//                     "id": "0",
//                     "position": 1,
//                     "name": "NA"
//                 }
//             ],
//             "variations": [],
//             "add_ons": [],
//             "attributes": [],
//             "choice_options": [],
//             "price": 12,
//             "tax": 3,
//             "tax_type": "percent",
//             "discount": 0,
//             "discount_type": "amount",
//             "available_time_starts": "00:00:00",
//             "available_time_ends": "23:59:59",
//             "veg": 0,
//             "status": 1,
//             "store_id": 11,
//             "created_at": "2024-04-30T07:25:58.000000Z",
//             "updated_at": "2024-05-21T07:04:21.000000Z",
//             "order_count": 0,
//             "avg_rating": 0,
//             "rating_count": 0,
//             "module_id": 4,
//             "stock": 99,
//             "unit_id": null,
//             "images": [],
//             "food_variations": [],
//             "slug": null,
//             "recommended": 0,
//             "organic": 0,
//             "maximum_cart_quantity": null,
//             "is_approved": 1,
//             "store_name": "Test 1",
//             "is_campaign": 0,
//             "module_type": "grocery",
//             "zone_id": 7,
//             "flash_sale": 0,
//             "store_discount": 0,
//             "schedule_order": false,
//             "min_delivery_time": 30,
//             "max_delivery_time": 60,
//             "common_condition_id": 0,
//             "is_basic": 0,
//             "unit_type": null,
//             "module": {
//                 "id": 4,
//                 "module_name": "خضروات وفواكه",
//                 "module_type": "grocery",
//                 "thumbnail": "2024-04-24-66291de2f2f94.png",
//                 "status": "1",
//                 "stores_count": 2,
//                 "created_at": "2024-03-10T12:17:59.000000Z",
//                 "updated_at": "2024-04-30T07:23:11.000000Z",
//                 "icon": "2024-04-24-66291de2f2d2a.png",
//                 "theme_id": 1,
//                 "description": "<p>خضروات وفواكه</p>",
//                 "all_zone_service": 0,
//                 "translations": [
//                     {
//                         "id": 75,
//                         "translationable_type": "App\\Models\\Module",
//                         "translationable_id": 4,
//                         "locale": "ar",
//                         "key": "module_name",
//                         "value": "خضروات وفواكه",
//                         "created_at": null,
//                         "updated_at": null
//                     },
//                     {
//                         "id": 76,
//                         "translationable_type": "App\\Models\\Module",
//                         "translationable_id": 4,
//                         "locale": "ar",
//                         "key": "description",
//                         "value": "<p>خضروات وفواكه</p>",
//                         "created_at": null,
//                         "updated_at": null
//                     }
//                 ]
//             },
//             "translations": [],
//             "unit": null
//         },
//         "variation": [],
//         "add_ons": [],
//         "discount_on_item": 0,
//         "discount_type": "product_discount",
//         "quantity": 1,
//         "tax_amount": 0,
//         "variant": "\"\"",
//         "created_at": "2024-05-31T18:52:19.000000Z",
//         "updated_at": "2024-06-01T18:13:24.000000Z",
//         "item_campaign_id": null,
//         "total_add_on_price": 0
//     }
// ]