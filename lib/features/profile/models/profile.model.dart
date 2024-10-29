import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../routes/routes.dart';

class ProfileModel {
  ProfileModel({
    required this.icon,
    required this.title,
    required this.router,
  });

  final String title;
  final IconData icon;
  final String router;
}

// Our demo ProfileModel

List<ProfileModel> demoProfileList = [
  ProfileModel(
    title: 'Your profile',
    icon: IconsaxPlusLinear.user,
    router: TRoutes.yourProfile,
  ),
  ProfileModel(
    title: 'Manage Address',
    icon: IconsaxPlusLinear.location,
    router: TRoutes.manageAddress,
  ),
  ProfileModel(
    title: 'Payment Methods',
    icon: IconsaxPlusLinear.card,
    router: '',
  ),
  ProfileModel(
    title: 'My Bookings',
    icon: IconsaxPlusLinear.calendar,
    router: TRoutes.myBookings,
  ),
  ProfileModel(
    title: 'My Wallet',
    icon: IconsaxPlusLinear.wallet_2,
    router: '',
  ),
  ProfileModel(
    title: 'Settings',
    icon: IconsaxPlusLinear.setting_2,
    router: '',
  ),
  ProfileModel(
    title: 'Help Center',
    icon: IconsaxPlusLinear.info_circle,
    router: '',
  ),
  ProfileModel(
    title: 'Privacy Policy',
    icon: IconsaxPlusLinear.lock_1,
    router: '',
  ),
  ProfileModel(
    title: 'Invites Friends',
    icon: IconsaxPlusLinear.profile_add,
    router: '',
  ),
  ProfileModel(
    title: 'Log out',
    icon: IconsaxPlusLinear.logout_1,
    router: TRoutes.logout,
  ),
];
