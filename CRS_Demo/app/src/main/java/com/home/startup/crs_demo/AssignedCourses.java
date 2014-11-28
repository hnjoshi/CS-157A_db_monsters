package com.home.startup.crs_demo;

import android.app.Activity;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.Window;
import android.widget.ListView;
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

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.activity_assigned_courses);

        getAssignedCourses();

        CustomList adapter = new CustomList(AssignedCourses.this, title, time, date, thumbImg);
        list=(ListView)findViewById(R.id.list);
        list.setAdapter(adapter);
    }

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
                    "\t\tfrom courseassignment where iID=1) a\n" +
                    "\tnatural join course c) x\n" +
                    "    join department d\n" +
                    "    where d.dID = x.dID");
            rs = pst.executeQuery();

            int count=0;
            while(rs.next())
            {
                ++count;
            }
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

}
