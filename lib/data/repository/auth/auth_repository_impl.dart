import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/resources/auth/auth_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUserReq createUserReq) async {
   await sl<AuthFirebaseService>().signup(createUserReq);
  }
  
}