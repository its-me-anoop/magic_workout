import 'package:hydrated_bloc/hydrated_bloc.dart';

/// Bloc Observer to observe all bloc changes
class MagicObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // ignore: avoid_print
    print('${bloc.runtimeType} $change');
  }
}
