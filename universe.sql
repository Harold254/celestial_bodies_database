--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(255) NOT NULL,
    size numeric NOT NULL,
    type text NOT NULL,
    has_life boolean,
    number_of_stars integer
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
    name character varying(255) NOT NULL,
    diameter integer NOT NULL,
    has_water boolean,
    planet_id integer NOT NULL,
    atmosphere text
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
    name character varying(255) NOT NULL,
    size integer NOT NULL,
    has_life boolean,
    distance_from_star numeric,
    star_id integer NOT NULL
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
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age numeric NOT NULL,
    type text NOT NULL,
    has_planets boolean,
    galaxy_id integer NOT NULL
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
-- Name: universe_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe_info (
    universe_info_id integer NOT NULL,
    info character varying(255) NOT NULL,
    description text,
    importance_level integer,
    is_visible boolean
);


ALTER TABLE public.universe_info OWNER TO freecodecamp;

--
-- Name: universe_info_universe_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_info_universe_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_info_universe_info_id_seq OWNER TO freecodecamp;

--
-- Name: universe_info_universe_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_info_universe_info_id_seq OWNED BY public.universe_info.universe_info_id;


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
-- Name: universe_info universe_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_info ALTER COLUMN universe_info_id SET DEFAULT nextval('public.universe_info_universe_info_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1.5, 'Spiral', true, 100000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2.0, 'Spiral', false, 200000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 0.5, 'Spiral', false, 40000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 1.0, 'Spiral', false, 80000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 0.8, 'Elliptical', false, 50000);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 1.2, 'Lenticular', false, 70000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0, false, 1, 'Thin');
INSERT INTO public.moon VALUES (2, 'Phobos', 0, false, 2, 'None');
INSERT INTO public.moon VALUES (3, 'Deimos', 0, false, 2, 'None');
INSERT INTO public.moon VALUES (4, 'Io', 0, false, 5, 'Thin');
INSERT INTO public.moon VALUES (5, 'Europa', 0, true, 5, 'Thin');
INSERT INTO public.moon VALUES (6, 'Ganymede', 0, true, 5, 'Thin');
INSERT INTO public.moon VALUES (7, 'Callisto', 0, false, 5, 'Thin');
INSERT INTO public.moon VALUES (8, 'Titan', 0, true, 6, 'Thick');
INSERT INTO public.moon VALUES (9, 'Rhea', 0, false, 6, 'Thin');
INSERT INTO public.moon VALUES (10, 'Iapetus', 0, false, 6, 'Thin');
INSERT INTO public.moon VALUES (11, 'Oberon', 0, false, 7, 'Thin');
INSERT INTO public.moon VALUES (12, 'Titania', 0, false, 7, 'Thin');
INSERT INTO public.moon VALUES (13, 'Ariel', 0, false, 7, 'Thin');
INSERT INTO public.moon VALUES (14, 'Umbriel', 0, false, 7, 'Thin');
INSERT INTO public.moon VALUES (15, 'Triton', 0, true, 8, 'Thin');
INSERT INTO public.moon VALUES (16, 'Nereid', 0, false, 8, 'None');
INSERT INTO public.moon VALUES (17, 'Charon', 0, false, 10, 'Thin');
INSERT INTO public.moon VALUES (18, 'Hydra', 0, false, 10, 'None');
INSERT INTO public.moon VALUES (19, 'Nix', 0, false, 10, 'None');
INSERT INTO public.moon VALUES (20, 'Kerberos', 0, false, 10, 'None');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 1.0, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 1.5, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, 0.7, 1);
INSERT INTO public.planet VALUES (4, 'Mercury', 0, false, 0.4, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 11, false, 5.2, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 9, false, 9.5, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4, false, 19.2, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4, false, 30.1, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 1, NULL, 0.05, 2);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 2, NULL, 0.15, 5);
INSERT INTO public.planet VALUES (11, 'Alpha Centauri Bc', 1, NULL, 0.22, 6);
INSERT INTO public.planet VALUES (12, 'Proxima c', 1, NULL, 1.49, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4.6, 'G-type', true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.85, 'M-type', true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8.0, 'Red Supergiant', false, 2);
INSERT INTO public.star VALUES (4, 'Sirius', 0.3, 'A-type', true, 3);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 5.0, 'G-type', true, 1);
INSERT INTO public.star VALUES (6, 'Alpha Centauri B', 5.0, 'K-type', true, 1);


--
-- Data for Name: universe_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe_info VALUES (1, 'Big Bang', 'The origin event of the universe', 10, true);
INSERT INTO public.universe_info VALUES (2, 'Dark Matter', 'A form of matter thought to account for approximately 85% of the matter in the universe', 8, false);
INSERT INTO public.universe_info VALUES (3, 'Cosmic Microwave Background', 'Thermal radiation left over from the time of recombination in Big Bang cosmology', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: universe_info_universe_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_info_universe_info_id_seq', 3, true);


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
-- Name: universe_info universe_info_info_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_info
    ADD CONSTRAINT universe_info_info_key UNIQUE (info);


--
-- Name: universe_info universe_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_info
    ADD CONSTRAINT universe_info_pkey PRIMARY KEY (universe_info_id);


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

