package com.example.iho_ar;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.view.View;
import android.widget.Toast;

public class Util {

    public static void createPopup(Context context, String title, String message){
        AlertDialog.Builder builder = new AlertDialog.Builder(context)
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