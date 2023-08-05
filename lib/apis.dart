import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample_https/number_fact_resonse/number_fact_resonse.dart';

Future <NumberFactResonse> getNumberFact({required String number}) async {
  final response =
      await http.get(Uri.parse('http://numbersapi.com/$number?json'));

 
 final _jasonAsBody= jsonDecode(response.body)as Map<String,dynamic>;
 final _data=NumberFactResonse.fromJson(_jasonAsBody);
 return _data;
//  print(_jasonAsBody);
}
