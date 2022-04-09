import 'package:gatelligence/utils/localStorage.dart';

class WelAnimCntl{
  static activate(){
    LocalStorage.setBool('showWelcome',true);
  }
  static deactivate(){
    LocalStorage.remove('showWelcome');
  }
}