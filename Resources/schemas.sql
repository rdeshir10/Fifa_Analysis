-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE IF EXISTS attackers_data;
DROP TABLE IF EXISTS physical_data;
DROP TABLE IF EXISTS goalkeeper_data;	
DROP TABLE IF EXISTS defensive_data;
DROP TABLE IF EXISTS player_info;

CREATE TABLE "player_info" (
    "id" INT   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "height_cm" FLOAT   NOT NULL,
    "weight_kgs" FLOAT   NOT NULL,
    "overall_rating" INT   NOT NULL,
    "potential" INT   NOT NULL,
    "nationality" VARCHAR(255)   NOT NULL,
    "value_euro" FLOAT   NOT NULL,
    "wage_euro" FLOAT   NOT NULL,
    "age" INT   NOT NULL,
    "position" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_player_info" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "attackers_data" (
    "id" INT   NOT NULL,
    "crossing" INT   NOT NULL,
    "finishing" INT   NOT NULL,
    "heading_accuracy" INT   NOT NULL,
    "short_passing" INT   NOT NULL,
    "volleys" INT   NOT NULL,
    "dribbling" INT   NOT NULL,
    "curve" INT   NOT NULL,
    "freekick_accuracy" INT   NOT NULL,
    "long_passing" INT   NOT NULL,
    "ball_control" INT   NOT NULL,
    "shot_power" INT   NOT NULL,
    "long_shots" INT   NOT NULL
);

CREATE TABLE "physical_data" (
    "id" INT   NOT NULL,
    "reactions" INT   NOT NULL,
    "balance" INT   NOT NULL,
    "jumping" INT   NOT NULL,
    "stamina" INT   NOT NULL,
    "strength" INT   NOT NULL,
    "aggression" INT   NOT NULL
);

CREATE TABLE "goalkeeper_data" (
    "id" INT   NOT NULL,
    "agility" INT   NOT NULL,
    "positioning" INT   NOT NULL,
    "reactions" INT   NOT NULL,
    "jumping" INT   NOT NULL,
    "strength" INT   NOT NULL,
    "balance" INT   NOT NULL,
    "stamina" INT   NOT NULL
);

CREATE TABLE "defensive_data" (
    "id" INT   NOT NULL,
    "aggression" INT   NOT NULL,
    "interceptions" INT   NOT NULL,
    "positioning" INT   NOT NULL,
    "marking" INT   NOT NULL,
    "long_shots" INT   NOT NULL,
    "standing_tackle" INT   NOT NULL,
    "short_passing" INT   NOT NULL,
    "long_passing" INT   NOT NULL,
    "sliding_tackle" INT   NOT NULL
);

ALTER TABLE "attackers_data" ADD CONSTRAINT "fk_attackers_data_id" FOREIGN KEY("id")
REFERENCES "player_info" ("id");

ALTER TABLE "physical_data" ADD CONSTRAINT "fk_physical_data_id" FOREIGN KEY("id")
REFERENCES "player_info" ("id");

ALTER TABLE "goalkeeper_data" ADD CONSTRAINT "fk_goalkeeper_data_id" FOREIGN KEY("id")
REFERENCES "player_info" ("id");

ALTER TABLE "defensive_data" ADD CONSTRAINT "fk_defensive_data_id" FOREIGN KEY("id")
REFERENCES "player_info" ("id");

