package com.home.startup.crs_demo;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.View;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class ViewInstructors extends Activity {

    private ListView list;
    private String sID;
    private String title[];
    private String title2[];
    private String department[];
    private String term[];
    private String cID[];

    private Bitmap thumbImg;



    private String userChoice[];
    private String userChoice2[];
    private int userChoiceptr=0;
    private String txt="";
    private Connection conn = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.activity_view_instructors);

        Login lg = new Login();
        sID = lg.getUSER_ID();

        //getEnrolledCourses();

        CustomList adapter = new CustomList(ViewInstructors.this, title, term, department, thumbImg);
        list=(ListView)findViewById(R.id.list);
        /*
        list.setAdapter(adapter);
        list.setOnItemClickListener(new AdapterView.OnItemClickListener()
        {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id)
            {
                if(userChoiceptr<userChoice.length)
                {
                    userChoice[userChoiceptr] = cID[position];
                    userChoice2[userChoiceptr] = title2[position];
                    userChoiceptr++;

                }
            }

        });*/
    }

    private void getEnrolledCourses()
    {
        try {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://54.69.117.137:3306/db_monsters_crs", "crs_user", "password");

            PreparedStatement pst = null;
            ResultSet rs = null;
            pst = conn.prepareStatement("select a.cID, a.Title, a.Term, a.StartTime, a.EndTime, a.StartDate, a.EndDate, d.Name\n" +
                    "from (select * from\n" +
                    "\t\t(select cID from enrollment where sID=?) courseID \n" +
                    "     natural join\n" +
                    "     course RegCourse) a\n" +
                    "join department d\n" +
                    "where a.dID=d.dID");
            pst.setString(1, sID);
            rs = pst.executeQuery();

            rs.last();
            int count = rs.getRow();
            rs.beforeFirst();

            userChoice = new String[count];
            userChoice2 = new String[count];

            title = new String[count];
            title2 = new String[count];
            department = new String[count];
            term = new String[count];
            cID = new String[count];

            int c=0;
            while (rs.next()) {
                cID[c] = rs.getString(1);
                title[c] = "Class: "+rs.getString(2)+" Time:"+
                        rs.getString(4)+" to "+rs.getString(5);
                term[c] = rs.getString(3)+" "+rs.getString(6)+" to "+
                        rs.getString(7);
                department[c] = "Department: "+rs.getString(8);

                title2[c]=rs.getString(2);

                c++;
            }

        }
        catch (Exception e)
        {
            //e.printStackTrace();
            Toast.makeText(ViewInstructors.this, "Unable to connect with server", Toast.LENGTH_SHORT).show();

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
