class CheckLinkTransactionResponse {
  bool? isSuccess;
  String? errorMsg;
  String? progress;
  String? status;
  Output? output;
  String? avatar;
  String? title;
  String? type;

  CheckLinkTransactionResponse(
      {this.isSuccess,
      this.errorMsg,
      this.progress,
      this.status,
      this.output,
      this.avatar,
      this.title,
      this.type});

  CheckLinkTransactionResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    errorMsg = json['ErrorMsg'];
    progress = json['Progress'];
    status = json['Status'];
    output =
        json['Output'] != null ? new Output.fromJson(json['Output']) : null;
    avatar = json['Avatar'];
    title = json['Title'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    data['ErrorMsg'] = this.errorMsg;
    data['Progress'] = this.progress;
    data['Status'] = this.status;
    if (this.output != null) {
      data['Output'] = this.output!.toJson();
    }
    data['Avatar'] = this.avatar;
    data['Title'] = this.title;
    data['Type'] = this.type;
    return data;
  }
}

class Output {
  String? originalText;
  String? summaryText;

  Output({this.originalText, this.summaryText});

  Output.fromJson(Map<String, dynamic> json) {
    originalText = json['OriginalText'];
    summaryText = json['SummaryText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OriginalText'] = this.originalText;
    data['SummaryText'] = this.summaryText;
    return data;
  }
}
