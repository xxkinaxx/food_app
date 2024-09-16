part of 'pages.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Address",
      subtitle: "Make sure it's valid",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          // image
          Container(
            width: 110,
            height: 110,
            margin: EdgeInsets.only(top: 26),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/photo_border'))),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://ui-avatars.com/api/?name=Kina+Mekoichi'),
                      fit: BoxFit.cover)),
            ),
          ),
          // text
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Address',
              style: blackFontStyle2,
            ),
          ),
          // field
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type your Address',
                  hintStyle: greyFontStyle),
            ),
          ),
          // text
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 6, defaultMargin, 6),
            child: Text(
              'Phone Number',
              style: blackFontStyle2,
            ),
          ),
          // field
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type your Phone Number',
                  hintStyle: greyFontStyle),
            ),
          ),
          // text
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 6, defaultMargin, 6),
            child: Text(
              'House Number',
              style: blackFontStyle2,
            ),
          ),
          // field
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: houseNumberController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type your House Number',
                  hintStyle: greyFontStyle),
            ),
          ),
          // text
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 6, defaultMargin, 6),
            child: Text(
              'City',
              style: blackFontStyle2,
            ),
          ),
          // field
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.black)),
            child: DropdownButton(
              items: [
                DropdownMenuItem(
                  child: Text('Bogor'),
                  value: "Bogor",
                ),
                DropdownMenuItem(
                  child: Text('Jakarta'),
                  value: "Jakarta",
                ),
                DropdownMenuItem(
                  child: Text('Tangerang'),
                  value: "Tangerang",
                ),
                DropdownMenuItem(
                  child: Text('Bekasi'),
                  value: "Bekasi",
                ),
                DropdownMenuItem(
                  child: Text('Depok'),
                  value: "Depok",
                ),
              ],
              onChanged: (item) {},
              isExpanded: true,
              underline: SizedBox(),
            ),
          ),

          Container(
            width: double.infinity,
            height: 45,
            margin: EdgeInsets.only(top: 24),
            padding: EdgeInsets.symmetric(horizontal:15),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () {
                  Get.to(MainPage());
                },
                child: Text('Continue')),
          ),
        ],
      ),
    );
  }
}
