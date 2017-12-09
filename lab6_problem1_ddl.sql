ALTER TABLE "PRODUCTS" ADD CONSTRAINT "PRODUCTS_CATEGORY_FK" FOREIGN KEY ("CATEGORYID") REFERENCES "ORDERS" ("ORDERID")
    ON DELETE SET NULL;
ALTER TABLE "PRODUCTS" ADD CONSTRAINT "PRODUCTS_SUPPLIER_FK" FOREIGN KEY ("SUPPLIERID") REFERENCES "SUPPLIERS" ("SUPPLIERID")
    ON DELETE CASCADE;
       
ALTER TABLE "ORDERS" 
    ADD CONSTRAINT "ORDERS_CONSULTANTS_FK" FOREIGN KEY ("CONSULTANTID") REFERENCES "CONSULTANTS" ("CONSULTANTID")
        ON DELETE SET NULL;
    
ALTER TABLE "CONSULTANTS" 
    ADD CONSTRAINT "CONSULTANTS_POSTAL_CODE_FK" FOREIGN KEY ("CONSULTANTPOSTALCODE") REFERENCES "POSTAL_CODE" ("POSTALCODEID")
       ON DELETE SET NULL;
    
ALTER TABLE "ORDER_DETAILS" ADD CONSTRAINT "ORDER_DETAILS_PRODUCT_FK" FOREIGN KEY ("PRODUCTID") REFERENCES "PRODUCTS" ("PRODUCTID")
    ON DELETE SET NULL;
ALTER TABLE "ORDER_DETAILS" ADD CONSTRAINT "ORDER_DETAILS_ORDER_FK" FOREIGN KEY ("ORDERID") REFERENCES "ORDERS" ("ORDERID")
    ON DELETE SET NULL;
        
