create table products_data
(
    ID               int auto_increment,
    productID        varchar(10) not null,
    productName      varchar(80) null,
    count            int         not null,
    availableColors  text        null,
    category         text        not null,
    subCategory      text        not null,
    brandName        varchar(50) not null,
    dimensions       varchar(20) null,
    features         text        null,
    mainImage        text        not null,
    images           text        null,
    price            int         not null,
    discount         int         null,
    extraDiscount    int         null,
    specifications   text        null,
    shortDescription tinytext    not null,
    longDescription  text        null,
    constraint products_data_ID_uindex
        unique (ID),
    constraint products_data_productID_uindex
        unique (productID)
);

alter table products_data
    add primary key (ID);

create table user
(
    user_id  int auto_increment,
    mail_id  varchar(50) not null,
    password varchar(30) not null,
    constraint user_id_uindex
        unique (user_id),
    constraint user_mail_id_uindex
        unique (mail_id)
);

create table orders
(
    order_id      int auto_increment,
    mail_id       varchar(50) not null,
    product_id    varchar(10) not null,
    purchase_date date        not null,
    delivery_date date        null,
    constraint orders_orderID_uindex
        unique (order_id),
    constraint orders_products_data_productID_fk
        foreign key (product_id) references products_data (productID),
    constraint orders_user_mailID_fk
        foreign key (mail_id) references user (mail_id)
);

alter table orders
    add primary key (order_id);

create table shipping
(
    shippingID      int auto_increment,
    mailID          varchar(50) null,
    productID       varchar(10) null,
    address         tinytext    null,
    currentLocation tinytext    not null,
    constraint shipping_shippingID_uindex
        unique (shippingID),
    constraint shipping_products_data_productID_fk
        foreign key (productID) references products_data (productID),
    constraint shipping_user_mailID_fk
        foreign key (mailID) references user (mail_id)
);

alter table shipping
    add primary key (shippingID);

alter table user
    add primary key (user_id);

create table user_data
(
    userID      int auto_increment
        primary key,
    mailID      varchar(50)  not null,
    firstName   varchar(15)  not null,
    lastName    varchar(15)  null,
    gender      varchar(8)   null,
    dateOfBirth date         null,
    age         int          null,
    interests   varchar(250) null,
    zipCode     int          null,
    city        varchar(30)  null,
    state       varchar(20)  null,
    country     varchar(20)  null,
    phoneNumber varchar(15)  null,
    address     varchar(200) null,
    constraint user_data_mailID_uindex
        unique (mailID),
    constraint user_data_user_mail_id_fk
        foreign key (mailID) references user (mail_id)
            on update cascade on delete cascade,
    constraint user_data_user_userID_fk
        foreign key (userID) references user (user_id)
            on update cascade on delete cascade
);

create table user_saved_products
(
    mailID   varchar(50) not null,
    wishlist varchar(10) null,
    cart     varchar(10) null,
    later    varchar(10) null,
    constraint user_saved_products_products_data_productID_fk
        foreign key (wishlist) references products_data (productID)
            on update cascade on delete cascade,
    constraint user_saved_products_products_data_productID_fk_2
        foreign key (cart) references products_data (productID)
            on update cascade on delete cascade,
    constraint user_saved_products_products_data_productID_fk_3
        foreign key (later) references products_data (productID)
            on update cascade on delete cascade,
    constraint user_saved_products_user_mailID_fk
        foreign key (mailID) references user (mail_id)
            on update cascade on delete cascade
);


