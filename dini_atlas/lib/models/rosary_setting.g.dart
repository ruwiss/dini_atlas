// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rosary_setting.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRosarySettingCollection on Isar {
  IsarCollection<RosarySetting> get rosarySettings => this.collection();
}

const RosarySettingSchema = CollectionSchema(
  name: r'RosarySetting',
  id: -8515556031734337932,
  properties: {
    r'count': PropertySchema(
      id: 0,
      name: r'count',
      type: IsarType.long,
    ),
    r'darkMode': PropertySchema(
      id: 1,
      name: r'darkMode',
      type: IsarType.bool,
    ),
    r'limit': PropertySchema(
      id: 2,
      name: r'limit',
      type: IsarType.long,
    ),
    r'setCount': PropertySchema(
      id: 3,
      name: r'setCount',
      type: IsarType.long,
    ),
    r'sound': PropertySchema(
      id: 4,
      name: r'sound',
      type: IsarType.bool,
    ),
    r'vibrate': PropertySchema(
      id: 5,
      name: r'vibrate',
      type: IsarType.bool,
    )
  },
  estimateSize: _rosarySettingEstimateSize,
  serialize: _rosarySettingSerialize,
  deserialize: _rosarySettingDeserialize,
  deserializeProp: _rosarySettingDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _rosarySettingGetId,
  getLinks: _rosarySettingGetLinks,
  attach: _rosarySettingAttach,
  version: '3.1.0+1',
);

int _rosarySettingEstimateSize(
  RosarySetting object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _rosarySettingSerialize(
  RosarySetting object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.count);
  writer.writeBool(offsets[1], object.darkMode);
  writer.writeLong(offsets[2], object.limit);
  writer.writeLong(offsets[3], object.setCount);
  writer.writeBool(offsets[4], object.sound);
  writer.writeBool(offsets[5], object.vibrate);
}

RosarySetting _rosarySettingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RosarySetting();
  object.count = reader.readLong(offsets[0]);
  object.darkMode = reader.readBool(offsets[1]);
  object.id = id;
  object.limit = reader.readLong(offsets[2]);
  object.setCount = reader.readLong(offsets[3]);
  object.sound = reader.readBool(offsets[4]);
  object.vibrate = reader.readBool(offsets[5]);
  return object;
}

P _rosarySettingDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _rosarySettingGetId(RosarySetting object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rosarySettingGetLinks(RosarySetting object) {
  return [];
}

void _rosarySettingAttach(
    IsarCollection<dynamic> col, Id id, RosarySetting object) {
  object.id = id;
}

extension RosarySettingQueryWhereSort
    on QueryBuilder<RosarySetting, RosarySetting, QWhere> {
  QueryBuilder<RosarySetting, RosarySetting, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RosarySettingQueryWhere
    on QueryBuilder<RosarySetting, RosarySetting, QWhereClause> {
  QueryBuilder<RosarySetting, RosarySetting, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<RosarySetting, RosarySetting, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterWhereClause> idBetween(
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

extension RosarySettingQueryFilter
    on QueryBuilder<RosarySetting, RosarySetting, QFilterCondition> {
  QueryBuilder<RosarySetting, RosarySetting, QAfterFilterCondition>
      countEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'count',
        value: value,
      ));
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterFilterCondition>
      countGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'count',
        value: value,
      ));
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterFilterCondition>
      countLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'count',
        value: value,
      ));
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterFilterCondition>
      countBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'count',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterFilterCondition>
      darkModeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'darkMode',
        value: value,
      ));
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterFilterCondition>
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

  QueryBuilder<RosarySetting, RosarySetting, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RosarySetting, RosarySetting, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RosarySetting, RosarySetting, QAfterFilterCondition>
      limitEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'limit',
        value: value,
      ));
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterFilterCondition>
      limitGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'limit',
        value: value,
      ));
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterFilterCondition>
      limitLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'limit',
        value: value,
      ));
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterFilterCondition>
      limitBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'limit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterFilterCondition>
      setCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'setCount',
        value: value,
      ));
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterFilterCondition>
      setCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'setCount',
        value: value,
      ));
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterFilterCondition>
      setCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'setCount',
        value: value,
      ));
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterFilterCondition>
      setCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'setCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterFilterCondition>
      soundEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sound',
        value: value,
      ));
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterFilterCondition>
      vibrateEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vibrate',
        value: value,
      ));
    });
  }
}

extension RosarySettingQueryObject
    on QueryBuilder<RosarySetting, RosarySetting, QFilterCondition> {}

extension RosarySettingQueryLinks
    on QueryBuilder<RosarySetting, RosarySetting, QFilterCondition> {}

extension RosarySettingQuerySortBy
    on QueryBuilder<RosarySetting, RosarySetting, QSortBy> {
  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> sortByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.asc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> sortByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.desc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> sortByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.asc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy>
      sortByDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.desc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> sortByLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limit', Sort.asc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> sortByLimitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limit', Sort.desc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> sortBySetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'setCount', Sort.asc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy>
      sortBySetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'setCount', Sort.desc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> sortBySound() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sound', Sort.asc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> sortBySoundDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sound', Sort.desc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> sortByVibrate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrate', Sort.asc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> sortByVibrateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrate', Sort.desc);
    });
  }
}

extension RosarySettingQuerySortThenBy
    on QueryBuilder<RosarySetting, RosarySetting, QSortThenBy> {
  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> thenByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.asc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> thenByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.desc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> thenByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.asc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy>
      thenByDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.desc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> thenByLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limit', Sort.asc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> thenByLimitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limit', Sort.desc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> thenBySetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'setCount', Sort.asc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy>
      thenBySetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'setCount', Sort.desc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> thenBySound() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sound', Sort.asc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> thenBySoundDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sound', Sort.desc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> thenByVibrate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrate', Sort.asc);
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QAfterSortBy> thenByVibrateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrate', Sort.desc);
    });
  }
}

extension RosarySettingQueryWhereDistinct
    on QueryBuilder<RosarySetting, RosarySetting, QDistinct> {
  QueryBuilder<RosarySetting, RosarySetting, QDistinct> distinctByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'count');
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QDistinct> distinctByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'darkMode');
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QDistinct> distinctByLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'limit');
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QDistinct> distinctBySetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'setCount');
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QDistinct> distinctBySound() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sound');
    });
  }

  QueryBuilder<RosarySetting, RosarySetting, QDistinct> distinctByVibrate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vibrate');
    });
  }
}

extension RosarySettingQueryProperty
    on QueryBuilder<RosarySetting, RosarySetting, QQueryProperty> {
  QueryBuilder<RosarySetting, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RosarySetting, int, QQueryOperations> countProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'count');
    });
  }

  QueryBuilder<RosarySetting, bool, QQueryOperations> darkModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'darkMode');
    });
  }

  QueryBuilder<RosarySetting, int, QQueryOperations> limitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'limit');
    });
  }

  QueryBuilder<RosarySetting, int, QQueryOperations> setCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'setCount');
    });
  }

  QueryBuilder<RosarySetting, bool, QQueryOperations> soundProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sound');
    });
  }

  QueryBuilder<RosarySetting, bool, QQueryOperations> vibrateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vibrate');
    });
  }
}
