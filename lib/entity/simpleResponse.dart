class SimpleResponse {
  bool? isSuccess;
  String? errorMsg;

  SimpleResponse({this.isSuccess, this.errorMsg});

  SimpleResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    errorMsg = json['ErrorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    data['ErrorMsg'] = this.errorMsg;
    return data;
  }
}
