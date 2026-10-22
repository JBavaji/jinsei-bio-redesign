BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "b2b_sample_request" (
    "id" serial PRIMARY KEY,
    "strainId" text NOT NULL,
    "fullName" text NOT NULL,
    "email" text NOT NULL,
    "company" text NOT NULL,
    "formulationFormat" text NOT NULL,
    "clinicalScope" text,
    "trackingId" text NOT NULL,
    "submittedAt" timestamp without time zone NOT NULL,
    "status" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "collaboration_inquiry" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "email" text NOT NULL,
    "organization" text,
    "partnershipTrack" text NOT NULL,
    "message" text NOT NULL,
    "trackingId" text NOT NULL,
    "submittedAt" timestamp without time zone NOT NULL,
    "status" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "science_header_metric" (
    "id" serial PRIMARY KEY,
    "iconKey" text NOT NULL,
    "value" text NOT NULL,
    "label" text NOT NULL,
    "accentColorHex" text NOT NULL,
    "displayOrder" integer NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "science_step" (
    "id" serial PRIMARY KEY,
    "stepNumber" integer NOT NULL,
    "title" text NOT NULL,
    "subtitle" text NOT NULL,
    "description" text NOT NULL,
    "category" text NOT NULL,
    "iconKey" text NOT NULL,
    "metricValue" text NOT NULL,
    "metricLabel" text NOT NULL,
    "imageUrl" text NOT NULL,
    "displayOrder" integer NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "solution_card" (
    "id" serial PRIMARY KEY,
    "solutionId" text NOT NULL,
    "categoryTag" text NOT NULL,
    "title" text NOT NULL,
    "subtitle" text NOT NULL,
    "description" text NOT NULL,
    "iconKey" text NOT NULL,
    "category" text NOT NULL,
    "formulationCount" text NOT NULL,
    "keyBenefit" text NOT NULL,
    "efficacyMetric" text NOT NULL,
    "bulletPoints" json NOT NULL,
    "actionCtaText" text NOT NULL,
    "caseStudyUrl" text NOT NULL,
    "imageUrl" text,
    "darkImageUrl" text,
    "lightImageUrl" text,
    "displayOrder" integer NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "solution_metric" (
    "id" serial PRIMARY KEY,
    "iconKey" text NOT NULL,
    "value" text NOT NULL,
    "label" text NOT NULL,
    "accentColorHex" text NOT NULL,
    "displayOrder" integer NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "team_member" (
    "id" serial PRIMARY KEY,
    "memberId" text NOT NULL,
    "name" text NOT NULL,
    "role" text NOT NULL,
    "categoryTag" text NOT NULL,
    "category" text NOT NULL,
    "academicCredential" text NOT NULL,
    "areaOfExpertise" text NOT NULL,
    "imageUrl" text,
    "displayOrder" integer NOT NULL
);


--
-- MIGRATION VERSION FOR jinsei_bio_redesign
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('jinsei_bio_redesign', '20261022041133122-complete-postgresql-schema', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261022041133122-complete-postgresql-schema', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
