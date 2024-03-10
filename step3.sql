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