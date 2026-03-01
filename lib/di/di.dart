import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:news/data/mapper/sources_mapper.dart';
import 'package:news/data/repository/news_repository/data_sources/local_data_source.dart';
import 'package:news/data/repository/news_repository/data_sources/remote_data_source.dart';
import 'package:news/data/repository/news_repository/news_repository.dart';
import 'package:news/domain/repository/news_repository.dart';
import 'package:news/domain/use_case/load_source_use_case.dart';
import 'package:news/ui/screens/navigation/tabs/news/news_view_model.dart';

final getIt = GetIt.instance;
void initDependencies() {
  getIt.registerFactory<LocalDataSource>(()=>LocalDataSourceImpl());
  getIt.registerFactory<RemoteDataSource>(()=>RemoteDataSourceImpl());
  getIt.registerFactory(()=>Connectivity());
  getIt.registerFactory(()=>SourcesMapper()); // this code  written not generated
  getIt.registerFactory<NewsRepository>(
    () => NewsRepositoryImpl(
      localDataSource: getIt(),
      remoteDataSource: getIt(),
      connectivity: getIt(),
      mapper: getIt(),
    ),
  );
  getIt.registerFactory(() => LoadSourceUseCase( newsRepository: getIt()));
  getIt.registerFactory(() => NewsViewModel(loadSourceUseCase: getIt()));
}
