//
//
// import 'package:flutter/material.dart';
//
// class CustomCachedNetworkImage extends StatelessWidget {
//   final String image;
//   final double? size;
//
//   const CustomCachedNetworkImage({
//     super.key,
//     required this.image,
//     this.size,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//         imageUrl: image,
//         fit: BoxFit.cover,
//         width: size,
//         errorWidget: (_, __, ___) =>
//             SizedBox(width: size, height: size, child: CustomErrorWidget()),
//         placeholder: (__, ___) =>
//             SizedBox(width: size, height: size, child: LoadingIndicator()));
//   }
// }
