import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario/controllers/detail_product_controller.dart';
import 'package:inventario/utils/constants/assets_constant.dart';
import 'package:inventario/widgets/input_widget.dart';

class DetailProductPage extends StatelessWidget {
  DetailProductPage({Key? key}) : super(key: key);

  final DetailProductController controller = Get.put(DetailProductController());

  @override
  Widget build(BuildContext context) {
    return GetX<DetailProductController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.product.name),
          ),
          body: body(),
          floatingActionButton: FloatingActionButton(
            onPressed: controller.save,
            tooltip: 'Guardar',
            child: const Icon(Icons.save),
          ),
        );
      },
    );
  }

  SingleChildScrollView body() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image(),
            const SizedBox(height: 5.0),
            getBarCode(),
            const SizedBox(height: 5.0),
            InputWidget(
              text: 'Nombre',
              type: TextInputType.name,
              controller: controller.data[0],
            ),
            const SizedBox(height: 5.0),
            InputWidget(
              text: 'Precio',
              type: TextInputType.number,
              controller: controller.data[1],
            ),
            const SizedBox(height: 5.0),
            InputWidget(
              text: 'Cantidad existente',
              type: TextInputType.name,
              controller: controller.data[2],
            ),
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Cantidad vendida: ${controller.product.quantitySold}',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container getBarCode() {
    return Container(
      //margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Código de barras",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                controller.bc.value,
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: controller.scanBarcodeNormal,
            icon: const Icon(
              Icons.camera_alt_rounded,
              size: 30.0,
              color: Colors.blueGrey,
            ),
            splashRadius: 25.0,
          ),
        ],
      ),
    );
  }

  Widget image() {
    return InkWell(
      onTap: subirImagen,
      child: Container(
        width: Get.width,
        height: 300.0,
        color: Colors.white,
        child: FadeInImage(
          placeholder: const AssetImage(ImageGifConstant.gifLoading),
          image: NetworkImage(controller.photoUrl.value),
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
      ),
    );
  }

  void subirImagen() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Galeria'),
              onTap: () {
                controller.seleccionarFoto();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camara'),
              onTap: () {
                controller.tomarFoto();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
