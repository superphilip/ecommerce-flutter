abstract class Resource<T> {}

class Initial extends Resource {}

class Loading extends Resource {}

class Success<T> extends Resource<T> {
  final T data;
  final String? message;
  Success(this.data, this.message);
}

class Error<T> extends Resource<T> {
  final String message;
  Error(this.message);
}
