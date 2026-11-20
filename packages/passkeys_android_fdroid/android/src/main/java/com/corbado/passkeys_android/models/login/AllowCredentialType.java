package com.corbado.passkeys_android.models.login;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import java.util.List;

public class AllowCredentialType {
    private String type;
    private String id;
    private List<String> transports;

    public AllowCredentialType(String type, String id, List<String> transports) {
        this.type = type;
        this.id = id;
        this.transports = transports;
    }

    public JSONObject toJSON() throws JSONException {
        JSONObject json = new JSONObject();
        if (type != null) json.put("type", type);
        if (id != null) json.put("id", id);
        if (transports != null) {
            json.put("transports", new JSONArray(transports));
        }

        return json;
    }
}
