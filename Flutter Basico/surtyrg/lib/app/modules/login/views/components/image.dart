part of login_view;

class _Image extends StatelessWidget {
  const _Image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.5,
      height: Get.width * 0.5,
      child: SvgPicture.asset(
        ImageVectorConstant.loginIllustration,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
