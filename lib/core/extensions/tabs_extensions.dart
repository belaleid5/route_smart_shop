extension IterableX<T> on Iterable<T> {
  List<R> mapIndexed<R>(R Function(int index, T item) transform) {
    int i = 0;
    return map((item) => transform(i++, item)).toList();
  }
}