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
import android.widget.Toast;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class DropStudent extends Activity {

    private ListView list;
    private Bitmap thumbImg;

    private ListView list3;
    private String selectedCourseID;
    private String cID[];
    private String title[];
    private String time[];
    private String date[];
    private boolean selected[];
    String userID;
    private String sID[];
    private String name[];
    Connection conn = null;
    Button dropbtn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.activity_assigned_courses);

        Login lg = new Login();
        userID = lg.getUSER_ID();

        getAssignedCourses();

        CustomList adapter = new CustomList(DropStudent.this, title, time, date, thumbImg);
        list=(ListView)findViewById(R.id.list);
        list.setAdapter(adapter);
        list.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                selectedCourseID = cID[position];
                setContentView(R.layout.activity_drop_student);

                getRegisteredStudentsforSelectedCourse();
                final CustomList3 adapter = new CustomList3(DropStudent.this, sID, name, selected);
                list3=(ListView)findViewById(R.id.list3);
                list3.setAdapter(adapter);

                dropbtn = (Button)findViewById(R.id.dropbtn);
                dropbtn.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        for (int i = 0; i < selected.length; i++) {
                            selected[i] = adapter.getSelected(i);
                        }

                        dropSelectedStudent();
                    }
                });
            }
        });

    }

    private void dropSelectedStudent()
    {
        conn = null;
        try {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://54.69.117.137:3306/db_monsters_crs", "crs_user", "password");

            for(int i=0; i < selected.length; i++)
            {
                if(selected[i])
                {
                    PreparedStatement pst = null;
                    //Log.w("User selected", selected[i]+ " cID "+selectedCourseID + " sID " + sID[i]);
                    pst = conn.prepareStatement("Delete FROM enrollment\n" +
                                    "WHERE cID=? and sID=?");
                    pst.setString(1, selectedCourseID);
                    pst.setString(2, sID[i]);
                    pst.execute();
                }
            }

            Toast.makeText(getApplicationContext(), "Drop successfully...", Toast.LENGTH_SHORT).show();
            startActivity(new Intent(getApplicationContext(), instructorHome.class));
        }
        catch (Exception e)
        {
            e.printStackTrace();
            Toast.makeText(getApplicationContext(), "Unable to connect with server", Toast.LENGTH_SHORT).show();
        }
        finally
        {
            closeCon();
        }
    }

    private void getRegisteredStudentsforSelectedCourse()
    {
        conn = null;
        try {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://54.69.117.137:3306/db_monsters_crs", "crs_user", "password");

            PreparedStatement pst = null;
            ResultSet rs = null;
            pst = conn.prepareStatement("select s.sID, s.FirstName, s.LastName, e.Grade from\n" +
                    "\t(select Grade, sID from enrollment\n" +
                    "\t\twhere cID=?) e\n" +
                    "\tnatural join student s");
            pst.setString(1, selectedCourseID);
            rs = pst.executeQuery();

            rs.last();
            int count = rs.getRow();
            rs.beforeFirst();

            sID = new String[count];
            name = new String[count];
            selected = new boolean[count];

            int c=0;
            while (rs.next()) {

                sID[c] = rs.getString(1);
                name[c] = rs.getString(2)+" "+rs.getString(3);

                selected[c] = false;

                c++;
            }

        }
        catch (Exception e)
        {
            //e.printStackTrace();
            Toast.makeText(getApplicationContext(), "Unable to connect with server", Toast.LENGTH_SHORT).show();
        }
        finally
        {
            closeCon();
        }
    }

    private void getAssignedCourses()
    {
        conn = null;
        try {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://54.69.117.137:3306/db_monsters_crs", "crs_user", "password");

            PreparedStatement pst = null;
            ResultSet rs = null;
            pst = conn.prepareStatement("select x.Title, x.Location, x.Term, x.StartDate, x.EndDate, x.StartTime, x.EndTime, d.Name, x.cID\n" +
                    "from (select * from\n" +
                    "\t\t\t(select iID, Location, cID\n" +
                    "                    from courseassignment where iID=?) a\n" +
                    "\t\t\tnatural join course c) x\n" +
                    "\tjoin department d\n" +
                    "\twhere d.dID = x.dID");
            pst.setString(1, userID);
            rs = pst.executeQuery();

            rs.last();
            int count = rs.getRow();
            rs.beforeFirst();

            title = new String[count];
            time = new String[count];
            date = new String[count];
            cID = new String[count];

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
                cID[c] = rs.getString(9);

                c++;
            }

        }
        catch (Exception e)
        {
            //e.printStackTrace();
            Toast.makeText(getApplicationContext(), "Unable to connect with server", Toast.LENGTH_SHORT).show();
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
