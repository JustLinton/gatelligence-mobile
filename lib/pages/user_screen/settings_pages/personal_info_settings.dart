import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gatelligence/entity/fetchUserInfoResponse.dart';
import 'package:gatelligence/service/services.dart';
import 'package:gatelligence/utils/dialogs.dart';
import 'package:gatelligence/utils/localStorage.dart';
import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/pages/user_screen/user_settings_group.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../utils/styles.dart';
// import 'package:gatelligence/utils/systemColorSettings.dart';


class PersonalInfoSettings extends StatefulWidget {

  final userScreenRefreshFunc;

  PersonalInfoSettings(this.userScreenRefreshFunc);

  _PersonalInfoSettingsState createState() => _PersonalInfoSettingsState();
}

class _PersonalInfoSettingsState extends State<PersonalInfoSettings> {

  FetchUserInfoResponse _userInfo=FetchUserInfoResponse();

  Column getSettingsColumn(context){

    var nickName = _userInfo.nickName;
    var gender = _userInfo.gender;

     return Column(
      children: <Widget>[
        ListTile(
          title: Text('昵称'),
          subtitle: Text(nickName==null?'设置昵称':nickName),
          leading: Column(children: [Icon(Icons.person_outline_outlined),],mainAxisAlignment: MainAxisAlignment.center,) ,
          trailing: Icon(Icons.keyboard_arrow_right),
          enabled: true,
          onTap: () async{
            GateDialog.showTextFieldDialog(context, '昵称', '输入昵称',Icons.person_outline_outlined).then((value) {
              var newName=value;
              if(newName!=null){
                if(newName=='nil'){
                  return;
                }
                _userInfo.nickName=newName;
                GateDialog.showLoading(context);
                Service.setUserBasicInfo(_userInfo).then((value){
                  Navigator.pop(context);
                  var errMsg=value.errorMsg;
                  var success=value.isSuccess;
                  if(success!=null&&success){
                      widget.userScreenRefreshFunc();
                  }else{
                    GateDialog.showAlert(context, '失败', '个人信息设置失败');
                  }
                });
              }else{
                 GateDialog.showAlert(context, '失败', '信息不能为空');
              }
            
            });
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => PersonalInfoSettings(1),
            //   ),
            // );
          },
        ),
        Divider(
          height: 0.0,
          indent: 0.0,
          color: Color.fromARGB(255, 161, 174, 233),
        ),
        ListTile(
          title: Text('性别'),
          subtitle: Text(gender == null ? '设置性别' : gender),
          leading: Column(children: [Icon(Icons.beach_access_outlined),],mainAxisAlignment: MainAxisAlignment.center,) ,
          trailing: Icon(Icons.keyboard_arrow_right),
          enabled: true,
           onTap: () async{
            showGenderDialog(context).then((value) {
              var newName=value;
              if (newName == 'nil') {
                return;
              }
              if(newName!=null){
                _userInfo.gender=newName;
                GateDialog.showLoading(context);
                Service.setUserBasicInfo(_userInfo).then((value){
                  Navigator.pop(context);
                  var errMsg=value.errorMsg;
                  var success=value.isSuccess;
                  if(success!=null&&success){
                      widget.userScreenRefreshFunc();
                  }else{
                    GateDialog.showAlert(context, '失败', '个人信息设置失败');
                  }
                });
              }else{
                 GateDialog.showAlert(context, '失败', '信息不能为空');
              }
            
          });}
        ),
     
      ],
    );
  }

  void loadFromCache() async{
    LocalStorage.getString('lastFip').then((value){
      try{
        setState(() {
           _userInfo = FetchUserInfoResponse.fromJson(jsonDecode(value));
        });
       
        // print(_userInfo.toJson().toString());
      }catch(e){
        setState(() {
           _userInfo = FetchUserInfoResponse();
        });
        // print(_userInfo.toJson());
      }
    });
  }


  Future<String?> showGenderDialog(BuildContext context) async {
    final form = FormGroup(
      {
        'text': FormControl<String>(validators: [Validators.required]),
      },
    );

    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('设置性别'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ReactiveForm(
                    formGroup: form,
                    child: Column(children: <Widget>[
                      ReactiveDropdownField(
                        decoration: GateStyles.getTextFieldDec('性别', Icon(Icons.beach_access_outlined)),
                        formControlName: 'text',
                        validationMessages: (control) => {'required': '需要输入信息'}, items: [
                          DropdownMenuItem<String>(value: "男",child: Text('男'),),
                           DropdownMenuItem<String>(
                            value: "女",
                            child: Text('女'),
                          ),
                           DropdownMenuItem<String>(
                            value: "保密",
                            child: Text('保密'),
                          )
                          ],
                      ),
                    ]))
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
            GateStyles.getButton('确定', () {
              Navigator.of(context).pop(form.control('text').value);
            }, true),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    loadFromCache();
    return Scaffold(
      appBar: AppBar(
        title: Text('个人信息'),
        centerTitle: true,
        backgroundColor: gateAccentColor,
        foregroundColor: Colors.white,
        elevation: 0.5,
        shadowColor: gateAccentColor,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_outlined),
        //   onPressed: (){
        //      Navigator.pop(context);
        //      utilsSetGatBlueSystemColor();
        // },),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        // 内容
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: new SliverList(
              delegate: new SliverChildListDelegate(
                <Widget>[
                  UserSettingsGroup.fromCustomized("信息设置",getSettingsColumn(context),
                    widget.userScreenRefreshFunc
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
