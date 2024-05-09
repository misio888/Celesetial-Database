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

ALTER TABLE ONLY public.games DROP CONSTRAINT games_winner_id_fkey;
ALTER TABLE ONLY public.games DROP CONSTRAINT games_opponent_id_fkey;
ALTER TABLE ONLY public.teams DROP CONSTRAINT teams_pkey;
ALTER TABLE ONLY public.teams DROP CONSTRAINT teams_name_key;
ALTER TABLE ONLY public.games DROP CONSTRAINT games_pkey;
ALTER TABLE public.teams ALTER COLUMN team_id DROP DEFAULT;
ALTER TABLE public.games ALTER COLUMN game_id DROP DEFAULT;
DROP SEQUENCE public.teams_team_id_seq;
DROP TABLE public.teams;
DROP SEQUENCE public.games_game_id_seq;
DROP TABLE public.games;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (127, 2018, 'Final', 741, 742, 4, 2);
INSERT INTO public.games VALUES (128, 2018, 'Third Place', 743, 744, 2, 0);
INSERT INTO public.games VALUES (129, 2018, 'Semi-Final', 742, 744, 2, 1);
INSERT INTO public.games VALUES (130, 2018, 'Semi-Final', 741, 743, 1, 0);
INSERT INTO public.games VALUES (131, 2018, 'Quarter-Final', 742, 745, 3, 2);
INSERT INTO public.games VALUES (132, 2018, 'Quarter-Final', 744, 746, 2, 0);
INSERT INTO public.games VALUES (133, 2018, 'Quarter-Final', 743, 747, 2, 1);
INSERT INTO public.games VALUES (134, 2018, 'Quarter-Final', 741, 748, 2, 0);
INSERT INTO public.games VALUES (135, 2018, 'Eighth-Final', 744, 749, 2, 1);
INSERT INTO public.games VALUES (136, 2018, 'Eighth-Final', 746, 750, 1, 0);
INSERT INTO public.games VALUES (137, 2018, 'Eighth-Final', 743, 751, 3, 2);
INSERT INTO public.games VALUES (138, 2018, 'Eighth-Final', 747, 752, 2, 0);
INSERT INTO public.games VALUES (139, 2018, 'Eighth-Final', 742, 753, 2, 1);
INSERT INTO public.games VALUES (140, 2018, 'Eighth-Final', 745, 754, 2, 1);
INSERT INTO public.games VALUES (141, 2018, 'Eighth-Final', 748, 755, 2, 1);
INSERT INTO public.games VALUES (142, 2018, 'Eighth-Final', 741, 756, 4, 3);
INSERT INTO public.games VALUES (143, 2014, 'Final', 757, 756, 1, 0);
INSERT INTO public.games VALUES (144, 2014, 'Third Place', 758, 747, 3, 0);
INSERT INTO public.games VALUES (145, 2014, 'Semi-Final', 756, 758, 1, 0);
INSERT INTO public.games VALUES (146, 2014, 'Semi-Final', 757, 747, 7, 1);
INSERT INTO public.games VALUES (147, 2014, 'Quarter-Final', 758, 759, 1, 0);
INSERT INTO public.games VALUES (148, 2014, 'Quarter-Final', 756, 743, 1, 0);
INSERT INTO public.games VALUES (149, 2014, 'Quarter-Final', 747, 749, 2, 1);
INSERT INTO public.games VALUES (150, 2014, 'Quarter-Final', 757, 741, 1, 0);
INSERT INTO public.games VALUES (151, 2014, 'Eighth-Final', 747, 760, 2, 1);
INSERT INTO public.games VALUES (152, 2014, 'Eighth-Final', 749, 748, 2, 0);
INSERT INTO public.games VALUES (153, 2014, 'Eighth-Final', 741, 761, 2, 0);
INSERT INTO public.games VALUES (154, 2014, 'Eighth-Final', 757, 762, 2, 1);
INSERT INTO public.games VALUES (155, 2014, 'Eighth-Final', 758, 752, 2, 1);
INSERT INTO public.games VALUES (156, 2014, 'Eighth-Final', 759, 763, 2, 1);
INSERT INTO public.games VALUES (157, 2014, 'Eighth-Final', 756, 750, 1, 0);
INSERT INTO public.games VALUES (158, 2014, 'Eighth-Final', 743, 764, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (741, 'France');
INSERT INTO public.teams VALUES (742, 'Croatia');
INSERT INTO public.teams VALUES (743, 'Belgium');
INSERT INTO public.teams VALUES (744, 'England');
INSERT INTO public.teams VALUES (745, 'Russia');
INSERT INTO public.teams VALUES (746, 'Sweden');
INSERT INTO public.teams VALUES (747, 'Brazil');
INSERT INTO public.teams VALUES (748, 'Uruguay');
INSERT INTO public.teams VALUES (749, 'Colombia');
INSERT INTO public.teams VALUES (750, 'Switzerland');
INSERT INTO public.teams VALUES (751, 'Japan');
INSERT INTO public.teams VALUES (752, 'Mexico');
INSERT INTO public.teams VALUES (753, 'Denmark');
INSERT INTO public.teams VALUES (754, 'Spain');
INSERT INTO public.teams VALUES (755, 'Portugal');
INSERT INTO public.teams VALUES (756, 'Argentina');
INSERT INTO public.teams VALUES (757, 'Germany');
INSERT INTO public.teams VALUES (758, 'Netherlands');
INSERT INTO public.teams VALUES (759, 'Costa Rica');
INSERT INTO public.teams VALUES (760, 'Chile');
INSERT INTO public.teams VALUES (761, 'Nigeria');
INSERT INTO public.teams VALUES (762, 'Algeria');
INSERT INTO public.teams VALUES (763, 'Greece');
INSERT INTO public.teams VALUES (764, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 158, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 764, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

