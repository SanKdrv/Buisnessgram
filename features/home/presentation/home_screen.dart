class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc,HomeState>(
      child: Scaffold(
        appBar: HomeScreenAppBar(),
        body: Body(),
      ),
    );
  }
}