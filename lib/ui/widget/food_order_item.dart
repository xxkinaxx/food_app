part of 'widgets.dart';

class FoodOrderItem extends StatelessWidget {
  const FoodOrderItem(
      {super.key, required this.transaction, required this.itemWidth});

  final Transaction transaction;
  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 80,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(transaction.food?.picturePath ??
                  'https://ui-avatars.com/api/?name=${transaction.food?.name}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.food?.name ?? 'No Name',
                      style: blackFontStyle2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Text('${transaction.quantity} item(s) ~ '),
                        Text(
                          NumberFormat.currency(
                              symbol: 'IDR', decimalDigits: 0, locale: 'id-ID')
                              .format(transaction.total),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(convertDataTimeDisplay(transaction.dateTime!)),
                  (transaction.status == TransactionStatus.delivered)
                      ? Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'Delivered',
                      style: blackFontStyle2.copyWith(color: Colors.white),
                    ),
                  )
                      : (transaction.status == TransactionStatus.canceled)
                      ? Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'Canceled',
                      style:
                      blackFontStyle2.copyWith(color: Colors.white),
                    ),
                  )
                      : (transaction.status == TransactionStatus.pending)
                      ? Container(
                    decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'Pending',
                      style: blackFontStyle2.copyWith(
                          color: Colors.white),
                    ),
                  )
                      : Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Text(
                          'On Delivery',
                          style: blackFontStyle2.copyWith(
                              color: Colors.white),
                        ),
                        Icon(Icons.motorcycle, color: Colors.white,)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
