import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mayomart_dashboard/Data_Classes/product_data_class.dart';

class FirebaseFunctions {
  CollectionReference<ProductDataClass> getProductsCollection() {
    return FirebaseFirestore.instance
        .collection("products")
        .withConverter<ProductDataClass>(
            fromFirestore: (snapshot, options) =>
                ProductDataClass.fromJson(snapshot.data()!),
            toFirestore: (product, options) => product.toJson());
  }

  void addUser() {}

  void getUser() {}

  Future<void> addProductToFireStore(ProductDataClass product) {
    var collection = getProductsCollection();
    var docRef = collection.doc();
    product.id = docRef.id;
    return docRef.set(product);
  }

  Future<void> updateProduct(
      String oldProductId, ProductDataClass product) {
    var collection = getProductsCollection();
    var docRef = collection.doc(oldProductId);
    product.id = oldProductId;
    return docRef.set(product);
  }

  Future<QuerySnapshot<ProductDataClass>> getProductFromFireStore() {
    return getProductsCollection().get();
  }

  void deleteProduct(ProductDataClass product) {
    var collection = getProductsCollection();
    var docRef = collection.doc(product.id);
    docRef.delete();
  }

  void addOrder() {}

  void getOrder() {}
}
