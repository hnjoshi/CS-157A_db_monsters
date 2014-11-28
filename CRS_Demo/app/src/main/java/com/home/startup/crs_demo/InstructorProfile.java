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


public class InstructorProfile extends Activity {

    String username;

    TextView iIDtext;
    EditText iUsername;
    EditText iLastname;
    EditText iFirstname;
    TextView iHiredate;

    Button updatebtn;

    Login lg = new Login();
    Connection conn = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.activity_instructor_profile);

        iIDtext = (TextView)findViewById(R.id.iID);
        iUsername = (EditText)findViewById(R.id.iusername);
        iLastname = (EditText)findViewById(R.id.ilastname);
        iFirstname = (EditText)findViewById(R.id.ifirstname);
        iHiredate = (TextView)findViewById(R.id.ihiredate);
        updatebtn = (Button)findViewById(R.id.iupdatebtn);

        username = lg.getUserName();

        getUserData();

        setupUpdatebtn();
    }

    private void setupUpdatebtn()
    {
        updatebtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Connection conn = null;
                try {
                    StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
                    StrictMode.setThreadPolicy(policy);

                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conn = DriverManager.getConnection("jdbc:mysql://54.69.117.137:3306/db_monsters_crs", "crs_user", "password");

                    PreparedStatement pst = null;
                    pst=conn.prepareStatement("UPDATE instructor SET UserName = ?, LastName = ?, FirstName = ?" +
                            " where iID = ?");
                    pst.setString(1,iUsername.getText().toString());
                    pst.setString(2,iLastname.getText().toString());
                    pst.setString(3,iFirstname.getText().toString());
                    pst.setString(4,iIDtext.getText().toString());
                    int count = pst.executeUpdate();

                    if(count > 0)
                    {
                        if(!username.equals(iUsername.getText().toString()))
                        {
                            lg.setUserName(iUsername.getText().toString());
                        }
                        Toast.makeText(InstructorProfile.this, "Profile was updated successfully...", Toast.LENGTH_SHORT).show();
                        startActivity(new Intent(InstructorProfile.this, StudentHome.class));
                        finish();
                    }
                }
                catch (Exception e)
                {
                    Toast.makeText(InstructorProfile.this, "Unable to connect with server", Toast.LENGTH_SHORT).show();
                    //e.printStackTrace();
                }
                finally
                {
                    closeCon();
                }
            }
        });
    }

    private void getUserData()
    {

        try {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://54.69.117.137:3306/db_monsters_crs", "crs_user", "password");

            PreparedStatement pst = null;
            ResultSet rs = null;

            pst=conn.prepareStatement("SELECT * FROM instructor WHERE UserName=?;");
            pst.setString(1,username);
            rs=pst.executeQuery();

            if(rs.next()) {
                iIDtext.setText(rs.getString("iID"));
                iUsername.setText(username);
                iLastname.setText(rs.getString("LastName"));
                iFirstname.setText(rs.getString("FirstName"));
                iHiredate.setText(rs.getString("HireDate"));
            }

        }
        catch (Exception e)
        {
            //e.printStackTrace();
            Toast.makeText(InstructorProfile.this, "Unable to connect with server", Toast.LENGTH_SHORT).show();
        }
        finally
        {
            closeCon();
        }
    }

    private void closeCon()
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
