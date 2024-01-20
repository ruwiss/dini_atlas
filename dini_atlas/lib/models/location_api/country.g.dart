// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CountrySchema = Schema(
  name: r'Country',
  id: 2501229096893911614,
  properties: {
    r'ulkeAdi': PropertySchema(
      id: 0,
      name: r'ulkeAdi',
      type: IsarType.string,
    ),
    r'ulkeAdiEn': PropertySchema(
      id: 1,
      name: r'ulkeAdiEn',
      type: IsarType.string,
    ),
    r'ulkeId': PropertySchema(
      id: 2,
      name: r'ulkeId',
      type: IsarType.string,
    )
  },
  estimateSize: _countryEstimateSize,
  serialize: _countrySerialize,
  deserialize: _countryDeserialize,
  deserializeProp: _countryDeserializeProp,
);

int _countryEstimateSize(
  Country object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.ulkeAdi.length * 3;
  bytesCount += 3 + object.ulkeAdiEn.length * 3;
  bytesCount += 3 + object.ulkeId.length * 3;
  return bytesCount;
}

void _countrySerialize(
  Country object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.ulkeAdi);
  writer.writeString(offsets[1], object.ulkeAdiEn);
  writer.writeString(offsets[2], object.ulkeId);
}

Country _countryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Country();
  object.ulkeAdi = reader.readString(offsets[0]);
  object.ulkeAdiEn = reader.readString(offsets[1]);
  object.ulkeId = reader.readString(offsets[2]);
  return object;
}

P _countryDeserializeProp<P>(
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

extension CountryQueryFilter
    on QueryBuilder<Country, Country, QFilterCondition> {
  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiEqualTo(
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

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiGreaterThan(
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

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiLessThan(
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

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiBetween(
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

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiStartsWith(
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

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiEndsWith(
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

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiContains(
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

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiMatches(
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

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ulkeAdi',
        value: '',
      ));
    });
  }

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ulkeAdi',
        value: '',
      ));
    });
  }

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiEnEqualTo(
    String value, {
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

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiEnGreaterThan(
    String value, {
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

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiEnLessThan(
    String value, {
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

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiEnBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiEnStartsWith(
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

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiEnEndsWith(
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

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiEnContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ulkeAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiEnMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ulkeAdiEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ulkeAdiEn',
        value: '',
      ));
    });
  }

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeAdiEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ulkeAdiEn',
        value: '',
      ));
    });
  }

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ulkeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ulkeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ulkeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ulkeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ulkeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ulkeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ulkeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ulkeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ulkeId',
        value: '',
      ));
    });
  }

  QueryBuilder<Country, Country, QAfterFilterCondition> ulkeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ulkeId',
        value: '',
      ));
    });
  }
}

extension CountryQueryObject
    on QueryBuilder<Country, Country, QFilterCondition> {}
