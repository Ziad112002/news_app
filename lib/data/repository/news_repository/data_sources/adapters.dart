import 'package:hive_flutter/hive_flutter.dart';
import 'package:news/data/models/remote_article.dart';
import 'package:news/data/models/remote_source.dart';

class ArticleAdapter extends TypeAdapter<RemoteArticle> {
  @override
  final int typeId = 1;

  @override
  RemoteArticle read(BinaryReader reader) {
    final json = Map<String, dynamic>.from(reader.read() as Map);
    return RemoteArticle.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, RemoteArticle obj) {
    writer.write(obj.toJson());
  }
}
class SourceAdapter extends TypeAdapter<RemoteSource> {
  @override
  RemoteSource read(BinaryReader reader) {
    var json = Map<String, dynamic>.from(reader.read() as Map);
    return RemoteSource.fromJson(json);
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, RemoteSource obj) {
    writer.write(obj.toJson());
  }
}
