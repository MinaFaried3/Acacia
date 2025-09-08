import 'package:acacia/app/services/di/dependency_injection.dart';
import 'package:acacia/presentation/modules/admin/login/cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppBlocProviders {
  static List<BlocProvider> loginProviders() => [
    BlocProvider<LoginCubit>(create: (context) => getIt<LoginCubit>()),
  ];
}
