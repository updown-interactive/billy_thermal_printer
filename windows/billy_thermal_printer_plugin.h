#ifndef FLUTTER_PLUGIN_billy_thermal_printer_PLUGIN_H_
#define FLUTTER_PLUGIN_billy_thermal_printer_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace billy_thermal_printer {

class BillyThermalPrinterPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  BillyThermalPrinterPlugin();

  virtual ~BillyThermalPrinterPlugin();

  // Disallow copy and assign.
  BillyThermalPrinterPlugin(const BillyThermalPrinterPlugin&) = delete;
  BillyThermalPrinterPlugin& operator=(const BillyThermalPrinterPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace billy_thermal_printer

#endif  // FLUTTER_PLUGIN_billy_thermal_printer_PLUGIN_H_
