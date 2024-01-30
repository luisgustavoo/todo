BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "todo" (
    "id" serial PRIMARY KEY,
    "description" text NOT NULL,
    "isDone" boolean NOT NULL
);


--
-- MIGRATION VERSION FOR todo
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('todo', '20240128031733787-v1-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240128031733787-v1-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
