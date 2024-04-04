--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2

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
-- Name: report_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.report_type AS ENUM (
    'Discrimination',
    'Harassment',
    'SexualContent',
    'Violence',
    'Scam',
    'Impersonation',
    'Abuse',
    'SelfHarm',
    'PrivacyViolation'
);


ALTER TYPE public.report_type OWNER TO postgres;

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
-- Name: challenge_completions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.challenge_completions (
    id integer NOT NULL,
    challenge_id integer NOT NULL,
    completion_id integer NOT NULL
);


ALTER TABLE public.challenge_completions OWNER TO postgres;

--
-- Name: challenge_completions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.challenge_completions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.challenge_completions_id_seq OWNER TO postgres;

--
-- Name: challenge_completions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.challenge_completions_id_seq OWNED BY public.challenge_completions.id;


--
-- Name: challenges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.challenges (
    id integer NOT NULL,
    description text NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    source text NOT NULL
);


ALTER TABLE public.challenges OWNER TO postgres;

--
-- Name: challenges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.challenges_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.challenges_id_seq OWNER TO postgres;

--
-- Name: challenges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.challenges_id_seq OWNED BY public.challenges.id;


--
-- Name: comment_reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment_reports (
    id integer NOT NULL,
    comment_id integer NOT NULL,
    report_id integer NOT NULL
);


ALTER TABLE public.comment_reports OWNER TO postgres;

--
-- Name: comment_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comment_reports_id_seq OWNER TO postgres;

--
-- Name: comment_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_reports_id_seq OWNED BY public.comment_reports.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    body text NOT NULL,
    date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    user_id integer NOT NULL,
    completion_id integer NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: completion_reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.completion_reports (
    id integer NOT NULL,
    completion_id integer NOT NULL,
    report_id integer NOT NULL
);


ALTER TABLE public.completion_reports OWNER TO postgres;

--
-- Name: completion_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.completion_reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.completion_reports_id_seq OWNER TO postgres;

--
-- Name: completion_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.completion_reports_id_seq OWNED BY public.completion_reports.id;


--
-- Name: completions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.completions (
    id integer NOT NULL,
    description text NOT NULL,
    date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.completions OWNER TO postgres;

--
-- Name: completions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.completions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.completions_id_seq OWNER TO postgres;

--
-- Name: completions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.completions_id_seq OWNED BY public.completions.id;


--
-- Name: report_creators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_creators (
    id integer NOT NULL,
    user_id integer NOT NULL,
    report_id integer NOT NULL
);


ALTER TABLE public.report_creators OWNER TO postgres;

--
-- Name: report_creators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_creators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.report_creators_id_seq OWNER TO postgres;

--
-- Name: report_creators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_creators_id_seq OWNED BY public.report_creators.id;


--
-- Name: reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reports (
    id integer NOT NULL,
    description text NOT NULL,
    type public.report_type NOT NULL,
    date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.reports OWNER TO postgres;

--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reports_id_seq OWNER TO postgres;

--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- Name: user_completions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_completions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    completion_id integer NOT NULL
);


ALTER TABLE public.user_completions OWNER TO postgres;

--
-- Name: user_completions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_completions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_completions_id_seq OWNER TO postgres;

--
-- Name: user_completions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_completions_id_seq OWNED BY public.user_completions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    username text NOT NULL,
    password text NOT NULL
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


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: challenge_completions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenge_completions ALTER COLUMN id SET DEFAULT nextval('public.challenge_completions_id_seq'::regclass);


--
-- Name: challenges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges ALTER COLUMN id SET DEFAULT nextval('public.challenges_id_seq'::regclass);


--
-- Name: comment_reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_reports ALTER COLUMN id SET DEFAULT nextval('public.comment_reports_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: completion_reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completion_reports ALTER COLUMN id SET DEFAULT nextval('public.completion_reports_id_seq'::regclass);


--
-- Name: completions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completions ALTER COLUMN id SET DEFAULT nextval('public.completions_id_seq'::regclass);


--
-- Name: report_creators id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_creators ALTER COLUMN id SET DEFAULT nextval('public.report_creators_id_seq'::regclass);


--
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- Name: user_completions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_completions ALTER COLUMN id SET DEFAULT nextval('public.user_completions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
acc4edbd-c597-4b38-b47a-cb060d97b2db	3d0965bc4bf33156535e47ee4c4a41597d146a14b3e9eb3c302b2280863ad806	2024-03-23 02:10:21.878137+00	20240323012108_test	\N	\N	2024-03-23 02:10:21.826002+00	1
\.


--
-- Data for Name: challenge_completions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.challenge_completions (id, challenge_id, completion_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
\.


--
-- Data for Name: challenges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.challenges (id, description, date, source) FROM stdin;
1	Challenge 1	2024-03-22 10:00:00	Source 1
2	Challenge 2	2024-03-23 11:00:00	Source 2
3	Challenge 3	2024-03-24 12:00:00	Source 3
4	Challenge 4	2024-03-25 13:00:00	Source 4
5	Challenge 5	2024-03-26 14:00:00	Source 5
\.


--
-- Data for Name: comment_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment_reports (id, comment_id, report_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, body, date, user_id, completion_id) FROM stdin;
1	Comment 1	2024-03-22 10:00:00	1	1
2	Comment 2	2024-03-23 11:00:00	2	2
3	Comment 3	2024-03-24 12:00:00	3	3
4	Comment 4	2024-03-25 13:00:00	4	4
5	Comment 5	2024-03-26 14:00:00	5	5
\.


--
-- Data for Name: completion_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.completion_reports (id, completion_id, report_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
\.


--
-- Data for Name: completions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.completions (id, description, date) FROM stdin;
1	Completion 1	2024-03-22 10:00:00
2	Completion 2	2024-03-23 11:00:00
3	Completion 3	2024-03-24 12:00:00
4	Completion 4	2024-03-25 13:00:00
5	Completion 5	2024-03-26 14:00:00
\.


--
-- Data for Name: report_creators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_creators (id, user_id, report_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reports (id, description, type, date) FROM stdin;
1	Report 1	Discrimination	2024-03-22 10:00:00
2	Report 2	Harassment	2024-03-23 11:00:00
3	Report 3	Violence	2024-03-24 12:00:00
4	Report 4	Scam	2024-03-25 13:00:00
5	Report 5	Abuse	2024-03-26 14:00:00
\.


--
-- Data for Name: user_completions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_completions (id, user_id, completion_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, username, password) FROM stdin;
1	user1@example.com	user1	password1
2	user2@example.com	user2	password2
3	user3@example.com	user3	password3
4	user4@example.com	user4	password4
5	user5@example.com	user5	password5
\.


--
-- Name: challenge_completions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.challenge_completions_id_seq', 5, true);


--
-- Name: challenges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.challenges_id_seq', 5, true);


--
-- Name: comment_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_reports_id_seq', 5, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 5, true);


--
-- Name: completion_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.completion_reports_id_seq', 5, true);


--
-- Name: completions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.completions_id_seq', 5, true);


--
-- Name: report_creators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_creators_id_seq', 5, true);


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reports_id_seq', 5, true);


--
-- Name: user_completions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_completions_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: challenge_completions challenge_completions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenge_completions
    ADD CONSTRAINT challenge_completions_pkey PRIMARY KEY (id);


--
-- Name: challenges challenges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges
    ADD CONSTRAINT challenges_pkey PRIMARY KEY (id);


--
-- Name: comment_reports comment_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_reports
    ADD CONSTRAINT comment_reports_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: completion_reports completion_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completion_reports
    ADD CONSTRAINT completion_reports_pkey PRIMARY KEY (id);


--
-- Name: completions completions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completions
    ADD CONSTRAINT completions_pkey PRIMARY KEY (id);


--
-- Name: report_creators report_creators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_creators
    ADD CONSTRAINT report_creators_pkey PRIMARY KEY (id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: user_completions user_completions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_completions
    ADD CONSTRAINT user_completions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: challenge_completions_challenge_id_completion_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX challenge_completions_challenge_id_completion_id_key ON public.challenge_completions USING btree (challenge_id, completion_id);


--
-- Name: challenge_completions_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX challenge_completions_id_key ON public.challenge_completions USING btree (id);


--
-- Name: challenges_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX challenges_id_key ON public.challenges USING btree (id);


--
-- Name: comment_reports_comment_id_report_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX comment_reports_comment_id_report_id_key ON public.comment_reports USING btree (comment_id, report_id);


--
-- Name: comment_reports_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX comment_reports_id_key ON public.comment_reports USING btree (id);


--
-- Name: comments_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX comments_id_key ON public.comments USING btree (id);


--
-- Name: completion_reports_completion_id_report_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX completion_reports_completion_id_report_id_key ON public.completion_reports USING btree (completion_id, report_id);


--
-- Name: completion_reports_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX completion_reports_id_key ON public.completion_reports USING btree (id);


--
-- Name: completions_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX completions_id_key ON public.completions USING btree (id);


--
-- Name: report_creators_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX report_creators_id_key ON public.report_creators USING btree (id);


--
-- Name: report_creators_user_id_report_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX report_creators_user_id_report_id_key ON public.report_creators USING btree (user_id, report_id);


--
-- Name: reports_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX reports_id_key ON public.reports USING btree (id);


--
-- Name: user_completions_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_completions_id_key ON public.user_completions USING btree (id);


--
-- Name: user_completions_user_id_completion_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_completions_user_id_completion_id_key ON public.user_completions USING btree (user_id, completion_id);


--
-- Name: users_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);


--
-- Name: users_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_id_key ON public.users USING btree (id);


--
-- Name: challenge_completions challenge_completions_challenge_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenge_completions
    ADD CONSTRAINT challenge_completions_challenge_id_fkey FOREIGN KEY (challenge_id) REFERENCES public.challenges(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: challenge_completions challenge_completions_completion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenge_completions
    ADD CONSTRAINT challenge_completions_completion_id_fkey FOREIGN KEY (completion_id) REFERENCES public.completions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comment_reports comment_reports_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_reports
    ADD CONSTRAINT comment_reports_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.comments(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comment_reports comment_reports_report_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_reports
    ADD CONSTRAINT comment_reports_report_id_fkey FOREIGN KEY (report_id) REFERENCES public.reports(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_completion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_completion_id_fkey FOREIGN KEY (completion_id) REFERENCES public.completions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: completion_reports completion_reports_completion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completion_reports
    ADD CONSTRAINT completion_reports_completion_id_fkey FOREIGN KEY (completion_id) REFERENCES public.completions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: completion_reports completion_reports_report_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completion_reports
    ADD CONSTRAINT completion_reports_report_id_fkey FOREIGN KEY (report_id) REFERENCES public.reports(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_creators report_creators_report_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_creators
    ADD CONSTRAINT report_creators_report_id_fkey FOREIGN KEY (report_id) REFERENCES public.reports(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_creators report_creators_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_creators
    ADD CONSTRAINT report_creators_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_completions user_completions_completion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_completions
    ADD CONSTRAINT user_completions_completion_id_fkey FOREIGN KEY (completion_id) REFERENCES public.completions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_completions user_completions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_completions
    ADD CONSTRAINT user_completions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

