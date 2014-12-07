package com.home.startup.crs_demo;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class CustomList extends ArrayAdapter<String>{
    private final Activity context;
    private final String[] className;    // class name
    private final String[] availableSeats;   // available seats
    private final String[] semster;   // offered semester
    private Bitmap thumbImg = null;   // relevant class image

    public CustomList(Activity context, String[] className, String[] availableSeats, String[] semster, Bitmap thumbImg) {
        super(context, R.layout.list_single, className);
        this.context = context;
        this.className = className;
        this.availableSeats = availableSeats;
        this.semster = semster;
        this.thumbImg = thumbImg;

    }
    @Override
    public View getView(int position, View view, ViewGroup parent) {
        LayoutInflater inflater = context.getLayoutInflater();
        View rowView = inflater.inflate(R.layout.list_single, null, true);
        TextView txtUser = (TextView)rowView.findViewById(R.id.textView);   // Class name
        TextView txtTitle = (TextView) rowView.findViewById(R.id.textView2);    // available seats
        TextView txtPrice = (TextView)rowView.findViewById(R.id.textView3);     // offered semester
        ImageView imageView = (ImageView) rowView.findViewById(R.id.img);       // relevant class image

        // need to set thumbImg

        txtUser.setText(className[position]);
        txtTitle.setText(availableSeats[position]);
        txtPrice.setText(semster[position]);
        imageView.setImageBitmap(thumbImg);
        return rowView;
    }

}
