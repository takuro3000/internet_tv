#問1
SELECT title,number_of_view
FROM episodes
ORDER BY number_of_view DESC
LIMIT 3;

#問2
SELECT programs.title,season_number,episode_number,episodes.title,number_of_view
FROM program_episodes
INNER JOIN programs ON program_episodes.program_id = programs.program_id
INNER JOIN episodes ON program_episodes.episode_id = episodes.episode_id
ORDER BY number_of_view DESC
LIMIT 3;

#問3
SELECT channel_name,start_time,end_time,season_number,episode_number,episodes.title,episodes.detail
FROM episode_schedules
INNER JOIN episodes ON episode_schedules.episode_id = episodes.episode_id
INNER JOIN schedules ON episode_schedules.schedule_id = schedules.schedule_id
INNER JOIN channels ON schedules.channel_id = channels.channel_id
WHERE start_time BETWEEN '2024-03-10 00:00:00' AND '2024-03-10 23:59:59';

#問4
SELECT start_time,end_time,season_number,episode_number,episodes.title,episodes.detail
FROM episode_schedules
INNER JOIN episodes ON episode_schedules.episode_id = episodes.episode_id
INNER JOIN schedules ON episode_schedules.schedule_id = schedules.schedule_id
WHERE start_time BETWEEN '2024-03-10 00:00:00' AND '2024-03-16 23:59:59'
AND channel_id = 3
ORDER BY start_time;

#問5
SELECT programs.program_id,programs.title,SUM(number_of_view)
FROM episode_schedules
INNER JOIN episodes ON episode_schedules.episode_id = episodes.episode_id
INNER JOIN schedules ON episode_schedules.schedule_id = schedules.schedule_id
INNER JOIN program_episodes ON episodes.episode_id = program_episodes.episode_id
INNER JOIN programs ON program_episodes.program_id = programs.program_id
WHERE start_time BETWEEN '2024-03-10 00:00:00' AND '2024-03-16 23:59:59'
GROUP BY programs.program_id
ORDER BY SUM(number_of_view) DESC
LIMIT 2;

#問6
SELECT s2.genre_name, s2.title, s2.view_number
FROM (
    SELECT programs.program_id, genres.genre_id, genre_name, programs.title, AVG(number_of_view) AS view_number
    FROM program_genres
    INNER JOIN programs ON programs.program_id = program_genres.program_id
    INNER JOIN genres ON genres.genre_id = program_genres.genre_id
    INNER JOIN program_episodes ON program_episodes.program_id = programs.program_id
    INNER JOIN episodes ON program_episodes.episode_id = episodes.episode_id
    GROUP BY programs.program_id, genres.genre_id
) AS s2
INNER JOIN (
    SELECT s1.genre_id, s1.genre_name, MAX(avg_number_of_view) AS max_avg_number_of_view
    FROM (
        SELECT programs.program_id, genres.genre_id, genre_name, programs.title, AVG(number_of_view) AS avg_number_of_view
        FROM program_genres
        INNER JOIN programs ON programs.program_id = program_genres.program_id
        INNER JOIN genres ON genres.genre_id = program_genres.genre_id
        INNER JOIN program_episodes ON program_episodes.program_id = programs.program_id
        INNER JOIN episodes ON program_episodes.episode_id = episodes.episode_id
        GROUP BY programs.program_id, genres.genre_id
    ) AS s1
    GROUP BY s1.genre_id
) AS s3
ON s2.genre_id = s3.genre_id AND s2.view_number = s3.max_avg_number_of_view;


