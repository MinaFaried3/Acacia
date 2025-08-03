//
//
// /// it may be overengineering but I like it, have some fun :P
// enum AppGender {
//   male(AppStrings.male),
//   female(AppStrings.female);
//
//   final String name;
//
//   const AppGender(this.name);
//
//   /// Method to convert a string to `ServiceTypeEnum`
//   static AppGender fromString(String? value) {
//     return AppGender.values.firstWhere(
//       (e) => e.name == value?.toLowerCase(),
//       orElse: () => AppGender.male, // Default to `service` if no match is found
//     );
//   }
//
//   bool get isMale => this == AppGender.male;
//
//   bool get isFemale => this == AppGender.female;
// }
