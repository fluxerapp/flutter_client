package com.fluxer

import android.content.Context
import android.os.Handler
import android.os.Looper
import android.os.PowerManager
import io.flutter.FlutterInjector
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugins.GeneratedPluginRegistrant
import org.unifiedpush.flutter.connector.UnifiedPushService

class FluxerUnifiedPushService : UnifiedPushService() {
    override fun onCreate() {
        holdCpu(applicationContext)
        if (!mainEngineRunning && backgroundEngine == null) {
            getEngine(this)
        }
        super.onCreate()
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

    companion object {
        private const val CPU_HOLD_MS = 30_000L
        private val handler = Handler(Looper.getMainLooper())
        private val releaseCpu = Runnable {
            val lock = wakeLock
            if (lock != null && lock.isHeld) {
                lock.release()
            }
        }
        private var backgroundEngine: FlutterEngine? = null
        private var wakeLock: PowerManager.WakeLock? = null
        private var mainEngineRunning = false

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

        private fun discardBackgroundEngine() {
            val engine = backgroundEngine ?: return
            backgroundEngine = null
            engine.destroy()
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
    }
}
