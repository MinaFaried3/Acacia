import 'package:acacia/presentation/resources/color_manager.dart';
import 'package:acacia/presentation/resources/styles_manager.dart';
import 'package:acacia/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabWidget extends StatelessWidget {
  final List<String> tabs;

  const CustomTabWidget({
    super.key,
    required TabController tabController,
    required this.tabs,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      overlayColor: WidgetStatePropertyAll<Color>(AppColors.white),
      dividerColor: Colors.transparent,
      indicatorColor: Colors.transparent,
      controller: _tabController,
      labelColor: AppColors.white,
      unselectedLabelColor: AppColors.darkTextColor,
      labelPadding: EdgeInsets.all(AppSize.s2),
      labelStyle: get700BoldStyle(),
      tabAlignment: TabAlignment.fill,
      indicator: BoxDecoration(
        color: AppColors.redPrimary,
        borderRadius: BorderRadius.circular(AppSize.s24.r),
      ),
      padding: EdgeInsets.symmetric(
        vertical: AppSize.s8,
        horizontal: AppSize.s8,
      ),
      unselectedLabelStyle: get700BoldStyle(color: AppColors.grey200),
      dividerHeight: 0,
      indicatorPadding: EdgeInsets.all(0),
      isScrollable: false,
      automaticIndicatorColorAdjustment: true,
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: tabs.map((tab) => Tab(text: tab.tr())).toList(),
    );
  }
}
