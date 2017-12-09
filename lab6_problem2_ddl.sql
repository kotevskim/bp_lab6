ALTER TABLE "BILETI" ADD CONSTRAINT "BILETI_TEATAR_FK" FOREIGN KEY ("T") REFERENCES "TEATRI" ("T")
    ON DELETE SET NULL;
ALTER TABLE "BILETI" ADD CONSTRAINT "BILETI_PRETSTAVA_FK" FOREIGN KEY ("P") REFERENCES "PRETSTAVI" ("P")
    ON DELETE SET NULL;
       
ALTER TABLE "ULOGI" ADD CONSTRAINT "ULOGI_VRABOTEN_FK" FOREIGN KEY ("V") REFERENCES "VRABOTENI" ("V")
        ON DELETE SET NULL;
ALTER TABLE "ULOGI" ADD CONSTRAINT "ULOGI_PRETSTAVA_FK" FOREIGN KEY ("P") REFERENCES "PRETSTAVI" ("P")
        ON DELETE SET NULL;

ALTER TABLE "ZARABOTUVA" ADD CONSTRAINT "ZARABOTUVA_VRABOTEN_FK" FOREIGN KEY ("V") REFERENCES "VRABOTENI" ("V")
        ON DELETE SET NULL;
ALTER TABLE "ZARABOTUVA" ADD CONSTRAINT "ZARABOTUVA_TEATAR_FK" FOREIGN KEY ("T") REFERENCES "TEATRI" ("T")
        ON DELETE SET NULL;

/*
bidejki pretstava so id=500 ne postoi vo tabelata PRETSTAVI, za da moze da se
dodade foreign key moze ili da dodademe takva prestava, ili da go izbriseme
soodvetniot red od tabelata ZARABOTUVA
*/
DELETE FROM "ZARABOTUVA" WHERE P = 500;

ALTER TABLE "ZARABOTUVA" ADD CONSTRAINT "ZARABOTUVA_PRETSTAVA_FK" FOREIGN KEY ("P") REFERENCES "PRETSTAVI" ("P")
        ON DELETE SET NULL;


        