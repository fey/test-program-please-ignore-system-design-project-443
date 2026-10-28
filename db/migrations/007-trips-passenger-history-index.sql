-- История поездок пассажира: WHERE passenger_id = $1 ORDER BY created_at DESC LIMIT 20.
-- Составной индекс отдаёт строки одного пассажира сразу в нужном порядке.
-- IF NOT EXISTS делает повторный запуск миграции безопасным: migrate.ts применяет все файлы заново.
CREATE INDEX IF NOT EXISTS trips_passenger_created_at_idx
    ON trips (passenger_id, created_at DESC);
