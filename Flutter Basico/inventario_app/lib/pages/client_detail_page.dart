import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario/controllers/detail_client_controller.dart';
import 'package:inventario/widgets/input_widget.dart';

class DetailClientPage extends StatelessWidget {
  DetailClientPage({Key? key}) : super(key: key);

  final DetailClientController controller = Get.put(DetailClientController());

  @override
  Widget build(BuildContext context) {
    return GetX<DetailClientController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Detalle cliente'),
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
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                controller.isExpanded.value = !isExpanded;
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return const ListTile(
                      title: Text('Pedidos'),
                    );
                  },
                  body: const ListTile(
                    title: Text('Item 1 child'),
                    subtitle: Text('Details goes here'),
                  ),
                  isExpanded: controller.isExpanded.value,
                ),
              ],
            ),
            const SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}
