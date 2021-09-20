import './screens/products.dart';

import 'screens/register.dart';
import '/screens/login.dart';
import '/screens/home.dart';
import '/screens/users.dart';

getRoutes() {
  return {
    Register.route: (context) => Register(),
    Login.route: (context) => Login(),
    Home.route: (context) => Home(),
    UserView.route: (context) => UserView(),
    ProductsOverviewScreen.route: (context) => ProductsOverviewScreen(),
  };
}
