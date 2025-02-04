-- CREATE TABLE = créer les tables (qui vont recevoir les données)
-- === DATA DEFINITION LAYER === (définir des tables)

BEGIN;

DROP TABLE IF EXISTS "card_has_tag", "tag", "card", "list";

CREATE TABLE "list" (
  "id" SERIAL PRIMARY KEY,
  "title" TEXT NOT NULL,
  "position" INTEGER NOT NULL DEFAULT 1,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE "card" (
  "id" SERIAL PRIMARY KEY,
  "content" TEXT NOT NULL,
  "position" INTEGER NOT NULL DEFAULT 1,
  "color" VARCHAR(7) DEFAULT '#ffffff',
  "list_id" INTEGER NOT NULL REFERENCES "list"("id") ON DELETE CASCADE,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE "tag" (
  "id" SERIAL PRIMARY KEY,
  "name" TEXT NOT NULL,
  "color" VARCHAR(7) DEFAULT '#ffffff',
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE "card_has_tag" (
  "id" SERIAL PRIMARY KEY,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ,
  "tag_id" INTEGER NOT NULL REFERENCES "tag"("id") ON DELETE CASCADE,
  "card_id" INTEGER NOT NULL REFERENCES "card"("id") ON DELETE CASCADE,
  UNIQUE ("card_id", "tag_id")
);

COMMIT;
