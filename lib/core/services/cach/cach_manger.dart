import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CustomCacheManager {

  CustomCacheManager._();
  static const String _cacheKey = 'customCacheKey';

  static final CustomCacheManager instance = CustomCacheManager._();

  static final BaseCacheManager _cacheManager = CacheManager(
    Config(
      _cacheKey,
      stalePeriod: const Duration(seconds: 1000), 
      maxNrOfCacheObjects: 100,             
      repo: JsonCacheInfoRepository(databaseName: _cacheKey),
      fileService: HttpFileService(),
    ),
  );

  static BaseCacheManager get manager => _cacheManager;
}