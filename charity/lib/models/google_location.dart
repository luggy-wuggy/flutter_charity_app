class Place {
  String? placeID;
  String? streetNumber;
  String? street;
  String? city;
  String? state;
  String? zipCode;

  Place({
    this.streetNumber,
    this.street,
    this.city,
    this.state,
    this.zipCode,
  });

  @override
  String toString() {
    return 'Place(placeID: $placeID, streetNumber: $streetNumber, street: $street, city: $city, state: $state, zipCode: $zipCode)';
  }
}

class Suggestion {
  final String placeId;
  final String description;

  Suggestion(this.placeId, this.description);

  @override
  String toString() {
    return 'Suggestion(description: $description, placeId: $placeId)';
  }
}
