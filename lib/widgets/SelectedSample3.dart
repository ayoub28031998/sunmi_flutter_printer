import  'CarteSample3.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CarteSamples.dart';

@override
Widget SelectedSample3( )
{
  return FutureBuilder(

      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> prefs){
        var c = prefs.data;
        if(prefs.hasData){
          bool select3=c?.getBool('Selected3') ?? false;
          if(select3){
            return  CartItemSamples3();
          }
        }
        return SizedBox(
          width: 0,
          height: 0,
        );

      }
  );
}