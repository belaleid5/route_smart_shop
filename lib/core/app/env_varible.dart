import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvType { dev, prod }

class EnvVariable {
  EnvVariable._();

  static EnvVariable instance = EnvVariable._();

   String _envType = '';
  Future<void> init(EnvType envType) async {
    // Load environment variables here if needed
    switch (envType) {
      case EnvType.dev:
        await dotenv.load(fileName: '.env.dev',);
      case EnvType.prod:
        await dotenv.load(fileName: '.env.prod');
    }
    
    _envType = dotenv.get('ENV_TYPE',);
  }
  String get envType => _envType;
  bool get isDebugMode => _envType == 'development';
}
