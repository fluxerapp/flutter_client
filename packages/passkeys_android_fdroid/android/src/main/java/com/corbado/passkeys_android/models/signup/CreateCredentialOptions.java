package com.corbado.passkeys_android.models.signup;


import androidx.annotation.NonNull;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.List;

public class CreateCredentialOptions {
    private RelyingPartyType rp;
    private UserType user;
    private String challenge;
    private List<PubKeyCredParamType> pubKeyCredParams;
    private Long timeout;
    private AuthenticatorSelectionType authenticatorSelection;
    private String attestation;

    private List<ExcludeCredentialType> excludeCredentials;

    public CreateCredentialOptions(
            String challenge,
            RelyingPartyType rp,
            UserType user,
            List<PubKeyCredParamType> pubKeyCredParams,
            Long timeout,
            AuthenticatorSelectionType authenticatorSelection,
            String attestation,
            List<ExcludeCredentialType> excludeCredentials
    ) {
        this.challenge = challenge;
        this.rp = rp;
        this.user = user;
        this.pubKeyCredParams = pubKeyCredParams;
        this.timeout = timeout;
        this.authenticatorSelection = authenticatorSelection;
        this.attestation = attestation;
        this.excludeCredentials = excludeCredentials;
    }

    public JSONObject toJSON() throws JSONException {
        JSONObject json = new JSONObject();
        if (rp != null) json.put("rp", rp.toJSON());
        if (user != null) json.put("user", user.toJSON());
        if (challenge != null) json.put("challenge", challenge);
        if (attestation != null) json.put("attestation", attestation);
        if (timeout != null) json.put("timeout", timeout);
        if (pubKeyCredParams != null)
            json.put("pubKeyCredParams", new JSONArray(pubKeyCredParams.stream().map(PubKeyCredParamType::toJSON).toArray()));
        if (authenticatorSelection != null)
            json.put("authenticatorSelection", authenticatorSelection.toJSON());
        if (excludeCredentials != null)
            json.put("excludeCredentials", new JSONArray(excludeCredentials.stream().map(ExcludeCredentialType::toJSON).toArray()));

        return json;
    }
}

