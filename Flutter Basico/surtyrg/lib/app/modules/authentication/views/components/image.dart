part of authentication_view;

class _Image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.5,
      height: Get.width * 0.5,
      child: SvgPicture.asset(
        ImageVectorConstant.authenticationIllustration,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
