CREATE TABLE IF NOT EXISTS users (
  user_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_name text,
  user_image text,
  registered timestamptz,
  country text,
  playcount int,
  last_updated timestamptz
  );

CREATE TABLE IF NOT EXISTS artists (
  artist_id int PRIMARY KEY NOT NULL,
  artist_name text,
  artist_iamge text
);

CREATE TABLE IF NOT EXISTS albums (
  album_id int PRIMARY KEY NOT NULL,
  album_name text,
  album_image text,
  artist_id int,
  CONSTRAINT fk_track_artist_id FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
);

CREATE TABLE IF NOT EXISTS tracks (
  track_id int PRIMARY KEY NOT NULL,
  track_name text,
  album_id int,
  artist_id int,
  CONSTRAINT fk_track_album_id FOREIGN KEY (album_id) REFERENCES albums (album_id),
  CONSTRAINT fk_track_artist_id FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
);

CREATE TABLE IF NOT EXISTS scrobbles (
  scrobble_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id int,
  track_id int,
  scrobble_time timestamptz,
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (user_id),
  CONSTRAINT fk_track_id FOREIGN KEY (track_id) REFERENCES tracks (track_id)
);

/* Because of Last.fm's unreliable Musicbrianz IDs, it would take way too much
  work to get a good genre system working. I would like to do it at a later date
  tho.

CREATE TABLE IF NOT EXISTS genres (
  genre_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  genre_name text
);

CREATE TABLE IF NOT EXISTS track_genres (
  relation_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  track_id int,
  genre_id int,
  CONSTRAINT fk_track_id FOREIGN KEY (track_id) REFERENCES tracks (track_id),
  CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES genres (genre_id)
);
*/
