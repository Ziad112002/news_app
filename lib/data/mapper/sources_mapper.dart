import 'package:injectable/injectable.dart';
import 'package:news/data/models/remote_source.dart';
import 'package:news/domain/model/source.dart';
@injectable
class SourcesMapper {
  Source toSource(RemoteSource remoteSource){
    return Source(remoteSource.id??"", remoteSource.name??"");
  }
  List<Source> toSources(List<RemoteSource> remoteSources){
    List<Source> sources=remoteSources.map((remoteSource)=>toSource(remoteSource)).toList();
    return sources ;
  }
}