// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const StateModelSchema = Schema(
  name: r'StateModel',
  id: 7073699290220819961,
  properties: {
    r'ilceAdi': PropertySchema(
      id: 0,
      name: r'ilceAdi',
      type: IsarType.string,
    ),
    r'ilceAdiEn': PropertySchema(
      id: 1,
      name: r'ilceAdiEn',
      type: IsarType.string,
    ),
    r'ilceId': PropertySchema(
      id: 2,
      name: r'ilceId',
      type: IsarType.string,
    )
  },
  estimateSize: _stateModelEstimateSize,
  serialize: _stateModelSerialize,
  deserialize: _stateModelDeserialize,
  deserializeProp: _stateModelDeserializeProp,
);

int _stateModelEstimateSize(
  StateModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.ilceAdi.length * 3;
  bytesCount += 3 + object.ilceAdiEn.length * 3;
  bytesCount += 3 + object.ilceId.length * 3;
  return bytesCount;
}

void _stateModelSerialize(
  StateModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.ilceAdi);
  writer.writeString(offsets[1], object.ilceAdiEn);
  writer.writeString(offsets[2], object.ilceId);
}

StateModel _stateModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StateModel();
  object.ilceAdi = reader.readString(offsets[0]);
  object.ilceAdiEn = reader.readString(offsets[1]);
  object.ilceId = reader.readString(offsets[2]);
  return object;
}

P _stateModelDeserializeProp<P>(
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

extension StateModelQueryFilter
    on QueryBuilder<StateModel, StateModel, QFilterCondition> {
  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceAdiEqualTo(
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition>
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceAdiLessThan(
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceAdiBetween(
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceAdiStartsWith(
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceAdiEndsWith(
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceAdiContains(
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceAdiMatches(
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceAdiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ilceAdi',
        value: '',
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition>
      ilceAdiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ilceAdi',
        value: '',
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceAdiEnEqualTo(
    String value, {
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition>
      ilceAdiEnGreaterThan(
    String value, {
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceAdiEnLessThan(
    String value, {
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceAdiEnBetween(
    String lower,
    String upper, {
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition>
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceAdiEnEndsWith(
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceAdiEnContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ilceAdiEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceAdiEnMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ilceAdiEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition>
      ilceAdiEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ilceAdiEn',
        value: '',
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition>
      ilceAdiEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ilceAdiEn',
        value: '',
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceIdEqualTo(
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceIdGreaterThan(
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceIdLessThan(
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceIdBetween(
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceIdStartsWith(
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceIdEndsWith(
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceIdContains(
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceIdMatches(
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

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> ilceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ilceId',
        value: '',
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition>
      ilceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ilceId',
        value: '',
      ));
    });
  }
}

extension StateModelQueryObject
    on QueryBuilder<StateModel, StateModel, QFilterCondition> {}
