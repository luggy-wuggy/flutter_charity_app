import 'dart:convert';

import 'package:charity/constants/google_maps_api_strings.dart';
import 'package:charity/models/google_location.dart';
import 'package:http/http.dart';

class PlaceApiProvider {
  final client = Client();

  PlaceApiProvider(this.sessionToken);

  final sessionToken;

  final apiKey = GoogleAPIStrings.key;

  Future<List<Suggestion>> fetchSuggestions(String input) async {
    final stringRequest = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=geocode&components=country:us&key=$apiKey&sessiontoken=$sessionToken';

    final uriRequest = Uri.parse(stringRequest);
    final response = await client.get(uriRequest);

    try {
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        if (result['status'] == 'OK') {
          // compose suggestions in a list
          return result['predictions'].map<Suggestion>((p) => Suggestion(p['place_id'], p['description'])).toList();
        }
        if (result['status'] == 'ZERO_RESULTS') {
          return [];
        }
        throw Exception(result['error_message']);
      } else {
        throw Exception('Failed to fetch suggestion');
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<Place> getPlaceDetailFromId(String placeId) async {
    final stringRequest = 'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=address_component&key=$apiKey&sessiontoken=$sessionToken';
    final uriRequest = Uri.parse(stringRequest);
    final response = await client.get(uriRequest);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        final components = result['result']['address_components'] as List<dynamic>;
        // build result
        final place = Place();
        place.placeID = placeId;
        components.forEach((c) {
          final List type = c['types'];
          if (type.contains('street_number')) {
            place.streetNumber = c['long_name'];
          }
          if (type.contains('route')) {
            place.street = c['long_name'];
          }
          if (type.contains('locality')) {
            place.city = c['long_name'];
          }
          if (type.contains('postal_code')) {
            place.zipCode = c['long_name'];
          }
          if (type.contains('administrative_area_level_1')) {
            place.state = c['short_name'];
          }
        });
        return place;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}
