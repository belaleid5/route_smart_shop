abstract interface class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

final class NoParams {
  const NoParams();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is NoParams;
  }

  @override
  int get hashCode => runtimeType.hashCode;
}