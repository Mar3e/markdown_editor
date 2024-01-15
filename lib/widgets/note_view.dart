import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_editor/utils/colors.dart';

class NoteView extends StatefulWidget {
  const NoteView({
    super.key,
  });

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  bool showView = false;

  @override
  Widget build(BuildContext context) {
    Widget mainContent = TextBox(
      controller: textController,
      keyboardType: TextInputType.multiline,
      expands: true,
      maxLines: null,
      minLines: null,
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.zero,
      ),
    );

    if (showView) {
      mainContent = Markdown(data: textController.text);
    }

    return Expanded(
      flex: 4,
      child: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              color: AppColors.primaryColor,
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Note Title'),
                  ToggleButton(
                    checked: showView,
                    onChanged: (newValue) => setState(() {
                      showView = !showView;
                    }),
                    child: showView
                        ? const Text('Edit file')
                        : const Text('View file'),
                  )
                ],
              ),
            ),
            Expanded(child: mainContent),
          ],
        ),
      ),
    );
  }
}
