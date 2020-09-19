class Post {
  final String id;
  final String name;
  final String college;
  final String gender;

  Post({this.id, this.name, this.college, this.gender});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['_id'],
        name: json['name'],
        college: json['college'],
        gender: json['gender']);
  }
}
