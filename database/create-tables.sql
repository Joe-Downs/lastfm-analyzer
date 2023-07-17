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
  artist_mbid text PRIMARY KEY NOT NULL,
  artist_name text,
  artist_iamge text
);

CREATE TABLE IF NOT EXISTS albums (
  album_mbid text PRIMARY KEY NOT NULL,
  album_name text,
  album_image text,
  artist_mbid text,
  CONSTRAINT fk_track_artist_mbid FOREIGN KEY (artist_mbid) REFERENCES artists (artist_mbid)
);

CREATE TABLE IF NOT EXISTS tracks (
  track_mbid text PRIMARY KEY NOT NULL,
  track_name text,
  album_mbid text,
  artist_mbid text,
  CONSTRAINT fk_track_album_mbid FOREIGN KEY (album_mbid) REFERENCES albums (album_mbid),
  CONSTRAINT fk_track_artist_mbid FOREIGN KEY (artist_mbid) REFERENCES artists (artist_mbid)
);

CREATE TABLE IF NOT EXISTS scrobbles (
  scrobble_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id int,
  track_mbid text,
  scrobble_time timestamptz,
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (user_id),
  CONSTRAINT fk_track_mbid FOREIGN KEY (track_mbid) REFERENCES tracks (track_mbid)
);

CREATE TABLE IF NOT EXISTS genres (
  genre_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  genre_name text
);

CREATE TABLE IF NOT EXISTS track_genres (
  relation_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  track_mbid text,
  genre_id int,
  CONSTRAINT fk_track_mbid FOREIGN KEY (track_mbid) REFERENCES tracks (track_mbid),
  CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES genres (genre_id)
);

