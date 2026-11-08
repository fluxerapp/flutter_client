package com.fluxer

import com.google.android.play.agesignals.AgeSignalsAccessRequest
import com.google.android.play.agesignals.AgeSignalsException
import com.google.android.play.agesignals.AgeSignalsManager
import com.google.android.play.agesignals.AgeSignalsManagerFactory
import com.google.android.play.agesignals.AgeSignalsRequest
import com.google.android.play.agesignals.model.AgeRangeSource
import com.google.android.play.agesignals.model.AgeSignalsErrorCode
import com.google.android.play.agesignals.model.AgeSignalsStatus
import com.google.android.play.core.integrity.IntegrityManagerFactory
import com.google.android.play.core.integrity.StandardIntegrityException
import com.google.android.play.core.integrity.StandardIntegrityManager.PrepareIntegrityTokenRequest
import com.google.android.play.core.integrity.StandardIntegrityManager.StandardIntegrityTokenProvider
import com.google.android.play.core.integrity.StandardIntegrityManager.StandardIntegrityTokenRequest
import com.google.android.play.core.integrity.model.StandardIntegrityErrorCode
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

internal const val AGE_STATUS_SHARING = "sharing"
internal const val AGE_STATUS_DECLINED = "declined"
internal const val AGE_STATUS_PLAY_STORE_ACTION_REQUIRED = "play_store_action_required"
internal const val AGE_STATUS_NOT_INSTALLED_FROM_PLAY = "not_installed_from_play"
internal const val AGE_STATUS_UNAVAILABLE = "unavailable"
internal const val INTEGRITY_ERROR_TRANSIENT = "transient"
internal const val INTEGRITY_ERROR_UNAVAILABLE = "unavailable"

internal fun ageRangeSourceWireValue(source: Int?): String? =
    when (source) {
        AgeRangeSource.TIER_A -> "tier_a"
        AgeRangeSource.TIER_B -> "tier_b"
        AgeRangeSource.TIER_C -> "tier_c"
        AgeRangeSource.TIER_D -> "tier_d"
        else -> null
    }

internal fun ageAccessStatusPayload(status: Int?): Map<String, Any>? =
    when (status) {
        AgeSignalsStatus.SHARED -> null
        AgeSignalsStatus.VERIFICATION_REQUIRED -> mapOf("status" to AGE_STATUS_PLAY_STORE_ACTION_REQUIRED)
        else -> mapOf("status" to AGE_STATUS_DECLINED)
    }

internal fun ageSignalsPayload(
    lower: Int?,
    upper: Int?,
    source: Int?,
): Map<String, Any> {
    if (lower == null) {
        return mapOf("status" to AGE_STATUS_DECLINED)
    }
    return buildMap {
        put("status", AGE_STATUS_SHARING)
        put("lowerBound", lower)
        upper?.let { put("upperBound", it) }
        ageRangeSourceWireValue(source)?.let { put("ageRangeSource", it) }
    }
}

internal fun ageSignalsErrorPayload(errorCode: Int?): Map<String, Any> =
    when (errorCode) {
        AgeSignalsErrorCode.APP_NOT_OWNED,
        AgeSignalsErrorCode.PLAY_STORE_NOT_FOUND,
        -> mapOf("status" to AGE_STATUS_NOT_INSTALLED_FROM_PLAY)
        else -> mapOf("status" to AGE_STATUS_UNAVAILABLE)
    }

internal fun integrityErrorCode(errorCode: Int?): String =
    when (errorCode) {
        StandardIntegrityErrorCode.NETWORK_ERROR,
        StandardIntegrityErrorCode.TOO_MANY_REQUESTS,
        StandardIntegrityErrorCode.GOOGLE_SERVER_UNAVAILABLE,
        StandardIntegrityErrorCode.CLIENT_TRANSIENT_ERROR,
        StandardIntegrityErrorCode.INTERNAL_ERROR,
        StandardIntegrityErrorCode.INTEGRITY_TOKEN_PROVIDER_INVALID,
        -> INTEGRITY_ERROR_TRANSIENT
        else -> INTEGRITY_ERROR_UNAVAILABLE
    }

class PlayAgeRangeBridge(
    private val activity: MainActivity,
) {
    private var tokenProvider: StandardIntegrityTokenProvider? = null

    fun register(flutterEngine: FlutterEngine) {
        val messenger = flutterEngine.dartExecutor.binaryMessenger
        MethodChannel(messenger, AGE_CHANNEL_NAME).setMethodCallHandler { call, result ->
            when (call.method) {
                METHOD_REQUEST -> requestAgeRange(result)
                else -> result.notImplemented()
            }
        }
        MethodChannel(messenger, INTEGRITY_CHANNEL_NAME).setMethodCallHandler { call, result ->
            when (call.method) {
                METHOD_PREPARE -> prepare(call, result)
                METHOD_REQUEST_TOKEN -> requestToken(call, result)
                else -> result.notImplemented()
            }
        }
    }

    private fun requestAgeRange(result: MethodChannel.Result) {
        if (activity.isFinishing || activity.isDestroyed) {
            result.success(mapOf("status" to AGE_STATUS_UNAVAILABLE))
            return
        }
        val manager = AgeSignalsManagerFactory.create(activity.applicationContext)
        val request = AgeSignalsAccessRequest.builder().setActivity(activity).build()
        manager
            .requestAgeSignalsAccess(request)
            .addOnSuccessListener { access ->
                val payload = ageAccessStatusPayload(access.ageSignalsStatus())
                if (payload != null) {
                    result.success(payload)
                } else {
                    checkAgeSignals(manager, result)
                }
            }.addOnFailureListener { error -> result.success(ageSignalsFailure(error)) }
    }

    private fun checkAgeSignals(
        manager: AgeSignalsManager,
        result: MethodChannel.Result,
    ) {
        manager
            .checkAgeSignals(AgeSignalsRequest.builder().build())
            .addOnSuccessListener { signals ->
                result.success(
                    ageSignalsPayload(
                        lower = signals.ageLower(),
                        upper = signals.ageUpper(),
                        source = signals.ageRangeSource(),
                    ),
                )
            }.addOnFailureListener { error -> result.success(ageSignalsFailure(error)) }
    }

    private fun ageSignalsFailure(error: Exception): Map<String, Any> =
        ageSignalsErrorPayload((error as? AgeSignalsException)?.errorCode)

    private fun prepare(
        call: MethodCall,
        result: MethodChannel.Result,
    ) {
        if (tokenProvider != null) {
            result.success(null)
            return
        }
        val projectNumber = call.argument<String>(ARG_CLOUD_PROJECT_NUMBER)?.toLongOrNull()
        if (projectNumber == null) {
            result.error(INTEGRITY_ERROR_UNAVAILABLE, null, null)
            return
        }
        val request =
            PrepareIntegrityTokenRequest
                .builder()
                .setCloudProjectNumber(projectNumber)
                .build()
        IntegrityManagerFactory
            .createStandard(activity.applicationContext)
            .prepareIntegrityToken(request)
            .addOnSuccessListener { provider ->
                tokenProvider = provider
                result.success(null)
            }.addOnFailureListener { error -> integrityFailure(error, result) }
    }

    private fun requestToken(
        call: MethodCall,
        result: MethodChannel.Result,
    ) {
        val provider = tokenProvider
        val requestHash = call.argument<String>(ARG_REQUEST_HASH)
        if (provider == null || requestHash.isNullOrEmpty()) {
            result.error(INTEGRITY_ERROR_UNAVAILABLE, null, null)
            return
        }
        val request =
            StandardIntegrityTokenRequest
                .builder()
                .setRequestHash(requestHash)
                .build()
        provider
            .request(request)
            .addOnSuccessListener { token -> result.success(token.token()) }
            .addOnFailureListener { error -> integrityFailure(error, result) }
    }

    private fun integrityFailure(
        error: Exception,
        result: MethodChannel.Result,
    ) {
        val errorCode = (error as? StandardIntegrityException)?.errorCode
        if (errorCode == StandardIntegrityErrorCode.INTEGRITY_TOKEN_PROVIDER_INVALID) {
            tokenProvider = null
        }
        result.error(integrityErrorCode(errorCode), null, null)
    }

    companion object {
        const val AGE_CHANNEL_NAME = "fluxer_app/declared_age_range"
        const val INTEGRITY_CHANNEL_NAME = "fluxer_app/play_integrity"
        const val METHOD_REQUEST = "request"
        const val METHOD_PREPARE = "prepare"
        const val METHOD_REQUEST_TOKEN = "requestToken"
        const val ARG_CLOUD_PROJECT_NUMBER = "cloudProjectNumber"
        const val ARG_REQUEST_HASH = "requestHash"
    }
}
