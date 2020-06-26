import 'package:flutterquoteapp/models/quote_model.dart';
import 'package:http/http.dart' as http;

class FetchQuotes {
  //Gets the list of quotes
  Future<Quotes> getQuotes() async {
    http.Response response;

    response = await http.get("https://api.quotable.io/quotes");
    Quotes quotes;
    if (response.statusCode == 200) {
      //successfully loaded

      quotes = Quotes.fromJson(response.body);

      return quotes;
    } else {
      //Error
      return null;
    }
  }
}
