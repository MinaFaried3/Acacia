import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:acacia/presentation/modules/admin/dashboard/dashboard_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.dart';

const List<Destination> destinations = [
  Destination(label: 'Home', icon: Icons.home),
  Destination(label: 'Settings', icon: Icons.settings),
  Destination(label: 'Profile', icon: Icons.person),
];

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit()
    : super(
        DashboardDestinations(
          true,
          destinations: [
            Destination(label: 'Home', icon: Icons.home),
            Destination(label: 'Settings', icon: Icons.settings),
            Destination(label: 'Profile', icon: Icons.person),
          ],
        ),
      );

  void changeLayout(double width) {
    if (state.destinations.length == 2 && width > 700) {
      printer('state.destinations.length == 2 && width > 700');
      final newState = DashboardDestinations(
        true,
        destinations: [
          Destination(label: 'Home', icon: Icons.home),
          Destination(label: 'Settings', icon: Icons.settings),
          Destination(label: 'Profile', icon: Icons.person),
        ],
      );
      printer('${newState.hashCode} = ${state.hashCode}');
      emit(newState);
      return;
    }
    if (width < 700 && state.destinations.length == 3) {
      emit(
        DashboardDestinations(
          false,
          destinations: [
            Destination(label: 'Home', icon: Icons.home),
            Destination(label: 'Settings', icon: Icons.settings),
          ],
        ),
      );
      return;
    }
  }
}
