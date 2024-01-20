import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:markdown_editor/core/providers/note_provider.dart';
import 'package:markdown_editor/models/note.dart';
import 'package:markdown_editor/core/utils/colors.dart';

class NoteView extends ConsumerStatefulWidget {
  const NoteView({
    super.key,
  });

  @override
  ConsumerState<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends ConsumerState<NoteView> {
  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  bool showView = false;

  @override
  Widget build(BuildContext context) {
    Note currentNote = ref.watch(noteProvider);
    textController.text = currentNote.content;

    Widget mainContent = TextBox(
      controller: textController,
      onChanged: (value) =>
          ref.read(noteProvider.notifier).writeOnFile(currentNote.title, value),
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
                  Text(
                    currentNote.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  ToggleButton(
                    checked: showView,
                    onChanged: (newValue) {
                      ref
                          .read(noteProvider.notifier)
                          .readNote(currentNote.title);
                      setState(() {
                        showView = newValue;
                      });
                    },
                    child: showView
                        ? const Text('Edit Note')
                        : const Text('View Note'),
                  )
                ],
              ),
            ),
            Expanded(child: mainContent),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              color: AppColors.primaryColor.withOpacity(0.5),
              width: double.infinity,
              child: Text(
                "last modified  ${currentNote.formattedModifiedAtDate}",
                textAlign: TextAlign.end,
              ),
            )
          ],
        ),
      ),
    );
  }
}
