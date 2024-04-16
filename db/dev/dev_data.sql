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
-- Name: challenges; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: completions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.completions (
    id integer NOT NULL,
    description text NOT NULL,
    date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    user_id integer NOT NULL,
    challenge_id integer NOT NULL
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
-- Name: challenges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges ALTER COLUMN id SET DEFAULT nextval('public.challenges_id_seq'::regclass);


--
-- Name: completions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completions ALTER COLUMN id SET DEFAULT nextval('public.completions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
25b06359-b08b-411f-bc6c-d40dbfa03d79	3d0965bc4bf33156535e47ee4c4a41597d146a14b3e9eb3c302b2280863ad806	2024-04-16 02:58:40.762303+00	20240323012108_test	\N	\N	2024-04-16 02:58:40.617845+00	1
c8a53070-7f63-4611-8745-74f9d0f618a1	89c534372340892b20a1060fa45d2ffcea26de0363e51a99d223b01043355c25	2024-04-16 02:58:40.801945+00	20240405145248_add_frontend_reqs	\N	\N	2024-04-16 02:58:40.765481+00	1
1defc484-5128-4625-94c3-36fe2ec1ce48	9af4530c13a31b0ba43501a8ce0dd424d2512c9cdbe4896e46d09370652c9c0d	2024-04-16 02:58:40.929843+00	20240405193931_simplify_schema	\N	\N	2024-04-16 02:58:40.805125+00	1
10a97a9c-4fc5-4fbb-897f-cd69659b18b8	1deb7e1cffd882e1b868a5898e06b784c4213f101ae52f5962f2bba3df18f6f6	2024-04-16 02:58:40.942887+00	20240407021219_add_prompt_field	\N	\N	2024-04-16 02:58:40.932758+00	1
a4195ed9-e19f-4c74-850b-96ff9293dd06	236aa2fa39007e721889991c99a7f6f86cc095e4517c8483060a9b8f217eb34b	2024-04-16 02:58:40.95673+00	20240410182129_add_image_to_challenge	\N	\N	2024-04-16 02:58:40.946169+00	1
8b71c6ca-fcb1-4dbe-8ccf-31f20d368eb0	be4f5e033118c01ec5ac87e78e07ecf2318ad27016a133780ab9477e3f55d351	2024-04-16 02:58:41.041595+00	20240412182541_change	\N	\N	2024-04-16 02:58:40.960452+00	1
dd9af9ff-3112-4e11-9ee1-68e9d756e9f1	ca0a334250251709f091f9b8f3a84e974ade534461ca5455571d4bdd95a53791	2024-04-16 02:58:41.054384+00	20240414013226_change	\N	\N	2024-04-16 02:58:41.044667+00	1
6e77f909-2a16-428e-9d18-c14ba04ca607	48bea31d29cc7421ed726dd2ed134583e66b27200cb582c5d4891214992a6ae7	2024-04-16 02:58:41.068006+00	20240414022443_fix_challenge_change_issues	\N	\N	2024-04-16 02:58:41.057531+00	1
9350ef25-ee05-4a3e-91fd-3867e6459835	ec882d803bc38d05f8e1ba8daee82d6ec57dbd57d422f963b02d10ae3018dacd	2024-04-16 02:58:41.152223+00	20240415185228_add_correct_mapping	\N	\N	2024-04-16 02:58:41.07119+00	1
\.


--
-- Data for Name: challenges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.challenges (id, prompt, suggestion, twist, date, source, rating, image) FROM stdin;
1	Smile at a stranger	nan	Offer a warm, genuine smile to someone you pass on the street or encounter in a public setting.	2024-04-16 02:58:41.273	nan	0	nan
2	Hold the door for someone	nan	As youre entering or exiting a building, take a moment to hold the door open for the person behind you.	2024-04-17 02:58:41.273	nan	0	nan
3	Give a compliment	nan	Find something genuine and positive to say about someones appearance, accomplishment, or personality.	2024-04-18 02:58:41.273	nan	0	nan
4	Pick up litter	nan	While out in your neighborhood or a public space, take a moment to pick up any litter you see and properly dispose of it.	2024-04-19 02:58:41.273	nan	0	nan
5	Leave a positive note	nan	Write an encouraging note and leave it in a public place for someone to find, such as on a car windshield or in a library book.	2024-04-20 02:58:41.273	nan	0	nan
6	Write a thank-you note	nan	Take the time to handwrite a note of gratitude to someone who has made a positive impact on your life.	2024-04-21 02:58:41.273	nan	0	nan
7	Donate books	nan	Gather books youve already read and donate them to a local library, school, or Little Free Library.	2024-04-22 02:58:41.273	nan	0	nan
8	Bake treats for first responders	nan	Prepare a batch of homemade cookies, cakes, or other baked goods and deliver them to your local fire or police station.	2024-04-23 02:58:41.273	nan	0	nan
9	Offer to run errands	nan	If you know a neighbor, friend, or family member who is homebound or busy, offer to pick up groceries, prescriptions, or run other errands for them.	2024-04-24 02:58:41.273	nan	0	nan
10	Volunteer at a food bank	nan	Contact your local food bank or pantry and volunteer your time to help sort, package, or distribute food to those in need.	2024-04-25 02:58:41.273	nan	0	nan
11	Write cards for seniors	nan	Create handwritten cards or notes and deliver them to a local nursing home or senior center to brighten someones day.	2024-04-26 02:58:41.273	nan	0	nan
12	Offer to mow a lawn	nan	If you notice a neighbors lawn needs mowing, offer to do it for them, especially if they are elderly or have limited mobility.	2024-04-27 02:58:41.273	nan	0	nan
13	Donate unused toiletries	nan	Gather any unused travel-sized toiletries, such as soap, shampoo, or toothpaste, and donate them to a local homeless shelter.	2024-04-28 02:58:41.273	nan	0	nan
14	Volunteer at an animal shelter	nan	Contact your local animal shelter and offer to volunteer your time to help care for the animals, such as walking dogs or socializing cats.	2024-04-29 02:58:41.273	nan	0	nan
15	Volunteer at a community garden	nan	Contact your local community garden and offer to volunteer your time to help with planting, weeding, or harvesting.	2024-04-30 02:58:41.273	nan	0	nan
16	Volunteer at a soup kitchen	nan	Contact your local soup kitchen or food pantry and offer to volunteer your time to help prepare or serve meals to those in need.	2024-05-01 02:58:41.273	nan	0	nan
17	Volunteer at a local park	nan	Contact your local parks department and offer to volunteer your time to help with park maintenance, such as litter cleanup or trail maintenance.	2024-05-02 02:58:41.273	nan	0	nan
18	Offer to run errands for a busy parent	nan	If you know a parent who is juggling a lot of responsibilities, offer to run errands for them, such as picking up groceries or taking their children to activities.	2024-05-03 02:58:41.273	nan	0	nan
19	Volunteer at a community center	nan	Contact your local community center and offer to volunteer your time to help with various activities or programs.	2024-05-04 02:58:41.273	nan	0	nan
20	Donate old clothes to a charity	nan	Go through your closet and gather any gently used clothes you no longer need, and donate them to a local charity or clothing drive.	2024-05-05 02:58:41.273	nan	0	nan
21	Offer to walk a neighbors dog	nan	If you know a neighbor who has a dog, offer to take their furry friend for a walk, especially if the neighbor is busy or unable to do it themselves.	2024-05-06 02:58:41.273	nan	0	nan
22	Offer to help a neighbor with yard work	nan	If you notice a neighbors yard needs attention, offer to help with tasks like mowing, weeding, or gardening.	2024-05-07 02:58:41.273	nan	0	nan
23	Volunteer at a local community center	nan	Contact your local community center and offer to volunteer your time to help with various activities or programs.	2024-05-08 02:58:41.273	nan	0	nan
24	Offer to help a neighbor with grocery shopping	nan	If you know a neighbor who has difficulty getting to the grocery store, offer to do their shopping for them.	2024-05-09 02:58:41.273	nan	0	nan
25	Offer to help a neighbor with household tasks	nan	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or light housework.	2024-05-10 02:58:41.273	nan	0	nan
26	Donate old toys to a childrens shelter	nan	Gather any gently used toys your children no longer play with and donate them to a local childrens shelter.	2024-05-11 02:58:41.273	nan	0	nan
27	Offer to wash a neighbors car	nan	If you notice a neighbors car is looking dirty, offer to wash it for them, especially if they are elderly or dont have the ability to do it themselves.	2024-05-12 02:58:41.273	nan	0	nan
28	Volunteer at a local library	nan	Contact your local library and offer to volunteer your time to assist with tasks like shelving books, organizing, or assisting patrons.	2024-05-13 02:58:41.273	nan	0	nan
29	Donate old furniture to a charity	nan	Go through your home and identify any gently used furniture you no longer need, and donate it to a local charity or thrift store.	2024-05-14 02:58:41.273	nan	0	nan
30	Volunteer at a local retirement home	nan	Contact a local retirement home or assisted living facility and offer to volunteer your time to visit with and engage the residents.	2024-05-15 02:58:41.273	nan	0	nan
31	Donate old kitchen items to a shelter	nan	Gather any gently used kitchen items, such as pots, pans, or utensils, and donate them to a local homeless shelter or transitional housing program.	2024-05-16 02:58:41.273	nan	0	nan
32	Volunteer at a local museum	nan	Contact your local museum and offer to volunteer your time to help with tasks like greeting visitors, assisting with exhibits, or leading tours.	2024-05-17 02:58:41.273	nan	0	nan
33	Donate old craft supplies	nan	Gather any unused craft supplies, such as art materials, fabrics, or sewing supplies, and donate them to a local school or community art center.	2024-05-18 02:58:41.273	nan	0	nan
34	Offer to help a neighbor with meal preparation	nan	If you know a neighbor who is elderly, disabled, or simply overwhelmed with meal prep, offer to cook them a healthy meal or assist with meal planning and preparation.	2024-05-19 02:58:41.273	nan	0	nan
35	Donate old art supplies to a community center	nan	Gather any unused art supplies, such as paints, brushes, or canvases, and donate them to a local community center or art program.	2024-05-20 02:58:41.273	nan	0	nan
36	Offer to help a neighbor with computer tasks	nan	If you know a neighbor who is not tech-savvy, offer to assist them with tasks like setting up a new device, troubleshooting an issue, or teaching them how to use a computer program.	2024-05-21 02:58:41.273	nan	0	nan
37	Volunteer at a local youth center	nan	Contact a local youth center or after-school program and offer to volunteer your time to help with activities, tutoring, or mentoring.	2024-05-22 02:58:41.273	nan	0	nan
38	Donate old gardening tools to a community garden	nan	Gather any unused gardening tools, such as shovels, rakes, or pruners, and donate them to a local community garden.	2024-05-23 02:58:41.273	nan	0	nan
39	Offer to help a neighbor with pet care	nan	If you know a neighbor who has a pet, offer to help with tasks like walking the dog, cleaning the litter box, or providing pet-sitting services.	2024-05-24 02:58:41.273	nan	0	nan
40	Donate old sports equipment to a youth league	nan	Gather any gently used sports equipment, such as balls, cleats, or protective gear, and donate them to a local youth sports league or recreation center.	2024-05-25 02:58:41.273	nan	0	nan
41	Offer to help a neighbor with home repairs	nan	If you notice a neighbors home needs minor repairs, such as fixing a leaky faucet or patching a hole in the wall, offer to lend a hand.	2024-05-26 02:58:41.273	nan	0	nan
42	Donate old games and puzzles to a childrens hospital	nan	Gather any gently used board games, puzzles, or other childrens activities and donate them to a local childrens hospital or pediatric ward.	2024-05-27 02:58:41.273	nan	0	nan
43	Donate old towels and blankets to an animal shelter	nan	Gather any clean, old towels and blankets you no longer need and donate them to your local animal shelter or rescue organization.	2024-05-28 02:58:41.273	nan	0	nan
44	Offer to help a neighbor with household chores	nan	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or light housework.	2024-05-29 02:58:41.273	nan	0	nan
45	Volunteer at a local historic site or museum	nan	Contact a local historic site or museum and offer to volunteer your time to help with tasks like gardening, maintenance, or giving tours.	2024-05-30 02:58:41.273	nan	0	nan
46	Donate old school supplies to a local charity or organization	nan	Gather any unused school supplies, such as notebooks, pencils, or backpacks, and donate them to a local charity or organization that supports students in need.	2024-05-31 02:58:41.273	nan	0	nan
47	Donate old books to a local prison or jail library	nan	Gather any books you no longer need and donate them to a local prison or jail library, where they can be enjoyed by incarcerated individuals.	2024-06-01 02:58:41.273	nan	0	nan
48	Offer to help a neighbor with grocery shopping or errands	nan	If you know a neighbor who has difficulty getting to the grocery store or running errands, offer to do their shopping or errands for them.	2024-06-02 02:58:41.273	nan	0	nan
49	Donate old bedding and linens to a homeless shelter	nan	Gather any clean, gently used bedding, sheets, or towels and donate them to your local homeless shelter.	2024-06-03 02:58:41.273	nan	0	nan
50	Offer to help a neighbor with household chores or errands	nan	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or running errands.	2024-06-04 02:58:41.273	nan	0	nan
51	Volunteer at a local library or literacy program	nan	Contact your local library or literacy organization and offer to volunteer your time to assist with tasks like tutoring, shelving books, or leading reading groups.	2024-06-05 02:58:41.273	nan	0	nan
52	Offer to help a neighbor with household chores or organization	nan	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or decluttering.	2024-06-06 02:58:41.273	nan	0	nan
53	Offer to help a neighbor with meal planning or preparation	nan	If you know a neighbor who is elderly, disabled, or simply overwhelmed with meal prep, offer to cook them a healthy meal or assist with meal planning and preparation.	2024-06-07 02:58:41.273	nan	0	nan
54	Volunteer at a local youth development program or after-school initiative	nan	Contact a local youth center, after-school program, or community organization and offer to volunteer your time to help with activities, tutoring, or mentoring.	2024-06-08 02:58:41.273	nan	0	nan
55	Donate old gardening tools or supplies to a community garden	nan	Gather any unused gardening tools, such as shovels, rakes, or pruners, and donate them to a local community garden.	2024-06-09 02:58:41.273	nan	0	nan
56	Offer to help a neighbor with pet care or dog walking	nan	If you know a neighbor who has a pet, offer to help with tasks like walking the dog, cleaning the litter box, or providing pet-sitting services.	2024-06-10 02:58:41.273	nan	0	nan
57	Volunteer at a local nature center, wildlife refuge, or conservation area	nan	Contact a local nature center, wildlife refuge, or conservation organization and offer to volunteer your time to help with tasks like trail maintenance, environmental education, or animal care.	2024-06-11 02:58:41.273	nan	0	nan
\.


--
-- Data for Name: completions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.completions (id, description, date, user_id, challenge_id) FROM stdin;
1	Completion 1 description	2024-04-01 12:00:00	1	1
2	Completion 2 description	2024-04-02 12:00:00	2	2
3	Completion 3 description	2024-04-03 12:00:00	3	3
4	Completion 4 description	2024-04-04 12:00:00	4	4
5	Completion 5 description	2024-04-05 12:00:00	5	5
6	Completion 6 description	2024-04-06 12:00:00	6	6
7	Completion 7 description	2024-04-07 12:00:00	7	7
8	Completion 8 description	2024-04-08 12:00:00	8	8
9	Completion 9 description	2024-04-09 12:00:00	9	9
10	Completion 10 description	2024-04-10 12:00:00	10	10
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
6	user6@example.com	user6	password6
7	user7@example.com	user7	password7
8	user8@example.com	user8	password8
9	user9@example.com	user9	password9
10	user10@example.com	user10	password10
\.


--
-- Name: challenges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.challenges_id_seq', 57, true);


--
-- Name: completions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.completions_id_seq', 10, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: challenges challenges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges
    ADD CONSTRAINT challenges_pkey PRIMARY KEY (id);


--
-- Name: completions completions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completions
    ADD CONSTRAINT completions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: challenges_date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX challenges_date_idx ON public.challenges USING btree (date);


--
-- Name: challenges_date_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX challenges_date_key ON public.challenges USING btree (date);


--
-- Name: challenges_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX challenges_id_key ON public.challenges USING btree (id);


--
-- Name: completions_date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX completions_date_idx ON public.completions USING btree (date);


--
-- Name: completions_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX completions_id_key ON public.completions USING btree (id);


--
-- Name: completions_user_id_challenge_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX completions_user_id_challenge_id_key ON public.completions USING btree (user_id, challenge_id);


--
-- Name: users_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);


--
-- Name: users_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_id_key ON public.users USING btree (id);


--
-- Name: completions completions_challenge_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completions
    ADD CONSTRAINT completions_challenge_id_fkey FOREIGN KEY (challenge_id) REFERENCES public.challenges(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: completions completions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completions
    ADD CONSTRAINT completions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

