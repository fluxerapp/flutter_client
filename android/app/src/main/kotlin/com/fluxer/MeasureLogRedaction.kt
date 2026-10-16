package com.fluxer

private const val REDACTED_HOST = "instance"
private const val REDACTED_ID = ":id"
private const val REDACTED_VALUE = ":value"
private const val REDACTED_EMAIL = "email"

private val SEGMENTS_BEFORE_VALUE =
    setOf(
        "invite",
        "invites",
        "gift",
        "gifts",
        "template",
        "templates",
        "reactions",
        "vanity-url",
    )

private val FILE_EXTENSIONS =
    setOf(
        "aab",
        "apk",
        "arb",
        "cc",
        "cpp",
        "css",
        "dart",
        "db",
        "dll",
        "dylib",
        "exe",
        "framework",
        "gif",
        "html",
        "ipa",
        "java",
        "jpeg",
        "jpg",
        "js",
        "json",
        "kt",
        "log",
        "m4a",
        "mjs",
        "mov",
        "mp3",
        "mp4",
        "plist",
        "png",
        "so",
        "sqlite",
        "svg",
        "swift",
        "txt",
        "wasm",
        "webp",
        "xml",
        "yaml",
        "yml",
        "zip",
    )

private val ROUTE_WORD = Regex("^(?:[a-z][a-z-]*|@me|v\\d+)$")
private val DIGITS_ONLY = Regex("^\\d+$")
private val URL =
    Regex(
        """\b([a-z][a-z0-9+.\-]*)://([^\s/?#'"<>()\[\]{}|\\^`]+)([^\s?#'"<>()\[\]{}|\\^`]*)""" +
            """(?:\?[^\s#'"<>()]*)?(?:#[^\s'"<>()]*)?""",
        RegexOption.IGNORE_CASE,
    )
private val EMAIL =
    Regex(
        """[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}""",
        RegexOption.IGNORE_CASE,
    )
private val HOST_AFTER_LABEL =
    Regex(
        """(host lookup: '|address = |host: |CN=)([^\s',)/]+)""",
        RegexOption.IGNORE_CASE,
    )
private val IPV4 = Regex("""(?<![\d.])(?:\d{1,3}\.){3}\d{1,3}(?![\d.])""")
private val IPV6 =
    Regex(
        """(?<![\w.:])\[?(?=[0-9a-f:]*::)[0-9a-f]{0,4}(?::[0-9a-f]{0,4}){2,7}\]?(?![\w.:])""",
        RegexOption.IGNORE_CASE,
    )
private val HOSTNAME =
    Regex(
        """(?<![\w./@:\-])((?:[a-z0-9](?:[a-z0-9\-]{0,61}[a-z0-9])?\.)+[a-z][a-z0-9\-]{0,61}[a-z0-9])(?![\w(\[\-]|\.[\w])""",
        RegexOption.IGNORE_CASE,
    )
private val SNOWFLAKE = Regex("""(?<!\d)\d{15,20}(?!\d)""")

internal fun scrubPathForMeasure(path: String): String {
    val segments = path.split('/')
    val scrubbed = mutableListOf<String>()
    var previous: String? = null
    for (segment in segments) {
        when {
            segment.isEmpty() -> scrubbed.add(segment)
            previous != null && SEGMENTS_BEFORE_VALUE.contains(previous) -> scrubbed.add(REDACTED_VALUE)
            DIGITS_ONLY.matches(segment) -> scrubbed.add(REDACTED_ID)
            ROUTE_WORD.matches(segment) -> scrubbed.add(segment)
            else -> scrubbed.add(REDACTED_VALUE)
        }
        previous = segment
    }
    return scrubbed.joinToString("/")
}

internal fun scrubForMeasure(value: String): String {
    if (value.isEmpty()) {
        return value
    }
    var result =
        URL.replace(value) { match ->
            val scheme = match.groupValues[1].lowercase()
            val path = match.groupValues.getOrNull(3) ?: ""
            "$scheme://$REDACTED_HOST${scrubPathForMeasure(path)}"
        }
    result = EMAIL.replace(result, REDACTED_EMAIL)
    result =
        HOST_AFTER_LABEL.replace(result) { match ->
            "${match.groupValues[1]}$REDACTED_HOST"
        }
    result = IPV4.replace(result, REDACTED_HOST)
    result = IPV6.replace(result, REDACTED_HOST)
    result =
        HOSTNAME.replace(result) { match ->
            val host = match.groupValues[1]
            val lastLabel = host.substring(host.lastIndexOf('.') + 1)
            if (FILE_EXTENSIONS.contains(lastLabel)) {
                host
            } else {
                REDACTED_HOST
            }
        }
    return SNOWFLAKE.replace(result, REDACTED_ID)
}

internal fun redactThrowableForMeasure(error: Throwable): Throwable {
    val rawMessage = error.message?.takeIf { it.isNotEmpty() } ?: error.toString()
    val scrubbedMessage = scrubForMeasure(rawMessage)
    val redactedCause = error.cause?.let { redactThrowableForMeasure(it) }
    if (scrubbedMessage == rawMessage && redactedCause === error.cause) {
        return error
    }
    val redacted = Exception(scrubbedMessage, redactedCause)
    redacted.stackTrace = error.stackTrace
    return redacted
}
