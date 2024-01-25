// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_setting.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserSettingCollection on Isar {
  IsarCollection<UserSetting> get userSettings => this.collection();
}

const UserSettingSchema = CollectionSchema(
  name: r'UserSetting',
  id: -4374868905468663165,
  properties: {
    r'appSettings': PropertySchema(
      id: 0,
      name: r'appSettings',
      type: IsarType.object,
      target: r'AppSettings',
    ),
    r'city': PropertySchema(
      id: 1,
      name: r'city',
      type: IsarType.object,
      target: r'City',
    ),
    r'country': PropertySchema(
      id: 2,
      name: r'country',
      type: IsarType.object,
      target: r'Country',
    ),
    r'jsonString': PropertySchema(
      id: 3,
      name: r'jsonString',
      type: IsarType.string,
    ),
    r'state': PropertySchema(
      id: 4,
      name: r'state',
      type: IsarType.object,
      target: r'StateModel',
    )
  },
  estimateSize: _userSettingEstimateSize,
  serialize: _userSettingSerialize,
  deserialize: _userSettingDeserialize,
  deserializeProp: _userSettingDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Country': CountrySchema,
    r'City': CitySchema,
    r'StateModel': StateModelSchema,
    r'AppSettings': AppSettingsSchema
  },
  getId: _userSettingGetId,
  getLinks: _userSettingGetLinks,
  attach: _userSettingAttach,
  version: '3.1.0+1',
);

int _userSettingEstimateSize(
  UserSetting object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      AppSettingsSchema.estimateSize(
          object.appSettings, allOffsets[AppSettings]!, allOffsets);
  {
    final value = object.city;
    if (value != null) {
      bytesCount +=
          3 + CitySchema.estimateSize(value, allOffsets[City]!, allOffsets);
    }
  }
  {
    final value = object.country;
    if (value != null) {
      bytesCount += 3 +
          CountrySchema.estimateSize(value, allOffsets[Country]!, allOffsets);
    }
  }
  bytesCount += 3 + object.jsonString.length * 3;
  {
    final value = object.state;
    if (value != null) {
      bytesCount += 3 +
          StateModelSchema.estimateSize(
              value, allOffsets[StateModel]!, allOffsets);
    }
  }
  return bytesCount;
}

void _userSettingSerialize(
  UserSetting object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<AppSettings>(
    offsets[0],
    allOffsets,
    AppSettingsSchema.serialize,
    object.appSettings,
  );
  writer.writeObject<City>(
    offsets[1],
    allOffsets,
    CitySchema.serialize,
    object.city,
  );
  writer.writeObject<Country>(
    offsets[2],
    allOffsets,
    CountrySchema.serialize,
    object.country,
  );
  writer.writeString(offsets[3], object.jsonString);
  writer.writeObject<StateModel>(
    offsets[4],
    allOffsets,
    StateModelSchema.serialize,
    object.state,
  );
}

UserSetting _userSettingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserSetting();
  object.appSettings = reader.readObjectOrNull<AppSettings>(
        offsets[0],
        AppSettingsSchema.deserialize,
        allOffsets,
      ) ??
      AppSettings();
  object.city = reader.readObjectOrNull<City>(
    offsets[1],
    CitySchema.deserialize,
    allOffsets,
  );
  object.country = reader.readObjectOrNull<Country>(
    offsets[2],
    CountrySchema.deserialize,
    allOffsets,
  );
  object.id = id;
  object.jsonString = reader.readString(offsets[3]);
  object.state = reader.readObjectOrNull<StateModel>(
    offsets[4],
    StateModelSchema.deserialize,
    allOffsets,
  );
  return object;
}

P _userSettingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<AppSettings>(
            offset,
            AppSettingsSchema.deserialize,
            allOffsets,
          ) ??
          AppSettings()) as P;
    case 1:
      return (reader.readObjectOrNull<City>(
        offset,
        CitySchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readObjectOrNull<Country>(
        offset,
        CountrySchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readObjectOrNull<StateModel>(
        offset,
        StateModelSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userSettingGetId(UserSetting object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userSettingGetLinks(UserSetting object) {
  return [];
}

void _userSettingAttach(
    IsarCollection<dynamic> col, Id id, UserSetting object) {
  object.id = id;
}

extension UserSettingQueryWhereSort
    on QueryBuilder<UserSetting, UserSetting, QWhere> {
  QueryBuilder<UserSetting, UserSetting, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserSettingQueryWhere
    on QueryBuilder<UserSetting, UserSetting, QWhereClause> {
  QueryBuilder<UserSetting, UserSetting, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserSettingQueryFilter
    on QueryBuilder<UserSetting, UserSetting, QFilterCondition> {
  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition> cityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'city',
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition>
      cityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'city',
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition>
      countryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'country',
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition>
      countryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'country',
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition>
      jsonStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jsonString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition>
      jsonStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jsonString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition>
      jsonStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jsonString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition>
      jsonStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jsonString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition>
      jsonStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jsonString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition>
      jsonStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jsonString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition>
      jsonStringContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jsonString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition>
      jsonStringMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jsonString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition>
      jsonStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jsonString',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition>
      jsonStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jsonString',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition> stateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'state',
      ));
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition>
      stateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'state',
      ));
    });
  }
}

extension UserSettingQueryObject
    on QueryBuilder<UserSetting, UserSetting, QFilterCondition> {
  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition> appSettings(
      FilterQuery<AppSettings> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'appSettings');
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition> city(
      FilterQuery<City> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'city');
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition> country(
      FilterQuery<Country> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'country');
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterFilterCondition> state(
      FilterQuery<StateModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'state');
    });
  }
}

extension UserSettingQueryLinks
    on QueryBuilder<UserSetting, UserSetting, QFilterCondition> {}

extension UserSettingQuerySortBy
    on QueryBuilder<UserSetting, UserSetting, QSortBy> {
  QueryBuilder<UserSetting, UserSetting, QAfterSortBy> sortByJsonString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonString', Sort.asc);
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterSortBy> sortByJsonStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonString', Sort.desc);
    });
  }
}

extension UserSettingQuerySortThenBy
    on QueryBuilder<UserSetting, UserSetting, QSortThenBy> {
  QueryBuilder<UserSetting, UserSetting, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterSortBy> thenByJsonString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonString', Sort.asc);
    });
  }

  QueryBuilder<UserSetting, UserSetting, QAfterSortBy> thenByJsonStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonString', Sort.desc);
    });
  }
}

extension UserSettingQueryWhereDistinct
    on QueryBuilder<UserSetting, UserSetting, QDistinct> {
  QueryBuilder<UserSetting, UserSetting, QDistinct> distinctByJsonString(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jsonString', caseSensitive: caseSensitive);
    });
  }
}

extension UserSettingQueryProperty
    on QueryBuilder<UserSetting, UserSetting, QQueryProperty> {
  QueryBuilder<UserSetting, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserSetting, AppSettings, QQueryOperations>
      appSettingsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appSettings');
    });
  }

  QueryBuilder<UserSetting, City?, QQueryOperations> cityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'city');
    });
  }

  QueryBuilder<UserSetting, Country?, QQueryOperations> countryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'country');
    });
  }

  QueryBuilder<UserSetting, String, QQueryOperations> jsonStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jsonString');
    });
  }

  QueryBuilder<UserSetting, StateModel?, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'state');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AppSettingsSchema = Schema(
  name: r'AppSettings',
  id: -5633561779022347008,
  properties: {
    r'advancedVoiceWarningTime': PropertySchema(
      id: 0,
      name: r'advancedVoiceWarningTime',
      type: IsarType.long,
    ),
    r'quranReciterId': PropertySchema(
      id: 1,
      name: r'quranReciterId',
      type: IsarType.long,
    ),
    r'silentModeEnable': PropertySchema(
      id: 2,
      name: r'silentModeEnable',
      type: IsarType.bool,
    ),
    r'voiceWarningEnable': PropertySchema(
      id: 3,
      name: r'voiceWarningEnable',
      type: IsarType.bool,
    ),
    r'warningSoundId': PropertySchema(
      id: 4,
      name: r'warningSoundId',
      type: IsarType.long,
    ),
    r'warningSoundsEnable': PropertySchema(
      id: 5,
      name: r'warningSoundsEnable',
      type: IsarType.bool,
    )
  },
  estimateSize: _appSettingsEstimateSize,
  serialize: _appSettingsSerialize,
  deserialize: _appSettingsDeserialize,
  deserializeProp: _appSettingsDeserializeProp,
);

int _appSettingsEstimateSize(
  AppSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _appSettingsSerialize(
  AppSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.advancedVoiceWarningTime);
  writer.writeLong(offsets[1], object.quranReciterId);
  writer.writeBool(offsets[2], object.silentModeEnable);
  writer.writeBool(offsets[3], object.voiceWarningEnable);
  writer.writeLong(offsets[4], object.warningSoundId);
  writer.writeBool(offsets[5], object.warningSoundsEnable);
}

AppSettings _appSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppSettings();
  object.advancedVoiceWarningTime = reader.readLong(offsets[0]);
  object.quranReciterId = reader.readLong(offsets[1]);
  object.silentModeEnable = reader.readBool(offsets[2]);
  object.voiceWarningEnable = reader.readBool(offsets[3]);
  object.warningSoundId = reader.readLong(offsets[4]);
  object.warningSoundsEnable = reader.readBool(offsets[5]);
  return object;
}

P _appSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AppSettingsQueryFilter
    on QueryBuilder<AppSettings, AppSettings, QFilterCondition> {
  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      advancedVoiceWarningTimeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'advancedVoiceWarningTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      advancedVoiceWarningTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'advancedVoiceWarningTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      advancedVoiceWarningTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'advancedVoiceWarningTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      advancedVoiceWarningTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'advancedVoiceWarningTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      quranReciterIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quranReciterId',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      quranReciterIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quranReciterId',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      quranReciterIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quranReciterId',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      quranReciterIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quranReciterId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      silentModeEnableEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'silentModeEnable',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      voiceWarningEnableEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voiceWarningEnable',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      warningSoundIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warningSoundId',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      warningSoundIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'warningSoundId',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      warningSoundIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'warningSoundId',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      warningSoundIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'warningSoundId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      warningSoundsEnableEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warningSoundsEnable',
        value: value,
      ));
    });
  }
}

extension AppSettingsQueryObject
    on QueryBuilder<AppSettings, AppSettings, QFilterCondition> {}
