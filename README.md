# oracle-db-sqls
## 表領域ごとのテーブル数
```sql
select
  tablespace_name,
  count(*)
from user_tables
group by tablespace_name;
```
<details>
  <summary>
    all_users
  </summary>
  
```sql
select
tablespace_name,
  count(*)
from all_tables
group by tablespace_name;
```
</details>
<details>
  <summary>
    dba_users
  </summary>
  
```sql
select
tablespace_name,
  count(*)
from dba_tables
group by tablespace_name;
```
</details>
