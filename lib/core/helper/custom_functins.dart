import 'package:flutter/cupertino.dart';

class CustomFunctions{


 static  unfocusTextField (BuildContext context) async {
   FocusScopeNode currentFocus = FocusScope.of(context);
   if (!currentFocus.hasPrimaryFocus) {
     currentFocus.focusedChild?.unfocus();
   }
 }
}