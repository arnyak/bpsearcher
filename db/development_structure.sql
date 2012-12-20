--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bpcentralorgs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bpcentralorgs (
    id integer NOT NULL,
    bpno character varying(255),
    name1 character varying(255),
    name2 character varying(255),
    name3 character varying(255),
    name4 character varying(255),
    liquidationdate date,
    loc_no_1 character varying(255),
    loc_no_2 character varying(255),
    chk_digit character varying(255),
    zmod_task character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: bpcentralorgs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bpcentralorgs_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: bpcentralorgs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bpcentralorgs_id_seq OWNED BY bpcentralorgs.id;


--
-- Name: bpcentrals; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bpcentrals (
    id integer NOT NULL,
    bpno character varying(255),
    searchterm1 character varying(255),
    searchterm2 character varying(255),
    type character varying(255),
    centralblock character varying(255),
    titleletter character varying(255),
    notreleased character varying(255),
    standardaddress character varying(255),
    c_o_name character varying(255),
    city character varying(255),
    district character varying(255),
    postl_cod1 character varying(255),
    postl_cod2 character varying(255),
    postl_cod3 character varying(255),
    po_box character varying(255),
    po_w_o_no character varying(255),
    po_box_cit character varying(255),
    po_box_reg character varying(255),
    pobox_ctry character varying(255),
    dont_use_pb character varying(255),
    street character varying(255),
    house_no character varying(255),
    str_suppl1 character varying(255),
    str_suppl2 character varying(255),
    str_suppl3 character varying(255),
    location character varying(255),
    building character varying(255),
    floor character varying(255),
    room_no character varying(255),
    country character varying(255),
    region character varying(255),
    time_zone character varying(255),
    taxjurcode character varying(255),
    home_city character varying(255),
    transpzone character varying(255),
    langu character varying(255),
    comm_type character varying(255),
    bil_block_reason character varying(255),
    house_num2 character varying(255),
    bp_type character varying(255),
    ord_block_reason character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: bpcentrals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bpcentrals_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: bpcentrals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bpcentrals_id_seq OWNED BY bpcentrals.id;


--
-- Name: bpcontracts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bpcontracts (
    id integer NOT NULL,
    contract_no character varying(255),
    process_type character varying(255),
    serial_no character varying(255),
    contract_enddate date,
    sold_to character varying(255),
    sold_to_name character varying(255),
    ship_to character varying(255),
    ship_to_name character varying(255),
    payer character varying(255),
    payer_name character varying(255),
    bill_to character varying(255),
    bill_to_name character varying(255),
    product_252 character varying(255),
    description_252 character varying(255),
    product_170 character varying(255),
    description_170 character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: bpcontracts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bpcontracts_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: bpcontracts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bpcontracts_id_seq OWNED BY bpcontracts.id;


--
-- Name: bpmachines; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bpmachines (
    id integer NOT NULL,
    serial_no character varying(255),
    sold_to character varying(255),
    ship_to character varying(255),
    bill_to character varying(255),
    contract_no character varying(255),
    line_number character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: bpmachines_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bpmachines_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: bpmachines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bpmachines_id_seq OWNED BY bpmachines.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE bpcentralorgs ALTER COLUMN id SET DEFAULT nextval('bpcentralorgs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE bpcentrals ALTER COLUMN id SET DEFAULT nextval('bpcentrals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE bpcontracts ALTER COLUMN id SET DEFAULT nextval('bpcontracts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE bpmachines ALTER COLUMN id SET DEFAULT nextval('bpmachines_id_seq'::regclass);


--
-- Name: bpcentralorgs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bpcentralorgs
    ADD CONSTRAINT bpcentralorgs_pkey PRIMARY KEY (id);


--
-- Name: bpcentrals_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bpcentrals
    ADD CONSTRAINT bpcentrals_pkey PRIMARY KEY (id);


--
-- Name: bpcontracts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bpcontracts
    ADD CONSTRAINT bpcontracts_pkey PRIMARY KEY (id);


--
-- Name: bpmachines_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bpmachines
    ADD CONSTRAINT bpmachines_pkey PRIMARY KEY (id);


--
-- Name: index_bpcentralorgs_on_bpno; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_bpcentralorgs_on_bpno ON bpcentralorgs USING btree (bpno);


--
-- Name: index_bpcentralorgs_on_name1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_bpcentralorgs_on_name1 ON bpcentralorgs USING btree (name1);


--
-- Name: index_bpcentrals_on_bpno; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_bpcentrals_on_bpno ON bpcentrals USING btree (bpno);


--
-- Name: index_bpcentrals_on_postl_cod1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_bpcentrals_on_postl_cod1 ON bpcentrals USING btree (postl_cod1);


--
-- Name: index_bpcentrals_on_street; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_bpcentrals_on_street ON bpcentrals USING btree (street);


--
-- Name: index_bpcontracts_on_bill_to; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_bpcontracts_on_bill_to ON bpcontracts USING btree (bill_to);


--
-- Name: index_bpcontracts_on_ship_to; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_bpcontracts_on_ship_to ON bpcontracts USING btree (ship_to);


--
-- Name: index_bpcontracts_on_sold_to; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_bpcontracts_on_sold_to ON bpcontracts USING btree (sold_to);


--
-- Name: index_bpmachines_on_bill_to; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_bpmachines_on_bill_to ON bpmachines USING btree (bill_to);


--
-- Name: index_bpmachines_on_contract_no; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_bpmachines_on_contract_no ON bpmachines USING btree (contract_no);


--
-- Name: index_bpmachines_on_serial_no; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_bpmachines_on_serial_no ON bpmachines USING btree (serial_no);


--
-- Name: index_bpmachines_on_ship_to; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_bpmachines_on_ship_to ON bpmachines USING btree (ship_to);


--
-- Name: index_bpmachines_on_sold_to; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_bpmachines_on_sold_to ON bpmachines USING btree (sold_to);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20100920112044');

INSERT INTO schema_migrations (version) VALUES ('20100920112554');

INSERT INTO schema_migrations (version) VALUES ('20100920112640');

INSERT INTO schema_migrations (version) VALUES ('20100920114826');

INSERT INTO schema_migrations (version) VALUES ('20100923163227');

INSERT INTO schema_migrations (version) VALUES ('20100927123405');

INSERT INTO schema_migrations (version) VALUES ('20100928130220');