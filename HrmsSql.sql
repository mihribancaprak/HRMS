-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public.employers
(
    id integer NOT NULL,
    company_name character varying(30) NOT NULL,
    web_adress character varying(50) NOT NULL,
    phone_number character varying(30) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_positions
(
    id integer NOT NULL,
    name character varying NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_seekers
(
    id integer NOT NULL,
    user_id integer NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    nationality_id character varying(11) NOT NULL,
    birth_date date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."systemEmployes"
(
    id integer NOT NULL,
    user_id integer NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.users
(
    id integer NOT NULL,
    email character varying(30) NOT NULL,
    password character varying(30) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.verification
(
    id integer NOT NULL,
    verification_code integer NOT NULL,
    is_valid boolean NOT NULL,
    verification_date date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.verification_by_email
(
    id integer NOT NULL,
    verification_id integer NOT NULL,
    employers_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.verification_by_employees
(
    id integer NOT NULL,
    employers_id integer NOT NULL,
    system_employees_id integer NOT NULL,
    is_valid boolean NOT NULL,
    verification_date date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.verification_by_mernis
(
    id integer NOT NULL,
    job_seekers_id integer NOT NULL,
    verification_id integer NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE public.employers
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.job_seekers
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public."systemEmployes"
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.verification_by_email
    ADD FOREIGN KEY (id)
    REFERENCES public.employers (id)
    NOT VALID;


ALTER TABLE public.verification_by_email
    ADD FOREIGN KEY (id)
    REFERENCES public.verification (id)
    NOT VALID;


ALTER TABLE public.verification_by_employees
    ADD FOREIGN KEY (id)
    REFERENCES public.employers (id)
    NOT VALID;


ALTER TABLE public.verification_by_employees
    ADD FOREIGN KEY (id)
    REFERENCES public."systemEmployes" (id)
    NOT VALID;


ALTER TABLE public.verification_by_mernis
    ADD FOREIGN KEY (id)
    REFERENCES public.job_seekers (id)
    NOT VALID;


ALTER TABLE public.verification_by_mernis
    ADD FOREIGN KEY (id)
    REFERENCES public.verification (id)
    NOT VALID;

END;
