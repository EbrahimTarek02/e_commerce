import 'package:e_commerce/data/model/products_response/products_response.dart';

class BrandsResponseDm {
  BrandsResponseDm({
      this.results, 
      this.metadata, 
      this.brands,});

  BrandsResponseDm.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      brands = [];
      json['data'].forEach((v) {
        brands?.add(Brand.fromJson(v));
      });
    }
  }
  int? results;
  Metadata? metadata;
  List<Brand>? brands;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (brands != null) {
      map['data'] = brands?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Metadata {
  Metadata({
      this.currentPage, 
      this.numberOfPages, 
      this.limit, 
      this.nextPage,});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    map['nextPage'] = nextPage;
    return map;
  }

}