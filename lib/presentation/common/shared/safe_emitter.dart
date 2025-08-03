import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin SafeEmitter<State> on Cubit<State> {
  void safeEmit(State state) {
    if (isClosed) {
      PrintManager.print(
        "this cubit is closed , can't emit $State from $this",
        color: ConsoleColor.redBg,
      );
      return;
    }

    if (this.state == state) {
      PrintManager.print(
        "can't emit the provided state because it is same with the current state $this",
        color: ConsoleColor.brightRed,
      );
    }

    emit(state);
  }
}
