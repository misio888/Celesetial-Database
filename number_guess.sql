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

ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_name_key;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO freecodecamp;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1717145332437', 0, NULL);
INSERT INTO public.users VALUES (2, 'user_1717145332436', 0, NULL);
INSERT INTO public.users VALUES (3, 'user_1717145866766', 0, 100);
INSERT INTO public.users VALUES (4, 'user_1717145866765', 0, 100);
INSERT INTO public.users VALUES (6, 'user_1717146056111', 0, 100);
INSERT INTO public.users VALUES (7, 'user_1717146056110', 0, 100);
INSERT INTO public.users VALUES (8, 'user_1717146212749', 0, 100);
INSERT INTO public.users VALUES (9, 'user_1717146212748', 0, 100);
INSERT INTO public.users VALUES (10, 'user_1717146282672', 0, 100);
INSERT INTO public.users VALUES (11, 'user_1717146282671', 0, 100);
INSERT INTO public.users VALUES (12, 'user_1717146319403', 0, 100);
INSERT INTO public.users VALUES (13, 'user_1717146319402', 0, 100);
INSERT INTO public.users VALUES (14, 'user_1717146337327', 0, 100);
INSERT INTO public.users VALUES (15, 'user_1717146337326', 0, 100);
INSERT INTO public.users VALUES (16, 'user_1717146350389', 0, 0);
INSERT INTO public.users VALUES (17, 'user_1717146350388', 0, 0);
INSERT INTO public.users VALUES (18, 'user_1717146479474', 0, 0);
INSERT INTO public.users VALUES (19, 'user_1717146479472', 0, 0);
INSERT INTO public.users VALUES (20, 'user_1717146556382', 0, 100);
INSERT INTO public.users VALUES (21, 'user_1717146556381', 0, 100);
INSERT INTO public.users VALUES (22, 'user_1717146597543', 0, 100);
INSERT INTO public.users VALUES (23, 'user_1717146597542', 0, 100);
INSERT INTO public.users VALUES (24, 'user_1717147116673', 0, 100);
INSERT INTO public.users VALUES (25, 'user_1717147116672', 0, 100);
INSERT INTO public.users VALUES (26, 'user_1717147137922', 0, 100);
INSERT INTO public.users VALUES (27, 'user_1717147137921', 0, 100);
INSERT INTO public.users VALUES (28, 'user_1717147183104', 0, 100);
INSERT INTO public.users VALUES (29, 'user_1717147183103', 0, 100);
INSERT INTO public.users VALUES (30, 'user_1717147453988', 0, 100);
INSERT INTO public.users VALUES (31, 'user_1717147453987', 0, 100);
INSERT INTO public.users VALUES (32, 'user_1717147980409', 0, 100);
INSERT INTO public.users VALUES (33, 'user_1717147980408', 0, 100);
INSERT INTO public.users VALUES (34, 'user_1717148172756', 0, 100);
INSERT INTO public.users VALUES (35, 'user_1717148172755', 0, 100);
INSERT INTO public.users VALUES (36, 'user_1717148685946', 0, 100);
INSERT INTO public.users VALUES (37, 'user_1717148685945', 0, 100);
INSERT INTO public.users VALUES (38, 'user_1717148753519', 0, 100);
INSERT INTO public.users VALUES (39, 'user_1717148753518', 0, 100);
INSERT INTO public.users VALUES (40, 'user_1717149198852', 0, 100);
INSERT INTO public.users VALUES (41, 'user_1717149198851', 0, 100);
INSERT INTO public.users VALUES (43, 'user_1717149586369', 2, 359);
INSERT INTO public.users VALUES (42, 'user_1717149586370', 5, 85);
INSERT INTO public.users VALUES (45, 'user_1717149619876', 2, 461);
INSERT INTO public.users VALUES (44, 'user_1717149619877', 5, 884);
INSERT INTO public.users VALUES (47, 'user_1717149685558', 2, 857);
INSERT INTO public.users VALUES (46, 'user_1717149685559', 5, 916);
INSERT INTO public.users VALUES (5, 'miki', 4, 2);
INSERT INTO public.users VALUES (49, 'user_1717149738521', 2, 974);
INSERT INTO public.users VALUES (48, 'user_1717149738522', 5, 811);
INSERT INTO public.users VALUES (51, 'user_1717149808601', 2, 562);
INSERT INTO public.users VALUES (50, 'user_1717149808602', 5, 819);
INSERT INTO public.users VALUES (53, 'user_1717149866223', 2, 983);
INSERT INTO public.users VALUES (52, 'user_1717149866224', 5, 790);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_id_seq', 53, true);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

