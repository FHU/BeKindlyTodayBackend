--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2 (Ubuntu 16.2-1.pgdg22.04+1)

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
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: challenge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.challenge (
    id integer NOT NULL,
    prompt text NOT NULL,
    suggestion text NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    source text NOT NULL,
    image text NOT NULL,
    rating integer DEFAULT 0 NOT NULL,
    twist text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.challenge OWNER TO postgres;

--
-- Name: challenge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.challenge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.challenge_id_seq OWNER TO postgres;

--
-- Name: challenge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.challenge_id_seq OWNED BY public.challenge.id;


--
-- Name: completion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.completion (
    id integer NOT NULL,
    description text NOT NULL,
    date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    user_id integer NOT NULL,
    challenge_id integer NOT NULL
);


ALTER TABLE public.completion OWNER TO postgres;

--
-- Name: completion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.completion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.completion_id_seq OWNER TO postgres;

--
-- Name: completion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.completion_id_seq OWNED BY public.completion.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email text NOT NULL,
    username text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: challenge id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenge ALTER COLUMN id SET DEFAULT nextval('public.challenge_id_seq'::regclass);


--
-- Name: completion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completion ALTER COLUMN id SET DEFAULT nextval('public.completion_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
c81d8b2f-e05d-4eef-82ee-f67128b575c6	3d0965bc4bf33156535e47ee4c4a41597d146a14b3e9eb3c302b2280863ad806	2024-04-14 02:01:49.974169+00	20240323012108_test	\N	\N	2024-04-14 02:01:49.826746+00	1
c30e34bd-a356-475d-a0ed-0fc7a4ed38e9	89c534372340892b20a1060fa45d2ffcea26de0363e51a99d223b01043355c25	2024-04-14 02:01:50.012847+00	20240405145248_add_frontend_reqs	\N	\N	2024-04-14 02:01:49.977417+00	1
d4c5f0a9-ea1a-4b96-84c4-93636f076938	9af4530c13a31b0ba43501a8ce0dd424d2512c9cdbe4896e46d09370652c9c0d	2024-04-14 02:01:50.14242+00	20240405193931_simplify_schema	\N	\N	2024-04-14 02:01:50.016108+00	1
76bcf72a-bb05-46a7-a35b-32eda0a56d4d	1deb7e1cffd882e1b868a5898e06b784c4213f101ae52f5962f2bba3df18f6f6	2024-04-14 02:01:50.155373+00	20240407021219_add_prompt_field	\N	\N	2024-04-14 02:01:50.1453+00	1
f68e23b2-a481-43c4-9544-20afdefd0e87	236aa2fa39007e721889991c99a7f6f86cc095e4517c8483060a9b8f217eb34b	2024-04-14 02:01:50.167921+00	20240410182129_add_image_to_challenge	\N	\N	2024-04-14 02:01:50.158491+00	1
fe35a2ce-6852-494d-b2b6-320449547cca	be4f5e033118c01ec5ac87e78e07ecf2318ad27016a133780ab9477e3f55d351	2024-04-14 02:01:50.251644+00	20240412182541_change	\N	\N	2024-04-14 02:01:50.171392+00	1
e8d7559e-5f8a-4e7e-bc73-834a46754a56	ca0a334250251709f091f9b8f3a84e974ade534461ca5455571d4bdd95a53791	2024-04-14 02:01:50.264346+00	20240414013226_change	\N	\N	2024-04-14 02:01:50.254717+00	1
\.


--
-- Data for Name: challenge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.challenge (id, prompt, suggestion, date, source, image, rating, twist) FROM stdin;
\.


--
-- Data for Name: completion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.completion (id, description, date, user_id, challenge_id) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, email, username, password) FROM stdin;
\.


--
-- Name: challenge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.challenge_id_seq', 1, false);


--
-- Name: completion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.completion_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: challenge challenge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenge
    ADD CONSTRAINT challenge_pkey PRIMARY KEY (id);


--
-- Name: completion completion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completion
    ADD CONSTRAINT completion_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: challenge_date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX challenge_date_idx ON public.challenge USING btree (date);


--
-- Name: challenge_date_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX challenge_date_key ON public.challenge USING btree (date);


--
-- Name: challenge_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX challenge_id_key ON public.challenge USING btree (id);


--
-- Name: completion_date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX completion_date_idx ON public.completion USING btree (date);


--
-- Name: completion_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX completion_id_key ON public.completion USING btree (id);


--
-- Name: completion_user_id_challenge_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX completion_user_id_challenge_id_key ON public.completion USING btree (user_id, challenge_id);


--
-- Name: user_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_email_key ON public."user" USING btree (email);


--
-- Name: user_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_id_key ON public."user" USING btree (id);


--
-- Name: completion completion_challenge_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completion
    ADD CONSTRAINT completion_challenge_id_fkey FOREIGN KEY (challenge_id) REFERENCES public.challenge(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: completion completion_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completion
    ADD CONSTRAINT completion_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

