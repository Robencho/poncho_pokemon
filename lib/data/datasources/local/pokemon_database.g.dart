// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_database.dart';

// ignore_for_file: type=lint
class $PokemonTablesTable extends PokemonTables
    with TableInfo<$PokemonTablesTable, PokemonTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PokemonTablesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, imageUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pokemon_tables';
  @override
  VerificationContext validateIntegrity(Insertable<PokemonTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PokemonTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PokemonTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
    );
  }

  @override
  $PokemonTablesTable createAlias(String alias) {
    return $PokemonTablesTable(attachedDatabase, alias);
  }
}

class PokemonTable extends DataClass implements Insertable<PokemonTable> {
  final int id;
  final String name;
  final String imageUrl;
  const PokemonTable(
      {required this.id, required this.name, required this.imageUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['image_url'] = Variable<String>(imageUrl);
    return map;
  }

  PokemonTablesCompanion toCompanion(bool nullToAbsent) {
    return PokemonTablesCompanion(
      id: Value(id),
      name: Value(name),
      imageUrl: Value(imageUrl),
    );
  }

  factory PokemonTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PokemonTable(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'imageUrl': serializer.toJson<String>(imageUrl),
    };
  }

  PokemonTable copyWith({int? id, String? name, String? imageUrl}) =>
      PokemonTable(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
      );
  PokemonTable copyWithCompanion(PokemonTablesCompanion data) {
    return PokemonTable(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PokemonTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.imageUrl == this.imageUrl);
}

class PokemonTablesCompanion extends UpdateCompanion<PokemonTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> imageUrl;
  final Value<int> rowid;
  const PokemonTablesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PokemonTablesCompanion.insert({
    required int id,
    required String name,
    required String imageUrl,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        imageUrl = Value(imageUrl);
  static Insertable<PokemonTable> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? imageUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (imageUrl != null) 'image_url': imageUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PokemonTablesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? imageUrl,
      Value<int>? rowid}) {
    return PokemonTablesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonTablesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$PokemonDatabase extends GeneratedDatabase {
  _$PokemonDatabase(QueryExecutor e) : super(e);
  $PokemonDatabaseManager get managers => $PokemonDatabaseManager(this);
  late final $PokemonTablesTable pokemonTables = $PokemonTablesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pokemonTables];
}

typedef $$PokemonTablesTableCreateCompanionBuilder = PokemonTablesCompanion
    Function({
  required int id,
  required String name,
  required String imageUrl,
  Value<int> rowid,
});
typedef $$PokemonTablesTableUpdateCompanionBuilder = PokemonTablesCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> imageUrl,
  Value<int> rowid,
});

class $$PokemonTablesTableFilterComposer
    extends Composer<_$PokemonDatabase, $PokemonTablesTable> {
  $$PokemonTablesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));
}

class $$PokemonTablesTableOrderingComposer
    extends Composer<_$PokemonDatabase, $PokemonTablesTable> {
  $$PokemonTablesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));
}

class $$PokemonTablesTableAnnotationComposer
    extends Composer<_$PokemonDatabase, $PokemonTablesTable> {
  $$PokemonTablesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);
}

class $$PokemonTablesTableTableManager extends RootTableManager<
    _$PokemonDatabase,
    $PokemonTablesTable,
    PokemonTable,
    $$PokemonTablesTableFilterComposer,
    $$PokemonTablesTableOrderingComposer,
    $$PokemonTablesTableAnnotationComposer,
    $$PokemonTablesTableCreateCompanionBuilder,
    $$PokemonTablesTableUpdateCompanionBuilder,
    (
      PokemonTable,
      BaseReferences<_$PokemonDatabase, $PokemonTablesTable, PokemonTable>
    ),
    PokemonTable,
    PrefetchHooks Function()> {
  $$PokemonTablesTableTableManager(
      _$PokemonDatabase db, $PokemonTablesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PokemonTablesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PokemonTablesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PokemonTablesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PokemonTablesCompanion(
            id: id,
            name: name,
            imageUrl: imageUrl,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String name,
            required String imageUrl,
            Value<int> rowid = const Value.absent(),
          }) =>
              PokemonTablesCompanion.insert(
            id: id,
            name: name,
            imageUrl: imageUrl,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PokemonTablesTableProcessedTableManager = ProcessedTableManager<
    _$PokemonDatabase,
    $PokemonTablesTable,
    PokemonTable,
    $$PokemonTablesTableFilterComposer,
    $$PokemonTablesTableOrderingComposer,
    $$PokemonTablesTableAnnotationComposer,
    $$PokemonTablesTableCreateCompanionBuilder,
    $$PokemonTablesTableUpdateCompanionBuilder,
    (
      PokemonTable,
      BaseReferences<_$PokemonDatabase, $PokemonTablesTable, PokemonTable>
    ),
    PokemonTable,
    PrefetchHooks Function()>;

class $PokemonDatabaseManager {
  final _$PokemonDatabase _db;
  $PokemonDatabaseManager(this._db);
  $$PokemonTablesTableTableManager get pokemonTables =>
      $$PokemonTablesTableTableManager(_db, _db.pokemonTables);
}
