package com.iho.iho_ar;

import android.app.Application;

import com.google.ar.sceneform.math.Vector3;
import com.iho.iho_ar.models.BoneModel;
import com.iho.iho_ar.models.BoneModelList;

public class IhoApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        initBoneModelList();
    }

    private void initBoneModelList(){
        BoneModelList.getInstance().addToBoneModelList(new BoneModel("Skull","This is a Skull",R.raw.skull, new Vector3(0,0,0)));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel("Bone","This is a bone",R.raw.bone, new Vector3(0,0,0.5f)));

    }
}
