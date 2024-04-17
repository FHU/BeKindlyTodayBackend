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
    date date NOT NULL,
    source text NOT NULL,
    rating integer NOT NULL,
    image text NOT NULL,
    spanish_prompt text,
    spanish_twist text
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
    challenge_id integer NOT NULL,
    completed_twist boolean DEFAULT false NOT NULL
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
    password text NOT NULL,
    bio text
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
129046b0-81d7-4323-8218-b20a26ff79a4	3d0965bc4bf33156535e47ee4c4a41597d146a14b3e9eb3c302b2280863ad806	2024-04-17 16:50:37.94336+00	20240323012108_test	\N	\N	2024-04-17 16:50:37.800831+00	1
10c5f77f-7524-4f62-90df-968939a18592	89c534372340892b20a1060fa45d2ffcea26de0363e51a99d223b01043355c25	2024-04-17 16:50:37.980733+00	20240405145248_add_frontend_reqs	\N	\N	2024-04-17 16:50:37.946515+00	1
fc7594c1-568d-4f40-a872-c61b2d223cc2	9af4530c13a31b0ba43501a8ce0dd424d2512c9cdbe4896e46d09370652c9c0d	2024-04-17 16:50:38.118059+00	20240405193931_simplify_schema	\N	\N	2024-04-17 16:50:37.984039+00	1
b741c4a7-7254-4a61-9fb2-7ff0da031a0b	1deb7e1cffd882e1b868a5898e06b784c4213f101ae52f5962f2bba3df18f6f6	2024-04-17 16:50:38.130597+00	20240407021219_add_prompt_field	\N	\N	2024-04-17 16:50:38.120938+00	1
5d68f298-9886-48a4-8cd8-3f2d0c8d205b	236aa2fa39007e721889991c99a7f6f86cc095e4517c8483060a9b8f217eb34b	2024-04-17 16:50:38.143459+00	20240410182129_add_image_to_challenge	\N	\N	2024-04-17 16:50:38.13386+00	1
87d059f5-2f3a-4945-b2a2-b57138865b05	be4f5e033118c01ec5ac87e78e07ecf2318ad27016a133780ab9477e3f55d351	2024-04-17 16:50:38.226711+00	20240412182541_change	\N	\N	2024-04-17 16:50:38.146785+00	1
a34d56c7-5bad-4b1d-947f-23c12183e92a	ca0a334250251709f091f9b8f3a84e974ade534461ca5455571d4bdd95a53791	2024-04-17 16:50:38.239988+00	20240414013226_change	\N	\N	2024-04-17 16:50:38.229956+00	1
32741048-353c-472d-a683-d07bda82b84b	48bea31d29cc7421ed726dd2ed134583e66b27200cb582c5d4891214992a6ae7	2024-04-17 16:50:38.255163+00	20240414022443_fix_challenge_change_issues	\N	\N	2024-04-17 16:50:38.243269+00	1
071a504b-b3b3-4c7c-9e22-8e446eae7a1e	ec882d803bc38d05f8e1ba8daee82d6ec57dbd57d422f963b02d10ae3018dacd	2024-04-17 16:50:38.337919+00	20240415185228_add_correct_mapping	\N	\N	2024-04-17 16:50:38.258801+00	1
e41f6dd4-f5a8-4af2-ad3b-32ce4b14eaef	f5bdc4c5639bbbca5aed4de1b7fa45ce0b042c307938c3b3bb1133098d1c72e6	2024-04-17 16:50:38.349508+00	20240416032629_added_spanish_challenges	\N	\N	2024-04-17 16:50:38.341066+00	1
567c9b41-300f-4672-936c-371990565643	6e56f5de2ac292c2aa9fb69c8523ccd735a0d6ae1a2014a008304d8d052e88e9	2024-04-17 16:50:38.365746+00	20240416033211_add_unique_to_prompt	\N	\N	2024-04-17 16:50:38.352748+00	1
3b8121ee-d9cf-409e-b718-6cf4944b056b	bbe55ce1b4e371256b7278b03678a93ad1ce86caebef62c8272cbba72d589d47	2024-04-17 16:50:38.403876+00	20240416135724_change_date_time_type	\N	\N	2024-04-17 16:50:38.36882+00	1
61e9965f-8258-442c-8829-272542acd647	a8fbbe883517d62036144233aab8a11a5042fc4e4a32d36914746ceb94f3ef5e	2024-04-17 16:50:38.416904+00	20240417153835_add_bio_and_completion_twist	\N	\N	2024-04-17 16:50:38.40734+00	1
\.


--
-- Data for Name: challenges; Type: TABLE DATA; Schema: public; Owner: bktdbsudouser
--

COPY public.challenges (id, prompt, suggestion, twist, date, source, rating, image, spanish_prompt, spanish_twist) FROM stdin;
1	Smile at a stranger	Offer a warm, genuine smile to someone you pass on the street or encounter in a public setting.	Smile at 5 strangers in a row and see if you can make them smile back.	2024-04-17	nan	0	Claude	Sonría a un extraño	nan
2	Hold the door for someone	As youre entering or exiting a building, take a moment to hold the door open for the person behind you.	Politely hold the door for 3 people in a row and wish them a nice day.	2024-04-18	nan	0	Claude	Mantenga la puerta a alguien	nan
3	Give a compliment	Find something genuine and positive to say about someones appearance, accomplishment, or personality.	Give 3 sincere compliments to people you interact with throughout your day.	2024-04-19	nan	0	Claude	Dé un cumplido a alguien	nan
4	Pick up litter	While out in your neighborhood or a public space, take a moment to pick up any litter you see and properly dispose of it.	Organize a group of friends or neighbors to do a community litter cleanup.	2024-04-20	nan	0	Claude	Recoja la basura cerca de la carretera	nan
5	Leave a positive note	Write an encouraging note and leave it in a public place for someone to find, such as on a car windshield or in a library book.	Leave 5 positive notes in different locations around your community.	2024-04-21	nan	0	Claude	Deje una nota amable	nan
6	Write a thank-you note	Take the time to handwrite a note of gratitude to someone who has made a positive impact on your life.	Write thank-you notes to 3 people who have helped or inspired you recently.	2024-04-22	nan	0	Claude	Escriba una nota de agradecimiento	nan
7	Donate books	Gather books youve already read and donate them to a local library, school, or Little Free Library.	Donate 10 or more books to a local organization that provides books to underserved communities.	2024-04-23	nan	0	Claude	Done libros	nan
8	Bake treats for first responders	Prepare a batch of homemade cookies, cakes, or other baked goods and deliver them to your local fire or police station.	Bake extra treats and deliver them to multiple first responder stations in your area.	2024-04-24	nan	0	Claude	Hornee productos horneados para socorristas	nan
9	Offer to run errands	If you know a neighbor, friend, or family member who is homebound or busy, offer to pick up groceries, prescriptions, or run other errands for them.	Offer to do a weeks worth of errands for a neighbor or family member who is in need of assistance.	2024-04-25	nan	0	Claude	Ofrézcase a hacer mandados	nan
10	Volunteer at a food bank	Contact your local food bank or pantry and volunteer your time to help sort, package, or distribute food to those in need.	Organize a group of friends or coworkers to volunteer at a food bank for a full day.	2024-04-26	nan	0	Claude	Ofrézcase como voluntario en un banco de alimentos	nan
11	Write cards for seniors	Create handwritten cards or notes and deliver them to a local nursing home or senior center to brighten someones day.	Write personalized cards for all the residents of a nursing home or assisted living facility.	2024-04-27	nan	0	Claude	Escriba cartas para personas mayores	nan
12	Offer to mow a lawn	If you notice a neighbors lawn needs mowing, offer to do it for them, especially if they are elderly or have limited mobility.	Mow the lawns of 3 neighbors who could use the help.	2024-04-28	nan	0	Claude	Ofrézcase a cortar el césped	nan
13	Donate unused toiletries	Gather any unused travel-sized toiletries, such as soap, shampoo, or toothpaste, and donate them to a local homeless shelter.	Organize a toiletry drive in your community and deliver the collected items to multiple shelters.	2024-04-29	nan	0	Claude	Done artículos de tocador no utilizados	nan
14	Volunteer at an animal shelter	Contact your local animal shelter and offer to volunteer your time to help care for the animals, such as walking dogs or socializing cats.	Volunteer at an animal shelter for a full day and help with as many tasks as possible.	2024-04-30	nan	0	Claude	Ofrézcase como voluntario en un refugio de animales	nan
15	Volunteer at a community garden	Contact your local community garden and offer to volunteer your time to help with planting, weeding, or harvesting.	Volunteer at a community garden for a full day and help with various tasks.	2024-05-01	nan	0	Claude	Ofrézcase como voluntario en un jardín comunitario	nan
16	Volunteer at a soup kitchen	Contact your local soup kitchen or food pantry and offer to volunteer your time to help prepare or serve meals to those in need.	Organize a group of friends or coworkers to volunteer at a soup kitchen for a full day.	2024-05-02	nan	0	Claude	Ofrézcase como voluntario en un comedor de beneficencia	nan
17	Volunteer at a local park	Contact your local parks department and offer to volunteer your time to help with park maintenance, such as litter cleanup or trail maintenance.	Organize a group of friends or neighbors to volunteer at a local park for a full day of service.	2024-05-03	nan	0	Claude	Ofrézcase como voluntario en un parque local	nan
18	Offer to run errands for a busy parent	If you know a parent who is juggling a lot of responsibilities, offer to run errands for them, such as picking up groceries or taking their children to activities.	Offer to run a weeks worth of errands for a busy parent in your community.	2024-05-04	nan	0	Claude	Ofrézcase a hacer mandados para un padre ocupado	nan
19	Volunteer at a community center	Contact your local community center and offer to volunteer your time to help with various activities or programs.	Organize a group of friends or neighbors to volunteer at a community center for a full day.	2024-05-05	nan	0	Claude	Ofrézcase como voluntario en un centro comunitario	nan
20	Donate old clothes to a charity	Go through your closet and gather any gently used clothes you no longer need, and donate them to a local charity or clothing drive.	Organize a clothing drive in your neighborhood and deliver the collected items to multiple charitable organizations.	2024-05-06	nan	0	Claude	Done ropa vieja a una organización benéfica	nan
21	Offer to walk a neighbors dog	If you know a neighbor who has a dog, offer to take their furry friend for a walk, especially if the neighbor is busy or unable to do it themselves.	Offer to walk the dogs of multiple neighbors who could use the help.	2024-05-07	nan	0	Claude	Ofrézcase a pasear al perro de un vecino	nan
22	Offer to help a neighbor with yard work	If you notice a neighbors yard needs attention, offer to help with tasks like mowing, weeding, or gardening.	Offer to help with yard work for multiple neighbors who could use the assistance.	2024-05-08	nan	0	Claude	Ofrézcase a ayudar a un vecino con el trabajo del césped	nan
23	Volunteer at a local community center	Contact your local community center and offer to volunteer your time to help with various activities or programs.	Organize a group of friends or neighbors to volunteer at a community center for a full day.	2024-05-09	nan	0	Claude	Ofrézcase como voluntario en un centro comunitario local	nan
24	Offer to help a neighbor with grocery shopping	If you know a neighbor who has difficulty getting to the grocery store, offer to do their shopping for them.	Offer to do the grocery shopping for multiple neighbors who could use the help.	2024-05-10	nan	0	Claude	Ofrézcase a ayudar a un vecino con las compras de comestibles	nan
25	Offer to help a neighbor with household tasks	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or light housework.	Offer to help with household tasks for multiple neighbors who could use the assistance.	2024-05-11	nan	0	Claude	Ofrézcase a ayudar a un vecino con las tareas domésticas	nan
26	Donate old toys to a childrens shelter	Gather any gently used toys your children no longer play with and donate them to a local childrens shelter.	Organize a toy drive in your neighborhood and donate the collected items to multiple childrens shelters.	2024-05-12	nan	0	Claude	Done juguetes viejos a un refugio para niños	nan
27	Offer to wash a neighbors car	If you notice a neighbors car is looking dirty, offer to wash it for them, especially if they are elderly or dont have the ability to do it themselves.	Offer to wash the cars of multiple neighbors who could use the help.	2024-05-13	nan	0	Claude	Ofrézcase a lavar el auto de un vecino	nan
28	Volunteer at a local library	Contact your local library and offer to volunteer your time to assist with tasks like shelving books, organizing, or assisting patrons.	Organize a group of friends or neighbors to volunteer at a local library for a full day.	2024-05-14	nan	0	Claude	Ofrézcase como voluntario en una biblioteca local	nan
29	Donate old furniture to a charity	Go through your home and identify any gently used furniture you no longer need, and donate it to a local charity or thrift store.	Organize a furniture drive in your neighborhood and donate the collected items to multiple charitable organizations.	2024-05-15	nan	0	Claude	Done muebles viejos a una organización benéfica	nan
30	Volunteer at a local retirement home	Contact a local retirement home or assisted living facility and offer to volunteer your time to visit with and engage the residents.	Organize a group of friends or family members to volunteer at a retirement home for a full day of activities and companionship.	2024-05-16	nan	0	Claude	Ofrézcase como voluntario en una residencia de ancianos local	nan
31	Donate old kitchen items to a shelter	Gather any gently used kitchen items, such as pots, pans, or utensils, and donate them to a local homeless shelter or transitional housing program.	Organize a kitchen item drive in your neighborhood and deliver the collected items to multiple shelters.	2024-05-17	nan	0	Claude	Done artículos de cocina viejos a un refugio	nan
32	Volunteer at a local museum	Contact your local museum and offer to volunteer your time to help with tasks like greeting visitors, assisting with exhibits, or leading tours.	Organize a group of friends or family members to volunteer at a local museum for a full day.	2024-05-18	nan	0	Claude	Ofrézcase como voluntario en un museo local	nan
33	Donate old craft supplies	Gather any unused craft supplies, such as art materials, fabrics, or sewing supplies, and donate them to a local school or community art center.	Organize a craft supply drive in your neighborhood and deliver the collected items to multiple schools or community organizations.	2024-05-19	nan	0	Claude	Done materiales de manualidades viejos	nan
34	Offer to help a neighbor with meal preparation	If you know a neighbor who is elderly, disabled, or simply overwhelmed with meal prep, offer to cook them a healthy meal or assist with meal planning and preparation.	Offer to help with meal preparation for multiple neighbors who could use the assistance.	2024-05-20	nan	0	Claude	Ofrézcase a ayudar a un vecino con la preparación de la comida	nan
35	Donate old art supplies to a community center	Gather any unused art supplies, such as paints, brushes, or canvases, and donate them to a local community center or art program.	Organize an art supply drive in your neighborhood and deliver the collected items to multiple community centers or schools.	2024-05-21	nan	0	Claude	Done materiales de arte antiguos a un centro comunitario	nan
36	Offer to help a neighbor with computer tasks	If you know a neighbor who is not tech-savvy, offer to assist them with tasks like setting up a new device, troubleshooting an issue, or teaching them how to use a computer program.	Offer to help with computer tasks for multiple neighbors who could use the assistance.	2024-05-22	nan	0	Claude	Ofrézcase a ayudar a un vecino con las tareas de la computadora	nan
37	Donate old gardening tools to a community garden	Gather any unused gardening tools, such as shovels, rakes, or pruners, and donate them to a local community garden.	Organize a gardening tool drive in your neighborhood and deliver the collected items to multiple community gardens.	2024-05-23	nan	0	Claude	Done herramientas de jardinería viejas a un jardín comunitario	nan
38	Offer to help a neighbor with pet care	If you know a neighbor who has a pet, offer to help with tasks like walking the dog, cleaning the litter box, or providing pet-sitting services.	Offer to help with pet care for multiple neighbors who could use the assistance.	2024-05-24	nan	0	Claude	Ofrézcase a ayudar a un vecino con el cuidado de mascotas	nan
39	Donate old sports equipment to a youth league	Gather any gently used sports equipment, such as balls, cleats, or protective gear, and donate them to a local youth sports league or recreation center.	Organize a sports equipment drive in your neighborhood and deliver the collected items to multiple youth leagues or recreation centers.	2024-05-25	nan	0	Claude	Done material deportivo viejo a una liga juvenil	nan
40	Offer to help a neighbor with home repairs	If you notice a neighbors home needs minor repairs, such as fixing a leaky faucet or patching a hole in the wall, offer to lend a hand.	Offer to help with home repairs for multiple neighbors who could use the assistance.	2024-05-26	nan	0	Claude	Ofrézcase a ayudar a un vecino con las reparaciones de la casa	nan
41	Donate old games and puzzles to a childrens hospital	Gather any gently used board games, puzzles, or other childrens activities and donate them to a local childrens hospital or pediatric ward.	Organize a game and puzzle drive in your neighborhood and deliver the collected items to multiple childrens hospitals or medical centers.	2024-05-27	nan	0	Claude	Done juegos y rompecabezas antiguos a un hospital infantil	nan
42	Donate old towels and blankets to an animal shelter	Gather any clean, old towels and blankets you no longer need and donate them to your local animal shelter or rescue organization.	Organize a towel and blanket drive in your neighborhood and deliver the collected items to multiple animal shelters.	2024-05-28	nan	0	Claude	Done toallas y mantas viejas a un refugio de animales	nan
43	Offer to help a neighbor with household chores	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or light housework.	Offer to help with household chores for multiple neighbors who could use the assistance.	2024-05-29	nan	0	Claude	Ofrézcase a ayudar a un vecino con las tareas domésticas	nan
44	Volunteer at a local historic site or museum	Contact a local historic site or museum and offer to volunteer your time to help with tasks like gardening, maintenance, or giving tours.	Organize a group of friends or neighbors to volunteer at a historic site or museum for a full day of service.	2024-05-30	nan	0	Claude	Ofrézcase como voluntario en un sitio histórico o museo local	nan
45	Donate old school supplies to a local charity or organization	Gather any unused school supplies, such as notebooks, pencils, or backpacks, and donate them to a local charity or organization that supports students in need.	Organize a school supply drive in your neighborhood and deliver the collected items to multiple charities or schools.	2024-05-31	nan	0	Claude	Done útiles escolares viejos a una organización benéfica u organización local	nan
46	Donate old books to a local prison or jail library	Gather any books you no longer need and donate them to a local prison or jail library, where they can be enjoyed by incarcerated individuals.	Organize a book drive in your neighborhood and donate the collected books to multiple prison or jail libraries.	2024-06-01	nan	0	Claude	Done libros antiguos a una prisión local o a la biblioteca de la cárcel	nan
47	Offer to help a neighbor with grocery shopping or errands	If you know a neighbor who has difficulty getting to the grocery store or running errands, offer to do their shopping or errands for them.	Offer to help with grocery shopping or errands for multiple neighbors who could use the assistance.	2024-06-02	nan	0	Claude	Ofrézcase a ayudar a un vecino con las compras de comestibles o los mandados	nan
48	Donate old bedding and linens to a homeless shelter	Gather any clean, gently used bedding, sheets, or towels and donate them to your local homeless shelter.	Organize a bedding and linen drive in your neighborhood and deliver the collected items to multiple homeless shelters.	2024-06-03	nan	0	Claude	Done ropa de cama y sábanas viejas a un refugio para indigentes	nan
49	Offer to help a neighbor with household chores or errands	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or running errands.	Offer to help with household chores or errands for multiple neighbors who could use the assistance.	2024-06-04	nan	0	Claude	Ofrézcase a ayudar a un vecino con las tareas domésticas o los mandados	nan
50	Volunteer at a local library or literacy program	Contact your local library or literacy organization and offer to volunteer your time to assist with tasks like tutoring, shelving books, or leading reading groups.	Organize a group of friends or neighbors to volunteer at a library or literacy program for a full day.	2024-06-05	nan	0	Claude	Ofrézcase como voluntario en una biblioteca local o en un programa de alfabetización	nan
51	Offer to help a neighbor with household chores or organization	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or decluttering.	Offer to help with household chores or organization for multiple neighbors who could use the assistance.	2024-06-06	nan	0	Claude	Ofrézcase a ayudar a un vecino con las tareas domésticas o con la organización	nan
52	Offer to help a neighbor with meal planning or preparation	If you know a neighbor who is elderly, disabled, or simply overwhelmed with meal prep, offer to cook them a healthy meal or assist with meal planning and preparation.	Offer to help with meal planning or preparation for multiple neighbors who could use the assistance.	2024-06-07	nan	0	Claude	Ofrézcase a ayudar a un vecino con la planificación o preparación de comidas	nan
53	Volunteer at a local youth development program or after-school initiative	Contact a local youth center, after-school program, or community organization and offer to volunteer your time to help with activities, tutoring, or mentoring.	Organize a group of friends or neighbors to volunteer at a youth program for a full day.	2024-06-08	nan	0	Claude	Ofrézcase como voluntario en un programa local de desarrollo juvenil o en una iniciativa extracurricular	nan
54	Donate old gardening tools or supplies to a community garden	Gather any unused gardening tools, such as shovels, rakes, or pruners, and donate them to a local community garden.	Organize a gardening tool or supply drive in your neighborhood and deliver the collected items to multiple community gardens.	2024-06-09	nan	0	Claude	Done herramientas o suministros de jardinería viejos a un jardín comunitario	nan
55	Offer to help a neighbor with pet care or dog walking	If you know a neighbor who has a pet, offer to help with tasks like walking the dog, cleaning the litter box, or providing pet-sitting services.	Offer to help with pet care or dog walking for multiple neighbors who could use the assistance.	2024-06-10	nan	0	Claude	Ofrézcase a ayudar a un vecino con el cuidado de mascotas o paseando perros	nan
56	Volunteer at a local nature center, wildlife refuge, or conservation area	Contact a local nature center, wildlife refuge, or conservation organization and offer to volunteer your time to help with tasks like trail maintenance, environmental education, or animal care.	Organize a group of friends or neighbors to volunteer at a nature center or wildlife refuge for a full day of service.	2024-06-11	nan	0	Claude	Ofrézcase como voluntario en un centro de naturaleza local, un refugio de vida silvestre o un área de conservación	nan
57	Listen to someone	nan	Spend quality time listening to a family member or friend who needs to talk, without interrupting or offering advice unless asked	2024-06-12	nan	0	nan	Escuche a alguien	nan
\.


--
-- Data for Name: completions; Type: TABLE DATA; Schema: public; Owner: bktdbsudouser
--

COPY public.completions (id, description, date, user_id, challenge_id, completed_twist) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: bktdbsudouser
--

COPY public.users (id, email, username, password, bio) FROM stdin;
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
-- Name: challenges_prompt_key; Type: INDEX; Schema: public; Owner: bktdbsudouser
--

CREATE UNIQUE INDEX challenges_prompt_key ON public.challenges USING btree (prompt);


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

