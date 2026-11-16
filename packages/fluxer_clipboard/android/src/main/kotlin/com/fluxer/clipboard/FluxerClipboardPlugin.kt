package com.fluxer.clipboard

import android.content.ClipData
import android.content.ClipboardManager
import android.content.ContentResolver
import android.content.Context
import android.net.Uri
import android.os.Handler
import android.os.Looper
import android.provider.OpenableColumns
import android.webkit.MimeTypeMap
import io.flutter.embedding.engine.plugins.FlutterPlugin
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors

class FluxerClipboardPlugin : FlutterPlugin, ClipboardHostApi {
    private var context: Context? = null
    private var executor: ExecutorService? = null
    private val mainHandler = Handler(Looper.getMainLooper())

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext
        executor = Executors.newSingleThreadExecutor()
        ClipboardHostApi.setUp(binding.binaryMessenger, this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        ClipboardHostApi.setUp(binding.binaryMessenger, null)
        executor?.shutdown()
        executor = null
        context = null
    }

    override fun readItems(
        mimeTypes: List<String>,
        maxItems: Long,
        callback: (Result<List<NativeClipboardItem>>) -> Unit,
    ) {
        val ctx = context
        val clip = ctx?.let(::primaryClip)
        val worker = executor
        if (ctx == null || clip == null || worker == null) {
            callback(Result.success(emptyList()))
            return
        }
        worker.execute {
            val items = runCatching {
                readClipItems(ctx.contentResolver, clip, mimeTypes, maxItems.toInt())
            }.getOrDefault(emptyList())
            mainHandler.post { callback(Result.success(items)) }
        }
    }

    override fun readText(callback: (Result<String?>) -> Unit) {
        val ctx = context
        val clip = ctx?.let(::primaryClip)
        val worker = executor
        if (ctx == null || clip == null || worker == null) {
            callback(Result.success(null))
            return
        }
        worker.execute {
            val text = runCatching { readClipText(ctx, clip) }.getOrNull()
            mainHandler.post { callback(Result.success(text)) }
        }
    }

    private fun primaryClip(ctx: Context): ClipData? {
        val manager = ctx.getSystemService(Context.CLIPBOARD_SERVICE) as? ClipboardManager
        return runCatching { manager?.primaryClip }.getOrNull()
    }

    private fun readClipItems(
        resolver: ContentResolver,
        clip: ClipData,
        mimeTypes: List<String>,
        limit: Int,
    ): List<NativeClipboardItem> {
        val result = mutableListOf<NativeClipboardItem>()
        for (index in 0 until clip.itemCount) {
            if (result.size >= limit) {
                break
            }
            val item = clip.getItemAt(index)
            val uri = item.uri ?: continue
            if (uri.scheme != ContentResolver.SCHEME_CONTENT) {
                continue
            }
            val name = displayName(resolver, uri)
            val mimeType = runCatching { resolver.getType(uri) }.getOrNull()?.lowercase()
                ?: mimeFromName(name)
            val hasText = !item.text.isNullOrEmpty() || !item.htmlText.isNullOrEmpty()
            if (hasText && (isTextLike(mimeType) || !matchesAny(mimeType, mimeTypes))) {
                continue
            }
            val data = runCatching {
                resolver.openInputStream(uri)?.use { it.readBytes() }
            }.getOrNull()
            if (data == null || data.isEmpty()) {
                continue
            }
            result.add(NativeClipboardItem(mimeType, name, data, null))
        }
        return result
    }

    private fun readClipText(ctx: Context, clip: ClipData): String? {
        for (index in 0 until clip.itemCount) {
            val item = clip.getItemAt(index)
            val text = item.text?.toString()
            if (!text.isNullOrEmpty()) {
                return text
            }
            val uri = item.uri ?: continue
            val mimeType = runCatching { ctx.contentResolver.getType(uri) }.getOrNull() ?: continue
            if (!mimeType.startsWith("text/")) {
                continue
            }
            val coerced = item.coerceToText(ctx)?.toString()
            if (!coerced.isNullOrEmpty()) {
                return coerced
            }
        }
        return null
    }

    private fun isTextLike(mimeType: String?): Boolean {
        if (mimeType == null) {
            return false
        }
        return mimeType.startsWith("text/") ||
            mimeType == "application/json" ||
            mimeType == "application/rtf"
    }

    private fun matchesAny(mimeType: String?, patterns: List<String>): Boolean {
        if (mimeType == null) {
            return false
        }
        return patterns.any { pattern ->
            val normalized = pattern.trim().lowercase()
            if (normalized.endsWith("/*")) {
                mimeType.startsWith(normalized.dropLast(1))
            } else {
                mimeType == normalized
            }
        }
    }

    private fun displayName(resolver: ContentResolver, uri: Uri): String? {
        return runCatching {
            resolver.query(uri, arrayOf(OpenableColumns.DISPLAY_NAME), null, null, null)?.use {
                if (it.moveToFirst()) it.getString(0) else null
            }
        }.getOrNull() ?: uri.lastPathSegment?.substringAfterLast('/')?.takeIf { it.contains('.') }
    }

    private fun mimeFromName(name: String?): String? {
        val extension = name?.substringAfterLast('.', "")?.lowercase()
        if (extension.isNullOrEmpty()) {
            return null
        }
        return MimeTypeMap.getSingleton().getMimeTypeFromExtension(extension)
    }
}
