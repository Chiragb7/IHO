package com.iho.iho_ar.lucy_2d_view;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import com.iho.iho_ar.R;
import com.iho.iho_ar.ar_module.ArActivity;

public class MainActivity extends AppCompatActivity {

    private static final String TAG = MainActivity.class.getSimpleName();
    private static final double MIN_OPENGL_VERSION = 3.0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        if(!checkIsSupportedDevice(this)){
            Fragment fragment = new Lucy2DFrag();
            FragmentTransaction fragmentTransaction = getSupportFragmentManager().beginTransaction();
            fragmentTransaction.addToBackStack(null).replace(R.id.frame, fragment).commit();
        }
        else {
            Intent arIntent = new Intent(this, ArActivity.class);
            startActivity(arIntent);
            finish();
        }

    }

    @Override
    public void onBackPressed() {
        if(getFragmentManager().getBackStackEntryCount()>1){
            getFragmentManager().popBackStack();
        } else {
            finish();
        }
    }

    public static boolean checkIsSupportedDevice(final Context context) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N) {
            Log.e(TAG, context.getString(R.string.sceneform_error_android_ver));
            Toast.makeText(context, context.getString(R.string.sceneform_error_android_ver), Toast.LENGTH_LONG).show();
            return false;
        }
        String openGlVersionString =
                ((ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE))
                        .getDeviceConfigurationInfo()
                        .getGlEsVersion();
        if (Double.parseDouble(openGlVersionString) < MIN_OPENGL_VERSION) {
            Log.e(TAG, context.getString(R.string.sceneform_error_opengl_ver));
            Toast.makeText(context, context.getString(R.string.sceneform_error_opengl_ver), Toast.LENGTH_LONG)
                    .show();
            return false;
        }
        return true;
    }
}
