import 'package:acacia/generated/assets.dart';
import 'package:acacia/presentation/modules/admin/login/widgets/login_form.dart';
import 'package:acacia/presentation/resources/color_manager.dart';
import 'package:acacia/presentation/ui/widgets/app_svg.dart';
import 'package:acacia/presentation/ui/widgets/space.dart';
import 'package:flutter/material.dart';

class DesktopAdminLogin extends StatelessWidget {
  const DesktopAdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(flex: 3, child: LoginForm()),
          Expanded(
            child: Row(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children:
                        [
                              Assets.pharaohsLotusFlower,
                              Assets.pharaohsAmphora,
                              Assets.pharaohsAnkh,
                              Assets.pharaohsBoat,
                              Assets.pharaohsCamel,
                              Assets.pharaohsCanopicJar,
                              Assets.pharaohsCanopicJar2,
                              Assets.pharaohsCarpet,
                              Assets.pharaohsCartouche,
                              Assets.pharaohsCircle,
                              Assets.pharaohsCobra,
                              Assets.pharaohsDenderaTempleHathor,
                              Assets.pharaohsDomedBuilding,
                              Assets.pharaohsFeatherMaat,
                              Assets.pharaohsFesikh,
                              Assets.pharaohsHieroglyphic,
                              Assets.pharaohsHookah,
                              Assets.pharaohsKingdom,
                              Assets.pharaohsMimbarLineGradient,
                              Assets.pharaohsOwl,
                              Assets.pharaohsHorus,
                              Assets.pharaohsPharaohs,
                              Assets.pharaohsPyramid,
                              Assets.pharaohsSnake,
                              Assets.pharaohsSun,
                              Assets.pharaohsObelisk,
                              Assets.pharaohsDenderaTempleHathor,
                              Assets.pharaohsTwistedFlaxWick,
                              Assets.pharaohsLotusFlower,
                              Assets.pharaohsAmphora,
                              Assets.pharaohsAnkh,
                              Assets.pharaohsBoat,
                              Assets.pharaohsCamel,
                              Assets.pharaohsCanopicJar,
                              Assets.pharaohsCanopicJar2,
                              Assets.pharaohsCarpet,
                              Assets.pharaohsCartouche,
                              Assets.pharaohsCircle,
                              Assets.pharaohsCobra,
                            ]
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: AppSvg(
                                  path: e,
                                  color: AppColors.goldenBeige[600]!,
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ),
                HorizontalSpace(10),
                Expanded(
                  child: Container(
                    color: AppColors.darkFern,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(75.0),
                        child: Image.asset(Assets.logoTypoLogoLight),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
