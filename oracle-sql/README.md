# Oracle Database SQL
## 目次
- [表領域ごとのテーブル数](#表領域ごとのテーブル数)
- [カラム一覧](#カラム一覧)
- [テーブルに設定されている制約一覧](#制約一覧)

## 表領域ごとのテーブル数
```sql
SELECT
  tablespace_name,
  COUNT(*)
FROM user_tables
GROUP BY tablespace_name
ORDER BY COUNT(*) DESC;
```

## カラム一覧
```sql
SET LINESIZE 1000
SET PAGESIZE 50
COLUMN column_name FORMAT a25
COLUMN data_type FORMAT a20
COLUMN nullable FORMAT a10
COLUMN data_default FORMAT a20
SELECT
  column_name,
  data_type,
  data_length,
  data_precision,
  data_scale,
  nullable,
  data_default
FROM user_tab_columns
WHERE table_name = UPPER('&table')
ORDER BY column_id;
```

## 制約一覧
```sql
COLUMN column_name FORMAT a25
COLUMN constraint_name FORMAT a30
COLUMN constraint_type FORMAT a18
SELECT
  utc.column_name,
  ucc.constraint_name,
  uc.constraint_type
-- FROM user_cons_columns ucc
FROM user_tab_columns utc
JOIN user_cons_columns ucc
  ON utc.table_name = ucc.table_name
  AND utc.column_name = ucc.column_name
JOIN user_constraints uc
  ON uc.table_name = ucc.table_name
  AND uc.constraint_name = ucc.constraint_name
WHERE ucc.table_name = UPPER('&table')
ORDER BY utc.column_id;
```
