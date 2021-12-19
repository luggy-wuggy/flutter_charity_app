import 'package:charity/services/google_location_ac.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:uuid/uuid.dart';

class Onboard2Controller extends GetxController {
  final RxBool _textFieldTapped = false.obs;
  final RxList<Suggestion> _suggestions = <Suggestion>[].obs;
  late final String _sessionToken;
  late final PlaceApiProvider _apiClient;

  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late Place _placeDetails;

  bool get textFieldTapped => _textFieldTapped.value;
  List<Suggestion> get suggestions => _suggestions;
  String get sessionToken => _sessionToken;
  PlaceApiProvider get apiClient => _apiClient;
  TextEditingController get textController => _textController;
  FocusNode get focusNode => _focusNode;
  Place get placeDetails => _placeDetails;

  @override
  void onInit() {
    _sessionToken = const Uuid().v4();
    super.onInit();

    _apiClient = PlaceApiProvider(_sessionToken);

    _textController.addListener(() async {
      if (_textController.text.length > 1) {
        var response = await _apiClient.fetchSuggestions(_textController.text);
        _suggestions.value = response;
      } else {
        _suggestions.clear();
      }
    });

    _focusNode.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
    _focusNode.dispose();
  }

  void toggleIsTextFieldTapped(bool value) => _textFieldTapped(value);

  void setSuggestion(String description, String id) async {
    _textController.text = description;
    _textController.selection = TextSelection.collapsed(offset: _textController.text.length);
    _textFieldTapped.value = false;
    _focusNode.unfocus();

    _placeDetails = await _apiClient.getPlaceDetailFromId(id);
  }
}
