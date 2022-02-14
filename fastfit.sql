--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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
-- Name: clients; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.clients (
    id character varying NOT NULL,
    name character varying NOT NULL,
    username character varying NOT NULL,
    age integer,
    email character varying NOT NULL,
    password character varying NOT NULL,
    height character varying,
    weight character varying,
    worksheet json
);


ALTER TABLE public.clients OWNER TO admin;

--
-- Name: exercice; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.exercice (
    id character varying NOT NULL,
    name character varying NOT NULL,
    muscular_group character varying NOT NULL,
    image character varying,
    exercice_id integer NOT NULL
);


ALTER TABLE public.exercice OWNER TO admin;

--
-- Name: personal; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.personal (
    id character varying NOT NULL,
    name character varying NOT NULL,
    username character varying NOT NULL,
    age integer,
    email character varying NOT NULL,
    password character varying NOT NULL,
    list_of_client character varying[]
);


ALTER TABLE public.personal OWNER TO admin;

--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.clients (id, name, username, age, email, password, height, weight, worksheet) FROM stdin;
409d9d9f-6526-46c9-b101-42541562a24a	Amanda	xuba	0	xuba@email.com	senha123	0	0	\N
12837388-6a00-4202-bb12-3baca5c67d90	Casimiro	cazenerdola	0	caze@vasco.com	gigantedacolina	0	0	\N
\.


--
-- Data for Name: exercice; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.exercice (id, name, muscular_group, image, exercice_id) FROM stdin;
e66f12c4-c7af-4a28-ad87-008a34a4b0ba	Supino Reto	peito		0
\.


--
-- Data for Name: personal; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.personal (id, name, username, age, email, password, list_of_client) FROM stdin;
29e61fca-0dc2-445e-b253-baa7a87487f0	Joanderson	josantos	0	joanderson@bodybuilder.com	durateston123	\N
\.


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: exercice exercice_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.exercice
    ADD CONSTRAINT exercice_pkey PRIMARY KEY (id);


--
-- Name: personal personal_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

