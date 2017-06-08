package me.ilvc.wenda.model;

public class Verification {
    private Integer id;

    private String key;

    private String value;

    public Verification(Integer id, String key, String value) {
        this.id = id;
        this.key = key;
        this.value = value;
    }

    public Verification() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key == null ? null : key.trim();
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value == null ? null : value.trim();
    }
}