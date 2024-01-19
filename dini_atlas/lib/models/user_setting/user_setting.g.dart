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
    r'jsonString': PropertySchema(
      id: 0,
      name: r'jsonString',
      type: IsarType.string,
    )
  },
  estimateSize: _userSettingEstimateSize,
  serialize: _userSettingSerialize,
  deserialize: _userSettingDeserialize,
  deserializeProp: _userSettingDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
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
  bytesCount += 3 + object.jsonString.length * 3;
  return bytesCount;
}

void _userSettingSerialize(
  UserSetting object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.jsonString);
}

UserSetting _userSettingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserSetting();
  object.id = id;
  object.jsonString = reader.readString(offsets[0]);
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
      return (reader.readString(offset)) as P;
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
}

extension UserSettingQueryObject
    on QueryBuilder<UserSetting, UserSetting, QFilterCondition> {}

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

  QueryBuilder<UserSetting, String, QQueryOperations> jsonStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jsonString');
    });
  }
}
