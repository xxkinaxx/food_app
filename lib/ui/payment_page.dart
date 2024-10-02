part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, required this.transaction});

  final Transaction transaction;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Payment',
      subtitle: 'You deserve better meal',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          // header
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.symmetric(vertical: 12),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item Ordered',
                  style: blackFontStyle3.copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                  widget.transaction.food!.picturePath!))),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              189, // 60 + 12 + 117
                          child: Text(
                            widget.transaction.food!.name!,
                            style: blackFontStyle3,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(NumberFormat.currency(
                                symbol: 'IDR',
                                decimalDigits: 0,
                                locale: 'id_ID')
                            .format(widget.transaction.food!.price!))
                      ],
                    ),
                    Expanded(
                      child: Text(
                        '${widget.transaction.quantity} Item(s)',
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                // Detail
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Text(
                  'Detail Transaction',
                  style: blackFontStyle3.copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      widget.transaction.food!.name!,
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(NumberFormat.currency(
                            symbol: 'IDR', decimalDigits: 0, locale: 'id_ID')
                        .format(widget.transaction.food!.price!))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Quantity',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text('${widget.transaction.quantity.toString()} item(s)')
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Subtotal',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(NumberFormat.currency(
                            symbol: 'IDR', decimalDigits: 0, locale: 'id_ID')
                        .format(widget.transaction.food!.price! *
                            widget.transaction.quantity!))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Row(
                  children: [
                    Text(
                      'Tax 10%',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(NumberFormat.currency(
                            symbol: 'IDR', decimalDigits: 0, locale: 'id_ID')
                        .format(widget.transaction.food!.price! *
                            widget.transaction.quantity! *
                            0.1))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Driver',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(NumberFormat.currency(
                            symbol: 'IDR', decimalDigits: 0, locale: 'id_ID')
                        .format(50000))
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Total',
                      style:
                          blackFontStyle2.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      NumberFormat.currency(
                              symbol: 'IDR', decimalDigits: 0, locale: 'id_ID')
                          .format(widget.transaction.total! +
                              (widget.transaction.total! * 0.1) +
                              50000),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Text(
                  'Delivery to:',
                  style: blackFontStyle3,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Rechiever's name:",
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(widget.transaction.user!.name!),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Rechiever's email:",
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(widget.transaction.user!.email!),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Phone number:",
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(widget.transaction.user!.phoneNumber!),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Address:",
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(widget.transaction.user!.address!),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "House number:",
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(widget.transaction.user!.houseNumber!),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "City:",
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(widget.transaction.user!.city!),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      bool result = await context
                          .read<TransactionCubit>()
                          .submitTransaction(widget.transaction.copyWith(
                            dateTime: DateTime.now(),
                            total: (widget.transaction.total! * 1.1 + 50000)
                                .toInt(),
                          ));
                      if(result){
                        Get.to(SuccessOrderPage());
                      } else {
                        Get.snackbar(
                            "title",
                            "message",
                            backgroundColor: "D9435E".toColor(),
                            icon: Icon(MdiIcons.closeCircleOutline,
                                color: Colors.white),
                            titleText: Text(
                              'Transaction In Failed',
                              style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600),
                            ),
                            messageText: Text(
                              "Please try again later",
                              style: GoogleFonts.poppins(color: Colors.white),
                            )
                        );
                      }
                    },
                    child: Text(
                      'ORDER NOW',
                      style: blackFontStyle2.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
