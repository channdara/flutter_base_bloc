
import 'flutter_base_bloc_platform_interface.dart';

class FlutterBaseBloc {
  Future<String?> getPlatformVersion() {
    return FlutterBaseBlocPlatform.instance.getPlatformVersion();
  }
}
