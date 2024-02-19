import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_textfield.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key});
  static String id = 'UpdateProductScreen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, desc, image;
  bool isLoading = false;
  String? price;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(
                color: Colors.black, fontFamily: 'Pacifico', fontSize: 25),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 100,
              ),
              CustomTextField(
                onchange: (data) {
                  productName = data;
                },
                hint: 'Product Name',
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                onchange: (data) {
                  desc = data;
                },
                hint: 'description',
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                onchange: (data) {
                  price = data;
                },
                hint: 'price',
                textType: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                onchange: (data) {
                  image = data;
                },
                hint: 'image',
              ),
              SizedBox(
                height: 50,
              ),
              CustomButon(
                text: 'Update',
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  try {
                    await updateProduct(product);
                    print('success');
                  } catch (e) {
                    print(e);
                  }
                  isLoading = false;
                  setState(() {});
                },
              )
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProduct().updateProduct(
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price : price!,
        description: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        id: product.id,
        category: product.category);
  }
}
