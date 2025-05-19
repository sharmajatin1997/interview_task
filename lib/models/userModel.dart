class UserModel {
  String? name;
  String? email;
  String? password;
  String? image;
  String? uid;

  UserModel({
     this.name,
     this.password,
     this.email,
     this.image,
     this.uid,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];
    email = json['email'];
    image = json['image'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    void writeNotNull(String key, dynamic value) {
      if (value != null && value.toString().isNotEmpty) {
        data[key] = value;
      }
    }
    writeNotNull("name", name);
    writeNotNull("password", password);
    writeNotNull("email", email);
    writeNotNull("image", image);
    writeNotNull("email", email);
    writeNotNull("uid", uid);
    return data;



  }

}
