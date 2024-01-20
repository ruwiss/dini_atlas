// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_time.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PrayerTimeSchema = Schema(
  name: r'PrayerTime',
  id: -2307682095520615532,
  properties: {
    r'aksam': PropertySchema(
      id: 0,
      name: r'aksam',
      type: IsarType.string,
    ),
    r'ayinSekliUrl': PropertySchema(
      id: 1,
      name: r'ayinSekliUrl',
      type: IsarType.string,
    ),
    r'greenwichOrtalamaZamani': PropertySchema(
      id: 2,
      name: r'greenwichOrtalamaZamani',
      type: IsarType.double,
    ),
    r'gunes': PropertySchema(
      id: 3,
      name: r'gunes',
      type: IsarType.string,
    ),
    r'gunesBatis': PropertySchema(
      id: 4,
      name: r'gunesBatis',
      type: IsarType.string,
    ),
    r'gunesDogus': PropertySchema(
      id: 5,
      name: r'gunesDogus',
      type: IsarType.string,
    ),
    r'hicriTarihKisa': PropertySchema(
      id: 6,
      name: r'hicriTarihKisa',
      type: IsarType.string,
    ),
    r'hicriTarihKisaIso8601': PropertySchema(
      id: 7,
      name: r'hicriTarihKisaIso8601',
      type: IsarType.string,
    ),
    r'hicriTarihUzun': PropertySchema(
      id: 8,
      name: r'hicriTarihUzun',
      type: IsarType.string,
    ),
    r'hicriTarihUzunIso8601': PropertySchema(
      id: 9,
      name: r'hicriTarihUzunIso8601',
      type: IsarType.string,
    ),
    r'ikindi': PropertySchema(
      id: 10,
      name: r'ikindi',
      type: IsarType.string,
    ),
    r'imsak': PropertySchema(
      id: 11,
      name: r'imsak',
      type: IsarType.string,
    ),
    r'kibleSaati': PropertySchema(
      id: 12,
      name: r'kibleSaati',
      type: IsarType.string,
    ),
    r'miladiTarihKisa': PropertySchema(
      id: 13,
      name: r'miladiTarihKisa',
      type: IsarType.string,
    ),
    r'miladiTarihKisaIso8601': PropertySchema(
      id: 14,
      name: r'miladiTarihKisaIso8601',
      type: IsarType.string,
    ),
    r'miladiTarihUzun': PropertySchema(
      id: 15,
      name: r'miladiTarihUzun',
      type: IsarType.string,
    ),
    r'miladiTarihUzunIso8601': PropertySchema(
      id: 16,
      name: r'miladiTarihUzunIso8601',
      type: IsarType.dateTime,
    ),
    r'ogle': PropertySchema(
      id: 17,
      name: r'ogle',
      type: IsarType.string,
    ),
    r'yatsi': PropertySchema(
      id: 18,
      name: r'yatsi',
      type: IsarType.string,
    )
  },
  estimateSize: _prayerTimeEstimateSize,
  serialize: _prayerTimeSerialize,
  deserialize: _prayerTimeDeserialize,
  deserializeProp: _prayerTimeDeserializeProp,
);

int _prayerTimeEstimateSize(
  PrayerTime object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.aksam.length * 3;
  bytesCount += 3 + object.ayinSekliUrl.length * 3;
  bytesCount += 3 + object.gunes.length * 3;
  bytesCount += 3 + object.gunesBatis.length * 3;
  bytesCount += 3 + object.gunesDogus.length * 3;
  bytesCount += 3 + object.hicriTarihKisa.length * 3;
  {
    final value = object.hicriTarihKisaIso8601;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.hicriTarihUzun.length * 3;
  {
    final value = object.hicriTarihUzunIso8601;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.ikindi.length * 3;
  bytesCount += 3 + object.imsak.length * 3;
  bytesCount += 3 + object.kibleSaati.length * 3;
  bytesCount += 3 + object.miladiTarihKisa.length * 3;
  bytesCount += 3 + object.miladiTarihKisaIso8601.length * 3;
  bytesCount += 3 + object.miladiTarihUzun.length * 3;
  bytesCount += 3 + object.ogle.length * 3;
  bytesCount += 3 + object.yatsi.length * 3;
  return bytesCount;
}

void _prayerTimeSerialize(
  PrayerTime object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.aksam);
  writer.writeString(offsets[1], object.ayinSekliUrl);
  writer.writeDouble(offsets[2], object.greenwichOrtalamaZamani);
  writer.writeString(offsets[3], object.gunes);
  writer.writeString(offsets[4], object.gunesBatis);
  writer.writeString(offsets[5], object.gunesDogus);
  writer.writeString(offsets[6], object.hicriTarihKisa);
  writer.writeString(offsets[7], object.hicriTarihKisaIso8601);
  writer.writeString(offsets[8], object.hicriTarihUzun);
  writer.writeString(offsets[9], object.hicriTarihUzunIso8601);
  writer.writeString(offsets[10], object.ikindi);
  writer.writeString(offsets[11], object.imsak);
  writer.writeString(offsets[12], object.kibleSaati);
  writer.writeString(offsets[13], object.miladiTarihKisa);
  writer.writeString(offsets[14], object.miladiTarihKisaIso8601);
  writer.writeString(offsets[15], object.miladiTarihUzun);
  writer.writeDateTime(offsets[16], object.miladiTarihUzunIso8601);
  writer.writeString(offsets[17], object.ogle);
  writer.writeString(offsets[18], object.yatsi);
}

PrayerTime _prayerTimeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PrayerTime();
  object.aksam = reader.readString(offsets[0]);
  object.ayinSekliUrl = reader.readString(offsets[1]);
  object.greenwichOrtalamaZamani = reader.readDouble(offsets[2]);
  object.gunes = reader.readString(offsets[3]);
  object.gunesBatis = reader.readString(offsets[4]);
  object.gunesDogus = reader.readString(offsets[5]);
  object.hicriTarihKisa = reader.readString(offsets[6]);
  object.hicriTarihKisaIso8601 = reader.readStringOrNull(offsets[7]);
  object.hicriTarihUzun = reader.readString(offsets[8]);
  object.hicriTarihUzunIso8601 = reader.readStringOrNull(offsets[9]);
  object.ikindi = reader.readString(offsets[10]);
  object.imsak = reader.readString(offsets[11]);
  object.kibleSaati = reader.readString(offsets[12]);
  object.miladiTarihKisa = reader.readString(offsets[13]);
  object.miladiTarihKisaIso8601 = reader.readString(offsets[14]);
  object.miladiTarihUzun = reader.readString(offsets[15]);
  object.miladiTarihUzunIso8601 = reader.readDateTime(offsets[16]);
  object.ogle = reader.readString(offsets[17]);
  object.yatsi = reader.readString(offsets[18]);
  return object;
}

P _prayerTimeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readDateTime(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PrayerTimeQueryFilter
    on QueryBuilder<PrayerTime, PrayerTime, QFilterCondition> {
  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> aksamEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aksam',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> aksamGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aksam',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> aksamLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aksam',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> aksamBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aksam',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> aksamStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aksam',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> aksamEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aksam',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> aksamContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aksam',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> aksamMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aksam',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> aksamIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aksam',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      aksamIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aksam',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      ayinSekliUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ayinSekliUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      ayinSekliUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ayinSekliUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      ayinSekliUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ayinSekliUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      ayinSekliUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ayinSekliUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      ayinSekliUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ayinSekliUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      ayinSekliUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ayinSekliUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      ayinSekliUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ayinSekliUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      ayinSekliUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ayinSekliUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      ayinSekliUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ayinSekliUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      ayinSekliUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ayinSekliUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      greenwichOrtalamaZamaniEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'greenwichOrtalamaZamani',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      greenwichOrtalamaZamaniGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'greenwichOrtalamaZamani',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      greenwichOrtalamaZamaniLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'greenwichOrtalamaZamani',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      greenwichOrtalamaZamaniBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'greenwichOrtalamaZamani',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> gunesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gunes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> gunesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gunes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> gunesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gunes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> gunesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gunes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> gunesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gunes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> gunesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gunes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> gunesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gunes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> gunesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gunes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> gunesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gunes',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      gunesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gunes',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> gunesBatisEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gunesBatis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      gunesBatisGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gunesBatis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      gunesBatisLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gunesBatis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> gunesBatisBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gunesBatis',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      gunesBatisStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gunesBatis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      gunesBatisEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gunesBatis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      gunesBatisContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gunesBatis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> gunesBatisMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gunesBatis',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      gunesBatisIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gunesBatis',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      gunesBatisIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gunesBatis',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> gunesDogusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gunesDogus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      gunesDogusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gunesDogus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      gunesDogusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gunesDogus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> gunesDogusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gunesDogus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      gunesDogusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gunesDogus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      gunesDogusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gunesDogus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      gunesDogusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gunesDogus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> gunesDogusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gunesDogus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      gunesDogusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gunesDogus',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      gunesDogusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gunesDogus',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hicriTarihKisa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hicriTarihKisa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hicriTarihKisa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hicriTarihKisa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hicriTarihKisa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hicriTarihKisa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hicriTarihKisa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hicriTarihKisa',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hicriTarihKisa',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hicriTarihKisa',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaIso8601IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hicriTarihKisaIso8601',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaIso8601IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hicriTarihKisaIso8601',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaIso8601EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hicriTarihKisaIso8601',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaIso8601GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hicriTarihKisaIso8601',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaIso8601LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hicriTarihKisaIso8601',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaIso8601Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hicriTarihKisaIso8601',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaIso8601StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hicriTarihKisaIso8601',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaIso8601EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hicriTarihKisaIso8601',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaIso8601Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hicriTarihKisaIso8601',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaIso8601Matches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hicriTarihKisaIso8601',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaIso8601IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hicriTarihKisaIso8601',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihKisaIso8601IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hicriTarihKisaIso8601',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hicriTarihUzun',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hicriTarihUzun',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hicriTarihUzun',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hicriTarihUzun',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hicriTarihUzun',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hicriTarihUzun',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hicriTarihUzun',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hicriTarihUzun',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hicriTarihUzun',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hicriTarihUzun',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunIso8601IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hicriTarihUzunIso8601',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunIso8601IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hicriTarihUzunIso8601',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunIso8601EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hicriTarihUzunIso8601',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunIso8601GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hicriTarihUzunIso8601',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunIso8601LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hicriTarihUzunIso8601',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunIso8601Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hicriTarihUzunIso8601',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunIso8601StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hicriTarihUzunIso8601',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunIso8601EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hicriTarihUzunIso8601',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunIso8601Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hicriTarihUzunIso8601',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunIso8601Matches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hicriTarihUzunIso8601',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunIso8601IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hicriTarihUzunIso8601',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      hicriTarihUzunIso8601IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hicriTarihUzunIso8601',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> ikindiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ikindi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> ikindiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ikindi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> ikindiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ikindi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> ikindiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ikindi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> ikindiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ikindi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> ikindiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ikindi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> ikindiContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ikindi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> ikindiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ikindi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> ikindiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ikindi',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      ikindiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ikindi',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> imsakEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imsak',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> imsakGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imsak',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> imsakLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imsak',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> imsakBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imsak',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> imsakStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imsak',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> imsakEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imsak',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> imsakContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imsak',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> imsakMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imsak',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> imsakIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imsak',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      imsakIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imsak',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> kibleSaatiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kibleSaati',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      kibleSaatiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kibleSaati',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      kibleSaatiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kibleSaati',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> kibleSaatiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kibleSaati',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      kibleSaatiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'kibleSaati',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      kibleSaatiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'kibleSaati',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      kibleSaatiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'kibleSaati',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> kibleSaatiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'kibleSaati',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      kibleSaatiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kibleSaati',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      kibleSaatiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'kibleSaati',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'miladiTarihKisa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'miladiTarihKisa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'miladiTarihKisa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'miladiTarihKisa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'miladiTarihKisa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'miladiTarihKisa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'miladiTarihKisa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'miladiTarihKisa',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'miladiTarihKisa',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'miladiTarihKisa',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaIso8601EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'miladiTarihKisaIso8601',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaIso8601GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'miladiTarihKisaIso8601',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaIso8601LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'miladiTarihKisaIso8601',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaIso8601Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'miladiTarihKisaIso8601',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaIso8601StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'miladiTarihKisaIso8601',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaIso8601EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'miladiTarihKisaIso8601',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaIso8601Contains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'miladiTarihKisaIso8601',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaIso8601Matches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'miladiTarihKisaIso8601',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaIso8601IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'miladiTarihKisaIso8601',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihKisaIso8601IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'miladiTarihKisaIso8601',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihUzunEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'miladiTarihUzun',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihUzunGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'miladiTarihUzun',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihUzunLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'miladiTarihUzun',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihUzunBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'miladiTarihUzun',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihUzunStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'miladiTarihUzun',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihUzunEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'miladiTarihUzun',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihUzunContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'miladiTarihUzun',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihUzunMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'miladiTarihUzun',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihUzunIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'miladiTarihUzun',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihUzunIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'miladiTarihUzun',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihUzunIso8601EqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'miladiTarihUzunIso8601',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihUzunIso8601GreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'miladiTarihUzunIso8601',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihUzunIso8601LessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'miladiTarihUzunIso8601',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      miladiTarihUzunIso8601Between(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'miladiTarihUzunIso8601',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> ogleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ogle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> ogleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ogle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> ogleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ogle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> ogleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ogle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> ogleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ogle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> ogleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ogle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> ogleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ogle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> ogleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ogle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> ogleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ogle',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> ogleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ogle',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> yatsiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yatsi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> yatsiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'yatsi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> yatsiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'yatsi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> yatsiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'yatsi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> yatsiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'yatsi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> yatsiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'yatsi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> yatsiContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'yatsi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> yatsiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'yatsi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition> yatsiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yatsi',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTime, PrayerTime, QAfterFilterCondition>
      yatsiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'yatsi',
        value: '',
      ));
    });
  }
}

extension PrayerTimeQueryObject
    on QueryBuilder<PrayerTime, PrayerTime, QFilterCondition> {}
