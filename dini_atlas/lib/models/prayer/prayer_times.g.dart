// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_times.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPrayerTimesCollection on Isar {
  IsarCollection<PrayerTimes> get prayerTimes => this.collection();
}

const PrayerTimesSchema = CollectionSchema(
  name: r'PrayerTimes',
  id: 281533902985132827,
  properties: {
    r'eidPrayers': PropertySchema(
      id: 0,
      name: r'eidPrayers',
      type: IsarType.object,
      target: r'EidPrayerTime',
    ),
    r'lastFetch': PropertySchema(
      id: 1,
      name: r'lastFetch',
      type: IsarType.dateTime,
    ),
    r'prayerTimes': PropertySchema(
      id: 2,
      name: r'prayerTimes',
      type: IsarType.objectList,
      target: r'PrayerTime',
    )
  },
  estimateSize: _prayerTimesEstimateSize,
  serialize: _prayerTimesSerialize,
  deserialize: _prayerTimesDeserialize,
  deserializeProp: _prayerTimesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'EidPrayerTime': EidPrayerTimeSchema,
    r'BayramNamazVakti': BayramNamazVaktiSchema,
    r'IlceBilgisi': IlceBilgisiSchema,
    r'PrayerTime': PrayerTimeSchema
  },
  getId: _prayerTimesGetId,
  getLinks: _prayerTimesGetLinks,
  attach: _prayerTimesAttach,
  version: '3.1.0+1',
);

int _prayerTimesEstimateSize(
  PrayerTimes object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      EidPrayerTimeSchema.estimateSize(
          object.eidPrayers, allOffsets[EidPrayerTime]!, allOffsets);
  bytesCount += 3 + object.prayerTimes.length * 3;
  {
    final offsets = allOffsets[PrayerTime]!;
    for (var i = 0; i < object.prayerTimes.length; i++) {
      final value = object.prayerTimes[i];
      bytesCount += PrayerTimeSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _prayerTimesSerialize(
  PrayerTimes object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<EidPrayerTime>(
    offsets[0],
    allOffsets,
    EidPrayerTimeSchema.serialize,
    object.eidPrayers,
  );
  writer.writeDateTime(offsets[1], object.lastFetch);
  writer.writeObjectList<PrayerTime>(
    offsets[2],
    allOffsets,
    PrayerTimeSchema.serialize,
    object.prayerTimes,
  );
}

PrayerTimes _prayerTimesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PrayerTimes();
  object.eidPrayers = reader.readObjectOrNull<EidPrayerTime>(
        offsets[0],
        EidPrayerTimeSchema.deserialize,
        allOffsets,
      ) ??
      EidPrayerTime();
  object.id = id;
  object.lastFetch = reader.readDateTime(offsets[1]);
  object.prayerTimes = reader.readObjectList<PrayerTime>(
        offsets[2],
        PrayerTimeSchema.deserialize,
        allOffsets,
        PrayerTime(),
      ) ??
      [];
  return object;
}

P _prayerTimesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<EidPrayerTime>(
            offset,
            EidPrayerTimeSchema.deserialize,
            allOffsets,
          ) ??
          EidPrayerTime()) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readObjectList<PrayerTime>(
            offset,
            PrayerTimeSchema.deserialize,
            allOffsets,
            PrayerTime(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _prayerTimesGetId(PrayerTimes object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _prayerTimesGetLinks(PrayerTimes object) {
  return [];
}

void _prayerTimesAttach(
    IsarCollection<dynamic> col, Id id, PrayerTimes object) {
  object.id = id;
}

extension PrayerTimesQueryWhereSort
    on QueryBuilder<PrayerTimes, PrayerTimes, QWhere> {
  QueryBuilder<PrayerTimes, PrayerTimes, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PrayerTimesQueryWhere
    on QueryBuilder<PrayerTimes, PrayerTimes, QWhereClause> {
  QueryBuilder<PrayerTimes, PrayerTimes, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterWhereClause> idBetween(
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

extension PrayerTimesQueryFilter
    on QueryBuilder<PrayerTimes, PrayerTimes, QFilterCondition> {
  QueryBuilder<PrayerTimes, PrayerTimes, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterFilterCondition>
      lastFetchEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastFetch',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterFilterCondition>
      lastFetchGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastFetch',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterFilterCondition>
      lastFetchLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastFetch',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterFilterCondition>
      lastFetchBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastFetch',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterFilterCondition>
      prayerTimesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prayerTimes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterFilterCondition>
      prayerTimesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prayerTimes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterFilterCondition>
      prayerTimesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prayerTimes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterFilterCondition>
      prayerTimesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prayerTimes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterFilterCondition>
      prayerTimesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prayerTimes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterFilterCondition>
      prayerTimesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prayerTimes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension PrayerTimesQueryObject
    on QueryBuilder<PrayerTimes, PrayerTimes, QFilterCondition> {
  QueryBuilder<PrayerTimes, PrayerTimes, QAfterFilterCondition> eidPrayers(
      FilterQuery<EidPrayerTime> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'eidPrayers');
    });
  }

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterFilterCondition>
      prayerTimesElement(FilterQuery<PrayerTime> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'prayerTimes');
    });
  }
}

extension PrayerTimesQueryLinks
    on QueryBuilder<PrayerTimes, PrayerTimes, QFilterCondition> {}

extension PrayerTimesQuerySortBy
    on QueryBuilder<PrayerTimes, PrayerTimes, QSortBy> {
  QueryBuilder<PrayerTimes, PrayerTimes, QAfterSortBy> sortByLastFetch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFetch', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterSortBy> sortByLastFetchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFetch', Sort.desc);
    });
  }
}

extension PrayerTimesQuerySortThenBy
    on QueryBuilder<PrayerTimes, PrayerTimes, QSortThenBy> {
  QueryBuilder<PrayerTimes, PrayerTimes, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterSortBy> thenByLastFetch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFetch', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimes, PrayerTimes, QAfterSortBy> thenByLastFetchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFetch', Sort.desc);
    });
  }
}

extension PrayerTimesQueryWhereDistinct
    on QueryBuilder<PrayerTimes, PrayerTimes, QDistinct> {
  QueryBuilder<PrayerTimes, PrayerTimes, QDistinct> distinctByLastFetch() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastFetch');
    });
  }
}

extension PrayerTimesQueryProperty
    on QueryBuilder<PrayerTimes, PrayerTimes, QQueryProperty> {
  QueryBuilder<PrayerTimes, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PrayerTimes, EidPrayerTime, QQueryOperations>
      eidPrayersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eidPrayers');
    });
  }

  QueryBuilder<PrayerTimes, DateTime, QQueryOperations> lastFetchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastFetch');
    });
  }

  QueryBuilder<PrayerTimes, List<PrayerTime>, QQueryOperations>
      prayerTimesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prayerTimes');
    });
  }
}
