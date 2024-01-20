import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:markdown_editor/core/services/local_file_manager.dart';
import 'package:markdown_editor/core/utils/colors.dart';
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

  runApp(const ProviderScope(child: MyApp()));
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
      home: ScaffoldPage(
          padding: EdgeInsets.zero,
          header: MainHeader(fileManager: LocalFileManger()),
          content: const Row(
            children: [
              FilesView(),
              NoteView(),
            ],
          )),
    );
  }
}
