import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/common/widget/texts/section_heading.dart';
import 'package:shopeasy_getx/data/repositories/address/address_repository.dart';
import 'package:shopeasy_getx/features/personalization/models/address_model.dart';
import 'package:shopeasy_getx/features/personalization/screens/address/add_new_address.dart';
import 'package:shopeasy_getx/features/personalization/screens/address/widgets/single_address.dart';
import 'package:shopeasy_getx/utils/constants/image_strings.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/cloud_helper_functions.dart';
import 'package:shopeasy_getx/utils/helpers/network_manager.dart';
import 'package:shopeasy_getx/utils/popups/animation_loader.dart';
import 'package:shopeasy_getx/utils/popups/full_screen_loader.dart';
import 'package:shopeasy_getx/utils/popups/loaders.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  /// Fetch all user specific addressess
  Future<List<AddressModel>> getAllUserAddress() async {
    try {
      final addresses = await addressRepository.fetchUserAddress();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Address not Found ', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
          title: '',
          onWillPop: () async {
            return false;
          },
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          content: TAnimationLoaderWidget(
              text: '', animation: TImages.docerAnimation));

      /// Clear the "selected" field
      if (selectedAddress.value.id.isEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }

      /// Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      /// Set the "selected" field to true for the newly selected address
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);
      Get.back();
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Error in Selection', message: e.toString());
    }
  }

  /// Add new address
  Future addNewAddress() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Storing Address', TImages.docerAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      if (!addressFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save Address Data
      final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          postalCode: postalCode.text.trim(),
          country: country.text.trim());
      final id = await addressRepository.addAddress(address);

      // update Selected address status
      address.id = id;
      await selectedAddress(address);

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //show success message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your address has been saved successfully');

      //Refresh the address Data
      refreshData.toggle();

      // Reset fields
      resetFromField();

      // Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      //Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }

  /// Show Address ModelBottomSheet at checkOut
  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => Container(
              padding: EdgeInsets.all(TSizes.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TSectionheading(
                    title: 'Select Address',
                    showActionButton: false,
                  ),
                  FutureBuilder(
                      future: getAllUserAddress(),
                      builder: (_, snapshot) {
                        /// Helper Function :Handle loaders , No records , Or error message
                        final response =
                            TCloudHelperFunctions.checkMultiRecordState(
                                snapshot: snapshot);
                        if (response != null) return response;
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => TSingleAddress(
                                  address: snapshot.data![index],
                                  onTap: () async {
                                    await selectedAddress(
                                        snapshot.data![index]);
                                    Get.back();
                                  },
                                ));
                      }),
                  SizedBox(
                    height: TSizes.defaultSpace * 2,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.to(() => AddNewAddressScreen()),
                        child: Text('Add new Address')),
                  )
                ],
              ),
            ));
  }

  //Function to reset from field
  void resetFromField() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
