class RegisterModel {
  bool? isSuccess;
  String? message;

  RegisterModel({this.isSuccess, this.message});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    return data;
  }
}
