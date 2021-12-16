import 'dart:developer';

class APiStrings {
  static var charityURI = Uri.parse('https://api.data.charitynavigator.org/v2/Organizations?app_id=a71b11e3&app_key=14e84a0b33b1264879cf00974fe28b0c&rated=TRUE&pageSize=10');

  Uri? uriByCategory(int i) {
    try {
      if (i >= 1 && i <= 11) {
        return Uri.parse('https://api.data.charitynavigator.org/v2/Organizations?app_id=a71b11e3&app_key=14e84a0b33b1264879cf00974fe28b0c&rated=TRUE&pageSize=10&categoryID=$i');
      } else if (i == 0) {
        return charityURI;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  Uri? uriBySearch(String s) {
    try {
      return Uri.parse('https://api.data.charitynavigator.org/v2/Organizations?app_id=a71b11e3&app_key=14e84a0b33b1264879cf00974fe28b0c&rated=TRUE&pageSize=10&search=$s&searchType=DEFAULT');
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
