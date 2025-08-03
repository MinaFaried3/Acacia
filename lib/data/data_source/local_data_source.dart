abstract class LocalDataSource {
  //getters
  // Future<UserModel?> getUserModel();

  // Future<String> getUserPhone();
  //
  // //setters
  // Future<void> setUserToken(String token);
  //
  // void setUserData(UserModel userModel);
  //
  // void setUserModel(UserModel userModel);
  //
  // Future<void> userLogout();
  //
  // //
  // // void updateUserModelProfileData(EditProfileRequest editProfile);
  // //
  // // void updateProfileImage(String profileImageUrl);
  //
  // ///locations
  // void setUserLocations(List<LocationModel> userLocation);
  //
  // Future<List<LocationModel>> getUserLocations();
  //
  // Future<void> deleteUserLocation(String locationId);
  //
  // void editUserLocation(LocationModel updatedLocation);
  //
  // void addUserLocation(LocationModel location);
  //
  // void setDefaultLocation(String locationId);
  //
  // Future<LocationModel?> getDefaultLocation();
}

// class LocalDataSourceImpl extends LocalDataSource with HiveMixin {
//   @override
//   Future<String> getUserPhone() async {
//     Box hiveBox = await Hive.openBox(HiveConstants.userBox);
//     String phone = (hiveBox.get(HiveConstants.userPhone) as String);
//     hiveBox.close();
//     return phone;
//   }
//
//   @override
//   Future<UserModel?> getUserModel() async {
//     await openUserBox();
//     UserModel? userModel = await getOpenHiveBox<UserModel?>(
//       boxName: HiveConstants.userBox,
//       fieldName: HiveConstants.userModel,
//     );
//
//     return userModel ?? UserModel();
//   }
//
//   @override
//   void setUserModel(UserModel userModel) {
//     putOpenHiveBox<UserModel>(
//       boxName: HiveConstants.userBox,
//       fieldName: HiveConstants.userModel,
//       data: userModel,
//     );
//
//   }
//
//   @override
//   Future<void> setUserToken(String token) async {
//     await getIt<AppPreferences>().setToken(token: token);
//     if (token.isNotEmpty) {
//       await getIt<AppPreferences>()
//           .setData<bool>(key: PrefKeys.isLoggedIn, data: true);
//     }
//   }
//
//   @override
//   Future<void> userLogout() async {
//     await getIt<AppPreferences>().deleteToken();
//     await getIt<AppPreferences>()
//         .setData<bool>(key: PrefKeys.isLoggedIn, data: false);
//     await deleteHiveBox(HiveConstants.locationBox);
//   }
//
//   // @override
//   // Future<void> setUserData(UserModel userModel) async =>
//   //     await getIt<AppPreferences>().saveMainUserData(userModel: userModel);
//
// //
// // @override
// // void updateUserModelProfileData(UserModel editProfile) async {
// //   final user = await getUserModel();
// //   setUserModel(user.copyWith(
// //
// //     name: editProfile.name,
// //     mobile: editProfile.mobile,
// //     gender: editProfile.gender,
// //     birthDate: editProfile.birthDate,
// //   ));
// // }
// //
// // @override
// // void updateProfileImage(String profileImageUrl) async {
// //   final user = await getUserModel();
// //   // setUserModel(user.copyWith(: profileImageUrl));
// // }
//
//   @override
//   Future<List<LocationModel>> getUserLocations() async {
//     return (await getListOpenHiveBox<LocationModel>(
//           boxName: HiveConstants.locationBox,
//           fieldName: HiveConstants.locationsModels,
//         )) ??
//         [];
//   }
//
//   @override
//   void setUserLocations(List<LocationModel> userLocation) async {
//     await putOpenHiveBox<List<LocationModel>>(
//         boxName: HiveConstants.locationBox,
//         fieldName: HiveConstants.locationsModels,
//         data: userLocation);
//   }
//
//   @override
//   Future<void> deleteUserLocation(String locationId) async {
//     final locations = await getUserLocations();
//
//     if (locations.isEmpty) return;
//     PrintManager.print(locations.length);
//
//     final String? defaultLocationId = await getOpenHiveBox<String?>(
//         boxName: HiveConstants.locationBox,
//         fieldName: HiveConstants.defaultLocationId);
//
//     locations.removeWhere((model) => model.id == locationId);
//
//     if (locationId == defaultLocationId) {
//       await putOpenHiveBox<String?>(
//         boxName: HiveConstants.locationBox,
//         fieldName: HiveConstants.defaultLocationId,
//         data: null,
//       );
//       PrintManager.print('default location has been deleted',
//           color: ConsoleColor.yellow);
//     }
//
//     PrintManager.print(locations.length);
//     setUserLocations(locations);
//   }
//
//   @override
//   void editUserLocation(LocationModel updatedLocation) async {
//     final locations = await getUserLocations();
//
//     // Find the index of the location to edit
//     int index =
//         locations.indexWhere((location) => location.id == updatedLocation.id);
//
//     if (index == -1) {
//       PrintManager.print("Location with ID ${updatedLocation.id} not found.");
//       return;
//     }
//     // Update the location at the found index
//     locations[index] = updatedLocation;
//
//     setUserLocations(locations);
//   }
//
//   @override
//   void addUserLocation(LocationModel location) async {
//     final locations = await getUserLocations();
//     locations.insert(0, location);
//     setUserLocations(locations);
//   }
//
//   @override
//   Future<LocationModel?> getDefaultLocation() async {
//     final locations = await getUserLocations();
//
//     final String? defaultLocationId = await getOpenHiveBox<String?>(
//         boxName: HiveConstants.locationBox,
//         fieldName: HiveConstants.defaultLocationId);
//
//     if (locations.isEmpty) return null;
//
//     if (defaultLocationId.isNullOrEmpty) return null;
//
//     bool notFind = false;
//
//     final defaultLocation = locations.firstWhere(
//       (location) => location.id == defaultLocationId,
//       orElse: () {
//         notFind = true;
//         return LocationModel();
//       },
//     );
//
//     if (notFind.isTrue) return null;
//
//     return defaultLocation;
//   }
//
//   @override
//   void setDefaultLocation(String? locationId) {
//     putOpenHiveBox<String?>(
//       boxName: HiveConstants.locationBox,
//       fieldName: HiveConstants.defaultLocationId,
//       data: locationId,
//     );
//   }
// }
