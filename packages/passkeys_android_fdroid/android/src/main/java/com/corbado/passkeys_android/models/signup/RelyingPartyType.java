package com.corbado.passkeys_android.models.signup;

import org.json.JSONObject;

import java.util.HashMap;

public class RelyingPartyType {
    private String id;
    private String name;

    public RelyingPartyType(String id, String name) {
        this.id = id;
        this.name = name;
    }

    public JSONObject toJSON() {
        HashMap<String, String> map = new HashMap<>();
        if (name != null) map.put("name", name);
        if (id != null) map.put("id", id);
        return new JSONObject(map);
    }
}

