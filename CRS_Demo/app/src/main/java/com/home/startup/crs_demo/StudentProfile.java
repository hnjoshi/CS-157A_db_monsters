package com.home.startup.crs_demo;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Intent;
import android.os.Build;
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


public class StudentProfile extends Activity {

    String username;
    String lastname;
    String firstname;

    TextView sIDtext;
    EditText sUsername;
    EditText sLastname;
    EditText sFirstname;
    TextView sAdmissiondate;

    Button updatebtn;

    Login lg = new Login();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.activity_student_profile);

        sIDtext = (TextView)findViewById(R.id.sid);
        sUsername = (EditText)findViewById(R.id.susername);
        sLastname = (EditText)findViewById(R.id.slastname);
        sFirstname = (EditText)findViewById(R.id.sfirstname);
        sAdmissiondate = (TextView)findViewById(R.id.sadmissiondate);

        updatebtn = (Button)findViewById(R.id.supdatebtn);

        username = lg.getUserName();

        getUserData();

        setupUpdatebtn();
    }

    private void setupUpdatebtn()
    {
        updatebtn.setOnClickListener(new View.OnClickListener() {
            @TargetApi(Build.VERSION_CODES.GINGERBREAD)
            @Override
            public void onClick(View view) {

                Connection conn = null;
                try {
                    StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
                    StrictMode.setThreadPolicy(policy);

                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conn = DriverManager.getConnection("jdbc:mysql://54.69.117.137:3306/db_monsters_crs", "crs_user", "password");

                    PreparedStatement pst = null;
                    pst=conn.prepareStatement("UPDATE student SET UserName = ?, LastName = ?, FirstName = ?" +
                            " where sID = ?");
                    pst.setString(1,sUsername.getText().toString());
                    pst.setString(2,sLastname.getText().toString());
                    pst.setString(3,sFirstname.getText().toString());
                    pst.setString(4,sIDtext.getText().toString());
                    int count = pst.executeUpdate();

                    if(count > 0)
                    {
                        if(!username.equals(sUsername.getText().toString()))
                        {
                            lg.setUserName(sUsername.getText().toString());
                        }
                        Toast.makeText(StudentProfile.this, "Profile was updated successfully...", Toast.LENGTH_SHORT).show();
                        startActivity(new Intent(StudentProfile.this, StudentHome.class));
                    }
                }
                catch (Exception e)
                {
                    Toast.makeText(StudentProfile.this, "Unable to connect with server", Toast.LENGTH_SHORT).show();
                    //e.printStackTrace();
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

    @TargetApi(Build.VERSION_CODES.GINGERBREAD)
    private void getUserData()
    {
        Connection conn = null;
        try {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://54.69.117.137:3306/db_monsters_crs", "crs_user", "password");

            PreparedStatement pst = null;
            ResultSet rs = null;

            pst=conn.prepareStatement("SELECT * FROM student WHERE UserName=?;");
            pst.setString(1,username);
            rs=pst.executeQuery();

            if(rs.next()) {
                sIDtext.setText(rs.getString("sID"));
                sUsername.setText(username);
                sLastname.setText(rs.getString("LastName"));
                sFirstname.setText(rs.getString("FirstName"));
                sAdmissiondate.setText(rs.getString("AdmissionDate"));
            }

        }
        catch (Exception e)
        {
            Toast.makeText(StudentProfile.this, "Unable to connect with server", Toast.LENGTH_SHORT).show();
            //e.printStackTrace();
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

}
