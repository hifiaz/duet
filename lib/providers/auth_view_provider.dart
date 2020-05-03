import 'package:duet/locator.dart';
import 'package:duet/services/auth_services.dart';
import 'package:duet/services/navigation_services.dart';
import 'package:duet/utilities/router_constants.dart';
import 'package:stacked/_base_viewmodels.dart';

class AuthViewProvider extends BaseViewModel {
  final AuthServices _authServices = locator<AuthServices>();
  final NavigationServices _navigationServices = locator<NavigationServices>();

  Future handleAuthLogic() async {
    var hasLogin = await _authServices.getUser();
    if (hasLogin?.uid != null) {
      _navigationServices.navigateTo(HomePageRoute);
    } else {
      _navigationServices.navigateTo(LoginPageRoute);
    }
  }
}
