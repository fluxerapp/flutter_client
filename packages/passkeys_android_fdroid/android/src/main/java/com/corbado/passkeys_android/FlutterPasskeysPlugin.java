package com.corbado.passkeys_android;

import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.util.Log;

import androidx.annotation.NonNull;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;

public class FlutterPasskeysPlugin extends FlutterActivity implements FlutterPlugin, ActivityAware {
    private static final String TAG = "FlutterPasskeysPlugin";
    private BinaryMessenger binaryMessenger;
    private Context applicationContext;
    private Activity activity;

    public FlutterPasskeysPlugin() {
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        binaryMessenger = binding.getBinaryMessenger();
        applicationContext = binding.getApplicationContext();
        Messages.PasskeysApi.setUp(binaryMessenger, new MessageHandler(this));
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        Messages.PasskeysApi.setUp(binaryMessenger, null);
        binaryMessenger = null;
        applicationContext = null;
    }

    public Context requireApplicationContext() {
        if (applicationContext == null) throw new IllegalStateException("Application context not found");
        return applicationContext;
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        activity = binding.getActivity();
    }

    public Activity requireActivity() {
        if (activity == null) throw new IllegalStateException("Activity not found");
        return activity;
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        activity = null;
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        activity = binding.getActivity();
    }

    @Override
    public void onDetachedFromActivity() {
        activity = null;
    }
}