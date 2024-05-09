--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11
-- Dumped by pg_dump version 14.11

-- Started on 2024-05-07 18:23:41 -04

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

--
-- TOC entry 210 (class 1259 OID 16622)
-- Name: seq_cliente_id_cliente; Type: SEQUENCE; Schema: public; Owner: devsu-test
--

CREATE SEQUENCE public.seq_cliente_id_cliente
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.seq_cliente_id_cliente OWNER TO "devsu-test";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16646)
-- Name: cliente; Type: TABLE; Schema: public; Owner: devsu-test
--

CREATE TABLE public.cliente (
    id_cliente bigint DEFAULT nextval('public.seq_cliente_id_cliente'::regclass) NOT NULL,
    contrasena character varying(16) NOT NULL,
    estado boolean DEFAULT false NOT NULL,
    id_persona bigint NOT NULL
);


ALTER TABLE public.cliente OWNER TO "devsu-test";

--
-- TOC entry 211 (class 1259 OID 16623)
-- Name: seq_cuenta_id_cuenta; Type: SEQUENCE; Schema: public; Owner: devsu-test
--

CREATE SEQUENCE public.seq_cuenta_id_cuenta
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.seq_cuenta_id_cuenta OWNER TO "devsu-test";

--
-- TOC entry 218 (class 1259 OID 16653)
-- Name: cuenta; Type: TABLE; Schema: public; Owner: devsu-test
--

CREATE TABLE public.cuenta (
    id_cuenta bigint DEFAULT nextval('public.seq_cuenta_id_cuenta'::regclass) NOT NULL,
    numero_cuenta character varying(16) NOT NULL,
    id_tipo_cuenta integer NOT NULL,
    saldo bigint NOT NULL,
    estado boolean DEFAULT false NOT NULL,
    id_cliente bigint NOT NULL
);


ALTER TABLE public.cuenta OWNER TO "devsu-test";

--
-- TOC entry 213 (class 1259 OID 16625)
-- Name: genero; Type: TABLE; Schema: public; Owner: devsu-test
--

CREATE TABLE public.genero (
    id_genero integer NOT NULL,
    abreviacion character(1) NOT NULL,
    descripcion character varying(16) NOT NULL
);


ALTER TABLE public.genero OWNER TO "devsu-test";

--
-- TOC entry 212 (class 1259 OID 16624)
-- Name: seq_movimiento_id_movimiento; Type: SEQUENCE; Schema: public; Owner: devsu-test
--

CREATE SEQUENCE public.seq_movimiento_id_movimiento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.seq_movimiento_id_movimiento OWNER TO "devsu-test";

--
-- TOC entry 219 (class 1259 OID 16660)
-- Name: movimiento; Type: TABLE; Schema: public; Owner: devsu-test
--

CREATE TABLE public.movimiento (
    id_movimiento bigint DEFAULT nextval('public.seq_movimiento_id_movimiento'::regclass) NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    id_tipo_movimiento integer NOT NULL,
    valor bigint NOT NULL,
    saldo_inicial bigint NOT NULL,
    id_cuenta bigint NOT NULL
);


ALTER TABLE public.movimiento OWNER TO "devsu-test";

--
-- TOC entry 209 (class 1259 OID 16621)
-- Name: seq_persona_id_persona; Type: SEQUENCE; Schema: public; Owner: devsu-test
--

CREATE SEQUENCE public.seq_persona_id_persona
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.seq_persona_id_persona OWNER TO "devsu-test";

--
-- TOC entry 216 (class 1259 OID 16640)
-- Name: persona; Type: TABLE; Schema: public; Owner: devsu-test
--

CREATE TABLE public.persona (
    id_persona bigint DEFAULT nextval('public.seq_persona_id_persona'::regclass) NOT NULL,
    nombre character varying(64) NOT NULL,
    edad integer NOT NULL,
    identificacion character varying(16) NOT NULL,
    direccion character varying(32) NOT NULL,
    telefono character varying(16) NOT NULL,
    id_genero integer NOT NULL
);


ALTER TABLE public.persona OWNER TO "devsu-test";

--
-- TOC entry 214 (class 1259 OID 16630)
-- Name: tipo_cuenta; Type: TABLE; Schema: public; Owner: devsu-test
--

CREATE TABLE public.tipo_cuenta (
    id_tipo_cuenta integer NOT NULL,
    descripcion character(16) NOT NULL
);


ALTER TABLE public.tipo_cuenta OWNER TO "devsu-test";

--
-- TOC entry 215 (class 1259 OID 16635)
-- Name: tipo_movimiento; Type: TABLE; Schema: public; Owner: devsu-test
--

CREATE TABLE public.tipo_movimiento (
    id_tipo_movimiento integer NOT NULL,
    descripcion character(16) NOT NULL
);


ALTER TABLE public.tipo_movimiento OWNER TO "devsu-test";

--
-- TOC entry 3637 (class 0 OID 16646)
-- Dependencies: 217
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: devsu-test
--

COPY public.cliente (id_cliente, contrasena, estado, id_persona) FROM stdin;
\.


--
-- TOC entry 3638 (class 0 OID 16653)
-- Dependencies: 218
-- Data for Name: cuenta; Type: TABLE DATA; Schema: public; Owner: devsu-test
--

COPY public.cuenta (id_cuenta, numero_cuenta, id_tipo_cuenta, saldo, estado, id_cliente) FROM stdin;
\.


--
-- TOC entry 3633 (class 0 OID 16625)
-- Dependencies: 213
-- Data for Name: genero; Type: TABLE DATA; Schema: public; Owner: devsu-test
--

COPY public.genero (id_genero, abreviacion, descripcion) FROM stdin;
\.


--
-- TOC entry 3639 (class 0 OID 16660)
-- Dependencies: 219
-- Data for Name: movimiento; Type: TABLE DATA; Schema: public; Owner: devsu-test
--

COPY public.movimiento (id_movimiento, fecha, id_tipo_movimiento, valor, saldo_inicial, id_cuenta) FROM stdin;
\.


--
-- TOC entry 3636 (class 0 OID 16640)
-- Dependencies: 216
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: devsu-test
--

COPY public.persona (id_persona, nombre, edad, identificacion, direccion, telefono, id_genero) FROM stdin;
\.


--
-- TOC entry 3634 (class 0 OID 16630)
-- Dependencies: 214
-- Data for Name: tipo_cuenta; Type: TABLE DATA; Schema: public; Owner: devsu-test
--

COPY public.tipo_cuenta (id_tipo_cuenta, descripcion) FROM stdin;
\.


--
-- TOC entry 3635 (class 0 OID 16635)
-- Dependencies: 215
-- Data for Name: tipo_movimiento; Type: TABLE DATA; Schema: public; Owner: devsu-test
--

COPY public.tipo_movimiento (id_tipo_movimiento, descripcion) FROM stdin;
\.


--
-- TOC entry 3645 (class 0 OID 0)
-- Dependencies: 210
-- Name: seq_cliente_id_cliente; Type: SEQUENCE SET; Schema: public; Owner: devsu-test
--

SELECT pg_catalog.setval('public.seq_cliente_id_cliente', 1, false);


--
-- TOC entry 3646 (class 0 OID 0)
-- Dependencies: 211
-- Name: seq_cuenta_id_cuenta; Type: SEQUENCE SET; Schema: public; Owner: devsu-test
--

SELECT pg_catalog.setval('public.seq_cuenta_id_cuenta', 1, false);


--
-- TOC entry 3647 (class 0 OID 0)
-- Dependencies: 212
-- Name: seq_movimiento_id_movimiento; Type: SEQUENCE SET; Schema: public; Owner: devsu-test
--

SELECT pg_catalog.setval('public.seq_movimiento_id_movimiento', 1, false);


--
-- TOC entry 3648 (class 0 OID 0)
-- Dependencies: 209
-- Name: seq_persona_id_persona; Type: SEQUENCE SET; Schema: public; Owner: devsu-test
--

SELECT pg_catalog.setval('public.seq_persona_id_persona', 1, false);


--
-- TOC entry 3474 (class 2606 OID 16652)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: devsu-test
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 3477 (class 2606 OID 16659)
-- Name: cuenta cuenta_pkey; Type: CONSTRAINT; Schema: public; Owner: devsu-test
--

ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT cuenta_pkey PRIMARY KEY (id_cuenta);


--
-- TOC entry 3465 (class 2606 OID 16629)
-- Name: genero genero_pkey; Type: CONSTRAINT; Schema: public; Owner: devsu-test
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT genero_pkey PRIMARY KEY (id_genero);


--
-- TOC entry 3483 (class 2606 OID 16666)
-- Name: movimiento movimiento_pkey; Type: CONSTRAINT; Schema: public; Owner: devsu-test
--

ALTER TABLE ONLY public.movimiento
    ADD CONSTRAINT movimiento_pkey PRIMARY KEY (id_movimiento);


--
-- TOC entry 3472 (class 2606 OID 16645)
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: devsu-test
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id_persona);


--
-- TOC entry 3467 (class 2606 OID 16634)
-- Name: tipo_cuenta tipo_cuenta_pkey; Type: CONSTRAINT; Schema: public; Owner: devsu-test
--

ALTER TABLE ONLY public.tipo_cuenta
    ADD CONSTRAINT tipo_cuenta_pkey PRIMARY KEY (id_tipo_cuenta);


--
-- TOC entry 3469 (class 2606 OID 16639)
-- Name: tipo_movimiento tipo_movimiento_pkey; Type: CONSTRAINT; Schema: public; Owner: devsu-test
--

ALTER TABLE ONLY public.tipo_movimiento
    ADD CONSTRAINT tipo_movimiento_pkey PRIMARY KEY (id_tipo_movimiento);


--
-- TOC entry 3475 (class 1259 OID 16678)
-- Name: fki_fk_cliente_id_persona; Type: INDEX; Schema: public; Owner: devsu-test
--

CREATE INDEX fki_fk_cliente_id_persona ON public.cliente USING btree (id_persona);


--
-- TOC entry 3478 (class 1259 OID 16690)
-- Name: fki_fk_cuenta_id_cliente; Type: INDEX; Schema: public; Owner: devsu-test
--

CREATE INDEX fki_fk_cuenta_id_cliente ON public.cuenta USING btree (id_cliente);


--
-- TOC entry 3479 (class 1259 OID 16684)
-- Name: fki_fk_cuenta_id_tipo_cuenta; Type: INDEX; Schema: public; Owner: devsu-test
--

CREATE INDEX fki_fk_cuenta_id_tipo_cuenta ON public.cuenta USING btree (id_tipo_cuenta);


--
-- TOC entry 3480 (class 1259 OID 16702)
-- Name: fki_fk_movimiento_id_cuenta; Type: INDEX; Schema: public; Owner: devsu-test
--

CREATE INDEX fki_fk_movimiento_id_cuenta ON public.movimiento USING btree (id_cuenta);


--
-- TOC entry 3481 (class 1259 OID 16696)
-- Name: fki_fk_movimiento_id_tipo_movimiento; Type: INDEX; Schema: public; Owner: devsu-test
--

CREATE INDEX fki_fk_movimiento_id_tipo_movimiento ON public.movimiento USING btree (id_tipo_movimiento);


--
-- TOC entry 3470 (class 1259 OID 16672)
-- Name: fki_fk_perdona_id_genero; Type: INDEX; Schema: public; Owner: devsu-test
--

CREATE INDEX fki_fk_perdona_id_genero ON public.persona USING btree (id_genero);


--
-- TOC entry 3485 (class 2606 OID 16673)
-- Name: cliente fk_cliente_id_persona; Type: FK CONSTRAINT; Schema: public; Owner: devsu-test
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_cliente_id_persona FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona) NOT VALID;


--
-- TOC entry 3487 (class 2606 OID 16685)
-- Name: cuenta fk_cuenta_id_cliente; Type: FK CONSTRAINT; Schema: public; Owner: devsu-test
--

ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT fk_cuenta_id_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente) NOT VALID;


--
-- TOC entry 3486 (class 2606 OID 16679)
-- Name: cuenta fk_cuenta_id_tipo_cuenta; Type: FK CONSTRAINT; Schema: public; Owner: devsu-test
--

ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT fk_cuenta_id_tipo_cuenta FOREIGN KEY (id_tipo_cuenta) REFERENCES public.tipo_cuenta(id_tipo_cuenta) NOT VALID;


--
-- TOC entry 3489 (class 2606 OID 16697)
-- Name: movimiento fk_movimiento_id_cuenta; Type: FK CONSTRAINT; Schema: public; Owner: devsu-test
--

ALTER TABLE ONLY public.movimiento
    ADD CONSTRAINT fk_movimiento_id_cuenta FOREIGN KEY (id_cuenta) REFERENCES public.cuenta(id_cuenta) NOT VALID;


--
-- TOC entry 3488 (class 2606 OID 16691)
-- Name: movimiento fk_movimiento_id_tipo_movimiento; Type: FK CONSTRAINT; Schema: public; Owner: devsu-test
--

ALTER TABLE ONLY public.movimiento
    ADD CONSTRAINT fk_movimiento_id_tipo_movimiento FOREIGN KEY (id_tipo_movimiento) REFERENCES public.tipo_movimiento(id_tipo_movimiento) NOT VALID;


--
-- TOC entry 3484 (class 2606 OID 16667)
-- Name: persona fk_perdona_id_genero; Type: FK CONSTRAINT; Schema: public; Owner: devsu-test
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT fk_perdona_id_genero FOREIGN KEY (id_genero) REFERENCES public.genero(id_genero) NOT VALID;


-- Completed on 2024-05-07 18:23:41 -04

--
-- PostgreSQL database dump complete
--

