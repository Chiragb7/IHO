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
        Vector3 buttonScale = new Vector3(0.05f,0.05f,0.05f);
        BoneModelList.getInstance().addToBoneModelList(new BoneModel(getResources().getString(R.string.lucy_title),"",R.raw.lucy,
                new Vector3(0,0,0), false));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel(getResources().getString(R.string.hand_title),getResources().getString(R.string.right_hand),R.raw.button2,
                new Vector3(-0.9f,1.35f,-0.06f), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel(getResources().getString(R.string.foot_title),getResources().getString(R.string.left_foot),
                R.raw.button2, new Vector3(0.345f,0.02f,0.125f), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel( getResources().getString(R.string.knee_title),getResources().getString(R.string.right_knee),
                R.raw.button2, new Vector3(-0.2f,0.45f,0), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel(getResources().getString(R.string.rArm_title),getResources().getString(R.string.right_arm),
                R.raw.button2, new Vector3(-0.3f,1.35f,-0.065f), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel(getResources().getString(R.string.lArm_title),getResources().getString(R.string.left_arm),
                R.raw.button2, new Vector3(0.275f,1.35f,-0.065f), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel(getResources().getString(R.string.thigh_title),getResources().getString(R.string.left_thigh),
                R.raw.button2, new Vector3(0.2f,0.6f,-0.045f), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel(getResources().getString(R.string.spine_title),getResources().getString(R.string.spine),
                R.raw.button2, new Vector3(0.02f,1f,-0.065f), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel(getResources().getString(R.string.jaw_title),getResources().getString(R.string.jaw),
                R.raw.button2, new Vector3(0.02f,1.37f,0.06f), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel(getResources().getString(R.string.skull_title),getResources().getString(R.string.head),
                R.raw.button2, new Vector3(0,1.575f,-0.05f), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel(getResources().getString(R.string.hip_title),getResources().getString(R.string.hip_bone),
                R.raw.button2, new Vector3(0.145f,0.86f,-0.05f), buttonScale));
        BoneModelList.getInstance().addToBoneModelList(new BoneModel(getResources().getString(R.string.face_title),getResources().getString(R.string.face),
                R.raw.button2, new Vector3(0.03f,1.5f,0.07f), buttonScale));
    }
}
