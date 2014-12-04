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
    Button viewRegBtn;
    Button dropClassesBtn;
    Button todobtn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.activity_student_home);

        username = (TextView)findViewById(R.id.shusername);
        viewProfile = (Button)findViewById(R.id.viewprofilebtn);
        logoutbtn = (Button)findViewById(R.id.logoutbtn);
        regclassbtn = (Button)findViewById(R.id.regclassbtn);
        viewRegBtn = (Button)findViewById(R.id.viewregbtn);
        dropClassesBtn = (Button)findViewById(R.id.dropclassbtn);
        todobtn = (Button)findViewById(R.id.stodobtn);

        Login lg = new Login();
        username.setText(lg.getUserName() + " Student Home");

        setupViewProfilebtn();
        setupLogoutbtn();
        setupRegClassbtn();
        setupViewRegBtn();
        setupDropClassBtn();
        setupToDobtn();
    }

    private void setupToDobtn()
    {
        todobtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(getApplicationContext(), ToDo.class));
            }
        });
    }

    private void setupDropClassBtn()
    {
        dropClassesBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(StudentHome.this,DropClasses.class));
            }
        });
    }

    private void setupViewRegBtn()
    {
        viewRegBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(StudentHome.this, ViewEnrolled.class));
            }
        });
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
