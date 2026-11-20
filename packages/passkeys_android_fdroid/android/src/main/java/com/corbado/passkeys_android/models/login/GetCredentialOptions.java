package com.corbado.passkeys_android.models.login;

import androidx.annotation.NonNull;

import com.corbado.passkeys_android.models.login.AllowCredentialType;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.List;

public class GetCredentialOptions {
    private String challenge;
    private Long timeout;
    private String rpId;
    private List<AllowCredentialType> allowCredentials;
    private String userVerification;

    public GetCredentialOptions(String challenge, Long timeout, String rpId, List<AllowCredentialType> allowCredentials, String userVerification) {
        this.challenge = challenge;
        this.timeout = timeout;
        this.rpId = rpId;
        this.allowCredentials = allowCredentials;
        this.userVerification = userVerification;
    }

    public JSONObject toJSON() throws JSONException {
        HashMap<String, Object> map = new HashMap<>();
        if (challenge != null) map.put("challenge", challenge);
        if (timeout != null) map.put("timeout", timeout);
        if (rpId != null) map.put("rpId", rpId);
        if (userVerification != null) map.put("userVerification", userVerification);
        JSONObject json = new JSONObject(map);
        if (allowCredentials != null) {
            json.put("allowCredentials", new JSONArray(allowCredentials.stream().map(e -> {
                try {
                    return e.toJSON();
                } catch (JSONException ex) {
                    throw new RuntimeException(ex);
                }
            }).toArray()));
        }

        return json;
    }
}
