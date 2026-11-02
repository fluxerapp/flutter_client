package com.fluxer

import android.content.Context
import android.os.Handler
import android.os.Looper
import com.hiennv.flutter_callkit_incoming.CallkitNotificationService
import com.hiennv.flutter_callkit_incoming.FlutterCallkitIncomingPlugin
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.atomic.AtomicBoolean

private const val CHANNEL_NAME = "fluxer_app/voice_task_removed"
private const val METHOD_NOTIFY_TASK_REMOVED = "notifyTaskRemoved"
private const val METHOD_SET_WATCHER_ACTIVE = "setTaskRemovedWatcherActive"
private const val NATIVE_CLEANUP_FALLBACK_MS = 500L

internal const val VOICE_TASK_REMOVED_CHANNEL_NAME = CHANNEL_NAME
internal const val VOICE_TASK_REMOVED_NOTIFY_METHOD = METHOD_NOTIFY_TASK_REMOVED

internal fun endActiveCallKitSessionsForAppTaskRemoved(context: Context) {
    val appContext = context.applicationContext
    try {
        FlutterCallkitIncomingPlugin.getInstance()?.endAllCalls()
    } catch (_: Throwable) {
    }
    try {
        CallkitNotificationService.stopService(appContext)
    } catch (_: Throwable) {
    }
    VoiceTaskRemovedWatcherService.stop(appContext)
}

fun startVoiceTaskRemovedWatcher(context: Context) {
    VoiceTaskRemovedWatcherService.start(context.applicationContext)
}

fun stopVoiceTaskRemovedWatcher(context: Context) {
    VoiceTaskRemovedWatcherService.stop(context.applicationContext)
}

object VoiceTaskRemovedRegistry {
    private val handled = AtomicBoolean(false)

    @Volatile
    var bridge: VoiceTaskRemovedBridge? = null

    fun resetForNewVoiceSession() {
        handled.set(false)
    }

    fun notifyAppTaskRemoved(context: Context) {
        if (!handled.compareAndSet(false, true)) {
            return
        }
        val activeBridge = bridge
        if (activeBridge != null) {
            activeBridge.onAppTaskRemoved(skipNativeCleanup = false)
        } else {
            endActiveCallKitSessionsForAppTaskRemoved(context.applicationContext)
        }
    }
}

class VoiceTaskRemovedBridge(
    private val context: Context,
) {
    private var methodChannel: MethodChannel? = null
    private val mainHandler = Handler(Looper.getMainLooper())

    fun register(flutterEngine: FlutterEngine) {
        val channel =
            MethodChannel(
                flutterEngine.dartExecutor.binaryMessenger,
                CHANNEL_NAME,
            )
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                METHOD_SET_WATCHER_ACTIVE -> {
                    val active = call.argument<Boolean>("active") ?: false
                    if (active) {
                        VoiceTaskRemovedRegistry.resetForNewVoiceSession()
                        startVoiceTaskRemovedWatcher(context)
                    } else {
                        stopVoiceTaskRemovedWatcher(context)
                    }
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
        methodChannel = channel
    }

    fun onAppTaskRemoved(skipNativeCleanup: Boolean = false) {
        val channel = methodChannel
        val appContext = context.applicationContext
        if (channel == null) {
            if (!skipNativeCleanup) {
                endActiveCallKitSessionsForAppTaskRemoved(appContext)
            }
            return
        }
        var cleanedUp = skipNativeCleanup
        fun runNativeCleanupOnce() {
            if (cleanedUp) {
                return
            }
            cleanedUp = true
            endActiveCallKitSessionsForAppTaskRemoved(appContext)
        }
        val fallback = Runnable { runNativeCleanupOnce() }
        mainHandler.postDelayed(fallback, NATIVE_CLEANUP_FALLBACK_MS)
        channel.invokeMethod(
            METHOD_NOTIFY_TASK_REMOVED,
            null,
            object : MethodChannel.Result {
                override fun success(result: Any?) {
                    mainHandler.removeCallbacks(fallback)
                    runNativeCleanupOnce()
                }

                override fun error(
                    errorCode: String,
                    errorMessage: String?,
                    errorDetails: Any?,
                ) {
                    mainHandler.removeCallbacks(fallback)
                    runNativeCleanupOnce()
                }

                override fun notImplemented() {
                    mainHandler.removeCallbacks(fallback)
                    runNativeCleanupOnce()
                }
            },
        )
    }
}
