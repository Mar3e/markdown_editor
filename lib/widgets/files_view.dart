import 'package:fluent_ui/fluent_ui.dart';
import 'package:markdown_editor/core/utils/colors.dart';

class FilesView extends StatelessWidget {
  const FilesView({
    super.key,
  });

  List<Widget> get testWidgets {
    var widgets = Iterable.generate(
      10,
      (index) {
        return ListTile(
          onPressed: () {},
          title: const Text('File Name'),
        );
      },
    ).toList();

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 24.0,
        ),
        color: AppColors.secondaryColor.withOpacity(0.9),
        height: double.infinity,
        child: ListView.builder(
          itemCount: testWidgets.length,
          itemBuilder: (context, index) => testWidgets[index],
        ),
      ),
    );
  }
}
