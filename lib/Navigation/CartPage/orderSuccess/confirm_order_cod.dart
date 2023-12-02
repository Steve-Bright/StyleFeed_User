import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:style_feed/Navigation/CartPage/orderSuccess/checkoutDetailPage/checkout_detail.dart';
import 'package:style_feed/Navigation/CartPage/orderSuccess/orderSuccessPage/order_success.dart';
import 'package:style_feed/Navigation/CartPage/orderSuccess/checkoutDetailPage/totalSummary.dart';
import 'address_controller.dart';
import 'package:style_feed/Controller/pointController.dart';
// import 'card_home_page.dart';
import 'choose_address.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  AddressController addressController = Get.find();
  String _mobilePaymentImagePath = 'assets/images/onlinepayment.png';
  String _mobilePaymentLabel = 'Mobile Payments';
  String selectedPaymentMethod = '';
  final ValueNotifier<int> _selectedMethod = ValueNotifier<int>(-1);

  @override
  void initState() {
    super.initState();
    _selectedMethod.addListener(_updateSelectedPaymentMethod);
  }

  void _updateSelectedPaymentMethod() {
    switch (_selectedMethod.value) {
      case 0: // Cash on Delivery
        selectedPaymentMethod = "Cash on Delivery";
        break;
      case 1: // Points
        selectedPaymentMethod = "Points";
        break;
      case 2: // Mobile Payments
        selectedPaymentMethod = _mobilePaymentLabel;
        break;
      default:
        selectedPaymentMethod = '';
    }
  }

  void openMobilePaymentSheet() async {
    final result = await showModalBottomSheet<Map<String, String>>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      builder: (BuildContext context) => PopUp(),
    );

    if (result != null) {
      setState(() {
        _mobilePaymentImagePath = result['imagePath'] ?? _mobilePaymentImagePath;
        _mobilePaymentLabel = result['label'] ?? _mobilePaymentLabel;
        selectedPaymentMethod = _mobilePaymentLabel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckoutDetail()),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Confirm Your Order',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Text(
                'Delivery Address',
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15),
              GetBuilder<AddressController>(
                builder: (_) {
                  return DeliveryAddressContainer(
                    selectedAddress: addressController.selectedAddress.value,
                    onChangeAddress: () async {
                      // Use context-based navigation as Get.to might not be compatible with your setup
                      var result = await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddressBook(
                          onSelectAddress: (Address selected) {
                            addressController.updateSelectedAddress(selected);
                          },
                        )),
                      );
                      // Check if result is Address and update accordingly
                      if (result != null && result is Address) {
                        setState(() {
                          addressController.selectedAddress.value = result;
                        });
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 30),
              Text(
                'Payment Method',
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15),
              ClayContainer(
                height: 140,
                width: double.infinity,
                color: Colors.grey[100],
                borderRadius: 10,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                              child: PlaceholderWithLabel(
                                  label: 'Cash on Delivery',
                                  imagePath: 'assets/images/cash.png',
                                  index: 0,
                                  notifier: _selectedMethod,
                                  onMobilePaymentTap: () {})),
                          Expanded(
                              child: PlaceholderWithLabel(
                                  label: 'Points',
                                  imagePath: 'assets/images/point.png',
                                  index: 1,
                                  notifier: _selectedMethod,
                                  onMobilePaymentTap: () {})),
                          Expanded(
                              child: PlaceholderWithLabel(
                                  label: _mobilePaymentLabel,
                                  imagePath: _mobilePaymentImagePath,
                                  index: 2,
                                  notifier: _selectedMethod,
                                  onMobilePaymentTap: openMobilePaymentSheet)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Delivery Method',
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15),
              ClayContainer(
                height: 60,
                width: double.infinity,
                color: Colors.grey[100],
                borderRadius: 10,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 5, 15, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClayContainer(
                            height: 40,
                            width: 70,
                            borderRadius: 8,
                            spread: 2,
                            child: Image.asset('assets/images/royal.png'),
                          ),
                          SizedBox(width: 30),
                          Text(
                            'Royal Express Myanmar',
                            style: GoogleFonts.montserrat(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              TotalSummary(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () { //TODO: pass the total amount
            final PointController pointController = Get.find<PointController>();
            pointController.getPoint();

            Get.offAll(OrderSuccessScreen(
              selectedAddress: addressController.selectedAddress.value,
              selectedPaymentMethod: selectedPaymentMethod,
              // totalAmount: totalAmount,
            ));
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => OrderSuccessScreen(
            //       selectedAddress: addressController.selectedAddress.value,
            //       selectedPaymentMethod: selectedPaymentMethod,
            //       // totalAmount: totalAmount,
            //     ),
            //   ),
            // );


          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87,
            minimumSize: Size(250, 45),
            side: BorderSide.none,
            shape: StadiumBorder(),
          ),
          child: Text(
            'Confirm',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////
class DeliveryAddressContainer extends StatefulWidget {
  final Address? selectedAddress;
  final VoidCallback onChangeAddress;

  const DeliveryAddressContainer({
    Key? key,
    required this.selectedAddress,
    required this.onChangeAddress,
  }) : super(key: key);

  @override
  _DeliveryAddressContainerState createState() =>
      _DeliveryAddressContainerState();
}

class _DeliveryAddressContainerState extends State<DeliveryAddressContainer> {
  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      height: 140,
      width: double.infinity,
      color: Colors.grey[100],
      borderRadius: 10,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.selectedAddress?.name ?? 'No Address Selected',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5),
                      Text(
                        widget.selectedAddress?.phoneNumber ?? '',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: widget.onChangeAddress,
                  child: Text(
                    'Change',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              '${widget.selectedAddress?.streetAddress ?? ''}, ${widget.selectedAddress?.apartment ?? ''}, ${widget.selectedAddress?.township ?? ''}, ${widget.selectedAddress?.region ?? ''}',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );

  }
}

////////////////////////////////////////////////////
class PlaceholderWithLabel extends StatefulWidget {
  final String label;
  final String imagePath;
  final int index;
  final ValueNotifier<int> notifier;
  final Function onMobilePaymentTap;

  PlaceholderWithLabel(
      {required this.label,
      required this.imagePath,
      required this.index,
      required this.notifier,
      required this.onMobilePaymentTap});

  @override
  State<PlaceholderWithLabel> createState() => _PlaceholderWithLabelState();
}

class _PlaceholderWithLabelState extends State<PlaceholderWithLabel> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.notifier,
      builder: (context, int selected, _) {
        bool isSelected = selected == widget.index;
        return InkWell(
          onTap: () {
            widget.notifier.value = widget.index;
            if (widget.index == 2) {
              // If Mobile Payments option
              widget.onMobilePaymentTap();
            }
          },
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.fromLTRB(1, 1, 1, 10),
            decoration: BoxDecoration(
              border: isSelected
                  ? Border.all(color: Colors.blueGrey.shade600, width: 1)
                  : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  widget.imagePath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 5),
                Text(
                  widget.label,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

////////////////////////////////////////////
class PopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'assets/pay_images/kpay.png',
      'assets/pay_images/wavepay.png',
      'assets/pay_images/aya.png',
      'assets/pay_images/cbpay.png',
      'assets/pay_images/mab.png',
      'assets/pay_images/uab.jpg',
      // Add more image paths as needed
    ];

    final List<String> paytext = [
      'KBZ Pay',
      'Wave Pay',
      'AYA Pay',
      'CB Pay',
      'MAB Mobile',
      'UAB Pay',
      // Add more payment labels as needed
    ];

    return Padding(
      padding: EdgeInsets.fromLTRB(5, 15, 5, 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Choose Online Payment',
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pop(context, {
                      'imagePath': imageUrls[index],
                      'label': paytext[index]
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: 75,
                    child: Column(
                      children: [
                        Image.asset(
                          imageUrls[index],
                          width: 60,
                          height: 60,
                        ),
                        SizedBox(height: 5),
                        Text(
                          paytext[index],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          ClayContainer(
            height: 60,
            width: 330,
            color: Colors.grey[100],
            borderRadius: 10,
            child: Padding(
              padding: EdgeInsets.fromLTRB(25, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClayContainer(
                    height: 30,
                    width: 55,
                    color: Colors.white,
                    borderRadius: 5,
                    spread: 2,
                    child: Image.asset('assets/pay_images/master_card.png'),
                  ),
                  Text(
                    '**** **** **** 3453',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    width: 65,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.lightBlue[900]!,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => CardHomePage()),
                        // );
                      },
                      child: Text(
                        'Change',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.lightBlue[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
