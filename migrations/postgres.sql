PGDMP     1    !            	    {            postgres    15.4    15.4 '    4           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            5           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            6           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            7           1262    5    postgres    DATABASE     |   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE postgres;
                postgres    false            8           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3383                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            9           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    16518    employee    TABLE     �   CREATE TABLE public.employee (
    employeeid integer NOT NULL,
    postid integer,
    firstname character varying(20),
    lastname character varying(50),
    birthday date,
    phonenumber character varying(15),
    email character varying(50)
);
    DROP TABLE public.employee;
       public         heap    postgres    false            �            1259    16513    post    TABLE     �   CREATE TABLE public.post (
    postid integer NOT NULL,
    postname character varying(30),
    salary numeric(10,2),
    prize numeric(10,2)
);
    DROP TABLE public.post;
       public         heap    postgres    false            �            1259    16433    posts    TABLE     �   CREATE TABLE public.posts (
    postid integer NOT NULL,
    posttitle character varying(50),
    salary numeric(10,2),
    prize numeric(10,2)
);
    DROP TABLE public.posts;
       public         heap    postgres    false            �            1259    16538    product    TABLE     �   CREATE TABLE public.product (
    productid integer NOT NULL,
    productname character varying(50),
    description character varying(255),
    series character varying(50),
    department character varying(30),
    productcost numeric(5,2)
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16543    productsupplier    TABLE     W   CREATE TABLE public.productsupplier (
    productid integer,
    supplierid integer
);
 #   DROP TABLE public.productsupplier;
       public         heap    postgres    false            �            1259    16556    purchase    TABLE     �   CREATE TABLE public.purchase (
    purchaseid integer NOT NULL,
    purchasedate date,
    purchasetime time without time zone,
    productid integer,
    employeeid integer,
    storeid integer,
    purchasecost numeric(10,2)
);
    DROP TABLE public.purchase;
       public         heap    postgres    false            �            1259    16528    store    TABLE       CREATE TABLE public.store (
    storeid integer NOT NULL,
    adress character varying(50),
    timeopen time without time zone,
    timeclose time without time zone,
    storearea character varying(10),
    amoubtemployees integer,
    passability character varying(10)
);
    DROP TABLE public.store;
       public         heap    postgres    false            �            1259    16533    supplier    TABLE     �   CREATE TABLE public.supplier (
    supplierid integer NOT NULL,
    suppliername character varying(50),
    site character varying(50),
    email character varying(255),
    department character varying(30)
);
    DROP TABLE public.supplier;
       public         heap    postgres    false            �            1259    16448    users    TABLE     �   CREATE TABLE public.users (
    userid integer NOT NULL,
    firstname character varying(50),
    lastname character varying(50),
    age integer
);
    DROP TABLE public.users;
       public         heap    postgres    false            ,          0    16518    employee 
   TABLE DATA           i   COPY public.employee (employeeid, postid, firstname, lastname, birthday, phonenumber, email) FROM stdin;
    public          postgres    false    218   -       +          0    16513    post 
   TABLE DATA           ?   COPY public.post (postid, postname, salary, prize) FROM stdin;
    public          postgres    false    217   /-       )          0    16433    posts 
   TABLE DATA           A   COPY public.posts (postid, posttitle, salary, prize) FROM stdin;
    public          postgres    false    215   L-       /          0    16538    product 
   TABLE DATA           g   COPY public.product (productid, productname, description, series, department, productcost) FROM stdin;
    public          postgres    false    221   i-       0          0    16543    productsupplier 
   TABLE DATA           @   COPY public.productsupplier (productid, supplierid) FROM stdin;
    public          postgres    false    222   �-       1          0    16556    purchase 
   TABLE DATA           x   COPY public.purchase (purchaseid, purchasedate, purchasetime, productid, employeeid, storeid, purchasecost) FROM stdin;
    public          postgres    false    223   �-       -          0    16528    store 
   TABLE DATA           n   COPY public.store (storeid, adress, timeopen, timeclose, storearea, amoubtemployees, passability) FROM stdin;
    public          postgres    false    219   �-       .          0    16533    supplier 
   TABLE DATA           U   COPY public.supplier (supplierid, suppliername, site, email, department) FROM stdin;
    public          postgres    false    220   �-       *          0    16448    users 
   TABLE DATA           A   COPY public.users (userid, firstname, lastname, age) FROM stdin;
    public          postgres    false    216   �-       �           2606    16522    employee employee_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employeeid);
 @   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_pkey;
       public            postgres    false    218            �           2606    16517    post post_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (postid);
 8   ALTER TABLE ONLY public.post DROP CONSTRAINT post_pkey;
       public            postgres    false    217            �           2606    16437    posts posts_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (postid);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public            postgres    false    215            �           2606    16542    product product_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (productid);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    221            �           2606    16560    purchase purchase_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (purchaseid);
 @   ALTER TABLE ONLY public.purchase DROP CONSTRAINT purchase_pkey;
       public            postgres    false    223            �           2606    16532    store store_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_pkey PRIMARY KEY (storeid);
 :   ALTER TABLE ONLY public.store DROP CONSTRAINT store_pkey;
       public            postgres    false    219            �           2606    16537    supplier supplier_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supplierid);
 @   ALTER TABLE ONLY public.supplier DROP CONSTRAINT supplier_pkey;
       public            postgres    false    220            �           2606    16452    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    216            �           2606    16523    employee employee_postid_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_postid_fkey FOREIGN KEY (postid) REFERENCES public.post(postid);
 G   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_postid_fkey;
       public          postgres    false    217    3210    218            �           2606    16546 .   productsupplier productsupplier_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productsupplier
    ADD CONSTRAINT productsupplier_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid);
 X   ALTER TABLE ONLY public.productsupplier DROP CONSTRAINT productsupplier_productid_fkey;
       public          postgres    false    221    3218    222            �           2606    16551 /   productsupplier productsupplier_supplierid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productsupplier
    ADD CONSTRAINT productsupplier_supplierid_fkey FOREIGN KEY (supplierid) REFERENCES public.supplier(supplierid);
 Y   ALTER TABLE ONLY public.productsupplier DROP CONSTRAINT productsupplier_supplierid_fkey;
       public          postgres    false    220    222    3216            �           2606    16566 !   purchase purchase_employeeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_employeeid_fkey FOREIGN KEY (employeeid) REFERENCES public.employee(employeeid);
 K   ALTER TABLE ONLY public.purchase DROP CONSTRAINT purchase_employeeid_fkey;
       public          postgres    false    218    223    3212            �           2606    16561     purchase purchase_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid);
 J   ALTER TABLE ONLY public.purchase DROP CONSTRAINT purchase_productid_fkey;
       public          postgres    false    221    3218    223            �           2606    16571    purchase purchase_storeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_storeid_fkey FOREIGN KEY (storeid) REFERENCES public.store(storeid);
 H   ALTER TABLE ONLY public.purchase DROP CONSTRAINT purchase_storeid_fkey;
       public          postgres    false    223    3214    219            ,      x������ � �      +      x������ � �      )      x������ � �      /      x������ � �      0      x������ � �      1      x������ � �      -      x������ � �      .      x������ � �      *      x������ � �     