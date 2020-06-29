import 'dart:convert';

class Quotes {
  int count, totalCount, lastItemIndex;
  List lstResults;

  Quotes.fromJson(String responseData) {
    Map mapQuotes = jsonDecode(responseData);
    print(mapQuotes);

    count = mapQuotes["count"];
    totalCount = mapQuotes["totalCount"];
    lastItemIndex = mapQuotes["lastItemIndex"];

    lstResults = mapQuotes["results"];
  }
}

class Tags {
  List<Tag> lstTags = new List();

  Tags.fromJson(String responseData) {
    List lstFetchedTags = jsonDecode(responseData);

    lstFetchedTags.forEach((element) {
      Tag tag = new Tag.fromMap(element);

      lstTags.add(tag);
    });
  }
}

class Tag {
  String id, name;
  int quoteCount;

  Tag.fromMap(Map mapTag) {
    id = mapTag["_id"];
    name = mapTag["name"];
    quoteCount = mapTag["quoteCount"];
  }
}

class RandomQuote {
  String id, author, content;
  int length;
  List lstTags;

  RandomQuote.fromJson(String responseData) {
    Map mapData = jsonDecode(responseData);

    id = mapData["_id"];
    author = mapData["author"];
    content = mapData["content"];
    length = mapData["length"];

    lstTags = mapData["tags"];
  }
}
