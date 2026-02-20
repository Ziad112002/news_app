import 'package:hive_flutter/hive_flutter.dart';
import 'package:news/models/source.dart';

class LocalDataSource {
  Future<List<Source>?> loadNewsSource(String categoryName) async {
    var box = await Hive.openBox("news");
    List<Source>? sources = box.get(categoryName);
    return sources;
  }

  Future<void> saveSources(String category, List<Source> sources) async {
    var box = await Hive.openBox("news");
    box.put(category, sources);
  }
}

class SourceAdapter extends TypeAdapter<Source> {
  @override
  Source read(BinaryReader reader) {
    var json = Map<String, dynamic>.from(reader.read() as Map);
    return Source.fromJson(json);
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Source obj) {
    writer.write(obj.toJson());
  }
}
