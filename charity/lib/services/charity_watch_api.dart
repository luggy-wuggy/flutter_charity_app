import 'package:charity/constants/api_strings.dart';
import 'package:http/http.dart' as http;
import 'package:charity/models/charity_info.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Charity>> fetchCharities() async {
    var response = await client.get(APiStrings.charityURI);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return charityFromJson(jsonString);
    } else {
      //show error message
      return [];
    }
  }

  static Future<List<Charity>> fetchCharitiesByCategory(int i) async {
    var response = await client.get(APiStrings().uriByCategory(i)!);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      print('gello');
      return charityFromJson(jsonString);
    } else {
      //show error message
      return [];
    }
  }

  static Future<List<Charity>> fetchCharitiesBySearch(String s) async {
    if (s != null) {
      print(s);
      var response = await client.get(APiStrings().uriBySearch(s)!);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
        return charityFromJson(jsonString);
      } else {
        //show error message
        return [];
      }
    } else {
      return [];
    }
  }
}
