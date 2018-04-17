--liquibase formatted sql
--changeset salerno:3

create table uscisodos.user(
    user_id serial PRIMARY KEY NOT NULL,
	user_firstname varchar(255) NOt NULL,
	user_lastname varchar(255) NOt NULL,
    user_email varchar(255) UNIQUE NOT NULL,
    user_login varchar(255) UNIQUE NOT NULL,
    user_last_login timestamp NOT NULL,
	user_password varchar(255) NOT NULL,
	user_status boolean  DEFAULT true ,
    user_password_exp_date timestamp NOT NULL,
    created_on timestamp DEFAULT NOW(),
    created_by varchar(255) NOT NULL,
    updated_on timestamp NOT NULL DEFAULT NOW(),
    updated_by varchar(255) NOT NULL
);

create table uscisodos.role(
    role_id serial PRIMARY KEY NOT NULL,
    role_name varchar(255) UNIQUE NOT Null,
    role_description varchar(255),
    role_status boolean NOT NULL DEFAULT true,
    created_on timestamp DEFAULT NOW(),
    created_by varchar(255) NOT NULL,
    updated_on timestamp NOT NULL DEFAULT NOW(),
    updated_by varchar(255) NOT NULL
);

create table uscisodos.user_role(
    userrole_id serial PRIMARY KEY NOT NULL,
    user_id int references uscisodos.user(user_id),
    role_id int references uscisodos.role(role_id),
    created_on timestamp DEFAULT NOW(),
    created_by varchar(255) NOT NULL,
    updated_on timestamp NOT NULL DEFAULT NOW(),
    updated_by varchar(255) NOT NULL
);

create table uscisodos.user_old_passwords(
    user_password_id serial PRIMARY KEY NOT NULL,
    user_id int references uscisodos.user(user_id),
    user_old_password varchar(255) NOT NULL,
    user_password_expired_on timestamp NOT NULL,
    created_on timestamp DEFAULT NOW(),
    created_by varchar(255) NOT NULL,
    updated_on timestamp NOT NULL DEFAULT NOW(),
    updated_by varchar(255) NOT NULL
);

create table uscisodos.building(
    building_id serial PRIMARY KEY NOT NULL,
    building_name varchar(255) UNIQUE NOT NULL,
    building_status boolean NOT NULL,
    building_address varchar(255),
    created_on timestamp DEFAULT NOW(),
    created_by varchar(255) NOT NULL,
    updated_on timestamp NOT NULL DEFAULT NOW(),
    updated_by varchar(255) NOT NULL
);

create table uscisodos.room(
    room_id serial PRIMARY KEY NOT NULL,
    room_name varchar(255) UNIQUE NOT NULL,
    room_attendee_limit int NOT NULL,
    room_status boolean NOT NULL,
    building_id int references uscisodos.building(building_id),
    created_on timestamp DEFAULT NOW(),
    created_by varchar(255) NOT NULL,
    updated_on timestamp NOT NULL DEFAULT NOW(),
    updated_by varchar(255) NOT NULL
);

create table uscisodos.av_enquipment(
    enquipment_id serial PRIMARY KEY NOT NULL,
    equipment_name varchar(255) UNIQUE NOT NULL,
    enquipment_working boolean NOT NULL,
    created_on timestamp DEFAULT NOW(),
    created_by varchar(255) NOT NULL,
    updated_on timestamp NOT NULL DEFAULT NOW(),
    updated_by varchar(255) NOT NULL
);

create table uscisodos.room_enquipment(
    room_enquipment_id serial PRIMARY KEY NOT NULL,
    room_id int references uscisodos.room(room_id),
    enquipment_id int references uscisodos.av_enquipment(enquipment_id),
    assigned_by varchar(255) NOT NULL,
    assigned_on varchar(255) NOT NULL
);


create table uscisodos.conference(
   conference_id serial PRIMARY KEY NOT NULL,
   conference_name varchar(255) NOT NULL,
   conference_start timestamp NOT NULL,
   conference_end timestamp NOT NULL,
   reccuring boolean default true,
   conference_duration time NOT NULL,
   created_on timestamp DEFAULT NOW(),
   created_by varchar(255) NOT NULL,
   updated_on timestamp NOT NULL DEFAULT NOW(),
   updated_by varchar(255) NOT NULL
);


create table uscisodos.conf_room_allotment(
    conference_room_id serial PRIMARY KEY NOT NULL,
    conference_id int references uscisodos.conference(conference_id),
    room_id int references uscisodos.room(room_id),
    created_on timestamp DEFAULT NOW(),
    created_by varchar(255) NOT NULL,
    updated_on timestamp NOT NULL DEFAULT NOW(),
    updated_by varchar(255) NOT NULL     
);

--rollback drop schema uscisodos cascade;