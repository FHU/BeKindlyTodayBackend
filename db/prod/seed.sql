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
    username text,
    bio text,
    kinde_id text NOT NULL,
    profile_picture text
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
2b874783-767b-445a-b649-4235ca0d30e9	3d0965bc4bf33156535e47ee4c4a41597d146a14b3e9eb3c302b2280863ad806	2024-04-23 02:16:30.011502+00	20240323012108_test	\N	\N	2024-04-23 02:16:29.933364+00	1
0cdcca29-f6d3-4cad-97dd-4569f1d93c96	e3e31429dea8e107b7cc0a00fbbdc10823bca6b0a000236c467a0667f58cfffd	2024-04-23 02:16:30.283242+00	20240422195755_user_schema_updates	\N	\N	2024-04-23 02:16:30.269541+00	1
39201033-8a04-4f58-9cd8-609fffeeb284	89c534372340892b20a1060fa45d2ffcea26de0363e51a99d223b01043355c25	2024-04-23 02:16:30.030949+00	20240405145248_add_frontend_reqs	\N	\N	2024-04-23 02:16:30.012906+00	1
78798ca2-8525-4142-a663-8d45996cf8c8	9af4530c13a31b0ba43501a8ce0dd424d2512c9cdbe4896e46d09370652c9c0d	2024-04-23 02:16:30.101039+00	20240405193931_simplify_schema	\N	\N	2024-04-23 02:16:30.032679+00	1
45779820-fa7d-4542-a3c6-a4b554635a07	1deb7e1cffd882e1b868a5898e06b784c4213f101ae52f5962f2bba3df18f6f6	2024-04-23 02:16:30.10713+00	20240407021219_add_prompt_field	\N	\N	2024-04-23 02:16:30.102471+00	1
17fb1894-e8cc-48a6-94ea-fadc5aaadec1	1f6ebf19afa0787d74346b1d39898b45c485eda5f49ee98088638f349368604e	2024-04-23 02:16:30.291865+00	20240422231143_major_user_changes	\N	\N	2024-04-23 02:16:30.285274+00	1
7c7ae81b-5a4a-46b5-af63-1e410d7fdd01	236aa2fa39007e721889991c99a7f6f86cc095e4517c8483060a9b8f217eb34b	2024-04-23 02:16:30.112896+00	20240410182129_add_image_to_challenge	\N	\N	2024-04-23 02:16:30.108553+00	1
c0e115be-f04e-4a28-8f3f-8c42487ab0ae	be4f5e033118c01ec5ac87e78e07ecf2318ad27016a133780ab9477e3f55d351	2024-04-23 02:16:30.158785+00	20240412182541_change	\N	\N	2024-04-23 02:16:30.114275+00	1
3d65f6ad-ec7e-4685-98f6-d9094c2ec3fb	ca0a334250251709f091f9b8f3a84e974ade534461ca5455571d4bdd95a53791	2024-04-23 02:16:30.165556+00	20240414013226_change	\N	\N	2024-04-23 02:16:30.16032+00	1
79238189-92e0-4891-8ee2-6588a7f4ca7e	1570d617c610f0ee252495620a567625e51a11cc6d52343071fda87f028f27b3	2024-04-23 02:16:30.302895+00	20240423021609_add_index_to_completion	\N	\N	2024-04-23 02:16:30.293354+00	1
00cd8efa-b155-4459-b380-23d905f902d2	48bea31d29cc7421ed726dd2ed134583e66b27200cb582c5d4891214992a6ae7	2024-04-23 02:16:30.171637+00	20240414022443_fix_challenge_change_issues	\N	\N	2024-04-23 02:16:30.166963+00	1
e1c36800-d3b6-46c7-a1c8-643d27212d68	ec882d803bc38d05f8e1ba8daee82d6ec57dbd57d422f963b02d10ae3018dacd	2024-04-23 02:16:30.215591+00	20240415185228_add_correct_mapping	\N	\N	2024-04-23 02:16:30.173174+00	1
757c4f8e-e45a-47fb-8ff4-fe7cac9eaad9	f5bdc4c5639bbbca5aed4de1b7fa45ce0b042c307938c3b3bb1133098d1c72e6	2024-04-23 02:16:30.22118+00	20240416032629_added_spanish_challenges	\N	\N	2024-04-23 02:16:30.21705+00	1
d9db2c4a-ef72-4044-bc2c-e0ee3162af54	6e56f5de2ac292c2aa9fb69c8523ccd735a0d6ae1a2014a008304d8d052e88e9	2024-04-23 02:16:30.22916+00	20240416033211_add_unique_to_prompt	\N	\N	2024-04-23 02:16:30.222604+00	1
65de828c-1809-4bf3-a844-232ec1a69033	bbe55ce1b4e371256b7278b03678a93ad1ce86caebef62c8272cbba72d589d47	2024-04-23 02:16:30.248154+00	20240416135724_change_date_time_type	\N	\N	2024-04-23 02:16:30.230625+00	1
dbb65e8d-d365-4b56-9a1f-2d740fcfa33d	a8fbbe883517d62036144233aab8a11a5042fc4e4a32d36914746ceb94f3ef5e	2024-04-23 02:16:30.267659+00	20240417153835_add_bio_and_completion_twist	\N	\N	2024-04-23 02:16:30.250484+00	1
\.


--
-- Data for Name: challenges; Type: TABLE DATA; Schema: public; Owner: bktdbsudouser
--

COPY public.challenges (id, prompt, suggestion, twist, date, source, rating, image, spanish_prompt, spanish_twist) FROM stdin;
1	Smile at a stranger	Offer a warm, genuine smile to someone you pass on the street or encounter in a public setting.	Smile at 5 strangers in a row and see if you can make them smile back.	2024-04-23	Claude	0	nan	Sonría a un extraño	Sonríe a 5 extraños seguidos y observa si puedes hacer que ellos también sonrían.
2	Hold the door for someone	As youre entering or exiting a building, take a moment to hold the door open for the person behind you.	Politely hold the door for 3 people in a row and wish them a nice day.	2024-04-24	Claude	0	nan	Mantenga la puerta a alguien	Sostén la puerta cortésmente para 3 personas seguidas y deséales un buen día.
3	Give a compliment	Find something genuine and positive to say about someones appearance, accomplishment, or personality.	Give 3 sincere compliments to people you interact with throughout your day.	2024-04-25	Claude	0	nan	Dé un cumplido a alguien	Da 3 cumplidos sinceros a las personas con las que interactúes durante el día.
4	Pick up litter	While out in your neighborhood or a public space, take a moment to pick up any litter you see and properly dispose of it.	Organize a group of friends or neighbors to do a community litter cleanup.	2024-04-26	Claude	0	nan	Recoja la basura cerca de la carretera	Organiza un grupo de amigos o vecinos para limpiar la basura comunitaria.
5	Leave a positive note	Write an encouraging note and leave it in a public place for someone to find, such as on a car windshield or in a library book.	Leave 5 positive notes in different locations around your community.	2024-04-27	Claude	0	nan	Deje una nota amable	Deja 5 notas positivas en diferentes lugares de tu comunidad.
6	Write a thank-you note	Take the time to handwrite a note of gratitude to someone who has made a positive impact on your life.	Write thank-you notes to 3 people who have helped or inspired you recently.	2024-04-28	Claude	0	nan	Escriba una nota de agradecimiento	Escribe notas de agradecimiento a 3 personas que te hayan ayudado o inspirado recientemente.
7	Donate books	Gather books youve already read and donate them to a local library, school, or Little Free Library.	Donate 10 or more books to a local organization that provides books to underserved communities.	2024-04-29	Claude	0	nan	Done libros	Dona 10 o más libros a una organización local que provea libros a comunidades desfavorecidas.
8	Bake treats for first responders	Prepare a batch of homemade cookies, cakes, or other baked goods and deliver them to your local fire or police station.	Bake extra treats and deliver them to multiple first responder stations in your area.	2024-04-30	Claude	0	nan	Hornee productos horneados para socorristas	Hornea dulces extras y entrégalos en múltiples estaciones de primeros auxilios de tu área.
9	Offer to run errands	If you know a neighbor, friend, or family member who is homebound or busy, offer to pick up groceries, prescriptions, or run other errands for them.	Offer to do a weeks worth of errands for a neighbor or family member who is in need of assistance.	2024-05-01	Claude	0	nan	Ofrézcase a hacer mandados	Ofrece hacer los mandados de una semana para un vecino o miembro de la familia que necesite ayuda.
10	Volunteer at a food bank	Contact your local food bank or pantry and volunteer your time to help sort, package, or distribute food to those in need.	Organize a group of friends or coworkers to volunteer at a food bank for a full day.	2024-05-02	Claude	0	nan	Ofrézcase como voluntario en un banco de alimentos	Organiza un grupo de amigos o compañeros de trabajo para ser voluntarios en un banco de alimentos durante un día completo.
11	Write cards for seniors	Create handwritten cards or notes and deliver them to a local nursing home or senior center to brighten someones day.	Write personalized cards for all the residents of a nursing home or assisted living facility.	2024-05-03	Claude	0	nan	Escriba cartas para personas mayores	Escribe tarjetas personalizadas para todos los residentes de un hogar de ancianos o residencia asistida.
12	Offer to mow a lawn	If you notice a neighbors lawn needs mowing, offer to do it for them, especially if they are elderly or have limited mobility.	Mow the lawns of 3 neighbors who could use the help.	2024-05-04	Claude	0	nan	Ofrézcase a cortar el césped	Corta el césped de 3 vecinos que necesiten ayuda.
13	Donate unused toiletries	Gather any unused travel-sized toiletries, such as soap, shampoo, or toothpaste, and donate them to a local homeless shelter.	Organize a toiletry drive in your community and deliver the collected items to multiple shelters.	2024-05-05	Claude	0	nan	Done artículos de tocador no utilizados	Organiza una colecta de artículos de tocador en tu comunidad y entrega los artículos recolectados a múltiples refugios.
14	Volunteer at an animal shelter	Contact your local animal shelter and offer to volunteer your time to help care for the animals, such as walking dogs or socializing cats.	Volunteer at an animal shelter for a full day and help with as many tasks as possible.	2024-05-06	Claude	0	nan	Ofrézcase como voluntario en un refugio de animales	Sé voluntario en un refugio de animales durante un día completo y ayuda con tantas tareas como sea posible.
15	Volunteer at a community garden	Contact your local community garden and offer to volunteer your time to help with planting, weeding, or harvesting.	Volunteer at a community garden for a full day and help with various tasks.	2024-05-07	Claude	0	nan	Ofrézcase como voluntario en un jardín comunitario	Sé voluntario en un jardín comunitario durante un día completo y ayuda con varias tareas.
16	Volunteer at a soup kitchen	Contact your local soup kitchen or food pantry and offer to volunteer your time to help prepare or serve meals to those in need.	Organize a group of friends or coworkers to volunteer at a soup kitchen for a full day.	2024-05-08	Claude	0	nan	Ofrézcase como voluntario en un comedor de beneficencia	Organiza un grupo de amigos o compañeros de trabajo para ser voluntarios en un comedor comunitario durante un día completo.
17	Volunteer at a local park	Contact your local parks department and offer to volunteer your time to help with park maintenance, such as litter cleanup or trail maintenance.	Organize a group of friends or neighbors to volunteer at a local park for a full day of service.	2024-05-09	Claude	0	nan	Ofrézcase como voluntario en un parque local	Organiza un grupo de amigos o vecinos para ser voluntarios en un parque local durante un día completo de servicio.
18	Offer to run errands for a busy parent	If you know a parent who is juggling a lot of responsibilities, offer to run errands for them, such as picking up groceries or taking their children to activities.	Offer to run a weeks worth of errands for a busy parent in your community.	2024-05-10	Claude	0	nan	Ofrézcase a hacer mandados para un padre ocupado	Ofrece hacer los mandados de una semana para un padre ocupado en tu comunidad.
19	Volunteer at a community center	Contact your local community center and offer to volunteer your time to help with various activities or programs.	Organize a group of friends or neighbors to volunteer at a community center for a full day.	2024-05-11	Claude	0	nan	Ofrézcase como voluntario en un centro comunitario	Organiza un grupo de amigos o vecinos para ser voluntarios en un centro comunitario durante un día completo.
20	Donate old clothes to a charity	Go through your closet and gather any gently used clothes you no longer need, and donate them to a local charity or clothing drive.	Organize a clothing drive in your neighborhood and deliver the collected items to multiple charitable organizations.	2024-05-12	Claude	0	nan	Done ropa vieja a una organización benéfica	Organiza una colecta de ropa en tu vecindario y entrega los artículos recolectados a múltiples organizaciones benéficas.
21	Offer to walk a neighbors dog	If you know a neighbor who has a dog, offer to take their furry friend for a walk, especially if the neighbor is busy or unable to do it themselves.	Offer to walk the dogs of multiple neighbors who could use the help.	2024-05-13	Claude	0	nan	Ofrézcase a pasear al perro de un vecino	Ofrece sacar a pasear a los perros de varios vecinos que necesiten ayuda.
22	Offer to help a neighbor with yard work	If you notice a neighbors yard needs attention, offer to help with tasks like mowing, weeding, or gardening.	Offer to help with yard work for multiple neighbors who could use the assistance.	2024-05-14	Claude	0	nan	Ofrézcase a ayudar a un vecino con el trabajo del césped	Ofrece ayuda con el trabajo de jardinería para varios vecinos que necesiten asistencia.
23	Volunteer at a local community center	Contact your local community center and offer to volunteer your time to help with various activities or programs.	Organize a group of friends or neighbors to volunteer at a community center for a full day.	2024-05-15	Claude	0	nan	Ofrézcase como voluntario en un centro comunitario local	Organiza un grupo de amigos o vecinos para ser voluntarios en un centro comunitario durante un día completo.
24	Offer to help a neighbor with grocery shopping	If you know a neighbor who has difficulty getting to the grocery store, offer to do their shopping for them.	Offer to do the grocery shopping for multiple neighbors who could use the help.	2024-05-16	Claude	0	nan	Ofrézcase a ayudar a un vecino con las compras de comestibles	Ofrece hacer la compra de comestibles para varios vecinos que necesiten ayuda.
25	Offer to help a neighbor with household tasks	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or light housework.	Offer to help with household tasks for multiple neighbors who could use the assistance.	2024-05-17	Claude	0	nan	Ofrézcase a ayudar a un vecino con las tareas domésticas	Ofrece ayuda con las tareas del hogar para varios vecinos que necesiten asistencia.
26	Donate old toys to a childrens shelter	Gather any gently used toys your children no longer play with and donate them to a local childrens shelter.	Organize a toy drive in your neighborhood and donate the collected items to multiple childrens shelters.	2024-05-18	Claude	0	nan	Done juguetes viejos a un refugio para niños	Organiza una colecta de juguetes en tu vecindario y dona los artículos recolectados a múltiples refugios para niños.
27	Offer to wash a neighbors car	If you notice a neighbors car is looking dirty, offer to wash it for them, especially if they are elderly or dont have the ability to do it themselves.	Offer to wash the cars of multiple neighbors who could use the help.	2024-05-19	Claude	0	nan	Ofrézcase a lavar el auto de un vecino	Ofrece lavar los coches de varios vecinos que necesiten ayuda.
28	Volunteer at a local library	Contact your local library and offer to volunteer your time to assist with tasks like shelving books, organizing, or assisting patrons.	Organize a group of friends or neighbors to volunteer at a local library for a full day.	2024-05-20	Claude	0	nan	Ofrézcase como voluntario en una biblioteca local	Organiza un grupo de amigos o vecinos para ser voluntarios en una biblioteca local durante un día completo.
29	Donate old furniture to a charity	Go through your home and identify any gently used furniture you no longer need, and donate it to a local charity or thrift store.	Organize a furniture drive in your neighborhood and donate the collected items to multiple charitable organizations.	2024-05-21	Claude	0	nan	Done muebles viejos a una organización benéfica	Organiza una colecta de muebles en tu vecindario y dona los artículos recolectados a múltiples organizaciones benéficas.
30	Volunteer at a local retirement home	Contact a local retirement home or assisted living facility and offer to volunteer your time to visit with and engage the residents.	Organize a group of friends or family members to volunteer at a retirement home for a full day of activities and companionship.	2024-05-22	Claude	0	nan	Ofrézcase como voluntario en una residencia de ancianos local	Organiza un grupo de amigos o familiares para ser voluntarios en un hogar de retiro durante un día completo de actividades y compañerismo.
31	Donate old kitchen items to a shelter	Gather any gently used kitchen items, such as pots, pans, or utensils, and donate them to a local homeless shelter or transitional housing program.	Organize a kitchen item drive in your neighborhood and deliver the collected items to multiple shelters.	2024-05-23	Claude	0	nan	Done artículos de cocina viejos a un refugio	Organiza una colecta de artículos de cocina en tu vecindario y entrega los artículos recolectados a múltiples refugios.
32	Volunteer at a local museum	Contact your local museum and offer to volunteer your time to help with tasks like greeting visitors, assisting with exhibits, or leading tours.	Organize a group of friends or family members to volunteer at a local museum for a full day.	2024-05-24	Claude	0	nan	Ofrézcase como voluntario en un museo local	Organiza un grupo de amigos o familiares para ser voluntarios en un museo local durante un día completo.
33	Donate old craft supplies	Gather any unused craft supplies, such as art materials, fabrics, or sewing supplies, and donate them to a local school or community art center.	Organize a craft supply drive in your neighborhood and deliver the collected items to multiple schools or community organizations.	2024-05-25	Claude	0	nan	Done materiales de manualidades viejos	Organiza una colecta de suministros de manualidades en tu vecindario y entrega los artículos recolectados a múltiples escuelas u organizaciones comunitarias.
34	Offer to help a neighbor with meal preparation	If you know a neighbor who is elderly, disabled, or simply overwhelmed with meal prep, offer to cook them a healthy meal or assist with meal planning and preparation.	Offer to help with meal preparation for multiple neighbors who could use the assistance.	2024-05-26	Claude	0	nan	Ofrézcase a ayudar a un vecino con la preparación de la comida	Ofrece ayuda con la preparación de comidas para varios vecinos que necesiten asistencia.
35	Donate old art supplies to a community center	Gather any unused art supplies, such as paints, brushes, or canvases, and donate them to a local community center or art program.	Organize an art supply drive in your neighborhood and deliver the collected items to multiple community centers or schools.	2024-05-27	Claude	0	nan	Done materiales de arte antiguos a un centro comunitario	Organiza una colecta de suministros de arte en tu vecindario y entrega los artículos recolectados a múltiples centros comunitarios o escuelas.
70	Donate artwork	nan	Organize a group to paint or draw pictures and take the art you create to a senior center	2024-07-01	nan	0	nan	Donar obras de arte.	Organizar un grupo para pintar o dibujar imágenes y llevar el arte que creas a un centro de personas mayores.
36	Offer to help a neighbor with computer tasks	If you know a neighbor who is not tech-savvy, offer to assist them with tasks like setting up a new device, troubleshooting an issue, or teaching them how to use a computer program.	Offer to help with computer tasks for multiple neighbors who could use the assistance.	2024-05-28	Claude	0	nan	Ofrézcase a ayudar a un vecino con las tareas de la computadora	Ofrece ayuda con tareas de computación para varios vecinos que necesiten asistencia.
37	Donate old gardening tools to a community garden	Gather any unused gardening tools, such as shovels, rakes, or pruners, and donate them to a local community garden.	Organize a gardening tool drive in your neighborhood and deliver the collected items to multiple community gardens.	2024-05-29	Claude	0	nan	Done herramientas de jardinería viejas a un jardín comunitario	Organiza una colecta de herramientas de jardinería en tu vecindario y entrega los artículos recolectados a múltiples jardines comunitarios.
38	Offer to help a neighbor with pet care	If you know a neighbor who has a pet, offer to help with tasks like walking the dog, cleaning the litter box, or providing pet-sitting services.	Offer to help with pet care for multiple neighbors who could use the assistance.	2024-05-30	Claude	0	nan	Ofrézcase a ayudar a un vecino con el cuidado de mascotas	Ofrece ayuda con el cuidado de mascotas para varios vecinos que necesiten asistencia.
39	Donate old sports equipment to a youth league	Gather any gently used sports equipment, such as balls, cleats, or protective gear, and donate them to a local youth sports league or recreation center.	Organize a sports equipment drive in your neighborhood and deliver the collected items to multiple youth leagues or recreation centers.	2024-05-31	Claude	0	nan	Done material deportivo viejo a una liga juvenil	Organiza una colecta de equipos deportivos en tu vecindario y entrega los artículos recolectados a múltiples ligas juveniles o centros recreativos.
40	Offer to help a neighbor with home repairs	If you notice a neighbors home needs minor repairs, such as fixing a leaky faucet or patching a hole in the wall, offer to lend a hand.	Offer to help with home repairs for multiple neighbors who could use the assistance.	2024-06-01	Claude	0	nan	Ofrézcase a ayudar a un vecino con las reparaciones de la casa	Ofrece ayuda con reparaciones del hogar para varios vecinos que necesiten asistencia.
41	Donate old games and puzzles to a childrens hospital	Gather any gently used board games, puzzles, or other childrens activities and donate them to a local childrens hospital or pediatric ward.	Organize a game and puzzle drive in your neighborhood and deliver the collected items to multiple childrens hospitals or medical centers.	2024-06-02	Claude	0	nan	Done juegos y rompecabezas antiguos a un hospital infantil	Organiza una colecta de juegos y rompecabezas en tu vecindario y entrega los artículos recolectados a múltiples hospitales o centros médicos infantiles.
42	Donate old towels and blankets to an animal shelter	Gather any clean, old towels and blankets you no longer need and donate them to your local animal shelter or rescue organization.	Organize a towel and blanket drive in your neighborhood and deliver the collected items to multiple animal shelters.	2024-06-03	Claude	0	nan	Done toallas y mantas viejas a un refugio de animales	Organiza una colecta de toallas y mantas en tu vecindario y entrega los artículos recolectados a múltiples refugios de animales.
43	Offer to help a neighbor with household chores	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or light housework.	Offer to help with household chores for multiple neighbors who could use the assistance.	2024-06-04	Claude	0	nan	Ofrézcase a ayudar a un vecino con las tareas domésticas	Ofrece ayuda con las tareas del hogar para varios vecinos que necesiten asistencia.
44	Volunteer at a local historic site or museum	Contact a local historic site or museum and offer to volunteer your time to help with tasks like gardening, maintenance, or giving tours.	Organize a group of friends or neighbors to volunteer at a historic site or museum for a full day of service.	2024-06-05	Claude	0	nan	Ofrézcase como voluntario en un sitio histórico o museo local	Organiza un grupo de amigos o vecinos para ser voluntarios en un sitio histórico o museo durante un día completo de servicio.
45	Donate old school supplies to a local charity or organization	Gather any unused school supplies, such as notebooks, pencils, or backpacks, and donate them to a local charity or organization that supports students in need.	Organize a school supply drive in your neighborhood and deliver the collected items to multiple charities or schools.	2024-06-06	Claude	0	nan	Done útiles escolares viejos a una organización benéfica u organización local	Organiza una colecta de útiles escolares en tu vecindario y entrega los artículos recolectados a múltiples organizaciones benéficas o escuelas.
46	Donate old books to a local prison or jail library	Gather any books you no longer need and donate them to a local prison or jail library, where they can be enjoyed by incarcerated individuals.	Organize a book drive in your neighborhood and donate the collected books to multiple prison or jail libraries.	2024-06-07	Claude	0	nan	Done libros antiguos a una prisión local o a la biblioteca de la cárcel	Organiza una colecta de libros en tu vecindario y dona los libros recolectados a múltiples bibliotecas de prisiones o cárceles.
47	Offer to help a neighbor with grocery shopping or errands	If you know a neighbor who has difficulty getting to the grocery store or running errands, offer to do their shopping or errands for them.	Offer to help with grocery shopping or errands for multiple neighbors who could use the assistance.	2024-06-08	Claude	0	nan	Ofrézcase a ayudar a un vecino con las compras de comestibles o los mandados	Ofrece ayuda con las compras de comestibles o mandados para varios vecinos que necesiten asistencia.
48	Donate old bedding and linens to a homeless shelter	Gather any clean, gently used bedding, sheets, or towels and donate them to your local homeless shelter.	Organize a bedding and linen drive in your neighborhood and deliver the collected items to multiple homeless shelters.	2024-06-09	Claude	0	nan	Done ropa de cama y sábanas viejas a un refugio para indigentes	Organiza una colecta de ropa de cama en tu vecindario y entrega los artículos recolectados a múltiples refugios para personas sin hogar.
49	Offer to help a neighbor with household chores or errands	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or running errands.	Offer to help with household chores or errands for multiple neighbors who could use the assistance.	2024-06-10	Claude	0	nan	Ofrézcase a ayudar a un vecino con las tareas domésticas o los mandados	Ofrece ayuda con las tareas del hogar o mandados para varios vecinos que necesiten asistencia.
68	Call or text a family member/friend and tell them you appreciate them	nan	Call someone you havent spoken to in a while and let them know you are thinking of them	2024-06-29	nan	0	nan	Llamar o enviar un mensaje de texto a un familiar/amigo y decirles que los aprecias.	Llamar a alguien con quien no has hablado en un tiempo y hacerles saber que estás pensando en ellos.
50	Volunteer at a local library or literacy program	Contact your local library or literacy organization and offer to volunteer your time to assist with tasks like tutoring, shelving books, or leading reading groups.	Organize a group of friends or neighbors to volunteer at a library or literacy program for a full day.	2024-06-11	Claude	0	nan	Ofrézcase como voluntario en una biblioteca local o en un programa de alfabetización	Organiza un grupo de amigos o vecinos para ser voluntarios en una biblioteca o programa de alfabetización durante un día completo.
51	Offer to help a neighbor with household chores or organization	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or decluttering.	Offer to help with household chores or organization for multiple neighbors who could use the assistance.	2024-06-12	Claude	0	nan	Ofrézcase a ayudar a un vecino con las tareas domésticas o con la organización	Ofrece ayuda con las tareas del hogar o la organización para varios vecinos que necesiten asistencia.
52	Offer to help a neighbor with meal planning or preparation	If you know a neighbor who is elderly, disabled, or simply overwhelmed with meal prep, offer to cook them a healthy meal or assist with meal planning and preparation.	Offer to help with meal planning or preparation for multiple neighbors who could use the assistance.	2024-06-13	Claude	0	nan	Ofrézcase a ayudar a un vecino con la planificación o preparación de comidas	Ofrece ayuda con la planificación o preparación de comidas para varios vecinos que necesiten asistencia.
53	Volunteer at a local youth development program or after-school initiative	Contact a local youth center, after-school program, or community organization and offer to volunteer your time to help with activities, tutoring, or mentoring.	Organize a group of friends or neighbors to volunteer at a youth program for a full day.	2024-06-14	Claude	0	nan	Ofrézcase como voluntario en un programa local de desarrollo juvenil o en una iniciativa extracurricular	Organiza un grupo de amigos o vecinos para ser voluntarios en un programa juvenil durante un día completo.
54	Donate old gardening tools or supplies to a community garden	Gather any unused gardening tools, such as shovels, rakes, or pruners, and donate them to a local community garden.	Organize a gardening tool or supply drive in your neighborhood and deliver the collected items to multiple community gardens.	2024-06-15	Claude	0	nan	Done herramientas o suministros de jardinería viejos a un jardín comunitario	Organiza una colecta de herramientas o suministros de jardinería en tu vecindario y entrega los artículos recolectados a múltiples jardines comunitarios.
55	Offer to help a neighbor with pet care or dog walking	If you know a neighbor who has a pet, offer to help with tasks like walking the dog, cleaning the litter box, or providing pet-sitting services.	Offer to help with pet care or dog walking for multiple neighbors who could use the assistance.	2024-06-16	Claude	0	nan	Ofrézcase a ayudar a un vecino con el cuidado de mascotas o paseando perros	Ofrece ayuda con el cuidado de mascotas o paseo de perros para varios vecinos que necesiten asistencia.
56	Volunteer at a local nature center, wildlife refuge, or conservation area	Contact a local nature center, wildlife refuge, or conservation organization and offer to volunteer your time to help with tasks like trail maintenance, environmental education, or animal care.	Organize a group of friends or neighbors to volunteer at a nature center or wildlife refuge for a full day of service.	2024-06-17	Claude	0	nan	Ofrézcase como voluntario en un centro de naturaleza local, un refugio de vida silvestre o un área de conservación	Organiza un grupo de amigos o vecinos para ser voluntarios en un centro de naturaleza o refugio de vida silvestre durante un día completo de servicio.
57	Listen to someone	Spend quality time listening to a family member or friend who needs to talk, without interrupting or offering advice unless asked	Schedule one-on-one time to listen to someone who might be feeling overwhelmed right now	2024-06-18	ChatGPT	0	nan	Escuche a alguien	Agenda tiempo uno a uno para escuchar a alguien que pueda sentirse abrumado en este momento.
58	Offer to tutor a struggling student	nan	Help a group of students do homework in a subject youre good at	2024-06-19	ChatGPT	0	nan	Ofrecer tutoría a un estudiante que está teniendo dificultades.	Ayudar a un grupo de estudiantes con las tareas en una materia en la que eres bueno.
59	Compliment a stranger	nan	Give genuine compliments every time you notice something you like about someones outift, etc.	2024-06-20	ChatGPT	0	nan	Halagar a un desconocido.	Dar cumplidos genuinos cada vez que notes algo que te gusta sobre el atuendo de alguien, etc.
60	Volunteer to read to children at a library or daycare	nan	Read 2 of your favorite childhood books to a group of children	2024-06-21	ChatGPT	0	nan	Ofrecerse como voluntario para leer a niños en una biblioteca o guardería.	Leer 2 de tus libros favoritos de la infancia a un grupo de niños.
61	Write a positive review for a small business you appreciate	nan	Tell the owner or an employee of the business how much you appreciate them in person	2024-06-22	ChatGPT	0	nan	Escribir una reseña positiva para un pequeño negocio que aprecias.	Decirle al dueño o a un empleado del negocio cuánto los aprecias en persona.
62	Leave quarters at a laundromat for someone to use.	nan	Leave enough quarters for someone to fully wash and dry a load of laundry at a laundromat	2024-06-23	ChatGPT	0	nan	Dejar monedas de veinticinco centavos en una lavandería para que alguien las use.	Dejar suficientes monedas de veinticinco centavos para que alguien pueda lavar y secar completamente una carga de ropa en una lavandería.
63	Donate canned goods	nan	Buy some new canned goods from the store and take them to a local food bank	2024-06-24	ChatGPT	0	nan	Donar alimentos enlatados.	Comprar alimentos enlatados nuevos en la tienda y llevarlos a un banco de alimentos local.
64	Write positive messages with chalk on the sidewalk in your neighborhood.	nan	Draw pictures or write encouraging messages on a regularly-used sidewalk	2024-06-25	ChatGPT	0	nan	Escribir mensajes positivos con tiza en la acera de tu vecindario.	Dibujar imágenes o escribir mensajes alentadores en una acera de uso regular.
65	Leave a kind note for your mail carrier.	nan	Leave a note expressing gratitude and some water/snacks for your mail carrier	2024-06-26	ChatGPT	0	nan	Dejar una nota amable para tu cartero o cartera.	Dejar una nota expresando gratitud y algunos refrigerios o agua para tu cartero.
66	Leave a generous tip for your barista or server.	nan	Visit a local restaurant or coffee shop and leave a tip thats more than 20%	2024-06-27	nan	0	nan	Dejar una propina generosa para tu camarero o camarera.	Visitar un restaurante o cafetería local y dejar una propina que sea más del 20%.
67	Leave some money in a vending machine	nan	Leave enough money to buy a drink in/on a vending machine	2024-06-28	nan	0	nan	Dejar algo de dinero en una máquina expendedora.	Dejar suficiente dinero para comprar una bebida en una máquina expendedora.
69	Offer free hugs	nan	Ask your friends, coworkers, or classmates how they are doing and offer a hug	2024-06-30	nan	0	nan	Ofrecer abrazos gratis.	Preguntar a tus amigos, compañeros de trabajo o compañeros de clase cómo están y ofrecer un abrazo.
71	Donate old bags to a homeless shelter	nan	Find any bags you have not used in the last year and donate them to a local homeless shelter	2024-07-02	nan	0	nan	Donar bolsos usados a un refugio para personas sin hogar.	Buscar cualquier bolso que no hayas usado en el último año y donarlos a un refugio para personas sin hogar.
72	Donate warm clothing accessories	nan	Collect old winter hats and scarves and donate them to a homeless shelter 	2024-07-03	nan	0	nan	Donar accesorios de ropa abrigada.	Recolectar gorros y bufandas viejos y donarlos a un refugio para personas sin hogar.
73	Donate shoes	nan	Collect shoes you do not need and donate them to a homeless shelter	2024-07-04	nan	0	nan	Donar zapatos.	Recolectar zapatos que no necesites y donarlos a un refugio para personas sin hogar.
74	Donate first aid supplies	nan	Put together some basic first aid kits and take them to a homeless shelter	2024-07-05	nan	0	nan	Donar suministros de primeros auxilios.	Armar kits de primeros auxilios básicos y llevarlos a un refugio para personas sin hogar.
75	Volunteer at a local hospital	nan	Volunteer at a hospital and greet everyone you see with a smile	2024-07-06	nan	0	nan	Voluntariarse en un hospital local.	Voluntariarse en un hospital y saludar a todos los que veas con una sonrisa.
76	Assist a disaster relief organization	nan	Write encouraging cards that can be distributed to victims of natural disasters	2024-07-07	nan	0	nan	Ayudar a una organización de ayuda en caso de desastre.	Escribir tarjetas de aliento que puedan distribuirse a las víctimas de desastres naturales.
\.


--
-- Data for Name: completions; Type: TABLE DATA; Schema: public; Owner: bktdbsudouser
--

COPY public.completions (id, description, date, user_id, challenge_id, completed_twist) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: bktdbsudouser
--

COPY public.users (id, username, bio, kinde_id, profile_picture) FROM stdin;
\.


--
-- Name: challenges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bktdbsudouser
--

SELECT pg_catalog.setval('public.challenges_id_seq', 76, true);


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
-- Name: user_id_challenge_id; Type: INDEX; Schema: public; Owner: bktdbsudouser
--

CREATE INDEX user_id_challenge_id ON public.completions USING btree (user_id, challenge_id);


--
-- Name: users_id_key; Type: INDEX; Schema: public; Owner: bktdbsudouser
--

CREATE UNIQUE INDEX users_id_key ON public.users USING btree (id);


--
-- Name: users_kinde_id_idx; Type: INDEX; Schema: public; Owner: bktdbsudouser
--

CREATE INDEX users_kinde_id_idx ON public.users USING btree (kinde_id);


--
-- Name: users_kinde_id_key; Type: INDEX; Schema: public; Owner: bktdbsudouser
--

CREATE UNIQUE INDEX users_kinde_id_key ON public.users USING btree (kinde_id);


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

