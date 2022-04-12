import 'package:flutter/material.dart';
import 'package:gatelligence/utils/systemColorSettings.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/service/services.dart';
import 'package:gatelligence/widgets/gateRoot.dart';
import 'package:gatelligence/utils/welcomeAnimControl.dart';
import 'package:gatelligence/utils/dialogs.dart';

class RegisterSheet extends StatefulWidget {
  int type = 1;

  RegisterSheet(int t, {Key? key}) : super(key: key) {
    type = t;
  }
  @override
  _RegisterSheetState createState() => _RegisterSheetState(type);
}

class _RegisterSheetState extends State<RegisterSheet> {
  int type = 1;

  _RegisterSheetState(int t) {
    type = t;
  }

  final form = FormGroup({
    'nickName': FormControl<String>(validators: [Validators.required]),
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email]),
    'password': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8),
    ]),
    'passwordConfirmation': FormControl<String>(),
  }, validators: [
    Validators.mustMatch('password', 'passwordConfirmation')
  ]);


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
                        '以邮箱注册',
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
                                  decoration: getTextFieldDec("用户名",const Icon(Icons.person_outline_outlined)),
                                  formControlName: 'nickName',
                                  validationMessages: (control) =>
                                      {'required': '需要指定用户名'},
                                ),
                                const Padding(padding: EdgeInsets.only(bottom: 16)),
                                ReactiveTextField(
                                  decoration: getTextFieldDec(
                              "邮箱", const Icon(Icons.mail_outline_outlined)),
                                  formControlName: 'email',
                                  validationMessages: (control) =>
                                       {'required': '需要指定邮箱','email':'不是有效的邮箱'},
                                ),
                                const Padding(padding: EdgeInsets.only(bottom: 16)),
                                ReactiveTextField(
                                  formControlName: 'password',
                                  decoration: getTextFieldDec(
                              "密码", const Icon(Icons.password_outlined)),
                                  obscureText: true,
                                  validationMessages: (control) => {
                                    'required': '需要创建密码',
                                    'minLength': '密码长度至少为8位'
                                  },
                                ),
                                const Padding(padding: EdgeInsets.only(bottom: 16)),
                                ReactiveTextField(
                                   decoration: getTextFieldDec(
                              "确认密码", const Icon(Icons.password_outlined)),
                                  formControlName: 'passwordConfirmation',
                                  obscureText: true,
                                   validationMessages: (control) =>
                              {'mustMatch': '两次密码输入不一致', 'minLength': '密码长度至少为8位'},
                                ),
                                const Padding(padding: EdgeInsets.only(bottom: 16)),
                                 ReactiveFormConsumer(
                                  builder: (context, form, child) {
                                    return MaterialButton(
                                      child: const Text(
                                        '立即注册',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: form.valid ? _onSubmit : null,
                                      color: gateAccentColor,
                                      disabledColor: gateDisabledColor,
                                      textColor: Colors.white,
                                      elevation: 0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(8.0)),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
              ],
            )));
  }

  void _onSubmit() {
    GateDialog.showLoading(context);
    Service.registerViaEmail(
            form.control('email').value, form.control('password').value, form.control('nickName').value)
        .then((value) {
        Navigator.pop(context);//关闭加载动画
      if (value) {
          Service.loginViaEmail(
                form.control('email').value, form.control('password').value)
            .then((value) {
          if (value) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => GateAppRoot()),
                // ignore: unnecessary_null_comparison
                (route) => route == null);
            WelAnimCntl.deactivate();
            utilsSetWhiteSystemColor();
          } else {
            GateDialog.showAlert(context, "错误", "自动登录失败~");
          }
        });
      } else {
        GateDialog.showAlert(context, "错误", "邮箱已被占用~");
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

class MySubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context);
    return MaterialButton(
      child: const Text(
        '注册',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      onPressed: form!.valid ? _onPressed : null,
      color: gateAccentColor,
      textColor: Colors.white,
      elevation:0,
      shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
    );
  }

  void _onPressed() {
    print('Hello Reactive Forms!!!');
  }
}

