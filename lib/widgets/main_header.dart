import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:markdown_editor/core/providers/note_provider.dart';
import 'package:markdown_editor/core/services/file_manager.dart';
import 'package:markdown_editor/core/utils/colors.dart';
import 'package:markdown_editor/core/utils/infos.dart';

class MainHeader extends ConsumerWidget {
  const MainHeader({
    super.key,
    required this.fileManager,
  });
  final FileManager fileManager;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              onPressed: () {
                //TODO add the logic to delet a file
              },
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
                final title = await Info.showTextInputDialog(context);
                if (title != null) {
                  fileManager.createFile(title);
                  ref.read(noteProvider.notifier).readNote(title);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
