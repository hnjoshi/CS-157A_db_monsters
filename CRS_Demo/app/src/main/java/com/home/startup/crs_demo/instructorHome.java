package com.home.startup.crs_demo;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.TextView;


public class instructorHome extends Activity {

    private TextView uname;
    private Button assignedbtn;
    private Button rStudentbtn;
    private Button aGradesbtn;
    private Button vProfile;
    private Button logoutbtn;
    Login lg = new Login();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.activity_instructor_home);

        uname = (TextView)findViewById(R.id.iusername);
        assignedbtn = (Button)findViewById(R.id.iassignedCourses);
        rStudentbtn = (Button)findViewById(R.id.iremoveStudent);
        aGradesbtn = (Button)findViewById(R.id.iassigngrades);
        vProfile = (Button)findViewById(R.id.iviewProfile);
        logoutbtn = (Button)findViewById(R.id.ilogout);

        uname.setText(lg.getUserName() + " Instructor Home");

        setupAssignedbtn();
        setupDropStudent();
        setupProfilebtn();
        setupAssignGrades();
        setupLogOutbtn();
    }

    private void setupDropStudent()
    {
        rStudentbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(getApplicationContext(), DropStudent.class));
            }
        });
    }

    private void setupAssignGrades()
    {
        aGradesbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(getApplicationContext(), AssignGrades.class));
            }
        });
    }

    private void setupLogOutbtn()
    {
        logoutbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), Login.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                startActivity(intent);
            }
        });
    }

    private void setupAssignedbtn()
    {
        assignedbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(instructorHome.this, AssignedCourses.class));
            }
        });
    }

    private void setupProfilebtn()
    {
        vProfile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(instructorHome.this, InstructorProfile.class));
            }
        });
    }

}
