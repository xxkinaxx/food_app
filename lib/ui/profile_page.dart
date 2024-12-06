part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: defaultMargin),
          margin: const EdgeInsets.only(bottom: defaultMargin),
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(bottom: defaultMargin),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/photo_border.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage((context.read<UserCubit>().state as UserLoaded)
                            .user
                            .picturePath ??
                            'https://ui_avatars.com/api/?name=${(context.read<UserCubit>().state as UserLoaded).user.name}',),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Text(
                (context.read<UserCubit>().state as UserLoaded).user.name ?? 'UserName',
                style: blackFontStyle1.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                (context.read<UserCubit>().state as UserLoaded).user.email ?? 'Email',
                style: blackFontStyle2.copyWith(),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height - 320,
          padding:  EdgeInsets.all(defaultMargin),
          child: Column(
            children: [
              CustomTabBar(
                selectedIndex: selectedIndex,
                titles:  ["Account", "Food Market"],
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
               SizedBox(
                height: 16,
              ),
              (selectedIndex == 0) ?  AccountTab() :  FoodMarketTab(),
            ],
          ),
        ),
      ],
    );
  }
}

class AccountTab extends StatelessWidget {
   AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowTab(title: 'Edit Profile'),
        RowTab(title: 'Home Address'),
        RowTab(title: 'Security'),
        RowTab(title: 'Payments'),
        GestureDetector(
          onTap: (){
            context.read<UserCubit>().signOut();
            Get.to(SignInPage());
          },
            child: RowTab(title: 'Sign Out')
        ),
      ],
    );
  }
}

class FoodMarketTab extends StatelessWidget {
   FoodMarketTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowTab(title: 'Rate App'),
        RowTab(title: 'Help Center'),
        RowTab(title: 'Privact & Policy'),
        RowTab(title: 'Term & Conditions'),
      ],
    );
  }
}

class RowTab extends StatelessWidget {
   RowTab({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: blackFontStyle2,
        ),
        Icon(
          MdiIcons.chevronRight,
          color: mainColor,
          size: 40,
        )
      ],
    );
  }
}