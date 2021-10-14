package com.example.test;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;

import android.content.Intent;
import android.os.Bundle;

import io.flutter.plugin.common.MethodCall;

import io.flutter.plugins.GeneratedPluginRegistrant;
public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "flutter.native/helper";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this.getFlutterEngine());
        new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        if (call.method.equals("helloFromNativeCode")) {



                            Intent i=new Intent(getApplicationContext(),MainActivity2.class);
                            startActivity(i);

                            result.success( 1);
                        }
                    }});
    }
    private String helloFromNativeCode() {
        return "Hello from Native Android Code";
    }
}