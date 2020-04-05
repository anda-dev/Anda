CREATE TABLE "Party" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL UNIQUE,
	"addressid" serial NOT NULL UNIQUE,
	"super" BOOLEAN NOT NULL,
	CONSTRAINT "Party_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Address" (
	"id" serial NOT NULL,
	"country" varchar(255) NOT NULL,
	"city" varchar(255) NOT NULL,
	"street" varchar(255) NOT NULL,
	"no" integer NOT NULL,
	CONSTRAINT "Address_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "User" (
	"id" serial NOT NULL,
	"email" varchar(50) NOT NULL UNIQUE,
	"name" varchar(20) NOT NULL UNIQUE,
	"cnp" varchar(255) NOT NULL UNIQUE,
	"address" varchar(255) NOT NULL,
	"password" varchar(255) NOT NULL,
	"partyid" bigint NOT NULL,
	"admin" BOOLEAN NOT NULL,
	CONSTRAINT "User_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "Party" ADD CONSTRAINT "Party_fk0" FOREIGN KEY ("addressid") REFERENCES "Address"("id");

ALTER TABLE "User" ADD CONSTRAINT "User_fk0" FOREIGN KEY ("partyid") REFERENCES "Party"("id");

INSERT INTO "Address" VALUES (12345, 'Romania', 'Timisoara', 'Piata Operei', '1');

INSERT INTO "Party" VALUES (11111, 'Initial Super Party', 12345, 'Y');

INSERT INTO "User" VALUES (22222, 'anda.nacu@gmail.com', 'anda', '2890502473829', 'Sever Bocu', 'password', 11111, 'Y');