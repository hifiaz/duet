import 'package:duet/locator.dart';
import 'package:duet/services/auth_services.dart';
import 'package:duet/services/navigation_services.dart';
import 'package:duet/utilities/router_constants.dart';
import 'package:stacked/_base_viewmodels.dart';

class HomePageProvider extends BaseViewModel {
  final AuthServices _authServices = locator<AuthServices>();
  final NavigationServices _navigationServices = locator<NavigationServices>();

  Future logout() async {
    await _authServices.logout();
    _navigationServices.navigateTo(AuthViewPageRoute);
    notifyListeners();
  }
}
