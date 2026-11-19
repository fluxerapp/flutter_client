package com.corbado.passkeys_android.models.signup;

import org.json.JSONObject;

import java.util.HashMap;

public class PubKeyCredParamType {
    private String type;
    private long alg;

    public PubKeyCredParamType(String type, long alg) {
        this.type = type;
        this.alg = alg;
    }

    public JSONObject toJSON() {
        HashMap<String, Object> map = new HashMap<>();
        if (type != null) map.put("type", type);
        map.put("alg", alg);
        return new JSONObject(map);
    }
}
