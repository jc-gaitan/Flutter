part of products_list_view;

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsListController>(
      init: ProductsListController(),
      id: "listProduct",
      builder: (_) {
        return SizedBox(
          height: Get.height,
          width: Get.width,
          child: FutureBuilder(
            future: _.getProducts(),
            builder: (BuildContext context,
                AsyncSnapshot<List<ProductModel>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  return Column(
                    children: list(snapshot.data!),
                  );
                } else {
                  return const Center(
                    child: Text("NO HAY PRODUCTOS REGISTRADOS"),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Get.theme.primaryColor,
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
