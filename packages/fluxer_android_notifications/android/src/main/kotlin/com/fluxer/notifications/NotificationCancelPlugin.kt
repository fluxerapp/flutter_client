package com.fluxer.notifications

import android.app.NotificationManager
import android.content.Context
import android.content.Intent
import android.graphics.BitmapFactory
import android.media.AudioManager
import android.os.Bundle
import android.service.notification.StatusBarNotification
import androidx.core.app.Person
import androidx.core.content.FileProvider
import androidx.core.content.pm.ShortcutInfoCompat
import androidx.core.content.pm.ShortcutManagerCompat
import androidx.core.graphics.drawable.IconCompat
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.math.BigInteger

class FluxerPushMediaProvider : FileProvider()

class NotificationCancelPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
    private var channel: MethodChannel? = null
    private var context: Context? = null

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext
        channel = MethodChannel(binding.binaryMessenger, CHANNEL_NAME).also {
            it.setMethodCallHandler(this)
        }
        onMessengerAttached?.invoke(binding.applicationContext, binding.binaryMessenger)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel?.setMethodCallHandler(null)
        channel = null
        context = null
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        val appContext = context
        if (appContext == null) {
            result.error("no_context", "notification cancel is unavailable", null)
            return
        }
        when (call.method) {
            METHOD_CANCEL_FOR_CHANNEL -> {
                val channelId = call.argument<String>(ARG_CHANNEL_ID)
                if (channelId.isNullOrEmpty()) {
                    result.error("invalid_args", "channelId is required", null)
                    return
                }
                val messageId = call.argument<String>(ARG_MESSAGE_ID)
                result.success(cancelForChannel(appContext, channelId, messageId))
            }
            METHOD_CANCEL_ALL -> {
                cancelAll(appContext)
                result.success(null)
            }
            METHOD_IS_NOTIFICATION_SOUND_SUPPRESSED -> {
                result.success(isNotificationSoundSuppressed(appContext))
            }
            METHOD_CONTENT_URI_FOR_IMAGE -> {
                result.success(call.argument<String>(ARG_PATH)?.let { contentUriForImage(appContext, it) })
            }
            METHOD_PUBLISH_CONVERSATION_SHORTCUT -> {
                val id = call.argument<String>(ARG_ID)
                val label = call.argument<String>(ARG_LABEL)
                if (id.isNullOrEmpty() || label.isNullOrEmpty()) {
                    result.success(false)
                    return
                }
                result.success(
                    publishConversationShortcut(
                        appContext,
                        id,
                        label,
                        call.argument<String>(ARG_ICON_PATH),
                    ),
                )
            }
            else -> result.notImplemented()
        }
    }

    companion object {
        @Volatile
        var onMessengerAttached: ((Context, BinaryMessenger) -> Unit)? = null

        const val CHANNEL_NAME = "fluxer_app/android_notifications"
        private const val METHOD_CANCEL_FOR_CHANNEL = "cancelForChannel"
        private const val METHOD_CANCEL_ALL = "cancelAll"
        private const val METHOD_IS_NOTIFICATION_SOUND_SUPPRESSED = "isNotificationSoundSuppressed"
        private const val METHOD_CONTENT_URI_FOR_IMAGE = "contentUriForImage"
        private const val METHOD_PUBLISH_CONVERSATION_SHORTCUT = "publishConversationShortcut"
        private const val ARG_CHANNEL_ID = "channelId"
        private const val ARG_MESSAGE_ID = "messageId"
        private const val ARG_PATH = "path"
        private const val ARG_ID = "id"
        private const val ARG_LABEL = "label"
        private const val ARG_ICON_PATH = "iconPath"
        private const val MEDIA_AUTHORITY_SUFFIX = ".fluxer_push_media"
        private const val SYSTEM_UI_PACKAGE = "com.android.systemui"
        private const val CONVERSATION_CATEGORY = "android.shortcut.conversation"
        private const val CONVERSATION_SHORTCUT_PREFIX = "channel:"
        private const val EXTRA_CHANNEL_ID = "channel_id"
        private const val EXTRA_TAG = "tag"
        private const val EXTRA_NOTIFICATION_TAG = "notification_tag"
        private const val EXTRA_URL = "url"
        private const val EXTRA_NAVIGATE = "navigate"
        private const val EXTRA_DATA = "data"

        fun cancelForChannel(
            context: Context,
            channelId: String,
            upToMessageId: String?,
        ): Int {
            val manager =
                context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager?
                    ?: return 0
            val channelTag = "channel:$channelId"
            val channelPrefix = "$channelTag:"
            val matched = mutableListOf<StatusBarNotification>()
            var unreadRemain = false
            for (status in manager.activeNotifications) {
                if (!notificationMatchesChannel(status, channelId, channelTag, channelPrefix)) {
                    continue
                }
                matched.add(status)
                val messageId = messageIdFromTag(status.tag, channelPrefix)
                if (!messageCoveredByAck(messageId, upToMessageId)) {
                    unreadRemain = true
                }
            }
            var cancelled = 0
            for (status in matched) {
                val messageId = messageIdFromTag(status.tag, channelPrefix)
                if (messageId == null) {
                    if (unreadRemain) {
                        continue
                    }
                } else if (!messageCoveredByAck(messageId, upToMessageId)) {
                    continue
                }
                manager.cancel(status.tag, status.id)
                cancelled++
            }
            return cancelled
        }

        private fun messageIdFromTag(tag: String?, channelPrefix: String): String? {
            if (tag == null || !tag.startsWith(channelPrefix) || tag.length == channelPrefix.length) {
                return null
            }
            return tag.substring(channelPrefix.length)
        }

        private fun messageCoveredByAck(messageId: String?, upToMessageId: String?): Boolean {
            if (upToMessageId.isNullOrEmpty()) {
                return true
            }
            if (messageId.isNullOrEmpty()) {
                return false
            }
            return try {
                BigInteger(messageId) <= BigInteger(upToMessageId)
            } catch (_: NumberFormatException) {
                messageId == upToMessageId
            }
        }

        private fun cancelAll(context: Context) {
            val manager =
                context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager?
            manager?.cancelAll()
            removeConversationShortcuts(context)
        }

        private fun contentUriForImage(context: Context, path: String): String? {
            return runCatching {
                val uri = FileProvider.getUriForFile(
                    context,
                    "${context.packageName}$MEDIA_AUTHORITY_SUFFIX",
                    File(path),
                )
                context.grantUriPermission(
                    SYSTEM_UI_PACKAGE,
                    uri,
                    Intent.FLAG_GRANT_READ_URI_PERMISSION,
                )
                uri.toString()
            }.getOrNull()
        }

        private fun publishConversationShortcut(
            context: Context,
            id: String,
            label: String,
            iconPath: String?,
        ): Boolean {
            return runCatching {
                val launchIntent = context.packageManager
                    .getLaunchIntentForPackage(context.packageName)
                    ?: return false
                val icon = iconPath
                    ?.let(BitmapFactory::decodeFile)
                    ?.let(IconCompat::createWithBitmap)
                val person = Person.Builder().setKey(id).setName(label).setIcon(icon).build()
                val shortcut = ShortcutInfoCompat.Builder(context, id)
                    .setShortLabel(label)
                    .setLongLived(true)
                    .setExcludedFromSurfaces(ShortcutInfoCompat.SURFACE_LAUNCHER)
                    .setCategories(setOf(CONVERSATION_CATEGORY))
                    .setPerson(person)
                    .setIntent(launchIntent)
                    .apply {
                        if (icon != null) {
                            setIcon(icon)
                        }
                    }
                    .build()
                ShortcutManagerCompat.pushDynamicShortcut(context, shortcut)
                true
            }.getOrDefault(false)
        }

        private fun removeConversationShortcuts(context: Context) {
            runCatching {
                val ids = ShortcutManagerCompat.getDynamicShortcuts(context)
                    .map { it.id }
                    .filter { it.startsWith(CONVERSATION_SHORTCUT_PREFIX) }
                ShortcutManagerCompat.removeLongLivedShortcuts(context, ids)
            }
        }

        private fun notificationMatchesChannel(
            status: StatusBarNotification,
            channelId: String,
            channelTag: String,
            channelPrefix: String,
        ): Boolean {
            val tag = status.tag
            if (tag == channelTag || (tag != null && tag.startsWith(channelPrefix))) {
                return true
            }
            val notification = status.notification
            if (notification != null && notification.group == channelTag) {
                return true
            }
            val extras = notification?.extras ?: return false
            if (extras.getString(EXTRA_CHANNEL_ID) == channelId) {
                return true
            }
            val dataTag = extras.getString(EXTRA_TAG)
            if (dataTag == channelTag || (dataTag != null && dataTag.startsWith(channelPrefix))) {
                return true
            }
            val notificationTag = extras.getString(EXTRA_NOTIFICATION_TAG)
            if (
                notificationTag == channelTag ||
                (notificationTag != null && notificationTag.startsWith(channelPrefix))
            ) {
                return true
            }
            val url = extras.getString(EXTRA_URL) ?: extras.getString(EXTRA_NAVIGATE)
            if (extractChannelIdFromPath(url) == channelId) {
                return true
            }
            return matchesNestedDataExtras(extras, channelId, channelTag, channelPrefix)
        }

        private fun matchesNestedDataExtras(
            extras: Bundle,
            channelId: String,
            channelTag: String,
            channelPrefix: String,
        ): Boolean {
            val nested = extras.getString(EXTRA_DATA) ?: return false
            if (extractJsonStringValue(nested, "channel_id") == channelId) {
                return true
            }
            val tag = extractJsonStringValue(nested, "tag")
            if (tag == channelTag || (tag != null && tag.startsWith(channelPrefix))) {
                return true
            }
            val notificationTag = extractJsonStringValue(nested, "notification_tag")
            if (
                notificationTag == channelTag ||
                (notificationTag != null && notificationTag.startsWith(channelPrefix))
            ) {
                return true
            }
            val urlChannelId =
                extractChannelIdFromPath(extractJsonStringValue(nested, "url"))
                    ?: extractChannelIdFromPath(extractJsonStringValue(nested, "navigate"))
            return urlChannelId == channelId
        }

        private fun extractJsonStringValue(json: String, key: String): String? {
            val pattern = Regex(""""${Regex.escape(key)}"\s*:\s*"([^"]+)"""")
            return pattern.find(json)?.groupValues?.getOrNull(1)
        }

        private fun extractChannelIdFromPath(path: String?): String? {
            if (path.isNullOrEmpty()) {
                return null
            }
            var normalized = path.trim()
            if (normalized.startsWith("http://") || normalized.startsWith("https://")) {
                val rest = normalized.substringAfter("://")
                val slash = rest.indexOf('/')
                normalized = if (slash < 0) "/" else rest.substring(slash)
            }
            if (!normalized.startsWith("/channels/")) {
                return null
            }
            val dmMessage = Regex("""^/channels/@me/([^/]+)""").find(normalized)
            if (dmMessage != null) {
                return dmMessage.groupValues.getOrNull(1)
            }
            val guildMessage = Regex("""^/channels/[^@/][^/]*/([^/]+)""").find(normalized)
            if (guildMessage != null) {
                val channelId = guildMessage.groupValues.getOrNull(1)
                if (channelId != null && channelId != "members") {
                    return channelId
                }
            }
            return null
        }

        private fun isNotificationSoundSuppressed(context: Context): Boolean {
            val manager =
                context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager?
                    ?: return false
            if (manager.currentInterruptionFilter != NotificationManager.INTERRUPTION_FILTER_ALL) {
                return true
            }
            val audio = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager?
                ?: return false
            return audio.ringerMode != AudioManager.RINGER_MODE_NORMAL
        }
    }
}
