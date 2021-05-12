class ToDoModel {
  ToDoModel({
    this.id,
    this.title,
    this.body,
    this.dateTime,
    this.timeStamp,
    this.updatedTime,
    this.updatedDate,
    this.isCompleted = false,
    this.isBookmarked = false,
    this.isEdited = false,
  });

  String? id;
  String? title;
  String? body;
  String? dateTime;
  String? timeStamp;
  bool? isBookmarked;
  bool? isCompleted;
  String? updatedDate;
  String? updatedTime;
  bool? isEdited;

  factory ToDoModel.fromJson(Map<String, dynamic> data) => ToDoModel(
        id: data["id"],
        body: data["body"],
        title: data["title"],
        dateTime: data["date"],
        timeStamp: data["time"],
        isBookmarked: data["isBookmarked"],
        isCompleted: data["isCompleted"],
        updatedDate: data["updatedDate"],
        updatedTime: data["updatedTime"],
        isEdited: data["isEdited"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "date": dateTime,
        "time": timeStamp,
        "isBookmarked": isBookmarked,
        "isCompleted": isCompleted,
        "updatedDate": updatedDate,
        "updatedTime": updatedTime,
        "isEdited": isEdited,
      };
}

List<ToDoModel> todoList = [];
