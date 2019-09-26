class Transaction{
  int id;   //tirei o final
  String sourceTeam;
  String destTeam;
  String description;
  double amount;
  Transaction(this.id,this.sourceTeam, this.destTeam, this.description, this.amount);
  String toString() => '$id:  => $destTeam  |  value = $amount|  description = $description| sourceTeam = $sourceTeam';
  Map toJson() => {'id': id, 'sourceTeam':sourceTeam, 'destTeam': destTeam, 'description': description, 'value': amount};

  factory Transaction.fromJson(Map<String,dynamic> transaction){
    Transaction model_transaction= new Transaction(0,"","","", 0);
    print(transaction['id']);
    print(transaction['sourceTeam']);
    print(transaction['destTeam']);
    print(transaction['description']);
    print(transaction['amount']);

    model_transaction.id=transaction["id"];
    model_transaction.sourceTeam=transaction["sourceTeam"];
    model_transaction.destTeam=transaction["destTeam"];
    model_transaction.description=transaction['description'];
    model_transaction.amount=transaction["amount"];
    return model_transaction;
  }
}
