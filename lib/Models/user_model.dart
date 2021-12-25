class UserModel {
  String? uid;
  String? email;
  String? username;
  String? userType;

  UserModel({this.uid, this.email, this.username, this.userType});

  //receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        username: map['username'],
        userType: map['userType']);
  }

  UserModel.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        email = data['email'],
        username = data['username'],
        userType = data['userType'];

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'userType': userType,
    };
  }
}
