package com.corbado.passkeys_android.models.signup;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;

public class AuthenticatorSelectionType {
    private final String authenticatorAttachment;
    private final boolean requireResidentKey;
    private final String residentKey;
    private final String userVerification;

    public AuthenticatorSelectionType(String authenticatorAttachment, boolean requireResidentKey, String residentKey, String userVerification) {
        this.authenticatorAttachment = authenticatorAttachment;
        this.requireResidentKey = requireResidentKey;
        this.residentKey = residentKey;
        this.userVerification = userVerification;
    }

    public JSONObject toJSON() throws JSONException {
        JSONObject json = new JSONObject();
        if (authenticatorAttachment != null) {
            json.put("authenticatorAttachment", authenticatorAttachment);
        }
        json.put("requireResidentKey", requireResidentKey);
        if (residentKey != null) {
            json.put("residentKey", residentKey);
        }
        if (userVerification != null) {
            json.put("userVerification", userVerification);
        }

        return json;
    }
}
