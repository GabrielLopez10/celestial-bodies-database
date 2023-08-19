--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying NOT NULL,
    size numeric,
    composition text,
    is_hazardous boolean,
    belongs_to_moon_id integer,
    moon_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    size numeric,
    age bigint,
    description text,
    has_black_hole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    size numeric,
    color character varying,
    is_inhabited boolean,
    crater_count integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer,
    size numeric,
    distance_from_star numeric,
    has_moons boolean,
    num_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id bigint NOT NULL,
    name character varying NOT NULL,
    galaxy_id bigint,
    type character varying,
    luminosity numeric,
    is_binary boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (29, 'Vesta', 525, 'Basaltic', false, NULL, NULL);
INSERT INTO public.asteroid VALUES (30, 'Ceres', 939, 'Carbonaceous', false, NULL, NULL);
INSERT INTO public.asteroid VALUES (31, 'Eros', 34.4, 'S-type', false, NULL, NULL);
INSERT INTO public.asteroid VALUES (32, 'Bennu', 492.68, 'Carbonaceous', true, NULL, NULL);
INSERT INTO public.asteroid VALUES (33, 'Itokawa', 0.535, 'S-type', false, NULL, NULL);
INSERT INTO public.asteroid VALUES (34, 'Ryugu', 0.87, 'Cg-type', true, NULL, NULL);
INSERT INTO public.asteroid VALUES (35, 'Apophis', 0.325, 'S-type', true, NULL, NULL);
INSERT INTO public.asteroid VALUES (36, 'Mathilde', 52.8, 'C-type', false, NULL, NULL);
INSERT INTO public.asteroid VALUES (37, 'Gaspra', 19.0, 'S-type', false, NULL, NULL);
INSERT INTO public.asteroid VALUES (38, 'Ida', 31.4, 'S-type', false, NULL, NULL);
INSERT INTO public.asteroid VALUES (39, 'Kleopatra', 135, 'M-type', false, NULL, NULL);
INSERT INTO public.asteroid VALUES (40, 'Psyche', 226, 'Metallic', false, NULL, NULL);
INSERT INTO public.asteroid VALUES (41, 'Steins', 4.6, 'E-type', false, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 13000000000, 'Our galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120000, 14000000000, 'Neighboring galaxy', true);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 50000, 8000000000, 'Distinctive galaxy', false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 60000, 9000000000, 'Spiral galaxy', false);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 40000, 5000000000, 'Small galaxy', false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 45000, 6000000000, 'Classic spiral galaxy', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (43, 'Ganymede', 15, 5262, 'Gray', false, NULL);
INSERT INTO public.moon VALUES (44, 'Titan', 16, 5150, 'Orange', false, NULL);
INSERT INTO public.moon VALUES (45, 'Europa', 15, 3121, 'White', false, NULL);
INSERT INTO public.moon VALUES (46, 'Triton', 16, 2706.8, 'Pink', false, NULL);
INSERT INTO public.moon VALUES (47, 'Callisto', 15, 4821, 'Brown', false, NULL);
INSERT INTO public.moon VALUES (48, 'Deimos', 14, 6.2, 'Brown', false, NULL);
INSERT INTO public.moon VALUES (49, 'Enceladus', 16, 252.1, 'White', false, NULL);
INSERT INTO public.moon VALUES (50, 'Io', 15, 3636, 'Yellow', false, NULL);
INSERT INTO public.moon VALUES (51, 'Oberon', 19, 1522, 'Gray', false, NULL);
INSERT INTO public.moon VALUES (52, 'Miranda', 20, 235.8, 'Gray', false, NULL);
INSERT INTO public.moon VALUES (53, 'Hyperion', 16, 270, 'Yellow', false, NULL);
INSERT INTO public.moon VALUES (54, 'Charon', 21, 606, 'Gray', false, NULL);
INSERT INTO public.moon VALUES (55, 'Mimas', 16, 396.4, 'Gray', false, NULL);
INSERT INTO public.moon VALUES (56, 'Phoebe', 16, 213, 'Gray', false, NULL);
INSERT INTO public.moon VALUES (57, 'Ariel', 22, 1157, 'Gray', false, NULL);
INSERT INTO public.moon VALUES (58, 'Rhea', 16, 1529, 'White', false, NULL);
INSERT INTO public.moon VALUES (59, 'Titania', 19, 1577, 'Gray', false, NULL);
INSERT INTO public.moon VALUES (60, 'Dione', 16, 1122, 'White', false, NULL);
INSERT INTO public.moon VALUES (41, 'Luna', 13, 3474.8, 'Gray', false, 100);
INSERT INTO public.moon VALUES (42, 'Phobos', 14, 22.2, 'Gray', false, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (14, 'Mars', 1, 6779, 227.9, true, NULL);
INSERT INTO public.planet VALUES (15, 'Jupiter', 2, 139820, 778.5, true, NULL);
INSERT INTO public.planet VALUES (16, 'Saturn', 2, 116460, 1434.0, true, NULL);
INSERT INTO public.planet VALUES (18, 'Neptune', 2, 49530, 4495.1, true, NULL);
INSERT INTO public.planet VALUES (19, 'Uranus', 2, 51118, 2871.0, true, NULL);
INSERT INTO public.planet VALUES (20, 'Mercury', 1, 4879, 57.9, false, NULL);
INSERT INTO public.planet VALUES (21, 'Pluto', 3, 2370, 5906.4, true, NULL);
INSERT INTO public.planet VALUES (22, 'Kepler-186f', 6, 12119, 0.353, false, NULL);
INSERT INTO public.planet VALUES (23, 'HD 209458 b', 5, 145370, 0.0475, false, NULL);
INSERT INTO public.planet VALUES (24, 'Gliese 581 d', 4, 40849, 0.220, false, NULL);
INSERT INTO public.planet VALUES (13, 'Earth', 1, 12742, 149.6, true, 1);
INSERT INTO public.planet VALUES (17, 'Venus', 1, 12104, 108.2, false, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 1.0, false);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type', 25.4, false);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 'G-type', 1.519, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, 'M-type', 126000, false);
INSERT INTO public.star VALUES (5, 'Vega', 2, 'A-type', 40, false);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 3, 'M-type', 0.00154, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 41, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 60, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid asteroid_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: asteroid asteroid_moon_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_moon_id_fkey1 FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

