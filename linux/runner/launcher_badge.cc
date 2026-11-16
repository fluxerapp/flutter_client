#include "launcher_badge.h"

#include <gio/gio.h>

static gint64 launcher_badge_count = 0;
static FlMethodChannel* launcher_badge_channel = nullptr;

static void launcher_badge_emit(gint64 count) {
  GApplication* application = g_application_get_default();
  if (application == nullptr) {
    return;
  }
  GDBusConnection* connection =
      g_application_get_dbus_connection(application);
  const gchar* object_path = g_application_get_dbus_object_path(application);
  if (connection == nullptr || object_path == nullptr) {
    return;
  }
  g_autofree gchar* app_uri =
      g_strdup_printf("application://%s.desktop", APPLICATION_ID);
  GVariantBuilder properties;
  g_variant_builder_init(&properties, G_VARIANT_TYPE("a{sv}"));
  g_variant_builder_add(&properties, "{sv}", "count",
                        g_variant_new_int64(count));
  g_variant_builder_add(&properties, "{sv}", "count-visible",
                        g_variant_new_boolean(count > 0));
  g_autoptr(GError) error = nullptr;
  if (!g_dbus_connection_emit_signal(
          connection, nullptr, object_path, "com.canonical.Unity.LauncherEntry",
          "Update", g_variant_new("(sa{sv})", app_uri, &properties), &error)) {
    g_warning("Failed to update launcher badge: %s", error->message);
  }
}

static void launcher_badge_method_call_cb(FlMethodChannel* channel,
                                          FlMethodCall* method_call,
                                          gpointer user_data) {
  g_autoptr(FlMethodResponse) response = nullptr;
  if (g_strcmp0(fl_method_call_get_name(method_call), "setCount") != 0) {
    response = FL_METHOD_RESPONSE(fl_method_not_implemented_response_new());
  } else {
    FlValue* args = fl_method_call_get_args(method_call);
    FlValue* value = args != nullptr &&
                             fl_value_get_type(args) == FL_VALUE_TYPE_MAP
                         ? fl_value_lookup_string(args, "count")
                         : nullptr;
    gint64 count = value != nullptr &&
                           fl_value_get_type(value) == FL_VALUE_TYPE_INT
                       ? fl_value_get_int(value)
                       : 0;
    if (count < 0) {
      count = 0;
    }
    if (count != launcher_badge_count) {
      launcher_badge_count = count;
      launcher_badge_emit(count);
    }
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  }
  fl_method_call_respond(method_call, response, nullptr);
}

void launcher_badge_register(FlView* view) {
  g_clear_object(&launcher_badge_channel);
  FlEngine* engine = fl_view_get_engine(view);
  g_autoptr(FlStandardMethodCodec) codec = fl_standard_method_codec_new();
  launcher_badge_channel = fl_method_channel_new(
      fl_engine_get_binary_messenger(engine), "fluxer_app/desktop_badge",
      FL_METHOD_CODEC(codec));
  fl_method_channel_set_method_call_handler(
      launcher_badge_channel, launcher_badge_method_call_cb, nullptr, nullptr);
}
