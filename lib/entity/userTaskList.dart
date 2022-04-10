class UserTaskList {
  bool? isSuccess;
  String? errorMsg;
  List<TaskList>? taskList;

  UserTaskList({this.isSuccess, this.errorMsg, this.taskList});

  UserTaskList.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    errorMsg = json['ErrorMsg'];
    if (json['TaskList'] != null) {
      taskList = <TaskList>[];
      json['TaskList'].forEach((v) {
        taskList!.add(new TaskList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    data['ErrorMsg'] = this.errorMsg;
    if (this.taskList != null) {
      data['TaskList'] = this.taskList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TaskList {
  String? progress;
  String? status;
  String? type;
  String? transactionID;
  String? avatar;
  String? title;

  TaskList(
      {this.progress,
      this.status,
      this.type,
      this.transactionID,
      this.avatar,
      this.title});

  TaskList.fromJson(Map<String, dynamic> json) {
    progress = json['Progress'];
    status = json['Status'];
    type = json['Type'];
    transactionID = json['TransactionID'];
    avatar = json['Avatar'];
    title = json['Title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Progress'] = this.progress;
    data['Status'] = this.status;
    data['Type'] = this.type;
    data['TransactionID'] = this.transactionID;
    data['Avatar'] = this.avatar;
    data['Title'] = this.title;
    return data;
  }
}


class UserTaskListList {
  List<TaskList>? taskList;

  UserTaskListList({this.taskList});

  UserTaskListList.fromJson(Map<String, dynamic> json) {
    if (json['TaskList'] != null) {
      taskList = <TaskList>[];
      json['TaskList'].forEach((v) {
        taskList!.add(new TaskList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.taskList != null) {
      data['TaskList'] = this.taskList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}