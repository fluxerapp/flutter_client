package com.fluxer

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.content.Intent
import android.content.pm.ServiceInfo
import android.os.Build
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.os.PowerManager
import androidx.core.app.NotificationCompat
import androidx.core.app.ServiceCompat
import io.flutter.FlutterInjector
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import org.unifiedpush.android.connector.FailedReason
import org.unifiedpush.android.connector.data.PushEndpoint
import org.unifiedpush.android.connector.data.PushMessage
import org.unifiedpush.flutter.connector.PLUGIN_ARG_ENDPOINT_KEY_AUTH
import org.unifiedpush.flutter.connector.PLUGIN_ARG_ENDPOINT_KEY_PUBKEY
import org.unifiedpush.flutter.connector.PLUGIN_ARG_ENDPOINT_TEMP
import org.unifiedpush.flutter.connector.PLUGIN_ARG_ENDPOINT_URL
import org.unifiedpush.flutter.connector.PLUGIN_ARG_INSTANCE
import org.unifiedpush.flutter.connector.PLUGIN_ARG_MESSAGE_CONTENT
import org.unifiedpush.flutter.connector.PLUGIN_ARG_MESSAGE_DECRYPTED
import org.unifiedpush.flutter.connector.PLUGIN_ARG_REASON
import org.unifiedpush.flutter.connector.PLUGIN_CALL_MESSAGE
import org.unifiedpush.flutter.connector.PLUGIN_CALL_NEW_ENDPOINT
import org.unifiedpush.flutter.connector.PLUGIN_CALL_REGISTRATION_FAILED
import org.unifiedpush.flutter.connector.PLUGIN_CALL_TEMP_UNAVAILABLE
import org.unifiedpush.flutter.connector.PLUGIN_CALL_UNREGISTERED
import org.unifiedpush.flutter.connector.PLUGIN_CHANNEL
import org.unifiedpush.flutter.connector.Plugin
import org.unifiedpush.flutter.connector.UnifiedPushService

class FluxerUnifiedPushService : UnifiedPushService() {
    private var bindCount = 0
    private var stopWhenUnbound = false

    override fun onCreate() {
        if (!mainEngineRunning) {
            if (backgroundEngine == null) {
                openBackgroundSession()
                startPushForeground()
                try {
                    getEngine(this)
                } catch (error: Exception) {
                    closeBackgroundSession()
                    throw error
                }
            } else {
                startPushForeground()
            }
            ensurePluginOnBackgroundEngine()
        }
        super.onCreate()
    }

    override fun onBind(intent: Intent?): IBinder? {
        bindCount += 1
        return super.onBind(intent)
    }

    override fun onUnbind(intent: Intent?): Boolean {
        bindCount = maxOf(bindCount - 1, 0)
        if (stopWhenUnbound && bindCount == 0 && !backgroundSessionOpen) {
            stopWhenUnbound = false
            stopSelf()
        }
        return super.onUnbind(intent)
    }

    override fun onDestroy() {
        if (activeService === this) {
            foregroundActive = false
            activeService = null
        }
        super.onDestroy()
    }

    override fun getEngine(context: Context): FlutterEngine {
        val cached = backgroundEngine
        if (cached != null) {
            return cached
        }
        val appContext = context.applicationContext ?: context
        val loader = FlutterInjector.instance().flutterLoader()
        loader.startInitialization(appContext)
        loader.ensureInitializationComplete(appContext, null)
        val engine = FlutterEngine(appContext)
        try {
            GeneratedPluginRegistrant.registerWith(engine)
            FluxerUnifiedPushBackgroundBridge.registerWith(engine)
            engine.localizationPlugin.sendLocalesToFlutter(
                appContext.resources.configuration,
            )
            engine.dartExecutor.executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault(),
                listOf("--unifiedpush-bg"),
            )
        } catch (error: Exception) {
            engine.destroy()
            throw error
        }
        backgroundEngine = engine
        return engine
    }

    override fun onMessage(message: PushMessage, instance: String) {
        if (deliverToBackgroundEngineIfActive(PLUGIN_CALL_MESSAGE, messagePayload(message, instance))) {
            return
        }
        super.onMessage(message, instance)
    }

    override fun onNewEndpoint(endpoint: PushEndpoint, instance: String) {
        if (
            deliverToBackgroundEngineIfActive(
                PLUGIN_CALL_NEW_ENDPOINT,
                endpointPayload(endpoint, instance),
            )
        ) {
            return
        }
        super.onNewEndpoint(endpoint, instance)
    }

    override fun onRegistrationFailed(reason: FailedReason, instance: String) {
        if (
            deliverToBackgroundEngineIfActive(
                PLUGIN_CALL_REGISTRATION_FAILED,
                mapOf(
                    PLUGIN_ARG_INSTANCE to instance,
                    PLUGIN_ARG_REASON to reason.name,
                ),
            )
        ) {
            return
        }
        super.onRegistrationFailed(reason, instance)
    }

    override fun onUnregistered(instance: String) {
        if (
            deliverToBackgroundEngineIfActive(
                PLUGIN_CALL_UNREGISTERED,
                mapOf(PLUGIN_ARG_INSTANCE to instance),
            )
        ) {
            return
        }
        super.onUnregistered(instance)
    }

    override fun onTempUnavailable(instance: String) {
        if (
            deliverToBackgroundEngineIfActive(
                PLUGIN_CALL_TEMP_UNAVAILABLE,
                mapOf(PLUGIN_ARG_INSTANCE to instance),
            )
        ) {
            return
        }
        super.onTempUnavailable(instance)
    }

    private fun deliverToBackgroundEngineIfActive(
        method: String,
        data: Map<String, Any?>,
    ): Boolean {
        if (mainEngineRunning || backgroundEngine == null) {
            return false
        }
        enqueueOrDeliverFlutterEvent(method, data)
        return true
    }

    private fun startPushForeground() {
        activeService = this
        if (foregroundActive) {
            return
        }
        val type =
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                ServiceInfo.FOREGROUND_SERVICE_TYPE_DATA_SYNC
            } else {
                0
            }
        val started =
            runCatching {
                ServiceCompat.startForeground(
                    this,
                    FOREGROUND_NOTIFICATION_ID,
                    buildForegroundNotification(),
                    type,
                )
            }
        if (started.isSuccess) {
            foregroundActive = true
        }
        holdCpu(applicationContext)
    }

    private fun stopPushForeground() {
        if (!foregroundActive) {
            return
        }
        foregroundActive = false
        ServiceCompat.stopForeground(this, ServiceCompat.STOP_FOREGROUND_REMOVE)
    }

    private fun buildForegroundNotification(): Notification {
        val manager = getSystemService(NotificationManager::class.java)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O &&
            manager?.getNotificationChannel(FOREGROUND_CHANNEL_ID) == null
        ) {
            manager?.createNotificationChannel(
                NotificationChannel(
                    FOREGROUND_CHANNEL_ID,
                    FOREGROUND_CHANNEL_NAME,
                    NotificationManager.IMPORTANCE_MIN,
                ),
            )
        }
        return NotificationCompat.Builder(this, FOREGROUND_CHANNEL_ID)
            .setSmallIcon(R.drawable.fluxer_logo_monochrome)
            .setOngoing(true)
            .setSilent(true)
            .build()
    }

    private fun holdCpu(context: Context?) {
        val appContext = context?.applicationContext ?: return
        val lock =
            wakeLock
                ?: (appContext.getSystemService(POWER_SERVICE) as PowerManager)
                    .newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "fluxer:unifiedpush")
                    .also {
                        it.setReferenceCounted(false)
                        wakeLock = it
                    }
        if (!lock.isHeld) {
            lock.acquire()
        }
        handler.removeCallbacks(releaseCpu)
        handler.postDelayed(releaseCpu, CPU_HOLD_MS)
    }

    private fun requestStop() {
        if (bindCount == 0) {
            stopSelf()
            if (activeService === this) {
                activeService = null
            }
            return
        }
        stopWhenUnbound = true
    }

    companion object {
        private const val CPU_HOLD_MS = 30_000L
        private const val FOREGROUND_NOTIFICATION_ID = 0x75706e
        private const val FOREGROUND_CHANNEL_ID = "fluxer_unified_push"
        private const val FOREGROUND_CHANNEL_NAME = "Notifications"

        private val handler = Handler(Looper.getMainLooper())
        private val releaseCpu = Runnable {
            val lock = wakeLock
            if (lock != null && lock.isHeld) {
                lock.release()
            }
        }
        private val closeSession = Runnable { closeBackgroundSession() }
        private var backgroundEngine: FlutterEngine? = null
        private var wakeLock: PowerManager.WakeLock? = null
        private var mainEngineRunning = false
        private var foregroundActive = false
        private var backgroundSessionOpen = false
        private var dartBackgroundReady = false
        private val pendingFlutterEvents = ArrayDeque<UnifiedPushFlutterEvent>()
        private var activeService: FluxerUnifiedPushService? = null

        fun noteMainEngineStarted() {
            mainEngineRunning = true
            handler.postDelayed(
                {
                    if (mainEngineRunning) {
                        discardBackgroundEngine()
                    }
                },
                CPU_HOLD_MS,
            )
        }

        fun noteMainEngineStopped() {
            mainEngineRunning = false
            discardBackgroundEngine()
        }

        fun onDartBackgroundReady() {
            val batch = ArrayList<UnifiedPushFlutterEvent>()
            synchronized(pendingFlutterEvents) {
                dartBackgroundReady = true
                while (pendingFlutterEvents.isNotEmpty()) {
                    batch.add(pendingFlutterEvents.removeFirst())
                }
            }
            for (event in batch) {
                deliverFlutterEvent(event.method, event.data)
            }
        }

        fun onDartBackgroundFinished() {
            closeBackgroundSession()
        }

        private fun openBackgroundSession() {
            if (backgroundSessionOpen) {
                return
            }
            backgroundSessionOpen = true
            handler.removeCallbacks(closeSession)
            handler.postDelayed(closeSession, CPU_HOLD_MS)
        }

        private fun closeBackgroundSession() {
            if (!backgroundSessionOpen) {
                return
            }
            backgroundSessionOpen = false
            handler.removeCallbacks(closeSession)
            val service = activeService
            service?.stopPushForeground()
            discardBackgroundEngine()
            service?.requestStop()
        }

        private fun enqueueOrDeliverFlutterEvent(
            method: String,
            data: Map<String, Any?>,
        ) {
            synchronized(pendingFlutterEvents) {
                if (!dartBackgroundReady) {
                    pendingFlutterEvents.addLast(UnifiedPushFlutterEvent(method, data))
                    return
                }
            }
            deliverFlutterEvent(method, data)
        }

        private fun deliverFlutterEvent(
            method: String,
            data: Map<String, Any?>,
        ) {
            val engine = backgroundEngine ?: return
            handler.post {
                if (backgroundEngine !== engine) {
                    return@post
                }
                MethodChannel(engine.dartExecutor.binaryMessenger, PLUGIN_CHANNEL)
                    .invokeMethod(method, data)
            }
        }

        private fun ensurePluginOnBackgroundEngine() {
            val engine = backgroundEngine ?: return
            val registry = engine.plugins
            if (registry.get(Plugin::class.java) == null) {
                registry.add(Plugin())
            }
        }

        private fun discardBackgroundEngine() {
            if (backgroundSessionOpen) {
                return
            }
            val engine = backgroundEngine ?: return
            backgroundEngine = null
            dartBackgroundReady = false
            synchronized(pendingFlutterEvents) {
                pendingFlutterEvents.clear()
            }
            engine.destroy()
        }

        private fun messagePayload(
            message: PushMessage,
            instance: String,
        ): Map<String, Any?> =
            mapOf(
                PLUGIN_ARG_INSTANCE to instance,
                PLUGIN_ARG_MESSAGE_CONTENT to message.content,
                PLUGIN_ARG_MESSAGE_DECRYPTED to message.decrypted,
            )

        private fun endpointPayload(
            endpoint: PushEndpoint,
            instance: String,
        ): Map<String, Any?> =
            mapOf(
                PLUGIN_ARG_INSTANCE to instance,
                PLUGIN_ARG_ENDPOINT_URL to endpoint.url,
                PLUGIN_ARG_ENDPOINT_KEY_PUBKEY to endpoint.pubKeySet?.pubKey,
                PLUGIN_ARG_ENDPOINT_KEY_AUTH to endpoint.pubKeySet?.auth,
                PLUGIN_ARG_ENDPOINT_TEMP to endpoint.temporary,
            )
    }
}
