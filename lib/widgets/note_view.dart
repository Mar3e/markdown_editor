import 'package:fluent_ui/fluent_ui.dart';

class NoteView extends StatelessWidget {
  const NoteView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        height: double.infinity,
        color: Colors.purple,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              color: Colors.magenta,
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Note Title'),
                  ToggleButton(
                    checked: false,
                    onChanged: (newValue) {},
                    child: const Text('Edit View'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
