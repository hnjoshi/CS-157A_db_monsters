package com.home.startup.crs_demo;

import android.app.Activity;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.Toast;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Date;


public class RegisterClass extends Activity {

    private ListView list;
    private String user_id;

    private String[] className;
    private String[] totalSeats;
    private String[] semester;
    private String[] cID;

    private Bitmap thumbImg;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register_class);

        getOfferedCourses();

        CustomList adapter = new CustomList(RegisterClass.this, className, totalSeats, semester, thumbImg);
        list=(ListView)findViewById(R.id.list);
        list.setAdapter(adapter);
        list.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                if(RegisteredClass(cID[position]))
                {
                    Toast.makeText(RegisterClass.this, "You are enrolled.", Toast.LENGTH_SHORT).show();
                }
                else
                {
                    registerForCourse(cID[position]);
                }
            }
        });
    }

    private boolean RegisteredClass(String courseID)
    {
        boolean registred = false;

        Login lg = new Login();
        user_id = lg.getUSER_ID();

        Connection conn = null;
        try {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://54.69.117.137:3306/db_monsters_crs", "crs_user", "password");

            PreparedStatement pst = null;
            ResultSet rs = null;

            pst = conn.prepareStatement("SELECT * FROM enrollment WHERE cID = ? and sID=?;");
            pst.setString(1, courseID);
            pst.setString(2, user_id);
            rs = pst.executeQuery();
            if(rs.next())
            {
                registred = true;
            }
        }
        catch (Exception e)
        {
            //e.printStackTrace();
            Toast.makeText(RegisterClass.this, "Unable to connect with server", Toast.LENGTH_SHORT).show();
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
    private void registerForCourse(String courseID)
    {
        Date date = new Date();
        Connection conn = null;
        try {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://54.69.117.137:3306/db_monsters_crs", "crs_user", "password");

            PreparedStatement statement = null;
            String sql = "INSERT INTO enrollment (Grade, sID, cID, updatedON) VALUES (?, ?, ?, ?)";
            statement = conn.prepareStatement(sql);
            statement.setString(1, "NA");
            statement.setString(2, user_id);
            statement.setString(3, courseID);
            statement.setString(4, new Timestamp(date.getTime())+"");

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                Toast.makeText(getApplicationContext(), "Enrolled successfully...",
                        Toast.LENGTH_SHORT).show();

                //startActivity(new Intent(RegisterClass.this, StudentHome.class));
                //finish();
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
            Toast.makeText(RegisterClass.this, "Unable to connect with server", Toast.LENGTH_SHORT).show();
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

    private void getOfferedCourses()
    {
        Connection conn = null;
        try {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://54.69.117.137:3306/db_monsters_crs", "crs_user", "password");

            PreparedStatement pst = null;
            ResultSet rs=null;
            pst=conn.prepareStatement("SELECT * FROM course");
            rs = pst.executeQuery();

            int count=0;
            while(rs.next())
            {
                ++count;
            }
            className = new String[count];
            totalSeats = new String[count];
            semester = new String[count];
            cID = new String[count];
            rs.beforeFirst();

            int c=0;
            while (rs.next()) {
                cID[c] = rs.getString(1);
                className[c] = "Class: "+rs.getString(2)+
                        ", Status: "+rs.getString(4);
                totalSeats[c] = "Total Seats: "+rs.getString(5)+
                        ", Time: "+rs.getString(9)+" to "+
                        rs.getString(10);
                semester[c] = "Term: "+rs.getString(6)+
                        ", Date: "+rs.getString(7)+" to "+
                        rs.getString(8);
                c++;
            }


        }
        catch (Exception e)
        {
            //e.printStackTrace();
            Toast.makeText(RegisterClass.this, "Unable to connect with server", Toast.LENGTH_SHORT).show();

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
