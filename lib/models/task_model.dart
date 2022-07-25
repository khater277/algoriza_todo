
class TaskModel {
  TaskModel({
      String? id, 
      String? title, 
      String? completeDate,
      String? date,
      String? startTime,
      String? endTime, 
      String? reminder,
      int? completed,
      int? favorite,
      int? color,
  }){
    _id = id;
    _title = title;
    _completeDate = completeDate;
    _date = date;
    _startTime = startTime;
    _endTime = endTime;
    _reminder = reminder;
    _completed = completed;
    _favorite = favorite;
    _color = color;
}

  TaskModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _completeDate = json['completeDate'];
    _date = json['date'];
    _startTime = json['startTime'];
    _endTime = json['endTime'];
    _reminder = json['reminder'];
    _completed = json['completed'];
    _favorite = json['favorite'];
    _color = json['color'];
  }
  String? _id;
  String? _title;
  String? _completeDate;
  String? _date;
  String? _startTime;
  String? _endTime;
  String? _reminder;
  int? _completed;
  int? _favorite;
  int? _color;

  String? get id => _id;
  String? get title => _title;
  String? get completeDate => _completeDate;
  String? get date => _date;
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  String? get reminder => _reminder;
  int? get completed => _completed;
  int? get favorite => _favorite;
  int? get color => _color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['completeDate'] = _completeDate;
    map['date'] = _date;
    map['startTime'] = _startTime;
    map['endTime'] = _endTime;
    map['reminder'] = _reminder;
    map['completed'] = _completed;
    map['favorite'] = _favorite;
    map['color'] = _color;
    return map;
  }

}