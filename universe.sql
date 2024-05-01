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
    name character varying NOT NULL,
    star integer NOT NULL,
    galaxy_constellation text NOT NULL,
    galaxy_inside character varying NOT NULL
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
    moon_has_life boolean NOT NULL,
    moon_has_water boolean NOT NULL
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
    star_id integer,
    planet_describe text,
    planet_number_of_moon integer,
    planet_distance_from_earth numeric NOT NULL,
    planet_has_life boolean NOT NULL,
    planet_is_spherical boolean NOT NULL,
    name character varying NOT NULL
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
-- Name: space_flight; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_flight (
    space_flight_id integer NOT NULL,
    name character varying,
    space_flight_spaceship character varying NOT NULL,
    planet_id integer,
    space_flight_number_of_members integer NOT NULL
);


ALTER TABLE public.space_flight OWNER TO freecodecamp;

--
-- Name: space_flight_space_flight_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_flight_space_flight_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_flight_space_flight_id_seq OWNER TO freecodecamp;

--
-- Name: space_flight_space_flight_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_flight_space_flight_id_seq OWNED BY public.space_flight.space_flight_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying,
    star_age_in_billions integer NOT NULL,
    star_temperature_in_celcius integer NOT NULL,
    galaxy_id integer
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
-- Name: space_flight space_flight_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_flight ALTER COLUMN space_flight_id SET DEFAULT nextval('public.space_flight_space_flight_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Droga mleczna', 3, 'Strzelec', 'N\A');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2, 'Andromeda', 'N\A');
INSERT INTO public.galaxy VALUES (3, 'Trojkat', 1, 'Trojkat', 'N\A');
INSERT INTO public.galaxy VALUES (4, 'Wielki obłok Magellana', 1, 'Doradca', 'Droga mleczna');
INSERT INTO public.galaxy VALUES (5, 'maly obłok Magellana', 1, 'Doradca', 'Droga mleczna');
INSERT INTO public.galaxy VALUES (6, 'Centaurus', 3, 'Centaur', 'N/a');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (3, 'Europa', 2, false, true);
INSERT INTO public.moon VALUES (5, 'Titan', 4, false, false);
INSERT INTO public.moon VALUES (6, 'Enceladus', 4, false, false);
INSERT INTO public.moon VALUES (7, 'Ganymede', 4, false, false);
INSERT INTO public.moon VALUES (8, 'Callisto', 4, false, false);
INSERT INTO public.moon VALUES (9, 'Triton', 5, false, false);
INSERT INTO public.moon VALUES (10, 'lo', 5, false, false);
INSERT INTO public.moon VALUES (11, 'Rhea', 5, false, false);
INSERT INTO public.moon VALUES (12, 'Dione', 5, false, false);
INSERT INTO public.moon VALUES (13, 'Tethys', 5, false, false);
INSERT INTO public.moon VALUES (14, 'Hyperion', 6, false, false);
INSERT INTO public.moon VALUES (15, 'Mimas', 6, false, false);
INSERT INTO public.moon VALUES (16, 'Phobos', 6, false, false);
INSERT INTO public.moon VALUES (17, 'Deimos', 6, false, false);
INSERT INTO public.moon VALUES (18, 'Lapetus', 6, false, false);
INSERT INTO public.moon VALUES (19, 'Charon', 6, false, false);
INSERT INTO public.moon VALUES (20, 'Miranda', 7, false, false);
INSERT INTO public.moon VALUES (21, 'Ariel', 7, false, false);
INSERT INTO public.moon VALUES (22, 'Umbriel', 8, false, false);
INSERT INTO public.moon VALUES (23, 'Titania', 8, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mały, skalisty, z zamarzniętą wodą pod powierzchnią', 2, 225, false, true, 'Mars');
INSERT INTO public.planet VALUES (2, 1, 'Jest największą planetą Układu Słonecznego', 80, 778, false, true, 'Jowisz');
INSERT INTO public.planet VALUES (4, 1, 'Znany z widocznych pierścieni, głównie z lodu i pyłu.', 80, 1400, false, true, 'Saturn');
INSERT INTO public.planet VALUES (5, 1, 'Planeta gazowa o lodowej skorupie', 27, 2900, false, true, 'Uran');
INSERT INTO public.planet VALUES (6, 1, 'Ostatnia gazowa planeta w Układzie Słonecznym.', 14, 4500, false, true, 'Neptun');
INSERT INTO public.planet VALUES (7, 1, 'Nasza planeta ', 1, 0, true, true, 'Ziemia');
INSERT INTO public.planet VALUES (8, 1, 'liższa Słońcu planeta, bez księżyców', 0, 91, false, true, 'Merkury');
INSERT INTO public.planet VALUES (9, 1, 'Planeta pokryta gęstą warstwą chmur kwasu siarkowego. ', 0, 42, false, true, 'Wenus');
INSERT INTO public.planet VALUES (10, 1, 'Planeta pokryta gęstą warstwą chmur kwasu siarkowego. ', 0, 42, false, true, 'Wenus1');
INSERT INTO public.planet VALUES (11, 1, 'Planeta pokryta gęstą warstwą chmur kwasu siarkowego. ', 0, 42, false, true, 'Wenus2');
INSERT INTO public.planet VALUES (12, 1, 'Planeta pokryta gęstą warstwą chmur kwasu siarkowego. ', 0, 42, false, true, 'Wenus3');
INSERT INTO public.planet VALUES (13, 1, 'Planeta pokryta gęstą warstwą chmur kwasu siarkowego. ', 0, 42, false, true, 'Wenus4');


--
-- Data for Name: space_flight; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_flight VALUES (1, 'CSM', 'Apollo', 4, 7);
INSERT INTO public.space_flight VALUES (2, 'Space Shuttle', 'challenger', 4, 2);
INSERT INTO public.space_flight VALUES (3, 'Voyager', 'Voyager 1', 4, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Slonce', 4600, 5500, 3);
INSERT INTO public.star VALUES (2, 'Sirius', 200000, 9940, 3);
INSERT INTO public.star VALUES (3, 'Betelgeza', 8000, 3500, 2);
INSERT INTO public.star VALUES (4, 'Rigel', 4506, 12000, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 4906, 2800, 6);
INSERT INTO public.star VALUES (6, 'Arcturus', 7000, 4290, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: space_flight_space_flight_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_flight_space_flight_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: space_flight space_flight_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_flight
    ADD CONSTRAINT space_flight_pkey PRIMARY KEY (space_flight_id);


--
-- Name: space_flight space_flight_space_flight_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_flight
    ADD CONSTRAINT space_flight_space_flight_id_key UNIQUE (space_flight_id);


--
-- Name: space_flight space_flight_space_flight_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_flight
    ADD CONSTRAINT space_flight_space_flight_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


--
-- Name: moon moon_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_foreign_key FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_foreign_key FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: space_flight space_flight_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_flight
    ADD CONSTRAINT space_flight_foreign_key FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_foreign_key FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

