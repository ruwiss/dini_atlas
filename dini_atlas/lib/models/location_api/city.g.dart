// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CitySchema = Schema(
  name: r'City',
  id: 7924339642267295226,
  properties: {
    r'sehirAdi': PropertySchema(
      id: 0,
      name: r'sehirAdi',
      type: IsarType.string,
    ),
    r'sehirAdiEn': PropertySchema(
      id: 1,
      name: r'sehirAdiEn',
      type: IsarType.string,
    ),
    r'sehirId': PropertySchema(
      id: 2,
      name: r'sehirId',
      type: IsarType.string,
    )
  },
  estimateSize: _cityEstimateSize,
  serialize: _citySerialize,
  deserialize: _cityDeserialize,
  deserializeProp: _cityDeserializeProp,
);

int _cityEstimateSize(
  City object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.sehirAdi.length * 3;
  bytesCount += 3 + object.sehirAdiEn.length * 3;
  bytesCount += 3 + object.sehirId.length * 3;
  return bytesCount;
}

void _citySerialize(
  City object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.sehirAdi);
  writer.writeString(offsets[1], object.sehirAdiEn);
  writer.writeString(offsets[2], object.sehirId);
}

City _cityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = City();
  object.sehirAdi = reader.readString(offsets[0]);
  object.sehirAdiEn = reader.readString(offsets[1]);
  object.sehirId = reader.readString(offsets[2]);
  return object;
}

P _cityDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CityQueryFilter on QueryBuilder<City, City, QFilterCondition> {
  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiEqualTo(
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

  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiGreaterThan(
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

  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiLessThan(
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

  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiBetween(
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

  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiStartsWith(
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

  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiEndsWith(
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

  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sehirAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiMatches(
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

  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sehirAdi',
        value: '',
      ));
    });
  }

  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sehirAdi',
        value: '',
      ));
    });
  }

  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiEnEqualTo(
    String value, {
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

  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiEnGreaterThan(
    String value, {
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

  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiEnLessThan(
    String value, {
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

  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiEnBetween(
    String lower,
    String upper, {
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

  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiEnStartsWith(
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

  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiEnEndsWith(
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

  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiEnContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sehirAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiEnMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sehirAdiEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sehirAdiEn',
        value: '',
      ));
    });
  }

  QueryBuilder<City, City, QAfterFilterCondition> sehirAdiEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sehirAdiEn',
        value: '',
      ));
    });
  }

  QueryBuilder<City, City, QAfterFilterCondition> sehirIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sehirId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<City, City, QAfterFilterCondition> sehirIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sehirId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<City, City, QAfterFilterCondition> sehirIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sehirId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<City, City, QAfterFilterCondition> sehirIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sehirId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<City, City, QAfterFilterCondition> sehirIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sehirId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<City, City, QAfterFilterCondition> sehirIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sehirId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<City, City, QAfterFilterCondition> sehirIdContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sehirId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<City, City, QAfterFilterCondition> sehirIdMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sehirId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<City, City, QAfterFilterCondition> sehirIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sehirId',
        value: '',
      ));
    });
  }

  QueryBuilder<City, City, QAfterFilterCondition> sehirIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sehirId',
        value: '',
      ));
    });
  }
}

extension CityQueryObject on QueryBuilder<City, City, QFilterCondition> {}
