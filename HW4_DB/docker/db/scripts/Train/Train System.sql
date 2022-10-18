CREATE TABLE "City" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"region" TEXT NOT NULL,
	CONSTRAINT "City_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Station" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"city" TEXT NOT NULL,
	"city" TEXT NOT NULL,
	CONSTRAINT "Station_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Train" (
	"id" serial NOT NULL,
	"length" bigint NOT NULL,
	"startSta" bigint NOT NULL,
	"endSta" bigint NOT NULL,
	"connected" bigint NOT NULL,
	CONSTRAINT "Train_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Connected" (
	"id" serial NOT NULL,
	"departure" TIME NOT NULL,
	"arrival" TIME NOT NULL,
	"station" bigint NOT NULL,
	CONSTRAINT "Connected_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Station" ADD CONSTRAINT "Station_fk0" FOREIGN KEY ("city") REFERENCES "City"("id");
ALTER TABLE "Station" ADD CONSTRAINT "Station_fk1" FOREIGN KEY ("city") REFERENCES "City"("id");

ALTER TABLE "Train" ADD CONSTRAINT "Train_fk0" FOREIGN KEY ("startSta") REFERENCES "Station"("id");
ALTER TABLE "Train" ADD CONSTRAINT "Train_fk1" FOREIGN KEY ("endSta") REFERENCES "Station"("id");
ALTER TABLE "Train" ADD CONSTRAINT "Train_fk2" FOREIGN KEY ("connected") REFERENCES "Connected"("id");

ALTER TABLE "Connected" ADD CONSTRAINT "Connected_fk0" FOREIGN KEY ("station") REFERENCES "Station"("id");





