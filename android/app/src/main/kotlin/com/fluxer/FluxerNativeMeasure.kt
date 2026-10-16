package com.fluxer

import sh.measure.android.Measure
import sh.measure.android.attributes.AttributesBuilder

object FluxerNativeMeasure {
    private const val MAX_ATTRIBUTE_LENGTH = 256

    fun reportHandled(
        error: Throwable,
        source: String,
        context: String? = null,
    ) {
        val trimmedSource = source.trim()
        if (trimmedSource.isEmpty()) {
            return
        }
        val builder = AttributesBuilder().put("exception.source", trimmedSource)
        val trimmedContext = context?.trim()?.takeIf { it.isNotEmpty() }
        if (trimmedContext != null) {
            builder.put("exception.context", scrubAttribute(trimmedContext))
        }
        Measure.trackHandledException(redactThrowableForMeasure(error), builder.build())
    }

    fun reportHandled(
        source: String,
        message: String,
        context: String? = null,
    ) {
        val trimmedMessage = message.trim()
        if (trimmedMessage.isEmpty()) {
            return
        }
        reportHandled(IllegalStateException(trimmedMessage), source, context)
    }

    internal fun scrubAttribute(value: String): String {
        return scrubForMeasure(value).take(MAX_ATTRIBUTE_LENGTH)
    }
}
