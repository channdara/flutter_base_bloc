import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_base_bloc_platform_interface.dart';

/// An implementation of [FlutterBaseBlocPlatform] that uses method channels.
class MethodChannelFlutterBaseBloc extends FlutterBaseBlocPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_base_bloc');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
