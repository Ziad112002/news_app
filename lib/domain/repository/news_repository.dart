import 'package:news/domain/model/source.dart';

abstract class NewsRepository {
  Future<List<Source>> loadNewsSource(String categoryName);
}