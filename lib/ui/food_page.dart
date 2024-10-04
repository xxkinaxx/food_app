part of 'pages.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  void initState() {
    context.read<FoodCubit>().getFoods();
    super.initState();
  }
  void onRefresh() {
    context.read<FoodCubit>().getFoods();
  }

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;

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
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      (context.read<UserCubit>().state as UserLoaded)
                              .user
                              .picturePath ??
                          'https://ui_avatars.com/api/?name=${(context.read<UserCubit>().state as UserLoaded).user.name}',
                    ),
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
          child: BlocBuilder<FoodCubit, FoodState>(
            builder: (_, state) => (state is FoodLoaded)
                ? ListView(
                    scrollDirection: Axis.horizontal,
                    children: state.foods
                        .map((food) => Padding(
                              padding: EdgeInsets.only(
                                  left: (food == state.foods.first)
                                      ? defaultMargin
                                      : 0,
                                  right: defaultMargin),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(
                                    DetailPage(
                                      onBackButtonPressed: () {
                                        Get.back();
                                      },
                                      transaction: Transaction(
                                          food: food,
                                          user: (context.read<UserCubit>().state
                                                  as UserLoaded)
                                              .user),
                                    ),
                                  )!.then((value){
                                    //
                                  });
                                },
                                child: FoodCard(
                                  food: food,
                                ),
                              ),
                            ))
                        .toList(),
                  )
                : Center(child: loadingIndicator,),
          ),
        ),
        // Layout
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              CustomTabBar(
                selectedIndex: selectedIndex,
                titles: ['New Taste', 'Popular', 'Recommend'],
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              SizedBox(
                height: 50,
              ),
              BlocBuilder<FoodCubit, FoodState>(builder: (_, state) {
                if (state is FoodLoaded) {
                  List<Food> foods = state.foods
                      .where((e) => e.types!.contains((selectedIndex == 0)
                          ? FoodType.new_food
                          : (selectedIndex == 1)
                              ? FoodType.popular
                              : FoodType.recommended))
                      .toList();
                  return Column(
                    children: foods
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (){
                                  Get.to(DetailPage(
                                      onBackButtonPressed: (){
                                    Get.back();
                                  },
                                  transaction: Transaction(
                                    food: e,
                                    user: (context.read<UserCubit>().state
                                    as UserLoaded)
                                        .user),
                                  ),);
                                },
                                child: FoodListItem(
                                  food: e,
                                  itemWidth: listItemWidth,
                                ),
                              ),
                            ))
                        .toList(),
                  );
                } else {
                  return Center(
                    child: loadingIndicator,
                  );
                }
              }),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
