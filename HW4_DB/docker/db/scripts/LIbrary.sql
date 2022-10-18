CREATE TABLE "Book" (
	"id" serial NOT NULL,
	"year" bigint NOT NULL,
	"name" TEXT NOT NULL,
	"page" bigint NOT NULL,
	"publisher" bigint NOT NULL,
	"category" bigint NOT NULL,
	CONSTRAINT "Book_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Reader" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"surname" TEXT NOT NULL,
	"adress" TEXT NOT NULL,
	"birthday" DATE NOT NULL,
	CONSTRAINT "Reader_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Publisher" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"adress" TEXT NOT NULL,
	CONSTRAINT "Publisher_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Book copy" (
	"id" serial NOT NULL,
	"shelf" bigint NOT NULL,
	"book type" bigint NOT NULL,
	CONSTRAINT "Book copy_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Book category" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "Book category_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Category tree" (
	"child category" bigint NOT NULL,
	"parent category" bigint NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Taken book" (
	"book copy" bigint NOT NULL,
	"reader" bigint NOT NULL,
	"date of return" DATE NOT NULL
) WITH (
  OIDS=FALSE
);



ALTER TABLE "Book" ADD CONSTRAINT "Book_fk0" FOREIGN KEY ("publisher") REFERENCES "Publisher"("id");
ALTER TABLE "Book" ADD CONSTRAINT "Book_fk1" FOREIGN KEY ("category") REFERENCES "Book category"("id");



ALTER TABLE "Book copy" ADD CONSTRAINT "Book copy_fk0" FOREIGN KEY ("book type") REFERENCES "Book"("id");


ALTER TABLE "Category tree" ADD CONSTRAINT "Category tree_fk0" FOREIGN KEY ("child category") REFERENCES "Book category"("id");
ALTER TABLE "Category tree" ADD CONSTRAINT "Category tree_fk1" FOREIGN KEY ("parent category") REFERENCES "Book category"("id");

ALTER TABLE "Taken book" ADD CONSTRAINT "Taken book_fk0" FOREIGN KEY ("book copy") REFERENCES "Book copy"("id");
ALTER TABLE "Taken book" ADD CONSTRAINT "Taken book_fk1" FOREIGN KEY ("reader") REFERENCES "Reader"("id");








