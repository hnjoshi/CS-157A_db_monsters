package com.home.startup.crs_demo;

import android.app.Activity;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.TextView;

public class CustomList2 extends ArrayAdapter<String>{
    private Activity context;
    private String[] sID;
    private String[] name;
    private String[] grade;

    public CustomList2(Activity context, String[] sID, String[] name, String[] grade) {
        super(context, R.layout.list_single2, sID);
        this.context = context;
        this.sID = sID;
        this.name = name;
        this.grade = grade;
    }
    @Override
    public View getView(final int position, View view, ViewGroup parent) {
        LayoutInflater inflater = context.getLayoutInflater();
        View rowView = inflater.inflate(R.layout.list_single2, null,true);

        TextView studentID = (TextView)rowView.findViewById(R.id.sID_list);
        TextView studentName = (TextView) rowView.findViewById(R.id.sName_list);
        final EditText studentGrade = (EditText)rowView.findViewById(R.id.sGrade_list);

        studentGrade.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {
                setContent(position, studentGrade.getText().toString());
            }
        });

        studentID.setText(sID[position]);
        studentName.setText(name[position]);
        studentGrade.setText(grade[position]);

        return rowView;
    }
    public void setContent (int position, String grade)
    {
       this.grade[position] = grade;
    }

    public String getnewGrade(int x)
    {
        return grade[x];
    }
}
