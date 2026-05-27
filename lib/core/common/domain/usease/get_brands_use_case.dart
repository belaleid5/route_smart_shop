import 'package:route_smart/core/common/domain/entites/brand_entity.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/core/usecase/usecase.dart';
import 'package:route_smart/features/home/domain/repo/brands_repository.dart';

class GetBrandsParams {
  final int page;
  final int limit;

  const GetBrandsParams({required this.page, required this.limit});
}

class GetBrandsUseCase
    implements UseCase<ApiResult<List<BrandEntity>>, GetBrandsParams> {
  final BrandsRepository _repository;

  const GetBrandsUseCase(this._repository);

  @override
  Future<ApiResult<List<BrandEntity>>> call(GetBrandsParams params) async {
    return await _repository.getBrands(
      page: params.page,
      limit: params.limit,
    );
  }
}