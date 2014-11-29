package com.home.startup.crs_demo;

import android.app.Activity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.TextView;

public class CustomList3 extends ArrayAdapter<String>{
    private Activity context;
    private String[] sID;
    private String[] name;
    private boolean[] selected;

    public CustomList3(Activity context, String[] sID, String[] name, boolean[] selected) {
        super(context, R.layout.list_single2, sID);
        this.context = context;
        this.sID = sID;
        this.name = name;
        this.selected = selected;
    }
    @Override
    public View getView(final int position, View view, ViewGroup parent) {
        LayoutInflater inflater = context.getLayoutInflater();
        View rowView = inflater.inflate(R.layout.list_single3, null,true);

        TextView studentID = (TextView)rowView.findViewById(R.id.sID_list);
        TextView studentName = (TextView) rowView.findViewById(R.id.sName_list);
        final CheckBox chk = (CheckBox)rowView.findViewById(R.id.checkBox);

        chk.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if(chk.isChecked()){
                    selected[position] = true;
                }
                else{
                    selected[position] = false;
                }
            }
        });

        studentID.setText(sID[position]);
        studentName.setText(name[position]);

        return rowView;
    }

    public boolean getSelected(int x)
    {
        return selected[x];
    }
}
