part of create_products_view;

class StepperCreateProduct extends StatelessWidget {
  final controller = Get.put(CreateProductController());

  StepperCreateProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stepper(
        type: StepperType.vertical,
        physics: const ScrollPhysics(),
        currentStep: controller.currentStep.value,
        controlsBuilder: (context, details) {
          return Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              children: <Widget>[
                TextButton(
                  onPressed: controller.onNext,
                  child: Text(
                    (controller.currentStep.value == 1)
                        ? ' GUARDAR '
                        : 'CONTINUAR',
                    style: const TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6), // <-- Radius
                    ),
                    primary: Colors.blue,
                    onPrimary: Colors.blueGrey,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  ),
                ),
                const SizedBox(width: 8.0),
                TextButton(
                  onPressed: controller.onPrevious,
                  child: Text(
                    (controller.currentStep.value > 0)
                        ? ' ANTERIOR '
                        : 'CANCELAR',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6), // <-- Radius
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  ),
                ),
              ],
            ),
          );
        },
        steps: [
          Step(
            title: const Text('CÓDIGO DE BARRAS'),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () => controller.scanBarcodeNormal(),
                        child: const Text(
                          'Escanear de código de barras',
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'Código: ${controller.scanBarcode}\n',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            isActive: controller.currentStep.value >= 0,
            state: controller.currentStep.value == 0
                ? StepState.editing
                : controller.currentStep.value >= 0
                    ? StepState.complete
                    : StepState.disabled,
          ),
          Step(
            title: const Text('DATOS DEL PRODUCTO'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                icon(),
                const SizedBox(height: 5.0),
                title('Nombre del producto'),
                input('', 'name'),
                title('Cantidad existente'),
                input('', 'quantyE'),
                title('Precio'),
                input('', 'price'),
                //title('Cantidad vendida: 0'),
              ],
            ),
            isActive: controller.currentStep.value >= 0,
            state: controller.currentStep.value == 1
                ? StepState.editing
                : controller.currentStep.value >= 1
                    ? StepState.complete
                    : StepState.disabled,
          ),
        ],
      ),
    );
  }

  Widget image() {
    return InkWell(
      onTap: () => subirImagen(Get.context!),
      child: Container(
        width: Get.width,
        height: 150.0,
        color: Colors.white,
        child: FadeInImage(
          placeholder: const AssetImage(ImageGifConstant.gifLoading),
          image: NetworkImage(controller.photoUrl),
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
  }

  Widget icon() {
    if (controller.photoLoad.value) {
      return image();
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

  Widget input(String text, String type) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        keyboardType:
            (type == 'name') ? TextInputType.name : TextInputType.number,
        onChanged: (value) {
          if (type == 'name') {
            controller.name = value;
          } else if (type == 'price') {
            controller.price = value;
          } else {
            controller.quantyE = value;
          }
        },
        decoration: InputDecoration(
          hintText: text,
          contentPadding: const EdgeInsets.only(
            top: 2.0,
            bottom: 8.0,
            left: 10.0,
            right: 10.0,
          ),
        ),
      ),
    );
  }

  Widget title(String txt) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        txt,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
