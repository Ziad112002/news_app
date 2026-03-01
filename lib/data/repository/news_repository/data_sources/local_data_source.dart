import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:news/data/models/remote_source.dart';
@Injectable(as: LocalDataSource)
class LocalDataSourceImpl extends LocalDataSource {
  String boxName = "news";
  @override
  Future<List<RemoteSource>?> loadNewsSource(String categoryName) async {
    var box = await Hive.openBox(boxName);
    final data = box.get(categoryName);
    if (data == null) return null;
    List<RemoteSource>? sources = (data as List<dynamic>).cast<RemoteSource>();
    return sources;
  }

  @override
  Future<void> saveSources(String category, List<RemoteSource> sources) async {
    var box = await Hive.openBox(boxName);
    box.put(category, sources);
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
abstract class LocalDataSource {
  Future<List<RemoteSource>?> loadNewsSource(String categoryName);
  Future<void> saveSources(String category, List<RemoteSource> sources);
}
