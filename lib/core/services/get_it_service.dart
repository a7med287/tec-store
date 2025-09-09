import 'package:get_it/get_it.dart';
import 'package:tec_store/constants.dart';
import 'package:tec_store/core/services/api_services.dart';
import 'package:tec_store/core/services/database_services.dart';
import 'package:tec_store/features/auth/data/repos/auth_repo_impl.dart';
import 'package:tec_store/features/auth/domain/repos/auth_epo.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiServices>(ApiServices(baseUrl: baseUrlApi));
  getIt.registerSingleton<DatabaseService>(DatabaseService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      apiServices: getIt.get<ApiServices>(),
      databaseService: getIt.get<DatabaseService>(),
    ),
  );
}
