package com.home.startup.crs_demo;

import android.app.Activity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

public class CustomList2 extends ArrayAdapter<String>{
    private final Activity context;
    private final String[] sID;
    private final String[] name;
    private String[] grade;

    public CustomList2(Activity context, String[] sID, String[] name, String[] grade) {
        super(context, R.layout.list_single2, sID);
        this.context = context;
        this.sID = sID;
        this.name = name;
        this.grade = grade;
    }
    @Override
    public View getView(int position, View view, ViewGroup parent) {
        LayoutInflater inflater = context.getLayoutInflater();
        View rowView = inflater.inflate(R.layout.list_single2, null,true);
        TextView studentID = (TextView)rowView.findViewById(R.id.sID_list);
        TextView studentName = (TextView) rowView.findViewById(R.id.sName_list);
        TextView studentGrade = (TextView)rowView.findViewById(R.id.sGrade_list);
                
        studentID.setText(sID[position]);
        studentName.setText(name[position]);
        studentGrade.setText(grade[position]);

        return rowView;
    }

}
