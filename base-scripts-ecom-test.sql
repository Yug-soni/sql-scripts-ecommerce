create table admin_user
(
    `key`    varchar(10) not null,
    password varchar(10) not null
);

create table category
(
    category    varchar(30) not null,
    category_id int auto_increment,
    constraint category_category_id_uindex
        unique (category_id),
    constraint category_category_uindex
        unique (category)
);

alter table category
    add primary key (category_id);

create table product
(
    product_id    int auto_increment,
    serial_number varchar(14)  not null,
    product_name  varchar(100) not null,
    display_name  varchar(50)  not null,
    constraint product_product_id_uindex
        unique (product_id),
    constraint product_serial_number_uindex
        unique (serial_number)
);

alter table product
    add primary key (product_id);

create table sub_category
(
    sub_category_id int auto_increment,
    sub_category    int not null,
    constraint sub_category_sub_category_id_uindex
        unique (sub_category_id),
    constraint sub_category_sub_category_uindex
        unique (sub_category)
);

alter table sub_category
    add primary key (sub_category_id);


