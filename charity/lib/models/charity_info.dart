// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Charity> charityFromJson(String str) => List<Charity>.from(json.decode(str).map((x) => Charity.fromJson(x)));

String charityToJson(List<Charity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Charity {
  Charity({
    this.charityNavigatorUrl,
    this.mission,
    this.websiteUrl,
    this.tagLine,
    this.charityName,
    this.ein,
    this.currentRating,
    this.category,
    this.cause,
    this.irsClassification,
    this.mailingAddress,
    this.donationAddress,
    this.advisories,
    this.organization,
  });

  String? charityNavigatorUrl;
  String? mission;
  String? websiteUrl;
  String? tagLine;
  String? charityName;
  String? ein;
  CurrentRating? currentRating;
  Category? category;
  Cause? cause;
  IrsClassification? irsClassification;
  Address? mailingAddress;
  Address? donationAddress;
  Advisories? advisories;
  Organization? organization;

  factory Charity.fromJson(Map<String, dynamic> json) => Charity(
        charityNavigatorUrl: json["charityNavigatorURL"],
        mission: json["mission"],
        websiteUrl: json["websiteURL"],
        tagLine: json["tagLine"],
        charityName: json["charityName"],
        ein: json["ein"],
        currentRating: CurrentRating.fromJson(json["currentRating"]),
        category: Category.fromJson(json["category"]),
        cause: Cause.fromJson(json["cause"]),
        irsClassification: IrsClassification.fromJson(json["irsClassification"]),
        mailingAddress: Address.fromJson(json["mailingAddress"]),
        donationAddress: json["donationAddress"] == null ? null : Address.fromJson(json["donationAddress"]),
        advisories: Advisories.fromJson(json["advisories"]),
        organization: Organization.fromJson(json["organization"]),
      );

  Map<String, dynamic> toJson() => {
        "charityNavigatorURL": charityNavigatorUrl,
        "mission": mission,
        "websiteURL": websiteUrl,
        "tagLine": tagLine,
        "charityName": charityName,
        "ein": ein,
        "currentRating": currentRating?.toJson(),
        "category": category?.toJson(),
        "cause": cause?.toJson(),
        "irsClassification": irsClassification?.toJson(),
        "mailingAddress": mailingAddress?.toJson(),
        "donationAddress": donationAddress == null ? null : donationAddress?.toJson(),
        "advisories": advisories?.toJson(),
        "organization": organization?.toJson(),
      };
}

class Advisories {
  Advisories({
    this.severity,
    this.active,
  });

  dynamic severity;
  Active? active;

  factory Advisories.fromJson(Map<String, dynamic> json) => Advisories(
        severity: json["severity"],
        active: Active.fromJson(json["active"]),
      );

  Map<String, dynamic> toJson() => {
        "severity": severity,
        "active": active?.toJson(),
      };
}

class Active {
  Active({
    this.rapidLinks,
  });

  RapidLinks? rapidLinks;

  factory Active.fromJson(Map<String, dynamic> json) => Active(
        rapidLinks: RapidLinks.fromJson(json["_rapid_links"]),
      );

  Map<String, dynamic> toJson() => {
        "_rapid_links": rapidLinks?.toJson(),
      };
}

class RapidLinks {
  RapidLinks({
    this.related,
  });

  Related? related;

  factory RapidLinks.fromJson(Map<String, dynamic> json) => RapidLinks(
        related: Related.fromJson(json["related"]),
      );

  Map<String, dynamic> toJson() => {
        "related": related?.toJson(),
      };
}

class Related {
  Related({
    this.href,
  });

  String? href;

  factory Related.fromJson(Map<String, dynamic> json) => Related(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Category {
  Category({
    this.categoryName,
    this.categoryId,
    this.charityNavigatorUrl,
    this.image,
  });

  String? categoryName;
  int? categoryId;
  String? charityNavigatorUrl;
  String? image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryName: json["categoryName"],
        categoryId: json["categoryID"],
        charityNavigatorUrl: json["charityNavigatorURL"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "categoryName": categoryName,
        "categoryID": categoryId,
        "charityNavigatorURL": charityNavigatorUrl,
        "image": image,
      };
}

class Cause {
  Cause({
    this.causeId,
    this.causeName,
    this.charityNavigatorUrl,
    this.image,
  });

  int? causeId;
  String? causeName;
  String? charityNavigatorUrl;
  String? image;

  factory Cause.fromJson(Map<String, dynamic> json) => Cause(
        causeId: json["causeID"],
        causeName: json["causeName"],
        charityNavigatorUrl: json["charityNavigatorURL"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "causeID": causeId,
        "causeName": causeName,
        "charityNavigatorURL": charityNavigatorUrl,
        "image": image,
      };
}

class CurrentRating {
  CurrentRating({
    this.score,
    this.ratingImage,
    this.rating,
    this.rapidLinks,
    this.financialRating,
    this.accountabilityRating,
  });

  double? score;
  RatingImage? ratingImage;
  int? rating;
  RapidLinks? rapidLinks;
  Rating? financialRating;
  Rating? accountabilityRating;

  factory CurrentRating.fromJson(Map<String, dynamic> json) => CurrentRating(
        score: json["score"].toDouble(),
        ratingImage: RatingImage.fromJson(json["ratingImage"]),
        rating: json["rating"],
        rapidLinks: RapidLinks.fromJson(json["_rapid_links"]),
        financialRating: Rating.fromJson(json["financialRating"]),
        accountabilityRating: Rating.fromJson(json["accountabilityRating"]),
      );

  Map<String, dynamic> toJson() => {
        "score": score,
        "ratingImage": ratingImage?.toJson(),
        "rating": rating,
        "_rapid_links": rapidLinks?.toJson(),
        "financialRating": financialRating?.toJson(),
        "accountabilityRating": accountabilityRating?.toJson(),
      };
}

class Rating {
  Rating({
    this.score,
    this.rating,
  });

  double? score;
  int? rating;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        score: json["score"].toDouble(),
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "score": score,
        "rating": rating,
      };
}

class RatingImage {
  RatingImage({
    this.small,
    this.large,
  });

  String? small;
  String? large;

  factory RatingImage.fromJson(Map<String, dynamic> json) => RatingImage(
        small: json["small"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "large": large,
      };
}

class Address {
  Address({
    this.country,
    this.stateOrProvince,
    this.city,
    this.postalCode,
    this.streetAddress1,
    this.streetAddress2,
  });

  dynamic country;
  String? stateOrProvince;
  String? city;
  String? postalCode;
  String? streetAddress1;
  String? streetAddress2;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        country: json["country"],
        stateOrProvince: json["stateOrProvince"],
        city: json["city"],
        postalCode: json["postalCode"],
        streetAddress1: json["streetAddress1"],
        streetAddress2: json["streetAddress2"] == null ? null : json["streetAddress2"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "stateOrProvince": stateOrProvince,
        "city": city,
        "postalCode": postalCode,
        "streetAddress1": streetAddress1,
        "streetAddress2": streetAddress2 == null ? null : streetAddress2,
      };
}

class IrsClassification {
  IrsClassification({
    this.deductibility,
    this.subsection,
    this.assetAmount,
    this.nteeType,
    this.incomeAmount,
    this.nteeSuffix,
    this.filingRequirement,
    this.classification,
    this.latest990,
    this.rulingDate,
    this.nteeCode,
    this.groupName,
    this.affiliation,
    this.deductibilityCode,
    this.foundationStatus,
    this.nteeClassification,
    this.accountingPeriod,
    this.exemptOrgStatus,
    this.deductibilityDetail,
    this.exemptOrgStatusCode,
    this.nteeLetter,
  });

  String? deductibility;
  String? subsection;
  int? assetAmount;
  String? nteeType;
  int? incomeAmount;
  String? nteeSuffix;
  String? filingRequirement;
  String? classification;
  String? latest990;
  String? rulingDate;
  String? nteeCode;
  dynamic groupName;
  String? affiliation;
  String? deductibilityCode;
  String? foundationStatus;
  String? nteeClassification;
  String? accountingPeriod;
  String? exemptOrgStatus;
  dynamic deductibilityDetail;
  String? exemptOrgStatusCode;
  String? nteeLetter;

  factory IrsClassification.fromJson(Map<String, dynamic> json) => IrsClassification(
        deductibility: json["deductibility"],
        subsection: json["subsection"],
        assetAmount: json["assetAmount"],
        nteeType: json["nteeType"] == null ? null : json["nteeType"],
        incomeAmount: json["incomeAmount"],
        nteeSuffix: json["nteeSuffix"],
        filingRequirement: json["filingRequirement"],
        classification: json["classification"],
        latest990: json["latest990"],
        rulingDate: json["rulingDate"],
        nteeCode: json["nteeCode"],
        groupName: json["groupName"],
        affiliation: json["affiliation"],
        deductibilityCode: json["deductibilityCode"],
        foundationStatus: json["foundationStatus"],
        nteeClassification: json["nteeClassification"] == null ? null : json["nteeClassification"],
        accountingPeriod: json["accountingPeriod"],
        exemptOrgStatus: json["exemptOrgStatus"],
        deductibilityDetail: json["deductibilityDetail"],
        exemptOrgStatusCode: json["exemptOrgStatusCode"],
        nteeLetter: json["nteeLetter"],
      );

  Map<String, dynamic> toJson() => {
        "deductibility": deductibility,
        "subsection": subsection,
        "assetAmount": assetAmount,
        "nteeType": nteeType == null ? null : nteeType,
        "incomeAmount": incomeAmount,
        "nteeSuffix": nteeSuffix,
        "filingRequirement": filingRequirement,
        "classification": classification,
        "latest990": latest990,
        "rulingDate": rulingDate,
        "nteeCode": nteeCode,
        "groupName": groupName,
        "affiliation": affiliation,
        "deductibilityCode": deductibilityCode,
        "foundationStatus": foundationStatus,
        "nteeClassification": nteeClassification == null ? null : nteeClassification,
        "accountingPeriod": accountingPeriod,
        "exemptOrgStatus": exemptOrgStatus,
        "deductibilityDetail": deductibilityDetail,
        "exemptOrgStatusCode": exemptOrgStatusCode,
        "nteeLetter": nteeLetter,
      };
}

class Organization {
  Organization({
    this.charityName,
    this.ein,
    this.charityNavigatorUrl,
    this.rapidLinks,
  });

  String? charityName;
  String? ein;
  String? charityNavigatorUrl;
  RapidLinks? rapidLinks;

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
        charityName: json["charityName"],
        ein: json["ein"],
        charityNavigatorUrl: json["charityNavigatorURL"],
        rapidLinks: RapidLinks.fromJson(json["_rapid_links"]),
      );

  Map<String, dynamic> toJson() => {
        "charityName": charityName,
        "ein": ein,
        "charityNavigatorURL": charityNavigatorUrl,
        "_rapid_links": rapidLinks?.toJson(),
      };
}
