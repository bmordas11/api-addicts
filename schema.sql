--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: api_tags; Type: TABLE; Schema: public; Owner: Misigno
--

CREATE TABLE api_tags (
    id integer NOT NULL,
    api_id integer NOT NULL,
    tag_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE api_tags OWNER TO "Misigno";

--
-- Name: api_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: Misigno
--

CREATE SEQUENCE api_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE api_tags_id_seq OWNER TO "Misigno";

--
-- Name: api_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Misigno
--

ALTER SEQUENCE api_tags_id_seq OWNED BY api_tags.id;


--
-- Name: apis; Type: TABLE; Schema: public; Owner: Misigno
--

CREATE TABLE apis (
    id integer NOT NULL,
    name character varying NOT NULL,
    url character varying NOT NULL,
    description text NOT NULL,
    paid boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE apis OWNER TO "Misigno";

--
-- Name: apis_id_seq; Type: SEQUENCE; Schema: public; Owner: Misigno
--

CREATE SEQUENCE apis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE apis_id_seq OWNER TO "Misigno";

--
-- Name: apis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Misigno
--

ALTER SEQUENCE apis_id_seq OWNED BY apis.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: Misigno
--

CREATE TABLE reviews (
    id integer NOT NULL,
    body text NOT NULL,
    rating integer NOT NULL,
    user_id integer NOT NULL,
    api_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE reviews OWNER TO "Misigno";

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: Misigno
--

CREATE SEQUENCE reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reviews_id_seq OWNER TO "Misigno";

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Misigno
--

ALTER SEQUENCE reviews_id_seq OWNED BY reviews.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: Misigno
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "Misigno";

--
-- Name: tags; Type: TABLE; Schema: public; Owner: Misigno
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE tags OWNER TO "Misigno";

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: Misigno
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_id_seq OWNER TO "Misigno";

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Misigno
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: Misigno
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE users OWNER TO "Misigno";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Misigno
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "Misigno";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Misigno
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Misigno
--

ALTER TABLE ONLY api_tags ALTER COLUMN id SET DEFAULT nextval('api_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Misigno
--

ALTER TABLE ONLY apis ALTER COLUMN id SET DEFAULT nextval('apis_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Misigno
--

ALTER TABLE ONLY reviews ALTER COLUMN id SET DEFAULT nextval('reviews_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Misigno
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Misigno
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: api_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: Misigno
--

ALTER TABLE ONLY api_tags
    ADD CONSTRAINT api_tags_pkey PRIMARY KEY (id);


--
-- Name: apis_pkey; Type: CONSTRAINT; Schema: public; Owner: Misigno
--

ALTER TABLE ONLY apis
    ADD CONSTRAINT apis_pkey PRIMARY KEY (id);


--
-- Name: reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: Misigno
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: Misigno
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: Misigno
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_apis_on_user_id; Type: INDEX; Schema: public; Owner: Misigno
--

CREATE INDEX index_apis_on_user_id ON apis USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: Misigno
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: Misigno
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: Misigno
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

