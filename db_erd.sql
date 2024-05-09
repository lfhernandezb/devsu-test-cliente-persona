-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.genero
(
    id_genero integer NOT NULL,
    abreviacion character(1) NOT NULL,
    descripcion character varying(16) NOT NULL,
    PRIMARY KEY (id_genero)
);

CREATE TABLE IF NOT EXISTS public.tipo_cuenta
(
    id_tipo_cuenta integer NOT NULL,
    descripcion character(16) NOT NULL,
    PRIMARY KEY (id_tipo_cuenta)
);

CREATE TABLE IF NOT EXISTS public.tipo_movimiento
(
    id_tipo_movimiento integer NOT NULL,
    descripcion character(16) NOT NULL,
    PRIMARY KEY (id_tipo_movimiento)
);

CREATE TABLE IF NOT EXISTS public.persona
(
    id_persona bigint NOT NULL DEFAULT nextval('seq_persona_id_persona'::regclass),
    nombre character varying(64) NOT NULL,
    edad integer NOT NULL,
    identificacion character varying(16) NOT NULL,
    direccion character varying(32) NOT NULL,
    telefono character varying(16) NOT NULL,
    id_genero integer NOT NULL,
    PRIMARY KEY (id_persona)
);

CREATE TABLE IF NOT EXISTS public.cliente
(
    id_cliente bigint NOT NULL DEFAULT nextval('seq_cliente_id_cliente'::regclass),
    contrasena character varying(16) NOT NULL,
    estado boolean NOT NULL DEFAULT false,
    id_persona bigint NOT NULL,
    PRIMARY KEY (id_cliente)
);

CREATE TABLE IF NOT EXISTS public.cuenta
(
    id_cuenta bigint NOT NULL DEFAULT nextval('seq_cuenta_id_cuenta'::regclass),
    numero_cuenta character varying(16) NOT NULL,
    id_tipo_cuenta integer NOT NULL,
    saldo bigint NOT NULL,
    estado boolean NOT NULL DEFAULT false,
    id_cliente bigint NOT NULL,
    PRIMARY KEY (id_cuenta)
);

CREATE TABLE IF NOT EXISTS public.movimiento
(
    id_movimiento bigint NOT NULL DEFAULT nextval('seq_movimiento_id_movimiento'::regclass),
    fecha timestamp with time zone NOT NULL DEFAULT now(),
    id_tipo_movimiento integer NOT NULL,
    valor bigint NOT NULL,
    saldo_inicial bigint NOT NULL,
    id_cuenta bigint NOT NULL,
    PRIMARY KEY (id_movimiento)
);

ALTER TABLE IF EXISTS public.persona
    ADD CONSTRAINT fk_perdona_id_genero FOREIGN KEY (id_genero)
    REFERENCES public.genero (id_genero) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_fk_perdona_id_genero
    ON public.persona(id_genero);


ALTER TABLE IF EXISTS public.cliente
    ADD CONSTRAINT fk_cliente_id_persona FOREIGN KEY (id_persona)
    REFERENCES public.persona (id_persona) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_fk_cliente_id_persona
    ON public.cliente(id_persona);


ALTER TABLE IF EXISTS public.cuenta
    ADD CONSTRAINT fk_cuenta_id_tipo_cuenta FOREIGN KEY (id_tipo_cuenta)
    REFERENCES public.tipo_cuenta (id_tipo_cuenta) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_fk_cuenta_id_tipo_cuenta
    ON public.cuenta(id_tipo_cuenta);


ALTER TABLE IF EXISTS public.cuenta
    ADD CONSTRAINT fk_cuenta_id_cliente FOREIGN KEY (id_cliente)
    REFERENCES public.cliente (id_cliente) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_fk_cuenta_id_cliente
    ON public.cuenta(id_cliente);


ALTER TABLE IF EXISTS public.movimiento
    ADD CONSTRAINT fk_movimiento_id_tipo_movimiento FOREIGN KEY (id_tipo_movimiento)
    REFERENCES public.tipo_movimiento (id_tipo_movimiento) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_fk_movimiento_id_tipo_movimiento
    ON public.movimiento(id_tipo_movimiento);


ALTER TABLE IF EXISTS public.movimiento
    ADD CONSTRAINT fk_movimiento_id_cuenta FOREIGN KEY (id_cuenta)
    REFERENCES public.cuenta (id_cuenta) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_fk_movimiento_id_cuenta
    ON public.movimiento(id_cuenta);

END;