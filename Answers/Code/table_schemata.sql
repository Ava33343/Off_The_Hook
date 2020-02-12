-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/?state=bfhtay2bl8i&code=4%2FwQFg7U_mkE3MSRvhD3xckf8gitN4g_xg2QQQZM3uvvpu5FnJuSvSetIv9a_7D1C5Q4eNhhlWYB8eLCbQ7hUs-Y4&scope=email+profile+openid+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email&authuser=0&prompt=consent&session_state=24d616fbf729041e9ab23a0834649bca1d88e7ed..e78e#/d/P2duCE
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "card_holder" (
    "id" INTEGER   NOT NULL,
    "name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_card_holder" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "credit_card" (
    "card" VARCHAR   NOT NULL,
    "cardholder_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_credit_card" PRIMARY KEY (
        "card"
     )
);

CREATE TABLE "merchant_category" (
    "id" INTEGER   NOT NULL,
    "name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_merchant_category" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "merchant" (
    "id" INTEGER   NOT NULL,
    "name" VARCHAR   NOT NULL,
    "id_merchant_category" INTEGER   NOT NULL,
    CONSTRAINT "pk_merchant" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "transaction" (
    "id" INTEGER   NOT NULL,
    "date" TIMESTAMP   NOT NULL,
    "amount" DEC   NOT NULL,
    "card" VARCHAR   NOT NULL,
    "id_merchant" INTEGER   NOT NULL,
    CONSTRAINT "pk_transaction" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "credit_card" ADD CONSTRAINT "fk_credit_card_cardholder_id" FOREIGN KEY("cardholder_id")
REFERENCES "card_holder" ("id");

ALTER TABLE "merchant" ADD CONSTRAINT "fk_merchant_id_merchant_category" FOREIGN KEY("id_merchant_category")
REFERENCES "merchant_category" ("id");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_card" FOREIGN KEY("card")
REFERENCES "credit_card" ("card");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_id_merchant" FOREIGN KEY("id_merchant")
REFERENCES "merchant" ("id");

