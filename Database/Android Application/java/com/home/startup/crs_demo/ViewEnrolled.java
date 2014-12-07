package com.home.startup.crs_demo;

import android.annotation.TargetApi;
import android.app.Activity;
import android.graphics.Bitmap;
import android.os.Build;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.Window;
import android.widget.ListView;
import android.widget.Toast;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class ViewEnrolled extends Activity {

    private ListView list;

    private String title[];
    private String department[];
    private String term[];
    //private String date[];
    //private String time[];

    private Bitmap thumbImg;

    private String userID;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.activity_view_enrolled);

        Login lg = new Login();
        userID = lg.getUSER_ID();

        getEnrolledCourses();

        CustomList adapter = new CustomList(ViewEnrolled.this, title, term, department, thumbImg);
        list=(ListView)findViewById(R.id.list);
        list.setAdapter(adapter);
    }

    @TargetApi(Build.VERSION_CODES.GINGERBREAD)
    private void getEnrolledCourses()
    {
        Connection conn = null;
        try {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://54.69.117.137:3306/db_monsters_crs", "crs_user", "password");

            PreparedStatement pst = null;
            ResultSet rs = null;
            pst = conn.prepareStatement("select a.Title, a.Term, a.StartTime, a.EndTime, a.StartDate, a.EndDate, d.Name\n" +
                    "from (select * from\n" +
                    "\t\t(select cID from enrollment where sID=?) courseID \n" +
                    "     natural join\n" +
                    "     course RegCourse) a\n" +
                    "join department d\n" +
                    "where a.dID=d.dID");
            pst.setString(1, userID);
            rs = pst.executeQuery();

            rs.last();
            int count = rs.getRow();
            rs.beforeFirst();
            //Log.w("Count",count+"");

            title = new String[count];
            department = new String[count];
            term = new String[count];
            //date = new String[count];
            //time = new String[count];

            int c=0;
            while (rs.next()) {

                title[c] = "Class: "+rs.getString(1)+" Time:"+
                        rs.getString(3)+" to "+rs.getString(4);
                term[c] = rs.getString(2)+" "+rs.getString(5)+" to "+
                                            rs.getString(6);
                //time[c] = rs.getString(3)+" to "+rs.getString(4);
                //date[c] = rs.getString(5)+" to "+rs.getString(6);
                department[c] = "Department: "+rs.getString(7);

                c++;
            }

        }
        catch (Exception e)
        {
            //e.printStackTrace();
            Toast.makeText(ViewEnrolled.this, "Unable to connect with server", Toast.LENGTH_SHORT).show();

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
