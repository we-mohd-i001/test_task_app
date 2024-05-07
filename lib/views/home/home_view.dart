import '../../constants/constants.dart';
import '../common_widgets/create_app_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBarWidget(title: homeTitle, implyLeading: false),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
