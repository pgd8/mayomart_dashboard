import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mayomart_dashboard/Data_Classes/product_data_class.dart';

class FirebaseFunctions {

  CollectionReference getProductsCollection() {
    return FirebaseFirestore.instance
        .collection("products")
        .withConverter<ProductDataClass>(
            fromFirestore: (snapshot, options) =>
                ProductDataClass.fromJson(snapshot.data()!),
            toFirestore: (product, options) => product.toJson());
  }

  void addUser() {}

  void getUser() {}

  void addProductToFireStore(ProductDataClass product) {
    var collection = getProductsCollection();
    var docRef = collection.doc();
    product.id = docRef.id;
    docRef.set(product);
  }

  void getProductFromFireStore(ProductDataClass product) {
    var collection = getProductsCollection();
    var docRef = collection.doc(product.id);
    docRef.get();

  }

  void addOrder() {}

  void getOrder() {}
}
