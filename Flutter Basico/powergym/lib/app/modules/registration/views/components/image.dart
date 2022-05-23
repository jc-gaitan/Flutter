part of registration_view;

class _Image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.45,
      height: Get.width * 0.45,
      child: SvgPicture.asset(
        ImageVectorConstant.registrationIllustration,
        fit: BoxFit.cover,
      ),
    );
  }
}
