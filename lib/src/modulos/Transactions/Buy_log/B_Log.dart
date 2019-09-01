import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular/core.dart'; //coreDirectives
import 'package:angular_forms/angular_forms.dart';  //formDirectives
import 'package:angular_router/angular_router.dart';
import 'package:uniao/src/modulos/Transactions/Purchase/Transaction_request.dart';

//backend info
import '../../../backend_modulos/Classes/team.dart';
import '../../../backend_modulos/Classes/transaction.dart';
import '../../../backend_modulos/services/transaction_service.dart';


@Component(
  selector:'Purchase_log',
  templateUrl: 'Purchases_component.html',
  directives: [formDirectives,coreDirectives,routerDirectives],
)

class PurchaseLog implements OnInit{
  Transaction transaction = new Transaction(0, "", 0);
  Team equipa;
  String teste="FIRST"; //to delete afterwards

  TransactionService _transactionService;

  List<Transaction> purchases;

  @override
  Future<void> ngOnInit() async {
    /*purchases = await _transactionService.getTransactionsFromTeamName(equipa.name);    oficial */
    purchases = await _transactionService.getTransactionsFromTeamName(teste);
  }

}
