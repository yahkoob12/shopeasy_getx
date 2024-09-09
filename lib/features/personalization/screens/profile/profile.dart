import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';
import 'package:shopeasy_getx/common/widget/images/circular_image.dart';
import 'package:shopeasy_getx/common/widget/texts/section_heading.dart';
import 'package:shopeasy_getx/features/authentication/screens/login/login.dart';
import 'package:shopeasy_getx/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:shopeasy_getx/utils/constants/image_strings.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      //---Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///--Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TCircularImage(
                      image: TImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),

              /// --- Details
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              Divider(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Heading Profile Info
              TSectionheading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TProfileMenu(
                onPressed: () {},
                title: 'Name',
                value: 'Mansoor AliKhan',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Username',
                value: 'Mansoor@AliKhan',
              ),

              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Divider(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ///Heading Personal info
              TSectionheading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TProfileMenu(
                onPressed: () {},
                title: 'User ID',
                value: '112233',
                icon: Iconsax.copy,
              ),
              TProfileMenu(
                  onPressed: () {},
                  title: 'E-mail',
                  value: 'Mansooralikhan@gmail.com'),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Phone Number',
                  value: '+91 9747934434'),
              TProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Date of Birth',
                  value: '11/08/2001'),
              Divider(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Get.to(() => LoginScreen()),
                    child: Text('Logout'),
                  ),
                ),
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.red),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Delete account',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
