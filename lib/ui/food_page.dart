part of 'pages.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    double listItemWidth = MediaQuery.of(context).size.width - 2 * defaultMargin;

    return ListView(
      children: [
        // Header
        Container(
          color: Colors.white,
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Food Market',
                    style: blackFontStyle1,
                  ),
                  Text(
                    "Let's get some food",
                    style: blackFontStyle2,
                  )
                ],
              ),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/736x/8f/64/89/8f6489fb5059319312537ba9c58cac39.jpg'),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Card Food
        Container(
          height: 220,
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: defaultMargin),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: mockFoods
                .map((food) => Padding(
                      padding: EdgeInsets.only(
                          left: (food == mockFoods.first) ? defaultMargin : 0,
                          right: defaultMargin),
                      child: FoodCard(
                        food: food,
                      ),
                    ))
                .toList(),
          ),
        ),
        // Layout
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              CustomTabBar(selectedIndex: selectedIndex, titles: ['New Taste', 'Popular', 'Recommend'],
                onTap: (index){
                setState(() {
                  selectedIndex = index;
                });
                },
              ),
              SizedBox(height: 80,),
              Builder(builder: (_){
                List<Food> foods = (selectedIndex == 0)
                    ? mockFoods
                    : (selectedIndex == 1)
                      ? []
                      : [];
                return Column(
                  children: foods.map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FoodListItem(food: e, itemWidth: listItemWidth,),
                  )).toList(),
                );
              }),
              SizedBox(height: 80,),
            ],
          ),
        ),
      ],
    );
  }
}
