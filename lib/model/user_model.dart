class UserMdel {
  String name;
  String email;
  int age;

  UserMdel({this.name, this.email, this.age});

  UserMdel.fromJson(Map<String, dynamic>json){
    name=json["name"];
    email = json["email"];
    age = json["age"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['age'] = this.age;
    return data;
  }
}