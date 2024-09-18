import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopeasy_getx/common/widget/images/circular_image.dart';
import 'package:shopeasy_getx/features/personalization/controllers/user_controller.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';
import 'package:shopeasy_getx/utils/constants/image_strings.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const TCircularImage(
        backgroundColor: Colors.transparent,
        image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit, color: TColors.white),
      ),
    );
  }
}
