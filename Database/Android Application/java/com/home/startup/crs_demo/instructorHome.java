package com.home.startup.crs_demo;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class instructorHome extends Activity {

    private TextView uname;
    private Button assignedbtn;
    private Button rStudentbtn;
    private Button aGradesbtn;
    private Button vProfile;
    private Button logoutbtn;
    Login lg = new Login();
    private Button enrolledStudentsbtn;

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
        enrolledStudentsbtn = (Button)findViewById(R.id.iViewEnrolledbtn);

        uname.setText(lg.getUserName() + " Instructor Home");

        setupAssignedbtn();
        setupEnrStudentbtn();
        setupDropStudent();
        setupProfilebtn();
        setupAssignGrades();
        setupLogOutbtn();
    }

    private void setupEnrStudentbtn()
    {
        enrolledStudentsbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                setContentView(R.layout.view_enrolled_students);
                EditText et = (EditText)findViewById(R.id.ienrStudentstxt);

                Connection conn = null;
                try {
                    StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
                    StrictMode.setThreadPolicy(policy);

                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conn = DriverManager.getConnection("jdbc:mysql://54.69.117.137:3306/db_monsters_crs", "crs_user", "password");

                    PreparedStatement pst = null;
                    ResultSet rs = null;
                    pst = conn.prepareStatement("SELECT lastname,firstname, title FROM student \n" +
                            "NATURAL JOIN enrollment as b LEFT JOIN course ON \n" +
                            "b.cID=course.cID \n" +
                            "WHERE b.cID in (SELECT cID FROM courseassignment where iId=?)\n" +
                            "order by title,lastname,firstname;");
                    pst.setString(1, lg.getUSER_ID());
                    rs = pst.executeQuery();

                    et.append("\n");
                    while (rs.next())
                    {
                        et.append("\n"+rs.getString(1)+","+
                                rs.getString(2)+" "+rs.getString(3));
                    }

                }
                catch (Exception e)
                {
                    //e.printStackTrace();
                    Toast.makeText(getApplicationContext(), "Unable to connect with server", Toast.LENGTH_SHORT).show();

                }
                finally
                {
                    if(conn != null)
                    {
                        try
                        {
                            conn.close();
                        }
                        catch (Exception e)
                        {
                            //e.printStackTrace();
                        }
                        finally {
                            conn = null;
                        }

                    }

                }
            }
        });
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
