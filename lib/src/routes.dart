import 'package:angular_router/angular_router.dart';

import 'backend_modulos/login/login_component.template.dart' as login_template;
import 'geral.template.dart' as shop_template;

import 'route_paths.dart';

export 'route_paths.dart';

class Routes{
  static final Login= RouteDefinition(
    routePath: RoutePaths.login,
    component: login_template.LoginComponentNgFactory,
  );

  static final Compras= RouteDefinition(
    routePath: RoutePaths.compras,
    component: shop_template.GeneralViewNgFactory,   //nome da funcao e NgFactory
  );

  static final all= <RouteDefinition>[
    Login,
    Compras,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.compras.toUrl(),
    ),
  ];
}

