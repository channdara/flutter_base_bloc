#include "include/flutter_base_bloc/flutter_base_bloc_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_base_bloc_plugin.h"

void FlutterBaseBlocPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_base_bloc::FlutterBaseBlocPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
