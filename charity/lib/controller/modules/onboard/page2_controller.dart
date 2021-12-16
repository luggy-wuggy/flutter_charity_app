import 'package:charity/services/google_location_ac.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:uuid/uuid.dart';

class Onboard2Controller extends GetxController {
  var textFieldTapped = false.obs;
  static var sessionToken = const Uuid().v4();
  var suggestions = <Suggestion>[].obs;
  late final PlaceApiProvider apiClient;

  TextEditingController textController = TextEditingController();
  FocusNode focusNode = FocusNode();
  late Place placeDetails;

  @override
  void onInit() {
    super.onInit();

    apiClient = PlaceApiProvider(sessionToken);

    textController.addListener(() async {
      if (textController.text.length > 1) {
        var response = await apiClient.fetchSuggestions(textController.text);
        suggestions.value = response;
      } else {
        suggestions.clear();
      }
    });

    focusNode.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
    focusNode.dispose();
  }

  void toggleIsTextFieldTapped() => textFieldTapped(!textFieldTapped.value);

  void setTextInput(String input) => textController.text = input;

  void setSuggestion(String description, String id) async {
    textController.text = description;
    textController.selection = TextSelection.collapsed(offset: textController.text.length);
    textFieldTapped.value = false;
    focusNode.unfocus();

    placeDetails = await apiClient.getPlaceDetailFromId(id);
    //print('${placesDetail.zipCode}');
  }
}
