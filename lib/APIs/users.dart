class Users{
  final int id;
  final String title;
  final String body;

  Users({
    required this.id,
    required this.title,
    required this.body,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json['id'],
    title: json['title'],
    body: json['body'],
  );
}