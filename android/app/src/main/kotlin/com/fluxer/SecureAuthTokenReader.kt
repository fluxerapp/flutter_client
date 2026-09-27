package com.fluxer

import android.content.Context
import com.it_nomads.fluttersecurestorage.FlutterSecureStorage
import com.it_nomads.fluttersecurestorage.FlutterSecureStorageConfig
import com.it_nomads.fluttersecurestorage.SecurePreferencesCallback
import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit
import java.util.concurrent.atomic.AtomicReference

internal class SecureAuthTokenReader(
    context: Context,
) : NotificationReplyAccountLookup {
    private val appContext = context.applicationContext

    override fun read(userId: String): NotificationReplyAccount? {
        if (userId.isEmpty()) {
            return null
        }
        synchronized(lock) {
            return readLocked(userId)
        }
    }

    private fun readLocked(userId: String): NotificationReplyAccount? {
        val storage = storage() ?: return null
        val token = readValue(storage, "$AUTH_TOKEN_KEY_PREFIX$userId")
        val apiBaseUrl = readValue(storage, "$AUTH_API_BASE_KEY_PREFIX$userId")
        if (token.isNullOrEmpty() || apiBaseUrl.isNullOrEmpty()) {
            return null
        }
        return NotificationReplyAccount(token = token, apiBaseUrl = apiBaseUrl)
    }

    private fun storage(): FlutterSecureStorage? {
        cached?.let { return it }
        val created = FlutterSecureStorage(appContext)
        if (!initialize(created)) {
            return null
        }
        cached = created
        return created
    }

    private fun initialize(storage: FlutterSecureStorage): Boolean {
        val done = CountDownLatch(1)
        val ok = AtomicReference(false)
        storage.initialize(
            FlutterSecureStorageConfig(secureStorageOptions()),
            object : SecurePreferencesCallback<Void> {
                override fun onSuccess(result: Void?) {
                    ok.set(true)
                    done.countDown()
                }

                override fun onError(e: Exception) {
                    done.countDown()
                }
            },
        )
        if (!done.await(READ_TIMEOUT_SECONDS, TimeUnit.SECONDS)) {
            return false
        }
        return ok.get()
    }

    private fun readValue(storage: FlutterSecureStorage, key: String): String? {
        val storedKey = storage.addPrefixToKey(key)
        if (!storage.containsKey(storedKey)) {
            return null
        }
        val done = CountDownLatch(1)
        val value = AtomicReference<String?>(null)
        storage.read(
            storedKey,
            object : SecurePreferencesCallback<String> {
                override fun onSuccess(result: String?) {
                    value.set(result)
                    done.countDown()
                }

                override fun onError(e: Exception) {
                    done.countDown()
                }
            },
        )
        if (!done.await(READ_TIMEOUT_SECONDS, TimeUnit.SECONDS)) {
            return null
        }
        return value.get()
    }

    private companion object {
        const val AUTH_TOKEN_KEY_PREFIX = "auth_token_"
        const val AUTH_API_BASE_KEY_PREFIX = "auth_api_base_"
        const val READ_TIMEOUT_SECONDS = 15L
        val lock = Any()
        var cached: FlutterSecureStorage? = null

        fun secureStorageOptions(): HashMap<String, Any> {
            val options = HashMap<String, Any>()
            options["resetOnError"] = "false"
            options["migrateOnAlgorithmChange"] = "true"
            options["migrateWithBackup"] = "false"
            options["enforceBiometrics"] = "false"
            options["requireBiometricsPerOperation"] = "false"
            options["keyCipherAlgorithm"] = "RSA_ECB_OAEPwithSHA_256andMGF1Padding"
            options["storageCipherAlgorithm"] = "AES_GCM_NoPadding"
            options["biometricType"] = "biometricOrDeviceCredential"
            options["requireBiometricConfirmation"] = "true"
            return options
        }
    }
}
