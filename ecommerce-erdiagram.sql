BEGIN;


CREATE TABLE IF NOT EXISTS public.categories
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name character varying NOT NULL,
    type character varying NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.products
(
    id integer NOT NULL,
    name character varying NOT NULL,
    unit_price money NOT NULL,
    stock integer NOT NULL,
    category_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.sellers
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name character varying NOT NULL,
    rating integer NOT NULL,
    follower_count integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.product_sellers
(
    product_id integer NOT NULL,
    seller_id integer NOT NULL,
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.customers
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    email character varying NOT NULL,
    phone integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.baskets
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    total_price money NOT NULL,
    product_id integer NOT NULL,
    customer_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.addresses
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    title character varying NOT NULL,
    customer_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.countries
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name character varying NOT NULL,
    address_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.cities
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name character varying NOT NULL,
    country_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.districts
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name character varying NOT NULL,
    city_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.streets
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name character varying NOT NULL,
    district_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.brands
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name character varying NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.product_brand
(
    product_id integer NOT NULL,
    brand_id integer NOT NULL,
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.colors
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name character varying NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.product_color
(
    product_id integer NOT NULL,
    color_id integer NOT NULL,
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.size
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name character varying NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.product_size
(
    product_id integer NOT NULL,
    size_id integer NOT NULL,
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.orders
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    customer_id integer NOT NULL,
    cargo_company_id integer NOT NULL,
    shipping_address_id integer NOT NULL,
    invoice_address_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.order_details
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    order_number integer NOT NULL,
    quantity integer NOT NULL,
    product_id integer NOT NULL,
    order_id integer NOT NULL,
    order_total_price money NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.cargo_companies
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    cargo_details character varying NOT NULL,
    cargo_date date NOT NULL,
    name character varying NOT NULL,
    order_return_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.order_returns
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    total_price money NOT NULL,
    order_detail_id integer NOT NULL,
    number_of_returns integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.product_return
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    order_return_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.refund
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    message character varying NOT NULL,
    order_return_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.shippers
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name character varying NOT NULL,
    cargo_company_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.payments
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    payment_type character varying NOT NULL,
    payment_date date NOT NULL,
    payment_description character varying NOT NULL,
    order_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.payment_types
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    type_name character varying NOT NULL,
    payment_id integer NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.products
    ADD CONSTRAINT product_category_fk FOREIGN KEY (category_id)
    REFERENCES public.categories (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.product_sellers
    ADD FOREIGN KEY (product_id)
    REFERENCES public.products (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.product_sellers
    ADD FOREIGN KEY (seller_id)
    REFERENCES public.sellers (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.baskets
    ADD CONSTRAINT product_basket_fk FOREIGN KEY (product_id)
    REFERENCES public.products (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.baskets
    ADD CONSTRAINT customer_basket_fk FOREIGN KEY (customer_id)
    REFERENCES public.customers (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.addresses
    ADD CONSTRAINT customer_address_fk FOREIGN KEY (customer_id)
    REFERENCES public.customers (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.countries
    ADD CONSTRAINT address_countries_fk FOREIGN KEY (address_id)
    REFERENCES public.addresses (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.cities
    ADD CONSTRAINT cities_country_fk FOREIGN KEY (country_id)
    REFERENCES public.countries (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.districts
    ADD CONSTRAINT city_district_fk FOREIGN KEY (city_id)
    REFERENCES public.cities (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.streets
    ADD CONSTRAINT street_district_fk FOREIGN KEY (district_id)
    REFERENCES public.districts (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.product_brand
    ADD FOREIGN KEY (brand_id)
    REFERENCES public.brands (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.product_brand
    ADD FOREIGN KEY (product_id)
    REFERENCES public.products (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.product_color
    ADD FOREIGN KEY (color_id)
    REFERENCES public.colors (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.product_color
    ADD FOREIGN KEY (product_id)
    REFERENCES public.products (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.product_size
    ADD FOREIGN KEY (size_id)
    REFERENCES public.size (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.product_size
    ADD FOREIGN KEY (product_id)
    REFERENCES public.products (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.orders
    ADD CONSTRAINT customer_order_fk FOREIGN KEY (customer_id)
    REFERENCES public.customers (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.orders
    ADD CONSTRAINT shipping_address_fk FOREIGN KEY (shipping_address_id)
    REFERENCES public.addresses (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.orders
    ADD CONSTRAINT invoice_address_fk FOREIGN KEY (invoice_address_id)
    REFERENCES public.addresses (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.orders
    ADD CONSTRAINT company_order_fk FOREIGN KEY (cargo_company_id)
    REFERENCES public.cargo_companies (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.order_details
    ADD CONSTRAINT order_product_fk FOREIGN KEY (product_id)
    REFERENCES public.products (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.order_details
    ADD CONSTRAINT detail_order_fk FOREIGN KEY (order_id)
    REFERENCES public.orders (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.cargo_companies
    ADD CONSTRAINT cargo_return_fk FOREIGN KEY (order_return_id)
    REFERENCES public.order_returns (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.order_returns
    ADD CONSTRAINT return_order_fk FOREIGN KEY (order_detail_id)
    REFERENCES public.order_details (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.product_return
    ADD CONSTRAINT return_order_fk FOREIGN KEY (order_return_id)
    REFERENCES public.order_returns (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.refund
    ADD CONSTRAINT refund_order_fk FOREIGN KEY (order_return_id)
    REFERENCES public.order_returns (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.shippers
    ADD CONSTRAINT shipper_company_fk FOREIGN KEY (cargo_company_id)
    REFERENCES public.cargo_companies (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.payments
    ADD CONSTRAINT payment_order_fk FOREIGN KEY (order_id)
    REFERENCES public.orders (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.payment_types
    ADD CONSTRAINT payment_type_fk FOREIGN KEY (payment_id)
    REFERENCES public.payments (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;