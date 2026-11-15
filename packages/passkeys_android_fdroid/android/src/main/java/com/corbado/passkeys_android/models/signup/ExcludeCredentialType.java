package com.corbado.passkeys_android.models.signup;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.List;

public class ExcludeCredentialType {
    private String type;
    private String id;
    public ExcludeCredentialType(String type, String id) {
        this.type = type;
        this.id = id;
    }

    public JSONObject toJSON() {
        HashMap<String, String> map = new HashMap<>();
        if (type != null) map.put("type", type);
        if (id != null) map.put("id", id);

        return new JSONObject(map);
    }
}
