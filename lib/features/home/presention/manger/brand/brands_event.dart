sealed class BrandsEvent {
  const BrandsEvent();
}

final class GetBrandsEvent extends BrandsEvent {
  final int page;
  final int limit;

  const GetBrandsEvent({this.page = 1, this.limit = 10});
}

final class RefreshBrandsEvent extends BrandsEvent {
  const RefreshBrandsEvent();
}
