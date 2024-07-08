import 'package:get/get.dart';
import 'package:water_billing_app/app/pages/home/home_screen.dart';
import 'package:water_billing_app/app/pages/user/add_user.dart';
import 'package:water_billing_app/app/pages/user/user_list_page.dart';

class AppRoutes {
  static String home = '/';
  static String users = '/users';
  static String addUsers = '/addUsers';
  static String bills = '/bills';
  static String addBills = '/addbills';

  static String getHomeRoute() => home;
  static String getUsersRoute() => users;
  static String addUsersRoute() => addUsers;
  static String getBillsRoute() => bills;
  static String addBillsRoute() => addBills;

  static List<GetPage> routes = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: users, page: () => const UsersListPage(), transition: Transition.leftToRightWithFade, transitionDuration: const Duration(seconds: 1)),
    GetPage(name: addUsers, page: () => AddUserPage(), transition: Transition.zoom, transitionDuration: const Duration(seconds: 1)),
    // GetPage(name: home, page: () => const HomeScreen()),
    // GetPage(name: home, page: () => const HomeScreen()),
    
  ];
}
