#include "include/billy_thermal_printer/billy_thermal_printer_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "billy_thermal_printer_plugin.h"

void BillyThermalPrinterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  billy_thermal_printer::BillyThermalPrinterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
