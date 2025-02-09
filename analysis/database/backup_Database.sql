PGDMP     0                    y            database-delivery    13.1    13.1 8    "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            %           1262    25656    database-delivery    DATABASE     s   CREATE DATABASE "database-delivery" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';
 #   DROP DATABASE "database-delivery";
                postgres    false                        3079    25657 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            &           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            �            1259    25794    address_stores    TABLE     Q  CREATE TABLE public.address_stores (
    id_address uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    city character varying(100) NOT NULL,
    district character varying(100) NOT NULL,
    street character varying(100) NOT NULL,
    cep numeric(8,0),
    details character varying(100) NOT NULL,
    stores_id_store uuid NOT NULL
);
 "   DROP TABLE public.address_stores;
       public         heap    postgres    false    2            �            1259    25668    address_users    TABLE     -  CREATE TABLE public.address_users (
    id_address uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    city character varying(100) NOT NULL,
    district character varying(100) NOT NULL,
    street character varying(100) NOT NULL,
    cep numeric(8,0),
    details character varying(100) NOT NULL
);
 !   DROP TABLE public.address_users;
       public         heap    postgres    false    2            �            1259    25778    denunciations_stores    TABLE     D  CREATE TABLE public.denunciations_stores (
    id_complaint uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    users_id_user uuid NOT NULL,
    stores_id_store uuid NOT NULL,
    type character varying(60) NOT NULL,
    details character varying(200) NOT NULL,
    status character varying(100),
    date date NOT NULL
);
 (   DROP TABLE public.denunciations_stores;
       public         heap    postgres    false    2            �            1259    25762    denunciations_users    TABLE     C  CREATE TABLE public.denunciations_users (
    id_complaint uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    users_id_user uuid NOT NULL,
    stores_id_store uuid NOT NULL,
    type character varying(60) NOT NULL,
    details character varying(200) NOT NULL,
    status character varying(100),
    date date NOT NULL
);
 '   DROP TABLE public.denunciations_users;
       public         heap    postgres    false    2            �            1259    25736    ingredients    TABLE     T  CREATE TABLE public.ingredients (
    id_ingredient uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    status character varying(100),
    value numeric(3,2) NOT NULL,
    amount integer NOT NULL,
    expiration_date date,
    products_id_product uuid NOT NULL,
    extra boolean DEFAULT false
);
    DROP TABLE public.ingredients;
       public         heap    postgres    false    2            �            1259    25805    orders    TABLE     �  CREATE TABLE public.orders (
    id_order uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    delivery_date date,
    order_date date NOT NULL,
    details_order json,
    value numeric(8,2) NOT NULL,
    amount integer NOT NULL,
    form_of_payment character varying(60) NOT NULL,
    products_id_product uuid NOT NULL,
    users_id_user uuid NOT NULL,
    id_payments_user uuid
);
    DROP TABLE public.orders;
       public         heap    postgres    false    2            �            1259    25748    payments_stores    TABLE     �   CREATE TABLE public.payments_stores (
    id_payment uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100),
    details json NOT NULL,
    stores_id_store uuid
);
 #   DROP TABLE public.payments_stores;
       public         heap    postgres    false    2            �            1259    25693    payments_users    TABLE     �   CREATE TABLE public.payments_users (
    id_payment uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100),
    details json NOT NULL,
    users_id_user uuid
);
 "   DROP TABLE public.payments_users;
       public         heap    postgres    false    2            �            1259    25722    products    TABLE     �  CREATE TABLE public.products (
    id_product uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    value numeric(4,2) NOT NULL,
    amount integer NOT NULL,
    expiration_date date NOT NULL,
    img_urls json NOT NULL,
    coupons json,
    details character varying(100) NOT NULL,
    status character varying(100),
    assessments json,
    stores_id_store uuid NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false    2            �            1259    25707    stores    TABLE     )  CREATE TABLE public.stores (
    id_store uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(60) NOT NULL,
    password character varying(60) NOT NULL,
    cnpj character varying(60) NOT NULL,
    service_addresses json NOT NULL,
    phone character varying(15),
    img_url json,
    details json,
    status character varying(60) DEFAULT 'FECHADO'::character varying,
    categories json,
    tokens json,
    is_blocked boolean DEFAULT false,
    registration_date date NOT NULL
);
    DROP TABLE public.stores;
       public         heap    postgres    false    2            �            1259    25674    users    TABLE     �  CREATE TABLE public.users (
    id_user uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(60) NOT NULL,
    password character varying(60) NOT NULL,
    phone character varying(15),
    address_user uuid,
    tokens json,
    cpf numeric(12,0) NOT NULL,
    is_blocked boolean DEFAULT false,
    registration_date date NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false    2                      0    25794    address_stores 
   TABLE DATA           k   COPY public.address_stores (id_address, city, district, street, cep, details, stores_id_store) FROM stdin;
    public          postgres    false    210   �P                 0    25668    address_users 
   TABLE DATA           Y   COPY public.address_users (id_address, city, district, street, cep, details) FROM stdin;
    public          postgres    false    201   �P                 0    25778    denunciations_stores 
   TABLE DATA           y   COPY public.denunciations_stores (id_complaint, users_id_user, stores_id_store, type, details, status, date) FROM stdin;
    public          postgres    false    209   �P                 0    25762    denunciations_users 
   TABLE DATA           x   COPY public.denunciations_users (id_complaint, users_id_user, stores_id_store, type, details, status, date) FROM stdin;
    public          postgres    false    208   Q                 0    25736    ingredients 
   TABLE DATA           ~   COPY public.ingredients (id_ingredient, name, status, value, amount, expiration_date, products_id_product, extra) FROM stdin;
    public          postgres    false    206   +Q                 0    25805    orders 
   TABLE DATA           �   COPY public.orders (id_order, delivery_date, order_date, details_order, value, amount, form_of_payment, products_id_product, users_id_user, id_payments_user) FROM stdin;
    public          postgres    false    211   HQ                 0    25748    payments_stores 
   TABLE DATA           U   COPY public.payments_stores (id_payment, name, details, stores_id_store) FROM stdin;
    public          postgres    false    207   eQ                 0    25693    payments_users 
   TABLE DATA           R   COPY public.payments_users (id_payment, name, details, users_id_user) FROM stdin;
    public          postgres    false    203   �Q                 0    25722    products 
   TABLE DATA           �   COPY public.products (id_product, name, value, amount, expiration_date, img_urls, coupons, details, status, assessments, stores_id_store) FROM stdin;
    public          postgres    false    205   �Q                 0    25707    stores 
   TABLE DATA           �   COPY public.stores (id_store, name, email, password, cnpj, service_addresses, phone, img_url, details, status, categories, tokens, is_blocked, registration_date) FROM stdin;
    public          postgres    false    204   �Q                 0    25674    users 
   TABLE DATA           �   COPY public.users (id_user, name, email, password, phone, address_user, tokens, cpf, is_blocked, registration_date) FROM stdin;
    public          postgres    false    202   �Q       �           2606    25799 "   address_stores address_stores_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.address_stores
    ADD CONSTRAINT address_stores_pkey PRIMARY KEY (id_address);
 L   ALTER TABLE ONLY public.address_stores DROP CONSTRAINT address_stores_pkey;
       public            postgres    false    210            i           2606    25673     address_users address_users_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.address_users
    ADD CONSTRAINT address_users_pkey PRIMARY KEY (id_address);
 J   ALTER TABLE ONLY public.address_users DROP CONSTRAINT address_users_pkey;
       public            postgres    false    201            �           2606    25783 .   denunciations_stores denunciations_stores_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.denunciations_stores
    ADD CONSTRAINT denunciations_stores_pkey PRIMARY KEY (id_complaint);
 X   ALTER TABLE ONLY public.denunciations_stores DROP CONSTRAINT denunciations_stores_pkey;
       public            postgres    false    209                       2606    25767 ,   denunciations_users denunciations_users_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.denunciations_users
    ADD CONSTRAINT denunciations_users_pkey PRIMARY KEY (id_complaint);
 V   ALTER TABLE ONLY public.denunciations_users DROP CONSTRAINT denunciations_users_pkey;
       public            postgres    false    208            {           2606    25742    ingredients ingredients_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id_ingredient);
 F   ALTER TABLE ONLY public.ingredients DROP CONSTRAINT ingredients_pkey;
       public            postgres    false    206            �           2606    25813    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id_order);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    211            }           2606    25756 $   payments_stores payments_stores_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.payments_stores
    ADD CONSTRAINT payments_stores_pkey PRIMARY KEY (id_payment);
 N   ALTER TABLE ONLY public.payments_stores DROP CONSTRAINT payments_stores_pkey;
       public            postgres    false    207            q           2606    25701 "   payments_users payments_users_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.payments_users
    ADD CONSTRAINT payments_users_pkey PRIMARY KEY (id_payment);
 L   ALTER TABLE ONLY public.payments_users DROP CONSTRAINT payments_users_pkey;
       public            postgres    false    203            y           2606    25730    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id_product);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    205            s           2606    25719    stores stores_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_email_key UNIQUE (email);
 A   ALTER TABLE ONLY public.stores DROP CONSTRAINT stores_email_key;
       public            postgres    false    204            u           2606    25721    stores stores_password_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_password_key UNIQUE (password);
 D   ALTER TABLE ONLY public.stores DROP CONSTRAINT stores_password_key;
       public            postgres    false    204            w           2606    25717    stores stores_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id_store);
 <   ALTER TABLE ONLY public.stores DROP CONSTRAINT stores_pkey;
       public            postgres    false    204            k           2606    25687    users users_cpf_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cpf_key UNIQUE (cpf);
 =   ALTER TABLE ONLY public.users DROP CONSTRAINT users_cpf_key;
       public            postgres    false    202            m           2606    25685    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    202            o           2606    25683    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    202            �           2606    25800 2   address_stores address_stores_stores_id_store_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.address_stores
    ADD CONSTRAINT address_stores_stores_id_store_fkey FOREIGN KEY (stores_id_store) REFERENCES public.stores(id_store);
 \   ALTER TABLE ONLY public.address_stores DROP CONSTRAINT address_stores_stores_id_store_fkey;
       public          postgres    false    2935    204    210            �           2606    25789 >   denunciations_stores denunciations_stores_stores_id_store_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denunciations_stores
    ADD CONSTRAINT denunciations_stores_stores_id_store_fkey FOREIGN KEY (stores_id_store) REFERENCES public.stores(id_store);
 h   ALTER TABLE ONLY public.denunciations_stores DROP CONSTRAINT denunciations_stores_stores_id_store_fkey;
       public          postgres    false    2935    204    209            �           2606    25784 <   denunciations_stores denunciations_stores_users_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denunciations_stores
    ADD CONSTRAINT denunciations_stores_users_id_user_fkey FOREIGN KEY (users_id_user) REFERENCES public.users(id_user);
 f   ALTER TABLE ONLY public.denunciations_stores DROP CONSTRAINT denunciations_stores_users_id_user_fkey;
       public          postgres    false    2927    209    202            �           2606    25773 <   denunciations_users denunciations_users_stores_id_store_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denunciations_users
    ADD CONSTRAINT denunciations_users_stores_id_store_fkey FOREIGN KEY (stores_id_store) REFERENCES public.stores(id_store);
 f   ALTER TABLE ONLY public.denunciations_users DROP CONSTRAINT denunciations_users_stores_id_store_fkey;
       public          postgres    false    208    2935    204            �           2606    25768 :   denunciations_users denunciations_users_users_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denunciations_users
    ADD CONSTRAINT denunciations_users_users_id_user_fkey FOREIGN KEY (users_id_user) REFERENCES public.users(id_user);
 d   ALTER TABLE ONLY public.denunciations_users DROP CONSTRAINT denunciations_users_users_id_user_fkey;
       public          postgres    false    202    2927    208            �           2606    25743 0   ingredients ingredients_products_id_product_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_products_id_product_fkey FOREIGN KEY (products_id_product) REFERENCES public.products(id_product);
 Z   ALTER TABLE ONLY public.ingredients DROP CONSTRAINT ingredients_products_id_product_fkey;
       public          postgres    false    2937    206    205            �           2606    25824 #   orders orders_id_payments_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_id_payments_user_fkey FOREIGN KEY (id_payments_user) REFERENCES public.payments_users(id_payment);
 M   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_id_payments_user_fkey;
       public          postgres    false    211    203    2929            �           2606    25814 &   orders orders_products_id_product_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_products_id_product_fkey FOREIGN KEY (products_id_product) REFERENCES public.products(id_product);
 P   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_products_id_product_fkey;
       public          postgres    false    2937    205    211            �           2606    25819     orders orders_users_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_users_id_user_fkey FOREIGN KEY (users_id_user) REFERENCES public.users(id_user);
 J   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_users_id_user_fkey;
       public          postgres    false    2927    202    211            �           2606    25757 4   payments_stores payments_stores_stores_id_store_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments_stores
    ADD CONSTRAINT payments_stores_stores_id_store_fkey FOREIGN KEY (stores_id_store) REFERENCES public.stores(id_store);
 ^   ALTER TABLE ONLY public.payments_stores DROP CONSTRAINT payments_stores_stores_id_store_fkey;
       public          postgres    false    207    2935    204            �           2606    25702 0   payments_users payments_users_users_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments_users
    ADD CONSTRAINT payments_users_users_id_user_fkey FOREIGN KEY (users_id_user) REFERENCES public.users(id_user);
 Z   ALTER TABLE ONLY public.payments_users DROP CONSTRAINT payments_users_users_id_user_fkey;
       public          postgres    false    203    2927    202            �           2606    25731 &   products products_stores_id_store_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_stores_id_store_fkey FOREIGN KEY (stores_id_store) REFERENCES public.stores(id_store);
 P   ALTER TABLE ONLY public.products DROP CONSTRAINT products_stores_id_store_fkey;
       public          postgres    false    2935    204    205            �           2606    25688    users users_address_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_address_user_fkey FOREIGN KEY (address_user) REFERENCES public.address_users(id_address);
 G   ALTER TABLE ONLY public.users DROP CONSTRAINT users_address_user_fkey;
       public          postgres    false    2921    202    201                  x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     