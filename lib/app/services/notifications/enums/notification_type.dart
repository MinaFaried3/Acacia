// import 'package:freezed_annotation/freezed_annotation.dart';
//
// enum NotificationMainType {
//   @JsonValue('Alarm')
//   alarm,
//   @JsonValue('Offer')
//   offer,
//   @JsonValue('Subscription')
//   subscription,
//   @JsonValue('UserSubscription')
//   userSubscription,
//   @JsonValue('Service')
//   service,
//   @JsonValue('Order')
//   order,
// }
//
// extension NotificationMainTypeExtension on NotificationMainType {
//   bool get isAlarm => this == NotificationMainType.alarm;
//   bool get isOffer => this == NotificationMainType.offer;
//   // bool get isSubscription => this == NotificationMainType.subscription;
//   bool get isUserSubscription => this == NotificationMainType.userSubscription;
//   bool get isService => this == NotificationMainType.service;
//   bool get isOrder => this == NotificationMainType.order;
//
//   bool get isSubscription {
//     return [
//       NotificationMainType.subscription,
//       NotificationMainType.userSubscription
//     ].contains(this);
//   }
// }
