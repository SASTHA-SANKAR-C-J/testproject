import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class EditStoreProfileController extends GetxController {
  RxBool checkbox1 = false.obs;
  RxBool checkbox2 = false.obs;
  RxBool checkbox3 = false.obs;
  RxBool checkbox4 = false.obs;
  RxBool checkbox5 = false.obs;
  RxBool checkbox6 = false.obs;
  RxBool checkbox7 = false.obs;
  RxBool checkbox8 = false.obs;
  RxBool checkbox9 = false.obs;
  RxBool checkbox10 = false.obs;
  RxBool checkbox11 = false.obs;
  RxBool checkbox12 = false.obs;
  RxBool checkbox13 = false.obs;
  RxBool checkbox14 = false.obs;
  RxString startTime = '10:00'.obs;
  List<String?> selectedImages = List.filled(2, null).obs;
  Rx<TextEditingController> amount1Controller = TextEditingController().obs;
  Rx<TextEditingController> amount2Controller = TextEditingController().obs;
  RxString selectedValue = ''.obs;
  RxString selectedCategory = ''.obs;
  GoogleMapController? mapController;
  Future<void> selectStartTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      // ignore: use_build_context_synchronously
      startTime.value = selectedTime.format(context);
      update();
    }
  }

  RxString endTime = '20:00'.obs;
  Future<void> selectEndTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      // ignore: use_build_context_synchronously
      endTime.value = selectedTime.format(context);
      update();
    }
  }

  Future<void> pickImage(int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      selectedImages[index] = pickedImage.path;
    }
  }
}