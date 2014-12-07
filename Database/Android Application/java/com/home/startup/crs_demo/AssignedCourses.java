package com.home.startup.crs_demo;

import android.annotation.TargetApi;
import android.app.Activity;
import android.graphics.Bitmap;
import android.os.Build;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.Window;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AssignedCourses extends Activity {

    private ListView list;
    private Bitmap thumbImg;

    private String title[];
    private String time[];
    private String date[];

    private TextView nClassestxt;
    private TextView nUnitstxt;

    String userID;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.activity_assigned_courses);

        nClassestxt = (TextView)findViewById(R.id.nClassestxt);
        nUnitstxt = (TextView)findViewById(R.id.nUnitstxt);

        Login lg = new Login();
        userID = lg.getUSER_ID();

        getAssignedCourses();

        CustomList adapter = new CustomList(AssignedCourses.this, title, time, date, thumbImg);
        list=(ListView)findViewById(R.id.list);
        list.setAdapter(adapter);

        getClassesnUnits();
    }

    @TargetApi(Build.VERSION_CODES.GINGERBREAD)
    private void getAssignedCourses()
    {
        Connection conn = null;
        try {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://54.69.117.137:3306/db_monsters_crs", "crs_user", "password");

            PreparedStatement pst = null;
            ResultSet rs = null;
            pst = conn.prepareStatement("select x.Title, x.Location, x.Term, x.StartDate, x.EndDate, x.StartTime, x.EndTime, d.Name\n" +
                    "from\n" +
                    "\t(select *\n" +
                    "\tfrom\n" +
                    "\t\t(select iID, Location, cID\n" +
                    "\t\tfrom courseassignment where iID=?) a\n" +
                    "\tnatural join course c) x\n" +
                    "    join department d\n" +
                    "    where d.dID = x.dID");
            pst.setString(1, userID);
            rs = pst.executeQuery();

            rs.last();
            int count = rs.getRow();
            rs.beforeFirst();

            title = new String[count];
            time = new String[count];
            date = new String[count];

            int c=0;
            while (rs.next()) {

                title[c] = "Class: "+rs.getString(1)+" Dept.: "+
                                        rs.getString(8);
                date[c] = "Date: "+rs.getString(4)+" to "+
                                    rs.getString(5)+" Term: "+
                                    rs.getString(3);
                time[c] = "Time: "+rs.getString(6)+" to "+
                                    rs.getString(7)+" Room: "+
                                    rs.getString(2);

                c++;
            }

        }
        catch (Exception e)
        {
            //e.printStackTrace();
            Toast.makeText(AssignedCourses.this, "Unable to connect with server", Toast.LENGTH_SHORT).show();
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

    @TargetApi(Build.VERSION_CODES.GINGERBREAD)
    private void getClassesnUnits()
    {
        Connection conn = null;
        try {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://54.69.117.137:3306/db_monsters_crs", "crs_user", "password");

            PreparedStatement pst = null;
            ResultSet rs = null;
            pst = conn.prepareStatement("select * from\n" +
                    "(select * from\n" +
                    "\t(select iID, count(iID) from courseassignment\n" +
                    "        group by iID) m\n" +
                    "where iID=?) x\n" +
                    "        \n" +
                    "union\n" +
                    "\n" +
                    "(select iID, sum(Credits) from\n" +
                    "    (select * from courseassignment\n" +
                    "\t\twhere iID=?) a\n" +
                    "\tnatural join course c)");
            pst.setString(1, userID);
            pst.setString(2, userID);
            rs = pst.executeQuery();

            if(rs.next())
            {
                nClassestxt.setText(rs.getString(2));
            }
            if(rs.next())
            {
                nUnitstxt.setText(rs.getString(2));
            }
        }
        catch (Exception e)
        {
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
