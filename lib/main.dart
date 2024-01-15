import 'package:fluent_ui/fluent_ui.dart';
import 'package:markdown_editor/utils/colors.dart';
import 'package:markdown_editor/widgets/files_view.dart';
import 'package:markdown_editor/widgets/main_header.dart';
import 'package:markdown_editor/widgets/note_view.dart';
import 'package:window_manager/window_manager.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(800, 600),
    center: true,
    title: 'Markdown Editor',
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      title: 'Markdown Editor',
      theme: FluentThemeData().copyWith(
        scaffoldBackgroundColor: Colors.white,
        iconTheme: const IconThemeData().copyWith(
          color: AppColors.accentColor,
        ),
      ),
      home: const ScaffoldPage(
          padding: EdgeInsets.zero,
          header: MainHeader(),
          content: Row(
            children: [
              FilesView(),
              NoteView(),
            ],
          )),
    );
  }
}
