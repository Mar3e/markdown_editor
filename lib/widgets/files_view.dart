import 'package:fluent_ui/fluent_ui.dart';
import 'package:markdown_editor/utils/colors.dart';

class FilesView extends StatelessWidget {
  const FilesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        color: AppColors.secondaryColor,
        height: double.infinity,
        child: const Text('text'),
      ),
    );
  }
}
