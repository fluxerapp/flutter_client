#include "include/fluxer_clipboard/fluxer_clipboard_plugin.h"

#include <gio/gio.h>
#include <gtk/gtk.h>

#include <string.h>

#include "messages.g.h"

typedef struct {
  FluxerClipboardClipboardHostApiResponseHandle* response_handle;
  GPtrArray* mime_types;
  gint64 limit;
  FlValue* items;
} ReadItemsRequest;

static GtkClipboard* system_clipboard() {
  return gtk_clipboard_get(GDK_SELECTION_CLIPBOARD);
}

static void read_items_request_finish(ReadItemsRequest* request) {
  fluxer_clipboard_clipboard_host_api_respond_read_items(
      request->response_handle, request->items);
  g_object_unref(request->response_handle);
  g_ptr_array_unref(request->mime_types);
  fl_value_unref(request->items);
  g_free(request);
}

static void append_item(ReadItemsRequest* request, const gchar* mime_type,
                        const gchar* name, const uint8_t* data,
                        size_t data_length, const gchar* path) {
  FluxerClipboardNativeClipboardItem* item =
      fluxer_clipboard_native_clipboard_item_new(mime_type, name, data,
                                                 data_length, path);
  fl_value_append_take(
      request->items,
      fl_value_new_custom_object_take(
          fluxer_clipboard_native_clipboard_item_type_id, G_OBJECT(item)));
}

static gboolean mime_matches(const gchar* pattern, const gchar* target) {
  if (g_str_has_suffix(pattern, "/*")) {
    g_autofree gchar* prefix = g_strndup(pattern, strlen(pattern) - 1);
    return g_str_has_prefix(target, prefix);
  }
  return g_strcmp0(pattern, target) == 0;
}

static gboolean is_text_like(const gchar* mime_type) {
  return g_str_has_prefix(mime_type, "text/") ||
         g_strcmp0(mime_type, "application/json") == 0 ||
         g_strcmp0(mime_type, "application/rtf") == 0;
}

static gboolean has_text_target(GdkAtom* targets, gint n_targets) {
  for (gint i = 0; i < n_targets; i++) {
    g_autofree gchar* name = gdk_atom_name(targets[i]);
    if (name != nullptr &&
        (g_str_has_prefix(name, "text/plain") ||
         g_strcmp0(name, "text/html") == 0 ||
         g_strcmp0(name, "UTF8_STRING") == 0 ||
         g_strcmp0(name, "STRING") == 0 || g_strcmp0(name, "TEXT") == 0)) {
      return TRUE;
    }
  }
  return FALSE;
}

static GdkAtom find_target(ReadItemsRequest* request, GdkAtom* targets,
                           gint n_targets, gchar** matched_mime) {
  gboolean has_text = has_text_target(targets, n_targets);
  for (guint i = 0; i < request->mime_types->len; i++) {
    const gchar* pattern =
        static_cast<const gchar*>(g_ptr_array_index(request->mime_types, i));
    if (has_text && is_text_like(pattern)) {
      continue;
    }
    for (gint j = 0; j < n_targets; j++) {
      g_autofree gchar* name = gdk_atom_name(targets[j]);
      if (name != nullptr && mime_matches(pattern, name)) {
        *matched_mime = g_strdup(name);
        return targets[j];
      }
    }
  }
  return GDK_NONE;
}

static gboolean has_target(GdkAtom* targets, gint n_targets,
                           const gchar* wanted) {
  for (gint i = 0; i < n_targets; i++) {
    g_autofree gchar* name = gdk_atom_name(targets[i]);
    if (g_strcmp0(name, wanted) == 0) {
      return TRUE;
    }
  }
  return FALSE;
}

typedef struct {
  ReadItemsRequest* request;
  gchar* mime_type;
} ContentsRequest;

static void on_contents_received(GtkClipboard* clipboard,
                                 GtkSelectionData* selection_data,
                                 gpointer user_data) {
  ContentsRequest* contents = static_cast<ContentsRequest*>(user_data);
  gint length = 0;
  const guchar* data = selection_data == nullptr
                           ? nullptr
                           : gtk_selection_data_get_data_with_length(
                                 selection_data, &length);
  if (data != nullptr && length > 0) {
    append_item(contents->request, contents->mime_type, nullptr, data,
                static_cast<size_t>(length), nullptr);
  }
  read_items_request_finish(contents->request);
  g_free(contents->mime_type);
  g_free(contents);
}

static void request_data_target(ReadItemsRequest* request, GdkAtom* targets,
                                gint n_targets) {
  gchar* mime_type = nullptr;
  GdkAtom target = find_target(request, targets, n_targets, &mime_type);
  if (target == GDK_NONE) {
    read_items_request_finish(request);
    return;
  }
  ContentsRequest* contents = g_new0(ContentsRequest, 1);
  contents->request = request;
  contents->mime_type = mime_type;
  gtk_clipboard_request_contents(system_clipboard(), target,
                                 on_contents_received, contents);
}

static gchar* mime_for_path(const gchar* path) {
  gboolean uncertain = FALSE;
  g_autofree gchar* content_type =
      g_content_type_guess(path, nullptr, 0, &uncertain);
  if (content_type == nullptr) {
    return nullptr;
  }
  return g_content_type_get_mime_type(content_type);
}

typedef struct {
  ReadItemsRequest* request;
  GdkAtom* targets;
  gint n_targets;
} UrisRequest;

static void on_uris_received(GtkClipboard* clipboard,
                             GtkSelectionData* selection_data,
                             gpointer user_data) {
  UrisRequest* uris_request = static_cast<UrisRequest*>(user_data);
  ReadItemsRequest* request = uris_request->request;
  g_auto(GStrv) uris = selection_data == nullptr
                           ? nullptr
                           : gtk_selection_data_get_uris(selection_data);
  for (gint i = 0; uris != nullptr && uris[i] != nullptr; i++) {
    if (static_cast<gint64>(fl_value_get_length(request->items)) >=
        request->limit) {
      break;
    }
    g_autofree gchar* path = g_filename_from_uri(uris[i], nullptr, nullptr);
    if (path == nullptr || !g_file_test(path, G_FILE_TEST_IS_REGULAR)) {
      continue;
    }
    g_autofree gchar* name = g_path_get_basename(path);
    g_autofree gchar* mime_type = mime_for_path(path);
    append_item(request, mime_type, name, nullptr, 0, path);
  }
  if (fl_value_get_length(request->items) > 0) {
    read_items_request_finish(request);
  } else {
    request_data_target(request, uris_request->targets,
                        uris_request->n_targets);
  }
  g_free(uris_request->targets);
  g_free(uris_request);
}

static void on_targets_received(GtkClipboard* clipboard, GdkAtom* targets,
                                gint n_targets, gpointer user_data) {
  ReadItemsRequest* request = static_cast<ReadItemsRequest*>(user_data);
  if (targets == nullptr || n_targets <= 0) {
    read_items_request_finish(request);
    return;
  }
  if (has_target(targets, n_targets, "text/uri-list")) {
    UrisRequest* uris_request = g_new0(UrisRequest, 1);
    uris_request->request = request;
    uris_request->targets =
        static_cast<GdkAtom*>(g_memdup2(targets, sizeof(GdkAtom) * n_targets));
    uris_request->n_targets = n_targets;
    gtk_clipboard_request_contents(clipboard,
                                   gdk_atom_intern_static_string("text/uri-list"),
                                   on_uris_received, uris_request);
    return;
  }
  request_data_target(request, targets, n_targets);
}

static void handle_read_items(
    FlValue* mime_types, int64_t max_items,
    FluxerClipboardClipboardHostApiResponseHandle* response_handle,
    gpointer user_data) {
  ReadItemsRequest* request = g_new0(ReadItemsRequest, 1);
  request->response_handle =
      FLUXER_CLIPBOARD_CLIPBOARD_HOST_API_RESPONSE_HANDLE(
          g_object_ref(response_handle));
  request->mime_types = g_ptr_array_new_with_free_func(g_free);
  request->limit = max_items;
  request->items = fl_value_new_list();
  size_t count = fl_value_get_length(mime_types);
  for (size_t i = 0; i < count; i++) {
    FlValue* value = fl_value_get_list_value(mime_types, i);
    if (fl_value_get_type(value) == FL_VALUE_TYPE_STRING) {
      g_ptr_array_add(request->mime_types,
                      g_ascii_strdown(fl_value_get_string(value), -1));
    }
  }
  if (max_items <= 0) {
    read_items_request_finish(request);
    return;
  }
  gtk_clipboard_request_targets(system_clipboard(), on_targets_received,
                                request);
}

static void on_text_received(GtkClipboard* clipboard, const gchar* text,
                             gpointer user_data) {
  FluxerClipboardClipboardHostApiResponseHandle* response_handle =
      FLUXER_CLIPBOARD_CLIPBOARD_HOST_API_RESPONSE_HANDLE(user_data);
  const gchar* value = text != nullptr && text[0] != '\0' ? text : nullptr;
  fluxer_clipboard_clipboard_host_api_respond_read_text(response_handle,
                                                        value);
  g_object_unref(response_handle);
}

static void handle_read_text(
    FluxerClipboardClipboardHostApiResponseHandle* response_handle,
    gpointer user_data) {
  gtk_clipboard_request_text(system_clipboard(), on_text_received,
                             g_object_ref(response_handle));
}

static FluxerClipboardClipboardHostApiVTable host_api_vtable = {
    .read_items = handle_read_items,
    .read_text = handle_read_text,
};

void fluxer_clipboard_plugin_register_with_registrar(
    FlPluginRegistrar* registrar) {
  fluxer_clipboard_clipboard_host_api_set_method_handlers(
      fl_plugin_registrar_get_messenger(registrar), nullptr, &host_api_vtable,
      nullptr, nullptr);
}
