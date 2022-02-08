CREATE TABLE "public.Users" (
	"Id" serial NOT NULL,
	"Login" varchar(128) NOT NULL,
	"Email" varchar(255) NOT NULL UNIQUE,
	"Phone" varchar(12) NOT NULL UNIQUE,
	"Birthday" DATE(12),
	"Image" bytea,
	"Rating" integer NOT NULL DEFAULT '0',
	"Register_Date" DATETIME NOT NULL,
	CONSTRAINT "Users_pk" PRIMARY KEY ("Id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Posts" (
	"Id" serial NOT NULL,
	"Title" varchar(255) NOT NULL,
	"Text" TEXT NOT NULL,
	"Tags_Id" BINARY,
	"Timestamp" DATETIME NOT NULL,
	"Votes" integer NOT NULL DEFAULT '0',
	"Author_Id" BINARY NOT NULL,
	"Is_Reposting" BOOLEAN NOT NULL DEFAULT 'true',
	"Is_Nsfw" BOOLEAN NOT NULL DEFAULT 'false',
	"Is_Private" BOOLEAN NOT NULL DEFAULT 'false',
	CONSTRAINT "Posts_pk" PRIMARY KEY ("Id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Tags" (
	"Id" serial NOT NULL,
	"Title" varchar(32) UNIQUE,
	"Description" BINARY,
	CONSTRAINT "Tags_pk" PRIMARY KEY ("Id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Comments" (
	"Id" serial NOT NULL,
	"Author_Id" BINARY NOT NULL,
	"Timestamp" DATETIME NOT NULL,
	"Text" TEXT NOT NULL,
	"Votes" integer NOT NULL DEFAULT '0',
	CONSTRAINT "Comments_pk" PRIMARY KEY ("Id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.PostsComments" (
	"Comment_Id" BINARY NOT NULL,
	"Post_Id" BINARY NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.PostsTags" (
	"Tags_Id" BINARY NOT NULL,
	"Post_Id" BINARY NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Reposts" (
	"Post_Id" BINARY NOT NULL,
	"Reposter_Id" BINARY NOT NULL,
	"Timestamp" DATETIME NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.BanLists" (
	"Banner_Id" BINARY NOT NULL,
	"Banned_Id" BINARY NOT NULL,
	"Start_Timestamp" DATETIME NOT NULL,
	"End_Timestamp" DATETIME NOT NULL
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Posts" ADD CONSTRAINT "Posts_fk0" FOREIGN KEY ("Tags_Id") REFERENCES "Tags"("Id");
ALTER TABLE "Posts" ADD CONSTRAINT "Posts_fk1" FOREIGN KEY ("Author_Id") REFERENCES "Users"("Id");


ALTER TABLE "Comments" ADD CONSTRAINT "Comments_fk0" FOREIGN KEY ("Author_Id") REFERENCES "Users"("Id");

ALTER TABLE "PostsComments" ADD CONSTRAINT "PostsComments_fk0" FOREIGN KEY ("Comment_Id") REFERENCES "Comments"("Id");
ALTER TABLE "PostsComments" ADD CONSTRAINT "PostsComments_fk1" FOREIGN KEY ("Post_Id") REFERENCES "Posts"("Id");

ALTER TABLE "PostsTags" ADD CONSTRAINT "PostsTags_fk0" FOREIGN KEY ("Tags_Id") REFERENCES "Tags"("Id");
ALTER TABLE "PostsTags" ADD CONSTRAINT "PostsTags_fk1" FOREIGN KEY ("Post_Id") REFERENCES "Posts"("Id");

ALTER TABLE "Reposts" ADD CONSTRAINT "Reposts_fk0" FOREIGN KEY ("Post_Id") REFERENCES "Posts"("Id");
ALTER TABLE "Reposts" ADD CONSTRAINT "Reposts_fk1" FOREIGN KEY ("Reposter_Id") REFERENCES "Users"("Id");

ALTER TABLE "BanLists" ADD CONSTRAINT "BanLists_fk0" FOREIGN KEY ("Banner_Id") REFERENCES "Users"("Id");
ALTER TABLE "BanLists" ADD CONSTRAINT "BanLists_fk1" FOREIGN KEY ("Banned_Id") REFERENCES "Users"("Id");









