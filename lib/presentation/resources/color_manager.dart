import 'package:flutter/material.dart';

abstract class AppColors {
  // current palette
  static const int _deepOlive = 0xff1B2B1E;
  static const MaterialColor deepOlive = MaterialColor(_deepOlive, <int, Color>{
    50: Color(0xFFBDC0BE),
    100: Color(0xFF999F9A),
    200: Color(0xFF757E77),
    300: Color(0xFF515D53),
    400: Color(0xFF2D3C30),
    500: Color(_deepOlive),
    550: Color(0xff324135),
    600: Color(0xFF2D3930),
    700: Color(0xFF29312A),
    800: Color(0xFF242A25),
    900: Color(0xFF1F2220),
  });

  static const int _error = 0xFF8D2A04;
  static const MaterialColor error = MaterialColor(_error, <int, Color>{
    50: Color(0xFFC6BCB8),
    100: Color(0xFFAA968F),
    200: Color(0xFF8E7166),
    300: Color(0xFF724C3D),
    400: Color(0xFF5B2C1A),
    500: Color(_error),
    550: Color(0xFF56271A),
    600: Color(0xFF4E281A),
    700: Color(0xFF42251A),
    800: Color(0xFF35211A),
    900: Color(0xFF281E1A),
  });

  static const int _darkFern = 0xFF283324;
  static const MaterialColor darkFern = MaterialColor(_darkFern, <int, Color>{
    50: Color(0xFFC0C2BF),
    100: Color(0xFF9EA29C),
    200: Color(0xFF7C827A),
    300: Color(0xFF5B6358),
    400: Color(0xFF3E483A),
    500: Color(_darkFern),
    550: Color(0xFF394335),
    600: Color(0xFF373F34),
    700: Color(0xFF30362E),
    800: Color(0xFF292D27),
    900: Color(0xFF222421),
  });

  static const int _sageGreen = 0xFF818F75;
  static const MaterialColor sageGreen = MaterialColor(_sageGreen, <int, Color>{
    50: Color(0xFFD1D4CF),
    100: Color(0xFFC0C5BB),
    200: Color(0xFFAEB5A7),
    300: Color(0xFF9CA693),
    400: Color(0xFF8F9C84),
    500: Color(_sageGreen),
    550: Color(0xFF8A977F),
    600: Color(0xFF78826F),
    700: Color(0xFF61695A),
    800: Color(0xFF4A5046),
    900: Color(0xFF333631),
  });

  static const int _goldenBeige = 0xFFF1DDBA;
  static const MaterialColor goldenBeige =
      MaterialColor(_goldenBeige, <int, Color>{
        50: Color(0xFFE6E4DD),
        100: Color(0xFFE6E3C3),
        200: Color(0xFFE6E2D5),
        300: Color(0xFFE6E1CD),
        400: Color(0xFFE6DFC6),
        500: Color(_goldenBeige),
        550: Color(0xFFE6DEBE),
        600: Color(0xFFCABCA2),
        700: Color(0xFF9F9481),
        800: Color(0xFF756D60),
        900: Color(0xFF4A463F),
      });

  static const int _caramelTan = 0xFFC99669;
  static const MaterialColor caramelTan =
      MaterialColor(_caramelTan, <int, Color>{
        50: Color(0xFFE0D6CD),
        100: Color(0xFFDBC7B6),
        200: Color(0xFFD6B9A0),
        300: Color(0xFFD1AB8A),
        400: Color(0xFFD1A279),
        500: Color(_caramelTan),
        550: Color(0xFFCC9D74),
        600: Color(0xFFAD8867),
        700: Color(0xFF896D54),
        800: Color(0xFF655241),
        900: Color(0xFF42382E),
      });

  static const int _darkWalnut = 0xFF4E270B;
  static const MaterialColor darkWalnut =
      MaterialColor(_darkWalnut, <int, Color>{
        50: Color(0xFFC7BFBA),
        100: Color(0xFFAC9E93),
        200: Color(0xFF917C6C),
        300: Color(0xFF765A45),
        400: Color(0xFF613D24),
        500: Color(_darkWalnut),
        550: Color(0xFF5B381E),
        600: Color(0xFF533622),
        700: Color(0xFF452F20),
        800: Color(0xFF37281E),
        900: Color(0xFF29211C),
      });

  static const int _cinnamonBrown = 0xFF764024;
  static const MaterialColor cinnamonBrown =
      MaterialColor(_cinnamonBrown, <int, Color>{
        50: Color(0xFFCFC4BF),
        100: Color(0xFFBBA79C),
        200: Color(0xFFA88A7A),
        300: Color(0xFF946C58),
        400: Color(0xFF85543A),
        500: Color(_cinnamonBrown),
        550: Color(0xFF804F35),
        600: Color(0xFF704834),
        700: Color(0xFF5B3D2E),
        800: Color(0xFF463227),
        900: Color(0xFF312621),
      });

  static const Color stoneBeige300 = Color(0xFFC2C0B3);
  static const Color stoneBeige100 = Color(0xFFD3D2CC);
  static const Color stoneBeige50 = Color(0xFFDCDBD8);
  static const int _stoneBeige = 0xFFB5B2A1;
  static const MaterialColor stoneBeige =
      MaterialColor(_stoneBeige, <int, Color>{
        50: stoneBeige50,
        100: stoneBeige100,
        200: Color(0xFFCBC9BF),
        300: stoneBeige300,
        400: Color(0xFFBEBCAC),
        500: Color(_stoneBeige),
        550: Color(0xFFB9B7A7),
        600: Color(0xFF9E9C90),
        700: Color(0xFF7E7C73),
        800: Color(0xFF5E5D56),
        900: Color(0xFF3E3D3A),
      });

  static const int _camelBeige = 0xFFBAA48C;
  static const MaterialColor camelBeige =
      MaterialColor(_camelBeige, <int, Color>{
        50: Color(0xFFDDD8D4),
        100: Color(0xFFD5CDC4),
        200: Color(0xFFCDC1B4),
        300: Color(0xFFC6B5A4),
        400: Color(0xFFC3AF99),
        500: Color(_camelBeige),
        550: Color(0xFFBEAA94),
        600: Color(0xFFA29280),
        700: Color(0xFF817567),
        800: Color(0xFF60574E),
        900: Color(0xFF3F3A35),
      });
  static const int _pineTeal = 0xFF3E6061;
  static const MaterialColor pineTeal = MaterialColor(_pineTeal, <int, Color>{
    50: Color(0xFFC4CBCB),
    100: Color(0xFFA6B3B3),
    200: Color(0xFF889B9C),
    300: Color(0xFF6B8484),
    400: Color(0xFF527172),
    500: Color(_pineTeal),
    550: Color(0xFF4D6C6D),
    600: Color(0xFF476061),
    700: Color(0xFF3C4F4F),
    800: Color(0xFF313E3E),
    900: Color(0xFF262D2D),
  });

  static const int _earthBrown = 0xFF34240B;
  static const MaterialColor earthBrown =
      MaterialColor(_earthBrown, <int, Color>{
        50: Color(0xFFC2BFBA),
        100: Color(0xFFA29C93),
        200: Color(0xFF837A6C),
        300: Color(0xFF635845),
        400: Color(0xFF493A24),
        500: Color(_earthBrown),
        550: Color(0xFF44351E),
        600: Color(0xFF403422),
        700: Color(0xFF362E20),
        800: Color(0xFF2D271E),
        900: Color(0xFF24211C),
      });

  static const MaterialColor redPrimary =
      MaterialColor(0xffFF002B, <int, Color>{
        50: Color(0xFFFFEBEE),
        100: Color(0xFFFFCDD2),
        200: Color(0xFFEF9A9A),
        300: Color(0xFFE57373),
        400: Color(0xFFEF5350),
        500: Color(0xffFF002B),
        600: Color(0xFFE53935),
        700: Color(0xFFD32F2F),
        800: Color(0xFFC62828),
        900: Color(0xFFB71C1C),
      });
  static const Color inactiveRedPrimary = Color(0xffF8C3CC);
  static const Color lightRedPrimary = Color(0xffFFF5F6);
  static const Color selectRedPrimary = Color(0xFFfffafb);
  static const Color redPrimary75 = Color(0x75FF002B);
  static const Color redPrimaryAA = Color(0xaaFF002B);
  static const Color redPrimary22 = Color(0x22FF002B);
  static const Color redPrimaryBg = Color(0xFFFFF0FE);
  static const Color redPrimaryBolderBg = Color(0xFFFEE3E8);
  static const Color pinkyRed = Color(0xFFFF6C6C);

  static const Color bluePrimary = Color(0xff578FFF);
  static const Color bluePrimary25 = Color(0x25578FFF);

  // Text colors
  static const Color darkTextColor = Color(0xFF3d3d3d);
  static const Color greyTextColor = Color(0xFF888888);
  static const Color whiteTextColor = Color(0xFFfFfFfF);
  static const Color blackTextSecondary = Color(0xff262323);
  static const Color blackTextLightSecondary = Color(0xff909090);
  static const Color darkGreyTextSecondary = Color(0xff555555);
  static const Color regularGreyTextSecondary = Color(0xff7B7B7B);
  static const Color lightGreyTextSecondary = Color(0xffB4B4B4);
  static const Color darkBlueTextSecondary = Color(0xff3D3C4B);
  static const Color blueTextSecondary = Color(0xff6F97E6);

  static const Color lightGreyBgSecondary = Color(0xffF5F5F5);
  static const Color greyTextSecondary = Color(0xffA0A0A0);

  static const Color orangeSecondary = Color(0xffFFA942);
  static const Color lightOrangeSecondary = Color(0xffFFF1E0);
  static const Color lightBlueSecondary = Color(0xffE0EBFF);
  static const Color yellowColor = Color(0xffFFE143);
  static const Color greenTextColor = Color(0xff20B23D);
  static const Color greenBg = Color(0xff00FF6F);

  // bgColors
  static const Color lightBlueGreyBgColor = Color(0xffF0F5FF);
  static const Color greyBgColor = Color(0xffD9D9D9);
  static const Color whiteBgColor = Color(0xFFfFfFfF);
  static const Color lightBlueBgColor = Color(0xFFf5f8ff);
  static const Color blueBorderColor = Color(0xFFD2E1FF);
  static const Color whiteBlueBgColor = Color(0xFFE0EAFF);
  static const Color whiteGreyBgColor = Color(0xFFf7f7f7);
  static const Color lightGreyBgColor = Color(0xFFB9B9B9);
  static const Color whiteRedBgColor = Color(0xFFFEFAF1);
  static const Color lightMintGreenBgColor = Color(0xFFF0FFF2);
  static const Color freeGreenBgColor = Color(0xFFF5FFF7);

  // action colors

  static const Color dividerColor = Color(0xffE9E9E9);

  //offWhite
  static const Color lightOffWhiteBase = Color(0xffE4DFDC);

  static const Color offWhite = Color(0xffCEC7BF);
  static const Color lightOffWhite = Color(0xffb6b3b0);
  static const Color offWhite1000 = Color(0xff464039);
  static const Color offWhite900 = Color(0xff5D564E);
  static const Color offWhite800 = Color(0xff736C63);
  static const Color offWhite700 = Color(0xff8A8279);
  static const Color offWhite600 = Color(0xffA1998F);
  static const Color offWhite500 = Color(0xffB7B0A7);
  static const Color offWhite400 = Color(0xffCEC7BF);
  static const Color offWhite300 = Color(0xffE5DFD8);
  static const Color offWhite200 = Color(0xffFBF7F2);
  static const Color offWhite100 = Color(0xffFDFDFC);

  //yellow
  static const Color yellow = Color(0xffF1B24A);
  static const Color yellow1000 = Color(0xff472E05);
  static const Color yellow900 = Color(0xff69460C);
  static const Color yellow800 = Color(0xff8B5F17);
  static const Color yellow700 = Color(0xffAD7A25);
  static const Color yellow600 = Color(0xffCF9536);
  static const Color yellow500 = Color(0xffF1B24A);
  static const Color yellow400 = Color(0xffFFCB76);
  static const Color yellow300 = Color(0xffFFDA9E);
  static const Color yellow200 = Color(0xffFFE9C5);
  static const Color yellow100 = Color(0xffFFF8ED);

  //red
  static const Color red = Color(0xffE3596D);
  static const Color red1000 = Color(0xff5B141E);
  static const Color red900 = Color(0xff7D212E);
  static const Color red800 = Color(0xff9F3141);
  static const Color red700 = Color(0xffC14356);
  static const Color red600 = Color(0xffE3596D);
  static const Color red500 = Color(0xffFF6F84);
  static const Color red400 = Color(0xffFF6F84);
  static const Color red300 = Color(0xffFFB0BB);
  static const Color red200 = Color(0xffFFD0D7);
  static const Color red100 = Color(0xffFFF0F2);

  //Grey back ground
  static const Color grey1 = Color(0xff707070);
  static const Color grey2 = Color(0xff797979);
  static const Color brownGrey = Color(0xff5D564E);

  static const Color grey = Color(0xff1F1F1F);
  static const Color grey1000 = Color(0xff484848);
  static const Color grey900 = Color(0xff5C5C5C);
  static const Color grey800 = Color(0xff5C5C5C);
  static const Color grey700 = Color(0xff5C5C5C);
  static const Color grey600 = Color(0xff999999);
  static const Color grey500 = Color(0xffAEAEAE);
  static const Color grey400 = Color(0xffC2C2C2);
  static const Color grey300 = Color(0xffD6D6D6);
  static const Color grey200 = Color(0xffEBEBEB);
  static const Color grey100 = Color(0xbcFFFFFF);

  static const Color lightViolet = Color(0xff201C31);
  static const Color darkViolet = Color(0xff1A1727);
  static const Color violet = Color(0xff3E355E);

  static const Color lightBlackViolet = Color(0xff131121);
  static const Color darkBlackViolet = Color(0xff0E0D1A);

  static const Color blackNavy = Color(0xff0a0c13);
  static const Color darkNavy = Color(0xff0d101c);
  static const Color navy = Color(0xff15192b);
  static const Color lightNavy = Color(0xff252c49);
  static const Color blue = Color(0xff3d5887);
  static const Color lightBlue = Color(0xff909dbd);

  static const Color paleVioletRed = Color(0xffba5874);
  static const Color mauva = Color(0xff645577);
  static const Color thistle = Color(0xffa1859c);
  static const Color lightFuchsia = Color(0xffF5D7DB);
  static const Color beige1 = Color(0xffF5e9d0);
  static const Color beige2 = Color(0xfff6d6c5);
  static const Color calico = Color(0xffd8b188);
  static const Color twine = Color(0xffc18653);

  // new colors

  static const Color white = Color(0xffFFFFFF);
  //! static const Color error = Color(0xffe61f34); // red color
}

class GradientManager {
  static const List<double> startNowStops = [0.1, 0.6, 0.7];
}
