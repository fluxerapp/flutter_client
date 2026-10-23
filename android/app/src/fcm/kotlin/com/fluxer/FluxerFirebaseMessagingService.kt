package com.fluxer

import com.google.firebase.messaging.FirebaseMessagingService

class FluxerFirebaseMessagingService : FirebaseMessagingService() {
    override fun onNewToken(token: String) {
        io.flutter.plugins.firebase.messaging.FlutterFirebaseTokenLiveData
            .getInstance()
            .postToken(token)
    }
}
