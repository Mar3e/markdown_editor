import 'package:fluent_ui/fluent_ui.dart';
import 'package:markdown_editor/core/services/local_file_manager.dart';
import 'package:markdown_editor/core/utils/colors.dart';
import 'package:markdown_editor/core/utils/infos.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor.withOpacity(0.55),
            AppColors.primaryColor.withOpacity(0.9),
          ],
        ),
      ),
      child: PageHeader(
        title: const Text('Awesome Markdown Editor'),
        commandBar: CommandBar(
          mainAxisAlignment: MainAxisAlignment.end,
          primaryItems: [
            CommandBarButton(
              icon: const Icon(
                FluentIcons.delete,
                size: 24.0,
              ),
              onPressed: () {},
            ),
            const CommandBarSeparator(
              thickness: 2.5,
            ),
            CommandBarButton(
              icon: const Icon(
                FluentIcons.add_medium,
                size: 24.0,
              ),
              onPressed: () async {
                print(await Info.showTextDialog(context));
                final fileManager = LocalFileManger();
                fileManager.createFile("testing_file");
              },
            ),
          ],
        ),
      ),
    );
  }
}
