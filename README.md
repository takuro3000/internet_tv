# 手順のドキュメント
データベース設計についてまとめています。

ここでは、テーブル設計について概要を説明します。

データベース作成やサンプル値入力などの具体的なコードはstep2.sqlに書いています。

# テーブル設計
各テーブルのテーブル名とカラム名、主キーと外部キーについてまとめています。

**channels**

・channel_id（主キー）

・channel_name

**schedules**
・schedule_id（主キー）

・channel_id(外部キー）

・start_time

・end_time

**channel_programs**

・channel_id（外部キー）

・program_id（外部キー）

**programs**
・program_id(主キー）

・title

・detail

**program_genres**

・program_id（外部キー）

・genre_id（外部キー）

**genres**

・genre_id（主キー）

・genre_name

**program_episodes**

・program_id（外部キー）

・episode_id（外部キー）

**episodes**
・episode_id（主キー）

・season_number

・episode_number

・title 

・detai

・video_time

・release_date

・number_of_view

**episode_schdules**

・episode_id（外部キー）

・schdule_id（外部キー）


