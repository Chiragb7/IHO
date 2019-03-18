package com.iho.iho_ar.ar_module;

import com.iho.iho_ar.models.BoneModel;

import java.util.List;

public interface ArPresenter {
    void onDestroy();
    void createNodes();
    boolean renderablesReady();
    void createRenderables();
    void createPopup(String name, String description);
}
