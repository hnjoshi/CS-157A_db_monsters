package com.home.startup.crs_demo;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;


public class CreateAccount extends Activity {

    private EditText lastname;
    private EditText firstname;
    private EditText username;
    private EditText password;
    private Spinner cactype;
    private Spinner cdept;
    private Button regbtn;

    String lname;
    String fname;
    String uname;
    String pass;
    String actype;
    String depttype;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.activity_create_account);

        lastname = (EditText)findViewById(R.id.lastname);
        firstname = (EditText)findViewById(R.id.firstname);
        username = (EditText)findViewById(R.id.cusername);
        password = (EditText)findViewById(R.id.cpassword);
        cactype = (Spinner)findViewById(R.id.cactype);
        cdept = (Spinner)findViewById(R.id.cdept);
        regbtn = (Button)findViewById(R.id.createacbtn);

        setupRegisterBtn();

    }

    private void setupRegisterBtn()
    {
        regbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                lname = lastname.getText().toString();
                fname = firstname.getText().toString();
                uname = username.getText().toString();
                pass = password.getText().toString();
                actype = cactype.getSelectedItem().toString();
                depttype = cdept.getSelectedItem().toString();

                HashHandler hh = new HashHandler();
                byte[] hash = hh.genHashOf(pass);
                pass = new String(hash);
                hash = null;

                addNewUser();
            }
        });

    }

    private void addNewUser()
    {
        Date cDate = new Date();
        String todaysDate = new SimpleDateFormat("yyyy-MM-dd").format(cDate);

        Connection conn = null;
        try {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://54.69.117.137:3306/db_monsters_crs", "crs_user", "password");

            PreparedStatement statement = null;

            if(actype.equals("Student"))
            {
                String sql = "INSERT INTO student (UserName, Password, LastName, FirstName, AdmissionDate, dID) VALUES (?, ?, ?, ?, ?, ?)";

                statement = conn.prepareStatement(sql);
                statement.setString(1, uname);
                statement.setString(2, pass);
                statement.setString(3, lname);
                statement.setString(4, fname);
                statement.setString(5, todaysDate);
                statement.setString(6, getDepartmentID(depttype));
            }
            else
            {
                String sql = "INSERT INTO instructor (UserName, Password, LastName, FirstName, HireDate, dID) VALUES (?, ?, ?, ?, ?, ?)";

                statement = conn.prepareStatement(sql);
                statement.setString(1, uname);
                statement.setString(2, pass);
                statement.setString(3, lname);
                statement.setString(4, fname);
                statement.setString(5, todaysDate);
                statement.setString(6, getDepartmentID(depttype));
            }

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                Toast.makeText(getApplicationContext(), "Registered successfully...",
                        Toast.LENGTH_SHORT).show();

                startActivity(new Intent(CreateAccount.this, Login.class));
                finish();
            }
            else
            {
                Toast.makeText(getApplicationContext(), "Unable to register, try again...",
                        Toast.LENGTH_SHORT).show();
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
            Toast.makeText(getApplicationContext(), "Sorry, server is down, try again later.",
                    Toast.LENGTH_SHORT).show();
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
                    e.printStackTrace();
                }
                finally {
                    conn = null;
                }

            }

        }
    }

    private String getDepartmentID(String dept)
    {
        String deptID = "";
        if(dept.equals("Computer Science"))
        {
            deptID="1";
        }
        else if (dept.equals("Software Engineering"))
        {
            deptID="2";
        }
        else if (dept.equals("Art"))
        {
            deptID="3";
        }
        else if (dept.equals("English"))
        {
            deptID="4";
        }

        return deptID;
    }
}
