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
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: bktddbsudouser
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


ALTER TABLE public._prisma_migrations OWNER TO bktddbsudouser;

--
-- Name: challenge; Type: TABLE; Schema: public; Owner: bktddbsudouser
--

CREATE TABLE public.challenges (
    id integer NOT NULL,
    prompt text NOT NULL,
    suggestion text NOT NULL,
    twist text NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    source text NOT NULL,
    rating integer NOT NULL,
    image text NOT NULL
);


ALTER TABLE public.challenge OWNER TO bktddbsudouser;

--
-- Name: challenge_id_seq; Type: SEQUENCE; Schema: public; Owner: bktddbsudouser
--

CREATE SEQUENCE public.challenges_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.challenge_id_seq OWNER TO bktddbsudouser;

--
-- Name: challenge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bktddbsudouser
--

ALTER SEQUENCE public.challenges_id_seq OWNED BY public.challenges.id;


--
-- Name: completion; Type: TABLE; Schema: public; Owner: bktddbsudouser
--

CREATE TABLE public.completions (
    id integer NOT NULL,
    description text NOT NULL,
    date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    user_id integer NOT NULL,
    challenge_id integer NOT NULL
);


ALTER TABLE public.completion OWNER TO bktddbsudouser;

--
-- Name: completion_id_seq; Type: SEQUENCE; Schema: public; Owner: bktddbsudouser
--

CREATE SEQUENCE public.completions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.completion_id_seq OWNER TO bktddbsudouser;

--
-- Name: completion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bktddbsudouser
--

ALTER SEQUENCE public.completions_id_seq OWNED BY public.completions.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: bktddbsudouser
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    username text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public."user" OWNER TO bktddbsudouser;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: bktddbsudouser
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO bktddbsudouser;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bktddbsudouser
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: challenge id; Type: DEFAULT; Schema: public; Owner: bktddbsudouser
--

ALTER TABLE ONLY public.challenges ALTER COLUMN id SET DEFAULT nextval('public.challenges_id_seq'::regclass);


--
-- Name: completion id; Type: DEFAULT; Schema: public; Owner: bktddbsudouser
--

ALTER TABLE ONLY public.completions ALTER COLUMN id SET DEFAULT nextval('public.completions_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: bktddbsudouser
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: bktddbsudouser
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
856cdbe8-5ff2-4519-81a1-248e4856f5c5	3d0965bc4bf33156535e47ee4c4a41597d146a14b3e9eb3c302b2280863ad806	2024-04-16 02:53:08.914601+00	20240323012108_test	\N	\N	2024-04-16 02:53:08.764614+00	1
6a950bb9-b851-4f10-ad6e-1ba817173b2e	89c534372340892b20a1060fa45d2ffcea26de0363e51a99d223b01043355c25	2024-04-16 02:53:08.952966+00	20240405145248_add_frontend_reqs	\N	\N	2024-04-16 02:53:08.917858+00	1
d11d932e-6e87-4ae4-bdb8-affabeff1bbb	9af4530c13a31b0ba43501a8ce0dd424d2512c9cdbe4896e46d09370652c9c0d	2024-04-16 02:53:09.077929+00	20240405193931_simplify_schema	\N	\N	2024-04-16 02:53:08.956377+00	1
27b55e15-f7ab-42b4-ae07-0c8086e86f4f	1deb7e1cffd882e1b868a5898e06b784c4213f101ae52f5962f2bba3df18f6f6	2024-04-16 02:53:09.091125+00	20240407021219_add_prompt_field	\N	\N	2024-04-16 02:53:09.08111+00	1
72427655-51f3-4b09-b105-9bc0de2fe93f	236aa2fa39007e721889991c99a7f6f86cc095e4517c8483060a9b8f217eb34b	2024-04-16 02:53:09.103909+00	20240410182129_add_image_to_challenge	\N	\N	2024-04-16 02:53:09.094311+00	1
c4624a9c-6469-4640-a7b3-8f249e55eec6	be4f5e033118c01ec5ac87e78e07ecf2318ad27016a133780ab9477e3f55d351	2024-04-16 02:53:09.185816+00	20240412182541_change	\N	\N	2024-04-16 02:53:09.10695+00	1
7d419e2f-7fc6-49db-9a61-5c5b831268f5	ca0a334250251709f091f9b8f3a84e974ade534461ca5455571d4bdd95a53791	2024-04-16 02:53:09.198672+00	20240414013226_change	\N	\N	2024-04-16 02:53:09.188992+00	1
19b1fba1-6262-4e9c-a6eb-0a407ab5216d	48bea31d29cc7421ed726dd2ed134583e66b27200cb582c5d4891214992a6ae7	2024-04-16 02:53:09.212581+00	20240414022443_fix_challenge_change_issues	\N	\N	2024-04-16 02:53:09.20193+00	1
\.


--
-- Data for Name: challenge; Type: TABLE DATA; Schema: public; Owner: bktddbsudouser
--

COPY public.challenge (id, prompt, suggestion, date, source, image, rating, twist) FROM stdin;
\.


--
-- Data for Name: completion; Type: TABLE DATA; Schema: public; Owner: bktddbsudouser
--

COPY public.completions (id, description, date, user_id, challenge_id) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: bktddbsudouser
--

COPY public.users (id, email, username, password) FROM stdin;
\.


--
-- Name: challenge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bktddbsudouser
--

SELECT pg_catalog.setval('public.challenge_id_seq', 1, false);


--
-- Name: completion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bktddbsudouser
--

SELECT pg_catalog.setval('public.completions_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bktddbsudouser
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: bktddbsudouser
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: challenge challenge_pkey; Type: CONSTRAINT; Schema: public; Owner: bktddbsudouser
--

ALTER TABLE ONLY public.challenges
    ADD CONSTRAINT challenges_pkey PRIMARY KEY (id);


--
-- Name: completion completion_pkey; Type: CONSTRAINT; Schema: public; Owner: bktddbsudouser
--

ALTER TABLE ONLY public.completions
    ADD CONSTRAINT completions_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: bktddbsudouser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: challenge_date_idx; Type: INDEX; Schema: public; Owner: bktddbsudouser
--

CREATE INDEX challenges_date_idx ON public.challenges USING btree (date);


--
-- Name: challenge_date_key; Type: INDEX; Schema: public; Owner: bktddbsudouser
--

CREATE UNIQUE INDEX challenges_date_key ON public.challenges USING btree (date);


--
-- Name: challenge_id_key; Type: INDEX; Schema: public; Owner: bktddbsudouser
--

CREATE UNIQUE INDEX challenges_id_key ON public.challenges USING btree (id);


--
-- Name: completion_date_idx; Type: INDEX; Schema: public; Owner: bktddbsudouser
--

CREATE INDEX completions_date_idx ON public.completions USING btree (date);


--
-- Name: completion_id_key; Type: INDEX; Schema: public; Owner: bktddbsudouser
--

CREATE UNIQUE INDEX completions_id_key ON public.completions USING btree (id);


--
-- Name: completion_user_id_challenge_id_key; Type: INDEX; Schema: public; Owner: bktddbsudouser
--

CREATE UNIQUE INDEX completions_user_id_challenge_id_key ON public.completions USING btree (user_id, challenge_id);


--
-- Name: user_email_key; Type: INDEX; Schema: public; Owner: bktddbsudouser
--

CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);


--
-- Name: user_id_key; Type: INDEX; Schema: public; Owner: bktddbsudouser
--

CREATE UNIQUE INDEX users_id_key ON public.users USING btree (id);


--
-- Name: completion completion_challenge_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bktddbsudouser
--

ALTER TABLE ONLY public.completions
    ADD CONSTRAINT completions_challenge_id_fkey FOREIGN KEY (challenge_id) REFERENCES public.challenges(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: completion completion_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bktddbsudouser
--

ALTER TABLE ONLY public.completions
    ADD CONSTRAINT completions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

