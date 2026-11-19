package com.corbado.passkeys_android.models.signup;

import org.json.JSONObject;

import java.io.Serializable;
import java.util.HashMap;

public class UserType implements Serializable {
    private String name;
    private String displayName;
    private String id;
    private String icon;

    public UserType(String name, String displayName, String id, String icon) {
        this.name = name;
        this.displayName = displayName;
        this.id = id;
        this.icon = icon;
    }

    public JSONObject toJSON() {
        HashMap<String, String> map = new HashMap<>();
        if (name != null) map.put("name", name);
        if (icon != null) map.put("icon", icon);
        if (displayName != null) map.put("displayName", displayName);
        if (id != null) map.put("id", id);
        return new JSONObject(map);
    }
}
