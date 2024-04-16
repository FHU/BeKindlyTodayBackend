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
d82156e3-006f-4456-8e3e-1e2aacc77fec	3d0965bc4bf33156535e47ee4c4a41597d146a14b3e9eb3c302b2280863ad806	2024-04-15 18:57:06.157069+00	20240323012108_test	\N	\N	2024-04-15 18:57:06.010816+00	1
760ddf5e-0092-41b7-811b-aaa36f64ea31	89c534372340892b20a1060fa45d2ffcea26de0363e51a99d223b01043355c25	2024-04-15 18:57:06.196023+00	20240405145248_add_frontend_reqs	\N	\N	2024-04-15 18:57:06.160188+00	1
f51c2277-0979-4d57-8e04-3027330e5be2	9af4530c13a31b0ba43501a8ce0dd424d2512c9cdbe4896e46d09370652c9c0d	2024-04-15 18:57:06.325778+00	20240405193931_simplify_schema	\N	\N	2024-04-15 18:57:06.199501+00	1
a9a5faad-b95c-4047-a238-4d3ee4f64cf6	1deb7e1cffd882e1b868a5898e06b784c4213f101ae52f5962f2bba3df18f6f6	2024-04-15 18:57:06.338442+00	20240407021219_add_prompt_field	\N	\N	2024-04-15 18:57:06.328875+00	1
62f470fd-11a3-44ad-8664-7dbb1b33822c	236aa2fa39007e721889991c99a7f6f86cc095e4517c8483060a9b8f217eb34b	2024-04-15 18:57:06.351811+00	20240410182129_add_image_to_challenge	\N	\N	2024-04-15 18:57:06.341598+00	1
ab9bb2e3-0724-43ae-bd33-16cd840aeb99	be4f5e033118c01ec5ac87e78e07ecf2318ad27016a133780ab9477e3f55d351	2024-04-15 18:57:06.438183+00	20240412182541_change	\N	\N	2024-04-15 18:57:06.354846+00	1
ac21b20d-d265-4982-876a-121cbb9b3f6e	ca0a334250251709f091f9b8f3a84e974ade534461ca5455571d4bdd95a53791	2024-04-15 18:57:06.450879+00	20240414013226_change	\N	\N	2024-04-15 18:57:06.441253+00	1
808c3e46-4ffb-4845-8d44-d5a5798231e6	48bea31d29cc7421ed726dd2ed134583e66b27200cb582c5d4891214992a6ae7	2024-04-15 18:57:06.464116+00	20240414022443_fix_challenge_change_issues	\N	\N	2024-04-15 18:57:06.453698+00	1
8ed088c1-3408-4df5-b1ea-4c54f4a4ac44	ec882d803bc38d05f8e1ba8daee82d6ec57dbd57d422f963b02d10ae3018dacd	2024-04-15 18:57:06.547048+00	20240415185228_add_correct_mapping	\N	\N	2024-04-15 18:57:06.467627+00	1
\.


--
-- Data for Name: challenges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.challenges (id, prompt, suggestion, twist, date, source, rating, image) FROM stdin;
1	Smile at a stranger	Offer a warm, genuine smile to someone you pass on the street or encounter in a public setting.	Smile at 5 strangers in a row and see if you can make them smile back.	2024-04-15 18:57:06.663	nan	0	nan
2	Hold the door for someone	As youre entering or exiting a building, take a moment to hold the door open for the person behind you.	Politely hold the door for 3 people in a row and wish them a nice day.	2024-04-16 18:57:06.663	nan	0	nan
3	Give a compliment	Find something genuine and positive to say about someones appearance, accomplishment, or personality.	Give 3 sincere compliments to people you interact with throughout your day.	2024-04-17 18:57:06.663	nan	0	nan
4	Pick up litter	While out in your neighborhood or a public space, take a moment to pick up any litter you see and properly dispose of it.	Organize a group of friends or neighbors to do a community litter cleanup.	2024-04-18 18:57:06.663	nan	0	nan
5	Leave a positive note	Write an encouraging note and leave it in a public place for someone to find, such as on a car windshield or in a library book.	Leave 5 positive notes in different locations around your community.	2024-04-19 18:57:06.663	nan	0	nan
6	Write a thank-you note	Take the time to handwrite a note of gratitude to someone who has made a positive impact on your life.	Write thank-you notes to 3 people who have helped or inspired you recently.	2024-04-20 18:57:06.663	nan	0	nan
7	Donate books	Gather books youve already read and donate them to a local library, school, or Little Free Library.	Donate 10 or more books to a local organization that provides books to underserved communities.	2024-04-21 18:57:06.663	nan	0	nan
8	Bake treats for first responders	Prepare a batch of homemade cookies, cakes, or other baked goods and deliver them to your local fire or police station.	Bake extra treats and deliver them to multiple first responder stations in your area.	2024-04-22 18:57:06.663	nan	0	nan
9	Offer to run errands	If you know a neighbor, friend, or family member who is homebound or busy, offer to pick up groceries, prescriptions, or run other errands for them.	Offer to do a weeks worth of errands for a neighbor or family member who is in need of assistance.	2024-04-23 18:57:06.663	nan	0	nan
10	Volunteer at a food bank	Contact your local food bank or pantry and volunteer your time to help sort, package, or distribute food to those in need.	Organize a group of friends or coworkers to volunteer at a food bank for a full day.	2024-04-24 18:57:06.663	nan	0	nan
11	Write cards for seniors	Create handwritten cards or notes and deliver them to a local nursing home or senior center to brighten someones day.	Write personalized cards for all the residents of a nursing home or assisted living facility.	2024-04-25 18:57:06.663	nan	0	nan
12	Offer to mow a lawn	If you notice a neighbors lawn needs mowing, offer to do it for them, especially if they are elderly or have limited mobility.	Mow the lawns of 3 neighbors who could use the help.	2024-04-26 18:57:06.663	nan	0	nan
13	Donate unused toiletries	Gather any unused travel-sized toiletries, such as soap, shampoo, or toothpaste, and donate them to a local homeless shelter.	Organize a toiletry drive in your community and deliver the collected items to multiple shelters.	2024-04-27 18:57:06.663	nan	0	nan
14	Volunteer at an animal shelter	Contact your local animal shelter and offer to volunteer your time to help care for the animals, such as walking dogs or socializing cats.	Volunteer at an animal shelter for a full day and help with as many tasks as possible.	2024-04-28 18:57:06.663	nan	0	nan
15	Volunteer at a community garden	Contact your local community garden and offer to volunteer your time to help with planting, weeding, or harvesting.	Volunteer at a community garden for a full day and help with various tasks.	2024-04-29 18:57:06.663	nan	0	nan
16	Volunteer at a soup kitchen	Contact your local soup kitchen or food pantry and offer to volunteer your time to help prepare or serve meals to those in need.	Organize a group of friends or coworkers to volunteer at a soup kitchen for a full day.	2024-04-30 18:57:06.663	nan	0	nan
17	Volunteer at a local park	Contact your local parks department and offer to volunteer your time to help with park maintenance, such as litter cleanup or trail maintenance.	Organize a group of friends or neighbors to volunteer at a local park for a full day of service.	2024-05-01 18:57:06.663	nan	0	nan
18	Offer to run errands for a busy parent	If you know a parent who is juggling a lot of responsibilities, offer to run errands for them, such as picking up groceries or taking their children to activities.	Offer to run a weeks worth of errands for a busy parent in your community.	2024-05-02 18:57:06.663	nan	0	nan
19	Volunteer at a community center	Contact your local community center and offer to volunteer your time to help with various activities or programs.	Organize a group of friends or neighbors to volunteer at a community center for a full day.	2024-05-03 18:57:06.663	nan	0	nan
20	Donate old clothes to a charity	Go through your closet and gather any gently used clothes you no longer need, and donate them to a local charity or clothing drive.	Organize a clothing drive in your neighborhood and deliver the collected items to multiple charitable organizations.	2024-05-04 18:57:06.663	nan	0	nan
21	Offer to walk a neighbors dog	If you know a neighbor who has a dog, offer to take their furry friend for a walk, especially if the neighbor is busy or unable to do it themselves.	Offer to walk the dogs of multiple neighbors who could use the help.	2024-05-05 18:57:06.663	nan	0	nan
22	Offer to help a neighbor with yard work	If you notice a neighbors yard needs attention, offer to help with tasks like mowing, weeding, or gardening.	Offer to help with yard work for multiple neighbors who could use the assistance.	2024-05-06 18:57:06.663	nan	0	nan
23	Volunteer at a local community center	Contact your local community center and offer to volunteer your time to help with various activities or programs.	Organize a group of friends or neighbors to volunteer at a community center for a full day.	2024-05-07 18:57:06.663	nan	0	nan
24	Offer to help a neighbor with grocery shopping	If you know a neighbor who has difficulty getting to the grocery store, offer to do their shopping for them.	Offer to do the grocery shopping for multiple neighbors who could use the help.	2024-05-08 18:57:06.663	nan	0	nan
25	Offer to help a neighbor with household tasks	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or light housework.	Offer to help with household tasks for multiple neighbors who could use the assistance.	2024-05-09 18:57:06.663	nan	0	nan
26	Donate old toys to a childrens shelter	Gather any gently used toys your children no longer play with and donate them to a local childrens shelter.	Organize a toy drive in your neighborhood and donate the collected items to multiple childrens shelters.	2024-05-10 18:57:06.663	nan	0	nan
27	Offer to wash a neighbors car	If you notice a neighbors car is looking dirty, offer to wash it for them, especially if they are elderly or dont have the ability to do it themselves.	Offer to wash the cars of multiple neighbors who could use the help.	2024-05-11 18:57:06.663	nan	0	nan
28	Volunteer at a local library	Contact your local library and offer to volunteer your time to assist with tasks like shelving books, organizing, or assisting patrons.	Organize a group of friends or neighbors to volunteer at a local library for a full day.	2024-05-12 18:57:06.663	nan	0	nan
29	Donate old furniture to a charity	Go through your home and identify any gently used furniture you no longer need, and donate it to a local charity or thrift store.	Organize a furniture drive in your neighborhood and donate the collected items to multiple charitable organizations.	2024-05-13 18:57:06.663	nan	0	nan
30	Volunteer at a local retirement home	Contact a local retirement home or assisted living facility and offer to volunteer your time to visit with and engage the residents.	Organize a group of friends or family members to volunteer at a retirement home for a full day of activities and companionship.	2024-05-14 18:57:06.663	nan	0	nan
31	Donate old kitchen items to a shelter	Gather any gently used kitchen items, such as pots, pans, or utensils, and donate them to a local homeless shelter or transitional housing program.	Organize a kitchen item drive in your neighborhood and deliver the collected items to multiple shelters.	2024-05-15 18:57:06.663	nan	0	nan
32	Volunteer at a local museum	Contact your local museum and offer to volunteer your time to help with tasks like greeting visitors, assisting with exhibits, or leading tours.	Organize a group of friends or family members to volunteer at a local museum for a full day.	2024-05-16 18:57:06.663	nan	0	nan
33	Donate old craft supplies	Gather any unused craft supplies, such as art materials, fabrics, or sewing supplies, and donate them to a local school or community art center.	Organize a craft supply drive in your neighborhood and deliver the collected items to multiple schools or community organizations.	2024-05-17 18:57:06.663	nan	0	nan
34	Offer to help a neighbor with meal preparation	If you know a neighbor who is elderly, disabled, or simply overwhelmed with meal prep, offer to cook them a healthy meal or assist with meal planning and preparation.	Offer to help with meal preparation for multiple neighbors who could use the assistance.	2024-05-18 18:57:06.663	nan	0	nan
35	Donate old art supplies to a community center	Gather any unused art supplies, such as paints, brushes, or canvases, and donate them to a local community center or art program.	Organize an art supply drive in your neighborhood and deliver the collected items to multiple community centers or schools.	2024-05-19 18:57:06.663	nan	0	nan
36	Offer to help a neighbor with computer tasks	If you know a neighbor who is not tech-savvy, offer to assist them with tasks like setting up a new device, troubleshooting an issue, or teaching them how to use a computer program.	Offer to help with computer tasks for multiple neighbors who could use the assistance.	2024-05-20 18:57:06.663	nan	0	nan
37	Volunteer at a local youth center	Contact a local youth center or after-school program and offer to volunteer your time to help with activities, tutoring, or mentoring.	Organize a group of friends or neighbors to volunteer at a youth center for a full day.	2024-05-21 18:57:06.663	nan	0	nan
38	Donate old gardening tools to a community garden	Gather any unused gardening tools, such as shovels, rakes, or pruners, and donate them to a local community garden.	Organize a gardening tool drive in your neighborhood and deliver the collected items to multiple community gardens.	2024-05-22 18:57:06.663	nan	0	nan
39	Offer to help a neighbor with pet care	If you know a neighbor who has a pet, offer to help with tasks like walking the dog, cleaning the litter box, or providing pet-sitting services.	Offer to help with pet care for multiple neighbors who could use the assistance.	2024-05-23 18:57:06.663	nan	0	nan
40	Donate old sports equipment to a youth league	Gather any gently used sports equipment, such as balls, cleats, or protective gear, and donate them to a local youth sports league or recreation center.	Organize a sports equipment drive in your neighborhood and deliver the collected items to multiple youth leagues or recreation centers.	2024-05-24 18:57:06.663	nan	0	nan
41	Offer to help a neighbor with home repairs	If you notice a neighbors home needs minor repairs, such as fixing a leaky faucet or patching a hole in the wall, offer to lend a hand.	Offer to help with home repairs for multiple neighbors who could use the assistance.	2024-05-25 18:57:06.663	nan	0	nan
42	Donate old games and puzzles to a childrens hospital	Gather any gently used board games, puzzles, or other childrens activities and donate them to a local childrens hospital or pediatric ward.	Organize a game and puzzle drive in your neighborhood and deliver the collected items to multiple childrens hospitals or medical centers.	2024-05-26 18:57:06.663	nan	0	nan
43	Donate old towels and blankets to an animal shelter	Gather any clean, old towels and blankets you no longer need and donate them to your local animal shelter or rescue organization.	Organize a towel and blanket drive in your neighborhood and deliver the collected items to multiple animal shelters.	2024-05-27 18:57:06.663	nan	0	nan
44	Offer to help a neighbor with household chores	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or light housework.	Offer to help with household chores for multiple neighbors who could use the assistance.	2024-05-28 18:57:06.663	nan	0	nan
45	Volunteer at a local historic site or museum	Contact a local historic site or museum and offer to volunteer your time to help with tasks like gardening, maintenance, or giving tours.	Organize a group of friends or neighbors to volunteer at a historic site or museum for a full day of service.	2024-05-29 18:57:06.663	nan	0	nan
46	Donate old school supplies to a local charity or organization	Gather any unused school supplies, such as notebooks, pencils, or backpacks, and donate them to a local charity or organization that supports students in need.	Organize a school supply drive in your neighborhood and deliver the collected items to multiple charities or schools.	2024-05-30 18:57:06.663	nan	0	nan
47	Donate old books to a local prison or jail library	Gather any books you no longer need and donate them to a local prison or jail library, where they can be enjoyed by incarcerated individuals.	Organize a book drive in your neighborhood and donate the collected books to multiple prison or jail libraries.	2024-05-31 18:57:06.663	nan	0	nan
48	Offer to help a neighbor with grocery shopping or errands	If you know a neighbor who has difficulty getting to the grocery store or running errands, offer to do their shopping or errands for them.	Offer to help with grocery shopping or errands for multiple neighbors who could use the assistance.	2024-06-01 18:57:06.663	nan	0	nan
49	Donate old bedding and linens to a homeless shelter	Gather any clean, gently used bedding, sheets, or towels and donate them to your local homeless shelter.	Organize a bedding and linen drive in your neighborhood and deliver the collected items to multiple homeless shelters.	2024-06-02 18:57:06.663	nan	0	nan
50	Offer to help a neighbor with household chores or errands	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or running errands.	Offer to help with household chores or errands for multiple neighbors who could use the assistance.	2024-06-03 18:57:06.663	nan	0	nan
51	Volunteer at a local library or literacy program	Contact your local library or literacy organization and offer to volunteer your time to assist with tasks like tutoring, shelving books, or leading reading groups.	Organize a group of friends or neighbors to volunteer at a library or literacy program for a full day.	2024-06-04 18:57:06.663	nan	0	nan
52	Offer to help a neighbor with household chores or organization	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or decluttering.	Offer to help with household chores or organization for multiple neighbors who could use the assistance.	2024-06-05 18:57:06.663	nan	0	nan
53	Offer to help a neighbor with meal planning or preparation	If you know a neighbor who is elderly, disabled, or simply overwhelmed with meal prep, offer to cook them a healthy meal or assist with meal planning and preparation.	Offer to help with meal planning or preparation for multiple neighbors who could use the assistance.	2024-06-06 18:57:06.663	nan	0	nan
54	Volunteer at a local youth development program or after-school initiative	Contact a local youth center, after-school program, or community organization and offer to volunteer your time to help with activities, tutoring, or mentoring.	Organize a group of friends or neighbors to volunteer at a youth program for a full day.	2024-06-07 18:57:06.663	nan	0	nan
55	Donate old gardening tools or supplies to a community garden	Gather any unused gardening tools, such as shovels, rakes, or pruners, and donate them to a local community garden.	Organize a gardening tool or supply drive in your neighborhood and deliver the collected items to multiple community gardens.	2024-06-08 18:57:06.663	nan	0	nan
56	Offer to help a neighbor with pet care or dog walking	If you know a neighbor who has a pet, offer to help with tasks like walking the dog, cleaning the litter box, or providing pet-sitting services.	Offer to help with pet care or dog walking for multiple neighbors who could use the assistance.	2024-06-09 18:57:06.663	nan	0	nan
57	Volunteer at a local nature center, wildlife refuge, or conservation area	Contact a local nature center, wildlife refuge, or conservation organization and offer to volunteer your time to help with tasks like trail maintenance, environmental education, or animal care.	Organize a group of friends or neighbors to volunteer at a nature center or wildlife refuge for a full day of service.	2024-06-10 18:57:06.663	nan	0	nan
\.


--
-- Data for Name: completions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.completions (id, description, date, user_id, challenge_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, username, password) FROM stdin;
\.


--
-- Name: challenges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.challenges_id_seq', 57, true);


--
-- Name: completions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.completions_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


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

