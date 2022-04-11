import 'package:flutter/material.dart';
import 'package:gatelligence/pages/home_screen.dart';
import 'package:gatelligence/service/services.dart';
import 'package:gatelligence/utils/systemColorSettings.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/widgets/login_thirdparty_card.dart';
import 'package:gatelligence/widgets/gateRoot.dart';
import 'package:gatelligence/utils/welcomeAnimControl.dart';
import 'package:gatelligence/utils/dialogs.dart';

class LinkModeCreateSheet extends StatefulWidget {

  late GlobalKey<HomeScreenState> homeScreenKey;

  LinkModeCreateSheet(this.homeScreenKey);

  @override
  _LinkModeCreateSheetState createState() => _LinkModeCreateSheetState();
}

class _LinkModeCreateSheetState extends State<LinkModeCreateSheet> {


  _LinkModeCreateSheetState() {}

  final form = FormGroup(
    {
      'link': FormControl<String>(
          validators: [Validators.required]),
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
                        '链接模式',
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
                  child: ReactiveForm(
                    formGroup: this.form,
                    child: Column(
                      children: <Widget>[
                        ReactiveTextField(
                          decoration: getTextFieldDec(
                              "视频链接(BiliBili)", const Icon(Icons.link_outlined)),
                          formControlName: 'link',
                          validationMessages: (control) =>
                              {'required': '需要通过链接', 'email': '不是有效的邮箱'},
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 32)),
                        ReactiveFormConsumer(
                          builder: (context, form, child) {
                            return FloatingActionButton(
                              child: const Icon(
                                Icons.send_rounded,
                                size: 30,
                              ),
                              onPressed: _onSubmit,
                            );
                          },
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 16)),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }

  void _onSubmit() {
    GateDialog.showLoading(context);
    Service.createLinkTransaction(
            form.control('link').value)
        .then((value) {
      Navigator.pop(context); //关闭加载动画
      
      var success = value.isSuccess;
      var errMsg = value.errorMsg;
      var tid = value.transactionID;
      if (success != null && errMsg != null && tid != null) {
        if (success) {
          Navigator.pop(context);
          // Navigator.of(context).pushAndRemoveUntil(
          //     MaterialPageRoute(builder: (context) => GateAppRoot()),
          //     // ignore: unnecessary_null_comparison
          //     (route) => route == null);
          // utilsSetWhiteSystemColor();
          widget.homeScreenKey.currentState?.doRefresh();
        } else {
          if (errMsg == "501") {
            GateDialog.showLoginAlert(context);
          }
        }
      } else {
        GateDialog.showAlert(context, "错误", "未知错误");
      }
    });
  }

  InputDecoration getTextFieldDec(String title, Icon icon) {
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




