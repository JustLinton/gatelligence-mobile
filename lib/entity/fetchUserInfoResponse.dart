class FetchUserInfoResponse {
  bool? isSuccess;
  String? errorMsg;
  String? email;
  String? nickName;
  String? avatar;
  String? gender;
  bool? activated;

  FetchUserInfoResponse(
      {this.isSuccess,
      this.errorMsg,
      this.email,
      this.nickName,
      this.avatar,
      this.gender,
      this.activated});

  FetchUserInfoResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    errorMsg = json['ErrorMsg'];
    email = json['Email'];
    nickName = json['NickName'];
    avatar = json['Avatar'];
    gender = json['Gender'];
    activated = json['Activated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    data['ErrorMsg'] = this.errorMsg;
    data['Email'] = this.email;
    data['NickName'] = this.nickName;
    data['Avatar'] = this.avatar;
    data['Gender'] = this.gender;
    data['Activated'] = this.activated;
    return data;
  }
}
