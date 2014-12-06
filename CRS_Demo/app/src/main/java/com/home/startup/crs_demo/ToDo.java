package com.home.startup.crs_demo;

import android.annotation.TargetApi;
import android.app.Activity;
import android.os.Build;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.Window;
import android.widget.TextView;
import android.widget.Toast;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class ToDo extends Activity {

    TextView todotxt;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.activity_to_do);

        todotxt = (TextView)findViewById(R.id.ToDotxt);

        if(under12Units())
        {

        }
    }

    @TargetApi(Build.VERSION_CODES.GINGERBREAD)
    private boolean under12Units() {
        boolean under12 = false;

        Login lg = new Login();
        String user_id = lg.getUSER_ID();

        Connection conn = null;
        try {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://54.69.117.137:3306/db_monsters_crs", "crs_user", "password");

            PreparedStatement pst = null;
            ResultSet rs = null;

            pst = conn.prepareStatement("select * from\n" +
                    "    (select sID from enrollment\n" +
                    "\t\tnatural join course\n" +
                    "\t\tgroup by sID\n" +
                    "\t\thaving sum(Credits) < 12) a\n" +
                    "where a.sID = ?");
            pst.setString(1, user_id);
            rs = pst.executeQuery();

            if(rs.next())
            {
                todotxt.setText("You need to fill out \"Student Information update form\"" +
                        " because you do not meet mininum 12 units for full time" +
                        " student.");
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


        return  under12;
    }

}
