BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "email" text NOT NULL,
    "password" text NOT NULL
);


--
-- MIGRATION VERSION FOR todo
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('todo', '20240128212404587', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240128212404587', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
