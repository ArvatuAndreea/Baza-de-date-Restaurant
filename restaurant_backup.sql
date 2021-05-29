--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    adr_id integer NOT NULL,
    street character varying(20),
    house_number integer,
    zip integer
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article (
    article_id integer NOT NULL,
    name character varying(50),
    price integer,
    vat integer
);


ALTER TABLE public.article OWNER TO postgres;

--
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    zip integer NOT NULL,
    city character varying(20)
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    p_id integer NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    p_id integer NOT NULL,
    employee_p_id integer
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice (
    invoice_no integer NOT NULL,
    date1 date,
    time1 character varying(50),
    r_id integer,
    p_id_emp integer,
    p_id_cust integer
);


ALTER TABLE public.invoice OWNER TO postgres;

--
-- Name: invoice_article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice_article (
    invoice_no integer NOT NULL,
    article_id integer NOT NULL,
    price integer,
    vat integer
);


ALTER TABLE public.invoice_article OWNER TO postgres;

--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    p_id integer NOT NULL,
    surname character varying(20),
    first_name character varying(20),
    sex character varying(1),
    birthdate date,
    adr_id integer,
    category character varying(50),
    CONSTRAINT const_sex_enum CHECK (((sex)::text = ANY ((ARRAY['F'::character varying, 'M'::character varying])::text[])))
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: restaurant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant (
    r_id integer NOT NULL,
    name character varying(20),
    phone character varying(10),
    fax character varying(12),
    adr_id integer
);


ALTER TABLE public.restaurant OWNER TO postgres;

--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (adr_id, street, house_number, zip) FROM stdin;
1	Calea Bucuresti	12	1
2	Zizinului	6	1
3	Carpati	25	3
4	Negru Voda	18	4
5	Aurora	93	2
6	Vale	203	3
7	Iuliu Maniu	8151	3
8	Rosiorilor	8040	5
9	Taubstummengasse	1020	1
\.


--
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article (article_id, name, price, vat) FROM stdin;
4321	Cola	3	0
4322	Fanta	10	2
4323	Pepsi	2	1
\.


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (zip, city) FROM stdin;
1	Brasov
2	Bucuresti
3	Campulung
4	Pitesti
5	Iasi
8151	Brasov
8040	Bucuresti
1020	Wien
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (p_id) FROM stdin;
2
4
6
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (p_id, employee_p_id) FROM stdin;
1	\N
3	\N
5	\N
\.


--
-- Data for Name: invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoice (invoice_no, date1, time1, r_id, p_id_emp, p_id_cust) FROM stdin;
1111	2010-10-10	14:00:00	123456	1	2
2222	2010-12-15	14:00:00	234567	3	4
3333	2011-03-06	14:00:00	345678	5	6
\.


--
-- Data for Name: invoice_article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoice_article (invoice_no, article_id, price, vat) FROM stdin;
1111	4321	3	0
2222	4322	10	2
3333	4323	8	1
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (p_id, surname, first_name, sex, birthdate, adr_id, category) FROM stdin;
1	Arvatu	Andreea	F	2000-12-03	6	\N
2	Arvatu	Alexandru	M	2016-06-16	6	\N
3	Popescu	Adrian	M	1996-03-26	4	\N
4	Gava	Adina	F	1990-11-13	2	\N
5	Baciu	Mihaela	F	2001-04-20	3	\N
6	Kent	Clark	M	1972-03-24	3	Employee
7	Lane	Lois	F	1987-12-21	2	Customer
8	Bugs	Bunny	M	1988-04-30	2	Employee
9	Indiana	Jones	M	1965-08-05	2	Customer
10	Marie	Antoinette	F	2000-09-24	3	Employee
11	Janet	Jackson	F	1988-10-23	1	Customer
\.


--
-- Data for Name: restaurant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurant (r_id, name, phone, fax, adr_id) FROM stdin;
1	Panini	0248928364	028189402	4
2	Amada	0272838031	0258829168	5
3	Elion	0253782938	0253782930	1
4	Play	0248939392	0248298930	3
5	KFC	0256282773	0278198269	2
123456	Cafe 23	03458720	031541756	1
234567	Wan Tan	0542610	03154756	2
345678	Times	08745220	03451556	3
\.


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (adr_id);


--
-- Name: article article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (article_id);


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (zip);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (p_id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (p_id);


--
-- Name: invoice_article invoice_article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_article
    ADD CONSTRAINT invoice_article_pkey PRIMARY KEY (invoice_no, article_id);


--
-- Name: invoice invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (invoice_no);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (p_id);


--
-- Name: restaurant restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT restaurant_pkey PRIMARY KEY (r_id);


--
-- Name: address address_zip_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_zip_fkey FOREIGN KEY (zip) REFERENCES public.city(zip);


--
-- Name: customer customer_p_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_p_id_fkey FOREIGN KEY (p_id) REFERENCES public.person(p_id);


--
-- Name: employee employee_p_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_p_id_fkey FOREIGN KEY (p_id) REFERENCES public.person(p_id);


--
-- Name: invoice_article invoice_article_article_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_article
    ADD CONSTRAINT invoice_article_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.article(article_id);


--
-- Name: invoice_article invoice_article_invoice_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_article
    ADD CONSTRAINT invoice_article_invoice_no_fkey FOREIGN KEY (invoice_no) REFERENCES public.invoice(invoice_no);


--
-- Name: invoice invoice_p_id_cust_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_p_id_cust_fkey FOREIGN KEY (p_id_cust) REFERENCES public.person(p_id);


--
-- Name: invoice invoice_p_id_emp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_p_id_emp_fkey FOREIGN KEY (p_id_emp) REFERENCES public.person(p_id);


--
-- Name: invoice invoice_r_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_r_id_fkey FOREIGN KEY (r_id) REFERENCES public.restaurant(r_id);


--
-- Name: person person_adr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_adr_id_fkey FOREIGN KEY (adr_id) REFERENCES public.address(adr_id);


--
-- Name: restaurant restaurant_adr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT restaurant_adr_id_fkey FOREIGN KEY (adr_id) REFERENCES public.address(adr_id);


--
-- PostgreSQL database dump complete
--

