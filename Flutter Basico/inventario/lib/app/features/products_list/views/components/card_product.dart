part of products_list_view;

final controller = Get.put(ProductsListController());

List<Widget> list(List<ProductModel> products) {
  List<Widget> cards = [];

  for (var product in products) {
    cards.add(card(product));
  }

  cards.add(const SizedBox(height: 5.0));

  return cards;
}

Widget card(ProductModel product) {
  return Container(
    width: Get.width,
    padding: const EdgeInsets.only(top: 8.0, left: 5.0, right: 5.0),
    child: InkWell(
      onTap: () => Get.toNamed(
        Routes.productsDetail,
        arguments: product,
      )!
          .whenComplete(() => controller.update(["listProduct"])),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(51, 47, 44, 0.6),
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
        ),
        child: Stack(
          children: [
            //imagen
            img(product.photoUrl),
            //informacion
            Container(
              width: Get.width * 0.7556,
              height: 102.0,
              padding: const EdgeInsets.only(left: 125.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 2.0),
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    info("Código: ${product.br}"),
                    info("Cantidad existente: ${product.quantityE}"),
                    info("Cantidad vendida: ${product.quantitySold}"),
                    const SizedBox(height: 3.0),
                  ],
                ),
              ),
            ),
            //precio
            priceWidget(product.price, product.quantityE),
          ],
        ),
      ),
    ),
  );
}

String moneyFormat(String price) {
  var value = price;
  if (price.length > 2) {
    value = value.replaceAll(RegExp(r'\D'), '');
    value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.');
  }
  return value;
}

Widget priceWidget(String price, String quantityE) {
  if (quantityE == '0') {
    return Positioned(
      right: 0.0,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: const Text(
          "AGOTADO",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: BoxDecoration(
          color: Get.theme.errorColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
      ),
    );
  } else {
    return Positioned(
      right: 0.0,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "\$${moneyFormat(price)}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

Widget img(String photoUrl) {
  return Container(
    width: Get.width * 0.3333,
    height: 102.0,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10.0),
        topLeft: Radius.circular(10.0),
      ),
    ),
    child: FadeInImage(
      placeholder: const AssetImage(ImageGifConstant.gifLoading),
      image: NetworkImage(photoUrl),
      fadeOutDuration: const Duration(milliseconds: 200),
      //height: 300,
      fit: BoxFit.fitHeight,
      imageErrorBuilder: (context, exception, stackTrace) {
        //print('Error Handler');
        return Image.asset(
          ImagePngConstant.noImage,
          fit: BoxFit.cover,
        );
      },
    ),
  );
}

Widget info(String txt) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2.0),
    child: Text(
      txt,
      style: const TextStyle(
        fontSize: 12.0,
      ),
      textAlign: TextAlign.start,
    ),
  );
}
