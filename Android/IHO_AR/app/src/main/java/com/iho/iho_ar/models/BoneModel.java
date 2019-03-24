package com.iho.iho_ar.models;

import com.google.ar.sceneform.math.Vector3;
import com.google.ar.sceneform.rendering.Renderable;

public class BoneModel {
    private String name;
    private String description;
    private int resId;
    private Renderable renderable;
    private Vector3 position;
    private boolean isClickable;

    public BoneModel(String name, String description, int id, Vector3 position) {
        this.name = name;
        this.description = description;
        this.resId = id;
        this.position = position;
        this.isClickable = true;
    }

    public BoneModel(String name, String description, int id, Vector3 position, boolean isClickable) {
        this.name = name;
        this.description = description;
        this.resId = id;
        this.position = position;
        this.isClickable = isClickable;
    }

    public boolean isClickable() {
        return isClickable;
    }

    public void setClickable(boolean clickable) {
        isClickable = clickable;
    }

    public Vector3 getPosition() {
        return position;
    }

    public void setPosition(Vector3 position) {
        this.position = position;
    }

    public Renderable getRenderable() {
        return renderable;
    }

    public void setRenderable(Renderable renderable) {
        this.renderable = renderable;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getResId() {
        return resId;
    }

    public void setResId(int resId) {
        this.resId = resId;
    }
}
