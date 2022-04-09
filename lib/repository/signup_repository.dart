import 'package:marvel_guide/model/user_model.dart';

class SignupRepository {
  Future<bool> doRegister(UserModel user) async {
    await Future.delayed(const Duration(seconds: 2));
    return user.email == 'abc@' && user.password == '123'; 
  }
}