-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP table if exists attackers_data;
DROP table if exists physical_data;
DROP table if exists goalkeeper_data;
DROP table if exists defensive_data;
DROP table if exists player_info;

CREATE TABLE "player_info" (
    "id" INT   NOT NULL,
    "player_name" VARCHAR(255)   NOT NULL,
    "birthday" DATE   NOT NULL,
    "age" INT   NOT NULL,
    "height" FLOAT   NOT NULL,
    "weight_kgs" FLOAT   NOT NULL,
    "overall_rating" FLOAT   NOT NULL,
    "potential" FLOAT   NOT NULL,
    "positions" VARCHAR(255)   NOT NULL,
    "nationality" VARCHAR(255)   NOT NULL,
    "value_euro" FLOAT   NOT NULL,
    "wage_euro" FLOAT   NOT NULL,
    CONSTRAINT "pk_player_info" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "attackers_data" (
    "id" INT   NOT NULL,
    "crossing" FLOAT   NOT NULL,
    "finishing" FLOAT   NOT NULL,
    "heading_accuracy" FLOAT   NOT NULL,
    "short_passing" FLOAT   NOT NULL,
    "volleys" FLOAT   NOT NULL,
    "dribbling" FLOAT   NOT NULL,
    "curve" FLOAT   NOT NULL,
    "free_kick_accuracy" FLOAT   NOT NULL,
    "long_passing" FLOAT   NOT NULL,
    "ball_control" FLOAT   NOT NULL,
    "shot_power" FLOAT   NOT NULL,
    "long_shots" FLOAT   NOT NULL
);

CREATE TABLE "physical_data" (
    "id" INT   NOT NULL,
    "reactions" FLOAT   NOT NULL,
    "balance" FLOAT   NOT NULL,
    "jumping" FLOAT   NOT NULL,
    "stamina" FLOAT   NOT NULL,
    "strength" FLOAT   NOT NULL,
    "aggression" FLOAT   NOT NULL
);

CREATE TABLE "goalkeeper_data" (
    "id" INT   NOT NULL,
    "agility" FLOAT   NOT NULL,
    "positioning" FLOAT   NOT NULL,
    "reactions" FLOAT   NOT NULL,
    "jumping" FLOAT   NOT NULL,
    "strength" FLOAT   NOT NULL,
    "balance" FLOAT   NOT NULL,
    "stamina" FLOAT   NOT NULL
);

CREATE TABLE "defensive_data" (
    "id" INT   NOT NULL,
    "aggression" FLOAT   NOT NULL,
    "interceptions" FLOAT   NOT NULL,
    "positioning" FLOAT   NOT NULL,
    "marking" FLOAT   NOT NULL,
    "long_shots" FLOAT   NOT NULL,
    "standing_tackle" FLOAT   NOT NULL,
    "short_passing" FLOAT   NOT NULL,
    "long_passing" FLOAT   NOT NULL,
    "sliding_tackle" FLOAT   NOT NULL
);

ALTER TABLE "attackers_data" ADD CONSTRAINT "fk_attackers_data_id" FOREIGN KEY("id")
REFERENCES "player_info" ("id");

ALTER TABLE "physical_data" ADD CONSTRAINT "fk_physical_data_id" FOREIGN KEY("id")
REFERENCES "player_info" ("id");

ALTER TABLE "goalkeeper_data" ADD CONSTRAINT "fk_goalkeeper_data_id" FOREIGN KEY("id")
REFERENCES "player_info" ("id");

ALTER TABLE "defensive_data" ADD CONSTRAINT "fk_defensive_data_id" FOREIGN KEY("id")
REFERENCES "player_info" ("id");
