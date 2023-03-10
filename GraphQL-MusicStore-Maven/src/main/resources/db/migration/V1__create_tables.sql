CREATE TABLE tracks (
    track_id BIGINT NOT NULL AUTO_INCREMENT,
    movie_title varchar(255) NOT NULL,
    track_title varchar(255) NOT NULL,
    tempo_name ENUM('fast', 'medium', 'slow') NOT NULL,
    tempo_bpm INT NOT NULL,
    inventory INT,
    created TIMESTAMP,
    PRIMARY KEY (track_id)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE composers (
    composer_id BIGINT NOT NULL AUTO_INCREMENT,
    composer_name varchar(255) NOT NULL,
    PRIMARY KEY (composer_id)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE tracks_composers (
    track_id BIGINT NOT NULL,
    composer_id BIGINT NOT NULL,
    PRIMARY KEY (track_id, composer_id),
    FOREIGN KEY (track_id) REFERENCES tracks(track_id) ON DELETE CASCADE,
    FOREIGN KEY (composer_id) REFERENCES composers(composer_id) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE instruments (
    instrument_id BIGINT,
    instrument_group varchar(255),
    instrument_name varchar(255),
    PRIMARY KEY (instrument_id)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE tracks_instruments (
    track_id BIGINT NOT NULL,
    instrument_id BIGINT NOT NULL,
    PRIMARY KEY (track_id, instrument_id),
    FOREIGN KEY (track_id) REFERENCES tracks(track_id) ON DELETE CASCADE,
    FOREIGN KEY (instrument_id) REFERENCES instruments(instrument_id) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;
