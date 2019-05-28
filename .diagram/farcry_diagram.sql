CREATE TABLE "player"
(
    "player_id" UUID NOT NULL DEFAULT uuid_generate_v1() PRIMARY KEY,
    "player_name" TEXT UNIQUE NOT NULL,
    "email" TEXT UNIQUE NOT NULL,
    "password" VARCHAR(35) NOT NULL,
    "verified" BOOL NOT NULL
);

CREATE TABLE "setting"
(
    "player_id" UUID NOT NULL DEFAULT uuid_generate_v1() PRIMARY KEY,
    "model" TEXT NOT NULL DEFAULT "objects/characters/pmodels/hero/hero_mp.cgf",
    "color" INTEGER NOT NULL DEFAULT 9,
    "key" JSON
);

CREATE TABLE match
(
    match_id UUID NOT NULL DEFAULT uuid_generate_v1(),
    start_time TIMESTAMPTZ(3) NOT NULL,
    end_time TIMESTAMPTZ(3) NOT NULL,
    game_mode text NOT NULL,
    map_name text NOT NULL
);

CREATE TABLE match_frag
(
    match_id uuid NOT NULL,
    frag_time TIMESTAMPTZ(3) NOT NULL,
    killer_name text NOT NULL,
    victim_name text,
    weapon_code text
);

-- Alter table "setting"
ALTER TABLE setting ADD CONSTRAINT fk_setting_player_id FOREIGN KEY(player_id) REFERENCES player(player_id) ON UPDATE CASCADE;

-- Alter table "match_frag"
ALTER TABLE match_frag ADD CONSTRAINT fk_match_frag_match_id FOREIGN KEY(match_id) REFERENCES match(match_id) ON UPDATE CASCADE;

-- For tightening relationship between user & match_frag (optional)
-- ALTER TABLE "match_frag" ADD CONSTRAINT "fk_match_frag_killer_name" FOREIGN KEY ("killer_name") REFERENCES "user" ("player_name") ON DELETE RESTRICT ON UPDATE CASCADE;
-- ALTER TABLE "match_frag" ADD CONSTRAINT "fk_match_frag_victim_name" FOREIGN KEY ("victim_name") REFERENCES "user" ("player_name") ON DELETE RESTRICT ON UPDATE CASCADE;
