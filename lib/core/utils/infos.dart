import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:markdown_editor/core/providers/dialog_provider.dart';

class Info {
  static Future<String?> showTextDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            final title = ref.watch(dialogProvider);

            return ContentDialog(
              title: const Text('Name the file:'),
              content: SizedBox(
                height: 50,
                child: InfoLabel(
                  label: 'File name',
                  child: TextBox(
                    onChanged: (value) =>
                        ref.read(dialogProvider.notifier).state = value,
                  ),
                ),
              ),
              actions: [
                Button(
                  child: const Text('Cancel'),
                  onPressed: () {
                    ref.invalidate(dialogProvider);
                    Navigator.pop(context);
                    // Delete file here
                  },
                ),
                FilledButton(
                  onPressed: title != null
                      ? () {
                          ref.invalidate(dialogProvider);
                          Navigator.pop(context, title);
                        }
                      : null,
                  child: const Text('Create'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
