class ExampleResponse {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  ExampleResponse({this.userId, this.id, this.title, this.completed});

  ExampleResponse.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }
}