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
import java.sql.ResultSet;

public class Login extends Activity {

    private static String USER_NAME;
    private static String USER_ID;

    EditText username;
    EditText password;
    Button loginbtn;
    Button createACbtn;
    Spinner acType;

    boolean toastAppeared = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.activity_login);

        username = (EditText)findViewById(R.id.username);
        password = (EditText)findViewById(R.id.password);
        loginbtn = (Button)findViewById(R.id.loginbtn);
        createACbtn = (Button)findViewById(R.id.cbtn);
        acType = (Spinner)findViewById(R.id.actype);

        setupcreateACbtn();
        setupSignInbtn();
    }

    private void setupSignInbtn()
    {
        loginbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                if(username.getText().length()>0 && password.getText().length()>0 && registerdUser())
                {
                    Toast.makeText(Login.this, "Login Successful!", Toast.LENGTH_SHORT).show();
                    USER_NAME = username.getText().toString();
                    startActivity(new Intent(Login.this, StudentHome.class));
                }
                else if(!toastAppeared)
                {
                    Toast.makeText(Login.this, "Check username and password", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    private boolean registerdUser()
    {
        boolean registred = false;

        Connection conn = null;
        try
        {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://54.69.117.137:3306/db_monsters_crs", "crs_user", "password");

            PreparedStatement pst=null;
            ResultSet rs=null;

            boolean go=false;

            if(acType.getSelectedItem().toString().equals("Student"))
            {
                pst=conn.prepareStatement("SELECT * FROM student WHERE UserName=?;");
                pst.setString(1, username.getText().toString());
                rs=pst.executeQuery();

                if(rs.next())
                {
                    USER_ID = rs.getString("sID");
                    go = true;
                }

            }
            else
            {
                pst=conn.prepareStatement("SELECT * FROM instructor WHERE UserName=?;");
                pst.setString(1, username.getText().toString());
                rs=pst.executeQuery();

                if(rs.next())
                {
                    USER_ID = rs.getString("iID");
                    go = true;
                }
            }
            if(go)
            {
                String DBpass = rs.getString("Password");

                String upass = password.getText().toString();
                HashHandler hh = new HashHandler();
                byte[] hash = hh.genHashOf(upass);
                upass = new String(hash);

                if(upass.equals(DBpass))
                {
                    registred = true;
                }
                else
                {
                    Toast.makeText(Login.this, "Username and Password didn't match", Toast.LENGTH_SHORT).show();
                    toastAppeared=true;
                }
            }
            else
            {
                Toast.makeText(Login.this, "Please Sign Up...", Toast.LENGTH_SHORT).show();
                toastAppeared=true;
            }

        }
        catch (Exception e)
        {
            //e.printStackTrace();
            Toast.makeText(Login.this, "Unable to connect with server", Toast.LENGTH_SHORT).show();
            toastAppeared=true;
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

        return registred;
    }

    private void setupcreateACbtn()
    {
        createACbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(Login.this, CreateAccount.class));
            }
        });
    }

    public String getUserName()
    {
        return USER_NAME;
    }

    public void setUserName(String newUserName)
    {
        USER_NAME = newUserName;
    }

    public String getUSER_ID(){ return USER_ID;}

}
