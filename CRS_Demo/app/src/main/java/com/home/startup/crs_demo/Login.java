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

    EditText username; //set equal to username editable box in activity_login.xml
    EditText password; //set equal to password editable box in activity_login.xml
    Button loginbtn;   //set equal to login button in activity_login.xml
    Button createACbtn;//set equal to create account button in activity_login.xml
    Spinner acType; //set equal to the spinner acType in activity_login.xml

    boolean toastAppeared = false;
    boolean isStudent = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) //from activity_login.xml
    {
        super.onCreate(savedInstanceState);
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.activity_login);

        //NOTE: must ALWAYS cast to left hand side variable
        username = (EditText)findViewById(R.id.username);
        password = (EditText)findViewById(R.id.password);
        loginbtn = (Button)findViewById(R.id.loginbtn);
        createACbtn = (Button)findViewById(R.id.cbtn);
        acType = (Spinner)findViewById(R.id.actype);

        setupcreateACbtn();
        setupSignInbtn();
    }


    /**
     * setupSignInbtn() manages the "Sign In" button on activity_login.xml
     * NOTE: maybe this can be one of the functionality requirements?
     */
    private void setupSignInbtn()
    {
        loginbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                if(username.getText().length()>0 && password.getText().length()>0 && registerdUser())
                {
                    //Toast makes is a small feedback about an operation in a small pop up
                    Toast.makeText(Login.this, "Login Successful!", Toast.LENGTH_SHORT).show();
                    USER_NAME = username.getText().toString();
                    if(isStudent)
                    {
                        //NOTE: new Intent is some form of navigation function in Android dev

                        //go to StudentHome.class
                        startActivity(new Intent(Login.this, StudentHome.class)); //for student
                    }
                    else
                    {
                        //go to instructorHome.class
                        startActivity(new Intent(Login.this, instructorHome.class)); //for instructor
                    }
                }
                else if(!toastAppeared) //NOTE: consider changing this to !registeredUser()
                {
                    //case should not appear because registeredUser() confirms if user logging in is in DB
                    Toast.makeText(Login.this, "Check username and password", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    /**
     * registeredUser() checks to make sure that person trying to sign in is a user in the DB tables
     * Tables to check in are: Student and Instructor
     * @return true if the person trying to login is a user
     * @return false if the person trying to login is NOT a user
     */
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

            //check if user is in Username attribute in either Student or Instructor table in DB
            if(acType.getSelectedItem().toString().equals("Student"))
            {
                isStudent = true;
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
                isStudent = false;
                pst=conn.prepareStatement("SELECT * FROM instructor WHERE UserName=?;");
                pst.setString(1, username.getText().toString());
                rs=pst.executeQuery();

                if(rs.next())
                {
                    USER_ID = rs.getString("iID");
                    go = true;
                }
            }

            //if user is registered as student or teacher
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
            else //run if username is not found in Student or Instructor DB
            {
                Toast.makeText(Login.this, "Please Sign Up...", Toast.LENGTH_SHORT).show();
                toastAppeared=true;
            }

        }
        catch (Exception e)
        {
            //e.printStackTrace();
            Toast.makeText(Login.this, "Unable to connect with server", Toast.LENGTH_SHORT).show(); //i ran into this problem when not connected to internet
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

    /**
     * setupcreateACbtn() creates a new account which will allow users to login
     * goes to CreateAccount.class
     */
    private void setupcreateACbtn()
    {
        createACbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(Login.this, CreateAccount.class));
            }
        });
    }

    /**
     * getUserName() accessor method
     * @return USER_NAME the name of the user
     */
    public String getUserName()
    {
        return USER_NAME;
    }

    /**
     * setUserName() accessor method
     * @param newUserName the new username to set to
     */
    public void setUserName(String newUserName)
    {
        USER_NAME = newUserName;
    }

    /**
     * getUSER_ID() returns the USER_ID
     * @return USER_ID the ID of the user
     */
    public String getUSER_ID(){ return USER_ID;}

}
