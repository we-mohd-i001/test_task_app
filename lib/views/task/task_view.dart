import '../../constants/constants.dart';
import '../common_widgets/create_app_bar_widget.dart';
import '../common_widgets/play_pause_button.dart';
import '../common_widgets/timer_widget.dart';

class TaskView extends StatelessWidget {
  final String title;
  const TaskView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBarWidget(title: title, onPressed: () => Get.back()),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                    maxHeight: 100,
                    minHeight: 100,
                    minWidth: 100,
                    maxWidth: 200),
                child: const TimerWidget(
                  fontSize: 56,
                  time: '23:00',
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.1),
                constraints: const BoxConstraints(
                  maxHeight: 60,
                  minHeight: 40,
                  minWidth: 60,
                  maxWidth: 200,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const PlayPauseButton(
                      size: 40,
                      isPlaying: true,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.stop_circle_rounded,
                        size: 40,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
