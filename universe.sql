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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    shape character varying,
    distance_from_earth_in_mly numeric
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
    planet_id integer NOT NULL,
    eccentricity numeric,
    albedo numeric
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
    star_id integer NOT NULL,
    has_life boolean,
    is_spherical boolean DEFAULT true NOT NULL,
    length_of_day_in_hours numeric NOT NULL,
    mean_temperature_in_c integer,
    number_of_moons integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    mk_system_surface_temperature_classification character varying(1),
    color character varying
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milk Way', NULL, 'spiral', 0);
INSERT INTO public.galaxy VALUES (2, 'Messier 74', NULL, 'spiral', 32);
INSERT INTO public.galaxy VALUES (3, 'NGC 1672', NULL, 'spiral', 51.7);
INSERT INTO public.galaxy VALUES (4, 'NGC 1132', NULL, 'elliptical', 300);
INSERT INTO public.galaxy VALUES (5, 'NGC 1472A', NULL, 'irregular', 52);
INSERT INTO public.galaxy VALUES (6, 'NGC 5264', NULL, 'irregular', 15);
INSERT INTO public.galaxy VALUES (7, 'Unknow', NULL, 'unknow', -1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Moon', 4, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'MK 2', 12, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Dysnomia', 11, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Hi''iaka', 13, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Namaka', 13, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Charon', 10, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Nix', 10, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Hydra', 10, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Styx', 10, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Kerberos', 10, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Metis', 6, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Adrastea', 6, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Amalthea', 6, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Thebe', 6, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Io', 6, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Europa', 6, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Ganymede', 6, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Callisto', 6, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Themisto', 6, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Leda', 6, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mercury', 1, NULL, true, 4222.6, 167, 0);
INSERT INTO public.planet VALUES (3, 'Venus', 1, NULL, true, 2802, 464, 0);
INSERT INTO public.planet VALUES (4, 'Earth', 1, NULL, true, 24, 15, 1);
INSERT INTO public.planet VALUES (5, 'Mars', 1, NULL, true, 24.7, -65, 2);
INSERT INTO public.planet VALUES (6, 'Jupiter', 1, NULL, true, 9.9, -110, 92);
INSERT INTO public.planet VALUES (7, 'Saturn', 1, NULL, true, 10.7, -140, 83);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, NULL, true, 17.2, -195, 27);
INSERT INTO public.planet VALUES (9, 'Neptune', 1, NULL, true, 16.1, -200, 14);
INSERT INTO public.planet VALUES (10, 'Pluto', 1, NULL, true, 153.3, -225, 5);
INSERT INTO public.planet VALUES (11, 'Eris', 1, NULL, true, 25.9, -217, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', 1, NULL, true, 22.5, -406, 1);
INSERT INTO public.planet VALUES (13, 'Haumea', 1, NULL, true, 4, -402, 2);
INSERT INTO public.planet VALUES (14, 'Ceres', 1, NULL, true, 9.4, -105, 0);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Chthonian', NULL);
INSERT INTO public.planet_type VALUES (2, 'Carbon', NULL);
INSERT INTO public.planet_type VALUES (3, 'Coreless', NULL);
INSERT INTO public.planet_type VALUES (4, 'Desert', NULL);
INSERT INTO public.planet_type VALUES (5, 'Gas dwarf', NULL);
INSERT INTO public.planet_type VALUES (6, 'Gas giant', NULL);
INSERT INTO public.planet_type VALUES (7, 'Helium', NULL);
INSERT INTO public.planet_type VALUES (8, 'Hycean', NULL);
INSERT INTO public.planet_type VALUES (9, 'Ice giant', NULL);
INSERT INTO public.planet_type VALUES (10, 'Ice', NULL);
INSERT INTO public.planet_type VALUES (11, 'Iron', NULL);
INSERT INTO public.planet_type VALUES (12, 'Lava', NULL);
INSERT INTO public.planet_type VALUES (13, 'Ocean', NULL);
INSERT INTO public.planet_type VALUES (14, 'Protoplanet', NULL);
INSERT INTO public.planet_type VALUES (15, 'Puffy', NULL);
INSERT INTO public.planet_type VALUES (16, 'Silicate', NULL);
INSERT INTO public.planet_type VALUES (17, 'Terrestrial', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G', 'yellow');
INSERT INTO public.star VALUES (7, 'Betelgeuse', 7, 'M', 'red');
INSERT INTO public.star VALUES (6, 'Arcturus', 7, 'K', 'orange');
INSERT INTO public.star VALUES (5, 'Polaris', 7, 'F', 'yellow-white');
INSERT INTO public.star VALUES (4, 'Canopus', 7, 'A', 'white');
INSERT INTO public.star VALUES (3, 'Achernar', 7, 'B', 'blue-white');
INSERT INTO public.star VALUES (2, 'Mu Normae', 7, 'O', 'blue');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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

