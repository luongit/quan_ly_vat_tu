drop database ql_vat_tu;

create database ql_vat_tu;
use ql_vat_tu;

create table departments
(
    id int primary key auto_increment,
    name varchar(100) NOT NULL unique,
    created_at timestamp DEFAULT current_timestamp(),
    updated_at date NULL
);

create table categories
(
    id int primary key auto_increment,
    name varchar(100) NOT NULL unique,
    created_at timestamp DEFAULT current_timestamp(),
    updated_at date NULL
);

create table products
(
    id int primary key auto_increment,
    name varchar(100) NOT NULL unique,
    image varchar(150) NOT NULL,
    quantity int NOT NULL,
    quantity_broken int NULL DEFAULT '0',
    summary varchar(255) NOT NULL,
    category_id int NOT NULL,
    foreign key (category_id) references categories(id),
    created_at timestamp DEFAULT current_timestamp(),
    updated_at date NULL
);

create table users
(
    id int primary key auto_increment,
    name varchar(100) NOT NULL,
    email varchar(100) NOT NULL unique,
    phone varchar(100) NOT NULL unique,
    password varchar(100) NOT NULL,
    created_at timestamp DEFAULT current_timestamp(),
    updated_at date NULL
);

create table roles
(
    id int primary key auto_increment,
    name varchar(100) NOT NULL,
    permissions text NULL,
    created_at timestamp DEFAULT current_timestamp(),
    updated_at date NULL
);

create table user_roles
(
    user_id int NOT NULL,
    role_id int NOT NULL,
    primary key (user_id, role_id),
    foreign key (user_id) references users(id),
    foreign key (role_id) references roles(id)
);

create table orders
(
    id int primary key auto_increment,
    user_id int NOT NULL,
    name varchar(100) NOT NULL,
    phone varchar(100) NOT NULL,
    department_id int NOT NULL,
    status tinyint DEFAULT '0',
    summary varchar(255) NULL,
    foreign key (user_id) references users(id),
    foreign key (department_id) references departments(id),
    created_at timestamp DEFAULT current_timestamp(),
    updated_at date NULL
);

create table order_details
(
    order_id int NOT NULL,
    product_id int NOT NULL,
    quantity int NOT NULL,
    status tinyint DEFAULT '0',
    primary key (order_id, product_id),
    foreign key (order_id) references orders(id),
    foreign key (product_id) references products(id)
);

create table proposals
(
    id int primary key auto_increment,
    user_id int NOT NULL,
    name varchar(100) NOT NULL,
    phone varchar(100) NOT NULL,
    department_id int NOT NULL,
    summary varchar(255) NOT NULL,
    status tinyint DEFAULT '0',
    foreign key (user_id) references users(id),
    foreign key (department_id) references departments(id),
    created_at timestamp DEFAULT current_timestamp(),
    updated_at date NULL
);

create table proposal_details
(
    proposal_id int NOT NULL,
    product_id int NOT NULL,
    quantity int NOT NULL,
    status tinyint DEFAULT '0',
    primary key (proposal_id, product_id),
    foreign key (proposal_id) references proposals(id),
    foreign key (product_id) references products(id)
);

INSERT INTO `users` (`name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES
('Admin Manager', 'admin@gmail.com', '0986421127', '$2y$10$NtkqRiwKEIAUk56jXQg4zuxMtGp9jq83nTPTHf1rb/q8gKSr892YO', '2023-09-13 02:53:06', '2023-09-13');