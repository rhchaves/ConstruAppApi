----/* Remocao das Tabelas */

--DROP TABLE categories CASCADE CONSTRAINTS;
--DROP TABLE products CASCADE CONSTRAINTS;
--DROP TABLE user_admins CASCADE CONSTRAINTS;
--DROP TABLE user_clients CASCADE CONSTRAINTS;
--DROP TABLE user_sellers CASCADE CONSTRAINTS;
--DROP TABLE shopping_carts CASCADE CONSTRAINTS;
--DROP TABLE purchase_orders CASCADE CONSTRAINTS;
--DROP TABLE purchase_order_items CASCADE CONSTRAINTS;


------/* Remocao das Tabelas Identity AspNet (manter essa ordem) */
----DROP TABLE "AspNetRoles" CASCADE CONSTRAINTS;
----DROP TABLE "AspNetRoleClaims" CASCADE CONSTRAINTS;
----DROP TABLE "AspNetUsers" CASCADE CONSTRAINTS;
----DROP TABLE "AspNetUserClaims" CASCADE CONSTRAINTS;
----DROP TABLE "AspNetUserLogins" CASCADE CONSTRAINTS;
----DROP TABLE "AspNetUserRoles" CASCADE CONSTRAINTS;
----DROP TABLE "AspNetUserTokens" CASCADE CONSTRAINTS;
----DROP TABLE "__EFMigrationsHistory" CASCADE CONSTRAINTS;

------/* Criacao das Tabelas */

--CREATE TABLE Categories (
--    Category_Id NUMBER(10) GENERATED BY DEFAULT AS IDENTITY START WITH 1 INCREMENT BY 1,
--    Name VARCHAR2(50) UNIQUE NOT NULL,
--    Label VARCHAR2(50) UNIQUE NOT NULL,
--    Image_URI VARCHAR2(300),
--    Status NUMBER(1,0) DEFAULT 0 CHECK (Status >= 0 AND Status <= 1),
--    Update_Status TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Create_Register TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Update_Register TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Deleted_Register TIMESTAMP(7),

--    CONSTRAINT PK_Categories PRIMARY KEY (Category_Id),
--    CONSTRAINT Name_Length CHECK (LENGTH(Name) >= 3 AND LENGTH(Name) <= 50),
--    CONSTRAINT Label_Length CHECK (LENGTH(Label) >= 3 AND LENGTH(Label) <= 50),
--    CONSTRAINT Image_URI_Length CHECK (LENGTH(Image_URI) >= 10 AND LENGTH(Image_URI) <= 300)
--);

---- Criacao da tabela Products
--CREATE TABLE Products (
--    Product_Id NUMBER(10) GENERATED BY DEFAULT AS IDENTITY START WITH 1 INCREMENT BY 1,
--    Name VARCHAR2(100) UNIQUE NOT NULL,
--    Label VARCHAR2(100) UNIQUE NOT NULL,
--    Description VARCHAR2(256) NOT NULL,
--    Product_Mark VARCHAR2(30) NOT NULL,
--    Price DECIMAL(10, 2) NOT NULL,
--    Image_URI VARCHAR2(300),
--    Stock_Qtd NUMBER(10) NOT NULL CHECK (Stock_Qtd >= 0),
--    Sold_Qtd NUMBER(10) NOT NULL CHECK (Sold_Qtd >= 0),
--    Status NUMBER(1,0) DEFAULT 0 CHECK (Status >= 0 AND Status <= 1),
--    Update_Status TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Create_Register TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Update_Register TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Deleted_Register TIMESTAMP(7),
--    Category_Id NUMBER(10) NOT NULL,

--    CONSTRAINT PK_Products PRIMARY KEY (Product_Id),
--    CONSTRAINT FK_Products_Categories FOREIGN KEY (Category_Id) REFERENCES Categories (Category_Id) ON DELETE CASCADE
--);

---- Criacao da tabela user_admins
--CREATE TABLE user_admins (
--    User_Admin_Id VARCHAR2(300) NOT NULL,
--    User_Id VARCHAR2(300) NOT NULL,
--    Full_Name VARCHAR2(50) UNIQUE NOT NULL,
--    CPF VARCHAR2(11) UNIQUE NOT NULL,
--    Status NUMBER(1,0) DEFAULT 0 CHECK (Status >= 0 AND Status <= 1),
--    Update_Status TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Create_Register TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Update_Register TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Deleted_Register TIMESTAMP(7),

--    CONSTRAINT PK_user_admins PRIMARY KEY (User_Admin_Id)
--);

---- Criacao da tabela user_clients
--CREATE TABLE user_clients (
--    User_Client_Id VARCHAR2(300) NOT NULL,
--    User_Id VARCHAR2(300) NOT NULL,
--    Full_Name VARCHAR2(50) UNIQUE NOT NULL,
--    CPF VARCHAR2(11) UNIQUE NOT NULL,
--    Street VARCHAR2(50) NOT NULL,
--    Address_Number VARCHAR2(10) NOT NULL,
--    Zip_Code VARCHAR2(8) NOT NULL,
--    Complement VARCHAR2(50),
--    District VARCHAR2(50) NOT NULL,
--    City VARCHAR2(50) NOT NULL,
--    State VARCHAR2(2) NOT NULL,
--    Status NUMBER(1,0) DEFAULT 0 CHECK (Status >= 0 AND Status <= 1),
--    Update_Status TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Create_Register TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Update_Register TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Deleted_Register TIMESTAMP(7),

--    CONSTRAINT PK_user_clients PRIMARY KEY (User_Client_Id)
--);

---- Criacao da tabela user_sellers
--CREATE TABLE user_sellers (
--    User_Seller_Id VARCHAR2(300) NOT NULL,
--    User_Id VARCHAR2(300) NOT NULL,
--    Fantasy_Name VARCHAR2(50) UNIQUE NOT NULL,
--    CNPJ VARCHAR2(14) UNIQUE NOT NULL,
--    Street VARCHAR2(50) NOT NULL,
--    Address_Number VARCHAR2(10) NOT NULL,
--    Zip_Code VARCHAR2(8) NOT NULL,
--    Complement VARCHAR2(50),
--    District VARCHAR2(50) NOT NULL,
--    City VARCHAR2(50) NOT NULL,
--    State VARCHAR2(2) NOT NULL,
--    Status NUMBER(1,0) DEFAULT 0 CHECK (Status >= 0 AND Status <= 1),
--    Update_Status TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Create_Register TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Update_Register TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Deleted_Register TIMESTAMP(7),

--    CONSTRAINT PK_user_sellers PRIMARY KEY (User_Seller_Id)
--);

--CREATE TABLE shopping_carts (
--    shopping_cart_id NUMBER(10) GENERATED BY DEFAULT AS IDENTITY START WITH 1 INCREMENT BY 1,
--    user_client_id VARCHAR2(300) NOT NULL,
--    payment VARCHAR2(50) NOT NULL,
--    product_id NUMBER(10) NOT NULL,
--    qtd_product NUMBER(10) CHECK (qtd_product >= 0),
--    status NUMBER(1,0) DEFAULT 0 CHECK (status >= 0 AND status <= 1),
--    Update_Status TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Create_Register TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Update_Register TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Deleted_Register TIMESTAMP(7),
    
--    CONSTRAINT PK_shopping_carts PRIMARY KEY (shopping_cart_id),
--    CONSTRAINT FK_shopping_cart_user_client_id FOREIGN KEY (user_client_id) REFERENCES user_clients(user_client_id),
--    CONSTRAINT FK_shopping_cart_product_id FOREIGN KEY (product_id) REFERENCES products(product_id)
--);

--CREATE TABLE purchase_orders (
--    purchase_order_id NUMBER(10) GENERATED BY DEFAULT AS IDENTITY START WITH 1 INCREMENT BY 1,
--    user_client_id VARCHAR2(300) NOT NULL,
--    user_seller_id VARCHAR2(300) NOT NULL,
--    total_price NUMBER(12, 2) NOT NULL,
--    Status NUMBER(1,0) DEFAULT 0 CHECK (Status >= 0 AND Status <= 1),
--    Update_Status TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Create_Register TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Update_Register TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Deleted_Register TIMESTAMP(7),

--    CONSTRAINT PK_purchase_orders PRIMARY KEY (purchase_order_id),
--    CONSTRAINT FK_purchase_order_user_client_id FOREIGN KEY (user_client_id) REFERENCES user_clients(user_client_id),
--    CONSTRAINT FK_purchase_order_user_seller_id FOREIGN KEY (user_seller_id) REFERENCES user_sellers(user_seller_id)
--);

--CREATE TABLE purchase_order_items (
--    purchase_order_item_id NUMBER(10) GENERATED BY DEFAULT AS IDENTITY START WITH 1 INCREMENT BY 1,
--    purchase_order_id NUMBER(10),
--    product_id NUMBER(10),
--    product_price NUMBER(10, 2) NOT NULL,
--    quantity NUMBER(10) NOT NULL,
--    total_price NUMBER(12, 2) NOT NULL,
--    Status NUMBER(1,0) DEFAULT 0 CHECK (Status >= 0 AND Status <= 1),
--    Update_Status TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Create_Register TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Update_Register TIMESTAMP(7) DEFAULT CURRENT_TIMESTAMP NOT NULL,
--    Deleted_Register TIMESTAMP(7),

--    CONSTRAINT PK_purchase_order_items PRIMARY KEY (purchase_order_item_id),
--    CONSTRAINT FK_purchase_order_id FOREIGN KEY (purchase_order_id) REFERENCES purchase_orders(purchase_order_id),
--    CONSTRAINT FK_purchase_order_product_id FOREIGN KEY (product_id) REFERENCES products(product_id)
--);



--COMMIT;