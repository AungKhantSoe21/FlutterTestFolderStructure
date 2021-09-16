import '/screens/otp.dart';
import '/screens/login.dart';
import '/screens/home.dart';
import '/screens/users.dart';

getRoutes() {
  return {
    Otp.route: (context) => Otp(),
    Login.route: (context) => Login(),
    Home.route: (context) => Home(),
    UserView.route: (context) => UserView()
  };
}
