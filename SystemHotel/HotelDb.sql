--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-15 02:06:01

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
-- TOC entry 229 (class 1259 OID 32950)
-- Name: booked_room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booked_room (
    fk_numbers_of_hotel integer NOT NULL,
    fk_user_id integer NOT NULL,
    date_check_in date NOT NULL,
    date_check_out date NOT NULL
);


ALTER TABLE public.booked_room OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 32898)
-- Name: categotyofhotels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categotyofhotels (
    category_id integer NOT NULL,
    category_value character varying(10) NOT NULL
);


ALTER TABLE public.categotyofhotels OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 32929)
-- Name: categotyofhotels_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categotyofhotels ALTER COLUMN category_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categotyofhotels_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 32884)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    city_id integer NOT NULL,
    fk_region_id integer NOT NULL,
    city_name character varying(100) NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 32896)
-- Name: cities_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cities ALTER COLUMN city_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cities_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 32869)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    country_id integer NOT NULL,
    country_name character varying(100) NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 32894)
-- Name: countries_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.countries ALTER COLUMN country_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.countries_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 32903)
-- Name: hotels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotels (
    hotel_id integer NOT NULL,
    fk_country_id integer NOT NULL,
    fk_region_id integer,
    fk_city_id integer NOT NULL,
    street_name character varying(200) NOT NULL,
    house_number integer NOT NULL,
    hotel_name character varying(100) NOT NULL,
    fk_hotel_category integer NOT NULL
);


ALTER TABLE public.hotels OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 32928)
-- Name: hotels_hotel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.hotels ALTER COLUMN hotel_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hotels_hotel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 32935)
-- Name: numbers_of_hotel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.numbers_of_hotel (
    number_id integer NOT NULL,
    fk_hotel_id integer NOT NULL,
    floor_number integer NOT NULL,
    number_room integer NOT NULL,
    fk_type_room integer NOT NULL,
    amount_seats integer NOT NULL,
    price integer NOT NULL,
    isavaiable boolean
);


ALTER TABLE public.numbers_of_hotel OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 32963)
-- Name: numbers_of_hotel_number_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.numbers_of_hotel ALTER COLUMN number_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.numbers_of_hotel_number_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 32874)
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    region_id integer NOT NULL,
    fk_country_id integer NOT NULL,
    region_name character varying(200) NOT NULL
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 32895)
-- Name: regions_region_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.regions ALTER COLUMN region_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.regions_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 32930)
-- Name: type_room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_room (
    type_room_id integer NOT NULL,
    type_room_name character varying(100) NOT NULL
);


ALTER TABLE public.type_room OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 32964)
-- Name: type_room_type_room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.type_room ALTER COLUMN type_room_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.type_room_type_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 32820)
-- Name: us_login_and_password; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.us_login_and_password (
    user_id integer NOT NULL,
    login text NOT NULL,
    pass character varying(64) NOT NULL
);


ALTER TABLE public.us_login_and_password OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 32837)
-- Name: us_login_and_password_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.us_login_and_password ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.us_login_and_password_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 32827)
-- Name: us_main_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.us_main_data (
    fk_user_id integer NOT NULL,
    last_name character varying(64) NOT NULL,
    first_name character varying(64) NOT NULL,
    middle_name character varying(64) NOT NULL,
    date_of_birth date NOT NULL
);


ALTER TABLE public.us_main_data OWNER TO postgres;

--
-- TOC entry 3402 (class 0 OID 32950)
-- Dependencies: 229
-- Data for Name: booked_room; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3396 (class 0 OID 32898)
-- Dependencies: 223
-- Data for Name: categotyofhotels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categotyofhotels (category_id, category_value) OVERRIDING SYSTEM VALUE VALUES (1, '*');
INSERT INTO public.categotyofhotels (category_id, category_value) OVERRIDING SYSTEM VALUE VALUES (2, '**');
INSERT INTO public.categotyofhotels (category_id, category_value) OVERRIDING SYSTEM VALUE VALUES (3, '***');
INSERT INTO public.categotyofhotels (category_id, category_value) OVERRIDING SYSTEM VALUE VALUES (4, '****');
INSERT INTO public.categotyofhotels (category_id, category_value) OVERRIDING SYSTEM VALUE VALUES (5, '*****');


--
-- TOC entry 3392 (class 0 OID 32884)
-- Dependencies: 219
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1, 19, 'Абаза');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2, 19, 'Абакан');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (3, 24, 'Абан');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (4, 72, 'Абатский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (5, 56, 'Абдулино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (6, 23, 'Абинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (7, 39, 'Авангардное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (8, 74, 'Агаповка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (9, 24, 'Агинское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (10, 16, 'Агрыз');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (11, 56, 'Адамовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (12, 23, 'Адлер');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (13, 69, 'Адреаполь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (14, 9, 'Адыге-Хабль');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (15, 1, 'Адыгейск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (16, 16, 'Азнакаево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (17, 61, 'Азов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (18, 55, 'Азово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (19, 11, 'Айкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (20, 11, 'Акбулак');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (21, 56, 'Акбулак');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (22, 61, 'Аксай');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (23, 89, 'Аксарка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (24, 16, 'Аксубаево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (25, 16, 'Актаныш');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (26, 39, 'Акулово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (27, 75, 'Акша');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (28, 2, 'Акъяр');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (29, 15, 'Алагир');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (30, 66, 'Алапаевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (31, 21, 'Алатырь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (32, 14, 'Алдан');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (33, 39, 'Алеевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (34, 22, 'Алейск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (35, 62, 'Александро-Невский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (36, 33, 'Александров');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (37, 64, 'Александров Гай');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (38, 39, 'Александровка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (39, 56, 'Александровка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (40, 59, 'Александровск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (41, 26, 'Александровское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (42, 70, 'Александровское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (43, 31, 'Алексеевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (44, 39, 'Алексеевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (45, 63, 'Алексеевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (46, 34, 'Алексеевская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (47, 16, 'Алексеевское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (48, 71, 'Алексин');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (49, 21, 'Аликово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (50, 18, 'Алнаши');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (51, 22, 'Алтайское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (52, 16, 'Алькеево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (53, 45, 'Альменево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (54, 16, 'Альметьевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (55, 14, 'Амга');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (56, 27, 'Амурск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (57, 87, 'Анадырь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (58, 23, 'Анапа');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (59, 38, 'Ангарск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (60, 42, 'Анжеро-Судженск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (61, 36, 'Анна');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (62, 44, 'Антропово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (63, 25, 'Анучино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (64, 16, 'Апастово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (65, 51, 'Апатиты');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (66, 23, 'Апшеронск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (67, 43, 'Арбаж');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (68, 74, 'Аргаяш');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (69, 20, 'Аргун');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (70, 13, 'Ардатов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (71, 52, 'Ардатов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (72, 15, 'Ардон');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (73, 52, 'Арзамас');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (74, 26, 'Арзгир');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (75, 64, 'Аркадак');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (76, 23, 'Армавир');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (77, 72, 'Армизонское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (78, 72, 'Аромашево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (79, 25, 'Арсеньев');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (80, 71, 'Арсеньево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (81, 16, 'Арск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (82, 25, 'Артем');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (83, 66, 'Артемовский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (84, 66, 'Арти');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (85, 29, 'Архангельск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (86, 2, 'Архангельское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (87, 71, 'Архангельское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (88, 15, 'Архонская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (89, 66, 'Асбест');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (90, 56, 'Асекеево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (91, 70, 'Асино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (92, 2, 'Аскарово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (93, 19, 'Аскиз');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (94, 2, 'Аскино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (95, 30, 'Астрахань');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (96, 64, 'Аткарск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (97, 16, 'Атня');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (98, 13, 'Атюрьево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (99, 13, 'Атяшево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (100, 30, 'Ахтубинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (101, 41, 'Ачайваям');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (102, 24, 'Ачинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (103, 75, 'Ачинское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (104, 66, 'Ачит');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (105, 20, 'Ачхой-Мартан');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (106, 74, 'Аша');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (107, 23, 'Аше');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (108, 27, 'Аян');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (109, 35, 'Бабаево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (110, 39, 'Бабушкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (111, 40, 'Бабынино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (112, 16, 'Бавлы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (113, 61, 'Багаевский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (114, 54, 'Баган');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (115, 39, 'Багратионово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (116, 39, 'Багратионовск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (117, 22, 'Баево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (118, 64, 'Базарный Карабулак');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (119, 73, 'Базарный Сызган');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (120, 66, 'Байкалово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (121, 4, 'Байконур');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (122, 2, 'Баймак');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (123, 2, 'Бакалы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (124, 7, 'Баксан');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (125, 70, 'Бакчар');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (126, 40, 'Балабаново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (127, 64, 'Балаково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (128, 52, 'Балахна');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (129, 24, 'Балахта');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (130, 64, 'Балашов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (131, 18, 'Балезино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (132, 64, 'Балтай');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (133, 16, 'Балтаси');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (134, 39, 'Балтийск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (135, 54, 'Барабинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (136, 3, 'Баргузин');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (137, 59, 'Барда');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (138, 22, 'Барнаул');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (139, 73, 'Барыш');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (140, 14, 'Батагай-Алыта');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (141, 61, 'Батайск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (142, 53, 'Батецкий');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (143, 21, 'Батырево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (144, 58, 'Башмаково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (145, 58, 'Беднодемьяновск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (146, 60, 'Бежаницы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (147, 69, 'Бежецк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (148, 63, 'Безенчук');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (149, 39, 'Бекенево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (150, 58, 'Беково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (151, 46, 'Белая');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (152, 23, 'Белая Глина');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (153, 61, 'Белая Калитва');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (154, 43, 'Белая Холуница');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (155, 31, 'Белгород');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (156, 2, 'Белебей');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (157, 75, 'Белебей');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (158, 71, 'Белев');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (159, 58, 'Белинский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (160, 39, 'Белкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (161, 42, 'Белово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (162, 28, 'Белогорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (163, 35, 'Белозерск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (164, 45, 'Белозерское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (165, 22, 'Белокуриха');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (166, 10, 'Беломорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (167, 2, 'Белорецк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (168, 23, 'Белореченск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (169, 66, 'Белоярский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (170, 86, 'Белоярский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (171, 69, 'Белый');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (172, 39, 'Белый яр');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (173, 70, 'Белый Яр');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (174, 19, 'Белый Яр');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (175, 56, 'Беляевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (176, 14, 'Бердигестях');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (177, 54, 'Бердск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (178, 72, 'Бердюжье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (179, 39, 'Береговое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (180, 29, 'Березник');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (181, 59, 'Березники');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (182, 39, 'Березовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (183, 24, 'Березовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (184, 59, 'Березовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (185, 86, 'Березово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (186, 42, 'Березовский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (187, 66, 'Березовский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (188, 15, 'Беслан');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (189, 58, 'Бессоновка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (190, 19, 'Бея');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (191, 2, 'Бижбуляк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (192, 22, 'Бийск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (193, 27, 'Бикин');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (194, 79, 'Биробиджан');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (195, 2, 'Бирск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (196, 24, 'Бирюлюсы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (197, 3, 'Бичура');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (198, 22, 'Благовещенка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (199, 28, 'Благовещенск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (200, 2, 'Благовещенск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (201, 26, 'Благодарный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (202, 39, 'Ближнее');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (203, 36, 'Бобров');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (204, 39, 'Богатово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (205, 16, 'Богатые Сабы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (206, 66, 'Богданович');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (207, 44, 'Боговарово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (208, 71, 'Богородицк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (209, 52, 'Богородск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (210, 43, 'Богородское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (211, 27, 'Богородское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (212, 24, 'Боготол');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (213, 19, 'Боград');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (214, 24, 'Богучаны');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (215, 36, 'Богучар');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (216, 61, 'Боковская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (217, 47, 'Бокситогорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (218, 16, 'Болгар');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (219, 69, 'Бологое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (220, 54, 'Болотное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (221, 57, 'Болхов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (222, 39, 'Большаково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (223, 63, 'Большая Глушица');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (224, 61, 'Большая Мартыновка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (225, 24, 'Большая Мурта');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (226, 39, 'Большая Поляна');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (227, 59, 'Большая Соснова');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (228, 63, 'Большая Черниговка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (229, 55, 'Большеречье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (230, 2, 'Большеустьикинское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (231, 13, 'Большие Березняки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (232, 39, 'Большие Горки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (233, 55, 'Большие Уки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (234, 52, 'Большое Болдино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (235, 13, 'Большое Игнатово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (236, 52, 'Большое Мурашкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (237, 73, 'Большое Нагаткино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (238, 39, 'Большое село');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (239, 76, 'Большое Село');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (240, 46, 'Большое Солдатское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (241, 72, 'Большое Сорокино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (242, 25, 'Большой Камень');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (243, 24, 'Большой Улуй');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (244, 8, 'Большой Царын');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (245, 68, 'Бондари');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (246, 52, 'Бор');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (247, 75, 'Борзя');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (248, 31, 'Борисовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (249, 36, 'Борисоглебск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (250, 76, 'Борисоглебский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (251, 53, 'Боровичи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (252, 40, 'Боровск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (253, 14, 'Борогонцы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (254, 24, 'Бородино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (255, 39, 'Борское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (256, 63, 'Борское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (257, 38, 'Братск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (258, 74, 'Бреды');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (259, 76, 'Брейтово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (260, 23, 'Брюховецкая');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (261, 32, 'Брянск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (262, 39, 'Брянское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (263, 16, 'Бугульма');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (264, 56, 'Бугуруслан');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (265, 26, 'Буденновск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (266, 2, 'Буздяк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (267, 56, 'Бузулук');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (268, 16, 'Буинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (269, 44, 'Буй');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (270, 2, 'Бураево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (271, 22, 'Бурла');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (272, 52, 'Бутурлино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (273, 36, 'Бутурлиновка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (274, 34, 'Быково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (275, 22, 'Быстрый Исток');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (276, 39, 'Бычково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (277, 18, 'Вавож');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (278, 72, 'Вагай');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (279, 52, 'Вад');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (280, 58, 'Вадинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (281, 53, 'Валдай');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (282, 31, 'Валуйки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (283, 27, 'Ванино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (284, 45, 'Варгаши');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (285, 23, 'Вардане');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (286, 74, 'Варна');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (287, 52, 'Варнавино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (288, 16, 'Васильево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (289, 39, 'Васильково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (290, 52, 'Вача');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (291, 20, 'Ведено');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (292, 31, 'Вейделевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (293, 67, 'Велиж');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (294, 60, 'Великие Луки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (295, 53, 'Великий Новгород');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (296, 35, 'Великий Устюг');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (297, 39, 'Великолукское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (298, 29, 'Вельск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (299, 54, 'Венгерово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (300, 71, 'Венев');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (301, 59, 'Верещагино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (302, 39, 'Верний бисер');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (303, 75, 'Верх-Усугли');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (304, 42, 'Верх-Чебула');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (305, 14, 'Верхневилюйск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (306, 74, 'Верхнеуральск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (307, 2, 'Верхнеяркеево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (308, 2, 'Верхние Киги');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (309, 37, 'Верхний Ландех');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (310, 36, 'Верхний Мамон');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (311, 16, 'Верхний Услон');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (312, 74, 'Верхний Уфалей');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (313, 66, 'Верхняя Пышма');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (314, 66, 'Верхняя Салда');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (315, 29, 'Верхняя Тойма');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (316, 36, 'Верхняя Хава');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (317, 35, 'Верховажье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (318, 57, 'Верховье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (319, 66, 'Верхотурье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (320, 43, 'Верхошижемье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (321, 61, 'Веселый');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (322, 39, 'Весново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (323, 52, 'Ветлуга');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (324, 61, 'Вешенская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (325, 73, 'Вешкайма');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (326, 39, 'Взморье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (327, 11, 'Визинга');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (328, 72, 'Викулово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (329, 14, 'Вилюйск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (330, 41, 'Вилючинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (331, 37, 'Вичуга');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (332, 39, 'Вишневка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (333, 39, 'Вишневое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (334, 39, 'Вишневское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (335, 39, 'Вишневый');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (336, 25, 'Владивосток');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (337, 15, 'Владикавказ');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (338, 33, 'Владимир');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (339, 25, 'Владимиро-Александровское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (340, 39, 'Владимирово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (341, 35, 'Вожега');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (342, 52, 'Вознесенское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (343, 34, 'Волгоград');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (344, 61, 'Волгодонск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (345, 44, 'Волгореченск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (346, 12, 'Волжск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (347, 34, 'Волжский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (348, 48, 'Волово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (349, 71, 'Волово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (350, 35, 'Вологда');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (351, 39, 'Володаровка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (352, 30, 'Володарский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (353, 50, 'Волоколамск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (354, 31, 'Волоконовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (355, 47, 'Волосово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (356, 53, 'Волот');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (357, 39, 'Волочаевское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (358, 47, 'Волхов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (359, 22, 'Волчиха');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (360, 25, 'Вольно-Надеждинское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (361, 39, 'Вольное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (362, 64, 'Вольск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (363, 11, 'Воркута');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (364, 36, 'Воробьевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (365, 39, 'Воробьево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (366, 36, 'Воронеж');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (367, 52, 'Воротынец');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (368, 50, 'Воскресенск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (369, 52, 'Воскресенское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (370, 64, 'Воскресенское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (371, 39, 'Восод');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (372, 18, 'Воткинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (373, 44, 'Вохма');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (374, 47, 'Всеволожск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (375, 11, 'Вуктыл');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (376, 21, 'Вурнары');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (377, 47, 'Выборг');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (378, 32, 'Выгоничи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (379, 52, 'Выкса');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (380, 11, 'Выльгорт');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (381, 11, 'Выльногорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (382, 23, 'Выселки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (383, 16, 'Высокая Гора');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (384, 39, 'Высокое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (385, 35, 'Вытегра');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (386, 69, 'Вышний Волочек');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (387, 27, 'Вяземский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (388, 67, 'Вязяма');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (389, 43, 'Вятские Поляны');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (390, 37, 'Гаврилов Посад');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (391, 76, 'Гаврилов-ям');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (392, 39, 'Гаврилово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (393, 67, 'Гагарин');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (394, 52, 'Гагино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (395, 56, 'Гай');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (396, 44, 'Галич');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (397, 22, 'Гальбштадт');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (398, 39, 'Гастеллово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (399, 47, 'Гатчина');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (400, 39, 'Гвардейск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (401, 39, 'Гвардейское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (402, 60, 'Гдов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (403, 23, 'Геленджик');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (404, 26, 'Георгиевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (405, 39, 'Георгиевское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (406, 44, 'Георгиевское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (407, 1, 'Гиагинская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (408, 18, 'Глазов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (409, 57, 'Глазуновка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (410, 67, 'Глинка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (411, 39, 'Глушково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (412, 46, 'Глушково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (413, 45, 'Глядянское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (414, 50, 'Голицыно');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (415, 39, 'Головкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (416, 72, 'Голышманово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (417, 39, 'Гончарово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (418, 32, 'Гордеевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (419, 39, 'Гордое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (420, 4, 'Горно-Алтайск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (421, 59, 'Горнозаводск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (422, 64, 'Горный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (423, 22, 'Горняк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (424, 52, 'Городец');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (425, 34, 'Городище');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (426, 58, 'Городище');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (427, 8, 'Городовиковск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (428, 33, 'Гороховец');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (429, 46, 'Горшечное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (430, 55, 'Горьковское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (431, 23, 'Горячий Ключ');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (432, 31, 'Грайворон');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (433, 18, 'Грахово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (434, 39, 'Грачевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (435, 56, 'Грачевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (436, 26, 'Грачевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (437, 59, 'Гремячинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (438, 36, 'Грибановский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (439, 39, 'Грибки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (440, 20, 'Грозный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (441, 39, 'Громово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (442, 48, 'Грязи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (443, 35, 'Грязовец');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (444, 59, 'Губаха');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (445, 31, 'Губкин');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (446, 72, 'Губкинский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (447, 20, 'Гудермес');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (448, 61, 'Гуково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (449, 23, 'Гулькевичи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (450, 39, 'Гурьевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (451, 42, 'Гурьевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (452, 39, 'Гусев');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (453, 39, 'Гусево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (454, 3, 'Гусиноозерск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (455, 33, 'Гусь Хрустальный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (456, 2, 'Давлеканово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (457, 45, 'Далматово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (458, 25, 'Дальнегорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (459, 39, 'Дальнее');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (460, 52, 'Дальнее Константиново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (461, 25, 'Дальнереченск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (462, 76, 'Данилов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (463, 34, 'Даниловка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (464, 48, 'Данков');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (465, 43, 'Даровский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (466, 39, 'Дворкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (467, 18, 'Дебесы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (468, 60, 'Дедовичи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (469, 67, 'Демидов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (470, 39, 'Демидово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (471, 53, 'Демянск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (472, 5, 'Дербент');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (473, 64, 'Дергачи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (474, 67, 'Десногорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (475, 24, 'Дзержинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (476, 52, 'Дзержинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (477, 52, 'Дивеево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (478, 24, 'Дивногорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (479, 39, 'Дивное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (480, 26, 'Дивное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (481, 15, 'Дигора');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (482, 73, 'Димитровград');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (483, 23, 'Динская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (484, 46, 'Дмитриев-Льговский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (485, 68, 'Дмитриевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (486, 50, 'Дмитров');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (487, 57, 'Дмитровск-Орловский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (488, 60, 'Дно');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (489, 48, 'Добринка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (490, 39, 'Доброволец');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (491, 39, 'Добровольск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (492, 48, 'Доброе');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (493, 59, 'Добрянка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (494, 39, 'Доваторовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (495, 54, 'Довольное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (496, 74, 'Долгодеревенское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (497, 39, 'Долгоруково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (498, 48, 'Долгоруково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (499, 56, 'Домбаровский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (500, 39, 'Домново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (501, 50, 'Домодедово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (502, 61, 'Донецк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (503, 71, 'Донской');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (504, 67, 'Дорогобуж');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (505, 39, 'Дорожное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (506, 16, 'Дрожжаное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (507, 39, 'Дружба');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (508, 13, 'Дубенки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (509, 50, 'Дубна');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (510, 71, 'Дубна');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (511, 34, 'Дубовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (512, 61, 'Дубовское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (513, 32, 'Дубровка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (514, 39, 'Дубровка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (515, 24, 'Дудинка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (516, 75, 'Дульдурга');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (517, 40, 'Думиничи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (518, 39, 'Дунаевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (519, 64, 'Духовницкое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (520, 67, 'Духовщина');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (521, 2, 'Дюртюли');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (522, 32, 'Дятьково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (523, 61, 'Егорлыкская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (524, 50, 'Егорьевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (525, 23, 'Ейск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (526, 66, 'Екатеринбург');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (527, 64, 'Екатериновка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (528, 16, 'Елабуга');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (529, 34, 'Елань');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (530, 48, 'Елец');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (531, 41, 'Елизово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (532, 59, 'Елово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (533, 39, 'Еловое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (534, 39, 'Ельники');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (535, 13, 'Ельники');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (536, 67, 'Ельня');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (537, 39, 'Ельняки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (538, 22, 'Ельцовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (539, 74, 'Еманжелинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (540, 11, 'Емва');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (541, 24, 'Емельяново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (542, 24, 'Енисейск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (543, 30, 'Енотаевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (544, 39, 'Ермаково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (545, 24, 'Ермаковское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (546, 2, 'Ермекеево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (547, 62, 'Ермишь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (548, 2, 'Ермолаево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (549, 67, 'Ершичи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (550, 64, 'Ершов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (551, 39, 'Ершово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (552, 26, 'Ессентуки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (553, 74, 'Еткуль');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (554, 71, 'Ефремов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (555, 39, 'Жаворонково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (556, 26, 'Железноводск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (557, 24, 'Железногорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (558, 46, 'Железногорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (559, 38, 'Железногорск-Илимский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (560, 39, 'Железнодорожный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (561, 39, 'Желудево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (562, 68, 'Жердевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (563, 63, 'Жигулевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (564, 40, 'Жиздра');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (565, 39, 'Жилино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (566, 32, 'Жиратино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (567, 34, 'Жирновск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (568, 32, 'Жуковка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (569, 40, 'Жуково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (570, 50, 'Жуковский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (571, 39, 'Журавлевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (572, 75, 'Забайкальск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (573, 39, 'Забарье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (574, 61, 'Заветное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (575, 28, 'Завитинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (576, 72, 'Заводоуковск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (577, 52, 'Заволжье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (578, 22, 'Завьялово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (579, 18, 'Завьялово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (580, 39, 'Загородный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (581, 39, 'Загорское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (582, 48, 'Задонск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (583, 16, 'Заинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (584, 39, 'Зайцево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (585, 3, 'Закаменск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (586, 38, 'Залари');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (587, 57, 'Залегощь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (588, 22, 'Залесово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (589, 39, 'Залесье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (590, 39, 'Заливино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (591, 39, 'Заливное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (592, 7, 'Залукокоаже');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (593, 39, 'Заовражное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (594, 24, 'Заозерный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (595, 51, 'Заозерск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (596, 39, 'Заозерье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (597, 71, 'Заокский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (598, 39, 'Заостровье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (599, 69, 'Западная Двина');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (600, 39, 'Западный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (601, 39, 'Заповедное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (602, 51, 'Заполярный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (603, 50, 'Зарайск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (604, 39, 'Заречное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (605, 66, 'Заречный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (606, 39, 'Заречье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (607, 22, 'Заринск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (608, 59, 'Звездный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (609, 12, 'Звенигово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (610, 50, 'Звенигород');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (611, 39, 'Звеньевое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (612, 39, 'Зверево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (613, 45, 'Звериноголовское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (614, 54, 'Здвинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (615, 24, 'Зеленогорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (616, 39, 'Зеленоградск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (617, 16, 'Зеленодольск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (618, 39, 'Зеленое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (619, 26, 'Зеленокумск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (620, 9, 'Зеленчукская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (621, 58, 'Земетчино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (622, 61, 'Зерноград');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (623, 28, 'Зея');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (624, 2, 'Зилаир');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (625, 38, 'Зима');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (626, 61, 'Зимовники');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (627, 74, 'Златоуст');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (628, 32, 'Злынка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (629, 22, 'Змеиногорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (630, 57, 'Змиевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (631, 39, 'Знаменка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (632, 68, 'Знаменка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (633, 30, 'Знаменск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (634, 39, 'Знаменск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (635, 55, 'Знаменское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (636, 57, 'Знаменское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (637, 20, 'Знаменское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (638, 46, 'Золотухино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (639, 22, 'Зональное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (640, 39, 'Зорино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (641, 13, 'Зубова Поляна');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (642, 69, 'Зубцов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (643, 43, 'Зуевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (644, 70, 'Зырянское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (645, 21, 'Ибреси');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (646, 28, 'Ивановка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (647, 37, 'Иваново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (648, 64, 'Ивантеевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (649, 66, 'Ивдель');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (650, 31, 'Ивня');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (651, 3, 'Иволгинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (652, 2, 'Иглино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (653, 18, 'Игра');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (654, 24, 'Идринское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (655, 18, 'Ижевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (656, 11, 'Ижма');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (657, 42, 'Ижморский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (658, 39, 'Извилино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (659, 48, 'Измалково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (660, 39, 'Изобильное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (661, 26, 'Изобильный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (662, 8, 'Ики-Бурул');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (663, 30, 'Икряное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (664, 24, 'Иланский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (665, 56, 'Илек');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (666, 34, 'Иловля');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (667, 59, 'Ильинский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (668, 29, 'Ильинско-Подомское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (669, 37, 'Ильинское-Хованское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (670, 39, 'Ильичевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (671, 39, 'Илюшино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (672, 68, 'Инжавино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (673, 73, 'Инза');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (674, 13, 'Инсар');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (675, 11, 'Инта');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (676, 26, 'Ипатово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (677, 24, 'Ирбейское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (678, 66, 'Ирбит');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (679, 38, 'Иркутск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (680, 63, 'Исаклы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (681, 39, 'Исаково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (682, 72, 'Исетское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (683, 55, 'Исилькуль');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (684, 54, 'Искитим');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (685, 58, 'Исса');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (686, 50, 'Истра');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (687, 39, 'Истровка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (688, 2, 'Исянгулово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (689, 73, 'Ишеевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (690, 72, 'Ишим');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (691, 2, 'Ишимбай');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (692, 12, 'Йошкар-ола');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (693, 25, 'Кавалерово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (694, 23, 'Кавказская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (695, 61, 'Кагальницкая');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (696, 62, 'Кадом');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (697, 13, 'Кадошкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (698, 35, 'Кадуй');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (699, 44, 'Кадый');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (700, 72, 'Казанское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (701, 16, 'Казань');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (702, 38, 'Казачинское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (703, 24, 'Казачинское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (704, 16, 'Кайбицы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (705, 36, 'Калач');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (706, 34, 'Калач-на-дону');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (707, 55, 'Калачинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (708, 75, 'Калга');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (709, 10, 'Калевала');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (710, 39, 'Калининград');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (711, 39, 'Калинино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (712, 64, 'Калининск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (713, 23, 'Калининская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (714, 39, 'Калининское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (715, 39, 'Калинково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (716, 39, 'Калиновка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (717, 22, 'Калманка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (718, 2, 'Калтасы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (719, 40, 'Калуга');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (720, 39, 'Калужское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (721, 69, 'Калязин');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (722, 18, 'Камбарка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (723, 36, 'Каменка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (724, 39, 'Каменка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (725, 58, 'Каменка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (726, 61, 'Каменоломни');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (727, 61, 'Каменск- Шахтинский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (728, 66, 'Каменск-Уральский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (729, 39, 'Каменское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (730, 41, 'Каменское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (731, 22, 'Камень-на-Оби');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (732, 25, 'Камень-Рыболов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (733, 33, 'Камешково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (734, 16, 'Камское Устье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (735, 30, 'Камызяк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (736, 34, 'Камышин');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (737, 66, 'Камышлов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (738, 39, 'Канаш');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (739, 21, 'Канаш');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (740, 51, 'Кандалакша');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (741, 23, 'Каневская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (742, 24, 'Канск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (743, 36, 'Кантемировка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (744, 75, 'Кара');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (745, 74, 'Карабаш');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (746, 62, 'Караблино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (747, 59, 'Карагай');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (748, 2, 'Караидель');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (749, 18, 'Каракулино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (750, 39, 'Карамышево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (751, 54, 'Карасук');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (752, 24, 'Каратузское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (753, 32, 'Карачев');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (754, 45, 'Каргаполье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (755, 70, 'Каргасок');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (756, 54, 'Каргат');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (757, 29, 'Каргополь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (758, 67, 'Кардымово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (759, 2, 'Кармаскалы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (760, 66, 'Карпинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (761, 29, 'Карпогоры');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (762, 73, 'Карсун');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (763, 74, 'Карталы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (764, 75, 'Карымская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (765, 62, 'Касимов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (766, 74, 'Касли');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (767, 8, 'Каспийский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (768, 46, 'Касторное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (769, 5, 'Касумкент');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (770, 74, 'Катав-Ивановск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (771, 45, 'Катайск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (772, 66, 'Качканар');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (773, 61, 'Кашары');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (774, 69, 'Кашин');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (775, 36, 'Каширское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (776, 39, 'Каштановка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (777, 39, 'Каштаново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (778, 56, 'Кваркено');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (779, 24, 'Кедровый');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (780, 18, 'Кез');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (781, 42, 'Кемерово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (782, 13, 'Кемля');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (783, 10, 'Кемь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (784, 45, 'Кетово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (785, 8, 'Кетченеры');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (786, 3, 'Кижинга');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (787, 59, 'Кизел');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (788, 74, 'Кизильское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (789, 5, 'Кизляр');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (790, 18, 'Кизнер');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (791, 34, 'Киквидзе');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (792, 43, 'Кикнур');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (793, 12, 'Килемары');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (794, 43, 'Кильмезь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (795, 71, 'Кимовск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (796, 69, 'Кимры');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (797, 47, 'Кингесепп');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (798, 63, 'Кинель');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (799, 63, 'Кинель-Черкасы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (800, 37, 'Кинешма');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (801, 2, 'Киргиз-Мияки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (802, 71, 'Киреевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (803, 38, 'Киренск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (804, 33, 'Киржач');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (805, 35, 'Кириллов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (806, 47, 'Кириши');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (807, 40, 'Киров');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (808, 43, 'Киров');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (809, 39, 'Кирова');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (810, 66, 'Кировград');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (811, 43, 'Кирово-Чепецк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (812, 47, 'Кировск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (813, 51, 'Кировск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (814, 25, 'Кировский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (815, 43, 'Кирс');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (816, 68, 'Кирсанов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (817, 42, 'Киселевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (818, 26, 'Кисловодск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (819, 35, 'Кичменгский Городок');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (820, 18, 'Киясово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (821, 39, 'Кленовое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (822, 32, 'Клетня');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (823, 34, 'Клетский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (824, 39, 'Климовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (825, 32, 'Климово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (826, 50, 'Клин');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (827, 32, 'Клинцы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (828, 22, 'Ключи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (829, 41, 'Ключи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (830, 63, 'Клявлино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (831, 52, 'Княгинино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (832, 51, 'Ковдор');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (833, 52, 'Ковернино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (834, 33, 'Ковров');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (835, 39, 'Коврово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (836, 13, 'Ковылкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (837, 86, 'Когалым');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (838, 24, 'Кодинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (839, 70, 'Кожевниково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (840, 40, 'Козельск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (841, 21, 'Козловка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (842, 24, 'Козулька');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (843, 12, 'Козьмодемьянск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (844, 11, 'Койгородок');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (845, 51, 'Кола');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (846, 44, 'Кологрив');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (847, 50, 'Коломна');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (848, 39, 'Колосовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (849, 55, 'Колосовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (850, 70, 'Колпашево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (851, 57, 'Колпна');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (852, 54, 'Колывань');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (853, 58, 'Колышлей');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (854, 33, 'Кольчугино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (855, 32, 'Комаричи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (856, 37, 'Комсомольск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (857, 39, 'Комсомольск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (858, 27, 'Комсомольск-на-Амуре');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (859, 8, 'Комсомольский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (860, 21, 'Комсомольское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (861, 69, 'Конаково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (862, 86, 'Кондинское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (863, 58, 'Кондоль');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (864, 10, 'Кондопога');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (865, 40, 'Кондрово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (866, 29, 'Коноша');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (867, 28, 'Константиновка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (868, 39, 'Константиновка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (869, 61, 'Константиновск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (870, 46, 'Конышевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (871, 74, 'Копейск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (872, 19, 'Копьево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (873, 46, 'Коренево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (874, 23, 'Кореновск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (875, 74, 'Коркино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (876, 55, 'Кормиловка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (877, 39, 'Корнево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (878, 39, 'Короленково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (879, 31, 'Короча');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (880, 11, 'Корткерос');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (881, 41, 'Корф');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (882, 29, 'Коряжма');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (883, 22, 'Косиха');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (884, 10, 'Костомукша');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (885, 39, 'Кострово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (886, 44, 'Кострома');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (887, 39, 'Костромино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (888, 39, 'Костюковка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (889, 34, 'Котельниково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (890, 43, 'Котельнич');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (891, 29, 'Котлас');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (892, 34, 'Котово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (893, 68, 'Котовск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (894, 54, 'Коченево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (895, 54, 'Кочки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (896, 13, 'Кочкурово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (897, 22, 'Кош-Агач');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (898, 1, 'Кошехабль');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (899, 63, 'Кошки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (900, 7, 'Кошхатау');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (901, 42, 'Крапивинский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (902, 33, 'Красная Горбатка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (903, 2, 'Красная Горка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (904, 32, 'Красная Горка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (905, 64, 'Красноармейск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (906, 23, 'Красноармейская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (907, 63, 'Красноармейское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (908, 21, 'Красноармейское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (909, 29, 'Красноборск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (910, 59, 'Красновишерск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (911, 1, 'Красногвардейск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (912, 31, 'Красногвардейское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (913, 26, 'Красногвардейское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (914, 60, 'Красногородское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (915, 22, 'Красногорское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (916, 39, 'Красногорское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (917, 18, 'Красногорское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (918, 23, 'Краснодар');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (919, 31, 'Красное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (920, 39, 'Красное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (921, 48, 'Красное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (922, 44, 'Красное-на-Волге');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (923, 54, 'Краснозерское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (924, 39, 'Краснознаменск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (925, 75, 'Красной Чикой');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (926, 75, 'Краснокаменск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (927, 59, 'Краснокамск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (928, 39, 'Краснолесье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (929, 39, 'Красноолмский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (930, 39, 'Краснополье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (931, 39, 'Краснополянское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (932, 89, 'Красноселькуп');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (933, 13, 'Краснослободск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (934, 39, 'Красноторовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (935, 24, 'Краснотуранск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (936, 66, 'Краснотурьинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (937, 66, 'Красноуральск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (938, 2, 'Красноусольский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (939, 66, 'Красноуфимск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (940, 39, 'Краснофлотское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (941, 22, 'Краснощеково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (942, 24, 'Красноярск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (943, 39, 'Красноярское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (944, 52, 'Красные Баки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (945, 21, 'Красные Четаи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (946, 67, 'Красный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (947, 39, 'Красный Бор');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (948, 64, 'Красный Кут');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (949, 61, 'Красный Сулин');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (950, 69, 'Красный Холм');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (951, 30, 'Красный Яр');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (952, 39, 'Красный Яр');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (953, 63, 'Красный Яр');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (954, 53, 'Крестцы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (955, 70, 'Кривошеино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (956, 39, 'Кромы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (957, 57, 'Кромы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (958, 23, 'Кропоткин');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (959, 39, 'Кругловка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (960, 55, 'Крутинка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (961, 22, 'Крутиха');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (962, 39, 'Крылово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (963, 23, 'Крыловская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (964, 23, 'Крымск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (965, 52, 'Кстово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (966, 39, 'Кубановка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (967, 56, 'Кувандык');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (968, 69, 'Кувшиново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (969, 21, 'Кугеси');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (970, 23, 'Кудепста');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (971, 59, 'Кудымкар');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (972, 59, 'Куеда');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (973, 12, 'Куженер');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (974, 58, 'Кузнецк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (975, 73, 'Кузоватово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (976, 54, 'Куйбышев');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (977, 61, 'Куйбышево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (978, 39, 'Куйбышевское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (979, 16, 'Кукмор');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (980, 52, 'Кулебаки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (981, 22, 'Кулунда');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (982, 39, 'Кумачово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (983, 43, 'Кумены');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (984, 2, 'Кумертау');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (985, 34, 'Кумылженская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (986, 74, 'Кунашак');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (987, 59, 'Кунгур');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (988, 60, 'Кунья');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (989, 54, 'Купино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (990, 24, 'Курагино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (991, 5, 'Курах');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (992, 45, 'Курган');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (993, 23, 'Курганинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (994, 71, 'Куркино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (995, 56, 'Курманаевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (996, 39, 'Курортное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (997, 26, 'Курсавка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (998, 46, 'Курск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (999, 45, 'Куртамыш');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1000, 3, 'Курумкан');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1001, 46, 'Курчатов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1002, 22, 'Курья');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1003, 74, 'Куса');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1004, 66, 'Кушва');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1005, 2, 'Кушнаренково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1006, 23, 'Кущевская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1007, 46, 'Кшенский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1008, 17, 'Кызыл (Тыва)');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1009, 22, 'Кытманово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1010, 54, 'Кыштовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1011, 74, 'Кыштым');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1012, 3, 'Кяхта');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1013, 23, 'Лабинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1014, 89, 'Лабытнанги');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1015, 39, 'Ладушкин');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1016, 25, 'Лазо');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1017, 16, 'Лаишево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1018, 86, 'Лангепас');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1019, 10, 'Лахденпохья');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1020, 48, 'Лебедянь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1021, 43, 'Лебяжье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1022, 45, 'Лебяжье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1023, 48, 'Лев Толстой');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1024, 39, 'Левобережное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1025, 26, 'Левокумское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1026, 37, 'Лежнево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1027, 23, 'Ленинградская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1028, 16, 'Лениногорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1029, 34, 'Ленинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1030, 42, 'Ленинск-Кузнецкий');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1031, 71, 'Ленинский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1032, 43, 'Ленинское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1033, 14, 'Ленск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1034, 26, 'Лермонтов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1035, 39, 'Лермонтово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1036, 39, 'Лесное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1037, 69, 'Лесное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1038, 25, 'Лесозаводск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1039, 24, 'Лесосибирск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1040, 26, 'Летняя Ставка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1041, 29, 'Лешуконское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1042, 57, 'Ливны');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1043, 30, 'Лиман');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1044, 39, 'Линево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1045, 48, 'Липецк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1046, 35, 'Липин Бор');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1047, 39, 'Липняки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1048, 39, 'Липовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1049, 39, 'Липово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1050, 36, 'Лиски');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1051, 69, 'Лихославль');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1052, 51, 'Ловозеро');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1053, 47, 'Лодейное Поле');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1054, 60, 'Локня');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1055, 32, 'Локоть');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1056, 39, 'Ломово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1057, 47, 'Ломоносов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1058, 39, 'Ломоносовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1059, 23, 'Лоо');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1060, 58, 'Лопатино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1061, 50, 'Лотошино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1062, 10, 'Лоухи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1063, 47, 'Луга');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1064, 39, 'Луговое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1065, 39, 'Луговское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1066, 39, 'Лужки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1067, 43, 'Луза');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1068, 52, 'Лукоянов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1069, 39, 'Лунино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1070, 58, 'Лунино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1071, 50, 'Луховицы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1072, 25, 'Лучегорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1073, 52, 'Лысково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1074, 64, 'Лысые Горы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1075, 59, 'Лысьва');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1076, 39, 'Львовское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1077, 46, 'Льгов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1078, 76, 'Любим');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1079, 55, 'Любинский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1080, 53, 'Любытино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1081, 40, 'Людиново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1082, 13, 'Лямбирь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1083, 86, 'Лянтор');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1084, 49, 'Магадан');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1085, 74, 'Магнитогорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1086, 39, 'Маевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1087, 1, 'Майкоп');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1088, 4, 'Майма');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1089, 73, 'Майна');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1090, 7, 'Майский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1091, 39, 'Майское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1092, 14, 'Майя');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1093, 65, 'Макаров');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1094, 44, 'Макарьев');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1095, 69, 'Максатиха');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1096, 45, 'Макушино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1097, 53, 'Малая Вишера');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1098, 18, 'Малая Пурга');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1099, 58, 'Малая Сердоба');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1100, 20, 'Малгобек');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1101, 39, 'Малиники');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1102, 39, 'Малиновка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1103, 43, 'Малмыж');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1104, 57, 'Малоархангельское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1105, 39, 'Маломожайское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1106, 2, 'Малояз');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1107, 40, 'Малоярославец');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1108, 39, 'Малые Горки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1109, 39, 'Мальцево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1110, 16, 'Мамадыш');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1111, 39, 'Мамоново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1112, 22, 'Мамонтово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1113, 44, 'Мантурово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1114, 46, 'Мантурово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1115, 53, 'Марево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1116, 42, 'Мариинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1117, 21, 'Мариинский Посад');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1118, 64, 'Маркс');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1119, 61, 'Мартыновка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1120, 39, 'Маршальское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1121, 39, 'Марьино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1122, 55, 'Марьяновка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1123, 54, 'Маслянино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1124, 61, 'Матвеев Курган');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1125, 56, 'Матвеевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1126, 39, 'Матросово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1127, 5, 'Махачкала');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1128, 39, 'Маяковское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1129, 32, 'Мглин');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1130, 86, 'Мегион');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1131, 10, 'Медвежьегорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1132, 46, 'Медвенка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1133, 56, 'Медногорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1134, 39, 'Медовое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1135, 40, 'Медынь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1136, 42, 'Междуреченск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1137, 72, 'Междуреченский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1138, 86, 'Междуреченский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1139, 39, 'Междуречье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1140, 29, 'Мезень');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1141, 33, 'Меленки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1142, 2, 'Мелеуз');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1143, 39, 'Мельниково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1144, 70, 'Мельниково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1145, 39, 'Менделеево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1146, 16, 'Менделеевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1147, 16, 'Мензелинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1148, 2, 'Месягутово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1149, 40, 'Мещовск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1150, 39, 'Миайлово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1151, 74, 'Миасс');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1152, 74, 'Миасское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1153, 61, 'Миллерово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1154, 62, 'Милославское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1155, 41, 'Мильково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1156, 61, 'Милютинская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1157, 26, 'Минеральные Воды');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1158, 24, 'Минусинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1159, 74, 'Миньяр');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1160, 29, 'Мирный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1161, 14, 'Мирный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1162, 62, 'Михайлов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1163, 22, 'Михайловка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1164, 34, 'Михайловка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1165, 25, 'Михайловка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1166, 68, 'Мичуринск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1167, 39, 'Мичуринский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1168, 2, 'Мишкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1169, 45, 'Мишкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1170, 75, 'Могайтуй');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1171, 50, 'Можайск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1172, 18, 'Можга');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1173, 15, 'Моздок');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1174, 39, 'Мозырь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1175, 64, 'Мокроус');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1176, 45, 'Мокроусово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1177, 58, 'Мокшан');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1178, 70, 'Молчаново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1179, 67, 'Монастырщина');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1180, 51, 'Мончегорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1181, 21, 'Моргауши');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1182, 39, 'Моргуново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1183, 68, 'Мордово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1184, 39, 'Мордовское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1185, 12, 'Морки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1186, 61, 'Морозовск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1187, 68, 'Моршанск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1188, 40, 'Мосальск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1189, 55, 'Москаленки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1190, 50, 'Москва');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1191, 23, 'Мостовской');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1192, 53, 'Мошенское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1193, 54, 'Мошково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1194, 2, 'Мраково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1195, 10, 'Муезерский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1196, 89, 'Мужи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1197, 72, 'Муравленко');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1198, 43, 'Мураши');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1199, 51, 'Мурманск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1200, 33, 'Муром');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1201, 39, 'Муромское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1202, 55, 'Муромцево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1203, 16, 'Муслюмово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1204, 3, 'Мухоршибирь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1205, 68, 'Мучкапский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1206, 57, 'Мценск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1207, 42, 'Мыски');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1208, 39, 'Мысовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1209, 76, 'Мышкин');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1210, 16, 'Набережные Челны');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1211, 52, 'Навашино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1212, 32, 'Навля');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1213, 39, 'Нагорное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1214, 43, 'Нагорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1215, 39, 'Надеждино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1216, 89, 'Надым');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1217, 24, 'Назарово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1218, 6, 'Назрань');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1219, 55, 'Называевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1220, 39, 'Наимово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1221, 7, 'Нальчик');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1222, 14, 'Намцы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1223, 30, 'Нариманов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1224, 50, 'Наро-Фоминск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1225, 58, 'Наровчат');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1226, 7, 'Нарткала');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1227, 57, 'Нарышкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1228, 29, 'Нарьян-Мар');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1229, 25, 'Находка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1230, 30, 'Началово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1231, 60, 'Невель');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1232, 58, 'Неверкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1233, 26, 'Невинномысск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1234, 39, 'Невское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1235, 66, 'Невьянск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1236, 39, 'Некрасово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1237, 76, 'Некрасовское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1238, 69, 'Нелидово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1239, 43, 'Нема');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1240, 39, 'Неман');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1241, 39, 'Неманское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1242, 44, 'Нерехта');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1243, 75, 'Нерчинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1244, 14, 'Нерюнгри');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1245, 39, 'Нестеров');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1246, 63, 'Нефтегорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1247, 2, 'Нефтекамск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1248, 26, 'Нефтекумск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1249, 86, 'Нефтеюганск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1250, 34, 'Нехаевский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1251, 44, 'Нея');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1252, 39, 'Нива');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1253, 39, 'Нивенское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1254, 86, 'Нижневартовск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1255, 36, 'Нижнедевицк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1256, 16, 'Нижнекамск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1257, 66, 'Нижние Серги');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1258, 24, 'Нижний Ингаш');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1259, 58, 'Нижний Ломов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1260, 52, 'Нижний Новгород');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1261, 66, 'Нижний Тагил');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1262, 55, 'Нижняя Омка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1263, 66, 'Нижняя Салда');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1264, 72, 'Нижняя Тавда');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1265, 66, 'Нижняя Тура');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1266, 39, 'Низовье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1267, 51, 'Никель');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1268, 73, 'Николаевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1269, 34, 'Николаевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1270, 27, 'Николаевск-на-Амуре');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1271, 2, 'Николо-Березовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1272, 35, 'Никольск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1273, 58, 'Никольск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1274, 39, 'Нилово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1275, 39, 'Новая деревня');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1276, 66, 'Новая Ляля');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1277, 73, 'Новая Малыкла');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1278, 36, 'Новая Усмань');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1279, 22, 'Новичиха');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1280, 26, 'Новоалександровск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1281, 22, 'Новоалтайск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1282, 34, 'Новоаннинский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1283, 2, 'Новобелокатай');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1284, 24, 'Новобирилюссы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1285, 39, 'Новобобруйск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1286, 55, 'Нововаршавка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1287, 36, 'Нововоронеж');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1288, 39, 'Новогурьевское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1289, 29, 'Новодвинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1290, 67, 'Новодугино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1291, 22, 'Новоегорьевское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1292, 32, 'Новозыбков');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1293, 28, 'Новокиевский Увал');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1294, 39, 'Новоколозное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1295, 23, 'Новокубанск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1296, 42, 'Новокузнецк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1297, 63, 'Новокуйбышевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1298, 62, 'Новомичуринск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1299, 71, 'Новомосковск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1300, 39, 'Новомосковский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1301, 39, 'Новомосковское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1302, 34, 'Новониколаевский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1303, 38, 'Новонукутский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1304, 56, 'Новоорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1305, 26, 'Новопавловск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1306, 23, 'Новопокровская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1307, 60, 'Новоржев');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1308, 23, 'Новороссийск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1309, 26, 'Новоселицкое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1310, 39, 'Новоселово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1311, 24, 'Новоселово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1312, 56, 'Новосергиевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1313, 54, 'Новосибирск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1314, 60, 'Новосокольники');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1315, 73, 'Новоспасское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1316, 39, 'Новостроево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1317, 39, 'Новостройка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1318, 56, 'Новотроицк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1319, 64, 'Новоузенск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1320, 73, 'Новоульяновск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1321, 66, 'Новоуральск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1322, 36, 'Новохоперск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1323, 61, 'Новочеркасск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1324, 61, 'Новошахтинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1325, 16, 'Новошешминск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1326, 64, 'Новые Бурасы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1327, 76, 'Новый Некоуз');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1328, 31, 'Новый Оскол');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1329, 12, 'Новый Торъял');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1330, 89, 'Новый Уренгой');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1331, 50, 'Ногинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1332, 20, 'Ножай-Юрт');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1333, 43, 'Нолинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1334, 24, 'Норильск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1335, 72, 'Ноябрьск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1336, 16, 'Нурлаты');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1337, 59, 'Нытва');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1338, 35, 'Нюксеница');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1339, 14, 'Нюрба');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1340, 86, 'Нягань');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1341, 74, 'Нязепетровск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1342, 29, 'Няндома');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1343, 29, 'о.Соловки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1344, 61, 'Обливская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1345, 40, 'Обнинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1346, 46, 'Обоянь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1347, 54, 'Обь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1348, 11, 'Обьячево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1349, 39, 'Овражье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1350, 55, 'Одесское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1351, 71, 'Одоев');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1352, 39, 'Озерки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1353, 39, 'Озерск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1354, 74, 'Озерск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1355, 50, 'Озеры');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1356, 64, 'Озинки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1357, 55, 'Оконешниково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1358, 61, 'Октябрьск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1359, 63, 'Октябрьск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1360, 29, 'Октябрьский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1361, 2, 'Октябрьский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1362, 34, 'Октябрьский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1363, 59, 'Октябрьский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1364, 56, 'Октябрьское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1365, 15, 'Октябрьское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1366, 86, 'Октябрьское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1367, 74, 'Октябрьское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1368, 53, 'Окуловка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1369, 14, 'Олекминск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1370, 51, 'Оленегорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1371, 69, 'Оленино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1372, 39, 'Олеово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1373, 10, 'Олонец');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1374, 25, 'Ольга');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1375, 39, 'Ольоватка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1376, 39, 'Ольовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1377, 36, 'Ольховатка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1378, 34, 'Ольховка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1379, 55, 'Омск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1380, 49, 'Омсукчан');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1381, 72, 'Омутинский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1382, 43, 'Омутнинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1383, 4, 'Онгудай');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1384, 29, 'Онега');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1385, 39, 'Оотное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1386, 43, 'Опарино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1387, 60, 'Опочка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1388, 59, 'Орда');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1389, 54, 'Ордынское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1390, 57, 'Орел');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1391, 56, 'Оренбург');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1392, 39, 'Ореовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1393, 50, 'Орехово-Зуево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1394, 43, 'Оричи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1395, 43, 'Орлов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1396, 39, 'Орловка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1397, 61, 'Орловский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1398, 56, 'Орск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1399, 12, 'Оршанка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1400, 59, 'Оса');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1401, 42, 'Осинники');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1402, 39, 'Осиновка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1403, 41, 'Оссора');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1404, 69, 'Осташков');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1405, 60, 'Остров');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1406, 39, 'Островское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1407, 44, 'Островское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1408, 36, 'Острогожск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1409, 39, 'Острогожское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1410, 23, 'Отрадная');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1411, 39, 'Отрадное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1412, 63, 'Отрадный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1413, 59, 'Оханск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1414, 27, 'Охотск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1415, 59, 'Очер');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1416, 44, 'Павино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1417, 73, 'Павловка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1418, 52, 'Павлово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1419, 22, 'Павловск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1420, 36, 'Павловск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1421, 23, 'Павловская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1422, 50, 'Павловский Посад');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1423, 55, 'Павлоградка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1424, 41, 'Палана');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1425, 49, 'Палатка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1426, 37, 'Палех');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1427, 60, 'Палкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1428, 34, 'Палласовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1429, 36, 'Панино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1430, 22, 'Панкрушиха');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1431, 70, 'Парабель');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1432, 12, 'Параньга');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1433, 25, 'Партизанск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1434, 39, 'Партизанское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1435, 24, 'Партизанское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1436, 44, 'Парфеньево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1437, 53, 'Парфино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1438, 41, 'Пахачи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1439, 58, 'Пачелма');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1440, 58, 'Пенза');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1441, 69, 'Пено');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1442, 39, 'Пеньки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1443, 52, 'Первомайск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1444, 56, 'Первомайский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1445, 68, 'Первомайский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1446, 75, 'Первомайский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1447, 39, 'Первомайское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1448, 70, 'Первомайское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1449, 66, 'Первоуральск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1450, 52, 'Перевоз');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1451, 56, 'Переволоцкий');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1452, 64, 'Перелюб');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1453, 40, 'Перемышль');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1454, 39, 'Переславское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1455, 27, 'Переяславка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1456, 76, 'Переяславль-Залесский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1457, 59, 'Пермь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1458, 39, 'Песочное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1459, 59, 'Пестово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1460, 16, 'Пестрецы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1461, 63, 'Пестровка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1462, 37, 'Пестяки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1463, 61, 'Песчанокопск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1464, 39, 'Петино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1465, 39, 'Петрово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1466, 64, 'Петровск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1467, 68, 'Петровское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1468, 10, 'Петрозаводск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1469, 3, 'Петропавловка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1470, 36, 'Петропавловка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1471, 41, 'Петропавловск-Камчатский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1472, 22, 'Петропавловское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1473, 45, 'Петухово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1474, 33, 'Петушки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1475, 11, 'Печора');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1476, 60, 'Печоры');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1477, 43, 'Пижанка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1478, 47, 'Пикалево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1479, 52, 'Пильна');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1480, 39, 'Пионерский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1481, 24, 'Пировское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1482, 62, 'Пителино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1483, 64, 'Питерка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1484, 10, 'Питкяранта');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1485, 68, 'Пичаево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1486, 71, 'Плавск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1487, 74, 'Пласт');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1488, 29, 'Плесецк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1489, 56, 'Плешаново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1490, 60, 'Плюсса');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1491, 39, 'Победино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1492, 39, 'Поваровка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1493, 36, 'Поворино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1494, 32, 'Погар');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1495, 39, 'Пограничный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1496, 25, 'Пограничный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1497, 36, 'Подгоренский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1498, 39, 'Подгорное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1499, 70, 'Подгорное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1500, 39, 'Подгоровка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1501, 53, 'Поддорье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1502, 39, 'Поддубное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1503, 39, 'Поддубы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1504, 39, 'Поддубье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1505, 39, 'Подлипово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1506, 50, 'Подольск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1507, 43, 'Подосиновец');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1508, 47, 'Подпорожье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1509, 25, 'Покровка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1510, 14, 'Покровск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1511, 39, 'Покровское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1512, 57, 'Покровское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1513, 61, 'Покровское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1514, 39, 'Покрышкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1515, 66, 'Полевский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1516, 39, 'Полесск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1517, 27, 'Полина Осипенко');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1518, 45, 'Половинное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1519, 55, 'Полтавка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1520, 39, 'Полтавское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1521, 51, 'Полярные Зори');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1522, 51, 'Полярный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1523, 44, 'Поназырево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1524, 56, 'Пономаревка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1525, 46, 'Поныри');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1526, 21, 'Порецкое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1527, 39, 'Поречье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1528, 60, 'Порхов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1529, 22, 'Поспелиха');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1530, 63, 'Похвистнево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1531, 32, 'Почеп');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1532, 52, 'Починки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1533, 67, 'Починок');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1534, 76, 'Пошехонье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1535, 39, 'Правдино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1536, 39, 'Правдинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1537, 9, 'Преградная');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1538, 34, 'Преображенская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1539, 76, 'Пречистое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1540, 75, 'Приаргунск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1541, 39, 'Прибрежное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1542, 37, 'Приволжск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1543, 63, 'Приволжье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1544, 39, 'Привольное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1545, 39, 'Пригородное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1546, 39, 'Придорожное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1547, 39, 'Приморск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1548, 23, 'Приморско-Ахтарск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1549, 39, 'Приморье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1550, 23, 'Приморье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1551, 39, 'Приозерное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1552, 47, 'Приозерск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1553, 46, 'Пристень');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1554, 8, 'Приютное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1555, 42, 'Прокопьевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1556, 39, 'Проладное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1557, 61, 'Пролетарск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1558, 42, 'Промышленная');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1559, 62, 'Пронск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1560, 39, 'Прооровка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1561, 7, 'Прохладный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1562, 31, 'Прохоровка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1563, 39, 'Прудное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1564, 39, 'Пруды');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1565, 10, 'Пряжа');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1566, 46, 'Прямицыно');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1567, 60, 'Псков');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1568, 64, 'Пугачев');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1569, 10, 'Пудож');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1570, 60, 'Пустошка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1571, 62, 'Путятино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1572, 37, 'Пучеж');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1573, 50, 'Пушкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1574, 60, 'Пушкинские Горы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1575, 60, 'Пыталово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1576, 86, 'Пыть-ях');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1577, 66, 'Пышма');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1578, 44, 'Пыщуг');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1579, 26, 'Пятигорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1580, 39, 'Пятидорожное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1581, 73, 'Радищево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1582, 33, 'Радужный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1583, 86, 'Радужный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1584, 2, 'Раевский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1585, 39, 'Разино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1586, 28, 'Райчихинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1587, 39, 'Ракитино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1588, 31, 'Ракитное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1589, 50, 'Раменское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1590, 69, 'Рамешки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1591, 36, 'Рамонь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1592, 39, 'Рассвет');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1593, 68, 'Рассказово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1594, 22, 'Ребриха');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1595, 66, 'Ревда');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1596, 66, 'Реж');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1597, 61, 'Ремонтное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1598, 36, 'Репьевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1599, 68, 'Ржакса');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1600, 69, 'Ржев');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1601, 39, 'Ржевское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1602, 31, 'Ровеньки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1603, 39, 'Ровное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1604, 64, 'Ровное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1605, 32, 'Рогнедино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1606, 22, 'Родино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1607, 61, 'Родионово-Несветайская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1608, 37, 'Родники');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1609, 39, 'Родники');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1610, 64, 'Романовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1611, 22, 'Романово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1612, 39, 'Романово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1613, 61, 'Романовская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1614, 13, 'Ромоданово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1615, 67, 'Рославль');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1616, 39, 'Россия');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1617, 36, 'Россошь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1618, 61, 'Ростов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1619, 76, 'Ростов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1620, 39, 'Рощино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1621, 64, 'Ртищево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1622, 22, 'Рубцовск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1623, 34, 'Рудня');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1624, 67, 'Рудня');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1625, 50, 'Руза');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1626, 13, 'Рузаевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1627, 55, 'Русская Поляна');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1628, 58, 'Русский Камешкир');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1629, 39, 'Ручьи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1630, 39, 'Рыбачий');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1631, 24, 'Рыбинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1632, 76, 'Рыбинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1633, 39, 'Рыбкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1634, 16, 'Рыбная Слобода');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1635, 62, 'Рыбное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1636, 46, 'Рыльск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1637, 39, 'Рябиновка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1638, 62, 'Ряжск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1639, 62, 'Рязань');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1640, 37, 'Савино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1641, 39, 'Садовое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1642, 8, 'Садовое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1643, 56, 'Сакмара');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1644, 2, 'Салават');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1645, 89, 'Салехард');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1646, 61, 'Сальск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1647, 63, 'Самара');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1648, 64, 'Самойловка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1649, 14, 'Сангар');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1650, 69, 'Сандово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1651, 47, 'Санкт-Петербург');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1652, 43, 'Санчурск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1653, 62, 'Сапожок');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1654, 56, 'Саракташ');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1655, 13, 'Саранск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1656, 39, 'Саранское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1657, 18, 'Сарапул');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1658, 64, 'Саратов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1659, 55, 'Саргатское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1660, 16, 'Сарманово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1661, 52, 'Саров');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1662, 62, 'Сасово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1663, 68, 'Сатинка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1664, 74, 'Сатка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1665, 45, 'Сафакулево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1666, 67, 'Сафоново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1667, 19, 'Саяногорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1668, 39, 'Светлогорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1669, 26, 'Светлоград');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1670, 39, 'Светлый');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1671, 56, 'Светлый');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1672, 34, 'Светлый Яр');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1673, 43, 'Свеча');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1674, 39, 'Свобода');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1675, 28, 'Свободный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1676, 60, 'Себеж');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1677, 54, 'Северное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1678, 56, 'Северное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1679, 39, 'Северный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1680, 3, 'Северобайкальск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1681, 29, 'Северодвинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1682, 51, 'Североморск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1683, 66, 'Североуральск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1684, 70, 'Северск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1685, 23, 'Северская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1686, 32, 'Севск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1687, 39, 'Севское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1688, 10, 'Сегежа');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1689, 55, 'Седельниково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1690, 49, 'Сеймчан');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1691, 35, 'Село Им. Бабушкина');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1692, 18, 'Селты');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1693, 52, 'Семенов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1694, 39, 'Семеново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1695, 61, 'Семикаракорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1696, 36, 'Семилуки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1697, 73, 'Сенгилей');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1698, 34, 'Серафимович');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1699, 52, 'Сергач');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1700, 50, 'Сергиев Посад');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1701, 63, 'Сергиевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1702, 58, 'Сердобск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1703, 50, 'Серебрянные Пруды');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1704, 12, 'Сернур');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1705, 66, 'Серов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1706, 50, 'Серпухов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1707, 28, 'Серышево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1708, 52, 'Сеченово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1709, 2, 'Сибай');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1710, 59, 'Сива');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1711, 51, 'Скалистый');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1712, 28, 'Сковородино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1713, 62, 'Скопин');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1714, 22, 'Славгород');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1715, 39, 'Славинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1716, 39, 'Славск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1717, 39, 'Славское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1718, 25, 'Славянка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1719, 39, 'Славяновка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1720, 23, 'Славянск-на-Кубани');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1721, 39, 'Славянское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1722, 72, 'Сладково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1723, 47, 'Сланцы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1724, 43, 'Слободской');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1725, 67, 'Смоленск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1726, 22, 'Смоленское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1727, 74, 'Снежинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1728, 51, 'Снежногрск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1729, 33, 'Собинка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1730, 41, 'Соболево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1731, 39, 'Советск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1732, 43, 'Советск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1733, 27, 'Советская Гавань');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1734, 12, 'Советский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1735, 86, 'Советский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1736, 22, 'Советское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1737, 7, 'Советское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1738, 39, 'Совозное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1739, 39, 'Совозный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1740, 35, 'Сокол');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1741, 39, 'Сокольники');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1742, 39, 'Солдатово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1743, 44, 'Солигалич');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1744, 59, 'Соликамск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1745, 74, 'Солнечная Долина');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1746, 50, 'Солнечногорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1747, 27, 'Солнечный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1748, 46, 'Солнцево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1749, 39, 'Соловьево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1750, 22, 'Солонешное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1751, 39, 'Солонцы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1752, 62, 'Солотча');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1753, 22, 'Солтон');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1754, 56, 'Соль-Илецк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1755, 53, 'Сольцы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1756, 69, 'Сонково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1757, 39, 'Сопкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1758, 56, 'Сорочинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1759, 19, 'Сорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1760, 10, 'Сортавала');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1761, 39, 'Сосновка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1762, 68, 'Сосновка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1763, 3, 'Сосново-Озерское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1764, 24, 'Сосновоборск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1765, 58, 'Сосновоборск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1766, 52, 'Сосновское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1767, 47, 'Сосновый Бор');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1768, 11, 'Сосногорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1769, 23, 'Сочи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1770, 40, 'Спас-Деменск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1771, 62, 'Спас-Клепики');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1772, 16, 'Спасск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1773, 25, 'Спасск-Дальний');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1774, 62, 'Спасск-Рязанский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1775, 52, 'Спасское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1776, 41, 'Средние Пахачи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1777, 34, 'Средняя Ахтуба');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1778, 75, 'Сретенск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1779, 26, 'Ставрополь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1780, 48, 'Становое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1781, 73, 'Старая Кулатка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1782, 73, 'Старая Майна');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1783, 34, 'Старая Полтавка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1784, 53, 'Старая Русса');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1785, 75, 'Старая Чара');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1786, 69, 'Старица');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1787, 22, 'Староалейское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1788, 32, 'Стародуб');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1789, 13, 'Старое Шайгово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1790, 62, 'Старожилово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1791, 23, 'Староминская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1792, 23, 'Старощербиновская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1793, 68, 'Староюрьево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1794, 31, 'Старый Оскол');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1795, 64, 'Степное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1796, 26, 'Степное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1797, 2, 'Стерлибашево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1798, 2, 'Стерлитамак');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1799, 70, 'Стрежевой');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1800, 31, 'Строитель');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1801, 39, 'Стройный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1802, 60, 'Струги- Красные');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1803, 50, 'Ступино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1804, 71, 'Суворов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1805, 39, 'Суворовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1806, 39, 'Суворово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1807, 46, 'Суджа');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1808, 44, 'Судиславль');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1809, 33, 'Судогда');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1810, 33, 'Суздаль');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1811, 32, 'Суземка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1812, 54, 'Сузун');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1813, 59, 'Суксун');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1814, 43, 'Суна');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1815, 14, 'Сунтар');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1816, 10, 'Суоярви');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1817, 32, 'Сураж');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1818, 86, 'Сургут');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1819, 34, 'Суровикино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1820, 73, 'Сурское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1821, 44, 'Сусанино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1822, 49, 'Сусуман');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1823, 40, 'Сухиничи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1824, 24, 'Сухобузимское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1825, 66, 'Сухой Лог');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1826, 63, 'Сызрань');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1827, 11, 'Сыктывкар');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1828, 66, 'Сысерть');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1829, 67, 'Сычевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1830, 18, 'Сюмси');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1831, 35, 'Сямжа');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1832, 66, 'Таборы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1833, 22, 'Табуны');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1834, 66, 'Тавда');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1835, 55, 'Таврическое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1836, 61, 'Таганрог');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1837, 89, 'Тазовский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1838, 24, 'Таилтып');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1839, 42, 'Тайга');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1840, 38, 'Тайшет');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1841, 50, 'Талдом');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1842, 66, 'Талица');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1843, 36, 'Таловая');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1844, 39, 'Талпаки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1845, 22, 'Тальменка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1846, 58, 'Тамала');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1847, 68, 'Тамбов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1848, 55, 'Тара');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1849, 61, 'Тарасовский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1850, 3, 'Тарбагатай');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1851, 72, 'Тарко-сале');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1852, 35, 'Тарногский Городок');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1853, 40, 'Таруса');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1854, 24, 'Тасеево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1855, 54, 'Татарск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1856, 64, 'Татищево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1857, 1, 'Тахтамукай');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1858, 61, 'Тацинский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1859, 56, 'Ташла');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1860, 42, 'Таштагол');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1861, 19, 'Таштып');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1862, 23, 'Тбилисская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1863, 69, 'Тверь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1864, 55, 'Тевриз');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1865, 70, 'Тегульдет');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1866, 37, 'Тейково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1867, 67, 'Темкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1868, 13, 'Темников');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1869, 23, 'Темрюк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1870, 13, 'Теньгушево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1871, 71, 'Теплое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1872, 48, 'Тербуны');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1873, 7, 'Терек');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1874, 73, 'Тереньга');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1875, 25, 'Терней');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1876, 36, 'Терновка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1877, 7, 'Терскол');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1878, 16, 'Тетюши');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1879, 41, 'Тигиль');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1880, 14, 'Тикси');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1881, 41, 'Тиличики');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1882, 46, 'Тим');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1883, 23, 'Тимашевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1884, 39, 'Тимирязево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1885, 39, 'Тимофеевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1886, 39, 'Тимофеево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1887, 42, 'Тисуль');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1888, 47, 'Тихвин');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1889, 23, 'Тихорецк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1890, 39, 'Тишино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1891, 72, 'Тобольск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1892, 22, 'Тогул');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1893, 54, 'Тогучин');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1894, 68, 'Токаревка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1895, 2, 'Толбазы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1896, 63, 'Тольятти');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1897, 70, 'Томск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1898, 52, 'Тонкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1899, 42, 'Топки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1900, 22, 'Топчиха');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1901, 13, 'Торбеево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1902, 69, 'Торжок');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1903, 69, 'Торопец');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1904, 47, 'Тосно');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1905, 35, 'Тотьма');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1906, 56, 'Тоцкое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1907, 74, 'Трехгорный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1908, 50, 'Троицк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1909, 74, 'Троицк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1910, 11, 'Троицко-Печорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1911, 22, 'Троицкое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1912, 8, 'Троицкое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1913, 27, 'Троицкое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1914, 57, 'Тросна');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1915, 39, 'Тростники');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1916, 32, 'Трубачевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1917, 23, 'Туапсе');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1918, 76, 'Тугаев');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1919, 66, 'Тугулым');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1920, 43, 'Тужа');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1921, 2, 'Туймазы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1922, 71, 'Тула');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1923, 1, 'Тульский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1924, 39, 'Тумановка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1925, 39, 'Тургенево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1926, 66, 'Туринск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1927, 66, 'Туринская Слобода');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1928, 64, 'Турки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1929, 4, 'Турочак');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1930, 3, 'Турунтаево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1931, 28, 'Тында');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1932, 7, 'Тырныауз');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1933, 55, 'Тюкалинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1934, 39, 'Тюленино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1935, 56, 'Тюльган');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1936, 16, 'Тюлячи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1937, 22, 'Тюменцево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1938, 72, 'Тюмень');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1939, 24, 'Тюхтет');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1940, 42, 'Тяжинский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1941, 54, 'Убинское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1942, 18, 'Ува');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1943, 68, 'Уварово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1944, 72, 'Уват');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1945, 74, 'Увельский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1946, 76, 'Углич');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1947, 22, 'Угловское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1948, 67, 'Угра');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1949, 69, 'Удомля');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1950, 24, 'Ужур');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1951, 71, 'Узловая');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1952, 39, 'Узловое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1953, 59, 'Уинское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1954, 74, 'Уйское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1955, 3, 'Улан-Удэ');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1956, 75, 'Улеты');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1957, 39, 'Ульяново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1958, 40, 'Ульяново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1959, 73, 'Ульяновск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1960, 51, 'Умба');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1961, 68, 'Умет');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1962, 32, 'Унеча');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1963, 43, 'Уни');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1964, 72, 'Упорово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1965, 52, 'Уразовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1966, 86, 'Урай');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1967, 52, 'Урень');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1968, 43, 'Уржум');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1969, 21, 'Урмары');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1970, 20, 'Урус-Мартан');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1971, 16, 'Уруссу');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1972, 34, 'Урюпинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1973, 60, 'Усвяты');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1974, 11, 'Усинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1975, 48, 'Усмань');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1976, 11, 'Усогорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1977, 59, 'Усолье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1978, 38, 'Усолье-Сибирское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1979, 23, 'Успенское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1980, 25, 'Уссурийск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1981, 19, 'Усть-Абакан');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1982, 41, 'Усть-Большерецк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1983, 9, 'Усть-Джегута');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1984, 61, 'Усть-Донецкий');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1985, 38, 'Усть-Илимск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1986, 55, 'Усть-Ишим');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1987, 22, 'Усть-Калманка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1988, 41, 'Усть-Камчатск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1989, 4, 'Усть-Кан');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1990, 74, 'Усть-Катав');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1991, 59, 'Усть-Кишерть');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1992, 11, 'Усть-Кулом');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1993, 38, 'Усть-Кут');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1994, 23, 'Усть-Лабинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1995, 14, 'Усть-Мая');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1996, 49, 'Усть-Омчуг');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1997, 85, 'Усть-Ордынский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1998, 22, 'Усть-Пристань');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (1999, 54, 'Усть-Тарка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2000, 38, 'Усть-Уда');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2001, 41, 'Усть-Хайрюзово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2002, 11, 'Усть-Цильма');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2003, 35, 'Устье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2004, 35, 'Устюжна');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2005, 2, 'Уфа');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2006, 62, 'Ухолово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2007, 11, 'Ухта');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2008, 2, 'Учалы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2009, 9, 'Учкекен');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2010, 39, 'Ушаковка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2011, 39, 'Ушаково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2012, 24, 'Уяр');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2013, 43, 'Фаленки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2014, 46, 'Фатеж');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2015, 39, 'Февральское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2016, 2, 'Федоровка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2017, 39, 'Федотово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2018, 40, 'Ферзиково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2019, 74, 'Фершампенуаз');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2020, 39, 'Филипповка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2021, 69, 'Фирово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2022, 25, 'Фокино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2023, 34, 'Фролово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2024, 39, 'Фрунзенское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2025, 37, 'Фурманов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2026, 39, 'Фурмановка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2027, 39, 'Фурманово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2028, 27, 'Хабаровск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2029, 22, 'Хабары');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2030, 1, 'Хакуринохабль');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2031, 14, 'Хандыга');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2032, 86, 'Ханты-мансийск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2033, 30, 'Харабали');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2034, 35, 'Харовск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2035, 89, 'Харп');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2036, 64, 'Хвалынск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2037, 40, 'Хвастовичи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2038, 53, 'Хвойная');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2039, 75, 'Хилок');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2040, 67, 'Хиславичи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2041, 39, 'Хлебниково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2042, 48, 'Хлевное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2043, 53, 'Холм');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2044, 67, 'Холм-Жирковский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2045, 39, 'Холмогоровка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2046, 29, 'Холмогоры');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2047, 39, 'Холмогорье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2048, 39, 'Холмы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2049, 46, 'Хомутивка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2050, 3, 'Хоринск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2051, 25, 'Хороль');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2052, 23, 'Хоста');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2053, 36, 'Хохольский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2054, 8, 'Цаган Аман');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2055, 61, 'Целина');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2056, 22, 'Целинное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2057, 45, 'Целинное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2058, 21, 'Цивильск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2059, 61, 'Цимлянск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2060, 35, 'Чагода');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2061, 39, 'Чайкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2062, 59, 'Чайковский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2063, 61, 'Чалтырь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2064, 13, 'Чамзинка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2065, 54, 'Чаны');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2066, 63, 'Чапаевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2067, 48, 'Чаплыгин');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2068, 22, 'Чарышское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2069, 45, 'Частоозерье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2070, 59, 'Частые');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2071, 74, 'Чебаркуль');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2072, 21, 'Чебоксары');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2073, 27, 'Чегдомын');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2074, 7, 'Чегем Первый');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2075, 2, 'Чекмагуш');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2076, 63, 'Челно-Вершины');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2077, 74, 'Челябинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2078, 39, 'Чеово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2079, 73, 'Чердаклы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2080, 59, 'Чердынь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2081, 46, 'Черемисиново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2082, 39, 'Черемуино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2083, 38, 'Черемхово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2084, 16, 'Черемшаны');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2085, 54, 'Черепаново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2086, 35, 'Череповец');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2087, 9, 'Черкесск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2088, 55, 'Черлак');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2089, 25, 'Черниговка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2090, 50, 'Черноголовка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2091, 19, 'Черногорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2092, 59, 'Чернушка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2093, 30, 'Черный Яр');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2094, 75, 'Чернышевск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2095, 39, 'Чернышевское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2096, 34, 'Чернышковский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2097, 71, 'Чернь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2098, 31, 'Чернянка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2099, 39, 'Черняховск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2100, 61, 'Чертково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2101, 74, 'Чесма');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2102, 50, 'Чехов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2103, 15, 'Чикола');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2104, 54, 'Чистоозерное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2105, 16, 'Чистополь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2106, 39, 'Чистополье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2107, 39, 'Чистые пруды');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2108, 75, 'Чита');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2109, 2, 'Чишмы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2110, 52, 'Чкаловск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2111, 4, 'Чоя');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2112, 25, 'Чугуевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2113, 53, 'Чудово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2114, 54, 'Чулым');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2115, 27, 'Чумикан');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2116, 38, 'Чунский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2117, 14, 'Чурапча');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2118, 59, 'Чусовой');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2119, 44, 'Чухлома');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2120, 62, 'Чучково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2121, 45, 'Шадринск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2122, 20, 'Шали');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2123, 24, 'Шалинское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2124, 66, 'Шаля');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2125, 2, 'Шаран');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2126, 52, 'Шаранга');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2127, 18, 'Шаркан');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2128, 56, 'Шарлык');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2129, 24, 'Шарыпово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2130, 44, 'Шарья');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2131, 52, 'Шатки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2132, 20, 'Шатой');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2133, 45, 'Шатрово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2134, 50, 'Шатура');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2135, 50, 'Шаховская');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2136, 61, 'Шахты');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2137, 52, 'Шахунья');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2138, 62, 'Шацк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2139, 4, 'Шебалино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2140, 31, 'Шебекино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2141, 39, 'Шевченко');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2142, 35, 'Шексна');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2143, 22, 'Шелаболиха');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2144, 38, 'Шелехов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2145, 75, 'Шелопугино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2146, 21, 'Шемурша');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2147, 58, 'Шемышейка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2148, 29, 'Шенкурск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2149, 63, 'Шентала');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2150, 55, 'Шербакуль');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2151, 75, 'Шилка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2152, 62, 'Шилово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2153, 28, 'Шимановск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2154, 53, 'Шимск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2155, 22, 'Шипуново');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2156, 19, 'Шира');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2157, 39, 'Широкое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2158, 1, 'Шовгеновский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2159, 39, 'Шолоово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2160, 39, 'Шоссейный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2161, 35, 'Шуйское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2162, 21, 'Шумерля');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2163, 45, 'Шумиха');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2164, 67, 'Шумячи');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2165, 24, 'Шушенское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2166, 37, 'Шуя');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2167, 39, 'Щегловка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2168, 39, 'Щеглы');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2169, 71, 'Щекино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2170, 50, 'Щелково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2171, 46, 'Щигры');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2172, 45, 'Щучье');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2173, 14, 'Ытык-Кюель');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2174, 50, 'Электросталь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2175, 8, 'Элиста');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2176, 15, 'Эльхотово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2177, 64, 'Энгельс');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2178, 36, 'Эртиль');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2179, 41, 'Эссо');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2180, 39, 'Юдино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2181, 37, 'Южа');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2182, 65, 'Южно-Сахалинск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2183, 74, 'Южноуральск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2184, 39, 'Южный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2185, 18, 'Юкаменское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2186, 42, 'Юрга');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2187, 45, 'Юргамыш');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2188, 72, 'Юргинское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2189, 12, 'Юрино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2190, 33, 'Юрьев-Польский');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2191, 37, 'Юрьевич');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2192, 43, 'Юрья');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2193, 40, 'Юхнов');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2194, 39, 'Яблоневка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2195, 39, 'Яблоновка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2196, 13, 'Явас');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2197, 39, 'Ягодное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2198, 21, 'Ядрин');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2199, 2, 'Языково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2200, 25, 'Яковлевка');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2201, 14, 'Якутск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2202, 18, 'Якшур-бодья');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2203, 72, 'Ялуторовск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2204, 21, 'Яльчики');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2205, 2, 'Янаул');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2206, 39, 'Янтарный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2207, 21, 'Янтиково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2208, 18, 'Яр');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2209, 89, 'Яр-сале');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2210, 43, 'Яранск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2211, 29, 'Яренск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2212, 39, 'Ярки');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2213, 72, 'Ярково');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2214, 39, 'Яровое');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2215, 76, 'Ярославль');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2216, 39, 'Ярославское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2217, 67, 'Ярцево');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2218, 39, 'Ясеньское');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2219, 39, 'Ясная поляна');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2220, 71, 'Ясногорск');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2221, 39, 'Ясное');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2222, 56, 'Ясный');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2223, 8, 'Яшалта');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2224, 42, 'Яшкино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2225, 8, 'Яшкуль');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2226, 42, 'Яя');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2227, 33, 'Мелехово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2228, 33, 'Чкалово');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2229, 33, 'Краскый Октябрь');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2230, 33, 'Красный Маяк');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2231, 33, 'Пакино');
INSERT INTO public.cities (city_id, fk_region_id, city_name) OVERRIDING SYSTEM VALUE VALUES (2232, 77, 'Москва');


--
-- TOC entry 3390 (class 0 OID 32869)
-- Dependencies: 217
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.countries (country_id, country_name) OVERRIDING SYSTEM VALUE VALUES (1, 'Российская Федерация');
INSERT INTO public.countries (country_id, country_name) OVERRIDING SYSTEM VALUE VALUES (2, 'Финляндия');


--
-- TOC entry 3397 (class 0 OID 32903)
-- Dependencies: 224
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hotels (hotel_id, fk_country_id, fk_region_id, fk_city_id, street_name, house_number, hotel_name, fk_hotel_category) OVERRIDING SYSTEM VALUE VALUES (1, 1, 47, 806, 'проспект Победы', 10, 'Север', 3);
INSERT INTO public.hotels (hotel_id, fk_country_id, fk_region_id, fk_city_id, street_name, house_number, hotel_name, fk_hotel_category) OVERRIDING SYSTEM VALUE VALUES (2, 1, 47, 806, 'проспект Победы', 40, 'Спутник', 2);


--
-- TOC entry 3401 (class 0 OID 32935)
-- Dependencies: 228
-- Data for Name: numbers_of_hotel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, 100, 3, 2, 2800, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (2, 1, 1, 101, 3, 2, 2800, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (3, 1, 1, 102, 3, 2, 2800, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (4, 1, 1, 103, 5, 3, 3000, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (5, 1, 2, 204, 8, 3, 3300, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (6, 1, 2, 205, 5, 3, 3000, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (7, 1, 2, 206, 3, 2, 2800, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (8, 1, 2, 207, 3, 2, 2800, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (9, 1, 2, 208, 3, 2, 2800, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (10, 1, 2, 209, 5, 3, 3000, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (11, 1, 3, 310, 8, 3, 3300, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (12, 1, 3, 311, 5, 3, 3000, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (13, 1, 3, 313, 9, 4, 6600, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (14, 1, 3, 314, 9, 4, 6600, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (15, 1, 3, 315, 3, 2, 2800, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (16, 1, 3, 316, 5, 3, 3000, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (17, 1, 3, 317, 5, 3, 3000, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (19, 1, 4, 419, 3, 2, 2800, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (20, 1, 4, 420, 3, 2, 2800, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (21, 1, 4, 421, 5, 3, 3000, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (22, 1, 4, 422, 3, 2, 2800, false);
INSERT INTO public.numbers_of_hotel (number_id, fk_hotel_id, floor_number, number_room, fk_type_room, amount_seats, price, isavaiable) OVERRIDING SYSTEM VALUE VALUES (18, 1, 4, 418, 3, 2, 2800, true);


--
-- TOC entry 3391 (class 0 OID 32874)
-- Dependencies: 218
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Республика Адыгея');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (2, 1, 'Республика Башкортостан');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (3, 1, 'Республика Бурятия');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (4, 1, 'Республика Алтай');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (5, 1, 'Республика Дагестан');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (6, 1, 'Республика Ингушетия');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (7, 1, 'Республика Кабардино-Балкарская');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (8, 1, 'Республика Калмыкия');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (9, 1, 'Республика Карачаево-Черкесия');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (10, 1, 'Республика Карелия');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (11, 1, 'Республика Коми');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (12, 1, 'Республика Марий Эл');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (13, 1, 'Республика Мордовия');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (14, 1, 'Республика Саха (Якутия)');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (15, 1, 'Республика Северная Осетия');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (16, 1, 'Республика Татарстан');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (17, 1, 'Республика Тыва (Тува)');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (18, 1, 'Республика Удмуртия');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (19, 1, 'Республика Хакасия');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (20, 1, 'Республика Чечня');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (21, 1, 'Республика Чувашия');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (22, 1, 'Алтайский край');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (23, 1, 'Краснодарский край');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (24, 1, 'Красноярский край');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (25, 1, 'Приморский край');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (26, 1, 'Ставропольский край');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (27, 1, 'Хабаровский край');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (28, 1, 'Амурская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (29, 1, 'Архангельская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (30, 1, 'Астраханская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (31, 1, 'Белгородская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (32, 1, 'Брянская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (33, 1, 'Владимирская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (34, 1, 'Волгоградская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (35, 1, 'Вологодская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (36, 1, 'Воронежская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (37, 1, 'Ивановская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (38, 1, 'Иркутская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (39, 1, 'Калининградская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (40, 1, 'Калужская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (41, 1, 'Камчатская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (42, 1, 'Кемеровская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (43, 1, 'Кировская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (44, 1, 'Костромская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (45, 1, 'Курганская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (46, 1, 'Курская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (47, 1, 'Ленинградская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (48, 1, 'Липецкая область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (49, 1, 'Магаданская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (50, 1, 'Московская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (51, 1, 'Мурманская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (52, 1, 'Нижегородская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (53, 1, 'Новгородская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (54, 1, 'Новосибирская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (55, 1, 'Омская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (56, 1, 'Оренбургская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (57, 1, 'Орловская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (58, 1, 'Пензенская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (59, 1, 'Пермский край');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (60, 1, 'Псковская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (61, 1, 'Ростовская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (62, 1, 'Рязанская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (63, 1, 'Самарская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (64, 1, 'Саратовская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (65, 1, 'Сахалинская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (66, 1, 'Свердловская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (67, 1, 'Смоленская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (68, 1, 'Тамбовская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (69, 1, 'Тверская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (70, 1, 'Томская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (71, 1, 'Тульская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (72, 1, 'Тюменская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (73, 1, 'Ульяновская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (74, 1, 'Челябинская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (75, 1, 'Читинская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (76, 1, 'Ярославская область');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (77, 1, 'Москва');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (78, 1, 'Санкт-Петербург');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (79, 1, 'Еврейская АО');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (80, 1, 'Агинский АО');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (81, 1, 'Коми-Пермяцкий АО');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (82, 1, 'Корякский АО');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (83, 1, 'Ненецкий АО');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (84, 1, 'Таймырский АО');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (85, 1, 'Усть-Ордынский АО');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (86, 1, 'Ханты-Мансийский АО');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (87, 1, 'Чукотский АО');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (88, 1, 'Эвенкийский АО');
INSERT INTO public.regions (region_id, fk_country_id, region_name) OVERRIDING SYSTEM VALUE VALUES (89, 1, 'Ямало-Ненецкий АО');


--
-- TOC entry 3400 (class 0 OID 32930)
-- Dependencies: 227
-- Data for Name: type_room; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.type_room (type_room_id, type_room_name) OVERRIDING SYSTEM VALUE VALUES (1, 'Стандарт');
INSERT INTO public.type_room (type_room_id, type_room_name) OVERRIDING SYSTEM VALUE VALUES (2, 'Стандарт+');
INSERT INTO public.type_room (type_room_id, type_room_name) OVERRIDING SYSTEM VALUE VALUES (3, 'Комфорт');
INSERT INTO public.type_room (type_room_id, type_room_name) OVERRIDING SYSTEM VALUE VALUES (4, 'Комфорт с балконом');
INSERT INTO public.type_room (type_room_id, type_room_name) OVERRIDING SYSTEM VALUE VALUES (5, 'Комфорт +');
INSERT INTO public.type_room (type_room_id, type_room_name) OVERRIDING SYSTEM VALUE VALUES (6, 'Одноместный номер Эконом');
INSERT INTO public.type_room (type_room_id, type_room_name) OVERRIDING SYSTEM VALUE VALUES (7, 'Студия');
INSERT INTO public.type_room (type_room_id, type_room_name) OVERRIDING SYSTEM VALUE VALUES (8, 'Семейный номер');
INSERT INTO public.type_room (type_room_id, type_room_name) OVERRIDING SYSTEM VALUE VALUES (9, 'Люкс');


--
-- TOC entry 3387 (class 0 OID 32820)
-- Dependencies: 214
-- Data for Name: us_login_and_password; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.us_login_and_password (user_id, login, pass) OVERRIDING SYSTEM VALUE VALUES (1, 'AlexGood@mail.ru', '2FB6BBB02EEF542A2AB804D2B816AFE8');


--
-- TOC entry 3388 (class 0 OID 32827)
-- Dependencies: 215
-- Data for Name: us_main_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.us_main_data (fk_user_id, last_name, first_name, middle_name, date_of_birth) VALUES (1, 'Сергеев', 'Алексей', 'Леонтьевич', '1998-11-05');


--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 226
-- Name: categotyofhotels_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categotyofhotels_category_id_seq', 5, true);


--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 222
-- Name: cities_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_city_id_seq', 2232, true);


--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 220
-- Name: countries_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_country_id_seq', 2, true);


--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 225
-- Name: hotels_hotel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hotels_hotel_id_seq', 2, true);


--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 230
-- Name: numbers_of_hotel_number_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.numbers_of_hotel_number_id_seq', 22, true);


--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 221
-- Name: regions_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regions_region_id_seq', 89, true);


--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 231
-- Name: type_room_type_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_room_type_room_id_seq', 9, true);


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 216
-- Name: us_login_and_password_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.us_login_and_password_user_id_seq', 1, true);


--
-- TOC entry 3227 (class 2606 OID 32902)
-- Name: categotyofhotels categotyofhotels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categotyofhotels
    ADD CONSTRAINT categotyofhotels_pkey PRIMARY KEY (category_id);


--
-- TOC entry 3225 (class 2606 OID 32888)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);


--
-- TOC entry 3221 (class 2606 OID 32873)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);


--
-- TOC entry 3229 (class 2606 OID 32907)
-- Name: hotels hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (hotel_id);


--
-- TOC entry 3233 (class 2606 OID 32939)
-- Name: numbers_of_hotel numbers_of_hotel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.numbers_of_hotel
    ADD CONSTRAINT numbers_of_hotel_pkey PRIMARY KEY (number_id);


--
-- TOC entry 3223 (class 2606 OID 32878)
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (region_id);


--
-- TOC entry 3231 (class 2606 OID 32934)
-- Name: type_room type_room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_room
    ADD CONSTRAINT type_room_pkey PRIMARY KEY (type_room_id);


--
-- TOC entry 3217 (class 2606 OID 32826)
-- Name: us_login_and_password us_login_and_password_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us_login_and_password
    ADD CONSTRAINT us_login_and_password_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3219 (class 2606 OID 32831)
-- Name: us_main_data us_main_data_fk_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us_main_data
    ADD CONSTRAINT us_main_data_fk_user_id_key UNIQUE (fk_user_id);


--
-- TOC entry 3243 (class 2606 OID 32953)
-- Name: booked_room booked_room_fk_numbers_of_hotel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booked_room
    ADD CONSTRAINT booked_room_fk_numbers_of_hotel_fkey FOREIGN KEY (fk_numbers_of_hotel) REFERENCES public.numbers_of_hotel(number_id);


--
-- TOC entry 3244 (class 2606 OID 32958)
-- Name: booked_room booked_room_fk_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booked_room
    ADD CONSTRAINT booked_room_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES public.us_login_and_password(user_id);


--
-- TOC entry 3236 (class 2606 OID 32889)
-- Name: cities cities_fk_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_fk_region_id_fkey FOREIGN KEY (fk_region_id) REFERENCES public.regions(region_id);


--
-- TOC entry 3237 (class 2606 OID 32918)
-- Name: hotels hotels_fk_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_fk_city_id_fkey FOREIGN KEY (fk_city_id) REFERENCES public.cities(city_id);


--
-- TOC entry 3238 (class 2606 OID 32908)
-- Name: hotels hotels_fk_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_fk_country_id_fkey FOREIGN KEY (fk_country_id) REFERENCES public.countries(country_id);


--
-- TOC entry 3239 (class 2606 OID 32923)
-- Name: hotels hotels_fk_hotel_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_fk_hotel_category_fkey FOREIGN KEY (fk_hotel_category) REFERENCES public.categotyofhotels(category_id);


--
-- TOC entry 3240 (class 2606 OID 32913)
-- Name: hotels hotels_fk_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_fk_region_id_fkey FOREIGN KEY (fk_region_id) REFERENCES public.regions(region_id);


--
-- TOC entry 3241 (class 2606 OID 32940)
-- Name: numbers_of_hotel numbers_of_hotel_fk_hotel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.numbers_of_hotel
    ADD CONSTRAINT numbers_of_hotel_fk_hotel_id_fkey FOREIGN KEY (fk_hotel_id) REFERENCES public.hotels(hotel_id);


--
-- TOC entry 3242 (class 2606 OID 32945)
-- Name: numbers_of_hotel numbers_of_hotel_fk_type_room_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.numbers_of_hotel
    ADD CONSTRAINT numbers_of_hotel_fk_type_room_fkey FOREIGN KEY (fk_type_room) REFERENCES public.type_room(type_room_id);


--
-- TOC entry 3235 (class 2606 OID 32879)
-- Name: regions regions_fk_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_fk_country_id_fkey FOREIGN KEY (fk_country_id) REFERENCES public.countries(country_id);


--
-- TOC entry 3234 (class 2606 OID 32832)
-- Name: us_main_data us_main_data_fk_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us_main_data
    ADD CONSTRAINT us_main_data_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES public.us_login_and_password(user_id);


-- Completed on 2023-05-15 02:06:01

--
-- PostgreSQL database dump complete
--

