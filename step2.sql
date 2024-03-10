#データベースの作成
CREATE DATABASE internet_tv;

#テーブルの作成
-- チャンネルテーブル
CREATE TABLE channels (
    channel_id INT PRIMARY KEY,
    channel_name VARCHAR(255)
);

-- 番組スケジュールテーブル
CREATE TABLE schedules (
    schedule_id INT PRIMARY KEY,
    channel_id INT,
    start_time DATETIME,
    end_time DATETIME,
    FOREIGN KEY (channel_id) REFERENCES channels(channel_id)
);

-- チャンネル - 番組関連テーブル
CREATE TABLE channel_programs (
    channel_id INT,
    program_id INT,
    FOREIGN KEY (channel_id) REFERENCES channels(channel_id),
    FOREIGN KEY (program_id) REFERENCES programs(program_id)
);

-- 番組テーブル
CREATE TABLE programs (
    program_id INT PRIMARY KEY,
    title VARCHAR(255),
    detail TEXT
);

-- 番組 - ジャンル関連テーブル
CREATE TABLE program_genres (
    program_id INT,
    genre_id INT,
    FOREIGN KEY (program_id) REFERENCES programs(program_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

-- ジャンルテーブル
CREATE TABLE genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(255)
);

-- 番組 - エピソード関連テーブル
CREATE TABLE program_epidodes (
    program_id INT,
    episode_id INT,
    FOREIGN KEY (program_id) REFERENCES programs(program_id),
    FOREIGN KEY (episode_id) REFERENCES episodes(episode_id)
);

-- エピソードテーブル
CREATE TABLE episodes (
    episode_id INT PRIMARY KEY,
    title VARCHAR(255),
    detail TEXT,
    video_time TIME,
    release_date DATE,
    number_of_view INT,
    season_number INT NULL,
    episode_number INT NULL
);

-- エピソード - スケジュール関連テーブル
CREATE TABLE episode_schedules (
    episode_id INT,
    schedule_id INT,
    FOREIGN KEY (episode_id) REFERENCES episodes(episode_id),
    FOREIGN KEY (schedule_id) REFERENCES schedules(schedule_id)
);

#サンプル値の入力
-- channelsテーブルにサンプル値を挿入
INSERT INTO channels (channel_id, channel_name) VALUES
(1, 'NHK'),
(2, '日本テレビ'),
(3, 'TBS'),
(4, 'フジテレビ'),
(5, 'テレビ朝日');

-- programsテーブルにサンプル値を挿入
INSERT INTO programs (program_id, title, detail) VALUES
(1, 'zip', '日本のニュース番組'),
(2, 'ドラマA', '感動的なドラマ'),
(3, 'バラエティ番組B', '笑いを提供するバラエティ番組'),
(4, 'スポーツ中継C', '人気スポーツの中継'),
(5, '紅白歌合戦', '紅組と白組に分かれ歌合戦'),
(6, '半沢直樹', '池井戸潤最新作'),
(7, 'サザエさん', '国民的アニメ');

-- genresテーブルにサンプル値を挿入
INSERT INTO genres (genre_id, genre_name) VALUES
(1, 'ニュース'),
(2, 'ドラマ'),
(3, 'バラエティ'),
(4, 'スポーツ'),
(5, '音楽'),
(6, 'アニメ');

-- schedulesテーブルにサンプル値を挿入
INSERT INTO schedules (schedule_id, channel_id, start_time, end_time) VALUES
(1, 5, '2024-03-10 18:00:00', '2024-03-10 19:00:00'),
(2, 5, '2024-03-10 20:00:00', '2024-03-10 22:00:00'),
(3, 3, '2024-03-15 21:00:00', '2024-03-15 22:30:00'),
(4, 2, '2024-03-10 19:30:00', '2024-03-10 21:30:00'),
(5, 3, '2024-03-10 22:00:00', '2024-03-10 23:59:59'), 
(6, 3, '2024-03-11 21:00:00', '2024-03-11 22:00:00'),
(7, 3, '2024-03-12 21:00:00', '2024-03-12 22:00:00'),
(8, 3, '2024-03-13 21:00:00', '2024-03-13 22:00:00'),
(9, 1, '2024-03-10 21:00:00', '2024-03-10 22:30:00'),
(10, 4, '2024-03-10 21:00:00', '2024-03-10 22:30:00');

-- channel_programsテーブルにサンプル値を挿入
INSERT INTO channel_programs (channel_id, program_id) VALUES
(1, 5),
(2, 1),
(3, 3),
(3,4),
(3, 6),
(4, 7),
(5, 2);

-- program_genresテーブルにサンプル値を挿入
INSERT INTO program_genres (program_id, genre_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6,2),
(7,6);

-- episodesテーブルにサンプル値を挿入
INSERT INTO episodes (episode_id, title, detail, video_time, release_date, number_of_view, season_number, episode_number) VALUES
(1, '第1話', '感動的なドラマの第1話', '01:30:00', '2024-03-01', 10000, 1, 1),
(2, '第2話', '感動的なドラマの第2話', '01:30:00', '2024-03-08', 12000, 1, 2),
(3, '第1話', '笑いを提供するバラエティ番組の第1話', '01:00:00', '2024-03-05', 8000, 2, 1),
(4, '第100回', 'zip', '01:30:00', '2024-03-15', 11000, 1, 100),
(5, '第1話', '人気スポーツの中継の第1話', '02:00:00', '2024-03-12', 15000, 3, 1),
(6, '第1話', '半沢直樹、銀行に宣戦布告', '00:45:00', '2023-07-17', 1000000, 1, 1),
(7, '第2話', '半沢、敵に囲まれる', '00:45:00', '2023-07-24', 900000, 1, 2),
(8, '第3話', '半沢、逆襲開始', '00:45:00', '2023-07-31', 1100000, 1, 3),
(9, '2023年', '豪華アーティストが出演', '03:00:00', '2023-12-31', 2000000, NULL, NULL),
(10, '第2024話', '家族旅行に行く', '00:30:00', '2024-03-19', 800000, 12, 2024);

-- program_episodesテーブルにサンプル値を挿入
INSERT INTO program_epidodes (program_id, episode_id) VALUES
(1, 4),
(2, 1),
(2, 2),
(3, 3),
(4, 5),
(5, 9),
(6, 6),
(6, 7),
(6, 8),
(7, 10);

-- episode_schedulesテーブルにサンプル値を挿入
INSERT INTO episode_schedules (episode_id, schedule_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);