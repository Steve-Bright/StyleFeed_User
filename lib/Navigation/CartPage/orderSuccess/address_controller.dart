import 'package:get/get.dart';
import 'choose_address.dart';

class AddressController extends GetxController {
  var addresses = <Address>[].obs;
  Rx<Address?> selectedAddress = Rx<Address?>(null);

  void addAddress(Address address) {
    addresses.add(address);
    update();
  }

  void updateAddress(int index, Address updatedAddress) {
    if (index >= 0 && index < addresses.length) {
      addresses[index] = updatedAddress;
      if (selectedAddress.value == addresses[index]) {
        selectedAddress.value = updatedAddress;
      }
      update();
    }
  }

  void addOrUpdateAddress(Address address) {
    int index = addresses.indexWhere((a) => a.phoneNumber == address.phoneNumber);
    if (index >= 0) {
      addresses[index] = address;
    } else {
      addresses.add(address);
    }
    update();
  }


  void deleteAddress(int index) {
    if (index >= 0 && index < addresses.length) {
      if (selectedAddress.value == addresses[index]) {
        selectedAddress.value = null;
      }
      addresses.removeAt(index);
      update();
    }
  }

  void updateSelectedAddress(Address newAddress) {
    selectedAddress.value = newAddress;
    update();
  }
}
