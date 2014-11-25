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


public class RegisterClass extends Activity {

    private ListView list;

    private String[] className;
    private String[] totalSeats;
    private String[] semester;

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
                Toast.makeText(RegisterClass.this, "You Clicked at " + className[position], Toast.LENGTH_SHORT).show();
            }
        });
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

            int count=-1;
            while(rs.next())
            {
                ++count;
            }
            //Log.w("count",""+count);
            className = new String[count];
            totalSeats = new String[count];
            semester = new String[count];
            rs.first();

            int c=0;
            while (rs.next()) {
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
            Toast.makeText(RegisterClass.this, "Unable to connect with server", Toast.LENGTH_SHORT).show();
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

/*
// very use full if the programmer don't have direct access to schema
class PrintColumnTypes  {

    public static void printColTypes(ResultSetMetaData rsmd)
            throws SQLException {
        int columns = rsmd.getColumnCount();
        for (int i = 1; i <= columns; i++) {
            int jdbcType = rsmd.getColumnType(i);
            String name = rsmd.getColumnTypeName(i);
            System.out.print("Column " + i + " is JDBC type " + jdbcType);
            System.out.println(", which the DBMS calls " + name);
        }
    }
}


//extra

//ResultSetMetaData rsmd = rs.getMetaData();
            //PrintColumnTypes.printColTypes(rsmd);
            //System.out.println("");

            //int numberOfColumns = rsmd.getColumnCount();

            for (int i = 1; i <= numberOfColumns; i++) {
                if (i > 1) System.out.print(",  ");
                String columnName = rsmd.getColumnName(i);
                System.out.print(columnName);
            }
            System.out.println("");
*/