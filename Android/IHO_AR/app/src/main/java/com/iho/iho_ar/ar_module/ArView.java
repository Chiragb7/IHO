package com.iho.iho_ar.ar_module;

import com.iho.iho_ar.models.BoneModel;

import java.util.List;

public interface ArView {
    void showPopup(String name, String description);
    void createNodes(List<BoneModel> boneModelList);
    void createRenderables(List<BoneModel> boneModelList);
}
