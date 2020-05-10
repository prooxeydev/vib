module main

import pg
import os

fn main() {
	host := os.args[1]
	port := os.args[2]
	user := os.args[3]
	passwd := os.args[4]
	database := os.args[5]

	db := pg.connect({
		host: host
		port: port.int()
		user: user
		password: passwd
		dbname: database
	}) or { panic(err) }

	db.exec('CREATE TABLE IF NOT EXISTS public."user"(id SERIAL, repositories integer[], tag "char"[] NOT NULL, username "char"[] NOT NULL, email "char"[] NOT NULL, CONSTRAINT user_pkey PRIMARY KEY (id)) WITH ( OIDS = FALSE ) TABLESPACE pg_default;')
	db.exec('CREATE TABLE IF NOT EXISTS public."userpage"(id INTEGER, avatar "char"[], bio "char"[], status "char"[]) WITH ( OIDS = FALSE ) TABLESPACE pg_default;')
	db.exec('CREATE TABLE IF NOT EXISTS public."organisation"(id SERIAL, repositories integer[], name "char"[] NOT NULL, member integer[]) WITH ( OIDS = FALSE ) TABLESPACE pg_default;')
	db.exec('CREATE TABLE IF NOT EXISTS public."repositories"(id SERIAL, name "char"[] NOT NULL, colaborator integer[]) WITH ( OIDS = FALSE ) TABLESPACE pg_default;')
}