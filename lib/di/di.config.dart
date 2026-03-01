// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/mapper/sources_mapper.dart' as _i1018;
import '../data/repository/news_repository/data_sources/local_data_source.dart'
    as _i958;
import '../data/repository/news_repository/data_sources/remote_data_source.dart'
    as _i789;
import '../data/repository/news_repository/news_repository.dart' as _i592;
import '../domain/repository/news_repository.dart' as _i263;
import '../domain/use_case/load_source_use_case.dart' as _i1012;
import '../ui/screens/navigation/tabs/news/news_view_model.dart' as _i451;
import 'get_it_module.dart' as _i1015;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final connectivityModule = _$ConnectivityModule();
    gh.factory<_i1018.SourcesMapper>(() => _i1018.SourcesMapper());
    gh.factory<_i895.Connectivity>(() => connectivityModule.getConnectivity());
    gh.factory<_i958.LocalDataSource>(() => _i958.LocalDataSourceImpl());
    gh.factory<_i789.RemoteDataSource>(() => _i789.RemoteDataSourceImpl());
    gh.factory<_i263.NewsRepository>(
      () => _i592.NewsRepositoryImpl(
        localDataSource: gh<_i958.LocalDataSource>(),
        remoteDataSource: gh<_i789.RemoteDataSource>(),
        connectivity: gh<_i895.Connectivity>(),
        mapper: gh<_i1018.SourcesMapper>(),
      ),
    );
    gh.factory<_i1012.LoadSourceUseCase>(
      () =>
          _i1012.LoadSourceUseCase(newsRepository: gh<_i263.NewsRepository>()),
    );
    gh.factory<_i451.NewsViewModel>(
      () => _i451.NewsViewModel(
        loadSourceUseCase: gh<_i1012.LoadSourceUseCase>(),
      ),
    );
    return this;
  }
}

class _$ConnectivityModule extends _i1015.ConnectivityModule {}
