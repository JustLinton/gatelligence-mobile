class CreateLinkTransactionResponse {
  String? transactionID;
  bool? isSuccess;
  String? errorMsg;

  CreateLinkTransactionResponse(
      {this.transactionID, this.isSuccess, this.errorMsg});

  CreateLinkTransactionResponse.fromJson(Map<String, dynamic> json) {
    transactionID = json['TransactionID'];
    isSuccess = json['IsSuccess'];
    errorMsg = json['ErrorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TransactionID'] = this.transactionID;
    data['IsSuccess'] = this.isSuccess;
    data['ErrorMsg'] = this.errorMsg;
    return data;
  }
}
