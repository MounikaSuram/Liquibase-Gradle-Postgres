--liquibase formatted sql
--changeset salerno:3
Drop Schema uscisodos cascade;

CREATE SCHEMA uscisodos;

--rollback drop schema uscisodos;