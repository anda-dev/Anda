CREATE TABLE "Party" (
	"id" serial NOT NULL,
	"name" serial NOT NULL UNIQUE,
	"addressid" serial NOT NULL UNIQUE,
	"super" BOOLEAN NOT NULL,
	CONSTRAINT "Party_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Address" (
	"id" serial(255) NOT NULL,
	"partyid" serial(255) NOT NULL,
	"country" varchar(255) NOT NULL,
	"city" varchar(255) NOT NULL,
	"street" varchar(255) NOT NULL,
	"no" int(255) NOT NULL,
	CONSTRAINT "Address_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "User" (
	"id" serial NOT NULL,
	"email" serial(255) NOT NULL UNIQUE,
	"name" serial(255) NOT NULL UNIQUE,
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

ALTER TABLE "Address" ADD CONSTRAINT "Address_fk0" FOREIGN KEY ("partyid") REFERENCES "Party"("id");

ALTER TABLE "User" ADD CONSTRAINT "User_fk0" FOREIGN KEY ("partyid") REFERENCES "Party"("id");

