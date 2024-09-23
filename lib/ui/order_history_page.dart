part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;
  List<Transaction> inProgress = mockTransaction
      .where((e) =>
          e.status == TransactionStatus.on_delivery ||
          e.status == TransactionStatus.pending)
      .toList();
  List<Transaction> past = mockTransaction
      .where((e) =>
          e.status == TransactionStatus.delivered ||
          e.status == TransactionStatus.canceled)
      .toList();

  @override
  Widget build(BuildContext context) {

    double listItemWidth = MediaQuery.of(context).size.width - 2 * defaultMargin;

    return (inProgress.length == 0 && past.length == 0)
        ? IllustrationPage(
            title: 'Ouch! Hungry',
            subtitle: 'Seems like you haven\`t order anything yet',
            picturePath: 'assets/food_wishes.png',
            buttonTitle1: 'Find foods',
            buttonTap1: () {})
        : ListView(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: defaultMargin),
                padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin, vertical: 15),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Order',
                      style: blackFontStyle2,
                    ),
                    Text(
                      'Wait for the Best Meal',
                      style: blackFontStyle3.copyWith(color: greyColor),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    CustomTabBar(
                      selectedIndex: selectedIndex,
                      titles: ['In Progress', 'Past Orders'],
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: (selectedIndex == 0 ? inProgress : past)
                          .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FoodOrderItem(transaction: e, itemWidth: listItemWidth,)
                          ))
                          .toList(),
                    )
                  ],
                ),
              )
            ],
          );
  }
}
