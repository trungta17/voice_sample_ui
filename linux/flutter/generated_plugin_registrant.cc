//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <plover_platform_linux/plover_platform_linux_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) plover_platform_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "PloverPlatformLinuxPlugin");
  plover_platform_linux_plugin_register_with_registrar(plover_platform_linux_registrar);
}
