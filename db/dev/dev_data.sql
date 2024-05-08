--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Debian 14.11-1.pgdg120+2)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-1.pgdg22.04+1)

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
    date date NOT NULL,
    source text NOT NULL,
    rating integer NOT NULL,
    image text NOT NULL,
    spanish_prompt text,
    spanish_twist text
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


ALTER TABLE public.challenges_id_seq OWNER TO postgres;

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
    challenge_id integer NOT NULL,
    completed_twist boolean DEFAULT false NOT NULL
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


ALTER TABLE public.completions_id_seq OWNER TO postgres;

--
-- Name: completions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.completions_id_seq OWNED BY public.completions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text,
    bio text,
    kinde_id text NOT NULL,
    profile_picture text
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


ALTER TABLE public.users_id_seq OWNER TO postgres;

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
34c5c2a6-a7a5-441e-872e-538c436a1e27	3d0965bc4bf33156535e47ee4c4a41597d146a14b3e9eb3c302b2280863ad806	2024-05-01 16:58:20.337161+00	20240323012108_test	\N	\N	2024-05-01 16:58:20.290238+00	1
6aba0e55-e09e-40e5-9009-5ad491214112	e3e31429dea8e107b7cc0a00fbbdc10823bca6b0a000236c467a0667f58cfffd	2024-05-01 16:58:20.452046+00	20240422195755_user_schema_updates	\N	\N	2024-05-01 16:58:20.44889+00	1
4db313fe-86d0-4a7e-bd9f-84595a29ba26	89c534372340892b20a1060fa45d2ffcea26de0363e51a99d223b01043355c25	2024-05-01 16:58:20.347746+00	20240405145248_add_frontend_reqs	\N	\N	2024-05-01 16:58:20.33773+00	1
09a2abf2-bcc8-4faa-9c2a-9141904c6ade	9af4530c13a31b0ba43501a8ce0dd424d2512c9cdbe4896e46d09370652c9c0d	2024-05-01 16:58:20.374242+00	20240405193931_simplify_schema	\N	\N	2024-05-01 16:58:20.348314+00	1
6dccf27e-7862-4cdc-bc23-bb0e70acb596	1deb7e1cffd882e1b868a5898e06b784c4213f101ae52f5962f2bba3df18f6f6	2024-05-01 16:58:20.377252+00	20240407021219_add_prompt_field	\N	\N	2024-05-01 16:58:20.374919+00	1
f7b45c5d-8fde-4489-9567-83ddbb2278ab	1f6ebf19afa0787d74346b1d39898b45c485eda5f49ee98088638f349368604e	2024-05-01 16:58:20.454448+00	20240422231143_major_user_changes	\N	\N	2024-05-01 16:58:20.452574+00	1
71da0ef9-0d9c-416a-b897-a0d7d200ce14	236aa2fa39007e721889991c99a7f6f86cc095e4517c8483060a9b8f217eb34b	2024-05-01 16:58:20.380345+00	20240410182129_add_image_to_challenge	\N	\N	2024-05-01 16:58:20.378004+00	1
31d99f90-e415-424a-aaf4-8c32b4f391fa	be4f5e033118c01ec5ac87e78e07ecf2318ad27016a133780ab9477e3f55d351	2024-05-01 16:58:20.400992+00	20240412182541_change	\N	\N	2024-05-01 16:58:20.380944+00	1
dd0d9ff5-21fd-41b3-805f-9d70fe26c345	ca0a334250251709f091f9b8f3a84e974ade534461ca5455571d4bdd95a53791	2024-05-01 16:58:20.404015+00	20240414013226_change	\N	\N	2024-05-01 16:58:20.401644+00	1
483d9175-6a19-4921-b25b-26f404212239	1570d617c610f0ee252495620a567625e51a11cc6d52343071fda87f028f27b3	2024-05-01 16:58:20.457366+00	20240423021609_add_index_to_completion	\N	\N	2024-05-01 16:58:20.454955+00	1
05116e76-1c49-4458-9802-124892398d86	48bea31d29cc7421ed726dd2ed134583e66b27200cb582c5d4891214992a6ae7	2024-05-01 16:58:20.406434+00	20240414022443_fix_challenge_change_issues	\N	\N	2024-05-01 16:58:20.404618+00	1
6ba01558-374c-4e1f-948a-5bf24e30f778	ec882d803bc38d05f8e1ba8daee82d6ec57dbd57d422f963b02d10ae3018dacd	2024-05-01 16:58:20.431312+00	20240415185228_add_correct_mapping	\N	\N	2024-05-01 16:58:20.407169+00	1
def78512-f4cf-425b-a920-1bcca2578737	f5bdc4c5639bbbca5aed4de1b7fa45ce0b042c307938c3b3bb1133098d1c72e6	2024-05-01 16:58:20.433712+00	20240416032629_added_spanish_challenges	\N	\N	2024-05-01 16:58:20.431909+00	1
f1f49323-ad33-46d6-abaa-a9f8db8f80d5	3e79720b1c508f70014e7596b8ad8c19cb71dc000676d6557e007cc3bbbe1ecc	2024-05-01 16:58:20.460211+00	20240424180840_redo_challenge_conflicts	\N	\N	2024-05-01 16:58:20.457881+00	1
2052405f-8fe0-4db5-b2f7-5f54da80a2b9	6e56f5de2ac292c2aa9fb69c8523ccd735a0d6ae1a2014a008304d8d052e88e9	2024-05-01 16:58:20.437049+00	20240416033211_add_unique_to_prompt	\N	\N	2024-05-01 16:58:20.434234+00	1
4e599027-fd76-4c6e-891c-afd90d0f0fe4	bbe55ce1b4e371256b7278b03678a93ad1ce86caebef62c8272cbba72d589d47	2024-05-01 16:58:20.445877+00	20240416135724_change_date_time_type	\N	\N	2024-05-01 16:58:20.437623+00	1
c4e41600-cb1e-414a-b4b8-7b54815c669e	a8fbbe883517d62036144233aab8a11a5042fc4e4a32d36914746ceb94f3ef5e	2024-05-01 16:58:20.4484+00	20240417153835_add_bio_and_completion_twist	\N	\N	2024-05-01 16:58:20.446432+00	1
\.


--
-- Data for Name: challenges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.challenges (id, prompt, suggestion, twist, date, source, rating, image, spanish_prompt, spanish_twist) FROM stdin;
1	Smile at a stranger	Offer a warm, genuine smile to someone you pass on the street or encounter in a public setting.	Smile at 5 strangers in a row and see if you can make them smile back.	2024-05-01	Claude	0	old_people.jpg	Sonría a un extraño	Sonríe a 5 extraños seguidos y observa si puedes hacer que ellos también sonrían.
2	Smile at a stranger	Offer a warm, genuine smile to someone you pass on the street or encounter in a public setting.	Smile at strangers throughout the day and reflect on which interations stood out to you	2024-05-02	Claude	0	old_people.jpg	Sonría a un extraño	nan
3	Smile at a stranger	Offer a warm, genuine smile to someone you pass on the street or encounter in a public setting.	Connect with a stranger by smiling at someone in the same situation as you, such as waiting in a line.	2024-05-03	Claude	0	old_people.jpg	Sonría a un extraño	nan
4	Hold the door for someone	As youre entering or exiting a building, take a moment to hold the door open for the person behind you.	Politely hold the door for 3 people in a row and wish them a nice day.	2024-05-04	Claude	0	hands.jpg	Mantenga la puerta a alguien	Sostén la puerta cortésmente para 3 personas seguidas y deséales un buen día.
5	Hold the door for someone	As youre entering or exiting a building, take a moment to hold the door open for the person behind you.	Compliment everyone you hold the door for	2024-05-05	Claude	0	hands.jpg	Mantenga la puerta a alguien	Felicita a todas las personas a las que les sostienes la puerta 
6	Hold the door for someone	As youre entering or exiting a building, take a moment to hold the door open for the person behind you.	Count the highest number of people in a row you can hold the door for	2024-05-06	Claude	0	hands.jpg	Mantenga la puerta a alguien	Cuente el mayor número de personas seguidas por las que puede sostener la puerta
7	Give a compliment	Find something genuine and positive to say about someones appearance, accomplishment, or personality.	Give 3 sincere compliments to people you interact with throughout your day.	2024-05-07	Claude	0	serving_food.jpg	Dé un cumplido a alguien	Da 3 cumplidos sinceros a las personas con las que interactúes durante el día.
8	Give a compliment	Find something genuine and positive to say about someones appearance, accomplishment, or personality.	Compliment a friend on something you like about their personality	2024-05-08	Claude	0	serving_food.jpg	Dé un cumplido a alguien	Felicita a un amigo por algo que te guste de su personalidad
9	Give a compliment	Find something genuine and positive to say about someones appearance, accomplishment, or personality.	Compliment a strangers outfit	2024-05-09	Claude	0	serving_food.jpg	Dé un cumplido a alguien	Elogia el atuendo de un extraño
10	Pick up litter	While out in your neighborhood or a public space, take a moment to pick up any litter you see and properly dispose of it.	Organize a group of friends or neighbors to do a community litter cleanup.	2024-05-10	Claude	0	yard_work.jpg	Recoja la basura cerca de la carretera	Organiza un grupo de amigos o vecinos para limpiar la basura comunitaria.
11	Pick up litter	While out in your neighborhood or a public space, take a moment to pick up any litter you see and properly dispose of it.	Clean up litter in a park, sidewalk, or road you visit or use often	2024-05-11	Claude	0	yard_work.jpg	Recoja la basura cerca de la carretera	Limpie la basura en un parque, acera o carretera que visite o use con frecuencia
12	Pick up litter	While out in your neighborhood or a public space, take a moment to pick up any litter you see and properly dispose of it.	Visit a school in your community and clean up litter around the campus	2024-05-12	Claude	0	yard_work.jpg	Recoja la basura cerca de la carretera	Visite una escuela en su comunidad y limpie la basura alrededor del campus
13	Leave a positive note	Write an encouraging note and leave it in a public place for someone to find, such as on a car windshield or in a library book.	Leave 5 positive notes in different locations around your community.	2024-05-13	Claude	0	card.jpg	Deje una nota amable	Deja 5 notas positivas en diferentes lugares de tu comunidad.
14	Leave a positive note	Write an encouraging note and leave it in a public place for someone to find, such as on a car windshield or in a library book.	Leave a note for a friend or family member who could use a kind word	2024-05-14	Claude	0	card.jpg	Deje una nota amable	Deja una nota para un amigo o familiar al que le vendría bien una palabra amable
15	Leave a positive note	Write an encouraging note and leave it in a public place for someone to find, such as on a car windshield or in a library book.	Hide an encouraging note in a library book for someone to find	2024-05-15	Claude	0	card.jpg	Deje una nota amable	Esconde una nota alentadora en un libro de la biblioteca para que alguien la encuentre
16	Write a thank-you note	Take the time to handwrite a note of gratitude to someone who has made a positive impact on your life.	Write thank-you notes to 3 people who have helped or inspired you recently.	2024-05-16	Claude	0	card.jpg	Escriba una nota de agradecimiento	Escribe notas de agradecimiento a 3 personas que te hayan ayudado o inspirado recientemente.
17	Write a thank-you note	Take the time to handwrite a note of gratitude to someone who has made a positive impact on your life.	Write a thank-you note to someone you know whose work has gone unrecognized	2024-05-17	Claude	0	card.jpg	Escriba una nota de agradecimiento	Escribe una nota de agradecimiento a alguien que conozcas cuyo trabajo no haya sido reconocido
18	Write a thank-you note	Take the time to handwrite a note of gratitude to someone who has made a positive impact on your life.	Write a thank-you note to a teacher who was kind to you in a memorable way	2024-05-18	Claude	0	card.jpg	Escriba una nota de agradecimiento	Escribe una nota de agradecimiento a un maestro que fue amable contigo de una manera memorable
19	Donate books	Gather books youve already read and donate them to a local library, school, or Little Free Library.	Donate 10 or more books to a local organization that provides books to underserved communities.	2024-05-19	Claude	0	kid_gardening.jpg	Done libros	Dona 10 o más libros a una organización local que provea libros a comunidades desfavorecidas.
20	Donate books	Gather books youve already read and donate them to a local library, school, or Little Free Library.	Donate some books from your favorite genre to a local library	2024-05-20	Claude	0	kid_gardening.jpg	Done libros	Dona algunos libros de tu género favorito a una biblioteca local
21	Donate books	Gather books youve already read and donate them to a local library, school, or Little Free Library.	Donate interesting non-fiction books to a school	2024-05-21	Claude	0	kid_gardening.jpg	Done libros	Dona libros interesantes de no ficción a una escuela
22	Bake treats for first responders	Prepare a batch of homemade cookies, cakes, or other baked goods and deliver them to your local fire or police station.	Bake extra treats and deliver them to multiple first responder stations in your area.	2024-05-22	Claude	0	customer.jpg	Hornee productos horneados para socorristas	Hornea dulces extras y entrégalos en múltiples estaciones de primeros auxilios de tu área.
23	Bake treats for first responders	Prepare a batch of homemade cookies, cakes, or other baked goods and deliver them to your local fire or police station.	Make your favorite baked goods and take them to first responders	2024-05-23	Claude	0	customer.jpg	Hornee productos horneados para socorristas	Prepara tus productos horneados favoritos y llévalos a los socorristas
24	Bake treats for first responders	Prepare a batch of homemade cookies, cakes, or other baked goods and deliver them to your local fire or police station.	Make a family recipe and deliver the food and recipe to first responders	2024-05-24	Claude	0	customer.jpg	Hornee productos horneados para socorristas	Haga una receta familiar y entregue la comida y la receta a los socorristas
25	Offer to run errands	If you know a neighbor, friend, or family member who is homebound or busy, offer to pick up groceries, prescriptions, or run other errands for them.	Offer to do a weeks worth of errands for a neighbor or family member who is in need of assistance.	2024-05-25	Claude	0	cooking.jpg	Ofrézcase a hacer mandados	Ofrece hacer los mandados de una semana para un vecino o miembro de la familia que necesite ayuda.
26	Offer to run errands	If you know a neighbor, friend, or family member who is homebound or busy, offer to pick up groceries, prescriptions, or run other errands for them.	Offer to run errands for a senior in your community	2024-05-26	Claude	0	cooking.jpg	Ofrézcase a hacer mandados	Ofrécete a hacer mandados para una persona mayor de tu comunidad
27	Offer to run errands	If you know a neighbor, friend, or family member who is homebound or busy, offer to pick up groceries, prescriptions, or run other errands for them.	Offer to run errands for someone who is busy with work or school	2024-05-27	Claude	0	cooking.jpg	Ofrézcase a hacer mandados	Ofrécete a hacer mandados para alguien que esté ocupado con el trabajo o la escuela
28	Volunteer at a food bank	Contact your local food bank or pantry and volunteer your time to help sort, package, or distribute food to those in need.	Organize a group of friends or coworkers to volunteer at a food bank for a full day.	2024-05-28	Claude	0	serving_food.jpg	Ofrézcase como voluntario en un banco de alimentos	Organiza un grupo de amigos o compañeros de trabajo para ser voluntarios en un banco de alimentos durante un día completo.
29	Volunteer at a food bank	Contact your local food bank or pantry and volunteer your time to help sort, package, or distribute food to those in need.	Volunteer at a food bank and offer to do a job that most volunteers dont want to do	2024-05-29	Claude	0	serving_food.jpg	Ofrézcase como voluntario en un banco de alimentos	Ofrécete como voluntario en un banco de alimentos y ofrécete a hacer un trabajo que la mayoría de los voluntarios no quieren hacer
30	Volunteer at a food bank	Contact your local food bank or pantry and volunteer your time to help sort, package, or distribute food to those in need.	Volunteer at a food bank and organize as much food as possible during the time you are there	2024-05-30	Claude	0	serving_food.jpg	Ofrézcase como voluntario en un banco de alimentos	Ofrécete como voluntario en un banco de alimentos y organiza la mayor cantidad de comida posible durante el tiempo que estés allí
31	Write cards for seniors	Create handwritten cards or notes and deliver them to a local nursing home or senior center to brighten someones day.	Write personalized cards for all the residents of a nursing home or assisted living facility.	2024-05-31	Claude	0	card.jpg	Escriba cartas para personas mayores	Escribe tarjetas personalizadas para todos los residentes de un hogar de ancianos o residencia asistida.
32	Write cards for seniors	Create handwritten cards or notes and deliver them to a local nursing home or senior center to brighten someones day.	Write a card to a senior who has impacted your life	2024-06-01	Claude	0	card.jpg	Escriba cartas para personas mayores	Escríbele una tarjeta a una persona mayor que haya tenido un impacto en tu vida
33	Write cards for seniors	Create handwritten cards or notes and deliver them to a local nursing home or senior center to brighten someones day.	Write a card to a senior in your community who does not have family members nearby	2024-06-02	Claude	0	card.jpg	Escriba cartas para personas mayores	Escriba una tarjeta a una persona mayor de su comunidad que no tenga familiares cerca
34	Offer to mow a lawn	If you notice a neighbors lawn needs mowing, offer to do it for them, especially if they are elderly or have limited mobility.	Mow the lawns of 3 neighbors who could use the help.	2024-06-03	Claude	0	yard_work.jpg	Ofrézcase a cortar el césped	Corta el césped de 3 vecinos que necesiten ayuda.
35	Offer to mow a lawn	If you notice a neighbors lawn needs mowing, offer to do it for them, especially if they are elderly or have limited mobility.	Mow the lawn of someone in your community who cannot mow their lawn themself	2024-06-04	Claude	0	yard_work.jpg	Ofrézcase a cortar el césped	Corta el césped de alguien en tu comunidad que no puede cortar el césped por sí mismo
36	Offer to mow a lawn	If you notice a neighbors lawn needs mowing, offer to do it for them, especially if they are elderly or have limited mobility.	Knock on a neighbors door who you are not very close to and offer to mow their lawn	2024-06-05	Claude	0	yard_work.jpg	Ofrézcase a cortar el césped	Llama a la puerta de un vecino con el que no estás muy cerca y ofrécete a cortar el césped
37	Donate unused toiletries	Gather any unused travel-sized toiletries, such as soap, shampoo, or toothpaste, and donate them to a local homeless shelter.	Organize a toiletry drive in your community and deliver the collected items to multiple shelters.	2024-06-06	Claude	0	hug.jpg	Done artículos de tocador no utilizados	Organiza una colecta de artículos de tocador en tu comunidad y entrega los artículos recolectados a múltiples refugios.
38	Donate unused toiletries	Gather any unused travel-sized toiletries, such as soap, shampoo, or toothpaste, and donate them to a local homeless shelter.	Go through all of your toiletries and find unused, unexpired toiletries you can donate	2024-06-07	Claude	0	hug.jpg	Done artículos de tocador no utilizados	Revisa todos tus artículos de tocador y encuentra artículos de tocador sin usar y sin caducar que puedas donar
39	Donate unused toiletries	Gather any unused travel-sized toiletries, such as soap, shampoo, or toothpaste, and donate them to a local homeless shelter.	Buy some basic toiletries from the store and donate them to a local shelter	2024-06-08	Claude	0	hug.jpg	Done artículos de tocador no utilizados	Compre algunos artículos de tocador básicos en la tienda y dónelos a un refugio local.
40	Volunteer at an animal shelter	Contact your local animal shelter and offer to volunteer your time to help care for the animals, such as walking dogs or socializing cats.	Volunteer at an animal shelter for a full day and help with as many tasks as possible.	2024-06-09	Claude	0	yard_work.jpg	Ofrézcase como voluntario en un refugio de animales	Sé voluntario en un refugio de animales durante un día completo y ayuda con tantas tareas como sea posible.
107	Compliment a stranger	nan	Give genuine compliments every time you notice something you like about someones outift, etc.	2024-08-15	ChatGPT	0	customer.jpg	Halagar a un desconocido.	Dar cumplidos genuinos cada vez que notes algo que te gusta sobre el atuendo de alguien, etc.
41	Volunteer at an animal shelter	Contact your local animal shelter and offer to volunteer your time to help care for the animals, such as walking dogs or socializing cats.	Walk as many dogs as possible while volunteering at a local animal shelter	2024-06-10	Claude	0	yard_work.jpg	Ofrézcase como voluntario en un refugio de animales	Saca a pasear a tantos perros como sea posible mientras eres voluntario en un refugio de animales local
42	Volunteer at an animal shelter	Contact your local animal shelter and offer to volunteer your time to help care for the animals, such as walking dogs or socializing cats.	Offer to do the less fun jobs, such as organization	2024-06-11	Claude	0	yard_work.jpg	Ofrézcase como voluntario en un refugio de animales	Ofrécete a hacer los trabajos menos divertidos, como la organización
43	Volunteer at a community garden	Contact your local community garden and offer to volunteer your time to help with planting, weeding, or harvesting.	Volunteer at a community garden for a full day and help with various tasks.	2024-06-12	Claude	0	yard_work.jpg	Ofrézcase como voluntario en un jardín comunitario	Sé voluntario en un jardín comunitario durante un día completo y ayuda con varias tareas.
44	Volunteer at a community garden	Contact your local community garden and offer to volunteer your time to help with planting, weeding, or harvesting.	Visit a community garden and offer to assist anyone already working there	2024-06-13	Claude	0	yard_work.jpg	Ofrézcase como voluntario en un jardín comunitario	Visite un jardín comunitario y ofrézcase a ayudar a cualquier persona que ya esté trabajando allí
45	Volunteer at a community garden	Contact your local community garden and offer to volunteer your time to help with planting, weeding, or harvesting.	Find whatever work needs to be done the most at a community garden and offer to do it	2024-06-14	Claude	0	yard_work.jpg	Ofrézcase como voluntario en un jardín comunitario	Encuentre el trabajo que más se necesite hacer en un jardín comunitario y ofrézcase a hacerlo
46	Volunteer at a soup kitchen	Contact your local soup kitchen or food pantry and offer to volunteer your time to help prepare or serve meals to those in need.	Organize a group of friends or coworkers to volunteer at a soup kitchen for a full day.	2024-06-15	Claude	0	serving_food.jpg	Ofrézcase como voluntario en un comedor de beneficencia	Organiza un grupo de amigos o compañeros de trabajo para ser voluntarios en un comedor comunitario durante un día completo.
47	Volunteer at a soup kitchen	Contact your local soup kitchen or food pantry and offer to volunteer your time to help prepare or serve meals to those in need.	Serve food at a soup kitchen and greet everyone you serve with a smile	2024-06-16	Claude	0	serving_food.jpg	Ofrézcase como voluntario en un comedor de beneficencia	Sirve comida en un comedor de beneficencia y saluda a todos los que sirves con una sonrisa
48	Volunteer at a soup kitchen	Contact your local soup kitchen or food pantry and offer to volunteer your time to help prepare or serve meals to those in need.	Assist with cleaning at a soup kitchen after food has been served	2024-06-17	Claude	0	serving_food.jpg	Ofrézcase como voluntario en un comedor de beneficencia	Ayudar con la limpieza en un comedor de beneficencia después de que se haya servido la comida
49	Volunteer at a local park	Contact your local parks department and offer to volunteer your time to help with park maintenance, such as litter cleanup or trail maintenance.	Organize a group of friends or neighbors to volunteer at a local park for a full day of service.	2024-06-18	Claude	0	kids.jpg	Ofrézcase como voluntario en un parque local	Organiza un grupo de amigos o vecinos para ser voluntarios en un parque local durante un día completo de servicio.
50	Volunteer at a local park	Contact your local parks department and offer to volunteer your time to help with park maintenance, such as litter cleanup or trail maintenance.	Visit a park you like to go to and pick up all the litter you can find	2024-06-19	Claude	0	kids.jpg	Ofrézcase como voluntario en un parque local	Visite un parque al que le guste ir y recoja toda la basura que pueda encontrar
51	Volunteer at a local park	Contact your local parks department and offer to volunteer your time to help with park maintenance, such as litter cleanup or trail maintenance.	Visit a park and make any repairs you notice are needed that you are able to do	2024-06-20	Claude	0	kids.jpg	Ofrézcase como voluntario en un parque local	Visite un parque y haga las reparaciones que note que son necesarias y que pueda hacer
52	Offer to run errands for a busy parent	If you know a parent who is juggling a lot of responsibilities, offer to run errands for them, such as picking up groceries or taking their children to activities.	Offer to run a weeks worth of errands for a busy parent in your community.	2024-06-21	Claude	0	hug.jpg	Ofrézcase a hacer mandados para un padre ocupado	Ofrece hacer los mandados de una semana para un padre ocupado en tu comunidad.
53	Offer to run errands for a busy parent	If you know a parent who is juggling a lot of responsibilities, offer to run errands for them, such as picking up groceries or taking their children to activities.	Find a family member, friend, or colleague who has children and offer help running errands	2024-06-22	Claude	0	hug.jpg	Ofrézcase a hacer mandados para un padre ocupado	Encuentre a un familiar, amigo o colega que tenga hijos y ofrézcale ayuda para hacer mandados
54	Donate clothes to a charity	Go through your closet and gather any gently used clothes you no longer need, and donate them to a local charity or clothing drive.	Organize a clothing drive in your neighborhood and deliver the collected items to multiple charitable organizations.	2024-06-23	Claude	0	hug.jpg	Done ropa vieja a una organización benéfica	Organiza una colecta de ropa en tu vecindario y entrega los artículos recolectados a múltiples organizaciones benéficas.
55	Donate clothes to a charity	Go through your closet and gather any gently used clothes you no longer need, and donate them to a local charity or clothing drive.	Collect clothing in good shape that is too small for you and donate it	2024-06-24	Claude	0	hug.jpg	Done ropa vieja a una organización benéfica	Recoge ropa en buen estado que te quede pequeña y dónala
56	Donate clothes to a charity	Go through your closet and gather any gently used clothes you no longer need, and donate them to a local charity or clothing drive.	Buy an outfit or multiple outfits from a store and donate them	2024-06-25	Claude	0	hug.jpg	Done ropa vieja a una organización benéfica	Compra uno o varios atuendos en una tienda y dónalos
57	Offer to walk a neighbors dog	If you know a neighbor who has a dog, offer to take their furry friend for a walk, especially if the neighbor is busy or unable to do it themselves.	Offer to walk the dogs of multiple neighbors who could use the help.	2024-06-26	Claude	0	hands.jpg	Ofrézcase a pasear al perro de un vecino	Ofrece sacar a pasear a los perros de varios vecinos que necesiten ayuda.
105	Listen to someone	Spend quality time listening to a family member or friend who needs to talk, without interrupting or offering advice unless asked	Listen to any waiter or cashier who gives you service throughout your day	2024-08-13	ChatGPT	0	hug.jpg	Escuche a alguien	Escucha a cualquier camarero o cajero que te atienda a lo largo del día
58	Offer to walk a neighbors dog	If you know a neighbor who has a dog, offer to take their furry friend for a walk, especially if the neighbor is busy or unable to do it themselves.	Find an elderly neighbor or member of your community and offer to walk their dog	2024-06-27	Claude	0	hands.jpg	Ofrézcase a pasear al perro de un vecino	Busca a un vecino anciano o a un miembro de tu comunidad y ofrécete a pasear a su perro
59	Offer to walk a neighbors dog	If you know a neighbor who has a dog, offer to take their furry friend for a walk, especially if the neighbor is busy or unable to do it themselves.	Offer to walk the dog of a friend or colleague who you know has been busy lately	2024-06-28	Claude	0	hands.jpg	Ofrézcase a pasear al perro de un vecino	Ofrécete a pasear al perro de un amigo o colega que sepas que ha estado ocupado últimamente
60	Offer to help a neighbor with yard work	If you notice a neighbors yard needs attention, offer to help with tasks like mowing, weeding, or gardening.	Offer to help with yard work for multiple neighbors who could use the assistance.	2024-06-29	Claude	0	yard_work.jpg	Ofrézcase a ayudar a un vecino con el trabajo del césped	Ofrece ayuda con el trabajo de jardinería para varios vecinos que necesiten asistencia.
61	Offer to help a neighbor with yard work	If you notice a neighbors yard needs attention, offer to help with tasks like mowing, weeding, or gardening.	Walk or drive around your neighborhood and find a neighbor who needs yard work done the most, then offer to do it for them	2024-06-30	Claude	0	yard_work.jpg	Ofrézcase a ayudar a un vecino con el trabajo del césped	Camine o conduzca por su vecindario y encuentre a un vecino que necesite más trabajo de jardinería, luego ofrézcase a hacerlo por él
62	Offer to help a neighbor with yard work	If you notice a neighbors yard needs attention, offer to help with tasks like mowing, weeding, or gardening.	Ask a neighbor you want to connect with if you can help them with any yard work	2024-07-01	Claude	0	yard_work.jpg	Ofrézcase a ayudar a un vecino con el trabajo del césped	Pregúntale a un vecino con el que quieras conectarte si puedes ayudarlo con algún trabajo de jardinería
63	Volunteer at a local community center	Contact your local community center and offer to volunteer your time to help with various activities or programs.	Organize a group of friends or neighbors to volunteer at a community center for a full day.	2024-07-02	Claude	0	hug.jpg	Ofrézcase como voluntario en un centro comunitario local	Organiza un grupo de amigos o vecinos para ser voluntarios en un centro comunitario durante un día completo.
64	Offer to help a neighbor with grocery shopping	If you know a neighbor who has difficulty getting to the grocery store, offer to do their shopping for them.	Offer to do the grocery shopping for multiple neighbors who could use the help.	2024-07-03	Claude	0	cooking.jpg	Ofrézcase a ayudar a un vecino con las compras de comestibles	Ofrece hacer la compra de comestibles para varios vecinos que necesiten ayuda.
65	Offer to help a neighbor with grocery shopping	If you know a neighbor who has difficulty getting to the grocery store, offer to do their shopping for them.	Offer to get groceries for an elderly neighbor you want to connect with	2024-07-04	Claude	0	cooking.jpg	Ofrézcase a ayudar a un vecino con las compras de comestibles	nan
66	Offer to help a neighbor with household tasks	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or light housework.	Offer to help with household tasks for multiple neighbors who could use the assistance.	2024-07-05	Claude	0	cooking.jpg	Ofrézcase a ayudar a un vecino con las tareas domésticas	Ofrece ayuda con las tareas del hogar para varios vecinos que necesiten asistencia.
67	Donate toys to a childrens shelter	Gather any gently used toys your children no longer play with and donate them to a local childrens shelter.	Organize a toy drive in your neighborhood and donate the collected items to multiple childrens shelters.	2024-07-06	Claude	0	kids.jpg	Done juguetes viejos a un refugio para niños	Organiza una colecta de juguetes en tu vecindario y dona los artículos recolectados a múltiples refugios para niños.
68	Donate toys to a childrens shelter	Gather any gently used toys your children no longer play with and donate them to a local childrens shelter.	Buy some toys you would have liked as a child and donate them	2024-07-07	Claude	0	kids.jpg	Done juguetes viejos a un refugio para niños	Compra algunos juguetes que te hubieran gustado de niño y dónalos
69	Donate toys to a childrens shelter	Gather any gently used toys your children no longer play with and donate them to a local childrens shelter.	Gather any old non-sentimental toys you have and donate them	2024-07-08	Claude	0	kids.jpg	Done juguetes viejos a un refugio para niños	Reúna todos los juguetes viejos que no sean sentimentales que tenga y dónelos
70	Offer to wash a neighbors car	If you notice a neighbors car is looking dirty, offer to wash it for them, especially if they are elderly or dont have the ability to do it themselves.	Offer to wash the cars of multiple neighbors who could use the help.	2024-07-09	Claude	0	hands.jpg	Ofrézcase a lavar el auto de un vecino	Ofrece lavar los coches de varios vecinos que necesiten ayuda.
71	Offer to wash a neighbors car	If you notice a neighbors car is looking dirty, offer to wash it for them, especially if they are elderly or dont have the ability to do it themselves.	Offer to wash the car of an elderly neighbor	2024-07-10	Claude	0	hands.jpg	Ofrézcase a lavar el auto de un vecino	Ofrécete a lavar el coche de un vecino anciano
72	Offer to wash a neighbors car	If you notice a neighbors car is looking dirty, offer to wash it for them, especially if they are elderly or dont have the ability to do it themselves.	Offer to wash the car of a neighbor who has children	2024-07-11	Claude	0	hands.jpg	Ofrézcase a lavar el auto de un vecino	Ofrécete a lavar el auto de un vecino que tiene hijos
73	Volunteer at a local library	Contact your local library and offer to volunteer your time to assist with tasks like shelving books, organizing, or assisting patrons.	Organize a group of friends or neighbors to volunteer at a local library for a full day.	2024-07-12	Claude	0	kid_gardening.jpg	Ofrézcase como voluntario en una biblioteca local	Organiza un grupo de amigos o vecinos para ser voluntarios en una biblioteca local durante un día completo.
74	Volunteer at a local library	Contact your local library and offer to volunteer your time to assist with tasks like shelving books, organizing, or assisting patrons.	Offer to help with seasonal decoration at a local library	2024-07-13	Claude	0	kid_gardening.jpg	Ofrézcase como voluntario en una biblioteca local	nan
75	Donate furniture to a charity	Go through your home and identify any gently used furniture you no longer need, and donate it to a local charity or thrift store.	Organize a furniture drive in your neighborhood and donate the collected items to multiple charitable organizations.	2024-07-14	Claude	0	kid_gardening.jpg	Done muebles viejos a una organización benéfica	Organiza una colecta de muebles en tu vecindario y dona los artículos recolectados a múltiples organizaciones benéficas.
76	Volunteer at a local retirement home	Contact a local retirement home or assisted living facility and offer to volunteer your time to visit with and engage the residents.	Organize a group of friends or family members to volunteer at a retirement home for a full day of activities and companionship.	2024-07-15	Claude	0	old_people.jpg	Ofrézcase como voluntario en una residencia de ancianos local	Organiza un grupo de amigos o familiares para ser voluntarios en un hogar de retiro durante un día completo de actividades y compañerismo.
77	Volunteer at a local retirement home	Contact a local retirement home or assisted living facility and offer to volunteer your time to visit with and engage the residents.	Visit a local retirement home and try to have a meaningful conversation with a resident there	2024-07-16	Claude	0	old_people.jpg	Ofrézcase como voluntario en una residencia de ancianos local	nan
78	Donate kitchen items to a shelter	Gather any gently used kitchen items, such as pots, pans, or utensils, and donate them to a local homeless shelter or transitional housing program.	Organize a kitchen item drive in your neighborhood and deliver the collected items to multiple shelters.	2024-07-17	Claude	0	kid_gardening.jpg	Done artículos de cocina viejos a un refugio	Organiza una colecta de artículos de cocina en tu vecindario y entrega los artículos recolectados a múltiples refugios.
79	Volunteer at a local museum	Contact your local museum and offer to volunteer your time to help with tasks like greeting visitors, assisting with exhibits, or leading tours.	Organize a group of friends or family members to volunteer at a local museum for a full day.	2024-07-18	Claude	0	hands.jpg	Ofrézcase como voluntario en un museo local	Organiza un grupo de amigos o familiares para ser voluntarios en un museo local durante un día completo.
80	Donate craft supplies	Gather any unused craft supplies, such as art materials, fabrics, or sewing supplies, and donate them to a local school or community art center.	Organize a craft supply drive in your neighborhood and deliver the collected items to multiple schools or community organizations.	2024-07-19	Claude	0	kids.jpg	Done materiales de manualidades viejos	Organiza una colecta de suministros de manualidades en tu vecindario y entrega los artículos recolectados a múltiples escuelas u organizaciones comunitarias.
81	Donate craft supplies	Gather any unused craft supplies, such as art materials, fabrics, or sewing supplies, and donate them to a local school or community art center.	Buy some simple craft supplies and donate them	2024-07-20	Claude	0	kids.jpg	Done materiales de manualidades viejos	nan
82	Offer to help a neighbor with meal preparation	If you know a neighbor who is elderly, disabled, or simply overwhelmed with meal prep, offer to cook them a healthy meal or assist with meal planning and preparation.	Offer to help with meal preparation for multiple neighbors who could use the assistance.	2024-07-21	Claude	0	cooking.jpg	Ofrézcase a ayudar a un vecino con la preparación de la comida	Ofrece ayuda con la preparación de comidas para varios vecinos que necesiten asistencia.
83	Donate art supplies to a community center	Gather any unused art supplies, such as paints, brushes, or canvases, and donate them to a local community center or art program.	Organize an art supply drive in your neighborhood and deliver the collected items to multiple community centers or schools.	2024-07-22	Claude	0	kids.jpg	Done materiales de arte antiguos a un centro comunitario	Organiza una colecta de suministros de arte en tu vecindario y entrega los artículos recolectados a múltiples centros comunitarios o escuelas.
84	Offer to help a neighbor with computer tasks	If you know a neighbor who is not tech-savvy, offer to assist them with tasks like setting up a new device, troubleshooting an issue, or teaching them how to use a computer program.	Offer to help with computer tasks for multiple neighbors who could use the assistance.	2024-07-23	Claude	0	old_people.jpg	Ofrézcase a ayudar a un vecino con las tareas de la computadora	Ofrece ayuda con tareas de computación para varios vecinos que necesiten asistencia.
85	Donate gardening tools to a community garden	Gather any unused gardening tools, such as shovels, rakes, or pruners, and donate them to a local community garden.	Organize a gardening tool drive in your neighborhood and deliver the collected items to multiple community gardens.	2024-07-24	Claude	0	yard_work.jpg	Done herramientas de jardinería viejas a un jardín comunitario	Organiza una colecta de herramientas de jardinería en tu vecindario y entrega los artículos recolectados a múltiples jardines comunitarios.
86	Offer to help a neighbor with pet care	If you know a neighbor who has a pet, offer to help with tasks like walking the dog, cleaning the litter box, or providing pet-sitting services.	Offer to help with pet care for multiple neighbors who could use the assistance.	2024-07-25	Claude	0	hug.jpg	Ofrézcase a ayudar a un vecino con el cuidado de mascotas	Ofrece ayuda con el cuidado de mascotas para varios vecinos que necesiten asistencia.
87	Donate old sports equipment to a youth league	Gather any gently used sports equipment, such as balls, cleats, or protective gear, and donate them to a local youth sports league or recreation center.	Organize a sports equipment drive in your neighborhood and deliver the collected items to multiple youth leagues or recreation centers.	2024-07-26	Claude	0	kids.jpg	Done material deportivo viejo a una liga juvenil	Organiza una colecta de equipos deportivos en tu vecindario y entrega los artículos recolectados a múltiples ligas juveniles o centros recreativos.
88	Offer to help a neighbor with home repairs	If you notice a neighbors home needs minor repairs, such as fixing a leaky faucet or patching a hole in the wall, offer to lend a hand.	Offer to help with home repairs for multiple neighbors who could use the assistance.	2024-07-27	Claude	0	cooking.jpg	Ofrézcase a ayudar a un vecino con las reparaciones de la casa	Ofrece ayuda con reparaciones del hogar para varios vecinos que necesiten asistencia.
89	Donate games and puzzles to a childrens hospital	Gather any gently used board games, puzzles, or other childrens activities and donate them to a local childrens hospital or pediatric ward.	Organize a game and puzzle drive in your neighborhood and deliver the collected items to multiple childrens hospitals or medical centers.	2024-07-28	Claude	0	kids.jpg	Done juegos y rompecabezas antiguos a un hospital infantil	Organiza una colecta de juegos y rompecabezas en tu vecindario y entrega los artículos recolectados a múltiples hospitales o centros médicos infantiles.
90	Donate towels and blankets to an animal shelter	Gather any clean, old towels and blankets you no longer need and donate them to your local animal shelter or rescue organization.	Organize a towel and blanket drive in your neighborhood and deliver the collected items to multiple animal shelters.	2024-07-29	Claude	0	yard_work.jpg	Done toallas y mantas viejas a un refugio de animales	Organiza una colecta de toallas y mantas en tu vecindario y entrega los artículos recolectados a múltiples refugios de animales.
106	Offer to tutor a struggling student	nan	Help a group of students do homework in a subject youre good at	2024-08-14	ChatGPT	0	kids.jpg	Ofrecer tutoría a un estudiante que está teniendo dificultades.	Ayudar a un grupo de estudiantes con las tareas en una materia en la que eres bueno.
91	Offer to help a neighbor with household chores	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or light housework.	Offer to help with household chores for multiple neighbors who could use the assistance.	2024-07-30	Claude	0	cooking.jpg	Ofrézcase a ayudar a un vecino con las tareas domésticas	Ofrece ayuda con las tareas del hogar para varios vecinos que necesiten asistencia.
92	Volunteer at a local historic site or museum	Contact a local historic site or museum and offer to volunteer your time to help with tasks like gardening, maintenance, or giving tours.	Organize a group of friends or neighbors to volunteer at a historic site or museum for a full day of service.	2024-07-31	Claude	0	hands.jpg	Ofrézcase como voluntario en un sitio histórico o museo local	Organiza un grupo de amigos o vecinos para ser voluntarios en un sitio histórico o museo durante un día completo de servicio.
93	Donate school supplies to a local charity or organization	Gather any unused school supplies, such as notebooks, pencils, or backpacks, and donate them to a local charity or organization that supports students in need.	Organize a school supply drive in your neighborhood and deliver the collected items to multiple charities or schools.	2024-08-01	Claude	0	kids.jpg	Done útiles escolares viejos a una organización benéfica u organización local	Organiza una colecta de útiles escolares en tu vecindario y entrega los artículos recolectados a múltiples organizaciones benéficas o escuelas.
94	Donate books to a local prison or jail library	Gather any books you no longer need and donate them to a local prison or jail library, where they can be enjoyed by incarcerated individuals.	Organize a book drive in your neighborhood and donate the collected books to multiple prison or jail libraries.	2024-08-02	Claude	0	hug.jpg	Done libros antiguos a una prisión local o a la biblioteca de la cárcel	Organiza una colecta de libros en tu vecindario y dona los libros recolectados a múltiples bibliotecas de prisiones o cárceles.
95	Offer to help a neighbor with grocery shopping or errands	If you know a neighbor who has difficulty getting to the grocery store or running errands, offer to do their shopping or errands for them.	Offer to help with grocery shopping or errands for multiple neighbors who could use the assistance.	2024-08-03	Claude	0	hug.jpg	Ofrézcase a ayudar a un vecino con las compras de comestibles o los mandados	Ofrece ayuda con las compras de comestibles o mandados para varios vecinos que necesiten asistencia.
96	Donate bedding and linens to a homeless shelter	Gather any clean, gently used bedding, sheets, or towels and donate them to your local homeless shelter.	Organize a bedding and linen drive in your neighborhood and deliver the collected items to multiple homeless shelters.	2024-08-04	Claude	0	hug.jpg	Done ropa de cama y sábanas viejas a un refugio para indigentes	Organiza una colecta de ropa de cama en tu vecindario y entrega los artículos recolectados a múltiples refugios para personas sin hogar.
97	Offer to help a neighbor with household chores or errands	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or running errands.	Offer to help with household chores or errands for multiple neighbors who could use the assistance.	2024-08-05	Claude	0	hug.jpg	Ofrézcase a ayudar a un vecino con las tareas domésticas o los mandados	Ofrece ayuda con las tareas del hogar o mandados para varios vecinos que necesiten asistencia.
98	Volunteer at a local library or literacy program	Contact your local library or literacy organization and offer to volunteer your time to assist with tasks like tutoring, shelving books, or leading reading groups.	Organize a group of friends or neighbors to volunteer at a library or literacy program for a full day.	2024-08-06	Claude	0	hug.jpg	Ofrézcase como voluntario en una biblioteca local o en un programa de alfabetización	Organiza un grupo de amigos o vecinos para ser voluntarios en una biblioteca o programa de alfabetización durante un día completo.
99	Offer to help a neighbor with household chores or organization	If you know a neighbor who is elderly, disabled, or simply overwhelmed, offer to help with tasks like cleaning, laundry, or decluttering.	Offer to help with household chores or organization for multiple neighbors who could use the assistance.	2024-08-07	Claude	0	hug.jpg	Ofrézcase a ayudar a un vecino con las tareas domésticas o con la organización	Ofrece ayuda con las tareas del hogar o la organización para varios vecinos que necesiten asistencia.
100	Offer to help a neighbor with meal planning or preparation	If you know a neighbor who is elderly, disabled, or simply overwhelmed with meal prep, offer to cook them a healthy meal or assist with meal planning and preparation.	Offer to help with meal planning or preparation for multiple neighbors who could use the assistance.	2024-08-08	Claude	0	hug.jpg	Ofrézcase a ayudar a un vecino con la planificación o preparación de comidas	Ofrece ayuda con la planificación o preparación de comidas para varios vecinos que necesiten asistencia.
101	Volunteer at a local youth development program or after-school initiative	Contact a local youth center, after-school program, or community organization and offer to volunteer your time to help with activities, tutoring, or mentoring.	Organize a group of friends or neighbors to volunteer at a youth program for a full day.	2024-08-09	Claude	0	hug.jpg	Ofrézcase como voluntario en un programa local de desarrollo juvenil o en una iniciativa extracurricular	Organiza un grupo de amigos o vecinos para ser voluntarios en un programa juvenil durante un día completo.
102	Offer to help a neighbor with pet care	If you know a neighbor who has a pet, offer to help with tasks like walking the dog, cleaning the litter box, or providing pet-sitting services.	Offer to help with pet care or dog walking for multiple neighbors who could use the assistance.	2024-08-10	Claude	0	yard_work.jpg	Ofrézcase a ayudar a un vecino con el cuidado de mascotas o paseando perros	Ofrece ayuda con el cuidado de mascotas o paseo de perros para varios vecinos que necesiten asistencia.
103	Volunteer at a local nature center, wildlife refuge, or conservation area	Contact a local nature center, wildlife refuge, or conservation organization and offer to volunteer your time to help with tasks like trail maintenance, environmental education, or animal care.	Organize a group of friends or neighbors to volunteer at a nature center or wildlife refuge for a full day of service.	2024-08-11	Claude	0	hands.jpg	Ofrézcase como voluntario en un centro de naturaleza local, un refugio de vida silvestre o un área de conservación	Organiza un grupo de amigos o vecinos para ser voluntarios en un centro de naturaleza o refugio de vida silvestre durante un día completo de servicio.
104	Listen to someone	Spend quality time listening to a family member or friend who needs to talk, without interrupting or offering advice unless asked	Schedule one-on-one time to listen to someone who might be feeling overwhelmed right now	2024-08-12	ChatGPT	0	hug.jpg	Escuche a alguien	Agenda tiempo uno a uno para escuchar a alguien que pueda sentirse abrumado en este momento.
108	Compliment a stranger	nan	Compliment everyone you pass on the street who smiles at you	2024-08-16	ChatGPT	0	customer.jpg	Halagar a un desconocido.	Felicita a todas las personas con las que te cruces en la calle y que te sonrían
109	Volunteer to read to children at a library or daycare	nan	Read 2 of your favorite childhood books to a group of children	2024-08-17	ChatGPT	0	kids.jpg	Ofrecerse como voluntario para leer a niños en una biblioteca o guardería.	Leer 2 de tus libros favoritos de la infancia a un grupo de niños.
110	Write a positive review for a small business you appreciate	nan	Tell the owner or an employee of the business how much you appreciate them in person	2024-08-18	ChatGPT	0	customer.jpg	Escribir una reseña positiva para un pequeño negocio que aprecias.	Decirle al dueño o a un empleado del negocio cuánto los aprecias en persona.
111	Leave quarters at a laundromat for someone to use.	nan	Leave enough quarters for someone to fully wash and dry a load of laundry at a laundromat	2024-08-19	ChatGPT	0	hands.jpg	Dejar monedas de veinticinco centavos en una lavandería para que alguien las use.	Dejar suficientes monedas de veinticinco centavos para que alguien pueda lavar y secar completamente una carga de ropa en una lavandería.
112	Donate canned goods	nan	Buy some new canned goods from the store and take them to a local food bank	2024-08-20	ChatGPT	0	serving_food.jpg	Donar alimentos enlatados.	Comprar alimentos enlatados nuevos en la tienda y llevarlos a un banco de alimentos local.
113	Donate canned goods	nan	Search your pantry for unexpired canned goods you are not planning on using and donate them	2024-08-21	ChatGPT	0	serving_food.jpg	Donar alimentos enlatados.	Busque en su despensa productos enlatados no vencidos que no planea usar y dónelos
114	Write positive messages with chalk	nan	Draw pictures or write encouraging messages on a regularly-used sidewalk	2024-08-22	ChatGPT	0	hands.jpg	Escribir mensajes positivos con tiza	Dibujar imágenes o escribir mensajes alentadores en una acera de uso regular.
115	Write positive messages with chalk	nan	Write kind notes on the sidewalks around a playground	2024-08-23	ChatGPT	0	hands.jpg	Escribir mensajes positivos con tiza	Escribe notas amables en las aceras alrededor de un patio de recreo
116	Write positive messages with chalk	nan	Write encouraging messages on a biking or walking path using chalk	2024-08-24	ChatGPT	0	hands.jpg	Escribir mensajes positivos con tiza	Escriba mensajes de aliento en un sendero para andar en bicicleta o caminar con tiza
117	Leave a kind note for your mail carrier.	nan	Leave a note expressing gratitude and some water/snacks for your mail carrier	2024-08-25	ChatGPT	0	card.jpg	Dejar una nota amable para tu cartero o cartera.	Dejar una nota expresando gratitud y algunos refrigerios o agua para tu cartero.
118	Leave a kind note for your mail carrier.	nan	Leave a note with a joke written on it for your mail carrier to see	2024-08-26	ChatGPT	0	card.jpg	Dejar una nota amable para tu cartero o cartera.	Deja una nota con una broma escrita para que tu cartero la vea
119	Leave a kind note for your mail carrier.	nan	Leave a note expressing gratitude and a gift card for your mail carrier	2024-08-27	ChatGPT	0	card.jpg	Dejar una nota amable para tu cartero o cartera.	Deje una nota expresando gratitud y una tarjeta de regalo para su cartero
120	Leave a generous tip for your barista or server.	nan	Visit a local restaurant or coffee shop and leave a tip thats more than 20%	2024-08-28	ChatGPT	0	customer.jpg	Dejar una propina generosa para tu camarero o camarera.	Visitar un restaurante o cafetería local y dejar una propina que sea más del 20%.
121	Leave some money in a vending machine	nan	Leave enough money to buy a drink in/on a vending machine	2024-08-29	ChatGPT	0	hug.jpg	Dejar algo de dinero en una máquina expendedora.	Dejar suficiente dinero para comprar una bebida en una máquina expendedora.
122	Call or text a family member/friend and tell them you appreciate them	nan	Call someone you havent spoken to in a while and let them know you are thinking of them	2024-08-30	ChatGPT	0	old_people.jpg	Llamar o enviar un mensaje de texto a un familiar/amigo y decirles que los aprecias.	Llamar a alguien con quien no has hablado en un tiempo y hacerles saber que estás pensando en ellos.
123	Offer free hugs	nan	Ask friends, coworkers, or classmates how they are doing and offer a hug	2024-08-31	ChatGPT	0	hug.jpg	Ofrecer abrazos gratis.	Preguntar a tus amigos, compañeros de trabajo o compañeros de clase cómo están y ofrecer un abrazo.
124	Offer free hugs	nan	Offer free hugs to strangers and count how many accept	2024-09-01	ChatGPT	0	hug.jpg	Ofrecer abrazos gratis.	Ofrece abrazos gratis a extraños y cuenta cuántos aceptan
125	Offer free hugs	nan	Offer a hug to a colleague who has been working hard lately	2024-09-02	ChatGPT	0	hug.jpg	Ofrecer abrazos gratis.	Ofrécele un abrazo a un colega que ha estado trabajando duro últimamente
126	Donate artwork	nan	Organize a group to paint or draw pictures and take the art you create to a senior center	2024-09-03	ChatGPT	0	kid_gardening.jpg	Donar obras de arte.	Organizar un grupo para pintar o dibujar imágenes y llevar el arte que creas a un centro de personas mayores.
127	Donate artwork	nan	Buy inexpensive artwork from a thrift shop and donate it to a shelter or senior center	2024-09-04	ChatGPT	0	kid_gardening.jpg	Donar obras de arte.	Compra obras de arte baratas en una tienda de segunda mano y dónalas a un refugio o centro para personas mayores
128	Donate bags to a homeless shelter	nan	Find any bags you have not used in the last year and donate them to a local homeless shelter	2024-09-05	ChatGPT	0	hands.jpg	Donar bolsos a un refugio para personas sin hogar.	Buscar cualquier bolso que no hayas usado en el último año y donarlos a un refugio para personas sin hogar.
129	Donate bags to a homeless shelter	nan	Buy some backpacks, new or used, and take them to a local homeless shelter	2024-09-06	ChatGPT	0	hands.jpg	Donar bolsos a un refugio para personas sin hogar.	Compra obras de arte baratas en una tienda de segunda mano y dónalas a un refugio o centro para personas mayores
130	Donate bags to a homeless shelter	nan	Gather old drawstring bags that are in good condition and donate them to a homeless shelter	2024-09-07	ChatGPT	0	hands.jpg	Donar bolsos a un refugio para personas sin hogar.	Reúna bolsas viejas con cordón que estén en buenas condiciones y dónelas a un refugio para personas sin hogar
131	Donate warm clothing accessories	nan	Collect old winter hats and scarves and donate them to a homeless shelter 	2024-09-08	ChatGPT	0	hands.jpg	Donar accesorios de ropa abrigada.	Recolectar gorros y bufandas viejos y donarlos a un refugio para personas sin hogar.
132	Donate warm clothing accessories	nan	Buy hats, gloves, or scarves and donate them	2024-09-09	ChatGPT	0	hands.jpg	Donar accesorios de ropa abrigada.	Compra gorros, guantes o bufandas y dónalos
133	Donate warm clothing accessories	nan	Ask friends, family, or colleagues for warm weather accessories to donate	2024-09-10	ChatGPT	0	hands.jpg	Donar accesorios de ropa abrigada.	Pida a sus amigos, familiares o colegas que le den accesorios para el clima cálido para donarlos
134	Donate shoes	nan	Collect shoes you do not need and donate them to a homeless shelter	2024-09-11	ChatGPT	0	hands.jpg	Donar zapatos.	Recolectar zapatos que no necesites y donarlos a un refugio para personas sin hogar.
135	Donate shoes	nan	Ask friends and family members for gently used shoes you can take to donate	2024-09-12	ChatGPT	0	hands.jpg	Donar zapatos.	Pídeles a tus amigos y familiares que te den zapatos usados en buen estado que puedas llevar para donar
136	Donate shoes	nan	Buy some basic tennis shoes from the store and donate them	2024-09-13	ChatGPT	0	hands.jpg	Donar zapatos.	Compra unas zapatillas de tenis básicas en la tienda y dónalas
137	Donate first aid supplies	nan	Put together some basic first aid kits and take them to a homeless shelter	2024-09-14	ChatGPT	0	hug.jpg	Donar suministros de primeros auxilios.	Armar kits de primeros auxilios básicos y llevarlos a un refugio para personas sin hogar.
138	Volunteer at a local hospital	nan	Volunteer at a hospital and greet everyone you see with a smile	2024-09-15	ChatGPT	0	hug.jpg	Voluntariarse en un hospital local.	Voluntariarse en un hospital y saludar a todos los que veas con una sonrisa.
139	Assist a disaster relief organization	nan	Write encouraging cards that can be distributed to victims of natural disasters	2024-09-16	ChatGPT	0	hug.jpg	Ayudar a una organización de ayuda en caso de desastre.	Escribir tarjetas de aliento que puedan distribuirse a las víctimas de desastres naturales.
\.


--
-- Data for Name: completions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.completions (id, description, date, user_id, challenge_id, completed_twist) FROM stdin;
1	Completion 1 description	2024-05-01 16:58:20.633	1	1	f
2	Completion 1 description	2024-04-30 16:58:20.633	1	2	f
3	Completion 1 description	2024-04-29 16:58:20.633	1	3	f
4	Completion 1 description	2024-04-27 16:58:20.633	1	5	f
5	Completion 1 description	2024-04-26 16:58:20.633	1	6	f
6	Completion 1 description	2024-04-25 16:58:20.633	1	7	f
7	Completion 1 description	2024-04-24 16:58:20.633	1	8	f
8	Completion 2 description	2024-04-30 16:58:20.633	2	2	f
9	Completion 3 description	2024-04-29 16:58:20.633	3	3	f
10	Completion 4 description	2024-04-28 16:58:20.633	4	4	f
11	Completion 5 description	2024-04-27 16:58:20.633	5	5	f
12	Completion 6 description	2024-04-26 16:58:20.633	6	6	f
13	Completion 7 description	2024-04-25 16:58:20.633	7	7	f
14	Completion 8 description	2024-04-24 16:58:20.633	8	8	f
15	Completion 9 description	2024-04-23 16:58:20.633	9	9	f
16	Completion 10 description	2024-04-22 16:58:20.633	10	10	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, bio, kinde_id, profile_picture) FROM stdin;
1	user1	\N	1	\N
2	user2	\N	2	\N
3	user3	\N	3	\N
4	user4	\N	4	\N
5	user5	\N	5	\N
6	user6	\N	6	\N
7	user7	\N	7	\N
8	user8	\N	8	\N
9	user9	\N	9	\N
10	user10	\N	10	\N
\.


--
-- Name: challenges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.challenges_id_seq', 139, true);


--
-- Name: completions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.completions_id_seq', 16, true);


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
-- Name: challenges_twist_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX challenges_twist_key ON public.challenges USING btree (twist);


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
-- Name: user_id_challenge_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_id_challenge_id ON public.completions USING btree (user_id, challenge_id);


--
-- Name: users_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_id_key ON public.users USING btree (id);


--
-- Name: users_kinde_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_kinde_id_idx ON public.users USING btree (kinde_id);


--
-- Name: users_kinde_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_kinde_id_key ON public.users USING btree (kinde_id);


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

