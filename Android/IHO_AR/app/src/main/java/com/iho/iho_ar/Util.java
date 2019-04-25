package com.iho.iho_ar;


import android.content.Context;
import android.content.DialogInterface;
import android.support.v7.app.AlertDialog;

public class Util {

    public static void createPopup(Context context, String title, String message){
        AlertDialog.Builder builder = new AlertDialog.Builder(context,R.style.Theme_AppCompat_Light_Dialog)
                .setTitle(title)
                .setMessage(message)
                .setPositiveButton("Okay", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                });

        builder.show();

    }
}
