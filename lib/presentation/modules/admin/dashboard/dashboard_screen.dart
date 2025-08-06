import 'package:acacia/presentation/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const DashboardScreen({Key? key, required this.navigationShell})
    : super(key: key ?? const ValueKey<String>('DashboardScreen'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            destinations: destinations
                .map(
                  (destination) => NavigationRailDestination(
                    icon: Icon(destination.icon),
                    label: Text(destination.label),
                    selectedIcon: Icon(destination.icon, color: Colors.white),
                  ),
                )
                .toList(),
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: navigationShell.goBranch,
            indicatorColor: Theme.of(context).colorScheme.primary,
          ),
          HorizontalSpace(10),
          Expanded(child: navigationShell),
        ],
      ),
    );
  }
}

const List<Destination> destinations = [
  Destination(label: 'Home', icon: Icons.home),
  Destination(label: 'Settings', icon: Icons.settings),
  Destination(label: 'Profile', icon: Icons.person),
];

class Destination {
  final String label;
  final IconData icon;

  const Destination({required this.label, required this.icon});
}
