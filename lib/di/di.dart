import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


import 'di.config.dart';

final getIt = GetIt.instance;


@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void initDependencies() => getIt.init();
// void initDependencies() {
//   getIt.registerFactory<LocalDataSource>(()=>LocalDataSourceImpl());
//   getIt.registerFactory<RemoteDataSource>(()=>RemoteDataSourceImpl());
//   getIt.registerFactory(()=>Connectivity());
//   getIt.registerFactory(()=>SourcesMapper()); // this code  written not generated
//   getIt.registerFactory<NewsRepository>(
//     () => NewsRepositoryImpl(
//       localDataSource: getIt(),
//       remoteDataSource: getIt(),
//       connectivity: getIt(),
//       mapper: getIt(),
//     ),
//   );
//   getIt.registerFactory(() => LoadSourceUseCase( newsRepository: getIt()));
//   getIt.registerFactory(() => NewsViewModel(loadSourceUseCase: getIt()));
// }
