class UserModel {
  String id;
  String name;
  String cname;
  String email;
  String jvacant;
  String sneed;
  String cno;

  UserModel(
      {this.id,
      this.name,
      this.cname,
      this.email,
      this.jvacant,
      this.sneed,
      this.cno});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      cname: json['cname'] as String,
      email: json['email'] as String,
      jvacant: json['jvacant'] as String,
      sneed: json['sneed'] as String,
      cno: json['cno'] as String,
    );
  }

  Map<String, dynamic> toJsonAdd() {
    return {
      "name": name,
      "cname": cname,
      "email": email,
      "jvacant": jvacant,
      "sneed": sneed,
      "cno": cno,
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      "id": id,
      "name": name,
      "cname": cname,
      "email": email,
      "jvacant": jvacant,
      "sneed": sneed,
      "cno": cno,
    };
  }
}
