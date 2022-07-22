
class TaskModel {
  TaskModel({
      String? id, 
      String? title, 
      String? date, 
      String? startTime, 
      String? endTime, 
      String? reminder, 
      String? repeat,
      int? completed,
      int? favorite,
  }){
    _id = id;
    _title = title;
    _date = date;
    _startTime = startTime;
    _endTime = endTime;
    _reminder = reminder;
    _repeat = repeat;
    _completed = completed;
    _favorite = favorite;
}

  TaskModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _date = json['date'];
    _startTime = json['startTime'];
    _endTime = json['endTime'];
    _reminder = json['reminder'];
    _repeat = json['repeat'];
    _completed = json['completed'];
    _favorite = json['favorite'];
  }
  String? _id;
  String? _title;
  String? _date;
  String? _startTime;
  String? _endTime;
  String? _reminder;
  String? _repeat;
  int? _completed;
  int? _favorite;

  String? get id => _id;
  String? get title => _title;
  String? get date => _date;
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  String? get reminder => _reminder;
  String? get repeat => _repeat;
  int? get completed => _completed;
  int? get favorite => _favorite;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['date'] = _date;
    map['startTime'] = _startTime;
    map['endTime'] = _endTime;
    map['reminder'] = _reminder;
    map['repeat'] = _repeat;
    map['completed'] = _completed;
    map['favorite'] = _favorite;
    return map;
  }

}