use snabi;
create table if not exists facilities (
  id bigint primary key,
  city_id bigint not null,
  corporation_id bigint not null,
  name varchar(20) not null,
  type varchar(20) not null,
  message varchar(300) not null,
  open_at timestamp not null,
  mental_disability_flag boolean default 0,
  physical_disability_flag boolean default 0,
  developmental_disability_flag boolean default 0,
  intellectual_disability_flag boolean default 0,
  intractable_desease_flag boolean default 0,
  other_disability_flag boolean default 0,
  capacity integer default 0,
  address varchar(300) not null,
  post_code integer not null,
  tel_number integer not null,
  contracted_display_flag boolean default 0,
  web_inquiry_available_flag boolean default 0,
  tel_inquiry_avaiabl_flag boolean default 0,
  latlon geometry,
  created_at timestamp,
  updated_at timestamp
);

create table if not exists railway_routes (
  id bigint PRIMARY KEY,
  name varchar(100),
  created_at timestamp,
  updated_at timestamp
);

create table if not exists railway_stations (
  id bigint PRIMARY KEY,
  railway_station_id bigint,
  name varchar(100),
  latlon geometry,
  created_at timestamp,
  updated_at timestamp
);

create table if not exists prefectures (
  id bigint PRIMARY KEY,
  name varchar(10),
  created_at timestamp,
  updated_at timestamp
);

create table if not exists regions (
  id bigint PRIMARY KEY,
  prefecture_id bigint,
  name varchar(10),
  created_at timestamp,
  updated_at timestamp
);

create table if not exists cities (
  id bigint PRIMARY KEY,
  prefecture_id bigint,
  region_id bigint,
  name varchar(50),
  created_at timestamp,
  updated_at timestamp
);

create table if not exists tags (
  id bigint PRIMARY KEY,
  name varchar(10),
  created_at timestamp,
  updated_at timestamp
);

create table if not exists facilities_has_tags (
  id bigint PRIMARY KEY,
  tag_id bigint,
  facility_id bigint,
  created_at timestamp,
  updated_at timestamp
);

create table if not exists contracts (
  id bigint PRIMARY KEY,
  facility_id bigint,
  price integer,
  plan varchar(10),
  start_at timestamp,
  end_at timestamp,
  created_at timestamp,
  updated_at timestamp
);

create table if not exists corporations (
  id bigint PRIMARY KEY,
  city_id bigint,
  name varchar(300),
  created_at timestamp,
  updated_at timestamp
);

ALTER TABLE `railway_stations` ADD CONSTRAINT `railway_routes_has_railway_stations` FOREIGN KEY (`railway_station_id`) REFERENCES `railway_routes` (`id`);

ALTER TABLE `cities` ADD CONSTRAINT `prefectures_has_cities` FOREIGN KEY (`prefecture_id`) REFERENCES `prefectures` (`id`);

ALTER TABLE `regions` ADD CONSTRAINT `prefectures_has_regions` FOREIGN KEY (`prefecture_id`) REFERENCES `prefectures` (`id`);

ALTER TABLE `cities` ADD CONSTRAINT `regions_has_cities` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`);

ALTER TABLE `facilities` ADD CONSTRAINT `cities_has_facilities` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);

ALTER TABLE `facilities_has_tags` ADD CONSTRAINT `facilities_has_tags` FOREIGN KEY (`tag_id`) REFERENCES `facilities` (`id`);

ALTER TABLE `facilities_has_tags` ADD CONSTRAINT `tags_has_facilities` FOREIGN KEY (`facility_id`) REFERENCES `tags` (`id`);

ALTER TABLE `contracts` ADD CONSTRAINT `facilities_has_contracts` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`);

ALTER TABLE `facilities` ADD CONSTRAINT `corporations_has_facilities` FOREIGN KEY (`corporation_id`) REFERENCES `corporations` (`id`);
