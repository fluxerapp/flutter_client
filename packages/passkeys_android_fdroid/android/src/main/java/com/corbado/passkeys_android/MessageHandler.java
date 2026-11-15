package com.corbado.passkeys_android;

import android.app.Activity;
import android.app.KeyguardManager;
import android.content.Context;
import android.os.CancellationSignal;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.credentials.ClearCredentialStateRequest;
import androidx.credentials.CreateCredentialResponse;
import androidx.credentials.CreatePublicKeyCredentialRequest;
import androidx.credentials.CreateRestoreCredentialRequest;
import androidx.credentials.CreateRestoreCredentialResponse;
import androidx.credentials.Credential;
import androidx.credentials.CredentialManager;
import androidx.credentials.CredentialManagerCallback;
import androidx.credentials.GetCredentialRequest;
import androidx.credentials.GetCredentialResponse;
import androidx.credentials.GetPublicKeyCredentialOption;
import androidx.credentials.GetRestoreCredentialOption;
import androidx.credentials.PublicKeyCredential;
import androidx.credentials.RestoreCredential;
import androidx.credentials.SignalAllAcceptedCredentialIdsRequest;
import androidx.credentials.SignalCredentialStateRequest;
import androidx.credentials.SignalCredentialStateResponse;
import androidx.credentials.SignalUnknownCredentialRequest;
import androidx.credentials.exceptions.ClearCredentialException;
import androidx.credentials.exceptions.ClearCredentialProviderConfigurationException;
import androidx.credentials.exceptions.ClearCredentialUnsupportedException;
import androidx.credentials.exceptions.CreateCredentialCancellationException;
import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.exceptions.CreateCredentialNoCreateOptionException;
import androidx.credentials.exceptions.CreateCredentialProviderConfigurationException;
import androidx.credentials.exceptions.CreateCredentialUnsupportedException;
import androidx.credentials.exceptions.GetCredentialCancellationException;
import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.exceptions.GetCredentialProviderConfigurationException;
import androidx.credentials.exceptions.GetCredentialUnsupportedException;
import androidx.credentials.exceptions.NoCredentialException;
import androidx.credentials.exceptions.publickeycredential.CreatePublicKeyCredentialDomException;
import androidx.credentials.exceptions.publickeycredential.GetPublicKeyCredentialDomException;
import androidx.credentials.exceptions.publickeycredential.SignalCredentialStateException;
import androidx.credentials.exceptions.restorecredential.E2eeUnavailableException;

import com.corbado.passkeys_android.models.login.AllowCredentialType;
import com.corbado.passkeys_android.models.login.GetCredentialOptions;
import com.corbado.passkeys_android.models.signup.AuthenticatorSelectionType;
import com.corbado.passkeys_android.models.signup.CreateCredentialOptions;
import com.corbado.passkeys_android.models.signup.ExcludeCredentialType;
import com.corbado.passkeys_android.models.signup.PubKeyCredParamType;
import com.corbado.passkeys_android.models.signup.RelyingPartyType;
import com.corbado.passkeys_android.models.signup.UserType;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

public class MessageHandler implements Messages.PasskeysApi {

    private static final String TAG = "MessageHandler";
    private static final String SYNC_ACCOUNT_NOT_AVAILABLE_ERROR = "Sync account could not be accessed. If you are running on an emulator, please restart that device (select 'Could boot now').";
    private static final String MISSING_GOOGLE_SIGN_IN_ERROR = "Please sign in with a Google account first to create a new passkey.";
    private static final String EXCLUDE_CREDENTIALS_MATCH_ERROR = "You can not create a credential on this device because one of the excluded credentials exists on the local device.";
    private static final String MISSING_CREATION_OPTIONS = "Please make sure you enable a passwords or passkeys provider in your device settings.";
    private static final String TIMEOUT_ERROR = "Passkey operation timed out, please try again";
    private static final String PASSKEY_UNSUPPORTED_ERROR = "Passkeys are only supported on Android API 28 and above.";
    private static final String RESTORE_CREDENTIAL_UNSUPPORTED_ERROR = "Restore credentials are only supported on Android API 28 and above.";
    private static final String RESTORE_CREDENTIAL_PROVIDER_ERROR = "Restore credentials need Google Play services 24.22 or newer.";

    private final FlutterPasskeysPlugin plugin;

    private CancellationSignal currentCancellationSignal;

    public MessageHandler(FlutterPasskeysPlugin plugin) {
        this.plugin = plugin;
    }

    @Override
    public void canAuthenticate(@NonNull Messages.Result<Boolean> result) {
        Activity activity = plugin.requireActivity();
        KeyguardManager keyguardManager = activity.getSystemService(KeyguardManager.class);
        result.success(keyguardManager != null && keyguardManager.isDeviceSecure());
    }

    @Override
    public void hasPasskeySupport(@NonNull Messages.Result<Boolean> result) {
        // Passkeys are supported on Android API 28 (Android 9.0) and above
        boolean hasSupport = android.os.Build.VERSION.SDK_INT >= 28;
        result.success(hasSupport);
    }

    @Override
    public void register(
            @NonNull String challenge,
            @NonNull Messages.RelyingParty relyingParty,
            @NonNull Messages.User user,
            @Nullable Messages.AuthenticatorSelection authenticatorSelection,
            @Nullable List<Messages.PubKeyCredParam> pubKeyCredParams,
            @Nullable Long timeout,
            @Nullable String attestation,
            @NonNull List<Messages.ExcludeCredential> excludeCredentials,
            @Nullable String salt,
            @NonNull Messages.Result<Messages.RegisterResponse> result
            ) {
        if (android.os.Build.VERSION.SDK_INT < 28) {
            result.error(new Messages.FlutterError("android-passkey-unsupported", PASSKEY_UNSUPPORTED_ERROR, null));
            return;
        }

        try {
            JSONObject optionsJson = buildCreateCredentialOptions(challenge, relyingParty, user,
                    authenticatorSelection, pubKeyCredParams, timeout, attestation, excludeCredentials);
            addPrfExtension(optionsJson, salt);
            String options = optionsJson.toString();

            Activity activity = plugin.requireActivity();
            CredentialManager credentialManager = CredentialManager.create(activity);
            CreatePublicKeyCredentialRequest createPublicKeyCredentialRequest = new CreatePublicKeyCredentialRequest(
                    options);
            currentCancellationSignal = new CancellationSignal();
            credentialManager.createCredentialAsync(activity, createPublicKeyCredentialRequest,
                    currentCancellationSignal, Runnable::run,
                    new CredentialManagerCallback<CreateCredentialResponse, CreateCredentialException>() {

                        @Override
                        public void onResult(CreateCredentialResponse res) {
                            String resp = res.getData()
                                    .getString("androidx.credentials.BUNDLE_KEY_REGISTRATION_RESPONSE_JSON");
                            try {
                                result.success(parseRegisterResponse(resp));
                            } catch (JSONException e) {
                                Log.e(TAG, "Error parsing response: " + resp, e);
                                result.error(e);
                            }
                        }

                        @Override
                        public void onError(CreateCredentialException e) {
                            Exception platformException = e;
                            if (Objects.equals(e.getMessage(), "Unable to create key during registration")) {
                                // currently, Android throws this error when users skip the fingerPrint
                                // animation => we interpret this as a cancellation for now
                                platformException = new Messages.FlutterError("cancelled", e.getMessage(), "");
                            } else if (e instanceof CreateCredentialCancellationException) {
                                platformException = new Messages.FlutterError("cancelled", e.getMessage(), "");
                            // TODO: Refactor CreatePublicKeyCredentialDomException handling to use
                    //  ((CreatePublicKeyCredentialDomException) e).getDomError().getType()
                    //  instead of matching on e.getMessage() strings, which are fragile and
                    //  can change across Google Play Services versions.
                    //  See: https://www.corbado.com/blog/google-play-services-passkey-error-codes
                    } else if (e instanceof CreatePublicKeyCredentialDomException) {
                                if (Objects.equals(e.getMessage(), "User is unable to create passkeys.")) {
                                    platformException = new Messages.FlutterError("android-missing-google-sign-in",
                                            e.getMessage(), MISSING_GOOGLE_SIGN_IN_ERROR);
                                } else if (Objects.equals(e.getMessage(), "Unable to get sync account.")) {
                                    platformException = new Messages.FlutterError("android-sync-account-not-available",
                                            e.getMessage(), SYNC_ACCOUNT_NOT_AVAILABLE_ERROR);
                                } else if (e.getMessage() != null && e.getMessage().toLowerCase().contains("excluded credentials")) {
                                    // Match excluded credentials error by substring instead of exact match,
                                    // as the error message may vary across Android / Google Play Services versions.
                                    // Also handles TYPE_INVALID_STATE_ERROR with excluded credentials message.
                                    platformException = new Messages.FlutterError("exclude-credentials-match",
                                            e.getMessage(), EXCLUDE_CREDENTIALS_MATCH_ERROR);
                                } else if (Objects.equals(e.getMessage(), "[15] Flow has timed out.")) {
                                    platformException = new Messages.FlutterError("android-timeout", e.getMessage(),
                                            TIMEOUT_ERROR);
                                } else {
                                    platformException = new Messages.FlutterError("android-unhandled: " + e.getType(),
                                            e.getMessage(), e.getErrorMessage());
                                }
                            } else if (e instanceof CreateCredentialNoCreateOptionException) {
                                platformException = new Messages.FlutterError("android-no-create-option",
                                        e.getMessage(), MISSING_CREATION_OPTIONS);
                            } else {
                                platformException = new Messages.FlutterError("android-unhandled" + e.getType(),
                                        e.getMessage(), e.getErrorMessage());
                            }

                            result.error(platformException);
                        }
                    });
        } catch (JSONException e) {
            Log.e(TAG, "Error creating JSON", e);
            result.error(e);
        }
    }

    @Override
    public void authenticate(@NonNull String relyingPartyId, @NonNull String challenge, @Nullable Long timeout,
            @Nullable String userVerification, @Nullable List<Messages.AllowCredential> allowCredentials,
            @Nullable Boolean preferImmediatelyAvailableCredentials,
            @Nullable String salt,
            @NonNull Messages.Result<Messages.AuthenticateResponse> result) {
        if (android.os.Build.VERSION.SDK_INT < 28) {
            result.error(new Messages.FlutterError("android-passkey-unsupported", PASSKEY_UNSUPPORTED_ERROR, null));
            return;
        }

        try {
            JSONObject optionsJson = buildGetCredentialOptions(relyingPartyId, challenge, timeout, userVerification,
                    allowCredentials);
            addPrfExtension(optionsJson, salt);
            String options = optionsJson.toString();
            Activity activity = plugin.requireActivity();

            CredentialManager credentialManager = CredentialManager.create(activity);

            GetPublicKeyCredentialOption getPublicKeyCredentialOption = new GetPublicKeyCredentialOption(options);

            GetCredentialRequest.Builder builder = new GetCredentialRequest.Builder()
                    .addCredentialOption(getPublicKeyCredentialOption);

            if (preferImmediatelyAvailableCredentials != null) {
                builder.setPreferImmediatelyAvailableCredentials(preferImmediatelyAvailableCredentials);
            }

            GetCredentialRequest getCredRequest = builder.build();
            currentCancellationSignal = new CancellationSignal();

            credentialManager.getCredentialAsync(activity, getCredRequest, currentCancellationSignal, Runnable::run,
                    new CredentialManagerCallback<GetCredentialResponse, GetCredentialException>() {
                        @Override
                        public void onResult(GetCredentialResponse res) {
                            Credential credential = res.getCredential();
                            if (credential instanceof PublicKeyCredential) {
                                String responseJson = ((PublicKeyCredential) credential)
                                        .getAuthenticationResponseJson();
                                try {
                                    result.success(parseAuthenticateResponse(responseJson));
                                } catch (JSONException e) {
                                    Log.e(TAG, "Error parsing response: " + responseJson, e);
                                    result.error(e);
                                }
                            } else {
                                result.error(new Exception("Credential is of type " + credential.getClass().getName()
                                        + ", but should be of type PublicKeyCredential"));
                            }
                        }

                        @Override
                        public void onError(GetCredentialException e) {
                            Exception platformException = e;

                            // currently, Android throws this error when users skip the fingerPrint
                            // animation => we interpret this as a cancellation for now
                            if (Objects.equals(e.getMessage(),
                                    "None of the allowed credentials can be authenticated")) {
                                platformException = new Messages.FlutterError("cancelled", e.getMessage(), "");
                                Log.d(TAG, "onError called", e);
                            } else if (e instanceof GetCredentialCancellationException) {
                                platformException = new Messages.FlutterError("cancelled", e.getMessage(), "");
                                Log.d(TAG, "onError called", e);
                            } else if (e instanceof NoCredentialException) {
                                platformException = new Messages.FlutterError("android-no-credential", e.getMessage(),
                                        "");
                                Log.d(TAG, "onError called", e);
                            } else if (e instanceof GetPublicKeyCredentialDomException) {
                                if (Objects.equals(e.getMessage(), "Failed to decrypt credential.")) {
                                    platformException = new Messages.FlutterError("android-sync-account-not-available",
                                            e.getMessage(), SYNC_ACCOUNT_NOT_AVAILABLE_ERROR);
                                } else if (Objects.equals(e.getMessage(), "[15] Flow has timed out.")) {
                                    platformException = new Messages.FlutterError("android-timeout", e.getMessage(),
                                            TIMEOUT_ERROR);
                                } else {
                                    platformException = new Messages.FlutterError("android-unhandled: " + e.getType(),
                                            e.getMessage(), e.getErrorMessage());
                                }
                                Log.e(TAG, "onError called", e);
                            } else {
                                platformException = new Messages.FlutterError("android-unhandled: " + e.getType(),
                                        e.getMessage(), e.getErrorMessage());
                                Log.e(TAG, "onError called", e);
                            }

                            result.error(platformException);
                        }
                    });
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void cancelCurrentAuthenticatorOperation(@NonNull Messages.VoidResult result) {
        if (currentCancellationSignal != null) {
            currentCancellationSignal.cancel();
            currentCancellationSignal = null;
        }

        result.success();
    }

    @Override
    public void signalUnknownCredential(@NonNull String relyingPartyId, @NonNull String credentialId, @NonNull Messages.VoidResult result) {
        try {
            JSONObject requestJson = new JSONObject();
            requestJson.put("rpId", relyingPartyId);
            requestJson.put("credentialId", credentialId);
            signalCredentialState(new SignalUnknownCredentialRequest(requestJson.toString()), result);
        } catch (JSONException e) {
            result.error(e);
        }
    }

    @Override
    public void signalAllAcceptedCredentials(@NonNull String relyingPartyId, @NonNull String userId, @NonNull List<String> allAcceptedCredentialIds, @NonNull Messages.VoidResult result) {
        try {
            JSONObject requestJson = new JSONObject();
            requestJson.put("rpId", relyingPartyId);
            requestJson.put("userId", userId);
            requestJson.put("allAcceptedCredentialIds", new JSONArray(allAcceptedCredentialIds));
            signalCredentialState(new SignalAllAcceptedCredentialIdsRequest(requestJson.toString()), result);
        } catch (JSONException e) {
            result.error(e);
        }
    }

    private void signalCredentialState(SignalCredentialStateRequest request, @NonNull Messages.VoidResult result) {
        // The Signal API does not present any UI, so it can run without a
        // foreground activity (e.g. right after a backgrounded server response).
        CredentialManager credentialManager = CredentialManager.create(plugin.requireApplicationContext());
        credentialManager.signalCredentialStateAsync(request, Runnable::run,
                new CredentialManagerCallback<SignalCredentialStateResponse, SignalCredentialStateException>() {
                    @Override
                    public void onResult(SignalCredentialStateResponse res) {
                        result.success();
                    }

                    @Override
                    public void onError(SignalCredentialStateException e) {
                        result.error(new Messages.FlutterError("android-unhandled: " + e.getType(), e.getMessage(), null));
                    }
                });
    }

    @Override
    public void createRestoreCredential(
            @NonNull String challenge,
            @NonNull Messages.RelyingParty relyingParty,
            @NonNull Messages.User user,
            @Nullable Messages.AuthenticatorSelection authenticatorSelection,
            @Nullable List<Messages.PubKeyCredParam> pubKeyCredParams,
            @Nullable Long timeout,
            @Nullable String attestation,
            @NonNull List<Messages.ExcludeCredential> excludeCredentials,
            @NonNull Boolean isCloudBackupEnabled,
            @NonNull Messages.Result<Messages.RegisterResponse> result) {
        if (android.os.Build.VERSION.SDK_INT < 28) {
            result.error(new Messages.FlutterError("restore-credential-unsupported",
                    RESTORE_CREDENTIAL_UNSUPPORTED_ERROR, null));
            return;
        }

        final String options;
        try {
            options = buildCreateCredentialOptions(challenge, relyingParty, user, authenticatorSelection,
                    pubKeyCredParams, timeout, attestation, excludeCredentials).toString();
        } catch (JSONException e) {
            Log.e(TAG, "Error creating JSON", e);
            result.error(e);
            return;
        }

        createRestoreCredential(options, isCloudBackupEnabled, result);
    }

    private void createRestoreCredential(@NonNull String options, boolean isCloudBackupEnabled,
            @NonNull Messages.Result<Messages.RegisterResponse> result) {
        Context context = restoreCredentialContext();
        CredentialManager credentialManager = CredentialManager.create(context);
        CreateRestoreCredentialRequest request = new CreateRestoreCredentialRequest(options, isCloudBackupEnabled);

        credentialManager.createCredentialAsync(context, request, null, Runnable::run,
                new CredentialManagerCallback<CreateCredentialResponse, CreateCredentialException>() {
                    @Override
                    public void onResult(CreateCredentialResponse res) {
                        String responseJson = res instanceof CreateRestoreCredentialResponse
                                ? ((CreateRestoreCredentialResponse) res).getResponseJson()
                                : res.getData().getString(
                                        CreateRestoreCredentialResponse.BUNDLE_KEY_CREATE_RESTORE_CREDENTIAL_RESPONSE);
                        if (responseJson == null) {
                            result.error(new Messages.FlutterError("android-unhandled: " + res.getType(),
                                    "The restore credential response did not contain a registration response.", null));
                            return;
                        }
                        try {
                            result.success(parseRegisterResponse(responseJson));
                        } catch (JSONException e) {
                            Log.e(TAG, "Error parsing response: " + responseJson, e);
                            result.error(e);
                        }
                    }

                    @Override
                    public void onError(CreateCredentialException e) {
                        if (e instanceof E2eeUnavailableException && isCloudBackupEnabled) {
                            Log.d(TAG, "Cloud backup unavailable, creating a local restore credential", e);
                            createRestoreCredential(options, false, result);
                            return;
                        }

                        Log.e(TAG, "onError called", e);
                        if (e instanceof CreateCredentialUnsupportedException
                                || e instanceof CreateCredentialProviderConfigurationException) {
                            result.error(new Messages.FlutterError("restore-credential-unsupported",
                                    RESTORE_CREDENTIAL_PROVIDER_ERROR, e.getMessage()));
                            return;
                        }
                        result.error(new Messages.FlutterError("android-unhandled: " + e.getType(), e.getMessage(),
                                e.getErrorMessage()));
                    }
                });
    }

    @Override
    public void getRestoreCredential(@NonNull String relyingPartyId, @NonNull String challenge,
            @Nullable Long timeout, @Nullable String userVerification,
            @Nullable List<Messages.AllowCredential> allowCredentials,
            @NonNull Messages.Result<Messages.AuthenticateResponse> result) {
        if (android.os.Build.VERSION.SDK_INT < 28) {
            result.error(new Messages.FlutterError("restore-credential-unsupported",
                    RESTORE_CREDENTIAL_UNSUPPORTED_ERROR, null));
            return;
        }

        final String options;
        try {
            options = buildGetCredentialOptions(relyingPartyId, challenge, timeout, userVerification,
                    allowCredentials).toString();
        } catch (JSONException e) {
            Log.e(TAG, "Error creating JSON", e);
            result.error(e);
            return;
        }

        Context context = restoreCredentialContext();
        CredentialManager credentialManager = CredentialManager.create(context);
        GetCredentialRequest request = new GetCredentialRequest.Builder()
                .addCredentialOption(new GetRestoreCredentialOption(options))
                .build();

        credentialManager.getCredentialAsync(context, request, null, Runnable::run,
                new CredentialManagerCallback<GetCredentialResponse, GetCredentialException>() {
                    @Override
                    public void onResult(GetCredentialResponse res) {
                        Credential credential = res.getCredential();
                        if (credential instanceof RestoreCredential) {
                            String responseJson = ((RestoreCredential) credential).getAuthenticationResponseJson();
                            try {
                                result.success(parseAuthenticateResponse(responseJson));
                            } catch (JSONException e) {
                                Log.e(TAG, "Error parsing response: " + responseJson, e);
                                result.error(e);
                            }
                        } else {
                            result.error(new Exception("Credential is of type " + credential.getClass().getName()
                                    + ", but should be of type RestoreCredential"));
                        }
                    }

                    @Override
                    public void onError(GetCredentialException e) {
                        Exception platformException;
                        if (e instanceof NoCredentialException) {
                            platformException = new Messages.FlutterError("android-no-credential", e.getMessage(), "");
                            Log.d(TAG, "onError called", e);
                        } else if (e instanceof GetCredentialCancellationException) {
                            platformException = new Messages.FlutterError("cancelled", e.getMessage(), "");
                            Log.d(TAG, "onError called", e);
                        } else if (e instanceof GetCredentialUnsupportedException
                                || e instanceof GetCredentialProviderConfigurationException) {
                            platformException = new Messages.FlutterError("restore-credential-unsupported",
                                    RESTORE_CREDENTIAL_PROVIDER_ERROR, e.getMessage());
                            Log.e(TAG, "onError called", e);
                        } else {
                            platformException = new Messages.FlutterError("android-unhandled: " + e.getType(),
                                    e.getMessage(), e.getErrorMessage());
                            Log.e(TAG, "onError called", e);
                        }

                        result.error(platformException);
                    }
                });
    }

    @Override
    public void clearRestoreCredential(@NonNull Messages.VoidResult result) {
        if (android.os.Build.VERSION.SDK_INT < 28) {
            result.success();
            return;
        }

        CredentialManager credentialManager = CredentialManager.create(plugin.requireApplicationContext());
        ClearCredentialStateRequest request = new ClearCredentialStateRequest(
                ClearCredentialStateRequest.TYPE_CLEAR_RESTORE_CREDENTIAL);

        credentialManager.clearCredentialStateAsync(request, null, Runnable::run,
                new CredentialManagerCallback<Void, ClearCredentialException>() {
                    @Override
                    public void onResult(Void res) {
                        result.success();
                    }

                    @Override
                    public void onError(ClearCredentialException e) {
                        if (e instanceof ClearCredentialUnsupportedException
                                || e instanceof ClearCredentialProviderConfigurationException) {
                            Log.d(TAG, "Restore credentials unsupported, nothing to clear", e);
                            result.success();
                            return;
                        }
                        Log.e(TAG, "onError called", e);
                        result.error(new Messages.FlutterError("android-unhandled: " + e.getType(), e.getMessage(),
                                e.getErrorMessage()));
                    }
                });
    }

    private Context restoreCredentialContext() {
        try {
            return plugin.requireActivity();
        } catch (IllegalStateException e) {
            return plugin.requireApplicationContext();
        }
    }

    private static JSONObject buildCreateCredentialOptions(
            @NonNull String challenge,
            @NonNull Messages.RelyingParty relyingParty,
            @NonNull Messages.User user,
            @Nullable Messages.AuthenticatorSelection authenticatorSelection,
            @Nullable List<Messages.PubKeyCredParam> pubKeyCredParams,
            @Nullable Long timeout,
            @Nullable String attestation,
            @NonNull List<Messages.ExcludeCredential> excludeCredentials) throws JSONException {
        UserType userType = new UserType(user.getName(), user.getDisplayName(), user.getId(), user.getIcon());
        RelyingPartyType relyingPartyType = new RelyingPartyType(relyingParty.getId(), relyingParty.getName());
        AuthenticatorSelectionType authSelectionType = null;
        if (authenticatorSelection != null) {
            authSelectionType = new AuthenticatorSelectionType(
                    authenticatorSelection.getAuthenticatorAttachment(), authenticatorSelection.getRequireResidentKey(),
                    authenticatorSelection.getResidentKey(), authenticatorSelection.getUserVerification());
        }
        List<PubKeyCredParamType> pubKeyCredParamsType = new ArrayList<>();
        if (pubKeyCredParams != null) {
            pubKeyCredParamsType = pubKeyCredParams.stream().map(p -> new PubKeyCredParamType(p.getType(), p.getAlg()))
                    .collect(Collectors.toList());
        }
        final List<ExcludeCredentialType> excludeCredentialsType = excludeCredentials.stream()
                .map(c -> new ExcludeCredentialType(c.getType(), c.getId())).collect(Collectors.toList());

        CreateCredentialOptions createCredentialOptions = new CreateCredentialOptions(
                challenge,
                relyingPartyType,
                userType,
                pubKeyCredParamsType,
                timeout,
                authSelectionType,
                attestation,
                excludeCredentialsType);

        return createCredentialOptions.toJSON();
    }

    private static JSONObject buildGetCredentialOptions(@NonNull String relyingPartyId, @NonNull String challenge,
            @Nullable Long timeout, @Nullable String userVerification,
            @Nullable List<Messages.AllowCredential> allowCredentials) throws JSONException {
        List<AllowCredentialType> allowCredentialsType = new ArrayList<>();
        if (allowCredentials != null) {
            allowCredentialsType = allowCredentials.stream()
                    .map(c -> new AllowCredentialType(c.getType(), c.getId(), c.getTransports()))
                    .collect(Collectors.toList());
        }
        GetCredentialOptions getCredentialOptions = new GetCredentialOptions(challenge, timeout, relyingPartyId,
                allowCredentialsType, userVerification);
        return getCredentialOptions.toJSON();
    }

    private static void addPrfExtension(@NonNull JSONObject optionsJson, @Nullable String salt) throws JSONException {
        if (salt == null || salt.isEmpty()) {
            return;
        }

        JSONObject extensions = optionsJson.optJSONObject("extensions");
        if (extensions == null) extensions = new JSONObject();

        JSONObject prf = new JSONObject();
        JSONObject eval = new JSONObject();
        eval.put("first", salt);
        prf.put("eval", eval);

        extensions.put("prf", prf);
        optionsJson.put("extensions", extensions);
    }

    private static Messages.RegisterResponse parseRegisterResponse(@NonNull String responseJson) throws JSONException {
        JSONObject json = new JSONObject(responseJson);
        JSONObject response = json.getJSONObject("response");

        // Note: The "transports" field can be optional in the authenticator response.
        // While the WebAuthn spec
        // (https://www.w3.org/TR/webauthn-2/#dom-authenticatorattestationresponse-gettransports)
        // does not strictly specify that "transports" must be omitted, we have observed
        // several cases
        // where authenticators do not return it.
        List<String> typedTransports = new ArrayList<>();
        JSONArray transports = response.optJSONArray("transports");
        if (transports != null) {
            for (int i = 0; i < transports.length(); i++) {
                typedTransports.add(transports.getString(i));
            }
        } else {
            typedTransports.add("");
        }

        Map<String, Object> extMap = parsePrfExtensionResults(json);
        return new Messages.RegisterResponse.Builder()
                .setId(json.getString("id"))
                .setRawId(json.getString("rawId"))
                .setClientDataJSON(response.getString("clientDataJSON"))
                .setAttestationObject(response.getString("attestationObject"))
                .setTransports(typedTransports)
                .setClientExtensionResults(extMap)
                .build();
    }

    private static Messages.AuthenticateResponse parseAuthenticateResponse(@NonNull String responseJson)
            throws JSONException {
        final JSONObject json = new JSONObject(responseJson);
        final JSONObject response = json.getJSONObject("response");

        final String id = json.getString("id");
        final String rawId = json.getString("rawId");

        final String clientDataJSON = response.getString("clientDataJSON");
        // userHandle is optional because some authenticators may return it as a null
        // (exp: cross-platform QR between two android devices)
        final String userHandle = response.optString("userHandle");
        final String signature = response.getString("signature");
        final String authenticatorData = response.getString("authenticatorData");

        Map<String, Object> extMap = parsePrfExtensionResults(json);
        return new Messages.AuthenticateResponse.Builder()
                .setId(id).setRawId(rawId).setClientDataJSON(clientDataJSON)
                .setAuthenticatorData(authenticatorData)
                .setSignature(signature)
                .setClientExtensionResults(extMap)
                .setUserHandle(userHandle).build();
    }

    private static Map<String, Object> parsePrfExtensionResults(JSONObject json) {
        JSONObject ext = json.optJSONObject("clientExtensionResults");
        if (ext == null) {
            return null;
        }
        JSONObject prf = ext.optJSONObject("prf");
        if (prf == null) {
            return null;
        }

        Map<String, Object> prfMap = new HashMap<>();
        if (prf.has("enabled")) {
            prfMap.put("enabled", prf.optBoolean("enabled"));
        }
        JSONObject results = prf.optJSONObject("results");
        if (results != null && results.has("first")) {
            Map<String, Object> resultsMap = new HashMap<>();
            resultsMap.put("first", results.optString("first"));
            prfMap.put("results", resultsMap);
        }
        if (prfMap.isEmpty()) {
            return null;
        }

        Map<String, Object> extMap = new HashMap<>();
        extMap.put("prf", prfMap);
        return extMap;
    }
}
