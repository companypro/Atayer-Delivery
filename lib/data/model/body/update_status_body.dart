class UpdateStatusBody {
  String? token;
  int? orderId;
  String? status;
  String? otp;
  String? reason;
  String method = 'put';

  UpdateStatusBody({this.token, this.orderId, this.status, this.otp,this.reason});

  UpdateStatusBody.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    orderId = json['order_id'];
    status = json['status'];
    reason = json['reason'];
    otp = json['otp'];
    status = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['order_id'] = this.orderId;
    data['status'] = this.status;
    data['reason'] = this.reason;
    data['otp'] = this.otp;
    data['_method'] = this.method;
    return data;
  }
}
