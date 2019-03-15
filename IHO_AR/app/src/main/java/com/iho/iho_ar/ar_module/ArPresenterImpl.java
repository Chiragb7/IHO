package com.iho.iho_ar.ar_module;

import com.iho.iho_ar.models.BoneModel;
import com.iho.iho_ar.models.BoneModelList;

import java.util.List;

public class ArPresenterImpl implements ArPresenter {
    private ArView arView;

    ArPresenterImpl(ArView arView) {
        this.arView = arView;
    }

    @Override
    public void onDestroy() {
        arView = null;
    }

    @Override
    public void createNodes() {
        arView.createNodes(getBoneModelList());
    }

    @Override
    public boolean renderablesReady() {
        for(BoneModel model: getBoneModelList()){
            if(model.getRenderable()==null)
                return false;
        }
        return true;
    }

    @Override
    public void createRenderables() {
        arView.createRenderables(getBoneModelList());
    }

    private List<BoneModel> getBoneModelList() {
        return BoneModelList.getInstance().getBoneModelList();
    }

    @Override
    public void createPopup(String name, String description) {
        arView.showPopup(name, description);
    }
}
