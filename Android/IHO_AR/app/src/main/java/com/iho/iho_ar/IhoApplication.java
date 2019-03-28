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
        Vector3 buttonScale = new Vector3(0.1f,0.1f,0.1f);
        BoneModelList.getInstance().addToBoneModelList(new BoneModel("Lucy","",R.raw.lucy,
                new Vector3(0,0,0), false));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel("Button","",R.raw.button2,
                new Vector3(-0.9f,1.3f,0), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel("Foot","Left Foot",
                R.raw.button2, new Vector3(0.345f,0,0), buttonScale));
    }
}
