--
-- PostgreSQL database dump
--

-- Dumped from database version 10.8
-- Dumped by pg_dump version 10.8

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: appacademy
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO appacademy;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: appacademy
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO appacademy;

--
-- Name: shortened_urls; Type: TABLE; Schema: public; Owner: appacademy
--

CREATE TABLE public.shortened_urls (
    id bigint NOT NULL,
    short_url character varying NOT NULL,
    long_url character varying NOT NULL,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.shortened_urls OWNER TO appacademy;

--
-- Name: shortened_urls_id_seq; Type: SEQUENCE; Schema: public; Owner: appacademy
--

CREATE SEQUENCE public.shortened_urls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shortened_urls_id_seq OWNER TO appacademy;

--
-- Name: shortened_urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appacademy
--

ALTER SEQUENCE public.shortened_urls_id_seq OWNED BY public.shortened_urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: appacademy
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO appacademy;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: appacademy
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO appacademy;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appacademy
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: visits; Type: TABLE; Schema: public; Owner: appacademy
--

CREATE TABLE public.visits (
    id bigint NOT NULL,
    shortened_url_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.visits OWNER TO appacademy;

--
-- Name: visits_id_seq; Type: SEQUENCE; Schema: public; Owner: appacademy
--

CREATE SEQUENCE public.visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visits_id_seq OWNER TO appacademy;

--
-- Name: visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appacademy
--

ALTER SEQUENCE public.visits_id_seq OWNED BY public.visits.id;


--
-- Name: shortened_urls id; Type: DEFAULT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY public.shortened_urls ALTER COLUMN id SET DEFAULT nextval('public.shortened_urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: visits id; Type: DEFAULT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY public.visits ALTER COLUMN id SET DEFAULT nextval('public.visits_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: appacademy
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2019-05-29 22:01:47.802993	2019-05-29 22:01:47.802993
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: appacademy
--

COPY public.schema_migrations (version) FROM stdin;
20190529215528
20190529221158
20190529231607
\.


--
-- Data for Name: shortened_urls; Type: TABLE DATA; Schema: public; Owner: appacademy
--

COPY public.shortened_urls (id, short_url, long_url, user_id, created_at, updated_at) FROM stdin;
1	short.com	longer.com	1	2019-05-29 22:25:30.890845	2019-05-29 22:25:30.890845
2	AInP87HfosRWUwOc4t8tqg	google.com	1	2019-05-29 23:09:32.72924	2019-05-29 23:09:32.72924
3	Yu0FVJDPVxlFZsc5Ls6T-Q	reddit.com	3	2019-05-29 23:13:47.455665	2019-05-29 23:13:47.455665
4	9pNDCEhrQlx6AjeRJnm2BQ	instagram.com	4	2019-05-29 23:14:01.099522	2019-05-29 23:14:01.099522
5	cf_2MHuiFvNa_fRsHgIrSA	facebook.com	5	2019-05-29 23:14:11.164915	2019-05-29 23:14:11.164915
6	OWswolqF5QCPw6O4GZ55uw	twitter.com	5	2019-05-29 23:14:25.196994	2019-05-29 23:14:25.196994
7	5jq-4Vu8smQRwwCx5eX5Ow	twitter.com	5	2019-05-29 23:14:31.549009	2019-05-29 23:14:31.549009
8	iXgMRAONRaD0hZsiGoqmqg	stackoverflow.com	2	2019-05-30 00:16:29.578309	2019-05-30 00:16:29.578309
9	-v9S6rBUin3TNOrjqpCZOA	stackoverflow.com	2	2019-05-30 00:19:09.301972	2019-05-30 00:19:09.301972
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: appacademy
--

COPY public.users (id, email, created_at, updated_at) FROM stdin;
1	calvindnguyen714@gmail.com	2019-05-29 22:25:02.593613	2019-05-29 22:25:02.593613
2	bob@bob.com	2019-05-29 23:12:09.560938	2019-05-29 23:12:09.560938
3	alice@bob.com	2019-05-29 23:12:16.892785	2019-05-29 23:12:16.892785
4	robert@bob.com	2019-05-29 23:12:22.316874	2019-05-29 23:12:22.316874
5	george@bob.com	2019-05-29 23:12:39.021584	2019-05-29 23:12:39.021584
\.


--
-- Data for Name: visits; Type: TABLE DATA; Schema: public; Owner: appacademy
--

COPY public.visits (id, shortened_url_id, user_id, created_at, updated_at) FROM stdin;
1	1	1	2019-05-29 23:42:06.143318	2019-05-29 23:42:06.143318
2	1	1	2019-05-29 23:42:08.541463	2019-05-29 23:42:08.541463
3	1	1	2019-05-29 23:42:09.085531	2019-05-29 23:42:09.085531
4	1	1	2019-05-29 23:42:09.805897	2019-05-29 23:42:09.805897
5	2	2	2019-05-29 23:56:16.916391	2019-05-29 23:56:16.916391
6	3	2	2019-05-29 23:56:20.830616	2019-05-29 23:56:20.830616
7	4	2	2019-05-29 23:56:23.16637	2019-05-29 23:56:23.16637
8	5	2	2019-05-29 23:56:25.070206	2019-05-29 23:56:25.070206
9	6	2	2019-05-29 23:56:27.142387	2019-05-29 23:56:27.142387
10	6	3	2019-05-29 23:56:31.798633	2019-05-29 23:56:31.798633
11	3	3	2019-05-29 23:56:33.974564	2019-05-29 23:56:33.974564
12	1	3	2019-05-29 23:56:36.534653	2019-05-29 23:56:36.534653
13	1	4	2019-05-29 23:56:41.687172	2019-05-29 23:56:41.687172
14	2	4	2019-05-29 23:56:43.654424	2019-05-29 23:56:43.654424
15	5	4	2019-05-29 23:56:45.476906	2019-05-29 23:56:45.476906
16	6	4	2019-05-29 23:56:47.807149	2019-05-29 23:56:47.807149
17	6	5	2019-05-29 23:56:51.654423	2019-05-29 23:56:51.654423
18	6	5	2019-05-29 23:56:53.303354	2019-05-29 23:56:53.303354
19	6	5	2019-05-29 23:56:53.791269	2019-05-29 23:56:53.791269
20	1	1	2019-05-30 00:01:55.93706	2019-05-30 00:01:55.93706
21	9	2	2019-05-30 00:19:09.338964	2019-05-30 00:19:09.338964
22	2	2	2019-05-30 00:20:47.718462	2019-05-30 00:20:47.718462
\.


--
-- Name: shortened_urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appacademy
--

SELECT pg_catalog.setval('public.shortened_urls_id_seq', 9, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appacademy
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appacademy
--

SELECT pg_catalog.setval('public.visits_id_seq', 22, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: shortened_urls shortened_urls_pkey; Type: CONSTRAINT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY public.shortened_urls
    ADD CONSTRAINT shortened_urls_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: visits visits_pkey; Type: CONSTRAINT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (id);


--
-- Name: index_shortened_urls_on_long_url; Type: INDEX; Schema: public; Owner: appacademy
--

CREATE INDEX index_shortened_urls_on_long_url ON public.shortened_urls USING btree (long_url);


--
-- Name: index_shortened_urls_on_short_url; Type: INDEX; Schema: public; Owner: appacademy
--

CREATE UNIQUE INDEX index_shortened_urls_on_short_url ON public.shortened_urls USING btree (short_url);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: appacademy
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- PostgreSQL database dump complete
--

