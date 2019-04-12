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
        BoneModelList.getInstance().addToBoneModelList(new BoneModel("Hand",getResources().getString(R.string.right_hand),R.raw.button2,
                new Vector3(-0.9f,1.3f,0), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel("Foot",getResources().getString(R.string.left_foot),
                R.raw.button2, new Vector3(0.345f,0,0), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel("Knee",getResources().getString(R.string.right_knee),
                R.raw.button2, new Vector3(-0.2f,0.4f,0), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel("Arm",getResources().getString(R.string.right_arm),
                R.raw.button2, new Vector3(-0.3f,1.3f,0), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel("Arm",getResources().getString(R.string.left_arm),
                R.raw.button2, new Vector3(0.275f,1.3f,0), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel("Thigh",getResources().getString(R.string.left_thigh),
                R.raw.button2, new Vector3(0.2f,0.6f,0), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel("Spine",getResources().getString(R.string.spine),
                R.raw.button2, new Vector3(0f,1f,-0.11f), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel("Jaw",getResources().getString(R.string.jaw),
                R.raw.button2, new Vector3(0.02f,1.335f,0.03f), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel("Skull",getResources().getString(R.string.head),
                R.raw.button2, new Vector3(0,1.55f,-0.05f), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel("Hip",getResources().getString(R.string.hip_bone),
                R.raw.button2, new Vector3(0.145f,0.81f,-0.05f), buttonScale));
    }
}
