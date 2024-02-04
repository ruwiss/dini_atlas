// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFavouriteCollection on Isar {
  IsarCollection<Favourite> get favourites => this.collection();
}

const FavouriteSchema = CollectionSchema(
  name: r'Favourite',
  id: 2882997178178307874,
  properties: {
    r'folder': PropertySchema(
      id: 0,
      name: r'folder',
      type: IsarType.string,
    ),
    r'number': PropertySchema(
      id: 1,
      name: r'number',
      type: IsarType.long,
    ),
    r'text1': PropertySchema(
      id: 2,
      name: r'text1',
      type: IsarType.string,
    ),
    r'text2': PropertySchema(
      id: 3,
      name: r'text2',
      type: IsarType.string,
    ),
    r'text3': PropertySchema(
      id: 4,
      name: r'text3',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 5,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _favouriteEstimateSize,
  serialize: _favouriteSerialize,
  deserialize: _favouriteDeserialize,
  deserializeProp: _favouriteDeserializeProp,
  idName: r'id',
  indexes: {
    r'folder': IndexSchema(
      id: 4117413726152065984,
      name: r'folder',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'folder',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _favouriteGetId,
  getLinks: _favouriteGetLinks,
  attach: _favouriteAttach,
  version: '3.1.0+1',
);

int _favouriteEstimateSize(
  Favourite object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.folder.length * 3;
  {
    final value = object.text1;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.text2;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.text3;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _favouriteSerialize(
  Favourite object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.folder);
  writer.writeLong(offsets[1], object.number);
  writer.writeString(offsets[2], object.text1);
  writer.writeString(offsets[3], object.text2);
  writer.writeString(offsets[4], object.text3);
  writer.writeString(offsets[5], object.type);
}

Favourite _favouriteDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Favourite();
  object.folder = reader.readString(offsets[0]);
  object.id = id;
  object.number = reader.readLong(offsets[1]);
  object.text1 = reader.readStringOrNull(offsets[2]);
  object.text2 = reader.readStringOrNull(offsets[3]);
  object.text3 = reader.readStringOrNull(offsets[4]);
  object.type = reader.readString(offsets[5]);
  return object;
}

P _favouriteDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _favouriteGetId(Favourite object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _favouriteGetLinks(Favourite object) {
  return [];
}

void _favouriteAttach(IsarCollection<dynamic> col, Id id, Favourite object) {
  object.id = id;
}

extension FavouriteQueryWhereSort
    on QueryBuilder<Favourite, Favourite, QWhere> {
  QueryBuilder<Favourite, Favourite, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FavouriteQueryWhere
    on QueryBuilder<Favourite, Favourite, QWhereClause> {
  QueryBuilder<Favourite, Favourite, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> idBetween(
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

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> folderEqualTo(
      String folder) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'folder',
        value: [folder],
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> folderNotEqualTo(
      String folder) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'folder',
              lower: [],
              upper: [folder],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'folder',
              lower: [folder],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'folder',
              lower: [folder],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'folder',
              lower: [],
              upper: [folder],
              includeUpper: false,
            ));
      }
    });
  }
}

extension FavouriteQueryFilter
    on QueryBuilder<Favourite, Favourite, QFilterCondition> {
  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> folderEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'folder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> folderGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'folder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> folderLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'folder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> folderBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'folder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> folderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'folder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> folderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'folder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> folderContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'folder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> folderMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'folder',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> folderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'folder',
        value: '',
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> folderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'folder',
        value: '',
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> numberEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> numberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> numberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> numberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'number',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'text1',
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'text1',
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text1EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text1GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text1LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text1Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'text1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'text1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'text1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text1Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text1Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text1',
        value: '',
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text1',
        value: '',
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'text2',
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'text2',
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text2EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text2GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text2LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text2Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'text2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'text2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'text2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text2Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text2Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text2',
        value: '',
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text2',
        value: '',
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text3IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'text3',
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text3IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'text3',
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text3EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text3GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text3LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text3Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'text3',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text3StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'text3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text3EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'text3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text3Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text3Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text3',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text3IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text3',
        value: '',
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> text3IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text3',
        value: '',
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> typeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension FavouriteQueryObject
    on QueryBuilder<Favourite, Favourite, QFilterCondition> {}

extension FavouriteQueryLinks
    on QueryBuilder<Favourite, Favourite, QFilterCondition> {}

extension FavouriteQuerySortBy on QueryBuilder<Favourite, Favourite, QSortBy> {
  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByFolder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'folder', Sort.asc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByFolderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'folder', Sort.desc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.asc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.desc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByText1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text1', Sort.asc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByText1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text1', Sort.desc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByText2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text2', Sort.asc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByText2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text2', Sort.desc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByText3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text3', Sort.asc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByText3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text3', Sort.desc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension FavouriteQuerySortThenBy
    on QueryBuilder<Favourite, Favourite, QSortThenBy> {
  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByFolder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'folder', Sort.asc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByFolderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'folder', Sort.desc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.asc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.desc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByText1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text1', Sort.asc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByText1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text1', Sort.desc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByText2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text2', Sort.asc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByText2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text2', Sort.desc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByText3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text3', Sort.asc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByText3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text3', Sort.desc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension FavouriteQueryWhereDistinct
    on QueryBuilder<Favourite, Favourite, QDistinct> {
  QueryBuilder<Favourite, Favourite, QDistinct> distinctByFolder(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'folder', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'number');
    });
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctByText1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctByText2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctByText3(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text3', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension FavouriteQueryProperty
    on QueryBuilder<Favourite, Favourite, QQueryProperty> {
  QueryBuilder<Favourite, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Favourite, String, QQueryOperations> folderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'folder');
    });
  }

  QueryBuilder<Favourite, int, QQueryOperations> numberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'number');
    });
  }

  QueryBuilder<Favourite, String?, QQueryOperations> text1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text1');
    });
  }

  QueryBuilder<Favourite, String?, QQueryOperations> text2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text2');
    });
  }

  QueryBuilder<Favourite, String?, QQueryOperations> text3Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text3');
    });
  }

  QueryBuilder<Favourite, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
