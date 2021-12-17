class CPModel {
  String? course;
  String? uid;
  String? email;
  String? username;

  CPModel({this.uid, this.email, this.username});

  //receive data from server
  factory CPModel.fromMap(map) {
    return CPModel(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': email, 'username': username};
  }
}
