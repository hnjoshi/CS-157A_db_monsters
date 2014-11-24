package com.home.startup.crs_demo;

import android.app.Activity;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.Toast;


public class RegisterClass extends Activity {

    private ListView list;

    private String[] className = {"cs174","cs157a","cs160"};
    private String[] availableSeats = {"1","2","3"};
    private String[] semester = {"fall", "spring", "summer"};

    private Bitmap thumbImg;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register_class);

        CustomList adapter = new CustomList(RegisterClass.this, className, availableSeats, semester, thumbImg);
        list=(ListView)findViewById(R.id.list);
        list.setAdapter(adapter);
        list.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Toast.makeText(RegisterClass.this, "You Clicked at " + className[position], Toast.LENGTH_SHORT).show();
            }
        });
    }
}
