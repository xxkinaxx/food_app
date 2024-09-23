part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, this.user});
  
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 20),
                child: Column(
                  children: [
                    Text(user!.name!)
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
