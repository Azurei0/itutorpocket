class courseModuleModel {
  String? course;
  String? module;
  String? title;
  String? description;
  String? url;
  String? authoruid;
  String? authorname;

  courseModuleModel({
    this.course,
    this.module,
    this.title,
    this.description,
    this.url,
    this.authoruid,
    this.authorname,
  });

  //receiving data
  factory courseModuleModel.fromMap(map) {
    return courseModuleModel(
        course: map['course'],
        module: map['module'],
        title: map['title'],
        description: map['description'],
        url: map['url'],
        authoruid: map['authoruid'],
        authorname: map['authorname']);
  }

  Map<String, dynamic> toMap() {
    return {
      'course': course,
      'module': module,
      'title': title,
      'description': description,
      'url': url,
      'authoruid': authoruid,
      'authorname': authorname,
    };
  }
}
