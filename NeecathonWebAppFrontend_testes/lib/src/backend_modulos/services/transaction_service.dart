//import 'dart:html' as prefix0;

import '../Classes/transaction.dart';
import 'package:http/http.dart';
import 'dart:convert';

class TransactionService {

  List<Map<String,dynamic>> transactions;
  final Client _http;
  TransactionService(this._http);

   //String Logtoken = prefix0.window.localStorage.toString();

  var headers = {'Content-Type': 'application/json'};
  Future<String> create(Transaction transaction, String token) async {
    try {
      headers['Authorization'] = 'Bearer ' + token;
      final reponse = await _http.post("http://51.145.20.150:1995/" + "transactions/create/", headers: headers, body: json.encode(transaction.toJson()));
      return(reponse.body);
    }catch (e){
      return "No internet connection";
    }
  }

  Future<List<Transaction>> getTransactionsFromTeamName(String teamName) async{
    try{
      final response = await _http.get("http://51.145.20.150:1995/" + "transactions/" + teamName, headers: headers);

      //print(_extractData(response) as List);
      //print(Transaction.fromJson(_extractData(response)));

      final transactions=(_extractData(response) as List)
        .map((value) => Transaction.fromJson(value))   //Transaction.fromJson(json.decode(response.body)))??? ja vem com o extract data?
        .toList();

      //print(_extractData(response) as List);
      //print(Transaction.fromJson(_extractData(response)));
      //print(teamtransactions);

      return transactions;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future<List<Transaction>> getMyTransactions(String token) async{
    try{
      headers['Authorization'] = 'Bearer ' + token;

      final response = await _http.get("http://51.145.20.150:1995/" + "transactions/me/", headers: headers);

      final transactions=(_extractData(response) as List)
          .map((value) => Transaction.fromJson(value))
          .toList();

      return transactions;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  dynamic _extractData(Response resp) => json.decode(resp.body);
}
