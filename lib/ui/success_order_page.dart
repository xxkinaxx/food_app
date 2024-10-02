part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  const SuccessOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IllustrationPage(
      title: "Your foods are on the way",
      subtitle: 'Just stay at home while we preparing the best food',
      picturePath: 'assets/bike.png',
      buttonTitle1: 'Order Other Foods',
      buttonTap1: () {
        Get.offAll(MainPage());
      },
      buttonTitle2: 'View My Order',
      buttonTap2: (){
        Get.offAll(MainPage(initialPage: 1));
      },
    );
  }
}
