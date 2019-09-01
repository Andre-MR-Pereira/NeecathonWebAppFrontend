class Transaction{
  int id;   //tirei o final
  String destTeam;
  double amount;
  Transaction(this.id, this.destTeam, this.amount);
  String toString() => '$id:  => $destTeam  |  value = $amount';
  Map toJson() => {'id': id, 'destTeam': destTeam, 'value': amount};

  factory Transaction.fromJson(Map<String, dynamic> transaction){
    Transaction model_transaction= new Transaction(0,"", 0);

    model_transaction.id=transaction['id'];
    model_transaction.destTeam=transaction['destTeam'];
    model_transaction.amount=transaction['amount'];

    return model_transaction;
  }
}
