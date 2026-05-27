sealed class ApiResult<T> {
  const ApiResult();

  factory ApiResult.success(T data) => Success<T>(data);
  factory ApiResult.failure(String message) => Failure<T>(message);

  R map<R>({
    required R Function(T data) success,
    required R Function(String message) failure,
  }) {
    return switch (this) {
      Success<T>(:final data) => success(data),
      Failure<T>(:final message) => failure(message),
    };
  }

  R when<R>({
    required R Function(T data) success,
    required R Function(String message) failure,
  }) =>
      map(success: success, failure: failure);

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;
}

final class Success<T> extends ApiResult<T> {
  const Success(this.data);
  final T data;
}

final class Failure<T> extends ApiResult<T> {
  const Failure(this.message);
  final String message;
}