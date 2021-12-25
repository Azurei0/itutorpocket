class CPModel {
  String? course;
  String? uid;
  String? email;
  String? username;
  String? userType;

  CPModel({this.uid, this.email, this.username, this.userType});

  //receive data from server
  factory CPModel.fromMap(map) {
    return CPModel(
        uid: map['uid'],
        email: map['email'],
        username: map['username'],
        userType: map['userType']);
  }

  CPModel.fromData(Map<String, dynamic> data)
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
