import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular/core.dart'; //coreDirectives
import 'package:angular_forms/angular_forms.dart';  //formDirectives

//backend info
import '../../backend_modulos/Classes/transaction.dart';
import '../../backend_modulos/services/transaction_service.dart';

@Component(
  selector:'Shopping-section',
  templateUrl: 'Shopping_component.html',
  styleUrls: ['Shopping_component.css'],
  directives: [formDirectives,coreDirectives],
)

class Shop implements OnInit{
  Transaction transaction = new Transaction(0,"","NEEC","", 0);
  bool submitted = false;
  bool success = false;
  String out;
  bool loggedin=false;
  bool confirmed_purchase = false;

  @override
  Future<void> ngOnInit() async {
    loggedin= window.localStorage.isNotEmpty;
  }

  TransactionService _transactionService;

  Shop(this._transactionService);

  Future<void> onSubmit() async {
    if(confirmed_purchase == true)
      {
        submitted = true;
        out = await _transactionService.create(transaction, window.localStorage['id']);
        if(out == 'Transaction successful'){
          success = true;
          confirmed_purchase=false;
        }else{
          success = false;
          confirmed_purchase=false;
        }
      }
    else{
      transaction.amount=0;
      transaction.description="";
    }
  }

  void Buy(String Item){
    if(Item=="Led")
      {
        transaction.amount=10;
        transaction.description="Led purchase";

        bool confirm = window.confirm("Pretendes comprar este componente?");
        if(confirm==true)
          {
            confirmed_purchase=true;
          }
      }
    else if(Item=="ECG")
      {
        transaction.amount=10;
        transaction.description="ECG purchase";

        bool confirm = window.confirm("Pretendes comprar este componente?");
        if(confirm==true)
        {
          confirmed_purchase=true;
        }
      }
    else if(Item=="EMG")
    {
      transaction.amount=20;
      transaction.description="EMG purchase";

      bool confirm = window.confirm("Pretendes comprar este componente?");
      if(confirm==true)
      {
        confirmed_purchase=true;
      }
    }
    else{
      transaction.amount=0;
      transaction.description="no purchase (needs debugging?)";

    }
  }

}
