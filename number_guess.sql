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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    guess_total integer NOT NULL,
    user_id integer
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
-- Name: user_names; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_names (
    name character varying(22),
    user_id integer NOT NULL
);


ALTER TABLE public.user_names OWNER TO freecodecamp;

--
-- Name: user_names_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_names_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_names_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_names_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_names_user_id_seq OWNED BY public.user_names.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: user_names user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_names ALTER COLUMN user_id SET DEFAULT nextval('public.user_names_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (3695, 10, 142);
INSERT INTO public.games VALUES (3696, 367, 143);
INSERT INTO public.games VALUES (3697, 411, 143);
INSERT INTO public.games VALUES (3698, 714, 144);
INSERT INTO public.games VALUES (3699, 773, 144);
INSERT INTO public.games VALUES (3700, 393, 143);
INSERT INTO public.games VALUES (3701, 372, 143);
INSERT INTO public.games VALUES (3702, 110, 143);
INSERT INTO public.games VALUES (3703, 914, 145);
INSERT INTO public.games VALUES (3704, 240, 145);
INSERT INTO public.games VALUES (3705, 459, 146);
INSERT INTO public.games VALUES (3706, 367, 146);
INSERT INTO public.games VALUES (3707, 631, 145);
INSERT INTO public.games VALUES (3708, 248, 145);
INSERT INTO public.games VALUES (3709, 846, 145);
INSERT INTO public.games VALUES (3710, 675, 147);
INSERT INTO public.games VALUES (3711, 439, 147);
INSERT INTO public.games VALUES (3712, 40, 148);
INSERT INTO public.games VALUES (3713, 33, 148);
INSERT INTO public.games VALUES (3714, 401, 147);
INSERT INTO public.games VALUES (3715, 23, 147);
INSERT INTO public.games VALUES (3716, 502, 147);


--
-- Data for Name: user_names; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_names VALUES ('bob', 142);
INSERT INTO public.user_names VALUES ('user_1673802227389', 143);
INSERT INTO public.user_names VALUES ('user_1673802227388', 144);
INSERT INTO public.user_names VALUES ('user_1673802311645', 145);
INSERT INTO public.user_names VALUES ('user_1673802311644', 146);
INSERT INTO public.user_names VALUES ('user_1673802422118', 147);
INSERT INTO public.user_names VALUES ('user_1673802422117', 148);
INSERT INTO public.user_names VALUES ('cece', 141);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 3716, true);


--
-- Name: user_names_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_names_user_id_seq', 148, true);


--
-- Name: user_names user_names_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_names
    ADD CONSTRAINT user_names_name_key UNIQUE (name);


--
-- Name: user_names user_names_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_names
    ADD CONSTRAINT user_names_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_names(user_id);


--
-- PostgreSQL database dump complete
--

