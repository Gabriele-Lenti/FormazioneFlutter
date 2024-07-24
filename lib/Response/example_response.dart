
class ExampleResponse {
  late int userId;
  late int id;
  late String title;
  late bool completed;

  ExampleResponse({required this.userId, required this.id, required this.title, required this.completed});

  ExampleResponse.fromJson(dynamic response) {
    userId = response['userId'];
    id = response['id'];
    title = response['title'];
    completed = response['completed'];
  }
}

