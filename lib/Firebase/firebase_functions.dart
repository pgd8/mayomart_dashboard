import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mayomart_dashboard/Data_Classes/admin_data_class.dart';
import 'package:mayomart_dashboard/Data_Classes/offer_data_class.dart';
import 'package:mayomart_dashboard/Data_Classes/product_data_class.dart';
import 'package:mayomart_dashboard/Data_Classes/recommended_data_class.dart';
import 'package:mayomart_dashboard/Data_Classes/user_data_class.dart';

import '../Data_Classes/order_data_class.dart';

FirebaseFirestore instance = FirebaseFirestore.instance;
//getCollectionsFunctions
CollectionReference<ProductDataClass> getProductsCollection() {
  return instance.collection("products").withConverter<ProductDataClass>(
      fromFirestore: (snapshot, options) =>
          ProductDataClass.fromJson(snapshot.data()!),
      toFirestore: (product, options) => product.toJson());
}

CollectionReference<User> getUsersCollection() {
  return instance.collection("Users").withConverter(
        fromFirestore: (snapshot, options) => User.fromJson(snapshot.data()!),
        toFirestore: (user, options) => user.toJson(),
      );
}

CollectionReference<AdminDataClass> getAdminsCollection() {
  return instance.collection("Admins").withConverter(
        fromFirestore: (snapshot, options) =>
            AdminDataClass.formJson(snapshot.data()!),
        toFirestore: (admin, options) => admin.toJson(),
      );
}

CollectionReference<OrderDataClass> getOrdersCollection() {
  return instance.collection("Orders").withConverter(
        fromFirestore: (snapshot, options) =>
            OrderDataClass.fromJson(snapshot.data()!),
        toFirestore: (order, options) => order.toJson(),
      );
}

CollectionReference<RecommendedDataClass> getRecommendedCollection() {
  return instance.collection("Recommended").withConverter(
        fromFirestore: (snapshot, options) =>
            RecommendedDataClass.fromJson(snapshot.data()!),
        toFirestore: (recommended, options) => recommended.toJson(),
      );
}

CollectionReference<OfferDataClass> getOffersCollection() {
  return instance.collection("Offers").withConverter(
        fromFirestore: (snapshot, options) =>
            OfferDataClass.fromJson(snapshot.data()!),
        toFirestore: (offer, options) => offer.toJson(),
      );
}

CollectionReference<OrderDataClass> getHistoryCollection() {
  return instance.collection("ordersHistory").withConverter(
        fromFirestore: (snapshot, options) =>
            OrderDataClass.fromJson(snapshot.data()!),
        toFirestore: (order, options) => order.toJson(),
      );
}

//addToFireStore
Future<void> addProductToFireStore(ProductDataClass product) {
  var collection = getProductsCollection();
  var docRef = collection.doc();
  product.id = docRef.id;
  return docRef.set(product);
}

Future<void> addUserToFireStore(User user) {
  var collection = getUsersCollection();
  var docRef = collection.doc();
  user.id = docRef.id;
  return docRef.set(user);
}

Future<void> addAdmin(AdminDataClass admin){
  var collection = getAdminsCollection();
  var docRef = collection.doc();
  admin.id = docRef.id;
  return docRef.set(admin);
}

Future<void> addRecommended(RecommendedDataClass recommended) {
  var collection = getRecommendedCollection();
  var docRef = collection.doc();
  recommended.id = docRef.id;
  return docRef.set(recommended);
}

Future<void> addToOrdersHistory(OrderDataClass order) {
  var collection = getHistoryCollection();
  var docRef = collection.doc();
  order.id = docRef.id;
  return docRef.set(order);
}

Future<void> addOffer(OfferDataClass offer) {
  var collection = getOffersCollection();
  var docRef = collection.doc();
  offer.id = docRef.id;
  return docRef.set(offer);
}

//getFromFireStore
Future<QuerySnapshot<ProductDataClass>> getProductFromFireStore() {
  return getProductsCollection().get();
}

Future<QuerySnapshot<User>> getUser() {
  return getUsersCollection().get();
}

Future<QuerySnapshot<OrderDataClass>> getOrder() {
  return getOrdersCollection().get();
}

Future<QuerySnapshot<RecommendedDataClass>> getRecommended() {
  return getRecommendedCollection().get();
}

Future<QuerySnapshot<OfferDataClass>> getOffers() {
  return getOffersCollection().get();
}

Future<QuerySnapshot<OrderDataClass>> getOrderHistory() {
  return getHistoryCollection().get();
}

//Update
Future<void> updateProduct(String oldProductId, ProductDataClass product) {
  var collection = getProductsCollection();
  var docRef = collection.doc(oldProductId);
  product.id = oldProductId;
  return docRef.set(product);
}

Future<void> updateUser(String id, User user) {
  var collection = getUsersCollection();
  var docRef = collection.doc(id);
  return docRef.set(user);
}

Future<void> updateRecommended(String id, RecommendedDataClass recommended) {
  var collection = getRecommendedCollection();
  var docRef = collection.doc(id);
  recommended.id = id;
  return docRef.set(recommended);
}

Future<void> updateOffer(String id, OfferDataClass offer) {
  var collection = getOffersCollection();
  var docRef = collection.doc(id);
  offer.id = id;
  return docRef.set(offer);
}

//deleteFromFireStore
Future<void> deleteUser(User user) {
  var collection = getUsersCollection();
  var docRef = collection.doc(user.id);
  return docRef.delete();
}

Future<void> deleteProduct(ProductDataClass product) {
  var collection = getProductsCollection();
  var docRef = collection.doc(product.id);
  return docRef.delete();
}

Future<void> deleteOrder(OrderDataClass order) {
  var collection = getOrdersCollection();
  var docRef = collection.doc(order.id);
  return docRef.delete();
}
