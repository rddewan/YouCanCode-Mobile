

import 'package:youcancode/features/login/data/dto/request/login_request.dart';

abstract interface class ILoginService {
  Future<bool> login(LoginRequest loginRequest);
}