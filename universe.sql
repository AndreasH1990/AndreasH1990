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
    name character varying(30) NOT NULL,
    size_in_lightyears numeric NOT NULL,
    number_of_stars_in_billion integer,
    discovery_date date NOT NULL
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
    name character varying(30) NOT NULL,
    size_in_kilometers numeric NOT NULL,
    visited_by_humans boolean,
    year_discovered integer NOT NULL,
    planet_id integer
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
    name character varying(30) NOT NULL,
    size_in_kilometers numeric NOT NULL,
    human_life boolean,
    description text,
    avg_temp_kelvin integer NOT NULL,
    star_id integer
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
    name character varying(30) NOT NULL,
    size_in_solar_radius numeric NOT NULL,
    galaxy_id integer,
    age_in_billion_years numeric
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
-- Name: visitors; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.visitors (
    visitors_id integer NOT NULL,
    name character varying(30) NOT NULL,
    moon_id integer,
    planet_id integer,
    star_id integer,
    galaxy_id integer
);


ALTER TABLE public.visitors OWNER TO freecodecamp;

--
-- Name: visitors_visitor_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.visitors_visitor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visitors_visitor_id_seq OWNER TO freecodecamp;

--
-- Name: visitors_visitor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.visitors_visitor_id_seq OWNED BY public.visitors.visitors_id;


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
-- Name: visitors visitors_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.visitors ALTER COLUMN visitors_id SET DEFAULT nextval('public.visitors_visitor_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 120000, 400, '0001-01-01');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 152000, 1000, '0964-01-01');
INSERT INTO public.galaxy VALUES (3, 'Phoenix Dwarf', 13, 1, '1976-01-01');
INSERT INTO public.galaxy VALUES (4, 'Messier 110', 15000, 1, '1773-08-10');
INSERT INTO public.galaxy VALUES (5, 'Sculptor Dwarf Galaxy', 10000, 1, '1937-01-01');
INSERT INTO public.galaxy VALUES (6, 'NGC 7317', 35000, 1, '1876-09-23');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384399, true, 0, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 9380, false, 1877, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 23460, false, 1877, 4);
INSERT INTO public.moon VALUES (4, 'Io', 421800, false, 1610, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 671100, false, 1610, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1070400, false, 1610, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1882700, false, 1610, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 181400, false, 1892, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 11461000, false, 1904, 5);
INSERT INTO public.moon VALUES (10, 'Elara', 11741000, false, 1905, 5);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 23624000, false, 1908, 5);
INSERT INTO public.moon VALUES (12, 'Sinope', 23939000, false, 1914, 5);
INSERT INTO public.moon VALUES (13, 'Lysithea', 11717000, false, 1938, 5);
INSERT INTO public.moon VALUES (14, 'Carme', 23404000, false, 1938, 5);
INSERT INTO public.moon VALUES (15, 'Ananke', 21276000, false, 1951, 5);
INSERT INTO public.moon VALUES (16, 'Leda', 11165000, false, 1974, 5);
INSERT INTO public.moon VALUES (17, 'Thebe', 221900, false, 1979, 5);
INSERT INTO public.moon VALUES (18, 'Adrastea', 129000, false, 1979, 5);
INSERT INTO public.moon VALUES (19, 'Metis', 128000, false, 1979, 5);
INSERT INTO public.moon VALUES (20, 'Callirrhoe', 24103000, false, 1999, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2439, false, '', 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 6051, false, '', 737, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 6378, true, '', 288, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3397, false, '', 0, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 71492, false, '', 165, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 60267, false, '', 135, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 25559, false, '', 76, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 24764, false, '', 73, 1);
INSERT INTO public.planet VALUES (13, '2M1207', 200000, false, '', 2550, 1);
INSERT INTO public.planet VALUES (14, 'Gliese 1214 B', 200000, false, '', 553, 1);
INSERT INTO public.planet VALUES (15, 'HD 20782 b', 200000, false, '', 5800, 1);
INSERT INTO public.planet VALUES (16, 'KELT-9b', 200000, false, '', 4050, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, 4.57);
INSERT INTO public.star VALUES (2, 'RSGC1-F01', 1450, 1, 0.012);
INSERT INTO public.star VALUES (3, 'VY Canis Majoris', 1420, 1, 0.008);
INSERT INTO public.star VALUES (4, 'AH Scorpii', 1411, 1, 12);
INSERT INTO public.star VALUES (5, 'S Persei', 1298, 1, 10);
INSERT INTO public.star VALUES (6, 'Alpheratz', 3, 2, 0.2);


--
-- Data for Name: visitors; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.visitors VALUES (1, 'Apollo 11', 1, NULL, NULL, NULL);
INSERT INTO public.visitors VALUES (2, 'Viking 1', NULL, 4, NULL, NULL);
INSERT INTO public.visitors VALUES (3, 'Venera 8', NULL, 2, NULL, NULL);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: visitors_visitor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.visitors_visitor_id_seq', 3, true);


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
-- Name: visitors unique_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.visitors
    ADD CONSTRAINT unique_id UNIQUE (visitors_id);


--
-- Name: visitors visitors_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.visitors
    ADD CONSTRAINT visitors_pkey PRIMARY KEY (visitors_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: visitors fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.visitors
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: visitors fk_moon_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.visitors
    ADD CONSTRAINT fk_moon_id FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: visitors fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.visitors
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: visitors fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.visitors
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

