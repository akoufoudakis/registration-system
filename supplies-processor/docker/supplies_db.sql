CREATE TABLE suppliers (
  supplier_id serial PRIMARY KEY,
  supplier_code  VARCHAR(10) NOT NULL,
  supplier_name   VARCHAR(25) NOT NULL,
  supplier_description VARCHAR(50) NOT NULL,
  UNIQUE (supplier_code)
);

CREATE TABLE items (
  item_id serial PRIMARY KEY,
  item_code VARCHAR(10) NOT NULL,
  item_name VARCHAR(25) NOT NULL,
  item_description VARCHAR(50) NOT NULL,
  UNIQUE (item_code)
);

CREATE TABLE shipments (
    shipment_id SERIAL PRIMARY KEY,
    shipment_code VARCHAR(20),
    supplier_id INTEGER,
    item_id INTEGER,
    quantity INTEGER,
    shipment_date DATE,
    FOREIGN KEY (item_id)
      REFERENCES items (item_id),
    FOREIGN KEY (supplier_id)
      REFERENCES suppliers (supplier_id),
    UNIQUE (shipment_code)
);

CREATE TABLE stock_levels (
    level_id serial PRIMARY KEY,
    item_id INTEGER,
    quantity INTEGER,
    last_updated TIMESTAMP,
    FOREIGN KEY (item_id)
      REFERENCES items (item_id)
);

INSERT INTO items (ITEM_CODE, ITEM_NAME, ITEM_DESCRIPTION) VALUES ('A4930', 'Gloves Sterile', 'Sterile gloves, pairs');
INSERT INTO items (ITEM_CODE, ITEM_NAME, ITEM_DESCRIPTION) VALUES ('A4207', 'Syringe 2cc', 'Syringe with needle, sterile 2cc');
INSERT INTO suppliers (SUPPLIER_CODE, SUPPLIER_NAME, SUPPLIER_DESCRIPTION) VALUES ('2ME','2MEdical','Supplier of Disposables');
INSERT INTO suppliers (SUPPLIER_CODE, SUPPLIER_NAME, SUPPLIER_DESCRIPTION) VALUES ('2DD', '2 Deploy Dental', 'Supplier of Disposables');
INSERT INTO stock_levels (ITEM_ID, QUANTITY, LAST_UPDATED) VALUES (1, 25000, CURRENT_TIMESTAMP);
INSERT INTO stock_levels (ITEM_ID, QUANTITY, LAST_UPDATED) VALUES (2, 1000, CURRENT_TIMESTAMP);