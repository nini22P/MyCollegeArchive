package io.github.nini22p.calculator;

import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    private Button number1;
    private Button number0;
    private Button number2;
    private Button number3;
    private Button number4;
    private Button number5;
    private Button number6;
    private Button number7;
    private Button number8;
    private Button number9;
    private Button button_poi;
    private Button button;
    private Button button_del;
    private Button button_sum;
    private Button button_minus;
    private Button button_divide;
    private Button button_multiply;
    private TextView textView;
    private TextView textView2;
    public String x="";
    public String y="";
    public double z=0;
    public int i=0;
    public int j=0;
    public int q=0;
    public int p=0;
    public String str="";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        textView = (TextView)findViewById(R.id.textView);
        textView2 = (TextView)findViewById(R.id.textView2);
        number0 = (Button)findViewById(R.id.number0);
        number1 = (Button)findViewById(R.id.number1);
        number2 = (Button)findViewById(R.id.number2);
        number3 = (Button)findViewById(R.id.number3);
        number4 = (Button)findViewById(R.id.number4);
        number5 = (Button)findViewById(R.id.number5);
        number6 = (Button)findViewById(R.id.number6);
        number7 = (Button)findViewById(R.id.number7);
        number8 = (Button)findViewById(R.id.number8);
        number9 = (Button)findViewById(R.id.number9);
        button_sum = (Button)findViewById(R.id.button_sum);
        button_minus = (Button)findViewById(R.id.button_minus);
        button_divide = (Button)findViewById(R.id.button_divide);
        button_multiply = (Button)findViewById(R.id.button_multiply);
        button_poi = (Button)findViewById(R.id.button_poi);
        button = (Button)findViewById(R.id.button);
        button_del = (Button)findViewById(R.id.button_del);

        number0.setOnClickListener(new myclick());
        number1.setOnClickListener(new myclick());
        number2.setOnClickListener(new myclick());
        number3.setOnClickListener(new myclick());
        number4.setOnClickListener(new myclick());
        number5.setOnClickListener(new myclick());
        number6.setOnClickListener(new myclick());
        number7.setOnClickListener(new myclick());
        number8.setOnClickListener(new myclick());
        number9.setOnClickListener(new myclick());
        button_sum.setOnClickListener(new myclick());
        button_minus.setOnClickListener(new myclick());
        button_divide.setOnClickListener(new myclick());
        button_multiply.setOnClickListener(new myclick());
        button_poi.setOnClickListener(new myclick());
        button.setOnClickListener(new myclick());
        button_del.setOnClickListener(new myclick());
    }

    private class myclick implements View.OnClickListener {
        @Override
        public void onClick(View v) {
            switch(v.getId()){
                case R.id.number0   :{
                    num("0");
                }
                    break;
                case R.id.number1   :{
                    num("1");
                }
                    break;
                case R.id.number2   :{
                    num("2");
                }
                break;
                case R.id.number3   :{
                    num("3");
                }
                break;
                case R.id.number4   :{
                    num("4");
                }
                break;
                case R.id.number5   :{
                    num("5");
                }
                break;
                case R.id.number6   :{
                    num("6");
                }
                break;
                case R.id.number7   :{
                    num("7");
                }
                break;
                case R.id.number8   :{
                    num("8");;
                }
                break;
                case R.id.number9   :{
                    num("9");
                }
                break;
                case R.id.button_sum   :{
                    ToString();
                    i=1;
                    str=str+"+";
                    textView.setText(str);
                }
                break;
                case R.id.button_minus   :{
                    ToString();
                    i=2;
                    str=str+"-";
                    textView.setText(str);
                }
                break;
                case R.id.button_multiply   :{
                    ToString();
                    i=3;
                    str=str+"×";
                    textView.setText(str);
                }
                break;
                case R.id.button_divide   :{
                    ToString();
                    i=4;
                    str=str+"÷";
                    textView.setText(str);
                }
                break;
                case R.id.button_poi   :{
                    num(".");
                }
                break;
                case R.id.button   :{
                    str=Double.toString(z);
                    textView.setText(str);
                    textView2.setText("");
                    button_del.setText("C");
                    q=1;
                }
                break;
                case R.id.button_del   :{
                    if(q==0)
                        del();
                    if(q==1)
                        c();
                }
                break;
                default:
                    break;
            }
        }

        private void del() {
            if(str.length()>0) {

                if(i==0)
                    x = x.substring(0,x.length() - 1);
                if(i!=0) {
                    if (y.length() > 0) {
                        y = y.substring(0, y.length() - 1);
                        if(y.length()>=1)view();
                        else
                            textView2.setText("");
                    } else {
                        i = 0;
                        p = 1;
                        textView2.setText("");
                    }
                }
                str = str.substring(0, str.length() - 1);
                textView.setText(str);
            }
            else
                c();
        }

        private void c() {
            textView.setText("");
            textView2.setText("");
            button_del.setText("DEL");
            str = "";
            x = "";
            y = "";
            z = 0;
            i = 0;
            q = 0;
        }

        private void num(String j) {
            if(i==0){
                x=x+j;
            }
            else {
                y=y+j;
                view();
            }
            str=str+j;
            textView.setText(str);
            p=0;
        }

        private void ToString() {
            if(i!=0) {
                if(p==0) {
                    x = Double.toString(z);
                    y = "";
                }
            }
        }

        public void view() {
            if(i==1){
                z=Double.parseDouble(x)+Double.parseDouble(y);}
            if(i==2){
                z=Double.parseDouble(x)-Double.parseDouble(y);}
            if(i==3){
                z=Double.parseDouble(x)*Double.parseDouble(y);}
            if(i==4){
                z=Double.parseDouble(x)/Double.parseDouble(y);}
            textView2.setText(Double.toString(z));
        }
    }
}
