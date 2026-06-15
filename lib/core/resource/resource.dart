sealed class Resource<T> {
  const Resource();
}

final class Success<T> extends Resource<T> {
  final T data;
  final String? message;

  const Success({required this.data, this.message});
}

final class Error<T> extends Resource<T> {
  final String message;

  const Error({required this.message});
}
