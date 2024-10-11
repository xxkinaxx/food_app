part of 'pages.dart';

class PaymentMethodPages extends StatelessWidget {
  const PaymentMethodPages({super.key, required this.paymentUrl});

  final String paymentUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
          title: 'Finish Your Payment',
          subtitle: 'please select your favorite\npayment method',
          picturePath: 'assets/Payment.png',
          buttonTitle1: 'Payment Method',
          buttonTap1: () async {await launch(paymentUrl);},
        buttonTap2: (){
            Get.to(SuccessOrderPage());
        },
        buttonTitle2: 'Continue',
      ),
    );
  }
}
