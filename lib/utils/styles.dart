import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gatelligence/utils/myColor.dart';
import 'package:reactive_forms/reactive_forms.dart';

class GateStyles{
  static InputDecoration getTextFieldDec(String title, Icon icon) {
    return InputDecoration(
      labelText: title,
      icon: icon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 2.0,
        ),
      ),
    );
  }

  static Padding getButton(String text,Function() func,bool enabled){
              return Padding(padding: EdgeInsets.only(right: 16),child: MaterialButton(
                  child: Text(
                    text,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: enabled? func:null,
                  color: gateAccentColor,
                  disabledColor: gateDisabledColor,
                  textColor: Colors.white,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),);  
  }
}