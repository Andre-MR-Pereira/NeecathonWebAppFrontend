import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular/core.dart'; //coreDirectives
import 'package:angular_forms/angular_forms.dart';  //formDirectives

import 'package:angular_router/angular_router.dart';
import 'package:uniao/src/backend_modulos/create_team/create_team_component.dart';
import 'package:uniao/src/backend_modulos/services/login_service.dart';
import '../../routes.dart';
import '../../route_paths.dart';

@Component(
  selector:'NavBar',
  templateUrl: 'NavBar_component.html',
  providers: [ClassProvider(LoginService),ClassProvider(CreateTeamComponent)],
  directives: [formDirectives,coreDirectives,routerDirectives],
  exports: [RoutePaths,Routes],
)

class NavBarform implements OnInit{
  bool loggedin=false;
  Storage Log = window.localStorage;

  @override
  Future<void> ngOnInit() async {
    loggedin= Log.isNotEmpty;
  }

  ClearLog(){
    Log.clear();
    window.location.reload();
    loggedin=false;
  }

}
