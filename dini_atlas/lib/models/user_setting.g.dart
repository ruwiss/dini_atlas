// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_setting.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserSettingsCollection on Isar {
  IsarCollection<UserSettings> get userSettings => this.collection();
}

const UserSettingsSchema = CollectionSchema(
  name: r'UserSettings',
  id: 4939698790990493221,
  properties: {
    r'city': PropertySchema(
      id: 0,
      name: r'city',
      type: IsarType.object,
      target: r'City',
    ),
    r'country': PropertySchema(
      id: 1,
      name: r'country',
      type: IsarType.object,
      target: r'Country',
    ),
    r'increaseAyahFontSize': PropertySchema(
      id: 2,
      name: r'increaseAyahFontSize',
      type: IsarType.long,
    ),
    r'jsonString': PropertySchema(
      id: 3,
      name: r'jsonString',
      type: IsarType.string,
    ),
    r'quranReciterId': PropertySchema(
      id: 4,
      name: r'quranReciterId',
      type: IsarType.long,
    ),
    r'silentModeEnable': PropertySchema(
      id: 5,
      name: r'silentModeEnable',
      type: IsarType.bool,
    ),
    r'state': PropertySchema(
      id: 6,
      name: r'state',
      type: IsarType.object,
      target: r'StateModel',
    ),
    r'suraSetting': PropertySchema(
      id: 7,
      name: r'suraSetting',
      type: IsarType.object,
      target: r'SuraSetting',
    )
  },
  estimateSize: _userSettingsEstimateSize,
  serialize: _userSettingsSerialize,
  deserialize: _userSettingsDeserialize,
  deserializeProp: _userSettingsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Country': CountrySchema,
    r'City': CitySchema,
    r'StateModel': StateModelSchema,
    r'SuraSetting': SuraSettingSchema
  },
  getId: _userSettingsGetId,
  getLinks: _userSettingsGetLinks,
  attach: _userSettingsAttach,
  version: '3.1.0+1',
);

int _userSettingsEstimateSize(
  UserSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
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
  bytesCount += 3 +
      SuraSettingSchema.estimateSize(
          object.suraSetting, allOffsets[SuraSetting]!, allOffsets);
  return bytesCount;
}

void _userSettingsSerialize(
  UserSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<City>(
    offsets[0],
    allOffsets,
    CitySchema.serialize,
    object.city,
  );
  writer.writeObject<Country>(
    offsets[1],
    allOffsets,
    CountrySchema.serialize,
    object.country,
  );
  writer.writeLong(offsets[2], object.increaseAyahFontSize);
  writer.writeString(offsets[3], object.jsonString);
  writer.writeLong(offsets[4], object.quranReciterId);
  writer.writeBool(offsets[5], object.silentModeEnable);
  writer.writeObject<StateModel>(
    offsets[6],
    allOffsets,
    StateModelSchema.serialize,
    object.state,
  );
  writer.writeObject<SuraSetting>(
    offsets[7],
    allOffsets,
    SuraSettingSchema.serialize,
    object.suraSetting,
  );
}

UserSettings _userSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserSettings();
  object.city = reader.readObjectOrNull<City>(
    offsets[0],
    CitySchema.deserialize,
    allOffsets,
  );
  object.country = reader.readObjectOrNull<Country>(
    offsets[1],
    CountrySchema.deserialize,
    allOffsets,
  );
  object.id = id;
  object.increaseAyahFontSize = reader.readLong(offsets[2]);
  object.jsonString = reader.readString(offsets[3]);
  object.quranReciterId = reader.readLong(offsets[4]);
  object.silentModeEnable = reader.readBool(offsets[5]);
  object.state = reader.readObjectOrNull<StateModel>(
    offsets[6],
    StateModelSchema.deserialize,
    allOffsets,
  );
  object.suraSetting = reader.readObjectOrNull<SuraSetting>(
        offsets[7],
        SuraSettingSchema.deserialize,
        allOffsets,
      ) ??
      SuraSetting();
  return object;
}

P _userSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<City>(
        offset,
        CitySchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectOrNull<Country>(
        offset,
        CountrySchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readObjectOrNull<StateModel>(
        offset,
        StateModelSchema.deserialize,
        allOffsets,
      )) as P;
    case 7:
      return (reader.readObjectOrNull<SuraSetting>(
            offset,
            SuraSettingSchema.deserialize,
            allOffsets,
          ) ??
          SuraSetting()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userSettingsGetId(UserSettings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userSettingsGetLinks(UserSettings object) {
  return [];
}

void _userSettingsAttach(
    IsarCollection<dynamic> col, Id id, UserSettings object) {
  object.id = id;
}

extension UserSettingsQueryWhereSort
    on QueryBuilder<UserSettings, UserSettings, QWhere> {
  QueryBuilder<UserSettings, UserSettings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserSettingsQueryWhere
    on QueryBuilder<UserSettings, UserSettings, QWhereClause> {
  QueryBuilder<UserSettings, UserSettings, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<UserSettings, UserSettings, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterWhereClause> idBetween(
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

extension UserSettingsQueryFilter
    on QueryBuilder<UserSettings, UserSettings, QFilterCondition> {
  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition> cityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'city',
      ));
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
      cityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'city',
      ));
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
      countryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'country',
      ));
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
      countryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'country',
      ));
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
      increaseAyahFontSizeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'increaseAyahFontSize',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
      increaseAyahFontSizeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'increaseAyahFontSize',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
      increaseAyahFontSizeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'increaseAyahFontSize',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
      increaseAyahFontSizeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'increaseAyahFontSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
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

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
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

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
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

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
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

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
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

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
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

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
      jsonStringContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jsonString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
      jsonStringMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jsonString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
      jsonStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jsonString',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
      jsonStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jsonString',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
      quranReciterIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quranReciterId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
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

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
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

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
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

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
      silentModeEnableEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'silentModeEnable',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
      stateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'state',
      ));
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition>
      stateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'state',
      ));
    });
  }
}

extension UserSettingsQueryObject
    on QueryBuilder<UserSettings, UserSettings, QFilterCondition> {
  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition> city(
      FilterQuery<City> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'city');
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition> country(
      FilterQuery<Country> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'country');
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition> state(
      FilterQuery<StateModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'state');
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterFilterCondition> suraSetting(
      FilterQuery<SuraSetting> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'suraSetting');
    });
  }
}

extension UserSettingsQueryLinks
    on QueryBuilder<UserSettings, UserSettings, QFilterCondition> {}

extension UserSettingsQuerySortBy
    on QueryBuilder<UserSettings, UserSettings, QSortBy> {
  QueryBuilder<UserSettings, UserSettings, QAfterSortBy>
      sortByIncreaseAyahFontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'increaseAyahFontSize', Sort.asc);
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterSortBy>
      sortByIncreaseAyahFontSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'increaseAyahFontSize', Sort.desc);
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterSortBy> sortByJsonString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonString', Sort.asc);
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterSortBy>
      sortByJsonStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonString', Sort.desc);
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterSortBy>
      sortByQuranReciterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quranReciterId', Sort.asc);
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterSortBy>
      sortByQuranReciterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quranReciterId', Sort.desc);
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterSortBy>
      sortBySilentModeEnable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'silentModeEnable', Sort.asc);
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterSortBy>
      sortBySilentModeEnableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'silentModeEnable', Sort.desc);
    });
  }
}

extension UserSettingsQuerySortThenBy
    on QueryBuilder<UserSettings, UserSettings, QSortThenBy> {
  QueryBuilder<UserSettings, UserSettings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterSortBy>
      thenByIncreaseAyahFontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'increaseAyahFontSize', Sort.asc);
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterSortBy>
      thenByIncreaseAyahFontSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'increaseAyahFontSize', Sort.desc);
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterSortBy> thenByJsonString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonString', Sort.asc);
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterSortBy>
      thenByJsonStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonString', Sort.desc);
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterSortBy>
      thenByQuranReciterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quranReciterId', Sort.asc);
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterSortBy>
      thenByQuranReciterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quranReciterId', Sort.desc);
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterSortBy>
      thenBySilentModeEnable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'silentModeEnable', Sort.asc);
    });
  }

  QueryBuilder<UserSettings, UserSettings, QAfterSortBy>
      thenBySilentModeEnableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'silentModeEnable', Sort.desc);
    });
  }
}

extension UserSettingsQueryWhereDistinct
    on QueryBuilder<UserSettings, UserSettings, QDistinct> {
  QueryBuilder<UserSettings, UserSettings, QDistinct>
      distinctByIncreaseAyahFontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'increaseAyahFontSize');
    });
  }

  QueryBuilder<UserSettings, UserSettings, QDistinct> distinctByJsonString(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jsonString', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSettings, UserSettings, QDistinct>
      distinctByQuranReciterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quranReciterId');
    });
  }

  QueryBuilder<UserSettings, UserSettings, QDistinct>
      distinctBySilentModeEnable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'silentModeEnable');
    });
  }
}

extension UserSettingsQueryProperty
    on QueryBuilder<UserSettings, UserSettings, QQueryProperty> {
  QueryBuilder<UserSettings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserSettings, City?, QQueryOperations> cityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'city');
    });
  }

  QueryBuilder<UserSettings, Country?, QQueryOperations> countryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'country');
    });
  }

  QueryBuilder<UserSettings, int, QQueryOperations>
      increaseAyahFontSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'increaseAyahFontSize');
    });
  }

  QueryBuilder<UserSettings, String, QQueryOperations> jsonStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jsonString');
    });
  }

  QueryBuilder<UserSettings, int, QQueryOperations> quranReciterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quranReciterId');
    });
  }

  QueryBuilder<UserSettings, bool, QQueryOperations>
      silentModeEnableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'silentModeEnable');
    });
  }

  QueryBuilder<UserSettings, StateModel?, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'state');
    });
  }

  QueryBuilder<UserSettings, SuraSetting, QQueryOperations>
      suraSettingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'suraSetting');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPrayerNotiSettingsCollection on Isar {
  IsarCollection<PrayerNotiSettings> get prayerNotiSettings =>
      this.collection();
}

const PrayerNotiSettingsSchema = CollectionSchema(
  name: r'PrayerNotiSettings',
  id: -8528832202568053042,
  properties: {
    r'advancedVoiceWarningTime': PropertySchema(
      id: 0,
      name: r'advancedVoiceWarningTime',
      type: IsarType.long,
    ),
    r'advancedWarningSoundsEnable': PropertySchema(
      id: 1,
      name: r'advancedWarningSoundsEnable',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
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
    )
  },
  estimateSize: _prayerNotiSettingsEstimateSize,
  serialize: _prayerNotiSettingsSerialize,
  deserialize: _prayerNotiSettingsDeserialize,
  deserializeProp: _prayerNotiSettingsDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _prayerNotiSettingsGetId,
  getLinks: _prayerNotiSettingsGetLinks,
  attach: _prayerNotiSettingsAttach,
  version: '3.1.0+1',
);

int _prayerNotiSettingsEstimateSize(
  PrayerNotiSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _prayerNotiSettingsSerialize(
  PrayerNotiSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.advancedVoiceWarningTime);
  writer.writeBool(offsets[1], object.advancedWarningSoundsEnable);
  writer.writeString(offsets[2], object.name);
  writer.writeBool(offsets[3], object.voiceWarningEnable);
  writer.writeLong(offsets[4], object.warningSoundId);
}

PrayerNotiSettings _prayerNotiSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PrayerNotiSettings();
  object.advancedVoiceWarningTime = reader.readLong(offsets[0]);
  object.advancedWarningSoundsEnable = reader.readBool(offsets[1]);
  object.id = id;
  object.name = reader.readString(offsets[2]);
  object.voiceWarningEnable = reader.readBool(offsets[3]);
  object.warningSoundId = reader.readLong(offsets[4]);
  return object;
}

P _prayerNotiSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _prayerNotiSettingsGetId(PrayerNotiSettings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _prayerNotiSettingsGetLinks(
    PrayerNotiSettings object) {
  return [];
}

void _prayerNotiSettingsAttach(
    IsarCollection<dynamic> col, Id id, PrayerNotiSettings object) {
  object.id = id;
}

extension PrayerNotiSettingsByIndex on IsarCollection<PrayerNotiSettings> {
  Future<PrayerNotiSettings?> getByName(String name) {
    return getByIndex(r'name', [name]);
  }

  PrayerNotiSettings? getByNameSync(String name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<PrayerNotiSettings?>> getAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<PrayerNotiSettings?> getAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'name', values);
  }

  Future<int> deleteAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'name', values);
  }

  int deleteAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'name', values);
  }

  Future<Id> putByName(PrayerNotiSettings object) {
    return putByIndex(r'name', object);
  }

  Id putByNameSync(PrayerNotiSettings object, {bool saveLinks = true}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByName(List<PrayerNotiSettings> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<Id> putAllByNameSync(List<PrayerNotiSettings> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }
}

extension PrayerNotiSettingsQueryWhereSort
    on QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QWhere> {
  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PrayerNotiSettingsQueryWhere
    on QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QWhereClause> {
  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterWhereClause>
      nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterWhereClause>
      nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PrayerNotiSettingsQueryFilter
    on QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QFilterCondition> {
  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
      advancedVoiceWarningTimeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'advancedVoiceWarningTime',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
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

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
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

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
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

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
      advancedWarningSoundsEnableEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'advancedWarningSoundsEnable',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
      voiceWarningEnableEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voiceWarningEnable',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
      warningSoundIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warningSoundId',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
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

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
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

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterFilterCondition>
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
}

extension PrayerNotiSettingsQueryObject
    on QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QFilterCondition> {}

extension PrayerNotiSettingsQueryLinks
    on QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QFilterCondition> {}

extension PrayerNotiSettingsQuerySortBy
    on QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QSortBy> {
  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      sortByAdvancedVoiceWarningTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advancedVoiceWarningTime', Sort.asc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      sortByAdvancedVoiceWarningTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advancedVoiceWarningTime', Sort.desc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      sortByAdvancedWarningSoundsEnable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advancedWarningSoundsEnable', Sort.asc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      sortByAdvancedWarningSoundsEnableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advancedWarningSoundsEnable', Sort.desc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      sortByVoiceWarningEnable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceWarningEnable', Sort.asc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      sortByVoiceWarningEnableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceWarningEnable', Sort.desc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      sortByWarningSoundId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warningSoundId', Sort.asc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      sortByWarningSoundIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warningSoundId', Sort.desc);
    });
  }
}

extension PrayerNotiSettingsQuerySortThenBy
    on QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QSortThenBy> {
  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      thenByAdvancedVoiceWarningTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advancedVoiceWarningTime', Sort.asc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      thenByAdvancedVoiceWarningTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advancedVoiceWarningTime', Sort.desc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      thenByAdvancedWarningSoundsEnable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advancedWarningSoundsEnable', Sort.asc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      thenByAdvancedWarningSoundsEnableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advancedWarningSoundsEnable', Sort.desc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      thenByVoiceWarningEnable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceWarningEnable', Sort.asc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      thenByVoiceWarningEnableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceWarningEnable', Sort.desc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      thenByWarningSoundId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warningSoundId', Sort.asc);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QAfterSortBy>
      thenByWarningSoundIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warningSoundId', Sort.desc);
    });
  }
}

extension PrayerNotiSettingsQueryWhereDistinct
    on QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QDistinct> {
  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QDistinct>
      distinctByAdvancedVoiceWarningTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'advancedVoiceWarningTime');
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QDistinct>
      distinctByAdvancedWarningSoundsEnable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'advancedWarningSoundsEnable');
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QDistinct>
      distinctByVoiceWarningEnable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voiceWarningEnable');
    });
  }

  QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QDistinct>
      distinctByWarningSoundId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warningSoundId');
    });
  }
}

extension PrayerNotiSettingsQueryProperty
    on QueryBuilder<PrayerNotiSettings, PrayerNotiSettings, QQueryProperty> {
  QueryBuilder<PrayerNotiSettings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PrayerNotiSettings, int, QQueryOperations>
      advancedVoiceWarningTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'advancedVoiceWarningTime');
    });
  }

  QueryBuilder<PrayerNotiSettings, bool, QQueryOperations>
      advancedWarningSoundsEnableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'advancedWarningSoundsEnable');
    });
  }

  QueryBuilder<PrayerNotiSettings, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<PrayerNotiSettings, bool, QQueryOperations>
      voiceWarningEnableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voiceWarningEnable');
    });
  }

  QueryBuilder<PrayerNotiSettings, int, QQueryOperations>
      warningSoundIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warningSoundId');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SuraSettingSchema = Schema(
  name: r'SuraSetting',
  id: 8751151855999966090,
  properties: {
    r'playerAutoChange': PropertySchema(
      id: 0,
      name: r'playerAutoChange',
      type: IsarType.bool,
    ),
    r'showArabicText': PropertySchema(
      id: 1,
      name: r'showArabicText',
      type: IsarType.bool,
    ),
    r'showMeaningText': PropertySchema(
      id: 2,
      name: r'showMeaningText',
      type: IsarType.bool,
    ),
    r'showTurkishText': PropertySchema(
      id: 3,
      name: r'showTurkishText',
      type: IsarType.bool,
    )
  },
  estimateSize: _suraSettingEstimateSize,
  serialize: _suraSettingSerialize,
  deserialize: _suraSettingDeserialize,
  deserializeProp: _suraSettingDeserializeProp,
);

int _suraSettingEstimateSize(
  SuraSetting object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _suraSettingSerialize(
  SuraSetting object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.playerAutoChange);
  writer.writeBool(offsets[1], object.showArabicText);
  writer.writeBool(offsets[2], object.showMeaningText);
  writer.writeBool(offsets[3], object.showTurkishText);
}

SuraSetting _suraSettingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SuraSetting();
  object.playerAutoChange = reader.readBool(offsets[0]);
  object.showArabicText = reader.readBool(offsets[1]);
  object.showMeaningText = reader.readBool(offsets[2]);
  object.showTurkishText = reader.readBool(offsets[3]);
  return object;
}

P _suraSettingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SuraSettingQueryFilter
    on QueryBuilder<SuraSetting, SuraSetting, QFilterCondition> {
  QueryBuilder<SuraSetting, SuraSetting, QAfterFilterCondition>
      playerAutoChangeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playerAutoChange',
        value: value,
      ));
    });
  }

  QueryBuilder<SuraSetting, SuraSetting, QAfterFilterCondition>
      showArabicTextEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showArabicText',
        value: value,
      ));
    });
  }

  QueryBuilder<SuraSetting, SuraSetting, QAfterFilterCondition>
      showMeaningTextEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showMeaningText',
        value: value,
      ));
    });
  }

  QueryBuilder<SuraSetting, SuraSetting, QAfterFilterCondition>
      showTurkishTextEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showTurkishText',
        value: value,
      ));
    });
  }
}

extension SuraSettingQueryObject
    on QueryBuilder<SuraSetting, SuraSetting, QFilterCondition> {}
