import 'CarteSample4.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CarteSamples.dart';

@override
Widget SelectedSample4( )
{
  return FutureBuilder(

      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> prefs){
        var d = prefs.data;
        if(prefs.hasData){
          bool select4=d?.getBool('Selected4') ?? false;
          if(select4){
            return  CartItemSamples4();
          }
        }
        return SizedBox(
          width: 0,
          height: 0,
        );

      }
  );
}