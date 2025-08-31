part of 'package:acacia/presentation/ui/widgets/app_bottom_nav_bar/app_bottom_nav_bar.dart';

final class BottomNavBarItem extends Equatable {
  final String iconPath;

  final VoidCallback? onPressed;

  const BottomNavBarItem({required this.iconPath, this.onPressed});

  @override
  List<Object?> get props => [iconPath, onPressed];
}
