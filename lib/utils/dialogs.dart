import 'package:flutter/material.dart';
import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/utils/styles.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../widgets/login_sheet.dart';


class GateDialog{
  static showAlert(BuildContext context, String title,String msg){
      showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(msg),
                ],
              ),
            ),
            actions: <Widget>[
              GateStyles.getButton('确定', () {
              Navigator.pop(context);
              }, true),
            ],
          );
        },
      );

  }


  static Future<String?> showTextFieldDialog(BuildContext context, String title,String tip,IconData icon) async {

    final form = FormGroup(
    {
      'text': FormControl<String>(
          validators: [Validators.required]),
    },);
  
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                 ReactiveForm(
                            formGroup: form,
                            child: Column(
                              children: <Widget>[
                 ReactiveTextField(
                  decoration: GateStyles.getTextFieldDec(
                      tip, Icon(icon)),
                  formControlName: 'text',
                  validationMessages: (control) =>
                      {'required': '需要输入信息'},
                ),]))
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop('nil');
              },
            ),
            GateStyles.getButton('确定', (){Navigator.of(context).pop(form.control('text').value);},true),
          ],
        );
      },
    );
  }

  static showErrorAlert(BuildContext context, int code) {
    showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('好像有一个错误'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('代码 '+code.toString()),
              ],
            ),
          ),
          actions: <Widget>[
            GateStyles.getButton('确定',(){Navigator.of(context).pop();},true),
          ],
        );
      },
    );
  }

  

  static showFunctionAlert(BuildContext context, String title,String msg,Function() func){
      showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(msg),
                ],
              ),
            ),
            actions: <Widget>[
            FlatButton(
              child:  Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
              GateStyles.getButton('确定', () {
              Navigator.of(context).pop();
               func();
            }, true),
            ],
          );
        },
      );}

  static showLoginAlert(BuildContext context){
      showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('请登录'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('为实现个性化服务，产品核心功能需登录使用~'),
                ],
              ),
            ),
            actions: <Widget>[
              GateStyles.getButton('确定', () {
              // Navigator.of(context).pop();
              Navigator.pop(context);
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    //这里是modal的边框样式
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return LoginSheet(1);
                  });
              }, true),
            ],
          );
        },
      );
  }


  static showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {return false;},

          child: UnconstrainedBox(//在Dialog的外层添加一层UnconstrainedBox
          constrainedAxis: Axis.vertical,
          child: SizedBox(//再用SizeBox指定宽度
            width: 100,
            child: Dialog(
              insetPadding: EdgeInsets.zero,
              child: Container(
                color: Colors.white,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                    backgroundColor: gateAccentExLightColor,
                  ),
                    const Padding(padding: EdgeInsets.only(bottom: 16)),
                    const Text(
                        '加载中',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                ]
                ),
              ),
            ),
          ),
        ),);
      },
    );

    //1秒后关闭
    // Future.delayed(const Duration(milliseconds: 1000), () {
    //   Navigator.pop(context); 
    //   // print('延时1s执行');
    // });
    
  }
}