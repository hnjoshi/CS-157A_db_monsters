package com.home.startup.crs_demo;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.TextView;


public class StudentHome extends Activity {

    TextView username;
    Button viewProfile;
    Button logoutbtn;
    Button regclassbtn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.activity_student_home);

        username = (TextView)findViewById(R.id.shusername);
        viewProfile = (Button)findViewById(R.id.viewprofilebtn);
        logoutbtn = (Button)findViewById(R.id.logoutbtn);
        regclassbtn = (Button)findViewById(R.id.regclassbtn);

        Login lg = new Login();
        username.setText(lg.getUserName() + " Home");

        setupViewProfilebtn();
        setupLogoutbtn();
        setupRegClassbtn();
    }

    private void setupRegClassbtn()
    {
        regclassbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(StudentHome.this, RegisterClass.class));
            }
        });
    }

    private void setupLogoutbtn()
    {
        logoutbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), Login.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                startActivity(intent);
            }
        });
    }

    private void setupViewProfilebtn()
    {
        viewProfile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(StudentHome.this, StudentProfile.class));
            }
        });
    }

}
