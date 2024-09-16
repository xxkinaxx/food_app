part of 'pages.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Payment',
      subtitle: 'You deserve better meal',
      onBackButtonPressed: (){
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
                Text('Item Ordered', style: blackFontStyle3.copyWith(fontSize: 16),),
                SizedBox(height: 12,),
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(15),
                        image: DecorationImage(image: NetworkImage(transaction.food!.picturePath!))
                      ),
                    ),
                    SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 189, // 60 + 12 + 117
                          child: Text(transaction.food!.name!, style: blackFontStyle3, maxLines: 1, overflow: TextOverflow.ellipsis,),
                        ),
                        Text(
                            NumberFormat.currency(symbol: 'IDR', decimalDigits: 0, locale: 'id_ID')
                                .format(transaction.food!.price!)
                        )
                      ],
                    ),
                    Expanded(
                      child: Text('${transaction.quantity} Item(s)', textAlign: TextAlign.end,),
                    )
                  ],
                ),
                SizedBox(height: 12,),
                // Detail
                Divider(thickness: 1, color: Colors.black,),
                Text('Detail Transaction', style: blackFontStyle3.copyWith(fontSize: 16),),
                SizedBox(height: 12,),
                Row(
                  children: [
                    Text(transaction.food!.name!, style: blackFontStyle3,),
                    Spacer(),
                    Text(NumberFormat.currency(symbol: 'IDR', decimalDigits: 0, locale: 'id_ID').format(transaction.food!.price!))
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Quantity', style: blackFontStyle3,),
                    Spacer(),
                    Text('${transaction.quantity.toString()} item(s)')
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Subtotal', style: blackFontStyle3,),
                    Spacer(),
                    Text(NumberFormat.currency(symbol: 'IDR', decimalDigits: 0, locale: 'id_ID').format(transaction.food!.price! * transaction.quantity!))
                  ],
                ),
                SizedBox(height: 10,),
                Divider(thickness: 1, color: Colors.black,),
                Row(
                  children: [
                    Text('Tax 10%', style: blackFontStyle3,),
                    Spacer(),
                    Text(NumberFormat.currency(symbol: 'IDR', decimalDigits: 0, locale: 'id_ID').format(transaction.food!.price! * transaction.quantity! * 0.1))
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Driver', style: blackFontStyle3,),
                    Spacer(),
                    Text(NumberFormat.currency(symbol: 'IDR', decimalDigits: 0, locale: 'id_ID').format(50000))
                  ],
                ),
                Divider(thickness: 1, color: Colors.black,),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Total', style: blackFontStyle2.copyWith(fontWeight: FontWeight.bold),),
                    Spacer(),
                    Text(NumberFormat.currency(symbol: 'IDR', decimalDigits: 0, locale: 'id_ID').format(transaction.total!), style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Divider(thickness: 1, color: Colors.black,),
                Text('Delivery to:', style: blackFontStyle3,),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text("Rechiever's name:", style: blackFontStyle3,),
                    Spacer(),
                    Text(transaction.user!.name!),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text("Rechiever's email:", style: blackFontStyle3,),
                    Spacer(),
                    Text(transaction.user!.email!),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text("Phone number:", style: blackFontStyle3,),
                    Spacer(),
                    Text(transaction.user!.phoneNumber!),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text("Address:", style: blackFontStyle3,),
                    Spacer(),
                    Text(transaction.user!.address!),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text("House number:", style: blackFontStyle3,),
                    Spacer(),
                    Text(transaction.user!.houseNumber!),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text("City:", style: blackFontStyle3,),
                    Spacer(),
                    Text(transaction.user!.city!),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text('ORDER NOW', style: blackFontStyle2.copyWith(color: Colors.white, fontWeight: FontWeight.bold),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                      )
                    ),
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
