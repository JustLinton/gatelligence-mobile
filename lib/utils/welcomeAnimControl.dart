import 'package:gatelligence/utils/localStorage.dart';

class WelAnimCntl{
  static deactivate(){
    LocalStorage.setBool('showWelcome',true);
  }
  static activate(){
    LocalStorage.remove('showWelcome');
  }
}