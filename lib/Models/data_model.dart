class DataModel {
  String name;
  String governorate;
  String museumType;
  String address;
  String phone;
  String fax;
  String isAvailableToVisit;
  String visitDates;
  String ticketPrices;
  Location location;
  String image;
  String description;

  DataModel(
      {this.name,
      this.governorate,
      this.museumType,
      this.address,
      this.phone,
      this.fax,
      this.isAvailableToVisit,
      this.visitDates,
      this.ticketPrices,
      this.location,
      this.image,
      this.description});

  DataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    governorate = json['governorate'];
    museumType = json['museum_type'];
    address = json['address'];
    phone = json['phone'];
    fax = json['fax'];
    isAvailableToVisit = json['is_available_to_visit'];
    visitDates = json['visit_dates'];
    ticketPrices = json['ticket_prices'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    image = json['image'];
    description = json['description'];
  }

}

class Location {
  double lat;
  double long;

  Location({this.lat, this.long});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }

  
}
