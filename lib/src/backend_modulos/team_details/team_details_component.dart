import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import '../Classes/team.dart';
import '../services/team_service.dart';
import '../../route_paths.dart';


@Component(
  selector: 'team-details',
  directives: [coreDirectives, formDirectives, routerDirectives],
  templateUrl: 'team_details_component.html',
)
class TeamDetailsComponent implements OnActivate {
  Team team;

  final TeamService _teamService;

  TeamDetailsComponent(this._teamService);

  @override
  void onActivate(_, RouterState current) async {
    final teamName = getName(current.parameters);
    if (teamName != null) team = await (_teamService.getTeam(teamName));
    print(team.project.title);
  }

}
