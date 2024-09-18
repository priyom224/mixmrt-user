class ParcelCategoryModel {
  int? id;
  String? imageFullUrl;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;
  double? parcelPerKmShippingCharge;
  double? parcelMinimumShippingCharge;
  double? parcelPerKgCharge;

  ParcelCategoryModel({
    this.id,
    this.imageFullUrl,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.parcelPerKmShippingCharge,
    this.parcelMinimumShippingCharge,
    this.parcelPerKgCharge,
  });

  ParcelCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageFullUrl = json['image_full_url'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    parcelPerKmShippingCharge = json['parcel_per_km_shipping_charge'] != null ? json['parcel_per_km_shipping_charge'].toDouble() : 0;
    parcelMinimumShippingCharge = json['parcel_minimum_shipping_charge'] != null ? json['parcel_minimum_shipping_charge'].toDouble() : 0;
    parcelPerKgCharge = json['parcel_per_kg_charge']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_full_url'] = imageFullUrl;
    data['name'] = name;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['parcel_per_km_shipping_charge'] = parcelPerKmShippingCharge;
    data['parcel_minimum_shipping_charge'] = parcelMinimumShippingCharge;
    data['parcel_per_kg_charge'] = parcelPerKgCharge;
    return data;
  }
}
