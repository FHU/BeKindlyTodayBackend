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
    rating integer NOT NULL,
    twist text NOT NULL
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
703acf94-c87a-4def-bdb3-4059691aef0f	3d0965bc4bf33156535e47ee4c4a41597d146a14b3e9eb3c302b2280863ad806	2024-04-14 12:52:31.3044+00	20240323012108_test	\N	\N	2024-04-14 12:52:31.162908+00	1
0cfa1e85-0f83-4cac-b3db-6e78e185b036	89c534372340892b20a1060fa45d2ffcea26de0363e51a99d223b01043355c25	2024-04-14 12:52:31.343083+00	20240405145248_add_frontend_reqs	\N	\N	2024-04-14 12:52:31.307387+00	1
2917d279-4f3c-4173-b364-c70979085ebc	9af4530c13a31b0ba43501a8ce0dd424d2512c9cdbe4896e46d09370652c9c0d	2024-04-14 12:52:31.47374+00	20240405193931_simplify_schema	\N	\N	2024-04-14 12:52:31.346359+00	1
1ebc591f-c3ab-4bf6-9717-a5821f838a9d	1deb7e1cffd882e1b868a5898e06b784c4213f101ae52f5962f2bba3df18f6f6	2024-04-14 12:52:31.486341+00	20240407021219_add_prompt_field	\N	\N	2024-04-14 12:52:31.476877+00	1
6c4cf54d-e054-451d-a0d1-488d30b804c6	236aa2fa39007e721889991c99a7f6f86cc095e4517c8483060a9b8f217eb34b	2024-04-14 12:52:31.499311+00	20240410182129_add_image_to_challenge	\N	\N	2024-04-14 12:52:31.489469+00	1
2a8d6f31-6977-4e70-b81f-14a6617cb72d	be4f5e033118c01ec5ac87e78e07ecf2318ad27016a133780ab9477e3f55d351	2024-04-14 12:52:31.585106+00	20240412182541_change	\N	\N	2024-04-14 12:52:31.50253+00	1
5e5f1a7e-b67e-4c30-b488-056b02ebcbba	ca0a334250251709f091f9b8f3a84e974ade534461ca5455571d4bdd95a53791	2024-04-14 12:52:31.598044+00	20240414013226_change	\N	\N	2024-04-14 12:52:31.588254+00	1
9fd361a8-384d-4a1d-8683-2a25683d29f1	48bea31d29cc7421ed726dd2ed134583e66b27200cb582c5d4891214992a6ae7	2024-04-14 12:52:31.612478+00	20240414022443_fix_challenge_change_issues	\N	\N	2024-04-14 12:52:31.601268+00	1
\.


--
-- Data for Name: challenge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.challenge (id, prompt, suggestion, date, source, image, rating, twist) FROM stdin;
1	Smile at a stranger	Offer a warm, genuine smile to someone you pass on the street or encounter in a public setting.	2024-04-14 12:52:31.749	nan	nan	0	Smile at 5 strangers in a row and see if you can make them smile back.
2	Hold the door for someone	As youre entering or exiting a building, take a moment to hold the door open for the person behind you.	2024-04-15 12:52:31.749	nan	nan	0	Politely hold the door for 3 people in a row and wish them a nice day.
3	Give a compliment	Find something genuine and positive to say about someones appearance, accomplishment, or personality.	2024-04-16 12:52:31.749	nan	nan	0	Give 3 sincere compliments to people you interact with throughout your day.
4	Volunteer your time	Look for opportunities in your community to volunteer, such as at a soup kitchen, animal shelter, or nursing home.	2024-04-17 12:52:31.749	nan	nan	0	Volunteer for a full day at a local nonprofit organization of your choice.
5	Pick up litter	While out in your neighborhood or a public space, take a moment to pick up any litter you see and properly dispose of it.	2024-04-18 12:52:31.749	nan	nan	0	Organize a group of friends or neighbors to do a community litter cleanup.
6	Leave a positive note	Write an encouraging note and leave it in a public place for someone to find, such as on a car windshield or in a library book.	2024-04-19 12:52:31.749	nan	nan	0	Leave 5 positive notes in different locations around your community.
7	Donate unused items	Go through your closet, pantry, or garage and gather any gently used items you no longer need to donate to a local charity.	2024-04-20 12:52:31.749	nan	nan	0	Organize a donation drive in your neighborhood to collect items for a local shelter or nonprofit.
8	Write a thank-you note	Take the time to handwrite a note of gratitude to someone who has made a positive impact on your life.	2024-04-21 12:52:31.749	nan	nan	0	Write thank-you notes to 3 people who have helped or inspired you recently.
9	Donate books	Gather books youve already read and donate them to a local library, school, or Little Free Library.	2024-04-22 12:52:31.749	nan	nan	0	Donate 10 or more books to a local organization that provides books to underserved communities.
10	Bake treats for first responders	Prepare a batch of homemade cookies, cakes, or other baked goods and deliver them to your local fire or police station.	2024-04-23 12:52:31.749	nan	nan	0	Bake extra treats and deliver them to multiple first responder stations in your area.
11	Offer to run errands	If you know a neighbor, friend, or family member who is homebound or busy, offer to pick up groceries, prescriptions, or run other errands for them.	2024-04-24 12:52:31.749	nan	nan	0	Offer to do a weeks worth of errands for a neighbor or family member who is in need of assistance.
12	Volunteer at a food bank	Contact your local food bank or pantry and volunteer your time to help sort, package, or distribute food to those in need.	2024-04-25 12:52:31.749	nan	nan	0	Organize a group of friends or coworkers to volunteer at a food bank for a full day.
13	Write cards for seniors	Create handwritten cards or notes and deliver them to a local nursing home or senior center to brighten someones day.	2024-04-26 12:52:31.749	nan	nan	0	Write personalized cards for all the residents of a nursing home or assisted living facility.
14	Offer to mow a lawn	If you notice a neighbors lawn needs mowing, offer to do it for them, especially if they are elderly or have limited mobility.	2024-04-27 12:52:31.749	nan	nan	0	Mow the lawns of 3 neighbors who could use the help.
15	Donate unused toiletries	Gather any unused travel-sized toiletries, such as soap, shampoo, or toothpaste, and donate them to a local homeless shelter.	2024-04-28 12:52:31.749	nan	nan	0	Organize a toiletry drive in your community and deliver the collected items to multiple shelters.
16	Volunteer at an animal shelter	Contact your local animal shelter and offer to volunteer your time to help care for the animals, such as walking dogs or socializing cats.	2024-04-29 12:52:31.749	nan	nan	0	Volunteer at an animal shelter for a full day and help with as many tasks as possible.
17	Offer to babysit for free	If you know a parent who could use a break, offer to babysit their children for a few hours, free of charge.	2024-04-30 12:52:31.749	nan	nan	0	Offer to babysit for a whole evening so a couple can have a date night.
18	Volunteer at a community garden	Contact your local community garden and offer to volunteer your time to help with planting, weeding, or harvesting.	2024-05-01 12:52:31.749	nan	nan	0	Volunteer at a community garden for a full day and help with various tasks.
19	Deliver meals to the elderly	Prepare a meal or purchase pre-made meals and deliver them to elderly neighbors or members of your community who may have difficulty cooking for themselves.	2024-05-02 12:52:31.749	nan	nan	0	Organize a meal delivery service in your neighborhood to provide weekly meals for elderly residents.
20	Volunteer at a soup kitchen	Contact your local soup kitchen or food pantry and offer to volunteer your time to help prepare or serve meals to those in need.	2024-05-03 12:52:31.749	nan	nan	0	Organize a group of friends or coworkers to volunteer at a soup kitchen for a full day.
21	Offer to water plants for a neighbor	If you know a neighbor who is going on vacation, offer to water their indoor or outdoor plants while theyre away.	2024-05-04 12:52:31.749	nan	nan	0	Offer to water the plants of multiple neighbors who are going on trips at the same time.
22	Volunteer at a local park	Contact your local parks department and offer to volunteer your time to help with park maintenance, such as litter cleanup or trail maintenance.	2024-05-05 12:52:31.749	nan	nan	0	Organize a group of friends or neighbors to volunteer at a local park for a full day of service.
23	Offer to run errands for a busy parent	If you know a parent who is juggling a lot of responsibilities, offer to run errands for them, such as picking up groceries or taking their children to activities.	2024-05-06 12:52:31.749	nan	nan	0	Offer to run a weeks worth of errands for a busy parent in your community.
24	Volunteer at a community center	Contact your local community center and offer to volunteer your time to help with various activities or programs.	2024-05-07 12:52:31.749	nan	nan	0	Organize a group of friends or neighbors to volunteer at a community center for a full day.
25	Donate old clothes to a charity	Go through your closet and gather any gently used clothes you no longer need, and donate them to a local charity or clothing drive.	2024-05-08 12:52:31.749	nan	nan	0	Organize a clothing drive in your neighborhood and deliver the collected items to multiple charitable organizations.
26	Offer to mow a neighbors lawn	If you notice a neighbors lawn needs mowing, offer to do it for them, especially if they are elderly or have limited mobility.	2024-05-09 12:52:31.749	nan	nan	0	Offer to mow the lawns of multiple neighbors who could use the help.
27	Offer to walk a neighbors dog	If you know a neighbor who has a dog, offer to take their furry friend for a walk, especially if the neighbor is busy or unable to do it themselves.	2024-05-10 12:52:31.749	nan	nan	0	Offer to walk the dogs of multiple neighbors who could use the help.
28	Offer to help a neighbor with yard work	If you notice a neighbors yard needs attention, offer to help with tasks like mowing, weeding, or gardening.	2024-05-11 12:52:31.749	nan	nan	0	Offer to help with yard work for multiple neighbors who could use the assistance.
29	Volunteer at a local community center	Contact your local community center and offer to volunteer your time to help with various activities or programs.	2024-05-12 12:52:31.749	nan	nan	0	Organize a group of friends or neighbors to volunteer at a community center for a full day.
30	Offer to help a neighbor with housework	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or light housework.	2024-05-13 12:52:31.749	nan	nan	0	Offer to help with housework for multiple neighbors who could use the assistance.
31	Offer to help a neighbor with grocery shopping	If you know a neighbor who has difficulty getting to the grocery store, offer to do their shopping for them.	2024-05-14 12:52:31.749	nan	nan	0	Offer to do the grocery shopping for multiple neighbors who could use the help.
32	Offer to help a neighbor with household tasks	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or light housework.	2024-05-15 12:52:31.749	nan	nan	0	Offer to help with household tasks for multiple neighbors who could use the assistance.
33	Donate old toys to a childrens shelter	Gather any gently used toys your children no longer play with and donate them to a local childrens shelter.	2024-05-16 12:52:31.749	nan	nan	0	Organize a toy drive in your neighborhood and donate the collected items to multiple childrens shelters.
34	Offer to wash a neighbors car	If you notice a neighbors car is looking dirty, offer to wash it for them, especially if they are elderly or dont have the ability to do it themselves.	2024-05-17 12:52:31.749	nan	nan	0	Offer to wash the cars of multiple neighbors who could use the help.
35	Volunteer at a local library	Contact your local library and offer to volunteer your time to assist with tasks like shelving books, organizing, or assisting patrons.	2024-05-18 12:52:31.749	nan	nan	0	Organize a group of friends or neighbors to volunteer at a local library for a full day.
36	Donate old furniture to a charity	Go through your home and identify any gently used furniture you no longer need, and donate it to a local charity or thrift store.	2024-05-19 12:52:31.749	nan	nan	0	Organize a furniture drive in your neighborhood and donate the collected items to multiple charitable organizations.
37	Volunteer at a local retirement home	Contact a local retirement home or assisted living facility and offer to volunteer your time to visit with and engage the residents.	2024-05-20 12:52:31.749	nan	nan	0	Organize a group of friends or family members to volunteer at a retirement home for a full day of activities and companionship.
38	Donate old kitchen items to a shelter	Gather any gently used kitchen items, such as pots, pans, or utensils, and donate them to a local homeless shelter or transitional housing program.	2024-05-21 12:52:31.749	nan	nan	0	Organize a kitchen item drive in your neighborhood and deliver the collected items to multiple shelters.
39	Donate old electronics to a recycling program	Go through your home and gather any old, unused electronics, such as phones, laptops, or tablets, and donate them to a local electronics recycling program.	2024-05-22 12:52:31.749	nan	nan	0	Organize an electronics recycling drive in your neighborhood and deliver the collected items to multiple recycling facilities.
40	Volunteer at a local museum	Contact your local museum and offer to volunteer your time to help with tasks like greeting visitors, assisting with exhibits, or leading tours.	2024-05-23 12:52:31.749	nan	nan	0	Organize a group of friends or family members to volunteer at a local museum for a full day.
41	Donate old craft supplies	Gather any unused craft supplies, such as art materials, fabrics, or sewing supplies, and donate them to a local school or community art center.	2024-05-24 12:52:31.749	nan	nan	0	Organize a craft supply drive in your neighborhood and deliver the collected items to multiple schools or community organizations.
42	Offer to help a neighbor with meal preparation	If you know a neighbor who is elderly, disabled, or simply overwhelmed with meal prep, offer to cook them a healthy meal or assist with meal planning and preparation.	2024-05-25 12:52:31.749	nan	nan	0	Offer to help with meal preparation for multiple neighbors who could use the assistance.
43	Donate old art supplies to a community center	Gather any unused art supplies, such as paints, brushes, or canvases, and donate them to a local community center or art program.	2024-05-26 12:52:31.749	nan	nan	0	Organize an art supply drive in your neighborhood and deliver the collected items to multiple community centers or schools.
44	Offer to help a neighbor with computer tasks	If you know a neighbor who is not tech-savvy, offer to assist them with tasks like setting up a new device, troubleshooting an issue, or teaching them how to use a computer program.	2024-05-27 12:52:31.749	nan	nan	0	Offer to help with computer tasks for multiple neighbors who could use the assistance.
45	Volunteer at a local youth center	Contact a local youth center or after-school program and offer to volunteer your time to help with activities, tutoring, or mentoring.	2024-05-28 12:52:31.749	nan	nan	0	Organize a group of friends or neighbors to volunteer at a youth center for a full day.
46	Donate old gardening tools to a community garden	Gather any unused gardening tools, such as shovels, rakes, or pruners, and donate them to a local community garden.	2024-05-29 12:52:31.749	nan	nan	0	Organize a gardening tool drive in your neighborhood and deliver the collected items to multiple community gardens.
47	Offer to help a neighbor with pet care	If you know a neighbor who has a pet, offer to help with tasks like walking the dog, cleaning the litter box, or providing pet-sitting services.	2024-05-30 12:52:31.749	nan	nan	0	Offer to help with pet care for multiple neighbors who could use the assistance.
48	Donate old sports equipment to a youth league	Gather any gently used sports equipment, such as balls, cleats, or protective gear, and donate them to a local youth sports league or recreation center.	2024-05-31 12:52:31.749	nan	nan	0	Organize a sports equipment drive in your neighborhood and deliver the collected items to multiple youth leagues or recreation centers.
49	Offer to help a neighbor with home repairs	If you notice a neighbors home needs minor repairs, such as fixing a leaky faucet or patching a hole in the wall, offer to lend a hand.	2024-06-01 12:52:31.749	nan	nan	0	Offer to help with home repairs for multiple neighbors who could use the assistance.
50	Donate old games and puzzles to a childrens hospital	Gather any gently used board games, puzzles, or other childrens activities and donate them to a local childrens hospital or pediatric ward.	2024-06-02 12:52:31.749	nan	nan	0	Organize a game and puzzle drive in your neighborhood and deliver the collected items to multiple childrens hospitals or medical centers.
51	Donate old towels and blankets to an animal shelter	Gather any clean, old towels and blankets you no longer need and donate them to your local animal shelter or rescue organization.	2024-06-03 12:52:31.749	nan	nan	0	Organize a towel and blanket drive in your neighborhood and deliver the collected items to multiple animal shelters.
52	Donate old school supplies to a local organization	Gather any unused school supplies, such as notebooks, pens, or backpacks, and donate them to a local charity or organization that supports students in need.	2024-06-04 12:52:31.749	nan	nan	0	Organize a school supply drive in your neighborhood and deliver the collected items to multiple organizations.
53	Offer to help a neighbor with household chores	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or light housework.	2024-06-05 12:52:31.749	nan	nan	0	Offer to help with household chores for multiple neighbors who could use the assistance.
54	Donate old furniture to a charity thrift store	Go through your home and identify any gently used furniture you no longer need, and donate it to a local charity thrift store.	2024-06-06 12:52:31.749	nan	nan	0	Organize a furniture drive in your neighborhood and donate the collected items to multiple charitable thrift stores.
55	Offer to help a neighbor with yard maintenance	If you notice a neighbors yard needs attention, offer to help with tasks like mowing, weeding, or gardening.	2024-06-07 12:52:31.749	nan	nan	0	Offer to help with yard maintenance for multiple neighbors who could use the assistance.
56	Volunteer at a local senior center	Contact a local retirement home or assisted living facility and offer to volunteer your time to visit with and engage the residents.	2024-06-08 12:52:31.749	nan	nan	0	Organize a group of friends or family members to volunteer at a senior center for a full day of activities and companionship.
57	Offer to help a neighbor with outdoor tasks	If you notice a neighbors yard needs attention, offer to help with tasks like mowing, weeding, or gardening.	2024-06-09 12:52:31.749	nan	nan	0	Offer to help with outdoor tasks for multiple neighbors who could use the assistance.
58	Volunteer at a local historic site or museum	Contact a local historic site or museum and offer to volunteer your time to help with tasks like gardening, maintenance, or giving tours.	2024-06-10 12:52:31.749	nan	nan	0	Organize a group of friends or neighbors to volunteer at a historic site or museum for a full day of service.
59	Offer to help a neighbor with technology tasks	If you know a neighbor who is not tech-savvy, offer to assist them with tasks like setting up a new device, troubleshooting an issue, or teaching them how to use a computer program.	2024-06-11 12:52:31.749	nan	nan	0	Offer to help with technology tasks for multiple neighbors who could use the assistance.
60	Volunteer at a local youth development program	Contact a local youth center or after-school program and offer to volunteer your time to help with activities, tutoring, or mentoring.	2024-06-12 12:52:31.749	nan	nan	0	Organize a group of friends or neighbors to volunteer at a youth program for a full day.
61	Volunteer at a local nature center or wildlife refuge	Contact a local nature center or wildlife refuge and offer to volunteer your time to help with tasks like trail maintenance, environmental education, or animal care.	2024-06-13 12:52:31.749	nan	nan	0	Organize a group of friends or neighbors to volunteer at a nature center for a full day of service.
62	Donate old sports equipment to a youth sports league	Gather any gently used sports equipment, such as balls, cleats, or protective gear, and donate them to a local youth sports league or recreation center.	2024-06-14 12:52:31.749	nan	nan	0	Organize a sports equipment drive in your neighborhood and deliver the collected items to multiple youth leagues or recreation centers.
63	Offer to help a neighbor with minor home repairs	If you notice a neighbors home needs small repairs, such as fixing a leaky faucet or patching a hole in the wall, offer to lend a hand.	2024-06-15 12:52:31.749	nan	nan	0	Offer to help with home repairs for multiple neighbors who could use the assistance.
64	Donate old board games and puzzles to a childrens hospital	Gather any gently used board games, puzzles, or other childrens activities and donate them to a local childrens hospital or pediatric ward.	2024-06-16 12:52:31.749	nan	nan	0	Organize a game and puzzle drive in your neighborhood and deliver the collected items to multiple childrens hospitals or medical centers.
65	Donate old school supplies to a local charity or organization	Gather any unused school supplies, such as notebooks, pencils, or backpacks, and donate them to a local charity or organization that supports students in need.	2024-06-17 12:52:31.749	nan	nan	0	Organize a school supply drive in your neighborhood and deliver the collected items to multiple charities or schools.
66	Offer to help a neighbor with yard work or gardening	If you notice a neighbors yard needs attention, offer to help with tasks like mowing, weeding, or gardening.	2024-06-18 12:52:31.749	nan	nan	0	Offer to help with yard work or gardening for multiple neighbors who could use the assistance.
67	Donate old books to a local prison or jail library	Gather any books you no longer need and donate them to a local prison or jail library, where they can be enjoyed by incarcerated individuals.	2024-06-19 12:52:31.749	nan	nan	0	Organize a book drive in your neighborhood and donate the collected books to multiple prison or jail libraries.
68	Offer to help a neighbor with grocery shopping or errands	If you know a neighbor who has difficulty getting to the grocery store or running errands, offer to do their shopping or errands for them.	2024-06-20 12:52:31.749	nan	nan	0	Offer to help with grocery shopping or errands for multiple neighbors who could use the assistance.
69	Donate old bedding and linens to a homeless shelter	Gather any clean, gently used bedding, sheets, or towels and donate them to your local homeless shelter.	2024-06-21 12:52:31.749	nan	nan	0	Organize a bedding and linen drive in your neighborhood and deliver the collected items to multiple homeless shelters.
70	Offer to help a neighbor with yard work or landscaping	If you notice a neighbors yard needs attention, offer to help with tasks like mowing, weeding, or gardening.	2024-06-22 12:52:31.749	nan	nan	0	Offer to help with yard work or landscaping for multiple neighbors who could use the assistance.
71	Offer to help a neighbor with household chores or errands	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or running errands.	2024-06-23 12:52:31.749	nan	nan	0	Offer to help with household chores or errands for multiple neighbors who could use the assistance.
72	Volunteer at a local library or literacy program	Contact your local library or literacy organization and offer to volunteer your time to assist with tasks like tutoring, shelving books, or leading reading groups.	2024-06-24 12:52:31.749	nan	nan	0	Organize a group of friends or neighbors to volunteer at a library or literacy program for a full day.
73	Offer to help a neighbor with yard maintenance or gardening	If you notice a neighbors yard needs attention, offer to help with tasks like mowing, weeding, or gardening.	2024-06-25 12:52:31.749	nan	nan	0	Offer to help with yard maintenance or gardening for multiple neighbors who could use the assistance.
74	Volunteer at a local senior center or retirement home	Contact a local senior center or retirement home and offer to volunteer your time to visit with and engage the residents.	2024-06-26 12:52:31.749	nan	nan	0	Organize a group of friends or family members to volunteer at a senior center for a full day of activities and companionship.
75	Offer to help a neighbor with outdoor tasks or chores	If you notice a neighbors yard or outdoor space needs attention, offer to help with tasks like mowing, weeding, or gardening.	2024-06-27 12:52:31.749	nan	nan	0	Offer to help with outdoor tasks or chores for multiple neighbors who could use the assistance.
76	Offer to help a neighbor with household chores or organization	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or decluttering.	2024-06-28 12:52:31.749	nan	nan	0	Offer to help with household chores or organization for multiple neighbors who could use the assistance.
77	Offer to help a neighbor with meal planning or preparation	If you know a neighbor who is elderly, disabled, or simply overwhelmed with meal prep, offer to cook them a healthy meal or assist with meal planning and preparation.	2024-06-29 12:52:31.749	nan	nan	0	Offer to help with meal planning or preparation for multiple neighbors who could use the assistance.
78	Offer to help a neighbor with technology or digital tasks	If you know a neighbor who is not tech-savvy, offer to assist them with tasks like setting up a new device, troubleshooting an issue, or teaching them how to use a computer program.	2024-06-30 12:52:31.749	nan	nan	0	Offer to help with technology or digital tasks for multiple neighbors who could use the assistance.
79	Volunteer at a local youth development program or after-school initiative	Contact a local youth center, after-school program, or community organization and offer to volunteer your time to help with activities, tutoring, or mentoring.	2024-07-01 12:52:31.749	nan	nan	0	Organize a group of friends or neighbors to volunteer at a youth program for a full day.
80	Donate old gardening tools or supplies to a community garden	Gather any unused gardening tools, such as shovels, rakes, or pruners, and donate them to a local community garden.	2024-07-02 12:52:31.749	nan	nan	0	Organize a gardening tool or supply drive in your neighborhood and deliver the collected items to multiple community gardens.
81	Offer to help a neighbor with pet care or dog walking	If you know a neighbor who has a pet, offer to help with tasks like walking the dog, cleaning the litter box, or providing pet-sitting services.	2024-07-03 12:52:31.749	nan	nan	0	Offer to help with pet care or dog walking for multiple neighbors who could use the assistance.
82	Volunteer at a local nature center, wildlife refuge, or conservation area	Contact a local nature center, wildlife refuge, or conservation organization and offer to volunteer your time to help with tasks like trail maintenance, environmental education, or animal care.	2024-07-04 12:52:31.749	nan	nan	0	Organize a group of friends or neighbors to volunteer at a nature center or wildlife refuge for a full day of service.
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

SELECT pg_catalog.setval('public.challenge_id_seq', 82, true);


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

