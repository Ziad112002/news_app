import 'package:hive_flutter/hive_flutter.dart';
import 'package:news/data/models/article.dart';

class LocalDataArticles {
  String boxName = "news";
  Future<List<Article>?> loadNewsArticles(String sourceId) async {
    var box = await Hive.openBox(boxName);
    final data = box.get(sourceId);
    if (data == null) return null;
    List<Article>? articles = (data as List<dynamic>).cast<Article>();

    return articles;
  }

  Future<void> saveArticles(String sourceId, List<Article> articles) async {
    var box = await Hive.openBox(boxName);
    box.put(sourceId, articles);
  }
}

class ArticleAdapter extends TypeAdapter<Article> {
  @override
  final int typeId = 1;

  @override
  Article read(BinaryReader reader) {
    final json = Map<String, dynamic>.from(reader.read() as Map);
    return Article.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, Article obj) {
    writer.write(obj.toJson());
  }
}
