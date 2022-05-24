part of create_order_view;

class SectionWidget extends StatelessWidget {
  const SectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateOrderController>(
      init: CreateOrderController(),
      builder: (_) {
        TextStyle style = const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        );
        TextStyle style1 = const TextStyle(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.normal,
        );
        return ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(10.0),
          children: [
            const SizedBox(height: 10.0),
            Text(
              _.date,
              style: style1,
            ),
            const SizedBox(height: 10.0),
            TextButton.icon(
              onPressed: () {
                _.scanBarcodeNormal();
              },
              icon: Icon(
                Icons.add_circle,
                color: Get.theme.primaryColor,
              ),
              label: Text(
                "AÑADIR PRODUCTO",
                style: TextStyle(
                  color: Get.theme.primaryColor,
                ),
              ),
              style: const ButtonStyle(
                alignment: Alignment.centerLeft,
              ),
            ),
            const SizedBox(height: 10.0),
            (_.items.isNotEmpty)
                ? Column(
                    children: listProduct(_),
                  )
                : Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: const [
                        Icon(
                          Icons.remove_shopping_cart_outlined,
                          size: 150.0,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "NO HAY PRODUCTOS AGREGADOS EN EL PEDIDO",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
            const SizedBox(height: 10.0),
            (_.items.isNotEmpty) ? descuento(style, _) : Container(),
          ],
        );
      },
    );
  }

  List<Widget> listProduct(CreateOrderController _) {
    List<Widget> listProducts = [];
    for (int i = 0; i < _.items.length; i++) {
      listProducts.add(product(_.items[i], _, i));
    }
    return listProducts;
  }

  Widget product(ProductModel product, CreateOrderController _, int i) {
    return Card(
      margin: EdgeInsets.all(3.0),
      elevation: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          img(product.photoUrl),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5.0),
              SizedBox(
                  child: Text(product.name, textAlign: TextAlign.center),
                  width: 130.0),
              Container(
                padding: const EdgeInsets.all(3),
                margin: const EdgeInsets.symmetric(vertical: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Get.theme.primaryColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () => _.reduceQuantity(i, product),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    Container(
                      width: 40.0,
                      height: 25.0,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.white),
                      child: Text(
                        '${_.quantity[i]}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    InkWell(
                      onTap: () => _.increaseQuantity(i),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text("\$${_.moneyFormat(product.price)}"),
          ),
        ],
      ),
    );
  }

  Widget descuento(TextStyle style, CreateOrderController _) {
    const InputBorder border = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    );
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(left: 140.0, top: 5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(10.0),
        //color: Colors.red,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '% DESCUENTO',
            style: style,
          ),
          Container(
            width: 30.0,
            height: 20.0,
            margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 3.0),
            child: TextField(
              autofocus: false,
              onChanged: (value) => _.descuento(value),
              textAlign: TextAlign.center,
              maxLength: 3,
              keyboardType: TextInputType.number,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: const InputDecoration(
                enabledBorder: border,
                focusedBorder: border,
                border: border,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                fillColor: Colors.transparent,
                contentPadding: EdgeInsets.only(bottom: 13.0),
                counterText: "",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget img(String photoUrl) {
    return Container(
      width: 80.0,
      height: 80.0,
      margin: EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: FadeInImage(
          placeholder: const AssetImage(ImageGifConstant.gifLoading),
          image: NetworkImage(photoUrl),
          fadeOutDuration: const Duration(milliseconds: 200),
          fit: BoxFit.fitHeight,
          imageErrorBuilder: (context, exception, stackTrace) {
            return Image.asset(
              ImagePngConstant.noImage,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
