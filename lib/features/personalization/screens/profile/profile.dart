import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';
import 'package:shopeasy_getx/common/widget/images/circular_image.dart';
import 'package:shopeasy_getx/common/widget/shimmers/shimmer.dart';
import 'package:shopeasy_getx/common/widget/texts/section_heading.dart';
import 'package:shopeasy_getx/features/authentication/screens/login/login.dart';
import 'package:shopeasy_getx/features/personalization/controllers/user_controller.dart';
import 'package:shopeasy_getx/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:shopeasy_getx/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:shopeasy_getx/utils/constants/image_strings.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
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
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : TImages.user;

                      return controller.imageUploading.value
                          ? TShimmerEffect(width: 80, height: 80)
                          : TCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
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
                onPressed: () => Get.to(() => ChangeName()),
                title: 'Name',
                value: controller.user.value.fullName,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Username',
                value: controller.user.value.username,
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
                value: controller.user.value.id,
                icon: Iconsax.copy,
              ),
              TProfileMenu(
                  onPressed: () {},
                  title: 'E-mail',
                  value: controller.user.value.email),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Phone Number',
                  value: controller.user.value.phoneNumber),
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
                    onPressed: () => controller.deleteAccountWarningPopup(),
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
