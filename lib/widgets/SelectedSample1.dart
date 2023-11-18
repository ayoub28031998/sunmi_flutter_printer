import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CarteSamples.dart';

@override
Widget SelectedSample1( )
{
  return FutureBuilder(

    future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> prefs){
        var a = prefs.data;
        if(prefs.hasData){
          bool select1=a?.getBool('Selected1') ?? false;
          if(select1){
            return  CartItemSamples();
          }
        }
        return SizedBox(
          width: 0,
          height: 0,
        );

      }
  );
}