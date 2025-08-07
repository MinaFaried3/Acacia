part of 'dashboard_cubit.dart';

sealed class DashboardState extends Equatable {
  final List<Destination> destinations;
  const DashboardState({required this.destinations});
  @override
  List<Object> get props => [
    const DeepCollectionEquality().hash(destinations),
    destinations,
    destinations.length,
  ];
}

final class DashboardInitial extends DashboardState {
  const DashboardInitial({required super.destinations});

  @override
  List<Object> get props => [
    const DeepCollectionEquality().hash(destinations),
    destinations,
    destinations.length,
  ];
}

final class DashboardDestinations extends DashboardState {
  final bool h;
  const DashboardDestinations(this.h, {required super.destinations});

  @override
  List<Object> get props => [
    h,
    const DeepCollectionEquality().hash(destinations),
    destinations,
    destinations.length,
  ];
}
