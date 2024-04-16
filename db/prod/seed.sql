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
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: bktdbsudouser
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


ALTER TABLE public._prisma_migrations OWNER TO bktdbsudouser;

--
-- Name: challenges; Type: TABLE; Schema: public; Owner: bktdbsudouser
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


ALTER TABLE public.challenges OWNER TO bktdbsudouser;

--
-- Name: challenges_id_seq; Type: SEQUENCE; Schema: public; Owner: bktdbsudouser
--

CREATE SEQUENCE public.challenges_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.challenges_id_seq OWNER TO bktdbsudouser;

--
-- Name: challenges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bktdbsudouser
--

ALTER SEQUENCE public.challenges_id_seq OWNED BY public.challenges.id;


--
-- Name: completions; Type: TABLE; Schema: public; Owner: bktdbsudouser
--

CREATE TABLE public.completions (
    id integer NOT NULL,
    description text NOT NULL,
    date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    user_id integer NOT NULL,
    challenge_id integer NOT NULL
);


ALTER TABLE public.completions OWNER TO bktdbsudouser;

--
-- Name: completions_id_seq; Type: SEQUENCE; Schema: public; Owner: bktdbsudouser
--

CREATE SEQUENCE public.completions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.completions_id_seq OWNER TO bktdbsudouser;

--
-- Name: completions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bktdbsudouser
--

ALTER SEQUENCE public.completions_id_seq OWNED BY public.completions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: bktdbsudouser
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    username text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO bktdbsudouser;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: bktdbsudouser
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO bktdbsudouser;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bktdbsudouser
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: challenges id; Type: DEFAULT; Schema: public; Owner: bktdbsudouser
--

ALTER TABLE ONLY public.challenges ALTER COLUMN id SET DEFAULT nextval('public.challenges_id_seq'::regclass);


--
-- Name: completions id; Type: DEFAULT; Schema: public; Owner: bktdbsudouser
--

ALTER TABLE ONLY public.completions ALTER COLUMN id SET DEFAULT nextval('public.completions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: bktdbsudouser
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: bktdbsudouser
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
95a04da6-8ec6-4461-ae35-a122470e4679	3d0965bc4bf33156535e47ee4c4a41597d146a14b3e9eb3c302b2280863ad806	2024-04-16 02:58:33.08478+00	20240323012108_test	\N	\N	2024-04-16 02:58:32.941877+00	1
157b3536-4923-41b6-9074-4ad9058c0505	89c534372340892b20a1060fa45d2ffcea26de0363e51a99d223b01043355c25	2024-04-16 02:58:33.123517+00	20240405145248_add_frontend_reqs	\N	\N	2024-04-16 02:58:33.088218+00	1
55d6c1c8-d4e4-4d7d-8095-def47cf36181	9af4530c13a31b0ba43501a8ce0dd424d2512c9cdbe4896e46d09370652c9c0d	2024-04-16 02:58:33.246107+00	20240405193931_simplify_schema	\N	\N	2024-04-16 02:58:33.126759+00	1
0d2c8121-4596-44b0-8e50-0cf14f777b44	1deb7e1cffd882e1b868a5898e06b784c4213f101ae52f5962f2bba3df18f6f6	2024-04-16 02:58:33.258924+00	20240407021219_add_prompt_field	\N	\N	2024-04-16 02:58:33.249316+00	1
0a1f530a-7608-49ea-a85d-6c0cb0b6cab3	236aa2fa39007e721889991c99a7f6f86cc095e4517c8483060a9b8f217eb34b	2024-04-16 02:58:33.271519+00	20240410182129_add_image_to_challenge	\N	\N	2024-04-16 02:58:33.262053+00	1
9c8495ce-552d-4359-8d0a-e403127d0c0e	be4f5e033118c01ec5ac87e78e07ecf2318ad27016a133780ab9477e3f55d351	2024-04-16 02:58:33.351661+00	20240412182541_change	\N	\N	2024-04-16 02:58:33.274526+00	1
f5d573dd-a446-4f7a-b4a0-78fe1d38af9a	ca0a334250251709f091f9b8f3a84e974ade534461ca5455571d4bdd95a53791	2024-04-16 02:58:33.364354+00	20240414013226_change	\N	\N	2024-04-16 02:58:33.354598+00	1
5b67a887-5d49-45bd-85c4-f50a31c97ec2	48bea31d29cc7421ed726dd2ed134583e66b27200cb582c5d4891214992a6ae7	2024-04-16 02:58:33.377312+00	20240414022443_fix_challenge_change_issues	\N	\N	2024-04-16 02:58:33.367655+00	1
41b075f1-97f9-4a52-b051-567b1bdfc6af	ec882d803bc38d05f8e1ba8daee82d6ec57dbd57d422f963b02d10ae3018dacd	2024-04-16 02:58:33.460077+00	20240415185228_add_correct_mapping	\N	\N	2024-04-16 02:58:33.380557+00	1
\.


--
-- Data for Name: challenges; Type: TABLE DATA; Schema: public; Owner: bktdbsudouser
--

COPY public.challenges (id, prompt, suggestion, twist, date, source, rating, image) FROM stdin;
1	Smile at a stranger	nan	Offer a warm, genuine smile to someone you pass on the street or encounter in a public setting.	2024-04-16 02:58:33.605	nan	0	nan
2	Hold the door for someone	nan	As youre entering or exiting a building, take a moment to hold the door open for the person behind you.	2024-04-17 02:58:33.605	nan	0	nan
3	Give a compliment	nan	Find something genuine and positive to say about someones appearance, accomplishment, or personality.	2024-04-18 02:58:33.605	nan	0	nan
4	Pick up litter	nan	While out in your neighborhood or a public space, take a moment to pick up any litter you see and properly dispose of it.	2024-04-19 02:58:33.605	nan	0	nan
5	Leave a positive note	nan	Write an encouraging note and leave it in a public place for someone to find, such as on a car windshield or in a library book.	2024-04-20 02:58:33.605	nan	0	nan
6	Write a thank-you note	nan	Take the time to handwrite a note of gratitude to someone who has made a positive impact on your life.	2024-04-21 02:58:33.605	nan	0	nan
7	Donate books	nan	Gather books youve already read and donate them to a local library, school, or Little Free Library.	2024-04-22 02:58:33.605	nan	0	nan
8	Bake treats for first responders	nan	Prepare a batch of homemade cookies, cakes, or other baked goods and deliver them to your local fire or police station.	2024-04-23 02:58:33.605	nan	0	nan
9	Offer to run errands	nan	If you know a neighbor, friend, or family member who is homebound or busy, offer to pick up groceries, prescriptions, or run other errands for them.	2024-04-24 02:58:33.605	nan	0	nan
10	Volunteer at a food bank	nan	Contact your local food bank or pantry and volunteer your time to help sort, package, or distribute food to those in need.	2024-04-25 02:58:33.605	nan	0	nan
11	Write cards for seniors	nan	Create handwritten cards or notes and deliver them to a local nursing home or senior center to brighten someones day.	2024-04-26 02:58:33.605	nan	0	nan
12	Offer to mow a lawn	nan	If you notice a neighbors lawn needs mowing, offer to do it for them, especially if they are elderly or have limited mobility.	2024-04-27 02:58:33.605	nan	0	nan
13	Donate unused toiletries	nan	Gather any unused travel-sized toiletries, such as soap, shampoo, or toothpaste, and donate them to a local homeless shelter.	2024-04-28 02:58:33.605	nan	0	nan
14	Volunteer at an animal shelter	nan	Contact your local animal shelter and offer to volunteer your time to help care for the animals, such as walking dogs or socializing cats.	2024-04-29 02:58:33.605	nan	0	nan
15	Volunteer at a community garden	nan	Contact your local community garden and offer to volunteer your time to help with planting, weeding, or harvesting.	2024-04-30 02:58:33.605	nan	0	nan
16	Volunteer at a soup kitchen	nan	Contact your local soup kitchen or food pantry and offer to volunteer your time to help prepare or serve meals to those in need.	2024-05-01 02:58:33.605	nan	0	nan
17	Volunteer at a local park	nan	Contact your local parks department and offer to volunteer your time to help with park maintenance, such as litter cleanup or trail maintenance.	2024-05-02 02:58:33.605	nan	0	nan
18	Offer to run errands for a busy parent	nan	If you know a parent who is juggling a lot of responsibilities, offer to run errands for them, such as picking up groceries or taking their children to activities.	2024-05-03 02:58:33.605	nan	0	nan
19	Volunteer at a community center	nan	Contact your local community center and offer to volunteer your time to help with various activities or programs.	2024-05-04 02:58:33.605	nan	0	nan
20	Donate old clothes to a charity	nan	Go through your closet and gather any gently used clothes you no longer need, and donate them to a local charity or clothing drive.	2024-05-05 02:58:33.605	nan	0	nan
21	Offer to walk a neighbors dog	nan	If you know a neighbor who has a dog, offer to take their furry friend for a walk, especially if the neighbor is busy or unable to do it themselves.	2024-05-06 02:58:33.605	nan	0	nan
22	Offer to help a neighbor with yard work	nan	If you notice a neighbors yard needs attention, offer to help with tasks like mowing, weeding, or gardening.	2024-05-07 02:58:33.605	nan	0	nan
23	Volunteer at a local community center	nan	Contact your local community center and offer to volunteer your time to help with various activities or programs.	2024-05-08 02:58:33.605	nan	0	nan
24	Offer to help a neighbor with grocery shopping	nan	If you know a neighbor who has difficulty getting to the grocery store, offer to do their shopping for them.	2024-05-09 02:58:33.605	nan	0	nan
25	Offer to help a neighbor with household tasks	nan	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or light housework.	2024-05-10 02:58:33.605	nan	0	nan
26	Donate old toys to a childrens shelter	nan	Gather any gently used toys your children no longer play with and donate them to a local childrens shelter.	2024-05-11 02:58:33.605	nan	0	nan
27	Offer to wash a neighbors car	nan	If you notice a neighbors car is looking dirty, offer to wash it for them, especially if they are elderly or dont have the ability to do it themselves.	2024-05-12 02:58:33.605	nan	0	nan
28	Volunteer at a local library	nan	Contact your local library and offer to volunteer your time to assist with tasks like shelving books, organizing, or assisting patrons.	2024-05-13 02:58:33.605	nan	0	nan
29	Donate old furniture to a charity	nan	Go through your home and identify any gently used furniture you no longer need, and donate it to a local charity or thrift store.	2024-05-14 02:58:33.605	nan	0	nan
30	Volunteer at a local retirement home	nan	Contact a local retirement home or assisted living facility and offer to volunteer your time to visit with and engage the residents.	2024-05-15 02:58:33.605	nan	0	nan
31	Donate old kitchen items to a shelter	nan	Gather any gently used kitchen items, such as pots, pans, or utensils, and donate them to a local homeless shelter or transitional housing program.	2024-05-16 02:58:33.605	nan	0	nan
32	Volunteer at a local museum	nan	Contact your local museum and offer to volunteer your time to help with tasks like greeting visitors, assisting with exhibits, or leading tours.	2024-05-17 02:58:33.605	nan	0	nan
33	Donate old craft supplies	nan	Gather any unused craft supplies, such as art materials, fabrics, or sewing supplies, and donate them to a local school or community art center.	2024-05-18 02:58:33.605	nan	0	nan
34	Offer to help a neighbor with meal preparation	nan	If you know a neighbor who is elderly, disabled, or simply overwhelmed with meal prep, offer to cook them a healthy meal or assist with meal planning and preparation.	2024-05-19 02:58:33.605	nan	0	nan
35	Donate old art supplies to a community center	nan	Gather any unused art supplies, such as paints, brushes, or canvases, and donate them to a local community center or art program.	2024-05-20 02:58:33.605	nan	0	nan
36	Offer to help a neighbor with computer tasks	nan	If you know a neighbor who is not tech-savvy, offer to assist them with tasks like setting up a new device, troubleshooting an issue, or teaching them how to use a computer program.	2024-05-21 02:58:33.605	nan	0	nan
37	Volunteer at a local youth center	nan	Contact a local youth center or after-school program and offer to volunteer your time to help with activities, tutoring, or mentoring.	2024-05-22 02:58:33.605	nan	0	nan
38	Donate old gardening tools to a community garden	nan	Gather any unused gardening tools, such as shovels, rakes, or pruners, and donate them to a local community garden.	2024-05-23 02:58:33.605	nan	0	nan
39	Offer to help a neighbor with pet care	nan	If you know a neighbor who has a pet, offer to help with tasks like walking the dog, cleaning the litter box, or providing pet-sitting services.	2024-05-24 02:58:33.605	nan	0	nan
40	Donate old sports equipment to a youth league	nan	Gather any gently used sports equipment, such as balls, cleats, or protective gear, and donate them to a local youth sports league or recreation center.	2024-05-25 02:58:33.605	nan	0	nan
41	Offer to help a neighbor with home repairs	nan	If you notice a neighbors home needs minor repairs, such as fixing a leaky faucet or patching a hole in the wall, offer to lend a hand.	2024-05-26 02:58:33.605	nan	0	nan
42	Donate old games and puzzles to a childrens hospital	nan	Gather any gently used board games, puzzles, or other childrens activities and donate them to a local childrens hospital or pediatric ward.	2024-05-27 02:58:33.605	nan	0	nan
43	Donate old towels and blankets to an animal shelter	nan	Gather any clean, old towels and blankets you no longer need and donate them to your local animal shelter or rescue organization.	2024-05-28 02:58:33.605	nan	0	nan
44	Offer to help a neighbor with household chores	nan	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or light housework.	2024-05-29 02:58:33.605	nan	0	nan
45	Volunteer at a local historic site or museum	nan	Contact a local historic site or museum and offer to volunteer your time to help with tasks like gardening, maintenance, or giving tours.	2024-05-30 02:58:33.605	nan	0	nan
46	Donate old school supplies to a local charity or organization	nan	Gather any unused school supplies, such as notebooks, pencils, or backpacks, and donate them to a local charity or organization that supports students in need.	2024-05-31 02:58:33.605	nan	0	nan
47	Donate old books to a local prison or jail library	nan	Gather any books you no longer need and donate them to a local prison or jail library, where they can be enjoyed by incarcerated individuals.	2024-06-01 02:58:33.605	nan	0	nan
48	Offer to help a neighbor with grocery shopping or errands	nan	If you know a neighbor who has difficulty getting to the grocery store or running errands, offer to do their shopping or errands for them.	2024-06-02 02:58:33.605	nan	0	nan
49	Donate old bedding and linens to a homeless shelter	nan	Gather any clean, gently used bedding, sheets, or towels and donate them to your local homeless shelter.	2024-06-03 02:58:33.605	nan	0	nan
50	Offer to help a neighbor with household chores or errands	nan	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or running errands.	2024-06-04 02:58:33.605	nan	0	nan
51	Volunteer at a local library or literacy program	nan	Contact your local library or literacy organization and offer to volunteer your time to assist with tasks like tutoring, shelving books, or leading reading groups.	2024-06-05 02:58:33.605	nan	0	nan
52	Offer to help a neighbor with household chores or organization	nan	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or decluttering.	2024-06-06 02:58:33.605	nan	0	nan
53	Offer to help a neighbor with meal planning or preparation	nan	If you know a neighbor who is elderly, disabled, or simply overwhelmed with meal prep, offer to cook them a healthy meal or assist with meal planning and preparation.	2024-06-07 02:58:33.605	nan	0	nan
54	Volunteer at a local youth development program or after-school initiative	nan	Contact a local youth center, after-school program, or community organization and offer to volunteer your time to help with activities, tutoring, or mentoring.	2024-06-08 02:58:33.605	nan	0	nan
55	Donate old gardening tools or supplies to a community garden	nan	Gather any unused gardening tools, such as shovels, rakes, or pruners, and donate them to a local community garden.	2024-06-09 02:58:33.605	nan	0	nan
56	Offer to help a neighbor with pet care or dog walking	nan	If you know a neighbor who has a pet, offer to help with tasks like walking the dog, cleaning the litter box, or providing pet-sitting services.	2024-06-10 02:58:33.605	nan	0	nan
57	Volunteer at a local nature center, wildlife refuge, or conservation area	nan	Contact a local nature center, wildlife refuge, or conservation organization and offer to volunteer your time to help with tasks like trail maintenance, environmental education, or animal care.	2024-06-11 02:58:33.605	nan	0	nan
\.


--
-- Data for Name: completions; Type: TABLE DATA; Schema: public; Owner: bktdbsudouser
--

COPY public.completions (id, description, date, user_id, challenge_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: bktdbsudouser
--

COPY public.users (id, email, username, password) FROM stdin;
\.


--
-- Name: challenges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bktdbsudouser
--

SELECT pg_catalog.setval('public.challenges_id_seq', 57, true);


--
-- Name: completions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bktdbsudouser
--

SELECT pg_catalog.setval('public.completions_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bktdbsudouser
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: bktdbsudouser
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: challenges challenges_pkey; Type: CONSTRAINT; Schema: public; Owner: bktdbsudouser
--

ALTER TABLE ONLY public.challenges
    ADD CONSTRAINT challenges_pkey PRIMARY KEY (id);


--
-- Name: completions completions_pkey; Type: CONSTRAINT; Schema: public; Owner: bktdbsudouser
--

ALTER TABLE ONLY public.completions
    ADD CONSTRAINT completions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: bktdbsudouser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: challenges_date_idx; Type: INDEX; Schema: public; Owner: bktdbsudouser
--

CREATE INDEX challenges_date_idx ON public.challenges USING btree (date);


--
-- Name: challenges_date_key; Type: INDEX; Schema: public; Owner: bktdbsudouser
--

CREATE UNIQUE INDEX challenges_date_key ON public.challenges USING btree (date);


--
-- Name: challenges_id_key; Type: INDEX; Schema: public; Owner: bktdbsudouser
--

CREATE UNIQUE INDEX challenges_id_key ON public.challenges USING btree (id);


--
-- Name: completions_date_idx; Type: INDEX; Schema: public; Owner: bktdbsudouser
--

CREATE INDEX completions_date_idx ON public.completions USING btree (date);


--
-- Name: completions_id_key; Type: INDEX; Schema: public; Owner: bktdbsudouser
--

CREATE UNIQUE INDEX completions_id_key ON public.completions USING btree (id);


--
-- Name: completions_user_id_challenge_id_key; Type: INDEX; Schema: public; Owner: bktdbsudouser
--

CREATE UNIQUE INDEX completions_user_id_challenge_id_key ON public.completions USING btree (user_id, challenge_id);


--
-- Name: users_email_key; Type: INDEX; Schema: public; Owner: bktdbsudouser
--

CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);


--
-- Name: users_id_key; Type: INDEX; Schema: public; Owner: bktdbsudouser
--

CREATE UNIQUE INDEX users_id_key ON public.users USING btree (id);


--
-- Name: completions completions_challenge_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bktdbsudouser
--

ALTER TABLE ONLY public.completions
    ADD CONSTRAINT completions_challenge_id_fkey FOREIGN KEY (challenge_id) REFERENCES public.challenges(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: completions completions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bktdbsudouser
--

ALTER TABLE ONLY public.completions
    ADD CONSTRAINT completions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

