package com.fluxer

import java.net.HttpURLConnection
import java.net.URL

internal class HttpNotificationReplyPoster : NotificationReplyPoster {
    override fun post(request: NotificationReplyRequest): Boolean {
        val connection = (URL(request.url).openConnection() as HttpURLConnection)
        try {
            connection.requestMethod = "POST"
            connection.connectTimeout = TIMEOUT_MS
            connection.readTimeout = TIMEOUT_MS
            connection.doOutput = true
            connection.setRequestProperty("Authorization", request.authorization)
            connection.setRequestProperty("Content-Type", "application/json")
            connection.outputStream.use { output ->
                output.write(request.body.toByteArray(Charsets.UTF_8))
            }
            val code = connection.responseCode
            try {
                val stream = if (code in 200..299) {
                    connection.inputStream
                } else {
                    connection.errorStream
                }
                stream?.close()
            } catch (_: Exception) {
            }
            return code in 200..299
        } finally {
            connection.disconnect()
        }
    }

    private companion object {
        const val TIMEOUT_MS = 20_000
    }
}
