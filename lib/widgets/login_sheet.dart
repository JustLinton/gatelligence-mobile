import 'package:flutter/material.dart';
import 'package:gatelligence/service/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/widgets/login_thirdparty_card.dart';
import 'package:gatelligence/widgets/gateRoot.dart';
import 'package:gatelligence/utils/welcomeAnimControl.dart';
import 'package:gatelligence/utils/dialogs.dart';

class LoginSheet extends StatefulWidget {
  int type = 1;

  LoginSheet(int t, {Key? key}) : super(key: key) {
    type = t;
  }
  @override
  _LoginSheetState createState() => _LoginSheetState(type);
}

class _LoginSheetState extends State<LoginSheet> {
  int type = 1;

  _LoginSheetState(int t) {
    type = t;
  }

  final form = FormGroup({
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email]),
    'password': FormControl<String>(validators: [
      Validators.required,
      // Validators.minLength(8),
    ]),
  },
);


  @override
  void initState() {
    super.initState();
  }

@override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        // !important
        child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min, // 设置最小的弹出
              children: <Widget>[
                Row(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 32.0, right: 32.0, top: 32.0, bottom: 0.0),
                      child: Text(
                        '让我们来使你登录',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(left: 32.0, right: 32.0, bottom: 8.0),
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: gateAccentColor, width: 1.3)),
                      ),
                    ),
                  ],
                ),
                 Padding(
                  padding: EdgeInsets.all(32.0),
                  child:  ReactiveForm(
                            formGroup: this.form,
                            child: Column(
                              children: <Widget>[
                                ReactiveTextField(
                                  decoration: getTextFieldDec(
                              "邮箱", const Icon(Icons.mail_outline_outlined)),
                                  formControlName: 'email',
                                  validationMessages: (control) =>
                                       {'required': '需要提供邮箱','email':'不是有效的邮箱'},
                                ),
                                const Padding(padding: EdgeInsets.only(bottom: 16)),
                                ReactiveTextField(
                                  formControlName: 'password',
                                  decoration: getTextFieldDec(
                              "密码", const Icon(Icons.password_outlined)),
                                  obscureText: true,
                                  validationMessages: (control) => {
                                    'required': '需要提供密码',
                                  },
                                ),
                                const Padding(padding: EdgeInsets.only(bottom: 16)),
                                  ReactiveFormConsumer(
                                    builder: (context, form, child) {
                                      return MaterialButton(
                                          child: const Text(
                                            '登录',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: form!.valid ? _onSubmit : null,
                                          color: gateAccentColor,
                                          textColor: Colors.white,
                                          elevation: 0,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.all(Radius.circular(8.0)),
                                          ),
                                        );
                                    },
                                  ),
      
                                const Padding(padding: EdgeInsets.only(bottom: 16)),
                                LoginThirdPartyCard(1)
                              ],
                            ),
                          ),
                        ),
              ],
            )));
  }

  void _onSubmit() {
    Service.loginViaEmail(form.control('email').value, form.control('password').value)
      .then((value){
        if(value){
            Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => GateAppRoot()),
            // ignore: unnecessary_null_comparison
            (route) => route == null);
            WelAnimCntl.deactivate();
        }else{
            GateDialog.showAlert(context, "错误","邮箱和密码不匹配~");
        }
      });
  }


  InputDecoration getTextFieldDec(String title,Icon icon){
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

}

