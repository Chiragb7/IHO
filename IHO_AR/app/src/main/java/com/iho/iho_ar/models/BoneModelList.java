package com.iho.iho_ar.models;

import java.util.ArrayList;
import java.util.List;

public class BoneModelList {
    private static BoneModelList instance;

    private List<BoneModel> boneModelList;

    public static BoneModelList getInstance() {
        if(instance == null)
            instance = new BoneModelList();
        return instance;
    }

    private BoneModelList() {
        boneModelList = new ArrayList<>();
    }

    public List<BoneModel> getBoneModelList() {
        return boneModelList;
    }

    public void addToBoneModelList(BoneModel boneModel) {
        if(boneModel!=null)
            boneModelList.add(boneModel);
    }
}
