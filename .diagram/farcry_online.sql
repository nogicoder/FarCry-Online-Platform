CREATE TABLE "user" (
"user_id" uuid NOT NULL,
"player_name" text NOT NULL,
"email" text NOT NULL,
"password" text NOT NULL,
"verified" bool NOT NULL,
PRIMARY KEY ("user_id") 
)
WITHOUT OIDS;
CREATE TABLE "setting" (
"user_id" uuid NOT NULL,
"mode" text,
"color" text,
"key" json,
PRIMARY KEY ("user_id") 
)
WITHOUT OIDS;
CREATE TABLE "match" (
"match_id" uuid NOT NULL,
"start_time" time,
"end_time" time,
"game_mode" text,
"map_game" text,
PRIMARY KEY ("match_id") 
)
WITHOUT OIDS;
CREATE TABLE "match_frag" (
"match_id" uuid NOT NULL,
"frag_time" time NOT NULL,
"killer_name" text NOT NULL,
"victim_name" text,
"weapon_code" text,
PRIMARY KEY ("match_id") 
)
WITHOUT OIDS;

ALTER TABLE "setting" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "match_frag" ADD CONSTRAINT "fk_match_frag_match_id" FOREIGN KEY ("match_id") REFERENCES "match" ("match_id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "match_frag" ADD CONSTRAINT "fk_match_frag_killer_name" FOREIGN KEY ("killer_name") REFERENCES "user" ("player_name") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "match_frag" ADD CONSTRAINT "fk_match_frag_victim_name" FOREIGN KEY ("victim_name") REFERENCES "user" ("player_name") ON DELETE RESTRICT ON UPDATE CASCADE;

