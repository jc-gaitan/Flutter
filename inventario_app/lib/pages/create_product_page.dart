import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario/controllers/create_product_controller.dart';
import 'package:inventario/utils/constants/assets_constant.dart';
import 'package:inventario/widgets/input_widget.dart';

class CreateProductPage extends StatelessWidget {
  CreateProductPage({Key? key}) : super(key: key);

  final CreateProductController controller = Get.put(CreateProductController());

  @override
  Widget build(BuildContext context) {
    return GetX<CreateProductController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: controller.deleteImg,
              icon: const Icon(Icons.arrow_back_ios_new),
              splashRadius: 20.0,
            ),
            title: const Text("CREAR PRODUCTO"),
          ),
          body: (controller.frist.value) ? getBarCode() : dataProduct(),
          floatingActionButton: (!controller.frist.value)
              ? FloatingActionButton(
                  backgroundColor: Get.theme.primaryColor,
                  onPressed: controller.save,
                  tooltip: 'Guardar',
                  child: const Icon(Icons.save),
                )
              : null,
        );
      },
    );
  }

  Container dataProduct() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          selectImage(),
          const SizedBox(height: 5.0),
          InputWidget(
            text: 'Nombre del producto',
            type: TextInputType.name,
            controller: controller.data[0],
          ),
          const SizedBox(height: 10.0),
          InputWidget(
            text: 'Cantidad existente',
            type: TextInputType.number,
            controller: controller.data[1],
          ),
          const SizedBox(height: 10.0),
          InputWidget(
            text: 'Precio',
            type: TextInputType.number,
            controller: controller.data[2],
          ),
        ],
      ),
    );
  }

  Widget selectImage() {
    if (controller.selectedImg.value) {
      return InkWell(
        onTap: () => subirImagen(Get.context!),
        child: Container(
          width: Get.width,
          height: 150.0,
          color: Colors.white,
          child: FadeInImage(
            placeholder: const AssetImage(ImageGifConstant.gifLoading),
            image: NetworkImage(controller.photoUrl.value),
            fadeOutDuration: const Duration(milliseconds: 200),
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
    } else {
      return InkWell(
        onTap: () => subirImagen(Get.context!),
        child: const Center(
          child: Icon(
            Icons.cloud_upload_outlined,
            size: 150.0,
            color: Colors.black,
          ),
        ),
      );
    }
  }

  void subirImagen(BuildContext context) {
    showModalBottomSheet(
      context: context,
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

  Container getBarCode() {
    return Container(
      margin: const EdgeInsets.all(10.0),
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
          (controller.bc.value == 'Unknown')
              ? IconButton(
                  onPressed: controller.scanBarcodeNormal,
                  icon: const Icon(
                    Icons.camera_alt_rounded,
                    size: 30.0,
                    color: Colors.blueGrey,
                  ),
                  splashRadius: 25.0,
                )
              : IconButton(
                  onPressed: controller.next,
                  icon: const Icon(
                    Icons.navigate_next,
                    size: 30.0,
                  ),
                  splashRadius: 25.0,
                ),
        ],
      ),
    );
  }
}
