// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eid_prayer.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const EidPrayerTimeSchema = Schema(
  name: r'EidPrayerTime',
  id: 3827781614720012975,
  properties: {
    r'bayramNamazVakti': PropertySchema(
      id: 0,
      name: r'bayramNamazVakti',
      type: IsarType.object,
      target: r'BayramNamazVakti',
    ),
    r'ilceBilgisi': PropertySchema(
      id: 1,
      name: r'ilceBilgisi',
      type: IsarType.object,
      target: r'IlceBilgisi',
    )
  },
  estimateSize: _eidPrayerTimeEstimateSize,
  serialize: _eidPrayerTimeSerialize,
  deserialize: _eidPrayerTimeDeserialize,
  deserializeProp: _eidPrayerTimeDeserializeProp,
);

int _eidPrayerTimeEstimateSize(
  EidPrayerTime object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      BayramNamazVaktiSchema.estimateSize(
          object.bayramNamazVakti, allOffsets[BayramNamazVakti]!, allOffsets);
  bytesCount += 3 +
      IlceBilgisiSchema.estimateSize(
          object.ilceBilgisi, allOffsets[IlceBilgisi]!, allOffsets);
  return bytesCount;
}

void _eidPrayerTimeSerialize(
  EidPrayerTime object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<BayramNamazVakti>(
    offsets[0],
    allOffsets,
    BayramNamazVaktiSchema.serialize,
    object.bayramNamazVakti,
  );
  writer.writeObject<IlceBilgisi>(
    offsets[1],
    allOffsets,
    IlceBilgisiSchema.serialize,
    object.ilceBilgisi,
  );
}

EidPrayerTime _eidPrayerTimeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EidPrayerTime();
  object.bayramNamazVakti = reader.readObjectOrNull<BayramNamazVakti>(
        offsets[0],
        BayramNamazVaktiSchema.deserialize,
        allOffsets,
      ) ??
      BayramNamazVakti();
  object.ilceBilgisi = reader.readObjectOrNull<IlceBilgisi>(
        offsets[1],
        IlceBilgisiSchema.deserialize,
        allOffsets,
      ) ??
      IlceBilgisi();
  return object;
}

P _eidPrayerTimeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<BayramNamazVakti>(
            offset,
            BayramNamazVaktiSchema.deserialize,
            allOffsets,
          ) ??
          BayramNamazVakti()) as P;
    case 1:
      return (reader.readObjectOrNull<IlceBilgisi>(
            offset,
            IlceBilgisiSchema.deserialize,
            allOffsets,
          ) ??
          IlceBilgisi()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension EidPrayerTimeQueryFilter
    on QueryBuilder<EidPrayerTime, EidPrayerTime, QFilterCondition> {}

extension EidPrayerTimeQueryObject
    on QueryBuilder<EidPrayerTime, EidPrayerTime, QFilterCondition> {
  QueryBuilder<EidPrayerTime, EidPrayerTime, QAfterFilterCondition>
      bayramNamazVakti(FilterQuery<BayramNamazVakti> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'bayramNamazVakti');
    });
  }

  QueryBuilder<EidPrayerTime, EidPrayerTime, QAfterFilterCondition> ilceBilgisi(
      FilterQuery<IlceBilgisi> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'ilceBilgisi');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BayramNamazVaktiSchema = Schema(
  name: r'BayramNamazVakti',
  id: -893169806236608711,
  properties: {
    r'kurbanNamaziHTarih': PropertySchema(
      id: 0,
      name: r'kurbanNamaziHTarih',
      type: IsarType.string,
    ),
    r'kurbanNamaziSaat': PropertySchema(
      id: 1,
      name: r'kurbanNamaziSaat',
      type: IsarType.string,
    ),
    r'kurbanNamaziTarih': PropertySchema(
      id: 2,
      name: r'kurbanNamaziTarih',
      type: IsarType.string,
    ),
    r'ramazanNamaziHTarih': PropertySchema(
      id: 3,
      name: r'ramazanNamaziHTarih',
      type: IsarType.string,
    ),
    r'ramazanNamaziSaat': PropertySchema(
      id: 4,
      name: r'ramazanNamaziSaat',
      type: IsarType.string,
    ),
    r'ramazanNamaziTarih': PropertySchema(
      id: 5,
      name: r'ramazanNamaziTarih',
      type: IsarType.string,
    )
  },
  estimateSize: _bayramNamazVaktiEstimateSize,
  serialize: _bayramNamazVaktiSerialize,
  deserialize: _bayramNamazVaktiDeserialize,
  deserializeProp: _bayramNamazVaktiDeserializeProp,
);

int _bayramNamazVaktiEstimateSize(
  BayramNamazVakti object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.kurbanBayramNamaziHTarihi.length * 3;
  bytesCount += 3 + object.kurbanBayramNamaziSaati.length * 3;
  bytesCount += 3 + object.kurbanBayramNamaziTarihi.length * 3;
  bytesCount += 3 + object.ramazanBayramNamaziHTarihi.length * 3;
  bytesCount += 3 + object.ramazanBayramNamaziSaati.length * 3;
  bytesCount += 3 + object.ramazanBayramNamaziTarihi.length * 3;
  return bytesCount;
}

void _bayramNamazVaktiSerialize(
  BayramNamazVakti object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.kurbanBayramNamaziHTarihi);
  writer.writeString(offsets[1], object.kurbanBayramNamaziSaati);
  writer.writeString(offsets[2], object.kurbanBayramNamaziTarihi);
  writer.writeString(offsets[3], object.ramazanBayramNamaziHTarihi);
  writer.writeString(offsets[4], object.ramazanBayramNamaziSaati);
  writer.writeString(offsets[5], object.ramazanBayramNamaziTarihi);
}

BayramNamazVakti _bayramNamazVaktiDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BayramNamazVakti();
  object.kurbanBayramNamaziHTarihi = reader.readString(offsets[0]);
  object.kurbanBayramNamaziSaati = reader.readString(offsets[1]);
  object.kurbanBayramNamaziTarihi = reader.readString(offsets[2]);
  object.ramazanBayramNamaziHTarihi = reader.readString(offsets[3]);
  object.ramazanBayramNamaziSaati = reader.readString(offsets[4]);
  object.ramazanBayramNamaziTarihi = reader.readString(offsets[5]);
  return object;
}

P _bayramNamazVaktiDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BayramNamazVaktiQueryFilter
    on QueryBuilder<BayramNamazVakti, BayramNamazVakti, QFilterCondition> {
  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziHTarihiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kurbanNamaziHTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziHTarihiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kurbanNamaziHTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziHTarihiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kurbanNamaziHTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziHTarihiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kurbanNamaziHTarih',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziHTarihiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'kurbanNamaziHTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziHTarihiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'kurbanNamaziHTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziHTarihiContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'kurbanNamaziHTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziHTarihiMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'kurbanNamaziHTarih',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziHTarihiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kurbanNamaziHTarih',
        value: '',
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziHTarihiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'kurbanNamaziHTarih',
        value: '',
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziSaatiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kurbanNamaziSaat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziSaatiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kurbanNamaziSaat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziSaatiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kurbanNamaziSaat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziSaatiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kurbanNamaziSaat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziSaatiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'kurbanNamaziSaat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziSaatiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'kurbanNamaziSaat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziSaatiContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'kurbanNamaziSaat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziSaatiMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'kurbanNamaziSaat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziSaatiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kurbanNamaziSaat',
        value: '',
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziSaatiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'kurbanNamaziSaat',
        value: '',
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziTarihiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kurbanNamaziTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziTarihiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kurbanNamaziTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziTarihiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kurbanNamaziTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziTarihiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kurbanNamaziTarih',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziTarihiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'kurbanNamaziTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziTarihiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'kurbanNamaziTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziTarihiContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'kurbanNamaziTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziTarihiMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'kurbanNamaziTarih',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziTarihiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kurbanNamaziTarih',
        value: '',
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      kurbanBayramNamaziTarihiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'kurbanNamaziTarih',
        value: '',
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziHTarihiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ramazanNamaziHTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziHTarihiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ramazanNamaziHTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziHTarihiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ramazanNamaziHTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziHTarihiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ramazanNamaziHTarih',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziHTarihiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ramazanNamaziHTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziHTarihiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ramazanNamaziHTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziHTarihiContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ramazanNamaziHTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziHTarihiMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ramazanNamaziHTarih',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziHTarihiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ramazanNamaziHTarih',
        value: '',
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziHTarihiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ramazanNamaziHTarih',
        value: '',
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziSaatiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ramazanNamaziSaat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziSaatiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ramazanNamaziSaat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziSaatiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ramazanNamaziSaat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziSaatiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ramazanNamaziSaat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziSaatiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ramazanNamaziSaat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziSaatiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ramazanNamaziSaat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziSaatiContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ramazanNamaziSaat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziSaatiMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ramazanNamaziSaat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziSaatiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ramazanNamaziSaat',
        value: '',
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziSaatiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ramazanNamaziSaat',
        value: '',
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziTarihiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ramazanNamaziTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziTarihiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ramazanNamaziTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziTarihiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ramazanNamaziTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziTarihiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ramazanNamaziTarih',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziTarihiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ramazanNamaziTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziTarihiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ramazanNamaziTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziTarihiContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ramazanNamaziTarih',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziTarihiMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ramazanNamaziTarih',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziTarihiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ramazanNamaziTarih',
        value: '',
      ));
    });
  }

  QueryBuilder<BayramNamazVakti, BayramNamazVakti, QAfterFilterCondition>
      ramazanBayramNamaziTarihiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ramazanNamaziTarih',
        value: '',
      ));
    });
  }
}

extension BayramNamazVaktiQueryObject
    on QueryBuilder<BayramNamazVakti, BayramNamazVakti, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IlceBilgisiSchema = Schema(
  name: r'IlceBilgisi',
  id: 5285404218767745634,
  properties: {
    r'cografiKibleAcisi': PropertySchema(
      id: 0,
      name: r'cografiKibleAcisi',
      type: IsarType.string,
    ),
    r'ilceAdi': PropertySchema(
      id: 1,
      name: r'ilceAdi',
      type: IsarType.string,
    ),
    r'ilceAdiEn': PropertySchema(
      id: 2,
      name: r'ilceAdiEn',
      type: IsarType.string,
    ),
    r'ilceId': PropertySchema(
      id: 3,
      name: r'ilceId',
      type: IsarType.string,
    ),
    r'kabeyeUzaklik': PropertySchema(
      id: 4,
      name: r'kabeyeUzaklik',
      type: IsarType.string,
    ),
    r'kibleAcisi': PropertySchema(
      id: 5,
      name: r'kibleAcisi',
      type: IsarType.string,
    ),
    r'sehirAdi': PropertySchema(
      id: 6,
      name: r'sehirAdi',
      type: IsarType.string,
    ),
    r'sehirAdiEn': PropertySchema(
      id: 7,
      name: r'sehirAdiEn',
      type: IsarType.string,
    ),
    r'ulkeAdi': PropertySchema(
      id: 8,
      name: r'ulkeAdi',
      type: IsarType.string,
    ),
    r'ulkeAdiEn': PropertySchema(
      id: 9,
      name: r'ulkeAdiEn',
      type: IsarType.string,
    )
  },
  estimateSize: _ilceBilgisiEstimateSize,
  serialize: _ilceBilgisiSerialize,
  deserialize: _ilceBilgisiDeserialize,
  deserializeProp: _ilceBilgisiDeserializeProp,
);

int _ilceBilgisiEstimateSize(
  IlceBilgisi object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cografiKibleAcisi.length * 3;
  bytesCount += 3 + object.ilceAdi.length * 3;
  {
    final value = object.ilceAdiEn;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.ilceId.length * 3;
  bytesCount += 3 + object.kabeyeUzaklik.length * 3;
  bytesCount += 3 + object.kibleAcisi.length * 3;
  bytesCount += 3 + object.sehirAdi.length * 3;
  {
    final value = object.sehirAdiEn;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.ulkeAdi.length * 3;
  {
    final value = object.ulkeAdiEn;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _ilceBilgisiSerialize(
  IlceBilgisi object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cografiKibleAcisi);
  writer.writeString(offsets[1], object.ilceAdi);
  writer.writeString(offsets[2], object.ilceAdiEn);
  writer.writeString(offsets[3], object.ilceId);
  writer.writeString(offsets[4], object.kabeyeUzaklik);
  writer.writeString(offsets[5], object.kibleAcisi);
  writer.writeString(offsets[6], object.sehirAdi);
  writer.writeString(offsets[7], object.sehirAdiEn);
  writer.writeString(offsets[8], object.ulkeAdi);
  writer.writeString(offsets[9], object.ulkeAdiEn);
}

IlceBilgisi _ilceBilgisiDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IlceBilgisi();
  object.cografiKibleAcisi = reader.readString(offsets[0]);
  object.ilceAdi = reader.readString(offsets[1]);
  object.ilceAdiEn = reader.readStringOrNull(offsets[2]);
  object.ilceId = reader.readString(offsets[3]);
  object.kabeyeUzaklik = reader.readString(offsets[4]);
  object.kibleAcisi = reader.readString(offsets[5]);
  object.sehirAdi = reader.readString(offsets[6]);
  object.sehirAdiEn = reader.readStringOrNull(offsets[7]);
  object.ulkeAdi = reader.readString(offsets[8]);
  object.ulkeAdiEn = reader.readStringOrNull(offsets[9]);
  return object;
}

P _ilceBilgisiDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IlceBilgisiQueryFilter
    on QueryBuilder<IlceBilgisi, IlceBilgisi, QFilterCondition> {
  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      cografiKibleAcisiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cografiKibleAcisi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      cografiKibleAcisiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cografiKibleAcisi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      cografiKibleAcisiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cografiKibleAcisi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      cografiKibleAcisiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cografiKibleAcisi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      cografiKibleAcisiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cografiKibleAcisi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      cografiKibleAcisiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cografiKibleAcisi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      cografiKibleAcisiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cografiKibleAcisi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      cografiKibleAcisiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cografiKibleAcisi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      cografiKibleAcisiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cografiKibleAcisi',
        value: '',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      cografiKibleAcisiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cografiKibleAcisi',
        value: '',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> ilceAdiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ilceAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceAdiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ilceAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> ilceAdiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ilceAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> ilceAdiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ilceAdi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceAdiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ilceAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> ilceAdiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ilceAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> ilceAdiContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ilceAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> ilceAdiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ilceAdi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceAdiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ilceAdi',
        value: '',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceAdiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ilceAdi',
        value: '',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceAdiEnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ilceAdiEn',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceAdiEnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ilceAdiEn',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceAdiEnEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ilceAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceAdiEnGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ilceAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceAdiEnLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ilceAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceAdiEnBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ilceAdiEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceAdiEnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ilceAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceAdiEnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ilceAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceAdiEnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ilceAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceAdiEnMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ilceAdiEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceAdiEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ilceAdiEn',
        value: '',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceAdiEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ilceAdiEn',
        value: '',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> ilceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ilceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ilceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> ilceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ilceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> ilceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ilceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ilceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> ilceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ilceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> ilceIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ilceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> ilceIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ilceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ilceId',
        value: '',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ilceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ilceId',
        value: '',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kabeyeUzaklikEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kabeyeUzaklik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kabeyeUzaklikGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kabeyeUzaklik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kabeyeUzaklikLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kabeyeUzaklik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kabeyeUzaklikBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kabeyeUzaklik',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kabeyeUzaklikStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'kabeyeUzaklik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kabeyeUzaklikEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'kabeyeUzaklik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kabeyeUzaklikContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'kabeyeUzaklik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kabeyeUzaklikMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'kabeyeUzaklik',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kabeyeUzaklikIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kabeyeUzaklik',
        value: '',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kabeyeUzaklikIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'kabeyeUzaklik',
        value: '',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kibleAcisiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kibleAcisi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kibleAcisiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kibleAcisi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kibleAcisiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kibleAcisi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kibleAcisiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kibleAcisi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kibleAcisiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'kibleAcisi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kibleAcisiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'kibleAcisi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kibleAcisiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'kibleAcisi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kibleAcisiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'kibleAcisi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kibleAcisiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kibleAcisi',
        value: '',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      kibleAcisiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'kibleAcisi',
        value: '',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> sehirAdiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sehirAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      sehirAdiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sehirAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      sehirAdiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sehirAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> sehirAdiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sehirAdi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      sehirAdiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sehirAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      sehirAdiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sehirAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      sehirAdiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sehirAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> sehirAdiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sehirAdi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      sehirAdiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sehirAdi',
        value: '',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      sehirAdiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sehirAdi',
        value: '',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      sehirAdiEnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sehirAdiEn',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      sehirAdiEnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sehirAdiEn',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      sehirAdiEnEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sehirAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      sehirAdiEnGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sehirAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      sehirAdiEnLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sehirAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      sehirAdiEnBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sehirAdiEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      sehirAdiEnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sehirAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      sehirAdiEnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sehirAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      sehirAdiEnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sehirAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      sehirAdiEnMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sehirAdiEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      sehirAdiEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sehirAdiEn',
        value: '',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      sehirAdiEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sehirAdiEn',
        value: '',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> ulkeAdiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ulkeAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ulkeAdiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ulkeAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> ulkeAdiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ulkeAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> ulkeAdiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ulkeAdi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ulkeAdiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ulkeAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> ulkeAdiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ulkeAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> ulkeAdiContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ulkeAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition> ulkeAdiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ulkeAdi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ulkeAdiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ulkeAdi',
        value: '',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ulkeAdiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ulkeAdi',
        value: '',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ulkeAdiEnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ulkeAdiEn',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ulkeAdiEnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ulkeAdiEn',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ulkeAdiEnEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ulkeAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ulkeAdiEnGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ulkeAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ulkeAdiEnLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ulkeAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ulkeAdiEnBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ulkeAdiEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ulkeAdiEnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ulkeAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ulkeAdiEnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ulkeAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ulkeAdiEnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ulkeAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ulkeAdiEnMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ulkeAdiEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ulkeAdiEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ulkeAdiEn',
        value: '',
      ));
    });
  }

  QueryBuilder<IlceBilgisi, IlceBilgisi, QAfterFilterCondition>
      ulkeAdiEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ulkeAdiEn',
        value: '',
      ));
    });
  }
}

extension IlceBilgisiQueryObject
    on QueryBuilder<IlceBilgisi, IlceBilgisi, QFilterCondition> {}
