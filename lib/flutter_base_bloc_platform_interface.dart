import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_base_bloc_method_channel.dart';

abstract class FlutterBaseBlocPlatform extends PlatformInterface {
  /// Constructs a FlutterBaseBlocPlatform.
  FlutterBaseBlocPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterBaseBlocPlatform _instance = MethodChannelFlutterBaseBloc();

  /// The default instance of [FlutterBaseBlocPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterBaseBloc].
  static FlutterBaseBlocPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterBaseBlocPlatform] when
  /// they register themselves.
  static set instance(FlutterBaseBlocPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
