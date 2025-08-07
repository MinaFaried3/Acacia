import 'package:acacia/presentation/widgets/space.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'cubit/dashboard_cubit.dart';

class DashboardScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const DashboardScreen({Key? key, required this.navigationShell})
    : super(key: key ?? const ValueKey<String>('DashboardScreen'));
  void onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        context.read<DashboardCubit>().changeLayout(
          MediaQuery.sizeOf(context).width,
        );
        return Scaffold(
          body: Row(
            children: [
              if (state is DashboardDestinations && state.h)
                NavigationRail(
                  destinations: state.destinations
                      .map(
                        (destination) => NavigationRailDestination(
                          icon: Icon(destination.icon),
                          label: Text(destination.label),
                          selectedIcon: Icon(
                            destination.icon,
                            color: Colors.white,
                          ),
                        ),
                      )
                      .toList(),
                  selectedIndex: navigationShell.currentIndex,
                  onDestinationSelected: onTap,
                  indicatorColor: Theme.of(context).colorScheme.primary,
                ),

              HorizontalSpace(10),
              Expanded(child: navigationShell),
            ],
          ),
          bottomNavigationBar: state is DashboardDestinations && state.h
              ? null
              : BottomNavigationBar(
                  items: state.destinations
                      .map(
                        (destination) => BottomNavigationBarItem(
                          icon: Icon(destination.icon),
                          label: destination.label,
                          activeIcon: Icon(
                            destination.icon,
                            color: Colors.white,
                          ),
                        ),
                      )
                      .toList(),
                  currentIndex: navigationShell.currentIndex,
                  onTap: onTap,
                  selectedItemColor: Theme.of(context).colorScheme.primary,
                ),
        );
      },
    );
  }
}

class Destination extends Equatable {
  final String label;
  final IconData icon;

  const Destination({required this.label, required this.icon});

  @override
  List<Object> get props => [label, icon];
}
