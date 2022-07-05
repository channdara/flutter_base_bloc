#import "FlutterBaseBlocPlugin.h"
#if __has_include(<flutter_base_bloc/flutter_base_bloc-Swift.h>)
#import <flutter_base_bloc/flutter_base_bloc-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_base_bloc-Swift.h"
#endif

@implementation FlutterBaseBlocPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterBaseBlocPlugin registerWithRegistrar:registrar];
}
@end
