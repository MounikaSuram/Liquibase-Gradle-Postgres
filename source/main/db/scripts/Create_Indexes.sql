--liquibase formatted sql
--changeset salerno:3

CREATE UNIQUE INDEX index_unique_user_role ON uscisodos.user_role (user_id,role_id);
CREATE UNIQUE INDEX index_unique_room_enquipment ON uscisodos.room_enquipment (room_id,enquipment_id);
CREATE UNIQUE INDEX index_unique_conference_room ON uscisodos.conf_room_allotment (conference_id,room_id);
CREATE UNIQUE INDEX index_unique_room_building ON uscisodos.room (room_id,building_id);
CREATE UNIQUE INDEX index_unique_user_password ON uscisodos.user_old_passwords (user_id,user_old_password);
ALTER TABLE uscisodos.user ALTER COLUMN user_last_login Drop NOT NULL;
ALTER TABLE uscisodos.user ALTER COLUMN user_password_exp_date Drop NOT NULL; 

--rollback drop schema uscisodos cascade;