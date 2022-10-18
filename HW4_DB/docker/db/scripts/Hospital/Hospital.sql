CREATE TABLE "Station" (
	"id" bigint NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "Station_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "StationPersonell" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"work" bigint NOT NULL,
	CONSTRAINT "StationPersonell_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Doctor" (
	"id" serial NOT NULL,
	"persId" bigint NOT NULL,
	"rank" TEXT NOT NULL,
	"area" TEXT NOT NULL,
	CONSTRAINT "Doctor_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Caregiver" (
	"id" serial NOT NULL,
	"persId" bigint NOT NULL,
	"qualification" TEXT NOT NULL,
	CONSTRAINT "Caregiver_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Room" (
	"id" bigint NOT NULL,
	"beds" bigint NOT NULL,
	"station" bigint NOT NULL,
	CONSTRAINT "Room_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Patient" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"doctor" bigint NOT NULL,
	"desease" TEXT NOT NULL,
	CONSTRAINT "Patient_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Admission" (
	"id" serial NOT NULL,
	"from" DATE NOT NULL,
	"to" DATE NOT NULL,
	"room" bigint NOT NULL,
	"patient" bigint NOT NULL,
	CONSTRAINT "Admission_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "StationPersonell" ADD CONSTRAINT "StationPersonell_fk0" FOREIGN KEY ("work") REFERENCES "Station"("id");

ALTER TABLE "Doctor" ADD CONSTRAINT "Doctor_fk0" FOREIGN KEY ("persId") REFERENCES "StationPersonell"("id");

ALTER TABLE "Caregiver" ADD CONSTRAINT "Caregiver_fk0" FOREIGN KEY ("persId") REFERENCES "StationPersonell"("id");

ALTER TABLE "Room" ADD CONSTRAINT "Room_fk0" FOREIGN KEY ("station") REFERENCES "Station"("id");

ALTER TABLE "Patient" ADD CONSTRAINT "Patient_fk0" FOREIGN KEY ("doctor") REFERENCES "Doctor"("id");

ALTER TABLE "Admission" ADD CONSTRAINT "Admission_fk0" FOREIGN KEY ("room") REFERENCES "Room"("id");
ALTER TABLE "Admission" ADD CONSTRAINT "Admission_fk1" FOREIGN KEY ("patient") REFERENCES "Patient"("id");








