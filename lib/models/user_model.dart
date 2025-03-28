class UserModel {
  UserModel({int? id, String? name, String? email}) {
    _id = id;
    _name = name;
    _email = email;
  }

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
  }

  int? _id;
  String? _name;
  String? _email;

  int? get id => _id;
  String? get title => _name;
  String? get body => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _name;
    map['body'] = _email;
    return map;
  }
}
