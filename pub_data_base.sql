--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: feedback_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.feedback_enum AS ENUM (
    '1',
    '2',
    '3',
    '4',
    '5'
);


ALTER TYPE public.feedback_enum OWNER TO postgres;

--
-- Name: marketing_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.marketing_enum AS ENUM (
    'radio',
    'internet',
    'tv',
    'print'
);


ALTER TYPE public.marketing_enum OWNER TO postgres;

--
-- Name: mood; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.mood AS ENUM (
    'bankkártya',
    'készpénz'
);


ALTER TYPE public.mood OWNER TO postgres;

--
-- Name: tabel_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tabel_enum AS ENUM (
    'indoor',
    'outdoor',
    'backroom'
);


ALTER TYPE public.tabel_enum OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    id integer NOT NULL,
    zip smallint,
    settlements character varying(255),
    country character varying(255),
    street_name character varying(255),
    street_type character varying(255),
    house_number character varying(255),
    pub_id integer
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_id_seq OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_id_seq OWNED BY public.addresses.id;


--
-- Name: tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tables (
    id integer NOT NULL,
    chairs integer,
    type public.tabel_enum
);


ALTER TABLE public.tables OWNER TO postgres;

--
-- Name: asztalok_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asztalok_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asztalok_id_seq OWNER TO postgres;

--
-- Name: asztalok_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asztalok_id_seq OWNED BY public.tables.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    type character varying(255),
    num integer,
    pub_id integer
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: cath_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cath_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cath_id_seq OWNER TO postgres;

--
-- Name: cath_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cath_id_seq OWNED BY public.categories.id;


--
-- Name: drink_cat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drink_cat (
    id integer NOT NULL,
    cat character varying(255)
);


ALTER TABLE public.drink_cat OWNER TO postgres;

--
-- Name: drink_cat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drink_cat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drink_cat_id_seq OWNER TO postgres;

--
-- Name: drink_cat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drink_cat_id_seq OWNED BY public.drink_cat.id;


--
-- Name: drinks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drinks (
    id integer NOT NULL,
    name character varying(100),
    price integer,
    unit integer
);


ALTER TABLE public.drinks OWNER TO postgres;

--
-- Name: drinks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drinks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drinks_id_seq OWNER TO postgres;

--
-- Name: drinks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drinks_id_seq OWNED BY public.drinks.id;


--
-- Name: drinks_pub; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drinks_pub (
    pub_id integer,
    drinks_id integer
);


ALTER TABLE public.drinks_pub OWNER TO postgres;

--
-- Name: drinks_switch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drinks_switch (
    drink_cat_id integer,
    drinks_id integer
);


ALTER TABLE public.drinks_switch OWNER TO postgres;

--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    name character varying(255),
    type character varying(255),
    date timestamp without time zone
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_id_seq OWNER TO postgres;

--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_id_seq OWNED BY public.events.id;


--
-- Name: events_marketing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events_marketing (
    event_id integer,
    marketing_id integer
);


ALTER TABLE public.events_marketing OWNER TO postgres;

--
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feedbacks (
    id integer NOT NULL,
    feedback_point public.feedback_enum,
    feedback_text character varying(255),
    pub_id integer,
    users_id integer
);


ALTER TABLE public.feedbacks OWNER TO postgres;

--
-- Name: feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feedback_id_seq OWNER TO postgres;

--
-- Name: feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feedback_id_seq OWNED BY public.feedbacks.id;


--
-- Name: friends; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friends (
    users_id integer,
    firend_id integer
);


ALTER TABLE public.friends OWNER TO postgres;

--
-- Name: marketing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marketing (
    id integer NOT NULL,
    type public.marketing_enum,
    date_start date,
    date_end date,
    budget integer
);


ALTER TABLE public.marketing OWNER TO postgres;

--
-- Name: marketing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marketing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marketing_id_seq OWNER TO postgres;

--
-- Name: marketing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marketing_id_seq OWNED BY public.marketing.id;


--
-- Name: opening_hours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opening_hours (
    id integer NOT NULL,
    day character varying(255),
    open time without time zone,
    close time without time zone,
    pub_id integer,
    label boolean
);


ALTER TABLE public.opening_hours OWNER TO postgres;

--
-- Name: opening_hours_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opening_hours_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opening_hours_id_seq OWNER TO postgres;

--
-- Name: opening_hours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opening_hours_id_seq OWNED BY public.opening_hours.id;


--
-- Name: photos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.photos (
    id integer NOT NULL,
    name character varying(255),
    date date,
    event_id integer,
    pub_id integer
);


ALTER TABLE public.photos OWNER TO postgres;

--
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.photos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photos_id_seq OWNER TO postgres;

--
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.photos_id_seq OWNED BY public.photos.id;


--
-- Name: pubs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pubs (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(255),
    email character varying(255),
    fb character varying(255),
    address_id integer
);


ALTER TABLE public.pubs OWNER TO postgres;

--
-- Name: pub_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pub_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pub_id_seq OWNER TO postgres;

--
-- Name: pub_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pub_id_seq OWNED BY public.pubs.id;


--
-- Name: pub_tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pub_tables (
    pub_id integer,
    tables_id integer
);


ALTER TABLE public.pub_tables OWNER TO postgres;

--
-- Name: reservations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservations (
    id integer NOT NULL,
    tables integer,
    date date,
    "time" time without time zone,
    users_id integer,
    pub_id integer
);


ALTER TABLE public.reservations OWNER TO postgres;

--
-- Name: reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservation_id_seq OWNER TO postgres;

--
-- Name: reservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservation_id_seq OWNED BY public.reservations.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    payment public.mood,
    name character varying(100)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.cath_id_seq'::regclass);


--
-- Name: drink_cat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drink_cat ALTER COLUMN id SET DEFAULT nextval('public.drink_cat_id_seq'::regclass);


--
-- Name: drinks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drinks ALTER COLUMN id SET DEFAULT nextval('public.drinks_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);


--
-- Name: feedbacks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks ALTER COLUMN id SET DEFAULT nextval('public.feedback_id_seq'::regclass);


--
-- Name: marketing id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marketing ALTER COLUMN id SET DEFAULT nextval('public.marketing_id_seq'::regclass);


--
-- Name: opening_hours id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opening_hours ALTER COLUMN id SET DEFAULT nextval('public.opening_hours_id_seq'::regclass);


--
-- Name: photos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos ALTER COLUMN id SET DEFAULT nextval('public.photos_id_seq'::regclass);


--
-- Name: pubs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pubs ALTER COLUMN id SET DEFAULT nextval('public.pub_id_seq'::regclass);


--
-- Name: reservations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations ALTER COLUMN id SET DEFAULT nextval('public.reservation_id_seq'::regclass);


--
-- Name: tables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables ALTER COLUMN id SET DEFAULT nextval('public.asztalok_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (id, zip, settlements, country, street_name, street_type, house_number, pub_id) FROM stdin;
2	6750	Tiszasziget	Magyaroszág	Hajnal	utca	99A	1
1	6723	Szöged	Magyaroszág	Csillag	tér	30A	1
4	9878	Simonváros	Magyaroszág	Micsik	utca	7B	1
3	1723	Gyula	Magyaroszág	Tamás	tér	27B	1
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, type, num, pub_id) FROM stdin;
\.


--
-- Data for Name: drink_cat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drink_cat (id, cat) FROM stdin;
1	alkoholos
2	alkoholmentes
\.


--
-- Data for Name: drinks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drinks (id, name, price, unit) FROM stdin;
1	tequila	700	1
2	fröccs	400	1
3	narancslé	250	1
4	narancslé	250	1
\.


--
-- Data for Name: drinks_pub; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drinks_pub (pub_id, drinks_id) FROM stdin;
1	2
2	2
2	1
2	4
1	4
1	3
\.


--
-- Data for Name: drinks_switch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drinks_switch (drink_cat_id, drinks_id) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, name, type, date) FROM stdin;
1	Bebeasz-buli	full-retard	2019-03-15 20:00:00
2	Kamionosok&Kurvak	no-gay_party	2019-03-22 22:30:00
3	zero_tolerancia	just-coke	2019-03-31 21:30:00
4	girls_night_out	free-for-all	2019-04-06 23:30:00
\.


--
-- Data for Name: events_marketing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events_marketing (event_id, marketing_id) FROM stdin;
3	2
1	3
2	1
1	1
3	1
\.


--
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feedbacks (id, feedback_point, feedback_text, pub_id, users_id) FROM stdin;
1	5	faint volt	2	3
2	4	jo a buli, csak sok a kotsog	1	4
3	1	tele volt hanyva a budi	2	1
4	3	meleg volt a sor, de legalabb bogyos a pultoscsaj	3	5
5	5	prima hely, csak ajanlani tudom	1	2
\.


--
-- Data for Name: friends; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.friends (users_id, firend_id) FROM stdin;
1	2
3	4
5	6
7	8
9	10
11	12
13	14
15	16
17	11
18	19
\.


--
-- Data for Name: marketing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marketing (id, type, date_start, date_end, budget) FROM stdin;
1	radio	2019-03-07	2019-04-07	230000
2	internet	2019-03-07	2019-04-07	56000
3	tv	2019-03-25	2019-04-10	600000000
\.


--
-- Data for Name: opening_hours; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opening_hours (id, day, open, close, pub_id, label) FROM stdin;
1	Monday	14:00:00	23:00:00	1	f
2	Tuesday	14:00:00	23:00:00	1	f
3	Wednesday	14:00:00	23:00:00	1	f
4	Thuesday	14:00:00	23:00:00	1	f
5	Friday	12:00:00	02:00:00	1	f
6	Saturday	12:00:00	04:00:00	1	f
7	Sunday	10:00:00	20:00:00	1	f
8	Monday	20:00:00	23:00:00	1	t
9	Tuesday	20:00:00	23:00:00	1	t
10	Wednesday	20:00:00	23:00:00	1	t
11	Thuesday	20:00:00	23:00:00	1	t
12	Friday	18:00:00	23:00:00	1	t
13	Saturday	18:00:00	23:00:00	1	t
14	Sunday	18:00:00	21:00:00	1	t
\.


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.photos (id, name, date, event_id, pub_id) FROM stdin;
1	jpg001	2019-01-05	1	1
2	jpg002	2019-01-05	2	1
3	jpg003	2019-01-05	3	2
4	jpg004	2019-02-05	3	2
5	jpg005	2019-02-05	3	2
\.


--
-- Data for Name: pub_tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pub_tables (pub_id, tables_id) FROM stdin;
1	1
1	2
1	4
1	5
2	4
2	2
2	5
1	2
\.


--
-- Data for Name: pubs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pubs (id, name, phone, email, fb, address_id) FROM stdin;
1	Szamos	30987654321	szamos@szamos.hu	szamos@szamos.hu	1
2	Rózsa	304567829	rozsa@rozsa.hu	rozsa@rozsa.hu	3
3	Gól	303492819	gol@gol.hu	gol@gol.hu	2
\.


--
-- Data for Name: reservations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservations (id, tables, date, "time", users_id, pub_id) FROM stdin;
1	3	2019-03-23	00:20:20	3	1
2	6	2019-03-23	10:06:20	7	3
3	3	2019-03-20	12:30:00	9	2
\.


--
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tables (id, chairs, type) FROM stdin;
1	5	indoor
2	2	indoor
3	12	outdoor
4	7	backroom
5	4	backroom
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, payment, name) FROM stdin;
1	készpénz	Anita
2	készpénz	Dani
3	készpénz	Pecze
4	készpénz	Tamás
5	készpénz	Andor
6	készpénz	Tasi
7	készpénz	Szandra
8	készpénz	Zoli
9	készpénz	Simon
10	készpénz	Kata
11	készpénz	Györgyi
12	készpénz	Bálint
13	készpénz	T. Máté
14	készpénz	P. Máté
15	készpénz	Robi
16	készpénz	Móni
17	készpénz	Attila
18	készpénz	Feri
19	készpénz	Menobbik Feri
\.


--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_id_seq', 4, true);


--
-- Name: asztalok_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asztalok_id_seq', 1, false);


--
-- Name: cath_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cath_id_seq', 1, false);


--
-- Name: drink_cat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.drink_cat_id_seq', 2, true);


--
-- Name: drinks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.drinks_id_seq', 4, true);


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_id_seq', 1, false);


--
-- Name: feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feedback_id_seq', 1, false);


--
-- Name: marketing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marketing_id_seq', 1, false);


--
-- Name: opening_hours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opening_hours_id_seq', 14, true);


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.photos_id_seq', 5, true);


--
-- Name: pub_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pub_id_seq', 3, true);


--
-- Name: reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 19, true);


--
-- Name: addresses address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: tables asztalok_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT asztalok_pkey PRIMARY KEY (id);


--
-- Name: categories cath_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT cath_pkey PRIMARY KEY (id);


--
-- Name: drink_cat drink_cat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drink_cat
    ADD CONSTRAINT drink_cat_pkey PRIMARY KEY (id);


--
-- Name: drinks drinks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drinks
    ADD CONSTRAINT drinks_pkey PRIMARY KEY (id);


--
-- Name: events event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: feedbacks feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id);


--
-- Name: marketing marketing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marketing
    ADD CONSTRAINT marketing_pkey PRIMARY KEY (id);


--
-- Name: opening_hours opening_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opening_hours
    ADD CONSTRAINT opening_hours_pkey PRIMARY KEY (id);


--
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: pubs pub_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pubs
    ADD CONSTRAINT pub_pkey PRIMARY KEY (id);


--
-- Name: reservations reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: addresses address_pub_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT address_pub_id_fkey FOREIGN KEY (pub_id) REFERENCES public.pubs(id);


--
-- Name: categories cath_pub_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT cath_pub_id_fkey FOREIGN KEY (pub_id) REFERENCES public.pubs(id);


--
-- Name: drinks_pub drinks_pub_drinks_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drinks_pub
    ADD CONSTRAINT drinks_pub_drinks_id_fkey FOREIGN KEY (drinks_id) REFERENCES public.drinks(id);


--
-- Name: drinks_pub drinks_pub_pub_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drinks_pub
    ADD CONSTRAINT drinks_pub_pub_id_fkey FOREIGN KEY (pub_id) REFERENCES public.pubs(id);


--
-- Name: drinks_switch drinks_switch_drink_cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drinks_switch
    ADD CONSTRAINT drinks_switch_drink_cat_id_fkey FOREIGN KEY (drink_cat_id) REFERENCES public.drink_cat(id);


--
-- Name: drinks_switch drinks_switch_drinks_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drinks_switch
    ADD CONSTRAINT drinks_switch_drinks_id_fkey FOREIGN KEY (drinks_id) REFERENCES public.drinks(id);


--
-- Name: events_marketing event_marketing_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events_marketing
    ADD CONSTRAINT event_marketing_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: events_marketing event_marketing_marketing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events_marketing
    ADD CONSTRAINT event_marketing_marketing_id_fkey FOREIGN KEY (marketing_id) REFERENCES public.marketing(id);


--
-- Name: feedbacks feedback_pub_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedback_pub_id_fkey FOREIGN KEY (pub_id) REFERENCES public.pubs(id);


--
-- Name: feedbacks feedback_users_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedback_users_id_fkey FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: friends friends_user1_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_user1_id_fkey FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: friends friends_user2_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_user2_id_fkey FOREIGN KEY (firend_id) REFERENCES public.users(id);


--
-- Name: opening_hours opening_hours_pub_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opening_hours
    ADD CONSTRAINT opening_hours_pub_id_fkey FOREIGN KEY (pub_id) REFERENCES public.pubs(id);


--
-- Name: photos photos_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: photos photos_pub_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pub_id_fkey FOREIGN KEY (pub_id) REFERENCES public.pubs(id);


--
-- Name: pubs pub_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pubs
    ADD CONSTRAINT pub_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.addresses(id);


--
-- Name: pub_tables pub_tables_asztalok_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pub_tables
    ADD CONSTRAINT pub_tables_asztalok_id_fkey FOREIGN KEY (tables_id) REFERENCES public.tables(id);


--
-- Name: pub_tables pub_tables_pub_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pub_tables
    ADD CONSTRAINT pub_tables_pub_id_fkey FOREIGN KEY (pub_id) REFERENCES public.pubs(id);


--
-- Name: reservations reservation_pub_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservation_pub_id_fkey FOREIGN KEY (pub_id) REFERENCES public.pubs(id);


--
-- Name: reservations reservation_users_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservation_users_id_fkey FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

