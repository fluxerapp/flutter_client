package com.fluxer

object MainEngineState {
    @Volatile
    var visible = false
        private set

    private var started = false

    fun onEngineStarted() {
        started = true
    }

    fun onEngineStopped() {
        started = false
        visible = false
    }

    fun onActivityStarted() {
        visible = started
    }

    fun onActivityStopped() {
        visible = false
    }
}
