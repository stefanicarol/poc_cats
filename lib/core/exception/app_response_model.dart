enum Status { loading, completed, error, data }

class AppResponse<T> {
  Status? status;
  T? body;
  String? message;

  AppResponse({this.status, this.body, this.message});

  AppResponse.loading({required this.message}) : status = Status.loading;

  AppResponse.data() : status = Status.data;

  AppResponse.error(this.message) : status = Status.error;

  AppResponse.completed(this.body, {required this.message})
      : status = Status.completed;

  bool get hasError => status == Status.error;

  bool get noData => status == Status.data;

  bool get isLoading => status == Status.loading;

  bool get isCompleted => status == Status.completed;
}
