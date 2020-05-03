import 'package:duet/services/auth_services.dart';
import 'package:duet/services/navigation_services.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => NavigationServices());
  locator.registerLazySingleton(() => AuthServices());
}