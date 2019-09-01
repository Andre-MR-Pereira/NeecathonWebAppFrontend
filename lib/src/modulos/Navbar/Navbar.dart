import 'package:angular/angular.dart';
import 'package:angular/core.dart'; //coreDirectives
import 'package:angular_forms/angular_forms.dart';  //formDirectives

import 'package:angular_router/angular_router.dart';
import 'package:uniao/src/backend_modulos/services/login_service.dart';
import '../../routes.dart';
import '../../route_paths.dart';

@Component(
  selector:'NavBar',
  templateUrl: 'NavBar_component.html',
  providers: [ClassProvider(LoginService)],
  directives: [formDirectives,coreDirectives,routerDirectives],
  exports: [RoutePaths,Routes],
)

class NavBarform{

}
