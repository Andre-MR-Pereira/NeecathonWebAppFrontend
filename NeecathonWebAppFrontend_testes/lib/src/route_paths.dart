import 'package:angular_router/angular_router.dart';

const nameParam= 'name';

class RoutePaths{
  static final login= RoutePath(path: 'user/login');
  static final teams = RoutePath(path: 'teams/');
  static final team_details = RoutePath(path: '${teams.path}/:$nameParam');
  static final compras = RoutePath(path: 'geral/');
  static final register = RoutePath(path: 'user/register');
}

String getName(Map<String, String> parameters) {
  final name = parameters[nameParam];
  return name == null ? null : name;
}
