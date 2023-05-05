package io.github.nini22p.player;

import android.content.Intent;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Handler;
import android.os.Message;
import android.support.v4.view.MotionEventCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ProgressBar;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;

import java.io.IOException;

public class MainActivity extends AppCompatActivity {

    private static MediaPlayer mediaPlayer = null;
    private static Thread thread = null;
    private Handler handler;
    private String[] list= {"snow_halation","R.raw.flymetothemoon"};
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        final Button button_play = (Button)findViewById(R.id.button_play);
        TextView music_time = (TextView)findViewById(R.id.music_time);
        final TextView this_time = (TextView)findViewById(R.id.this_time);
        final SeekBar seekBar = (SeekBar)findViewById(R.id.seekBar);
        handler = new Handler(){
            public void handleMessage(Message message){
                switch (message.what){
                    case 0:{
                        this_time.setText(timeParse(message.arg1));
                        seekBar.setProgress(message.arg2);
                        mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
                            @Override
                            public void onCompletion(MediaPlayer mp) {
                                thread = null;
                                button_play.setBackgroundResource(R.drawable.play_button);
                                seekBar.setProgress(0);
                                this_time.setText("00:00");
                            }
                        });
                    }
                }
            }
        };
        //启动时监听状态
        if (mediaPlayer == null){
            mediaPlayer = MediaPlayer.create(MainActivity.this,R.raw.snow_halation);
            int times = mediaPlayer.getDuration()/1000;
            music_time.setText(timeParse(times));
        }
        else {
            //监听播放状态
            if (mediaPlayer.isPlaying() == true) {
                button_play.setBackgroundResource(R.drawable.pause);
                thread = null;
                timer();
                int times = mediaPlayer.getDuration()/1000;
                music_time.setText(timeParse(times));
            }
            if (mediaPlayer.isPlaying() == false){
                int times = mediaPlayer.getDuration()/1000;
                int this_times = mediaPlayer.getCurrentPosition()/1000;
                int progress = this_times*100/times;
                seekBar.setProgress(progress);
                music_time.setText(timeParse(times));
                this_time.setText(timeParse(this_times));
            }
        }
        //拖动条监听
        seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (fromUser == true) {
                    int times = mediaPlayer.getDuration();
                    times = times * progress / 100000;
                    this_time.setText(timeParse(times));
                }
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
                int times = mediaPlayer.getDuration();
                int progress = seekBar.getProgress();
                times = times*progress/100;
                mediaPlayer.seekTo(times);
            }
        });
        seekBar.setOnTouchListener(new SeekBar.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                switch (event.getAction()){
                    case MotionEvent.ACTION_DOWN:
                    {

                    }
                    case MotionEvent.ACTION_UP:
                    {

                    }
                }
                return false;
            }
        });
    }

    public void play(View v) {
        Button button_play = (Button)findViewById(R.id.button_play);
        if (mediaPlayer.isPlaying() == false) {
            mediaPlayer.start();
            if (thread == null)
                timer();
            TextView music_time = (TextView)findViewById(R.id.music_time);
            int times = mediaPlayer.getDuration()/1000;
            music_time.setText(timeParse(times));
            button_play.setBackgroundResource(R.drawable.pause);
        }
        else {
            mediaPlayer.pause();
            button_play.setBackgroundResource(R.drawable.play_button);
            thread = null;
        }
    }

    public void play_list(View v){
        this.startActivity(new Intent(this,Play_list.class));
    }

    public void timer(){
        thread = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    while (mediaPlayer.isPlaying() == true) {
                        int times = mediaPlayer.getDuration() / 1000;
                        int this_time = mediaPlayer.getCurrentPosition() / 1000;
                        int progress = this_time*100/times;
                        Message message = new Message();
                        message.arg1 = this_time;
                        message.arg2 = progress;
                        message.what = 0;
                        handler.sendMessage(message);
                    }
                } catch (Exception e){
                    e.printStackTrace();
                }
            }
        });
        thread.start();
    }

    public static String timeParse(int duration) {
        String time = "" ;
        int minute = duration / 60 ;
        int seconds = duration % 60 ;
        int second = Math.round((float)seconds) ;
        if( minute < 10 ){
            time += "0" ;
        }
        time += minute+":" ;
        if( second < 10 ){
            time += "0" ;
        }
        time += second ;
        return time ;
    }
    public void next(View v){

    }

    public void last(View v){

    }
}
