import 'package:get_it/get_it.dart';
import 'package:mim_generator/feature/main/detail/presentation/blocs/meme_detail_bloc.dart';
import 'package:mim_generator/feature/main/grid/data/api/meme_service.dart';
import 'package:mim_generator/feature/main/grid/data/data_source/meme_data_source.dart';
import 'package:mim_generator/feature/main/grid/data/repository_impl/meme_repository_impl.dart';
import 'package:mim_generator/feature/main/grid/domain/repository/meme_repository.dart';
import 'package:mim_generator/feature/main/grid/domain/use_case/meme_use_case.dart';
import 'package:mim_generator/feature/main/grid/presentation/blocs/meme_bloc.dart';
import 'package:mim_generator/feature/main/save_share/presentation/blocs/save_share_bloc.dart';

final locator = GetIt.instance;

class MainLocator {
  static void init() {
    /// Register service
    locator.registerFactory(() => MemeService());

    /// Register data source
    locator.registerLazySingleton<MemeDataSource>(() => MemeDataSourceImpl(locator()));

    /// Register repository
    locator.registerLazySingleton<MemeRepository>(() => MemeRepositoryImpl(locator()));

    /// Register use case
    locator.registerFactory(() => MemeUseCase(locator()));

    /// Register Bloc
    locator.registerFactory(() => MemeBloc(useCase: locator()));
    locator.registerFactory(() => MemeDetailBloc());
    locator.registerFactory(() => SaveShareBloc());
  }
}