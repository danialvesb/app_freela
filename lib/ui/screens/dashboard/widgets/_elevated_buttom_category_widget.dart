part of '../dashboard_screen.dart';

class _ElevatedButtomCategoryWidget extends StatelessWidget {
  final String title;
  final String image;
  final Function() onPressed;
  const _ElevatedButtomCategoryWidget({
    required this.title,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(image),
        )),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
