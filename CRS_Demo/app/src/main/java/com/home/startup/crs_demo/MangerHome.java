package com.home.startup.crs_demo;

import android.app.Activity;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.Toast;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;


public class MangerHome extends Activity {

    private DatePicker date;
    private Button deleteOld;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.activity_manger_home);

        date = (DatePicker)findViewById(R.id.datePicker);
        deleteOld = (Button)findViewById(R.id.delOldbtn);

        date.updateDate(2010,11,30);
        setupDeleteOld();
    }

    private void setupDeleteOld()
    {
        deleteOld.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Connection conn = null;
                try {
                    StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
                    StrictMode.setThreadPolicy(policy);

                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conn = DriverManager.getConnection("jdbc:mysql://54.69.117.137:3306/db_monsters_crs", "crs_user", "password");

                    CallableStatement cs = null;
                    String delOldProcedure = "{call deleteOlderAssignment(?)}";

                    cs = conn.prepareCall(delOldProcedure);
                    cs.setString(1, getDateFromDatePicker(date));

                    int x=cs.executeUpdate();

                    if(x > 0)
                    {
                        Toast.makeText(getApplicationContext(), x+" older assignments" +
                                " have been" +
                                " successfully Deleted", Toast.LENGTH_SHORT).show();
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

            }
        });
    }

    private String getDateFromDatePicker(DatePicker datePicker){
        int day = datePicker.getDayOfMonth();
        int month = datePicker.getMonth();
        int year =  datePicker.getYear();

        return year+","+month+","+day;
    }

}
