import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular/core.dart'; //coreDirectives
import 'package:angular_forms/angular_forms.dart';  //formDirectives
import 'package:angular_router/angular_router.dart';

//backend info
import '../../../backend_modulos/Classes/transaction.dart';
import '../../../backend_modulos/services/transaction_service.dart';



@Component(
  selector:'Purchase_log',
  templateUrl: 'Purchases_component.html',
  directives: [formDirectives,coreDirectives,routerDirectives],
)

class PurchaseLog implements OnInit{
  Transaction transaction = new Transaction(0,"keks","ok","none", 0);

  Transaction saver;

  Storage Log = window.localStorage;

  TransactionService _transactionService;

  PurchaseLog(this._transactionService);

  List<Transaction> purchases;

  @override
  Future<void> ngOnInit() async {
    purchases = await _transactionService.getMyTransactions(Log['id']);
  }

}
