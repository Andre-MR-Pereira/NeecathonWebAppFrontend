import 'package:angular/angular.dart';
import 'package:angular/core.dart'; //coreDirectives
import 'package:angular_forms/angular_forms.dart';  //formDirectives

@Component(
  selector:'Shopping-section',
  templateUrl: 'Shopping_component.html',
  directives: [formDirectives,coreDirectives],
)

class Shop{

}
