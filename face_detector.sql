--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

-- Started on 2021-02-03 23:15:21

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'WIN1255';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 16471)
-- Name: login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login (
    id integer NOT NULL,
    hash character varying(100) NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.login OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16469)
-- Name: login_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login_id_seq OWNER TO postgres;

--
-- TOC entry 3008 (class 0 OID 0)
-- Dependencies: 202
-- Name: login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.login_id_seq OWNED BY public.login.id;


--
-- TOC entry 201 (class 1259 OID 16457)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100),
    email text NOT NULL,
    entries bigint DEFAULT 0,
    joined timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16455)
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
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 200
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2860 (class 2604 OID 16474)
-- Name: login id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login ALTER COLUMN id SET DEFAULT nextval('public.login_id_seq'::regclass);


--
-- TOC entry 2858 (class 2604 OID 16460)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3002 (class 0 OID 16471)
-- Dependencies: 203
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login (id, hash, email) FROM stdin;
1	$2b$10$XMzwlKDPiwI8rPPBectItuj8pCPf990iNv948DeY0ZxBWGupS8H8C	an@gmail.com
2	$2b$10$KCAZIl/muezwnRqnX6MLWO2olGjTKCPKzc1SZZqHs/r6J8OjsmhEe	an2@gmail.com
3	$2b$10$8cUvQrt2Eog3lZRW5Ife3uZuFZVoLwkEdhL03f67gfG8NbgKPMY/e	an3@gmail.com
4	$2b$10$FeD3TWa4qm.uosjidV0pQ.BFiS5LCG28iArK9eNNJvRNYBl2dT2Wa	eddy@gmail.com
5	$2b$10$.67AnbMywPa3eq9s3VmvCuMc4i6S794KUYoD8rEayDBFEeO0XzegC	yoland@gmail.com
6	asf	fasdf
7	$2b$10$YoyJw3l41flmZ1I9fO8ycuM9AUeHyp381SyHVQtKuoK3vhQIuNtC2	a
8	$2b$10$JFtwKSXxMDp3KdsOJb8XVuxLO/uk1lHeabLBato8zq/elWD8nAsOG	b
9	$2b$10$5IqoTrWd.91gQ4f3H.u1CeR.ixjZ/dNyU.Go6byF/aU3OMdNiOUJ2	tim
10	$2b$10$3UbFWarh9ZuIR8r/w2LCJ.u6a4l8GGznTZPXeByqDBM.2mvqV6SWS	z
11	$2b$10$zFQM/rBNLQEkbOYVlCqTde2lh9/NKmTLbkL1w/ys30OtqJT7nSmCi	j
\.


--
-- TOC entry 3000 (class 0 OID 16457)
-- Dependencies: 201
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, entries, joined) FROM stdin;
2	John	john@gmail.com	0	2021-01-29 14:32:41.245
3	Anne	anne@gmail.com	0	2021-01-29 14:33:30.028
5	Amy	theamy@gmail.com	6	2021-01-29 14:43:02.16
1	Ann	ann@gmail.com	3	2021-01-29 14:19:09.143
6	An	{"an@gmail.com"}	0	2021-01-31 01:12:00.853
7	An2	an2@gmail.com	0	2021-01-31 01:13:59.701
8	eddy	eddy@gmail.com	0	2021-01-31 01:38:11.338
9	Yolanda	yolanda@gmail.com	1	2021-01-31 12:52:19.778
11	b	b	2	2021-02-01 01:01:02.159
12	tim	tim	0	2021-02-01 12:16:07.799
10	a	a	3	2021-02-01 01:00:31.476
13	z	z	12	2021-02-01 23:52:52.686
14	j	j	1	2021-02-02 18:38:19.389
\.


--
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 202
-- Name: login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.login_id_seq', 11, true);


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 200
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 14, true);


--
-- TOC entry 2866 (class 2606 OID 16481)
-- Name: login login_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_email_key UNIQUE (email);


--
-- TOC entry 2868 (class 2606 OID 16479)
-- Name: login login_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 16468)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 2864 (class 2606 OID 16466)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2021-02-03 23:15:22

--
-- PostgreSQL database dump complete
--

