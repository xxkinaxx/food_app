part of 'widgets.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({super.key, this.food, required this.itemWidth});

  final Food? food;
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
              image: NetworkImage(food?.picturePath ??
                  'https://ui-avatars.com/api/?name=${food?.name}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food?.name ?? 'No Name',
                style: blackFontStyle2,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                NumberFormat.currency(
                        symbol: 'IDR', decimalDigits: 0, locale: 'id-ID')
                    .format(food?.price),
              )
            ],
          ),
        ),
        RatingStars(
          rate: food?.rate,
        )
      ],
    );
  }
}
