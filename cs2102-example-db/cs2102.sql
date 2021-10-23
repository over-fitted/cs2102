--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)

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
-- Name: airports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airports (
    code character(3) NOT NULL,
    name character varying(255) NOT NULL,
    city character varying(255),
    country_iso2 character(2)
);


ALTER TABLE public.airports OWNER TO postgres;

--
-- Name: borders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.borders (
    country1_iso2 character(2),
    country2_iso2 character(2)
);


ALTER TABLE public.borders OWNER TO postgres;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    name character varying(255) NOT NULL,
    country_iso2 character(2) NOT NULL,
    capital character varying(255),
    population integer,
    CONSTRAINT cities_population_check CHECK ((population >= 0))
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: connections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.connections (
    from_code character(3),
    to_code character(3)
);


ALTER TABLE public.connections OWNER TO postgres;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    iso2 character(2) NOT NULL,
    name character varying(255),
    population integer,
    gdp bigint,
    continent character varying(255) NOT NULL,
    CONSTRAINT countries_gdp_check CHECK ((gdp >= 0)),
    CONSTRAINT countries_population_check CHECK ((population >= 0))
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: countryurbanizationstats; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.countryurbanizationstats AS
SELECT
    NULL::character(2) AS iso2,
    NULL::character varying(255) AS name,
    NULL::integer AS overall_population,
    NULL::bigint AS city_population,
    NULL::numeric AS urbanization_rate;


ALTER TABLE public.countryurbanizationstats OWNER TO postgres;

--
-- Name: isolatedeuropeancountries; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.isolatedeuropeancountries AS
 SELECT n.iso2,
    n.name AS country
   FROM public.borders b,
    public.countries n
  WHERE ((b.country1_iso2 = n.iso2) AND (b.country2_iso2 IS NULL) AND ((n.continent)::text = 'Europe'::text));


ALTER TABLE public.isolatedeuropeancountries OWNER TO postgres;

--
-- Name: routes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.routes (
    from_code character(3) NOT NULL,
    to_code character(3) NOT NULL,
    airline_code character(3) NOT NULL
);


ALTER TABLE public.routes OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: visited; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visited (
    user_id integer NOT NULL,
    iso2 character(2) NOT NULL
);


ALTER TABLE public.visited OWNER TO postgres;

--
-- Data for Name: airports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airports (code, name, city, country_iso2) FROM stdin;
MAG	Madang Airport	Madang	PG
HGU	Mount Hagen Kagamuga Airport	Mount Hagen	PG
POM	Port Moresby Jacksons International Airport	Port Moresby	PG
WWK	Wewak International Airport	Wewak	PG
AEY	Akureyri Airport	Akureyri	IS
HFN	Hornafjörður Airport	Hofn	IS
KEF	Keflavik International Airport	Keflavik	IS
RKV	Reykjavik Airport	Reykjavik	IS
   	Winnipeg / St. Andrews Airport	Winnipeg	CA
YBL	Campbell River Airport	Campbell River	CA
YBR	Brandon Municipal Airport	Brandon	CA
YCD	Nanaimo Airport	Nanaimo	CA
YCG	Castlegar/West Kootenay Regional Airport	Castlegar	CA
YCH	Miramichi Airport	Chatham	CA
YCW	Chilliwack Airport	Chilliwack	CA
YDF	Deer Lake Airport	Deer Lake	CA
YDN	Dauphin Barker Airport	Dauphin	CA
YDQ	Dawson Creek Airport	Dawson Creek	CA
YEG	Edmonton International Airport	Edmonton	CA
YEN	Estevan Airport	Estevan	CA
YET	Edson Airport	Edson	CA
YFB	Iqaluit Airport	Iqaluit	CA
YFC	Fredericton Airport	Fredericton	CA
YFO	Flin Flon Airport	Flin Flon	CA
YGP	Gaspé (Michel-Pouliot) Airport	Gaspe	CA
YHD	Dryden Regional Airport	Dryden	CA
YHM	John C. Munro Hamilton International Airport	Hamilton	CA
YHU	Montréal / Saint-Hubert Airport	Montreal	CA
YHZ	Halifax / Stanfield International Airport	Halifax	CA
YJT	Stephenville Airport	Stephenville	CA
YKA	Kamloops Airport	Kamloops	CA
YKF	Waterloo Airport	Waterloo	CA
YKZ	Buttonville Municipal Airport	Toronto	CA
YLJ	Meadow Lake Airport	Meadow Lake	CA
YLL	Lloydminster Airport	Lloydminster	CA
YLW	Kelowna International Airport	Kelowna	CA
YMJ	Moose Jaw Air Vice Marshal C. M. McEwen Airport	Moose Jaw	CA
YMX	Montreal International (Mirabel) Airport	Montreal	CA
YND	Ottawa / Gatineau Airport	Gatineau	CA
YOD	CFB Cold Lake	Cold Lake	CA
YOW	Ottawa Macdonald-Cartier International Airport	Ottawa	CA
YPA	Prince Albert Glass Field	Prince Albert	CA
YPE	Peace River Airport	Peace River	CA
YPQ	Peterborough Airport	Peterborough	CA
YQG	Windsor Airport	Windsor	CA
YQK	Kenora Airport	Kenora	CA
YQL	Lethbridge County Airport	Lethbridge	CA
YQM	Greater Moncton International Airport	Moncton	CA
YQQ	Comox Airport	Comox	CA
YQR	Regina International Airport	Regina	CA
YQT	Thunder Bay Airport	Thunder Bay	CA
YQU	Grande Prairie Airport	Grande Prairie	CA
YQV	Yorkton Municipal Airport	Yorkton	CA
YQW	North Battleford Airport	North Battleford	CA
YQX	Gander International Airport	Gander	CA
YQZ	Quesnel Airport	Quesnel	CA
YRJ	Roberval Airport	Roberval	CA
YRM	Rocky Mountain House Airport	Rocky Mountain House	CA
YSB	Sudbury Airport	Sudbury	CA
YSC	Sherbrooke Airport	Sherbrooke	CA
YSU	Summerside Airport	Summerside	CA
YTH	Thompson Airport	Thompson	CA
YTS	Timmins/Victor M. Power	Timmins	CA
YTZ	Billy Bishop Toronto City Centre Airport	Toronto	CA
YUL	Montreal / Pierre Elliott Trudeau International Airport	Montreal	CA
YVC	La Ronge Airport	La Ronge	CA
YVR	Vancouver International Airport	Vancouver	CA
YWA	Petawawa Airport	Petawawa	CA
YWG	Winnipeg / James Armstrong Richardson International Airport	Winnipeg	CA
YWL	Williams Lake Airport	Williams Lake	CA
YXC	Cranbrook/Canadian Rockies International Airport	Cranbrook	CA
YXD	Edmonton City Centre (Blatchford Field) Airport	Edmonton	CA
YXE	Saskatoon John G. Diefenbaker International Airport	Saskatoon	CA
YXH	Medicine Hat Airport	Medicine Hat	CA
YXL	Sioux Lookout Airport	Sioux Lookout	CA
YXS	Prince George Airport	Prince George	CA
YXT	Northwest Regional Airport Terrace-Kitimat	Terrace	CA
YXU	London Airport	London	CA
YXX	Abbotsford Airport	Abbotsford	CA
YXY	Whitehorse / Erik Nielsen International Airport	Whitehorse	CA
YYB	North Bay Jack Garland Airport	North Bay	CA
YYC	Calgary International Airport	Calgary	CA
YYD	Smithers Airport	Smithers	CA
YYF	Penticton Airport	Penticton	CA
YYG	Charlottetown Airport	Charlottetown	CA
YYJ	Victoria International Airport	Victoria	CA
YYN	Swift Current Airport	Swift Current	CA
YYT	St. John's International Airport	St. John's	CA
YYU	Kapuskasing Airport	Kapuskasing	CA
YYZ	Lester B. Pearson International Airport	Toronto	CA
YZD	Downsview Airport	Toronto	CA
YZF	Yellowknife Airport	Yellowknife	CA
YZH	Slave Lake Airport	Slave Lake	CA
YZR	Chris Hadfield Airport	Sarnia	CA
QLD	Blida Airport	Blida	DZ
DJG	Djanet Inedbirene Airport	Djanet	DZ
VVZ	Illizi Takhamalt Airport	Illizi	DZ
TMR	Aguenar – Hadj Bey Akhamok Airport	Tamanrasset	DZ
GJL	Jijel Ferhat Abbas Airport	Jijel	DZ
AAE	Rabah Bitat Airport	Annaba	DZ
CZL	Mohamed Boudiaf International Airport	Constantine	DZ
TEE	Cheikh Larbi Tébessi Airport	Tebessa	DZ
TID	Bou Chekif Airport	Tiaret	DZ
TIN	Tindouf Airport	Tindouf	DZ
TAF	Tafaraoui Airport	Oran	DZ
TLM	Zenata – Messali El Hadj Airport	Tlemcen	DZ
ORN	Es Senia Airport	Oran	DZ
BFW	Sidi Bel Abbes Airport	Sidi Bel Abbes	DZ
AZR	Touat Cheikh Sidi Mohamed Belkebir Airport	Adrar	DZ
BSK	Biskra Airport	Biskra	DZ
ELG	El Golea Airport	El Golea	DZ
GHA	Noumérat - Moufdi Zakaria Airport	Ghardaia	DZ
HME	Oued Irara Airport	Hassi Messaoud	DZ
TGR	Touggourt Sidi Madhi Airport	Touggourt	DZ
LOO	Laghouat Airport	Laghouat	DZ
TMX	Timimoun Airport	Timimoun	DZ
OGX	Ain el Beida Airport	Ouargla	DZ
COO	Cadjehoun Airport	Cotonou	BJ
OUA	Ouagadougou Airport	Ouagadougou	BF
ACC	Kotoka International Airport	Accra	GH
TML	Tamale Airport	Tamale	GH
NYI	Sunyani Airport	Sunyani	GH
ABJ	Port Bouet Airport	Abidjan	CI
BYK	Bouaké Airport	Bouake	CI
DJO	Daloa Airport	Daloa	CI
HGO	Korhogo Airport	Korhogo	CI
MJC	Man Airport	Man	CI
ASK	Yamoussoukro Airport	Yamoussoukro	CI
ABV	Nnamdi Azikiwe International Airport	Abuja	NG
AKR	Akure Airport	Akure	NG
CBQ	Margaret Ekpo International Airport	Calabar	NG
ENU	Akanu Ibiam International Airport	Enugu	NG
IBA	Ibadan Airport	Ibadan	NG
ILR	Ilorin International Airport	Ilorin	NG
JOS	Yakubu Gowon Airport	Jos	NG
KAD	Kaduna Airport	Kaduna	NG
KAN	Mallam Aminu International Airport	Kano	NG
MIU	Maiduguri International Airport	Maiduguri	NG
MDI	Makurdi Airport	Makurdi	NG
LOS	Murtala Muhammed International Airport	Lagos	NG
MXJ	Minna Airport	Minna	NG
SKO	Sadiq Abubakar III International Airport	Sokoto	NG
YOL	Yola Airport	Yola	NG
ZAR	Zaria Airport	Zaria	NG
MFQ	Maradi Airport	Maradi	NE
NIM	Diori Hamani International Airport	Niamey	NE
THZ	Tahoua Airport	Tahoua	NE
AJY	Mano Dayak International Airport	Agadez	NE
ZND	Zinder Airport	Zinder	NE
MIR	Monastir Habib Bourguiba International Airport	Monastir	TN
TUN	Tunis Carthage International Airport	Tunis	TN
GAF	Gafsa Ksar International Airport	Gafsa	TN
GAE	Gabès Matmata International Airport	Gabes	TN
SFA	Sfax Thyna International Airport	Sfax	TN
TOE	Tozeur Nefta International Airport	Tozeur	TN
LFW	Lomé-Tokoin Airport	Lome	TG
ANR	Antwerp International Airport (Deurne)	Antwerp	BE
BRU	Brussels Airport	Brussels	BE
CRL	Brussels South Charleroi Airport	Charleroi	BE
LGG	Liège Airport	Liege	BE
AOC	Altenburg-Nobitz Airport	Altenburg	DE
IES	Riesa-Göhlis Airport	Riesa	DE
BBH	Barth Airport	Barth	DE
ZMG	Magdeburg \\City\\ Airport	Magdeburg	DE
CBU	Cottbus-Drewitz Airport	Cottbus	DE
SXF	Berlin-Schönefeld Airport	Berlin	DE
DRS	Dresden Airport	Dresden	DE
ERF	Erfurt Airport	Erfurt	DE
FRA	Frankfurt am Main Airport	Frankfurt	DE
FMO	Münster Osnabrück Airport	Munster	DE
HAM	Hamburg Airport	Hamburg	DE
THF	Berlin-Tempelhof International Airport	Berlin	DE
CGN	Cologne Bonn Airport	Cologne	DE
MUC	Munich Airport	Munich	DE
LEJ	Leipzig/Halle Airport	Leipzig	DE
STR	Stuttgart Airport	Stuttgart	DE
TXL	Berlin-Tegel Airport	Berlin	DE
HAJ	Hannover Airport	Hannover	DE
BRE	Bremen Airport	Bremen	DE
MHG	Mannheim-City Airport	Mannheim	DE
EIB	Eisenach-Kindel Airport	Eisenach	DE
XFW	Hamburg-Finkenwerder Airport	Hamburg	DE
KEL	Kiel-Holtenau Airport	Kiel	DE
ESS	Essen Mulheim Airport	Essen	DE
BFE	Bielefeld Airport	Bielefeld	DE
PAD	Paderborn Lippstadt Airport	Paderborn	DE
DTM	Dortmund Airport	Dortmund	DE
AGB	Augsburg Airport	Augsburg	DE
RBM	Straubing Airport	Straubing	DE
FDH	Friedrichshafen Airport	Friedrichshafen	DE
SZW	Schwerin Parchim Airport	Parchim	DE
BYU	Bayreuth Airport	Bayreuth	DE
HOQ	Hof-Plauen Airport	Hof	DE
ZQL	Donaueschingen-Villingen Airport	Donaueschingen	DE
BWE	Braunschweig-Wolfsburg Airport	Braunschweig	DE
KSF	Kassel-Calden Airport	Kassel	DE
BRV	Bremerhaven Airport	Bremerhaven	DE
EME	Emden Airport	Emden	DE
WVN	Wilhelmshaven-Mariensiel Airport	Wilhelmshaven	DE
BMK	Borkum Airport	Borkum	DE
NRD	Norderney Airport	Norderney	DE
FLF	Flensburg-Schäferhaus Airport	Flensburg	DE
GWT	Westerland Sylt Airport	Westerland	DE
KDL	Kärdla Airport	Kardla	EE
URE	Kuressaare Airport	Kuressaare	EE
EPU	Pärnu Airport	Parnu	EE
TAY	Tartu Airport	Tartu	EE
HEM	Helsinki Malmi Airport	Helsinki	FI
HEL	Helsinki Vantaa Airport	Helsinki	FI
HYV	Hyvinkää Airfield	Hyvinkaa	FI
KTQ	Kitee Airport	Kitee	FI
JOE	Joensuu Airport	Joensuu	FI
JYV	Jyvaskyla Airport	Jyvaskyla	FI
KAU	Kauhava Airport	Kauhava	FI
KEM	Kemi-Tornio Airport	Kemi	FI
KAJ	Kajaani Airport	Kajaani	FI
KHJ	Kauhajoki Airport	Kauhajoki	FI
KAO	Kuusamo Airport	Kuusamo	FI
KUO	Kuopio Airport	Kuopio	FI
LPP	Lappeenranta Airport	Lappeenranta	FI
MHQ	Mariehamn Airport	Mariehamn	FI
MIK	Mikkeli Airport	Mikkeli	FI
OUL	Oulu Airport	Oulu	FI
POR	Pori Airport	Pori	FI
RVN	Rovaniemi Airport	Rovaniemi	FI
SVL	Savonlinna Airport	Savonlinna	FI
SOT	Sodankyla Airport	Sodankyla	FI
TMP	Tampere-Pirkkala Airport	Tampere	FI
TKU	Turku Airport	Turku	FI
VAA	Vaasa Airport	Vaasa	FI
VRK	Varkaus Airport	Varkaus	FI
BFS	Belfast International Airport	Belfast	GB
BHD	George Best Belfast City Airport	Belfast	GB
BHX	Birmingham International Airport	Birmingham	GB
CVT	Coventry Airport	Coventry	GB
MAN	Manchester Airport	Manchester	GB
BRS	Bristol Airport	Bristol	GB
LPL	Liverpool John Lennon Airport	Liverpool	GB
LTN	London Luton Airport	London	GB
PLH	Plymouth City Airport	Plymouth	GB
BOH	Bournemouth Airport	Bournemouth	GB
SOU	Southampton Airport	Southampton	GB
LGW	London Gatwick Airport	London	GB
LCY	London City Airport	London	GB
FAB	Farnborough Airport	Farnborough	GB
LHR	London Heathrow Airport	London	GB
SEN	Southend Airport	Southend	GB
LYX	Lydd Airport	Lydd	GB
CAX	Carlisle Airport	Carlisle	GB
BLK	Blackpool International Airport	Blackpool	GB
LBA	Leeds Bradford Airport	Leeds	GB
NCL	Newcastle Airport	Newcastle	GB
KOI	Kirkwall Airport	Kirkwall	GB
WIC	Wick Airport	Wick	GB
ABZ	Aberdeen Dyce Airport	Aberdeen	GB
INV	Inverness Airport	Inverness	GB
GLA	Glasgow International Airport	Glasgow	GB
EDI	Edinburgh Airport	Edinburgh	GB
PIK	Glasgow Prestwick Airport	Prestwick	GB
DND	Dundee Airport	Dundee	GB
SYY	Stornoway Airport	Stornoway	GB
LMO	RAF Lossiemouth	Lossiemouth	GB
CBG	Cambridge Airport	Cambridge	GB
NWI	Norwich International Airport	Norwich	GB
STN	London Stansted Airport	London	GB
EXT	Exeter International Airport	Exeter	GB
FZO	Bristol Filton Airport	Bristol	GB
OXF	Oxford (Kidlington) Airport	Oxford	GB
MHZ	RAF Mildenhall	Mildenhall	GB
NHT	RAF Northolt	Northolt	GB
WTN	RAF Waddington	Waddington	GB
AMS	Amsterdam Airport Schiphol	Amsterdam	NL
MST	Maastricht Aachen Airport	Maastricht	NL
EIN	Eindhoven Airport	Eindhoven	NL
GRQ	Eelde Airport	Groningen	NL
LEY	Lelystad Airport	Lelystad	NL
LWR	Leeuwarden Air Base	Leeuwarden	NL
RTM	Rotterdam The Hague Airport	Rotterdam	NL
ORK	Cork Airport	Cork	IE
GWY	Galway Airport	Galway	IE
DUB	Dublin Airport	Dublin	IE
SNN	Shannon Airport	Shannon	IE
SXL	Sligo Airport	Sligo	IE
WAT	Waterford Airport	Waterford	IE
AAR	Aarhus Airport	Aarhus	DK
CPH	Copenhagen Kastrup Airport	Copenhagen	DK
EBJ	Esbjerg Airport	Esbjerg	DK
ODE	Odense Airport	Odense	DK
RKE	Copenhagen Roskilde Airport	Copenhagen	DK
AAL	Aalborg Airport	Aalborg	DK
AES	Ålesund Airport	Alesund	NO
ALF	Alta Airport	Alta	NO
BNN	Brønnøysund Airport	Bronnoysund	NO
BOO	Bodø Airport	Bodo	NO
BGO	Bergen Airport Flesland	Bergen	NO
KRS	Kristiansand Airport	Kristiansand	NO
FRO	Florø Airport	Floro	NO
OSL	Oslo Lufthavn	Oslo	NO
HAU	Haugesund Airport	Haugesund	NO
KSU	Kristiansund Airport (Kvernberget)	Kristiansund	NO
KKN	Kirkenes Airport (Høybuktmoen)	Kirkenes	NO
MOL	Molde Airport	Molde	NO
NTB	Notodden Airport	Notodden	NO
SKE	Skien Airport	Skien	NO
SSJ	Sandnessjøen Airport (Stokka)	Sandnessjoen	NO
TOS	Tromsø Airport,	Tromso	NO
TRF	Sandefjord Airport, Torp	Sandefjord	NO
TRD	Trondheim Airport Værnes	Trondheim	NO
SVG	Stavanger Airport Sola	Stavanger	NO
GDN	Gdańsk Lech Wałęsa Airport	Gdansk	PL
KRK	Kraków John Paul II International Airport	Krakow	PL
KTW	Katowice International Airport	Katowice	PL
POZ	Poznań-Ławica Airport	Poznan	PL
RZE	Rzeszów-Jasionka Airport	Rzeszow	PL
SZZ	Szczecin-Goleniów \\Solidarność\\ Airport	Szczecin	PL
WAW	Warsaw Chopin Airport	Warsaw	PL
WRO	Copernicus Wrocław Airport	Wroclaw	PL
IEG	Zielona Góra-Babimost Airport	Zielona Gora	PL
THN	Trollhättan-Vänersborg Airport	Trollhattan	SE
MXX	Mora Airport	Mora	SE
NYO	Stockholm Skavsta Airport	Stockholm	SE
KID	Kristianstad Airport	Kristianstad	SE
HAD	Halmstad Airport	Halmstad	SE
VXO	Växjö Kronoberg Airport	Vaxjo	SE
SDL	Sundsvall-Härnösand Airport	Sundsvall	SE
OER	Örnsköldsvik Airport	Ornskoldsvik	SE
KRN	Kiruna Airport	Kiruna	SE
SFT	Skellefteå Airport	Skelleftea	SE
UME	Umeå Airport	Umea	SE
ORB	Örebro Airport	Orebro	SE
VST	Stockholm Västerås Airport	Vasteras	SE
LLA	Luleå Airport	Lulea	SE
ARN	Stockholm-Arlanda Airport	Stockholm	SE
BMA	Stockholm-Bromma Airport	Stockholm	SE
BLE	Borlange Airport	Borlange	SE
GVX	Gävle Sandviken Airport	Gavle	SE
VBY	Visby Airport	Visby	SE
ZCN	Celle Airport	Celle	DE
FRZ	Fritzlar Airport	Fritzlar	DE
ZNF	Hanau Army Air Field	Hanau	DE
KZG	Flugplatz Kitzingen	Kitzingen	DE
GKE	Geilenkirchen Air Base	Geilenkirchen	DE
RLG	Rostock-Laage Airport	Laage	DE
WBG	Schleswig Air Base	Schleswig	DE
WIE	Wiesbaden Army Airfield	Wiesbaden	DE
IGS	Ingolstadt Manching Airport	Ingolstadt	DE
ALJ	Alexander Bay Airport	Alexander Bay	ZA
BFN	Bram Fischer International Airport	Bloemfontein	ZA
CPT	Cape Town International Airport	Cape Town	ZA
DUR	King Shaka International Airport	Durban	ZA
ELS	Ben Schoeman Airport	East London	ZA
GCJ	Grand Central Airport	Johannesburg	ZA
GRJ	George Airport	George	ZA
JNB	OR Tambo International Airport	Johannesburg	ZA
KXE	P C Pelser Airport	Klerksdorp	ZA
KIM	Kimberley Airport	Kimberley	ZA
KMH	Johan Pienaar Airport	Kuruman	ZA
HLA	Lanseria Airport	Johannesburg	ZA
LAY	Ladysmith Airport	Ladysmith	ZA
OUH	Oudtshoorn Airport	Oudtshoorn	ZA
PLZ	Port Elizabeth Airport	Port Elizabeth	ZA
PHW	Hendrik Van Eck Airport	Phalaborwa	ZA
PZB	Pietermaritzburg Airport	Pietermaritzburg	ZA
PCF	Potchefstroom Airport	Potchefstroom	ZA
UTW	Queenstown Airport	Queenstown	ZA
SBU	Springbok Airport	Springbok	ZA
LTA	Tzaneen Airport	Tzaneen	ZA
ULD	Prince Mangosuthu Buthelezi Airport	Ulundi	ZA
UTN	Pierre Van Ryneveld Airport	Upington	ZA
UTT	K. D. Matanzima Airport	Umtata	ZA
VRU	Vryburg Airport	Vryburg	ZA
VIR	Virginia Airport	Durban	ZA
PRY	Wonderboom Airport	Pretoria	ZA
FRW	Francistown Airport	Francistown	BW
JWA	Jwaneng Airport	Jwaneng	BW
BBK	Kasane Airport	Kasane	BW
MUB	Maun Airport	Maun	BW
BZV	Maya-Maya Airport	Brazzaville	CG
BGF	Bangui M'Poko International Airport	Bangui	CF
BBT	Berbérati Airport	Berberati	CF
BSG	Bata Airport	Bata	GQ
SSG	Malabo Airport	Malabo	GQ
DLA	Douala International Airport	Douala	CM
MVR	Salak Airport	Maroua	CM
FOM	Foumban Nkounja Airport	Foumban	CM
GOU	Garoua International Airport	Garoua	CM
BFX	Bafoussam Airport	Bafoussam	CM
BPC	Bamenda Airport	Bamenda	CM
YAO	Yaoundé Airport	Yaounde	CM
LVI	Livingstone Airport	Livingstone	ZM
LUN	Kenneth Kaunda International Airport Lusaka	Lusaka	ZM
MNR	Mongu Airport	Mongu	ZM
NLA	Simon Mwansa Kapwepwe International Airport	Ndola	ZM
HAH	Prince Said Ibrahim International Airport	Moroni	KM
TNR	Ivato Airport	Antananarivo	MG
ZVA	Miandrivazo Airport	Miandrivazo	MG
TMM	Toamasina Airport	Toamasina	MG
MOQ	Morondava Airport	Morondava	MG
DIE	Arrachart Airport	Antsiranana	MG
ANM	Antsirabato Airport	Antalaha	MG
MJN	Amborovy Airport	Mahajanga	MG
BPY	Besalampy Airport	Besalampy	MG
WMN	Maroantsetra Airport	Maroantsetra	MG
SVB	Sambava Airport	Sambava	MG
WAI	Ambalabe Airport	Antsohihy	MG
WFI	Fianarantsoa Airport	Fianarantsoa	MG
RVA	Farafangana Airport	Farafangana	MG
MNJ	Mananjary Airport	Mananjary	MG
MXM	Morombe Airport	Morombe	MG
TLE	Toliara Airport	Toliara	MG
BUG	Benguela Airport	Benguela	AO
CAB	Cabinda Airport	Cabinda	AO
NOV	Nova Lisboa Airport	Huambo	AO
LAD	Quatro de Fevereiro Airport	Luanda	AO
MEG	Malanje Airport	Malanje	AO
SPP	Menongue Airport	Menongue	AO
PBN	Porto Amboim Airport	Porto Amboim	AO
VHC	Saurimo Airport	Saurimo	AO
SDD	Lubango Airport	Lubango	AO
LUO	Luena Airport	Luena	AO
UGO	Uige Airport	Uige	AO
XGN	Xangongo Airport	Xangongo	AO
OYE	Oyem Airport	Oyem	GA
OKN	Okondja Airport	Okondja	GA
LBQ	Lambarene Airport	Lambarene	GA
BMM	Bitam Airport	Bitam	GA
MKU	Makokou Airport	Makokou	GA
LBV	Libreville Leon M'ba International Airport	Libreville	GA
MVB	M'Vengue El Hadj Omar Bongo Ondimba International Airport	Franceville	GA
TMS	São Tomé International Airport	Sao Tome	ST
BEW	Beira Airport	Beira	MZ
INH	Inhambane Airport	Inhambane	MZ
VXC	Lichinga Airport	Lichinga	MZ
MPM	Maputo Airport	Maputo	MZ
APL	Nampula Airport	Nampula	MZ
POL	Pemba Airport	Pemba	MZ
UEL	Quelimane Airport	Quelimane	MZ
TET	Chingozi Airport	Tete	MZ
AEH	Abeche Airport	Abeche	TD
MQQ	Moundou Airport	Moundou	TD
BUQ	Joshua Mqabuko Nkomo International Airport	Bulawayo	ZW
BFO	Buffalo Range Airport	Chiredzi	ZW
VFA	Victoria Falls International Airport	Victoria Falls	ZW
HRE	Robert Gabriel Mugabe International Airport	Harare	ZW
KAB	Kariba International Airport	Kariba	ZW
UTA	Mutare Airport	Mutare	ZW
MVZ	Masvingo International Airport	Masvingo	ZW
BLZ	Chileka International Airport	Blantyre	MW
KGJ	Karonga Airport	Karonga	MW
KBQ	Kasungu Airport	Kasungu	MW
LLW	Lilongwe International Airport	Lilongwe	MW
ZZU	Mzuzu Airport	Mzuzu	MW
MSU	Moshoeshoe I International Airport	Maseru	LS
FIH	Ndjili International Airport	Kinshasa	CD
NLO	Ndolo Airport	Kinshasa	CD
KKW	Kikwit Airport	Kikwit	CD
MDK	Mbandaka Airport	Mbandaka	CD
BDT	Gbadolite Airport	Gbadolite	CD
GMA	Gemena Airport	Gemena	CD
LIQ	Lisala Airport	Lisala	CD
FKI	Bangoka International Airport	Kisangani	CD
IRP	Matari Airport	Isiro	CD
BUX	Bunia Airport	Bunia	CD
GOM	Goma International Airport	Goma	CD
KND	Kindu Airport	Kindu	CD
KWZ	Kolwezi Airport	Kolwezi	CD
FMI	Kalemie Airport	Kalemie	CD
KGA	Kananga Airport	Kananga	CD
BKO	Modibo Keita International Airport	Bamako	ML
GAQ	Gao Airport	Gao	ML
KYS	Kayes Dag Dag Airport	Kayes	ML
MZI	Mopti Airport	Mopti	ML
BJL	Banjul International Airport	Banjul	GM
ACE	Lanzarote Airport	Arrecife	ES
FNA	Lungi International Airport	Freetown	SL
MLW	Spriggs Payne Airport	Monrovia	LR
ROB	Roberts International Airport	Monrovia	LR
AGA	Al Massira Airport	Agadir	MA
FEZ	Saïss Airport	Fes	MA
MEK	Bassatine Airport	Meknes	MA
RBA	Rabat-Salé Airport	Rabat	MA
CMN	Mohammed V International Airport	Casablanca	MA
RAK	Menara Airport	Marrakech	MA
TTU	Saniat R'mel Airport	Tetouan	MA
ZIG	Ziguinchor Airport	Ziguinchor	SN
KLC	Kaolack Airport	Kaolack	SN
DKR	Léopold Sédar Senghor International Airport	Dakar	SN
KGG	Kédougou Airport	Kedougou	SN
TUD	Tambacounda Airport	Tambacounda	SN
TIY	Tidjikja Airport	Tidjikja	MR
KFA	Kiffa Airport	Kiffa	MR
EMN	Néma Airport	Nema	MR
KED	Kaédi Airport	Kaedi	MR
ATR	Atar International Airport	Atar	MR
NDB	Nouadhibou International Airport	Nouadhibou	MR
FAA	Faranah Airport	Faranah	GN
LEK	Tata Airport	Labe	GN
ADD	Addis Ababa Bole International Airport	Addis Ababa	ET
DIR	Aba Tenna Dejazmach Yilma International Airport	Dire Dawa	ET
ASO	Asosa Airport	Asosa	ET
BJM	Bujumbura International Airport	Bujumbura	BI
ALY	El Nouzha Airport	Alexandria	EG
CAI	Cairo International Airport	Cairo	EG
CWE	Cairo West Airport	Cairo	EG
LXR	Luxor International Airport	Luxor	EG
PSD	Port Said Airport	Port Said	EG
ASW	Aswan International Airport	Aswan	EG
EDL	Eldoret International Airport	Eldoret	KE
GGM	Kakamega Airport	Kakamega	KE
KIS	Kisumu Airport	Kisumu	KE
KTL	Kitale Airport	Kitale	KE
LOK	Lodwar Airport	Lodwar	KE
LAU	Manda Airstrip	Lamu	KE
MBA	Mombasa Moi International Airport	Mombasa	KE
WIL	Nairobi Wilson Airport	Nairobi	KE
WJR	Wajir Airport	Wajir	KE
GHT	Ghat Airport	Ghat	LY
BEN	Benina International Airport	Benghazi	LY
TIP	Tripoli International Airport	Tripoli	LY
GYI	Gisenyi Airport	Gisenyi	RW
KGL	Kigali International Airport	Kigali	RW
DOG	Dongola Airport	Dongola	SD
ELF	El Fasher Airport	El Fasher	SD
KSL	Kassala Airport	Kassala	SD
KDX	Kadugli Airport	Kadugli	SD
EBD	El Obeid Airport	El Obeid	SD
JUB	Juba International Airport	Juba	SS
KRT	Khartoum International Airport	Khartoum	SD
ARK	Arusha Airport	Arusha	TZ
DOD	Dodoma Airport	Dodoma	TZ
IRI	Iringa Airport	Iringa	TZ
MYW	Mtwara Airport	Mtwara	TZ
MWZ	Mwanza Airport	Mwanza	TZ
TGT	Tanga Airport	Tanga	TZ
ZNZ	Abeid Amani Karume International Airport	Zanzibar	TZ
EBB	Entebbe International Airport	Entebbe	UG
SRT	Soroti Airport	Soroti	UG
TIA	Tirana International Airport Mother Teresa	Tirana	AL
PDV	Plovdiv International Airport	Plovdiv	BG
SOF	Sofia Airport	Sofia	BG
SZR	Stara Zagora Airport	Stara Zagora	BG
VAR	Varna Airport	Varna	BG
LCA	Larnaca International Airport	Larnaca	CY
PFO	Paphos International Airport	Paphos	CY
DBV	Dubrovnik Airport	Dubrovnik	HR
OSI	Osijek Airport	Osijek	HR
PUY	Pula Airport	Pula	HR
RJK	Rijeka Airport	Rijeka	HR
SPU	Split Airport	Split	HR
ZAG	Zagreb Airport	Zagreb	HR
ZAD	Zadar Airport	Zadar	HR
ABC	Albacete-Los Llanos Airport	Albacete	ES
ALC	Alicante International Airport	Alicante	ES
LEI	Almería International Airport	Almeria	ES
OVD	Asturias Airport	Aviles	ES
ODB	Córdoba Airport	Cordoba	ES
BIO	Bilbao Airport	Bilbao	ES
BCN	Barcelona International Airport	Barcelona	ES
BJZ	Badajoz Airport	Badajoz	ES
GRX	Federico Garcia Lorca Airport	Granada	ES
IBZ	Ibiza Airport	Ibiza	ES
MJV	San Javier Airport	Murcia	ES
MAD	Adolfo Suárez Madrid–Barajas Airport	Madrid	ES
AGP	Málaga Airport	Malaga	ES
OZP	Moron Air Base	Sevilla	ES
PNA	Pamplona Airport	Pamplona	ES
SLM	Salamanca Airport	Salamanca	ES
TOJ	Torrejón Airport	Madrid	ES
VLC	Valencia Airport	Valencia	ES
VLL	Valladolid Airport	Valladolid	ES
VGO	Vigo Airport	Vigo	ES
SDR	Santander Airport	Santander	ES
ZAZ	Zaragoza Air Base	Zaragoza	ES
SVQ	Sevilla Airport	Sevilla	ES
CQF	Calais-Dunkerque Airport	Calais	FR
XVS	Valenciennes-Denain Airport	Valenciennes	FR
AGF	Agen-La Garenne Airport	Agen	FR
BOD	Bordeaux-Mérignac Airport	Bordeaux	FR
EGC	Bergerac-Roumanière Airport	Bergerac	FR
PIS	Poitiers-Biard Airport	Poitiers	FR
LIG	Limoges Airport	Limoges	FR
NIT	Niort-Souché Airport	Niort	FR
TLS	Toulouse-Blagnac Airport	Toulouse	FR
PUF	Pau Pyrénées Airport	Pau	FR
LDE	Tarbes-Lourdes-Pyrénées Airport	Tarbes	FR
ANG	Angoulême-Brie-Champniers Airport	Angouleme	FR
PGX	Périgueux-Bassillac Airport	Perigueux	FR
LBI	Albi-Le Séquestre Airport	Albi	FR
DCM	Castres-Mazamet Airport	Castres	FR
RDZ	Rodez-Marcillac Airport	Rodez	FR
XMW	Montauban Airport	Montauban	FR
RCO	Rochefort-Saint-Agnant (BA 721) Airport	Rochefort	FR
CMR	Colmar-Houssen Airport	Colmar	FR
DLE	Dole-Tavaux Airport	Dole	FR
ETZ	Metz-Nancy-Lorraine Airport	Metz	FR
BIA	Bastia-Poretta Airport	Bastia	FR
AJA	Ajaccio-Napoléon Bonaparte Airport	Ajaccio	FR
AUF	Auxerre-Branches Airport	Auxerre	FR
CMF	Chambéry-Savoie Airport	Chambery	FR
CFE	Clermont-Ferrand Auvergne Airport	Clermont-Ferrand	FR
BOU	Bourges Airport	Bourges	FR
QNJ	Annemasse Airport	Annemasse	FR
LYS	Lyon Saint-Exupéry Airport	Lyon	FR
RNE	Roanne-Renaison Airport	Roanne	FR
NCY	Annecy-Haute-Savoie-Mont Blanc Airport	Annecy	FR
GNB	Grenoble-Isère Airport	Grenoble	FR
VAF	Valence-Chabeuil Airport	Valence	FR
VHY	Vichy-Charmeil Airport	Vichy	FR
AUR	Aurillac Airport	Aurillac	FR
CHR	Châteauroux-Déols \\Marcel Dassault\\ Airport	Chateauroux	FR
LYN	Lyon-Bron Airport	Lyon	FR
CEQ	Cannes-Mandelieu Airport	Cannes	FR
CCF	Carcassonne Airport	Carcassonne	FR
MRS	Marseille Provence Airport	Marseille	FR
NCE	Nice-Côte d'Azur Airport	Nice	FR
XOG	Orange-Caritat (BA 115) Air Base	Orange	FR
PGF	Perpignan-Rivesaltes (Llabanère) Airport	Perpignan	FR
MPL	Montpellier-Méditerranée Airport	Montpellier	FR
BZR	Béziers-Vias Airport	Beziers	FR
AVN	Avignon-Caumont Airport	Avignon	FR
BVA	Paris Beauvais Tillé Airport	Beauvais	FR
EVX	Évreux-Fauville (BA 105) Air Base	Evreux	FR
LEH	Le Havre Octeville Airport	Le Havre	FR
XAB	Abbeville	Abbeville	FR
ORE	Orléans-Bricy (BA 123) Air Base	Orleans	FR
URO	Rouen Airport	Rouen	FR
TUF	Tours-Val-de-Loire Airport	Tours	FR
CET	Cholet Le Pontreau Airport	Cholet	FR
LVA	Laval-Entrammes Airport	Laval	FR
LBG	Paris-Le Bourget Airport	Paris	FR
CSF	Creil Air Base	Creil	FR
CDG	Charles de Gaulle International Airport	Paris	FR
ORY	Paris-Orly Airport	Paris	FR
POX	Pontoise - Cormeilles-en-Vexin Airport	Pontoise	FR
NVS	Nevers-Fourchambault Airport	Nevers	FR
XME	Maubeuge-Élesmes Airport	Maubeuge	FR
LIL	Lille-Lesquin Airport	Lille	FR
BES	Brest Bretagne Airport	Brest	FR
CER	Cherbourg-Maupertus Airport	Cherbourg	FR
LRT	Lorient South Brittany (Bretagne Sud) Airport	Lorient	FR
CFR	Caen-Carpiquet Airport	Caen	FR
LME	Le Mans-Arnage Airport	Le Mans	FR
RNS	Rennes-Saint-Jacques Airport	Rennes	FR
UIP	Quimper-Cornouaille Airport	Quimper	FR
NTE	Nantes Atlantique Airport	Nantes	FR
VNE	Vannes-Meucon Airport	Vannes	FR
BSL	EuroAirport Basel-Mulhouse-Freiburg Airport	Mulhouse	FR
DIJ	Dijon-Bourgogne Airport	Dijon	FR
MZM	Metz-Frescaty (BA 128) Air Base	Metz	FR
EPL	Épinal-Mirecourt Airport	Epinal	FR
ENC	Nancy-Essey Airport	Nancy	FR
RHE	Reims-Champagne (BA 112) Air Base	Reims	FR
SXB	Strasbourg Airport	Strasbourg	FR
TLN	Toulon-Hyères Airport	Hyeres	FR
FNI	Nîmes-Arles-Camargue Airport	Nimes	FR
JKH	Chios Island National Airport	Chios	GR
IOA	Ioannina Airport	Ioannina	GR
KSO	Kastoria National Airport	Kastoria	GR
KLX	Kalamata Airport	Kalamata	GR
KGS	Kos Airport	Kos	GR
KVA	Alexander the Great International Airport	Kavala	GR
KZI	Filippos Airport	Kozani	GR
MJT	Mytilene International Airport	Mytilini	GR
PVK	Aktion National Airport	Preveza	GR
CHQ	Chania International Airport	Chania	GR
SPJ	Sparti Airport	Sparti	GR
SKG	Thessaloniki Macedonia International Airport	Thessaloniki	GR
BUD	Budapest Liszt Ferenc International Airport	Budapest	HU
DEB	Debrecen International Airport	Debrecen	HU
CRV	Crotone Airport	Crotone	IT
BRI	Bari Karol Wojtyła Airport	Bari	IT
FOG	Foggia \\Gino Lisa\\ Airport	Foggia	IT
LCC	Lecce Galatina Air Base	Lecce	IT
PSR	Pescara International Airport	Pescara	IT
BDS	Brindisi – Salento Airport	Brindisi	IT
CTA	Catania-Fontanarossa Airport	Catania	IT
PMO	Falcone–Borsellino Airport	Palermo	IT
CAG	Cagliari Elmas Airport	Cagliari	IT
OLB	Olbia Costa Smeralda Airport	Olbia	IT
BGY	Il Caravaggio International Airport	Bergamo	IT
GOA	Genoa Cristoforo Colombo Airport	Genoa	IT
LIN	Milano Linate Airport	Milan	IT
PMF	Parma Airport	Parma	IT
BZO	Bolzano Airport	Bolzano	IT
BLQ	Bologna Guglielmo Marconi Airport	Bologna	IT
TSF	Treviso-Sant'Angelo Airport	Treviso	IT
FRL	Forlì Airport	Forli	IT
VBS	Brescia Airport	Brescia	IT
RMI	Federico Fellini International Airport	Rimini	IT
VIC	Vicenza Airport	Vicenza	IT
QPA	Padova Airport	Padova	IT
VCE	Venice Marco Polo Airport	Venice	IT
SAY	Siena-Ampugnano Airport	Siena	IT
CIA	Ciampino–G. B. Pastine International Airport	Rome	IT
FCO	Leonardo da Vinci–Fiumicino Airport	Rome	IT
QLT	Latina Air Base	Latina	IT
NAP	Naples International Airport	Naples	IT
PSA	Pisa International Airport	Pisa	IT
FLR	Peretola Airport	Florence	IT
PEG	Perugia San Francesco d'Assisi – Umbria International Airport	Perugia	IT
LJU	Ljubljana Jože Pučnik Airport	Ljubljana	SI
MBX	Maribor Airport	Maribor	SI
UHE	Kunovice Airport	Kunovice	CZ
KLV	Karlovy Vary International Airport	Karlovy Vary	CZ
OSR	Ostrava Leos Janáček Airport	Ostrava	CZ
PED	Pardubice Airport	Pardubice	CZ
PRV	Přerov Air Base	Prerov	CZ
PRG	Václav Havel Airport Prague	Prague	CZ
BRQ	Brno-Tuřany Airport	Brno	CZ
HFA	Haifa International Airport	Haifa	IL
GRZ	Graz Airport	Graz	AT
INN	Innsbruck Airport	Innsbruck	AT
LNZ	Linz Hörsching Airport	Linz	AT
SZG	Salzburg Airport	Salzburg	AT
VIE	Vienna International Airport	Vienna	AT
BGC	Bragança Airport	Braganca	PT
BGZ	Braga Municipal Aerodrome	Braga	PT
FAO	Faro Airport	Faro	PT
HOR	Horta Airport	Horta	PT
PDL	João Paulo II Airport	Ponta Delgada	PT
PRM	Portimão Airport	Portimao	PT
OPO	Francisco de Sá Carneiro Airport	Porto	PT
LIS	Humberto Delgado Airport (Lisbon Portela Airport)	Lisbon	PT
VRL	Vila Real Airport	Vila Real	PT
VSE	Aerodromo Goncalves Lobato (Viseu Airport)	Viseu	PT
OMO	Mostar International Airport	Mostar	BA
SJJ	Sarajevo International Airport	Sarajevo	BA
ARW	Arad International Airport	Arad	RO
BCM	Bacău Airport	Bacau	RO
BAY	Tautii Magheraus Airport	Baia Mare	RO
BBU	Băneasa International Airport	Bucharest	RO
CND	Mihail Kogălniceanu International Airport	Constanta	RO
CRA	Craiova Airport	Craiova	RO
IAS	Iaşi Airport	Iasi	RO
OMR	Oradea International Airport	Oradea	RO
OTP	Henri Coandă International Airport	Bucharest	RO
SBZ	Sibiu International Airport	Sibiu	RO
SUJ	Satu Mare Airport	Satu Mare	RO
SCV	Suceava Stefan cel Mare Airport	Suceava	RO
TCE	Tulcea Airport	Tulcea	RO
TSR	Timişoara Traian Vuia Airport	Timisoara	RO
GVA	Geneva Cointrin International Airport	Geneva	CH
SIR	Sion Airport	Sion	CH
EML	Emmen Air Base	Emmen	CH
LUG	Lugano Airport	Lugano	CH
BRN	Bern Belp Airport	Bern	CH
ZHI	Grenchen Airport	Grenchen	CH
ZRH	Zürich Airport	Zurich	CH
ESB	Esenboğa International Airport	Ankara	TR
ANK	Etimesgut Air Base	Ankara	TR
ADA	Adana Airport	Adana	TR
UAB	İncirlik Air Base	Adana	TR
AYT	Antalya International Airport	Antalya	TR
GZT	Gaziantep International Airport	Gaziantep	TR
KYA	Konya Airport	Konya	TR
VAS	Sivas Nuri Demirağ Airport	Sivas	TR
MLX	Malatya Erhaç Airport	Malatya	TR
ASR	Kayseri Erkilet Airport	Kayseri	TR
TJK	Tokat Airport	Tokat	TR
DNZ	Çardak Airport	Denizli	TR
ISL	Atatürk International Airport	Istanbul	TR
BZI	Balıkesir Merkez Airport	Balikesir	TR
BDM	Bandırma Airport	Bandirma	TR
ESK	Eskişehir Air Base	Eskisehir	TR
ADB	Adnan Menderes International Airport	Izmir	TR
IGL	Çiğli Airport	Izmir	TR
EZS	Elazığ Airport	Elazig	TR
ERC	Erzincan Airport	Erzincan	TR
ERZ	Erzurum International Airport	Erzurum	TR
TZX	Trabzon International Airport	Trabzon	TR
VAN	Van Ferit Melen Airport	Van	TR
BAL	Batman Airport	Batman	TR
SXZ	Siirt Airport	Siirt	TR
KIV	Chişinău International Airport	Chisinau	MD
OHD	Ohrid St. Paul the Apostle Airport	Ohrid	MK
SKP	Skopje Alexander the Great Airport	Skopje	MK
GIB	Gibraltar Airport	Gibraltar	GI
BEG	Belgrade Nikola Tesla Airport	Belgrade	RS
INI	Nis Airport	Nis	RS
TGD	Podgorica Airport	Podgorica	ME
TIV	Tivat Airport	Tivat	ME
BTS	M. R. Štefánik Airport	Bratislava	SK
KSC	Košice Airport	Kosice	SK
TAT	Poprad-Tatry Airport	Poprad	SK
BRX	Maria Montez International Airport	Barahona	DO
LRM	Casa De Campo International Airport	La Romana	DO
POP	Gregorio Luperon International Airport	Puerto Plata	DO
SDQ	Las Américas International Airport	Santo Domingo	DO
STI	Cibao International Airport	Santiago	DO
CBV	Coban Airport	Coban	GT
GUA	La Aurora Airport	Guatemala City	GT
RER	Retalhuleu Airport	Retalhuleu	GT
LCE	Goloson International Airport	La Ceiba	HN
SAP	Ramón Villeda Morales International Airport	San Pedro Sula	HN
RTB	Juan Manuel Galvez International Airport	Roatan	HN
TEA	Tela Airport	Tela	HN
TGU	Toncontín International Airport	Tegucigalpa	HN
TJI	Trujillo Airport	Trujillo	HN
KIN	Norman Manley International Airport	Kingston	JM
MBJ	Sangster International Airport	Montego Bay	JM
POT	Ken Jones Airport	Port Antonio	JM
KTP	Tinson Pen Airport	Kingston	JM
NTR	Del Norte International Airport	Monterrey	MX
AGU	Jesús Terán Paredo International Airport	Aguascalientes	MX
CVJ	General Mariano Matamoros Airport	Cuernavaca	MX
ACN	Ciudad Acuña New International Airport	Ciudad Acuna	MX
NCG	Nuevo Casas Grandes Airport	Nuevo Casas Grandes	MX
CUL	Bachigualato Federal International Airport	Culiacan	MX
CTM	Chetumal International Airport	Chetumal	MX
CEN	Ciudad Obregón International Airport	Ciudad Obregon	MX
CPE	Ingeniero Alberto Acuña Ongay International Airport	Campeche	MX
CUU	General Roberto Fierro Villalobos International Airport	Chihuahua	MX
CVM	General Pedro Jose Mendez International Airport	Ciudad Victoria	MX
CZM	Cozumel International Airport	Cozumel	MX
DGO	General Guadalupe Victoria International Airport	Durango	MX
TPQ	Amado Nervo National Airport	Tepic	MX
ESE	Ensenada International Airport	Ensenada	MX
GDL	Don Miguel Hidalgo Y Costilla International Airport	Guadalajara	MX
TCN	Tehuacan Airport	Tehuacan	MX
HMO	General Ignacio P. Garcia International Airport	Hermosillo	MX
CLQ	Licenciado Miguel de la Madrid Airport	Colima	MX
ISJ	Isla Mujeres Airport	Isla Mujeres	MX
SLW	Plan De Guadalupe International Airport	Saltillo	MX
LMM	Valle del Fuerte International Airport	Los Mochis	MX
LAP	Manuel Márquez de León International Airport	La Paz	MX
LTO	Loreto International Airport	Loreto	MX
MAM	General Servando Canales International Airport	Matamoros	MX
MID	Licenciado Manuel Crescencio Rejon Int Airport	Merida	MX
MXL	General Rodolfo Sánchez Taboada International Airport	Mexicali	MX
MLM	General Francisco J. Mujica International Airport	Morelia	MX
MTT	Minatitlán/Coatzacoalcos National Airport	Minatitlan	MX
LOV	Monclova International Airport	Monclova	MX
MEX	Licenciado Benito Juarez International Airport	Mexico City	MX
MTY	General Mariano Escobedo International Airport	Monterrey	MX
MZT	General Rafael Buelna International Airport	Mazatlan	MX
NOG	Nogales International Airport	Nogales	MX
NLD	Quetzalcóatl International Airport	Nuevo Laredo	MX
OAX	Xoxocotlán International Airport	Oaxaca	MX
PBC	Hermanos Serdán International Airport	Puebla	MX
PDS	Piedras Negras International Airport	Piedras Negras	MX
UPN	Licenciado y General Ignacio Lopez Rayon Airport	Uruapan	MX
PVR	Licenciado Gustavo Díaz Ordaz International Airport	Puerto Vallarta	MX
PXM	Puerto Escondido International Airport	Puerto Escondido	MX
QRO	Querétaro Intercontinental Airport	Queretaro	MX
REX	General Lucio Blanco International Airport	Reynosa	MX
SLP	Ponciano Arriaga International Airport	San Luis Potosi	MX
TRC	Francisco Sarabia International Airport	Torreon	MX
TIJ	General Abelardo L. Rodríguez International Airport	Tijuana	MX
TAM	General Francisco Javier Mina International Airport	Tampico	MX
TSL	Tamuin Airport	Tamuin	MX
TLC	Licenciado Adolfo Lopez Mateos International Airport	Toluca	MX
TAP	Tapachula International Airport	Tapachula	MX
CUN	Cancún International Airport	Cancun	MX
VSA	Carlos Rovirosa Pérez International Airport	Villahermosa	MX
ZCL	General Leobardo C. Ruiz International Airport	Zacatecas	MX
ZIH	Ixtapa Zihuatanejo International Airport	Zihuatanejo	MX
ZMM	Zamora Airport	Zamora	MX
ZLO	Playa De Oro International Airport	Manzanillo	MX
BEF	Bluefields Airport	Bluefields	NI
MGA	Augusto C. Sandino (Managua) International Airport	Managua	NI
DAV	Enrique Malek International Airport	David	PA
SYP	Ruben Cantu Airport	Santiago	PA
PTY	Tocumen International Airport	Panama City	PA
BAI	Buenos Aires Airport	Buenos Aires	CR
GLF	Golfito Airport	Golfito	CR
LIR	Daniel Oduber Quiros International Airport	Liberia	CR
SJO	Juan Santamaria International Airport	San Jose	CR
SAL	Monseñor Óscar Arnulfo Romero International Airport	San Salvador	SV
JAK	Jacmel Airport	Jacmel	HT
BYM	Carlos Manuel de Cespedes Airport	Bayamo	CU
CFG	Jaime Gonzalez Airport	Cienfuegos	CU
CMW	Ignacio Agramonte International Airport	Camaguey	CU
NBW	Leeward Point Field	Guantanamo	CU
GAO	Mariana Grajales Airport	Guantanamo	CU
HAV	José Martí International Airport	Havana	CU
HOG	Frank Pais International Airport	Holguin	CU
MOA	Orestes Acosta Airport	Moa	CU
MZO	Sierra Maestra Airport	Manzanillo	CU
GER	Rafael Cabrera Airport	Nueva Gerona	CU
SNU	Abel Santamaria Airport	Santa Clara	CU
USS	Sancti Spiritus Airport	Sancti Spiritus	CU
VRA	Juan Gualberto Gomez International Airport	Varadero	CU
VTU	Hermanos Ameijeiras Airport	Las Tunas	CU
NAS	Lynden Pindling International Airport	Nassau	BS
BZE	Philip S. W. Goldson International Airport	Belize City	BZ
RAR	Rarotonga International Airport	Avarua	CK
SUV	Nausori International Airport	Nausori	FJ
TRW	Bonriki International Airport	Tarawa	KI
PPG	Pago Pago International Airport	Pago Pago	AS
KNQ	Koné Airport	Kone	NC
GEA	Nouméa Magenta Airport	Noumea	NC
NOU	La Tontouta International Airport	Noumea	NC
AKL	Auckland International Airport	Auckland	NZ
TUO	Taupo Airport	Taupo	NZ
CHC	Christchurch International Airport	Christchurch	NZ
DUD	Dunedin Airport	Dunedin	NZ
GIS	Gisborne Airport	Gisborne	NZ
HKK	Hokitika Airfield	Hokitika	NZ
HLZ	Hamilton International Airport	Hamilton	NZ
KKE	Kerikeri Airport	Kerikeri	NZ
KAT	Kaitaia Airport	Kaitaia	NZ
ALR	Alexandra Airport	Alexandra	NZ
MRO	Hood Airport	Masterton	NZ
NPL	New Plymouth Airport	New Plymouth	NZ
NSN	Nelson Airport	Nelson	NZ
IVC	Invercargill Airport	Invercargill	NZ
PMR	Palmerston North Airport	Palmerston North	NZ
PPQ	Paraparaumu Airport	Paraparaumu	NZ
ROT	Rotorua Regional Airport	Rotorua	NZ
TRG	Tauranga Airport	Tauranga	NZ
TIU	Timaru Airport	Timaru	NZ
WKA	Wanaka Airport	Wanaka	NZ
WHK	Whakatane Airport	Whakatane	NZ
WLG	Wellington International Airport	Wellington	NZ
WRE	Whangarei Airport	Whangarei	NZ
WSZ	Westport Airport	Westport	NZ
HEA	Herat Airport	Herat	AF
JAA	Jalalabad Airport	Jalalabad	AF
KBL	Hamid Karzai International Airport	Kabul	AF
KDH	Kandahar Airport	Kandahar	AF
UND	Konduz Airport	Kunduz	AF
AHB	Abha Regional Airport	Abha	SA
DHA	King Abdulaziz Air Base	Dhahran	SA
JED	King Abdulaziz International Airport	Jeddah	SA
RAH	Rafha Domestic Airport	Rafha	SA
RUH	King Khaled International Airport	Riyadh	SA
TUU	Tabuk Airport	Tabuk	SA
DEF	Dezful Airport	Dezful	IR
SDG	Sanandaj Airport	Sanandaj	IR
KKS	Kashan Airport	Kashan	IR
IFN	Esfahan Shahid Beheshti International Airport	Esfahan	IR
RAS	Sardar-e-Jangal Airport	Rasht	IR
AJK	Arak Airport	Arak	IR
JYR	Jiroft Airport	Jiroft	IR
KER	Kerman Airport	Kerman	IR
SYJ	Sirjan Airport	Sirjan	IR
XBJ	Birjand Airport	Birjand	IR
FAZ	Fasa Airport	Fasa	IR
JAR	Jahrom Airport	Jahrom	IR
SYZ	Shiraz Shahid Dastghaib International Airport	Shiraz	IR
TBZ	Tabriz International Airport	Tabriz	IR
JWN	Zanjan Airport	Zanjan	IR
AZD	Shahid Sadooghi Airport	Yazd	IR
ACZ	Zabol Airport	Zabol	IR
ZAH	Zahedan International Airport	Zahedan	IR
AMM	Queen Alia International Airport	Amman	JO
ADJ	Amman-Marka International Airport	Amman	JO
BEY	Beirut Rafic Hariri International Airport	Beirut	LB
AUH	Abu Dhabi International Airport	Abu Dhabi	AE
AZI	Bateen Airport	Abu Dhabi	AE
DHF	Al Dhafra Air Base	Abu Dhabi	AE
DXB	Dubai International Airport	Dubai	AE
SHJ	Sharjah International Airport	Sharjah	AE
KHS	Khasab Air Base	Khasab	OM
MCT	Muscat International Airport	Muscat	OM
SLL	Salalah Airport	Salalah	OM
LYP	Faisalabad International Airport	Faisalabad	PK
GWD	Gwadar International Airport	Gwadar	PK
GIL	Gilgit Airport	Gilgit	PK
KHI	Jinnah International Airport	Karachi	PK
LHE	Alama Iqbal International Airport	Lahore	PK
MFG	Muzaffarabad Airport	Muzaffarabad	PK
MWD	Mianwali Air Base	Mianwali	PK
MUX	Multan International Airport	Multan	PK
WNS	Shaheed Benazirabad Airport	Nawabshah	PK
PEW	Peshawar International Airport	Peshawar	PK
UET	Quetta International Airport	Quetta	PK
SKZ	Sukkur Airport	Sukkur	PK
SDT	Saidu Sharif Airport	Saidu Sharif	PK
PZH	Zhob Airport	Zhob	PK
ALP	Aleppo International Airport	Aleppo	SY
DAM	Damascus International Airport	Damascus	SY
LTK	Bassel Al-Assad International Airport	Latakia	SY
DIA	Doha International Airport	Doha	QA
MAJ	Marshall Islands International Airport	Majuro	MH
KHH	Kaohsiung International Airport	Kaohsiung	TW
CYI	Chiayi Airport	Chiayi	TW
RMQ	Taichung Ching Chuang Kang Airport	Taichung	TW
TNN	Tainan Airport	Tainan	TW
HSZ	Hsinchu Air Base	Hsinchu	TW
PIF	Pingtung North Airport	Pingtung	TW
TSA	Taipei Songshan Airport	Taipei	TW
TPE	Taiwan Taoyuan International Airport	Taipei	TW
HUN	Hualien Airport	Hualien	TW
CTS	New Chitose Airport	Sapporo	JP
HKD	Hakodate Airport	Hakodate	JP
UBJ	Yamaguchi Ube Airport	Yamaguchi	JP
TSJ	Tsushima Airport	Tsushima	JP
AKJ	Asahikawa Airport	Asahikawa	JP
FUK	Fukuoka Airport	Fukuoka	JP
KOJ	Kagoshima Airport	Kagoshima	JP
KMI	Miyazaki Airport	Miyazaki	JP
OIT	Oita Airport	Oita	JP
KMJ	Kumamoto Airport	Kumamoto	JP
NGS	Nagasaki Airport	Nagasaki	JP
FKJ	Fukui Airport	Fukui	JP
QGU	Gifu Airport	Gifu	JP
KMQ	Komatsu Airport	Kanazawa	JP
TOY	Toyama Airport	Toyama	JP
HIJ	Hiroshima Airport	Hiroshima	JP
OKJ	Okayama Airport	Okayama	JP
IZO	Izumo Airport	Izumo	JP
KCZ	Kōchi Ryōma Airport	Kochi	JP
MYJ	Matsuyama Airport	Matsuyama	JP
ITM	Osaka International Airport	Osaka	JP
TTJ	Tottori Airport	Tottori	JP
TKS	Tokushima Airport/JMSDF Air Base	Tokushima	JP
TAK	Takamatsu Airport	Takamatsu	JP
AOJ	Aomori Airport	Aomori	JP
GAJ	Yamagata Airport	Yamagata	JP
AXT	Akita Airport	Akita	JP
MSJ	Misawa Air Base	Misawa	JP
SDJ	Sendai Airport	Sendai	JP
OIM	Oshima Airport	Oshima	JP
RSU	Yeosu Airport	Yeosu	KR
PUS	Gimhae International Airport	Busan	KR
USN	Ulsan Airport	Ulsan	KR
OSN	Osan Air Base	Osan	KR
GMP	Gimpo International Airport	Seoul	KR
SWU	Suwon Airport	Suwon	KR
KPO	Pohang Airport (G-815/K-3)	Pohang	KR
DNA	Kadena Air Base	Kadena	JP
ISG	New Ishigaki Airport	Ishigaki	JP
MMY	Miyako Airport	Miyako	JP
PFB	Lauro Kurtz Airport	Passo Fundo	BR
MNL	Ninoy Aquino International Airport	Manila	PH
CBO	Awang Airport	Cotabato	PH
PAG	Pagadian Airport	Pagadian	PH
GES	General Santos International Airport	Romblon	PH
DTE	Daet Airport	Daet	PH
SJI	San Jose Airport	San Jose	PH
MBO	Mamburao Airport	Mamburao	PH
BQA	Dr.Juan C. Angara Airport	Baler	PH
TAC	Daniel Z. Romualdez Airport	Tacloban	PH
BCD	Bacolod-Silay Airport	Bacolod	PH
ILO	Iloilo International Airport	Iloilo	PH
KLO	Kalibo International Airport	Kalibo	PH
PPS	Puerto Princesa Airport	Puerto Princesa	PH
EUQ	Evelio Javier Airport	San Jose	PH
COC	Comodoro Pierrestegui Airport	Concordia	AR
GHU	Gualeguaychu Airport	Gualeguaychu	AR
JNI	Junin Airport	Junin	AR
PRA	General Urquiza Airport	Parana	AR
ROS	Islas Malvinas Airport	Rosario	AR
SFN	Sauce Viejo Airport	Santa Fe	AR
AEP	Jorge Newbery Airpark	Buenos Aires	AR
COR	Ingeniero Ambrosio Taravella Airport	Cordoba	AR
LPG	La Plata Airport	La Plata	AR
MDZ	El Plumerillo Airport	Mendoza	AR
LGS	Comodoro D.R. Salomón Airport	Malargue	AR
AFA	Suboficial Ay Santiago Germano Airport	San Rafael	AR
CTC	Catamarca Airport	Catamarca	AR
IRJ	Capitan V A Almonacid Airport	La Rioja	AR
UAQ	Domingo Faustino Sarmiento Airport	San Juan	AR
RCU	Area De Material Airport	Rio Cuarto	AR
LUQ	Brigadier Mayor D Cesar Raul Ojeda Airport	San Luis	AR
CNQ	Corrientes Airport	Corrientes	AR
RES	Resistencia International Airport	Resistencia	AR
FMA	Formosa Airport	Formosa	AR
PSS	Libertador Gral D Jose De San Martin Airport	Posadas	AR
SLA	Martin Miguel De Guemes International Airport	Salta	AR
OYA	Goya Airport	Goya	AR
RCQ	Reconquista Airport	Reconquista	AR
CRD	General E. Mosconi Airport	Comodoro Rivadavia	AR
EQS	Brigadier Antonio Parodi Airport	Esquel	AR
REL	Almirante Marco Andres Zar Airport	Trelew	AR
VDM	Gobernador Castello Airport	Viedma	AR
PMY	El Tehuelche Airport	Puerto Madryn	AR
PUD	Puerto Deseado Airport	Puerto Deseado	AR
RGA	Hermes Quijada International Airport	Rio Grande	AR
RGL	Piloto Civil N. Fernández Airport	Rio Gallegos	AR
USH	Malvinas Argentinas Airport	Ushuaia	AR
ULA	Capitan D Daniel Vazquez Airport	San Julian	AR
PMQ	Perito Moreno Airport	Perito Moreno	AR
BHI	Comandante Espora Airport	Bahia Blanca	AR
OVR	Olavarria Airport	Olavarria	AR
GPO	General Pico Airport	General Pico	AR
OYO	Tres Arroyos Airport	Tres Arroyos	AR
NQN	Presidente Peron Airport	Neuquen	AR
RSA	Santa Rosa Airport	Santa Rosa	AR
TDL	Héroes De Malvinas Airport	Tandil	AR
AJU	Santa Maria Airport	Aracaju	BR
AFL	Piloto Osvaldo Marques Dias Airport	Alta Floresta	BR
ARU	Araçatuba Airport	Aracatuba	BR
BEL	Val de Cans/Júlio Cezar Ribeiro International Airport	Belem	BR
BGX	Comandante Gustavo Kraemer Airport	Bage	BR
PLU	Pampulha - Carlos Drummond de Andrade Airport	Belo Horizonte	BR
BFH	Bacacheri Airport	Curitiba	BR
BSB	Presidente Juscelino Kubistschek International Airport	Brasilia	BR
BAU	Bauru Airport	Bauru	BR
BVB	Atlas Brasil Cantanhede Airport	Boa Vista	BR
CAC	Cascavel Airport	Cascavel	BR
CNF	Tancredo Neves International Airport	Belo Horizonte	BR
CGR	Campo Grande Airport	Campo Grande	BR
XAP	Serafin Enoss Bertaso Airport	Chapeco	BR
CCM	Diomício Freitas Airport	Criciuma	BR
CAW	Bartolomeu Lisandro Airport	Campos	BR
CMG	Corumbá International Airport	Corumba	BR
CWB	Afonso Pena Airport	Curitiba	BR
CGB	Marechal Rondon Airport	Cuiaba	BR
CZS	Cruzeiro do Sul Airport	Cruzeiro do Sul	BR
MAO	Eduardo Gomes International Airport	Manaus	BR
FLN	Hercílio Luz International Airport	Florianopolis	BR
FOR	Pinto Martins International Airport	Fortaleza	BR
GYN	Santa Genoveva Airport	Goiania	BR
GRU	Guarulhos - Governador André Franco Montoro International Airport	Sao Paulo	BR
GUJ	Guaratinguetá Airport	Guaratingueta	BR
ATM	Altamira Airport	Altamira	BR
ITA	Itacoatiara Airport	Itaituba	BR
ITB	Itaituba Airport	Itaituba	BR
IOS	Bahia - Jorge Amado Airport	Ilheus	BR
IPN	Usiminas Airport	Ipatinga	BR
ITR	Francisco Vilela do Amaral Airport	Itumbiara	BR
IMP	Prefeito Renato Moreira Airport	Imperatriz	BR
JPA	Presidente Castro Pinto International Airport	Joao Pessoa	BR
CPV	Presidente João Suassuna Airport	Campina Grande	BR
VCP	Viracopos International Airport	Campinas	BR
LAJ	Lages Airport	Lajes	BR
LIP	Lins Airport	Lins	BR
LDB	Governador José Richa Airport	Londrina	BR
MAB	João Correa da Rocha Airport	Maraba	BR
MGF	Regional de Maringá - Sílvio Nane Junior Airport	Maringa	BR
MOC	Mário Ribeiro Airport	Montes Claros	BR
PLL	Ponta Pelada Airport	Manaus	BR
MCZ	Zumbi dos Palmares Airport	Maceio	BR
MCP	Alberto Alcolumbre Airport	Macapa	BR
MNX	Manicoré Airport	Manicore	BR
GEL	Santo Ângelo Airport	Santo Angelo	BR
NAT	Governador Aluízio Alves International Airport	Natal	BR
POA	Salgado Filho Airport	Porto Alegre	BR
PHB	Prefeito Doutor João Silva Filho Airport	Parnaiba	BR
PET	João Simões Lopes Neto International Airport	Pelotas	BR
PNZ	Senador Nilo Coelho Airport	Petrolina	BR
PNB	Porto Nacional Airport	Porto Nacional	BR
PMG	Ponta Porã Airport	Ponta Pora	BR
PVH	Governador Jorge Teixeira de Oliveira Airport	Porto Velho	BR
RBR	Plácido de Castro Airport	Rio Branco	BR
REC	Guararapes - Gilberto Freyre International Airport	Recife	BR
RAO	Leite Lopes Airport	Ribeirao Preto	BR
SLZ	Marechal Cunha Machado International Airport	Sao Luis	BR
CGH	Congonhas Airport	Sao Paulo	BR
SSZ	Base Aérea de Santos Airport	Santos	BR
SSA	Deputado Luiz Eduardo Magalhães International Airport	Salvador	BR
TMT	Trombetas Airport	Oriximina	BR
THE	Senador Petrônio Portela Airport	Teresina	BR
TFF	Tefé Airport	Tefe	BR
TEC	Telêmaco Borba Airport	Telemaco Borba	BR
TBT	Tabatinga Airport	Tabatinga	BR
TUR	Tucuruí Airport	Tucurui	BR
SJL	São Gabriel da Cachoeira Airport	Sao Gabriel	BR
URG	Rubem Berta Airport	Uruguaiana	BR
UDI	Ten. Cel. Aviador César Bombonato Airport	Uberlandia	BR
UBA	Mário de Almeida Franco Airport	Uberaba	BR
BVH	Brigadeiro Camarão Airport	Vilhena	BR
VIX	Eurico de Aguiar Salles Airport	Vitoria	BR
QPS	Campo Fontenelle Airport	Piracununga	BR
ARI	Chacalluta Airport	Arica	CL
CJC	El Loa Airport	Calama	CL
YAI	Gral. Bernardo O´Higgins Airport	Chillan	CL
PUQ	Pdte. Carlos Ibañez del Campo Airport	Punta Arenas	CL
GXQ	Teniente Vidal Airport	Coyhaique	CL
IQQ	Diego Aracena Airport	Iquique	CL
SCL	Comodoro Arturo Merino Benítez International Airport	Santiago	CL
ANF	Andrés Sabella Gálvez International Airport	Antofagasta	CL
WPR	Capitan Fuentes Martinez Airport Airport	Porvenir	CL
LSQ	María Dolores Airport	Los Angeles	CL
WPU	Guardiamarina Zañartu Airport	Puerto Williams	CL
CCP	Carriel Sur Airport	Concepcion	CL
ZOS	Cañal Bajo Carlos - Hott Siebert Airport	Osorno	CL
VLR	Vallenar Airport	Vallenar	CL
QRC	De La Independencia Airport	Rancagua	CL
LSC	La Florida Airport	La Serena	CL
PZS	Maquehue Airport	Temuco	CL
PMC	El Tepual Airport	Puerto Montt	CL
ZAL	Pichoy Airport	Valdivia	CL
ATF	Chachoán Airport	Ambato	EC
CUE	Mariscal Lamar Airport	Cuenca	EC
GYE	José Joaquín de Olmedo International Airport	Guayaquil	EC
LTX	Cotopaxi International Airport	Latacunga	EC
MRR	Jose Maria Velasco Ibarra Airport	Macara	EC
XMS	Coronel E Carvajal Airport	Macas	EC
MCH	General Manuel Serrano Airport	Machala	EC
MEC	Eloy Alfaro International Airport	Manta	EC
PVO	Reales Tamarindos Airport	Portoviejo	EC
UIO	Mariscal Sucre International Airport	Quito	EC
ETR	Santa Rosa International Airport	Santa Rosa	EC
SNC	General Ulpiano Paez Airport	Salinas	EC
TUA	Teniente Coronel Luis a Mantilla Airport	Tulcan	EC
ASU	Silvio Pettirossi International Airport	Asuncion	PY
PIL	Carlos Miguel Gimenez Airport	Pilar	PY
AXM	El Eden Airport	Armenia	CO
ELB	Las Flores Airport	El Banco	CO
BGA	Palonegro Airport	Bucaramanga	CO
BOG	El Dorado International Airport	Bogota	CO
BAQ	Ernesto Cortissoz International Airport	Barranquilla	CO
BUN	Gerardo Tobar López Airport	Buenaventura	CO
CUC	Camilo Daza International Airport	Cucuta	CO
CTG	Rafael Nuñez International Airport	Cartagena	CO
CLO	Alfonso Bonilla Aragon International Airport	Cali	CO
TCO	La Florida Airport	Tumaco	CO
EJA	Yariguíes Airport	Barrancabermeja	CO
FLA	Gustavo Artunduaga Paredes Airport	Florencia	CO
GIR	Santiago Vila Airport	Girardot	CO
GPI	Juan Casiano Airport	Guapi	CO
IBE	Perales Airport	Ibague	CO
IPI	San Luis Airport	Ipiales	CO
LET	Alfredo Vásquez Cobo International Airport	Leticia	CO
EOH	Enrique Olaya Herrera Airport	Medellin	CO
MGN	Baracoa Airport	Magangue	CO
MTR	Los Garzones Airport	Monteria	CO
MVP	Fabio Alberto Leon Bentley Airport	Mitu	CO
MZL	La Nubia Airport	Manizales	CO
NVA	Benito Salas Airport	Neiva	CO
OCV	Aguas Claras Airport	Ocana	CO
PCR	German Olano Airport	Puerto Carreno	CO
PEI	Matecaña International Airport	Pereira	CO
PPN	Guillermo León Valencia Airport	Popayan	CO
PSO	Antonio Narino Airport	Pasto	CO
SMR	Simón Bolívar International Airport	Santa Marta	CO
TME	Gustavo Vargas Airport	Tame	CO
AUC	Santiago Perez Airport	Arauca	CO
UIB	El Caraño Airport	Quibdo	CO
ULQ	Heriberto Gíl Martínez Airport	Tulua	CO
VUP	Alfonso López Pumarejo Airport	Valledupar	CO
VVC	Vanguardia Airport	Villavicencio	CO
BJO	Bermejo Airport	Bermejo	BO
CBB	Jorge Wilsterman International Airport	Cochabamba	BO
CIJ	Capitán Aníbal Arab Airport	Cobija	BO
LPB	El Alto International Airport	La Paz	BO
ORU	Juan Mendoza Airport	Oruro	BO
POI	Capitan Nicolas Rojas Airport	Potosi	BO
PSZ	Capitán Av. Salvador Ogaya G. airport	Puerto Suarez	BO
SRE	Juana Azurduy De Padilla Airport	Sucre	BO
TJA	Capitan Oriel Lea Plaza Airport	Tarija	BO
TDD	Teniente Av. Jorge Henrich Arauz Airport	Trinidad	BO
VVI	Viru Viru International Airport	Santa Cruz	BO
BYC	Yacuiba Airport	Yacuiba	BO
CAY	Cayenne-Rochambeau Airport	Cayenne	GF
AOP	Alferez FAP Alfredo Vladimir Sara Bauer Airport	Andoas	PE
PCL	Cap FAP David Abenzur Rengifo International Airport	Pucallpa	PE
CHM	Teniente FAP Jaime A De Montreuil Morales Airport	Chimbote	PE
CIX	Capitan FAP Jose A Quinones Gonzales International Airport	Chiclayo	PE
AYP	Coronel FAP Alfredo Mendivil Duarte Airport	Ayacucho	PE
ANS	Andahuaylas Airport	Andahuaylas	PE
LIM	Jorge Chávez International Airport	Lima	PE
JJI	Juanjui Airport	Juanjui	PE
JAU	Francisco Carle Airport	Jauja	PE
JUL	Inca Manco Capac International Airport	Juliaca	PE
ILQ	Ilo Airport	Ilo	PE
TBP	Capitan FAP Pedro Canga Rodriguez Airport	Tumbes	PE
YMS	Moises Benzaquen Rengifo Airport	Yurimaguas	PE
CHH	Chachapoyas Airport	Chachapoyas	PE
IQT	Coronel FAP Francisco Secada Vignetta International Airport	Iquitos	PE
AQP	Rodríguez Ballón International Airport	Arequipa	PE
TRU	Capitan FAP Carlos Martinez De Pinillos International Airport	Trujillo	PE
PIO	Capitán FAP Renán Elías Olivera International Airport	Pisco	PE
TPP	Cadete FAP Guillermo Del Castillo Paredes Airport	Tarapoto	PE
TCQ	Coronel FAP Carlos Ciriani Santa Rosa International Airport	Tacna	PE
PEM	Padre Aldamiz International Airport	Puerto Maldonado	PE
PIU	Capitán FAP Guillermo Concha Iberico International Airport	Piura	PE
TYL	Capitan Montes Airport	Talara	PE
DZO	Santa Bernardina International Airport	Durazno	UY
MVD	Carrasco International /General C L Berisso Airport	Montevideo	UY
STY	Nueva Hesperides International Airport	Salto	UY
AGV	Oswaldo Guevara Mujica Airport	Acarigua	VE
AAO	Anaco Airport	Anaco	VE
BLA	General José Antonio Anzoategui International Airport	Barcelona	VE
BNS	Barinas Airport	Barinas	VE
BRM	Barquisimeto International Airport	Barquisimeto	VE
CBL	Aeropuerto \\General Tomas de Heres\\. Ciudad Bolivar	Ciudad Bolivar	VE
CLZ	Calabozo Airport	Calabozo	VE
VCR	Carora Airport	Carora	VE
CUP	General Francisco Bermúdez Airport	Carupano	VE
CZE	José Leonardo Chirinos Airport	Coro	VE
CUM	Cumaná (Antonio José de Sucre) Airport	Cumana	VE
EOR	El Dorado Airport	El Dorado	VE
GDO	Guasdalito Airport	Guasdualito	VE
GUQ	Guanare Airport	Guanare	VE
MAR	La Chinita International Airport	Maracaibo	VE
MRD	Alberto Carnevalli Airport	Merida	VE
PMV	Del Caribe Santiago Mariño International Airport	Porlamar	VE
CCS	Simón Bolívar International Airport	Caracas	VE
MUN	Maturín Airport	Maturin	VE
PYH	Cacique Aramare Airport	Puerto Ayacucho	VE
PBL	General Bartolome Salom International Airport	Puerto Cabello	VE
SCI	Paramillo Airport	San Cristobal	VE
SNF	Sub Teniente Nestor Arias Airport	San Felipe	VE
TUV	Tucupita Airport	Tucupita	VE
VLN	Arturo Michelena International Airport	Valencia	VE
VLV	Dr. Antonio Nicolás Briceño Airport	Valera	VE
LTM	Lethem Airport	Lethem	GY
BGI	Sir Grantley Adams International Airport	Bridgetown	BB
BQN	Rafael Hernandez Airport	Aguadilla	PR
FAJ	Diego Jimenez Torres Airport	Fajardo	PR
SIG	Fernando Luis Ribas Dominicci Airport	San Juan	PR
MAZ	Eugenio Maria De Hostos Airport	Mayaguez	PR
PSE	Mercedita Airport	Ponce	PR
SJU	Luis Munoz Marin International Airport	San Juan	PR
SLU	George F. L. Charles Airport	Castries	LC
AUA	Queen Beatrix International Airport	Oranjestad	AW
TAB	Tobago-Crown Point Airport	Scarborough	TT
SVD	Argyle International Airport	Kingstown	VC
FRU	Manas International Airport	Bishkek	KG
OSS	Osh Airport	Osh	KG
PWQ	Pavlodar Airport	Pavlodar	KZ
GYD	Heydar Aliyev International Airport	Baku	AZ
YKS	Yakutsk Airport	Yakutsk	RU
KHV	Khabarovsk-Novy Airport	Khabarovsk	RU
GDX	Sokol Airport	Magadan	RU
PWE	Pevek Airport	Pevek	RU
VVO	Vladivostok International Airport	Vladivostok	RU
HTA	Chita-Kadala Airport	Chita	RU
BTK	Bratsk Airport	Bratsk	RU
IKT	Irkutsk Airport	Irkutsk	RU
DOK	Donetsk International Airport	Donetsk	UA
SIP	Simferopol International Airport	Simferopol	UA
MMK	Murmansk Airport	Murmansk	RU
KGD	Khrabrovo Airport	Kaliningrad	RU
MHP	Minsk 1 Airport	Minsk	BY
ABA	Abakan Airport	Abakan	RU
BAX	Barnaul Airport	Barnaul	RU
OMS	Omsk Central Airport	Omsk	RU
KRR	Krasnodar Pashkovsky International Airport	Krasnodar	RU
MCX	Uytash Airport	Makhachkala	RU
STW	Stavropol Shpakovskoye Airport	Stavropol	RU
ROV	Platov International Airport	Rostov	RU
AER	Sochi International Airport	Sochi	RU
ASF	Astrakhan Airport	Astrakhan	RU
VOG	Volgograd International Airport	Volgograd	RU
CEK	Chelyabinsk Balandino Airport	Chelyabinsk	RU
NJC	Nizhnevartovsk Airport	Nizhnevartovsk	RU
PEE	Bolshoye Savino Airport	Perm	RU
SGC	Surgut Airport	Surgut	RU
SVX	Koltsovo Airport	Yekaterinburg	RU
DYU	Dushanbe Airport	Dushanbe	TJ
BHK	Bukhara Airport	Bukhara	UZ
SKD	Samarkand Airport	Samarkand	UZ
TAS	Tashkent International Airport	Tashkent	UZ
BZK	Bryansk Airport	Bryansk	RU
SVO	Sheremetyevo International Airport	Moscow	RU
KLD	Migalovo Air Base	Tver	RU
VOZ	Voronezh International Airport	Voronezh	RU
VKO	Vnukovo International Airport	Moscow	RU
SCW	Syktyvkar Airport	Syktyvkar	RU
KZN	Kazan International Airport	Kazan	RU
REN	Orenburg Central Airport	Orenburg	RU
UFA	Ufa International Airport	Ufa	RU
KUF	Kurumoch International Airport	Samara	RU
AKD	Akola Airport	Akola	IN
IXU	Aurangabad Airport	Aurangabad	IN
BOM	Chhatrapati Shivaji International Airport	Mumbai	IN
PAB	Bilaspur Airport	Bilaspur	IN
BHJ	Bhuj Airport	Bhuj	IN
IXG	Belgaum Airport	Belgaum	IN
BHO	Raja Bhoj International Airport	Bhopal	IN
NMB	Daman Airport	Daman	IN
IDR	Devi Ahilyabai Holkar Airport	Indore	IN
JLR	Jabalpur Airport	Jabalpur	IN
JGA	Jamnagar Airport	Jamnagar	IN
HJR	Khajuraho Airport	Khajuraho	IN
KLH	Kolhapur Airport	Kolhapur	IN
NAG	Dr. Babasaheb Ambedkar International Airport	Nagpur	IN
PNQ	Pune Airport	Pune	IN
PBD	Porbandar Airport	Porbandar	IN
RAJ	Rajkot Airport	Rajkot	IN
RPR	Raipur Airport	Raipur	IN
STV	Surat Airport	Surat	IN
UDR	Maharana Pratap Airport	Udaipur	IN
CMB	Bandaranaike International Colombo Airport	Colombo	LK
ACJ	Anuradhapura Air Force Base	Anuradhapura	LK
BTC	Batticaloa Airport	Batticaloa	LK
RML	Colombo Ratmalana Airport	Colombo	LK
JAF	Kankesanturai Airport	Jaffna	LK
TNX	Stung Treng Airport	Stung Treng	KH
IXA	Agartala Airport	Agartala	IN
CCU	Netaji Subhash Chandra Bose International Airport	Kolkata	IN
DBD	Dhanbad Airport	Dhanbad	IN
GAY	Gaya Airport	Gaya	IN
IMF	Imphal Airport	Imphal	IN
IXW	Sonari Airport	Jamshedpur	IN
JRH	Jorhat Airport	Jorhat	IN
IXS	Silchar Airport	Silchar	IN
IXR	Birsa Munda Airport	Ranchi	IN
VTZ	Vishakhapatnam Airport	Vishakhapatnam	IN
JSR	Jessore Airport	Jessore	BD
RJH	Shah Mokhdum Airport	Rajshahi	BD
SPD	Saidpur Airport	Saidpur	BD
DAC	Hazrat Shahjalal International Airport	Dhaka	BD
HKG	Hong Kong International Airport	Hong Kong	HK
AGR	Agra Airport	Agra	IN
IXD	Allahabad Airport	Allahabad	IN
ATQ	Sri Guru Ram Dass Jee International Airport	Amritsar	IN
BKB	Nal Airport	Bikaner	IN
VNS	Lal Bahadur Shastri Airport	Varanasi	IN
KUU	Kullu Manali Airport	Kulu	IN
BEK	Bareilly Air Force Station	Bareilly	IN
IXC	Chandigarh Airport	Chandigarh	IN
DED	Dehradun Airport	Dehra Dun	IN
DEL	Indira Gandhi International Airport	Delhi	IN
GWL	Gwalior Airport	Gwalior	IN
JDH	Jodhpur Airport	Jodhpur	IN
JAI	Jaipur International Airport	Jaipur	IN
JSA	Jaisalmer Airport	Jaisalmer	IN
IXJ	Jammu Airport	Jammu	IN
KTU	Kota Airport	Kota	IN
LKO	Chaudhary Charan Singh International Airport	Lucknow	IN
IXP	Pathankot Airport	Pathankot	IN
SXR	Sheikh ul Alam Airport	Srinagar	IN
ZVK	Savannakhet Airport	Savannakhet	LA
VTE	Wattay International Airport	Vientiane	LA
MFM	Macau International Airport	Macau	MO
JKR	Janakpur Airport	Janakpur	NP
KTM	Tribhuvan International Airport	Kathmandu	NP
PKR	Pokhara Airport	Pokhara	NP
BIR	Biratnagar Airport	Biratnagar	NP
BLR	Kempegowda International Airport	Bangalore	IN
BEP	Bellary Airport	Bellary	IN
CJB	Coimbatore International Airport	Coimbatore	IN
COK	Cochin International Airport	Kochi	IN
CCJ	Calicut International Airport	Calicut	IN
CDP	Kadapa Airport	Cuddapah	IN
BPM	Begumpet Airport	Hyderabad	IN
IXM	Madurai Airport	Madurai	IN
IXE	Mangalore International Airport	Mangalore	IN
IXZ	Vir Savarkar International Airport	Port Blair	IN
RJA	Rajahmundry Airport	Rajahmundry	IN
SXV	Salem Airport	Salem	IN
TJV	Tanjore Air Force Base	Tanjore	IN
PBH	Paro Airport	Thimphu	BT
MLE	Malé International Airport	Male	MV
DMK	Don Mueang International Airport	Bangkok	TH
KDT	Kamphaeng Saen Airport	Nakhon Pathom	TH
LPT	Lampang Airport	Lampang	TH
PRH	Phrae Airport	Phrae	TH
HHQ	Hua Hin Airport	Prachuap Khiri Khan	TH
TKH	Takhli Airport	Nakhon Sawan	TH
PHS	Phitsanulok Airport	Phitsanulok	TH
NAW	Narathiwat Airport	Narathiwat	TH
KBV	Krabi Airport	Krabi	TH
SGZ	Songkhla Airport	Songkhla	TH
PAN	Pattani Airport	Pattani	TH
USM	Samui Airport	Ko Samui	TH
HKT	Phuket International Airport	Phuket	TH
UNN	Ranong Airport	Ranong	TH
HDY	Hat Yai International Airport	Hat Yai	TH
TST	Trang Airport	Trang	TH
UTH	Udon Thani Airport	Udon Thani	TH
SNO	Sakon Nakhon Airport	Sakon Nakhon	TH
PXR	Surin Airport	Surin	TH
LOE	Loei Airport	Loei	TH
HAN	Noi Bai International Airport	Hanoi	VN
HUI	Phu Bai Airport	Hue	VN
SGN	Tan Son Nhat International Airport	Ho Chi Minh City	VN
KET	Kengtung Airport	Kengtung	MM
KYP	Kyaukpyu Airport	Kyaukpyu	MM
MDL	Mandalay International Airport	Mandalay	MM
MGZ	Myeik Airport	Myeik	MM
MYT	Myitkyina Airport	Myitkyina	MM
PRU	Pyay Airport	Pyay	MM
AKY	Sittwe Airport	Sittwe	MM
BIK	Frans Kaisiepo Airport	Biak	ID
NBX	Nabire Airport	Nabire	ID
DJJ	Sentani International Airport	Jayapura	ID
MKQ	Mopah Airport	Merauke	ID
GTO	Jalaluddin Airport	Gorontalo	ID
PLW	Mutiara Airport	Palu	ID
MDC	Sam Ratulangi Airport	Manado	ID
PSJ	Kasiguncu Airport	Poso	ID
TTE	Sultan Khairun Babullah Airport	Ternate	ID
LUW	Syukuran Aminuddin Amir Airport	Luwuk	ID
AMQ	Pattimura Airport, Ambon	Ambon	ID
MKW	Rendani Airport	Manokwari	ID
SOQ	Dominique Edward Osok Airport	Sorong	ID
BTU	Bintulu Airport	Bintulu	MY
KCH	Kuching International Airport	Kuching	MY
MYY	Miri Airport	Miri	MY
SBW	Sibu Airport	Sibu	MY
LDU	Lahad Datu Airport	Lahad Datu	MY
BKI	Kota Kinabalu International Airport	Kota Kinabalu	MY
LBU	Labuan Airport	Labuan	MY
TWU	Tawau Airport	Tawau	MY
BWN	Brunei International Airport	Bandar Seri Begawan	BN
PKU	Sultan Syarif Kasim Ii (Simpang Tiga) Airport	Pekanbaru	ID
DUM	Pinang Kampai Airport	Dumai	ID
CGK	Soekarno-Hatta International Airport	Jakarta	ID
PDG	Minangkabau International Airport	Padang	ID
MES	Soewondo Air Force Base	Medan	ID
FLZ	Dr Ferdinand Lumban Tobing Airport	Sibolga	ID
PNK	Supadio Airport	Pontianak	ID
DJB	Sultan Thaha Airport	Jambi	ID
BKS	Fatmawati Soekarno Airport	Bengkulu	ID
PLM	Sultan Mahmud Badaruddin II Airport	Palembang	ID
BTJ	Sultan Iskandar Muda International Airport	Banda Aceh	ID
AOR	Sultan Abdul Halim Airport	Alor Setar	MY
BWH	Butterworth Airport	Butterworth	MY
KUA	Kuantan Airport	Kuantan	MY
IPH	Sultan Azlan Shah Airport	Ipoh	MY
JHB	Senai International Airport	Johor Bahru	MY
KUL	Kuala Lumpur International Airport	Kuala Lumpur	MY
TGG	Sultan Mahmud Airport	Kuala Terengganu	MY
UAI	Suai Airport	Suai	TL
DIL	Presidente Nicolau Lobato International Airport	Dili	TL
BCH	Cakung Airport	Baucau	TL
XSP	Seletar Airport	Singapore	SG
SIN	Singapore Changi Airport	Singapore	SG
ACF	Brisbane Archerfield Airport	Brisbane	AU
ASP	Alice Springs Airport	Alice Springs	AU
BNE	Brisbane International Airport	Brisbane	AU
CNS	Cairns International Airport	Cairns	AU
ISA	Mount Isa Airport	Mount Isa	AU
MKY	Mackay Airport	Mackay	AU
ROK	Rockhampton Airport	Rockhampton	AU
TSV	Townsville Airport	Townsville	AU
WEI	Weipa Airport	Weipa	AU
ABX	Albury Airport	Albury	AU
MEB	Melbourne Essendon Airport	Melbourne	AU
HBA	Hobart International Airport	Hobart	AU
LST	Launceston Airport	Launceston	AU
MBW	Melbourne Moorabbin Airport	Melbourne	AU
MEL	Melbourne International Airport	Melbourne	AU
ADL	Adelaide International Airport	Adelaide	AU
JAD	Perth Jandakot Airport	Perth	AU
KTA	Karratha Airport	Karratha	AU
KGI	Kalgoorlie Boulder Airport	Kalgoorlie	AU
KNX	Kununurra Airport	Kununurra	AU
PHE	Port Hedland International Airport	Port Hedland	AU
PER	Perth International Airport	Perth	AU
UMR	Woomera Airfield	Woomera	AU
BWU	Sydney Bankstown Airport	Sydney	AU
CBR	Canberra International Airport	Canberra	AU
DBO	Dubbo City Regional Airport	Dubbo	AU
XRH	RAAF Base Richmond	Richmond	AU
SYD	Sydney Kingsford Smith International Airport	Sydney	AU
TMW	Tamworth Airport	Tamworth	AU
WGA	Wagga Wagga City Airport	Wagga Wagga	AU
PEK	Beijing Capital International Airport	Beijing	CN
TSN	Tianjin Binhai International Airport	Tianjin	CN
TYN	Taiyuan Wusu Airport	Taiyuan	CN
CAN	Guangzhou Baiyun International Airport	Guangzhou	CN
KWL	Guilin Liangjiang International Airport	Guilin	CN
NNG	Nanning Wuxu Airport	Nanning	CN
SZX	Shenzhen Bao'an International Airport	Shenzhen	CN
CGO	Zhengzhou Xinzheng International Airport	Zhengzhou	CN
WUH	Wuhan Tianhe International Airport	Wuhan	CN
FNJ	Pyongyang Sunan International Airport	Pyongyang	KP
LHW	Lanzhou Zhongchuan Airport	Lanzhou	CN
XIY	Xi'an Xianyang International Airport	Xi'an	CN
KMG	Kunming Changshui International Airport	Kunming	CN
XMN	Xiamen Gaoqi International Airport	Xiamen	CN
KHN	Nanchang Changbei International Airport	Nanchang	CN
FOC	Fuzhou Changle International Airport	Fuzhou	CN
HGH	Hangzhou Xiaoshan International Airport	Hangzhou	CN
NKG	Nanjing Lukou Airport	Nanjing	CN
HFE	Hefei Luogang International Airport	Hefei	CN
TAO	Liuting Airport	Qingdao	CN
SHA	Shanghai Hongqiao International Airport	Shanghai	CN
YNT	Yantai Laishan Airport	Yantai	CN
CKG	Chongqing Jiangbei International Airport	Chongqing	CN
KWE	Longdongbao Airport	Guiyang	CN
CTU	Chengdu Shuangliu International Airport	Chengdu	CN
XIC	Xichang Qingshan Airport	Xichang	CN
HTN	Hotan Airport	Hotan	CN
URC	Ürümqi Diwopu International Airport	Urumqi	CN
HRB	Taiping Airport	Harbin	CN
MDG	Mudanjiang Hailang International Airport	Mudanjiang	CN
DLC	Zhoushuizi Airport	Dalian	CN
PVG	Shanghai Pudong International Airport	Shanghai	CN
SZB	Sultan Abdul Aziz Shah International Airport	Kuala Lumpur	MY
HBE	Borg El Arab International Airport	Alexandria	EG
ITO	Hilo International Airport	Hilo	US
ORL	Orlando Executive Airport	Orlando	US
BED	Laurence G Hanscom Field	Bedford	US
MHR	Sacramento Mather Airport	Sacramento	US
BYS	Bicycle Lake Army Air Field	Fort Irwin	US
FSM	Fort Smith Regional Airport	Fort Smith	US
MRI	Merrill Field	Anchorage	US
GNT	Grants-Milan Municipal Airport	Grants	US
PNC	Ponca City Regional Airport	Ponca City	US
GFK	Grand Forks International Airport	Grand Forks	US
PBF	Pine Bluff Regional Airport, Grider Field	Pine Bluff	US
NSE	Whiting Field Naval Air Station - North	Milton	US
PRC	Ernest A. Love Field	Prescott	US
TTN	Trenton Mercer Airport	Trenton	US
BOS	General Edward Lawrence Logan International Airport	Boston	US
SUU	Travis Air Force Base	Fairfield	US
RME	Griffiss International Airport	Rome	US
BFM	Mobile Downtown Airport	Mobile	US
OAK	Metropolitan Oakland International Airport	Oakland	US
OMA	Eppley Airfield	Omaha	US
OGG	Kahului Airport	Kahului	US
ICT	Wichita Eisenhower National Airport	Wichita	US
MCI	Kansas City International Airport	Kansas City	US
MSN	Dane County Regional Truax Field	Madison	US
HRO	Boone County Airport	Harrison	US
PHX	Phoenix Sky Harbor International Airport	Phoenix	US
BGR	Bangor International Airport	Bangor	US
FXE	Fort Lauderdale Executive Airport	Fort Lauderdale	US
GGG	East Texas Regional Airport	Longview	US
GEG	Spokane International Airport	Spokane	US
HWO	North Perry Airport	Hollywood	US
SFO	San Francisco International Airport	San Francisco	US
GNV	Gainesville Regional Airport	Gainesville	US
MEM	Memphis International Airport	Memphis	US
DUG	Bisbee Douglas International Airport	Douglas	US
CNW	TSTC Waco Airport	Waco	US
CAR	Caribou Municipal Airport	Caribou	US
LRF	Little Rock Air Force Base	Jacksonville	US
HUA	Redstone Army Air Field	Redstone	US
POB	Pope Field	Fort Bragg	US
DHT	Dalhart Municipal Airport	Dalhart	US
DLF	DLF Airport	Del Rio	US
LAX	Los Angeles International Airport	Los Angeles	US
ANB	Anniston Regional Airport	Anniston	US
CLE	Cleveland Hopkins International Airport	Cleveland	US
DOV	Dover Air Force Base	Dover	US
CVG	Cincinnati Northern Kentucky International Airport	Cincinnati	US
FME	Tipton Airport	Fort Meade	US
HON	Huron Regional Airport	Huron	US
JNU	Juneau International Airport	Juneau	US
LFT	Lafayette Regional Airport	Lafayette	US
EWR	Newark Liberty International Airport	Newark	US
BOI	Boise Air Terminal/Gowen Field	Boise	US
GCK	Garden City Regional Airport	Garden City	US
MOT	Minot International Airport	Minot	US
HHI	Wheeler Army Airfield	Wahiawa	US
MXF	Maxwell Air Force Base	Montgomery	US
DAL	Dallas Love Field	Dallas	US
FCS	Butts AAF (Fort Carson) Air Field	Fort Carson	US
HLN	Helena Regional Airport	Helena	US
NKX	Miramar Marine Corps Air Station - Mitscher Field	Miramar	US
LUF	Luke Air Force Base	Phoenix	US
HHR	Jack Northrop Field Hawthorne Municipal Airport	Hawthorne	US
HUL	Houlton International Airport	Houlton	US
END	Vance Air Force Base	Enid	US
LCH	Lake Charles Regional Airport	Lake Charles	US
MYR	Myrtle Beach International Airport	Myrtle Beach	US
NLC	Lemoore Naval Air Station (Reeves Field) Airport	Lemoore	US
ACK	Nantucket Memorial Airport	Nantucket	US
HOP	Campbell AAF (Fort Campbell) Air Field	Hopkinsville	US
DCA	Ronald Reagan Washington National Airport	Washington	US
BYH	Arkansas International Airport	Blytheville	US
ACY	Atlantic City International Airport	Atlantic City	US
TIK	Tinker Air Force Base	Oklahoma City	US
ECG	Elizabeth City Regional Airport & Coast Guard Air Station	Elizabeth City	US
PUB	Pueblo Memorial Airport	Pueblo	US
PQI	Northern Maine Regional Airport at Presque Isle	Presque Isle	US
GRF	Gray Army Air Field	Fort Lewis	US
ADQ	Kodiak Airport	Kodiak	US
FLL	Fort Lauderdale Hollywood International Airport	Fort Lauderdale	US
INL	Falls International Airport	International Falls	US
SLC	Salt Lake City International Airport	Salt Lake City	US
BIX	Keesler Air Force Base	Biloxi	US
NQI	Kingsville Naval Air Station	Kingsville	US
FRI	Marshall Army Air Field	Fort Riley	US
MDT	Harrisburg International Airport	Harrisburg	US
LNK	Lincoln Airport	Lincoln	US
LAN	Capital City Airport	Lansing	US
MSS	Massena International Richards Field	Massena	US
HKY	Hickory Regional Airport	Hickory	US
SPG	Albert Whitted Airport	St. Petersburg	US
FMY	Page Field	Fort Myers	US
IAH	George Bush Intercontinental Houston Airport	Houston	US
ADW	Joint Base Andrews	Camp Springs	US
VCV	Southern California Logistics Airport	Victorville	US
CEW	Bob Sikes Airport	Crestview	US
PHN	St Clair County International Airport	Port Huron	US
BFL	Meadows Field	Bakersfield	US
ELP	El Paso International Airport	El Paso	US
HRL	Valley International Airport	Harlingen	US
CAE	Columbia Metropolitan Airport	Columbia	US
DMA	Davis Monthan Air Force Base	Tucson	US
NPA	Pensacola Naval Air Station/Forrest Sherman Field	Pensacola	US
PNS	Pensacola Regional Airport	Pensacola	US
HOU	William P Hobby Airport	Houston	US
BFK	Buckley Air Force Base	Buckley	US
PAQ	Warren \\Bud\\ Woods Palmer Municipal Airport	Palmer	US
PIT	Pittsburgh International Airport	Pittsburgh	US
EFD	Ellington Airport	Houston	US
ALI	Alice International Airport	Alice	US
VAD	Moody Air Force Base	Valdosta	US
MIA	Miami International Airport	Miami	US
SEA	Seattle Tacoma International Airport	Seattle	US
CHA	Lovell Field	Chattanooga	US
BDR	Igor I Sikorsky Memorial Airport	Stratford	US
JAN	Jackson-Medgar Wiley Evers International Airport	Jackson	US
GLS	Scholes International At Galveston Airport	Galveston	US
LGB	Long Beach /Daugherty Field/ Airport	Long Beach	US
IPT	Williamsport Regional Airport	Williamsport	US
IND	Indianapolis International Airport	Indianapolis	US
AKC	Akron Fulton International Airport	Akron	US
GWO	Greenwood–Leflore Airport	Greenwood	US
HPN	Westchester County Airport	White Plains	US
JBR	Jonesboro Municipal Airport	Jonesboro	US
LNA	Palm Beach County Park Airport	West Palm Beach	US
NZY	North Island Naval Air Station-Halsey Field	San Diego	US
BIF	Biggs Army Air Field (Fort Bliss)	El Paso	US
YUM	Yuma MCAS/Yuma International Airport	Yuma	US
CNM	Cavern City Air Terminal	Carlsbad	US
DLH	Duluth International Airport	Duluth	US
BET	Bethel Airport	Bethel	US
LOU	Bowman Field	Louisville	US
LIH	Lihue Airport	Lihue	US
HUF	Terre Haute Regional Airport, Hulman Field	Terre Haute	US
HVR	Havre City County Airport	Havre	US
MPV	Edward F Knapp State Airport	Montpelier	US
RIC	Richmond International Airport	Richmond	US
SHV	Shreveport Regional Airport	Shreveport	US
ORF	Norfolk International Airport	Norfolk	US
BPT	Southeast Texas Regional Airport	Beaumont	US
SAV	Savannah Hilton Head International Airport	Savannah	US
HIF	Hill Air Force Base	Ogden	US
PIE	St Petersburg Clearwater International Airport	St. Petersburg	US
MNM	Menominee Regional Airport	Macon	US
CXO	Conroe-North Houston Regional Airport	Conroe	US
SAT	San Antonio International Airport	San Antonio	US
ROC	Greater Rochester International Airport	Rochester	US
RCA	Ellsworth Air Force Base	Rapid City	US
DAY	James M Cox Dayton International Airport	Dayton	US
ENA	Kenai Municipal Airport	Kenai	US
IAG	Niagara Falls International Airport	Niagara Falls	US
CFD	Coulter Field	Bryan	US
LIY	Wright AAF (Fort Stewart)/Midcoast Regional Airport	Wright	US
PHF	Newport News Williamsburg International Airport	Newport News	US
ESF	Esler Regional Airport	Alexandria	US
LTS	Altus Air Force Base	Altus	US
TUS	Tucson International Airport	Tucson	US
MIB	Minot Air Force Base	Minot	US
BAB	Beale Air Force Base	Marysville	US
IKK	Greater Kankakee Airport	Kankakee	US
GSB	Seymour Johnson Air Force Base	Goldsboro	US
PVD	Theodore Francis Green State Airport	Providence	US
SBY	Salisbury Ocean City Wicomico Regional Airport	Salisbury	US
BUR	Bob Hope Airport	Burbank	US
DTW	Detroit Metropolitan Wayne County Airport	Detroit	US
TPA	Tampa International Airport	Tampa	US
EIL	Eielson Air Force Base	Fairbanks	US
HIB	Range Regional Airport	Hibbing	US
LFK	Angelina County Airport	Lufkin	US
MAF	Midland International Airport	Midland	US
GRB	Austin Straubel International Airport	Green Bay	US
ADM	Ardmore Municipal Airport	Ardmore	US
ISN	Sloulin Field International Airport	Williston	US
LIT	Bill & Hillary Clinton National Airport/Adams Field	Little Rock	US
SWF	Stewart International Airport	Newburgh	US
SAC	Sacramento Executive Airport	Sacramento	US
HOM	Homer Airport	Homer	US
MGE	Dobbins Air Reserve Base	Marietta	US
SKA	Fairchild Air Force Base	Spokane	US
PAM	Tyndall Air Force Base	Panama City	US
MLB	Melbourne International Airport	Melbourne	US
TCM	McChord Air Force Base	Tacoma	US
AUS	Austin Bergstrom International Airport	Austin	US
LCK	Rickenbacker International Airport	Columbus	US
TYS	McGhee Tyson Airport	Knoxville	US
HLR	Hood Army Air Field	Fort Hood	US
STL	St Louis Lambert International Airport	St. Louis	US
MIV	Millville Municipal Airport	Millville	US
SPS	Sheppard Air Force Base-Wichita Falls Municipal Airport	Wichita Falls	US
LUK	Cincinnati Municipal Airport Lunken Field	Cincinnati	US
ATL	Hartsfield Jackson Atlanta International Airport	Atlanta	US
MER	Castle Airport	Merced	US
MCC	Mc Clellan Airfield	Sacramento	US
GRR	Gerald R. Ford International Airport	Grand Rapids	US
FAT	Fresno Yosemite International Airport	Fresno	US
VRB	Vero Beach Regional Airport	Vero Beach	US
IPL	Imperial County Airport	Imperial	US
BNA	Nashville International Airport	Nashville	US
LRD	Laredo International Airport	Laredo	US
EDF	Elmendorf Air Force Base	Anchorage	US
AOO	Altoona Blair County Airport	Altoona	US
DYS	Dyess Air Force Base	Abilene	US
ELD	South Arkansas Regional At Goodwin Field	El Dorado	US
LGA	La Guardia Airport	New York	US
TLH	Tallahassee Regional Airport	Tallahassee	US
DPA	Dupage Airport	West Chicago	US
ACT	Waco Regional Airport	Waco	US
AUG	Augusta State Airport	Augusta	US
NIP	Jacksonville Naval Air Station (Towers Field)	Jacksonville	US
MKL	McKellar-Sipes Regional Airport	Jackson	US
FTK	Godman Army Air Field	Fort Knox	US
SJT	San Angelo Regional Mathis Field	San Angelo	US
CXL	Calexico International Airport	Calexico	US
CIC	Chico Municipal Airport	Chico	US
BTV	Burlington International Airport	Burlington	US
JAX	Jacksonville International Airport	Jacksonville	US
DRO	Durango La Plata County Airport	Durango	US
IAD	Washington Dulles International Airport	Washington	US
CLL	Easterwood Field	College Station	US
SFF	Felts Field	Spokane	US
MKE	General Mitchell International Airport	Milwaukee	US
ABI	Abilene Regional Airport	Abilene	US
COU	Columbia Regional Airport	Columbia	US
PDX	Portland International Airport	Portland	US
TNT	Dade Collier Training and Transition Airport	Miami	US
PBI	Palm Beach International Airport	West Palm Beach	US
FTW	Fort Worth Meacham International Airport	Fort Worth	US
OGS	Ogdensburg International Airport	Ogdensburg	US
FMH	Cape Cod Coast Guard Air Station	Falmouth	US
BFI	Boeing Field King County International Airport	Seattle	US
SKF	Lackland Air Force Base	San Antonio	US
HNL	Daniel K Inouye International Airport	Honolulu	US
DSM	Des Moines International Airport	Des Moines	US
EWN	Coastal Carolina Regional Airport	New Bern	US
SAN	San Diego International Airport	San Diego	US
MLU	Monroe Regional Airport	Monroe	US
SSC	Shaw Air Force Base	Sumter	US
ONT	Ontario International Airport	Ontario	US
ROW	Roswell International Air Center Airport	Roswell	US
DET	Coleman A. Young Municipal Airport	Detroit	US
BRO	Brownsville South Padre Island International Airport	Brownsville	US
DHN	Dothan Regional Airport	Dothan	US
WWD	Cape May County Airport	Wildwood	US
NFL	Fallon Naval Air Station	Fallon	US
MTC	Selfridge Air National Guard Base Airport	Mount Clemens	US
FMN	Four Corners Regional Airport	Farmington	US
CRP	Corpus Christi International Airport	Corpus Christi	US
SYR	Syracuse Hancock International Airport	Syracuse	US
NQX	Naval Air Station Key West/Boca Chica Field	Key West	US
MDW	Chicago Midway International Airport	Chicago	US
SJC	Norman Y. Mineta San Jose International Airport	San Jose	US
HOB	Lea County Regional Airport	Hobbs	US
PNE	Northeast Philadelphia Airport	Philadelphia	US
DEN	Denver International Airport	Denver	US
PHL	Philadelphia International Airport	Philadelphia	US
SUX	Sioux Gateway Col. Bud Day Field	Sioux City	US
MCN	Middle Georgia Regional Airport	Macon	US
PMD	Palmdale Regional/USAF Plant 42 Airport	Palmdale	US
RND	Randolph Air Force Base	San Antonio	US
NJK	El Centro NAF Airport (Vraciu Field)	El Centro	US
CMH	John Glenn Columbus International Airport	Columbus	US
FYV	Drake Field	Fayetteville	US
FFO	Wright-Patterson Air Force Base	Dayton	US
MWL	Mineral Wells Airport	Mineral Wells	US
IAB	Mc Connell Air Force Base	Wichita	US
NBG	New Orleans NAS JRB/Alvin Callender Field	New Orleans	US
BFT	Beaufort County Airport	Beaufort	US
TXK	Texarkana Regional Webb Field	Texarkana	US
PBG	Plattsburgh International Airport	Plattsburgh	US
APG	Phillips Army Air Field	Aberdeen	US
ANC	Ted Stevens Anchorage International Airport	Anchorage	US
GRK	Robert Gray  Army Air Field Airport	Killeen	US
BLI	Bellingham International Airport	Bellingham	US
NQA	Millington-Memphis Airport	Millington	US
EKN	Elkins-Randolph Co-Jennings Randolph Field	Elkins	US
HFD	Hartford Brainard Airport	Hartford	US
SFZ	North Central State Airport	Smithfield	US
MOB	Mobile Regional Airport	Mobile	US
NUQ	Moffett Federal Airfield	Mountain View	US
SAF	Santa Fe Municipal Airport	Santa Fe	US
OLS	Nogales International Airport	Nogales	US
MCF	Mac Dill Air Force Base	Tampa	US
BLV	Scott AFB/Midamerica Airport	Belleville	US
OPF	Opa-locka Executive Airport	Miami	US
DRT	Del Rio International Airport	Del Rio	US
RSW	Southwest Florida International Airport	Fort Myers	US
JFK	John F Kennedy International Airport	New York	US
HST	Homestead ARB Airport	Homestead	US
RAL	Riverside Municipal Airport	Riverside	US
HMN	Holloman Air Force Base	Alamogordo	US
NXX	Willow Grove Naval Air Station/Joint Reserve Base	Willow Grove	US
CYS	Cheyenne Regional Jerry Olson Field	Cheyenne	US
SCK	Stockton Metropolitan Airport	Stockton	US
CHS	Charleston Air Force Base-International Airport	Charleston	US
RNO	Reno Tahoe International Airport	Reno	US
KTN	Ketchikan International Airport	Ketchikan	US
YIP	Willow Run Airport	Detroit	US
VBG	Vandenberg Air Force Base	Lompoc	US
BHM	Birmingham-Shuttlesworth International Airport	Birmingham	US
LSV	Nellis Air Force Base	Las Vegas	US
RIV	March ARB Airport	Riverside	US
MOD	Modesto City Co-Harry Sham Field	Modesto	US
SMF	Sacramento International Airport	Sacramento	US
UGN	Waukegan National Airport	Chicago	US
COS	City of Colorado Springs Municipal Airport	Colorado Springs	US
BUF	Buffalo Niagara International Airport	Buffalo	US
SKY	Griffing Sandusky Airport	Sandusky	US
PAE	Snohomish County (Paine Field) Airport	Everett	US
MUO	Mountain Home Air Force Base	Mountain Home	US
CDC	Cedar City Regional Airport	Cedar City	US
BDL	Bradley International Airport	Windsor Locks	US
NGU	Norfolk Naval Station (Chambers Field)	Norfolk	US
BXU	Bancasi Airport	Butuan	PH
LBB	Lubbock Preston Smith International Airport	Lubbock	US
ORD	Chicago O'Hare International Airport	Chicago	US
BCT	Boca Raton Airport	Boca Raton	US
FAI	Fairbanks International Airport	Fairbanks	US
CVS	Cannon Air Force Base	Clovis	US
OFF	Offutt Air Force Base	Omaha	US
ART	Watertown International Airport	Watertown	US
PSP	Palm Springs International Airport	Palm Springs	US
AMA	Rick Husband Amarillo International Airport	Amarillo	US
FOD	Fort Dodge Regional Airport	Fort Dodge	US
BAD	Barksdale Air Force Base	Shreveport	US
FOE	Topeka Regional Airport - Forbes Field	Topeka	US
ILM	Wilmington International Airport	Wilmington	US
BTR	Baton Rouge Metropolitan Airport	Baton Rouge	US
TYR	Tyler Pounds Regional Airport	Tyler	US
BWI	Baltimore/Washington International Thurgood Marshall Airport	Baltimore	US
HBR	Hobart Regional Airport	Hobart	US
AEX	Alexandria International Airport	Alexandria	US
TUL	Tulsa International Airport	Tulsa	US
SIT	Sitka Rocky Gutierrez Airport	Sitka	US
ISP	Long Island Mac Arthur Airport	Islip	US
MSP	Minneapolis-St Paul International/Wold-Chamberlain Airport	Minneapolis	US
ILG	New Castle Airport	Wilmington	US
MSY	Louis Armstrong New Orleans International Airport	New Orleans	US
PWM	Portland International Jetport Airport	Portland	US
OKC	Will Rogers World Airport	Oklahoma City	US
ALB	Albany International Airport	Albany	US
LFI	Langley Air Force Base	Hampton	US
SNA	John Wayne Airport-Orange County Airport	Santa Ana	US
GUS	Grissom Air Reserve Base	Peru	US
CPR	Casper-Natrona County International Airport	Casper	US
VPS	Destin-Ft Walton Beach Airport	Valparaiso	US
SEM	Craig Field	Selma	US
EYW	Key West International Airport	Key West	US
CLT	Charlotte Douglas International Airport	Charlotte	US
LAS	McCarran International Airport	Las Vegas	US
MCO	Orlando International Airport	Orlando	US
FLO	Florence Regional Airport	Florence	US
GTF	Great Falls International Airport	Great Falls	US
YNG	Youngstown Warren Regional Airport	Youngstown	US
WRB	Robins Air Force Base	Macon	US
BKK	Suvarnabhumi Airport	Bangkok	TH
TTR	Pongtiku Airport	Makale	ID
KDI	Wolter Monginsidi Airport	Kendari	ID
SBG	Maimun Saleh Airport	Sabang	ID
TSY	Cibeureum Airport	Tasikmalaya	ID
MLG	Abdul Rachman Saleh Airport	Malang	ID
BDO	Husein Sastranegara International Airport	Bandung	ID
CBN	Penggung Airport	Cirebon	ID
JOG	Adi Sutjipto International Airport	Yogyakarta	ID
CXP	Tunggul Wulung Airport	Cilacap	ID
PCB	Pondok Cabe Air Base	Jakarta	ID
SRG	Achmad Yani Airport	Semarang	ID
BDJ	Syamsudin Noor Airport	Banjarmasin	ID
PKY	Tjilik Riwut Airport	Palangkaraya	ID
MOF	Maumere(Wai Oti) Airport	Maumere	ID
ENE	Ende (H Hasan Aroeboesman) Airport	Ende	ID
RTG	Frans Sales Lega Airport	Ruteng	ID
KOE	El Tari Airport	Kupang	ID
BPN	Sultan Aji Muhamad Sulaiman Airport	Balikpapan	ID
SRI	Temindung Airport	Samarinda	ID
AMI	Selaparang Airport	Mataram	ID
BMU	Muhammad Salahuddin Airport	Bima	ID
WGP	Umbu Mehang Kunda Airport	Waingapu	ID
SUB	Juanda International Airport	Surabaya	ID
ICN	Incheon International Airport	Seoul	KR
CNX	Chiang Mai International Airport	Chiang Mai	TH
CEI	Chiang Rai International Airport	Chiang Rai	TH
NST	Nakhon Si Thammarat Airport	Nakhon Si Thammarat	TH
NAK	Nakhon Ratchasima Airport	Nakhon Ratchasima	TH
KOP	Nakhon Phanom Airport	Nakhon Phanom	TH
UBP	Ubon Ratchathani Airport	Ubon Ratchathani	TH
KKC	Khon Kaen Airport	Khon Kaen	TH
THS	Sukhothai Airport	Sukhothai	TH
DPS	Ngurah Rai (Bali) International Airport	Denpasar	ID
ATH	Eleftherios Venizelos International Airport	Athens	GR
NGO	Chubu Centrair International Airport	Nagoya	JP
UKB	Kobe Airport	Kobe	JP
PUW	Pullman Moscow Regional Airport	Pullman	US
LWS	Lewiston Nez Perce County Airport	Lewiston	US
ELM	Elmira Corning Regional Airport	Elmira	US
ITH	Ithaca Tompkins Regional Airport	Ithaca	US
MRY	Monterey Peninsula Airport	Monterey	US
SBA	Santa Barbara Municipal Airport	Santa Barbara	US
DAB	Daytona Beach International Airport	Daytona Beach	US
LPX	Liepāja International Airport	Liepaja	LV
RIX	Riga International Airport	Riga	LV
SQQ	Šiauliai International Airport	Siauliai	LT
KUN	Kaunas International Airport	Kaunas	LT
PLQ	Palanga International Airport	Palanga	LT
VNO	Vilnius International Airport	Vilnius	LT
PNV	Panevėžys Air Base	Panevezys	LT
EVN	Zvartnots International Airport	Yerevan	AM
LWN	Gyumri Shirak Airport	Gyumri	AM
ASA	Assab International Airport	Assab	ER
ASM	Asmara International Airport	Asmara	ER
MSW	Massawa International Airport	Massawa	ER
BUS	Batumi International Airport	Batumi	GE
KUT	Kopitnari Airport	Kutaisi	GE
TBS	Tbilisi International Airport	Tbilisi	GE
ADE	Aden International Airport	Aden	YE
SAH	Sana'a International Airport	Sanaa	YE
FMM	Memmingen Allgau Airport	Memmingen	DE
NAV	Nevşehir Kapadokya Airport	Nevsehir	TR
EZE	Ministro Pistarini International Airport	Buenos Aires	AR
EBL	Erbil International Airport	Erbil	IQ
EMD	Emerald Airport	Emerald	AU
HEW	Athen Helenikon Airport	Athens	GR
KIX	Kansai International Airport	Osaka	JP
JRB	Downtown-Manhattan/Wall St Heliport	New York	US
JAV	Ilulissat Airport	Ilulissat	GL
JCH	Qasigiannguit Heliport	Qasigiannguit	GL
JEG	Aasiaat Airport	Aasiaat	GL
DRW	Darwin International Airport	Darwin	AU
URT	Surat Thani Airport	Surat Thani	TH
HVN	Tweed New Haven Airport	New Haven	US
AVL	Asheville Regional Airport	Asheville	US
GSO	Piedmont Triad International Airport	Greensboro	US
FSD	Joe Foss Field Airport	Sioux Falls	US
APF	Naples Municipal Airport	Naples	US
SDF	Louisville International Standiford Field	Louisville	US
EVV	Evansville Regional Airport	Evansville	US
ABQ	Albuquerque International Sunport	Albuquerque	US
BZN	Gallatin Field	Bozeman	US
BIL	Billings Logan International Airport	Billings	US
BTM	Bert Mooney Airport	Butte	US
TVC	Cherry Capital Airport	Traverse City	US
FRS	Mundo Maya International Airport	Flores	GT
BHB	Hancock County-Bar Harbor Airport	Bar Harbor	US
RKD	Knox County Regional Airport	Rockland	US
RFD	Chicago Rockford International Airport	Rockford	US
DME	Domodedovo International Airport	Moscow	RU
SYX	Sanya Phoenix International Airport	Sanya	CN
GSP	Greenville Spartanburg International Airport	Greenville	US
BMI	Central Illinois Regional Airport at Bloomington-Normal	Bloomington	US
GPT	Gulfport Biloxi International Airport	Gulfport	US
AZO	Kalamazoo Battle Creek International Airport	Kalamazoo	US
TOL	Toledo Express Airport	Toledo	US
FWA	Fort Wayne International Airport	Fort Wayne	US
DEC	Decatur Airport	Decatur	US
CID	The Eastern Iowa Airport	Cedar Rapids	US
LSE	La Crosse Municipal Airport	La Crosse	US
PIA	General Wayne A. Downing Peoria International Airport	Peoria	US
ATW	Appleton International Airport	Appleton	US
RST	Rochester International Airport	Rochester	US
CMI	University of Illinois Willard Airport	Champaign	US
MHK	Manhattan Regional Airport	Manhattan	US
HVB	Hervey Bay Airport	Hervey Bay	AU
DLU	Dali Airport	Dali	CN
FKL	Venango Regional Airport	Franklin	US
NBO	Jomo Kenyatta International Airport	Nairobi	KE
FTE	El Calafate Airport	El Calafate	AR
ARM	Armidale Airport	Armidale	AU
GJT	Grand Junction Regional Airport	Grand Junction	US
DWH	David Wayne Hooks Memorial Airport	Houston	US
SRQ	Sarasota Bradenton International Airport	Sarasota	US
MLI	Quad City International Airport	Moline	US
PFN	Panama City-Bay Co International Airport	Panama City	US
HIR	Honiara International Airport	Honiara	SB
PPT	Faa'a International Airport	Papeete	PF
FUN	Funafuti International Airport	Funafuti	TV
OVB	Tolmachevo Airport	Novosibirsk	RU
BIS	Bismarck Municipal Airport	Bismarck	US
HGN	Mae Hong Son Airport	Mae Hong Son	TH
RAP	Rapid City Regional Airport	Rapid City	US
CLD	Mc Clellan-Palomar Airport	Carlsbad	US
FNT	Bishop International Airport	Flint	US
DVO	Francisco Bangoy International Airport	Davao	PH
FNC	Madeira Airport	Funchal	PT
STM	Maestro Wilson Fonseca Airport	Santarem	BR
KOS	Sihanoukville International Airport	Sihanoukville	KH
LXA	Lhasa Gonggar Airport	Lhasa	CN
RDD	Redding Municipal Airport	Redding	US
EUG	Mahlon Sweet Field	Eugene	US
IDA	Idaho Falls Regional Airport	Idaho Falls	US
MFR	Rogue Valley International Medford Airport	Medford	US
KBZ	Kaikoura Airport	Kaikoura	NZ
YWH	Victoria Harbour Seaplane Base	Victoria	CA
TNA	Yaoqiang Airport	Jinan	CN
CZX	Changzhou Benniu Airport	Changzhou	CN
YBP	Yibin Caiba Airport	Yibin	CN
TJM	Roshchino International Airport	Tyumen	RU
CAK	Akron Canton Regional Airport	Akron	US
HSV	Huntsville International Carl T Jones Field	Huntsville	US
JIB	Djibouti-Ambouli Airport	Djibouti	DJ
HAK	Haikou Meilan International Airport	Haikou	CN
PGA	Page Municipal Airport	Page	US
FCA	Glacier Park International Airport	Kalispell	US
MBS	MBS International Airport	Saginaw	US
BGM	Greater Binghamton/Edwin A Link field	Binghamton	US
BGW	Baghdad International Airport	Baghdad	IQ
NNT	Nan Airport	Nan	TH
ROI	Roi Et Airport	Roi Et	TH
BFV	Buri Ram Airport	Buri Ram	TH
TDX	Trat Airport	Trat	TH
BLH	Blythe Airport	Blythe	US
CRK	Diosdado Macapagal International Airport	Angeles City	PH
SDK	Sandakan Airport	Sandakan	MY
SHE	Taoxian Airport	Shenyang	CN
PSG	Petersburg James A Johnson Airport	Petersburg	US
LYA	Luoyang Airport	Luoyang	CN
VDH	Dong Hoi Airport	Dong Hoi	VN
VKG	Rach Gia Airport	Rach Gia	VN
CAH	Cà Mau Airport	Ca Mau	VN
TBB	Dong Tac Airport	Tuy Hoa	VN
NSI	Yaoundé Nsimalen International Airport	Yaounde	CM
CKY	Conakry International Airport	Conakry	GN
AAH	Aachen-Merzbrück Airport	Aachen	DE
SFB	Orlando Sanford International Airport	Sanford	US
JST	John Murtha Johnstown Cambria County Airport	Johnstown	US
JUM	Jumla Airport	Jumla	NP
MWX	Muan International Airport	Muan	KR
JKL	Kalymnos Airport	Kalymnos	GR
DPL	Dipolog Airport	Dipolog	PH
LAO	Laoag International Airport	Laoag	PH
NOD	Norden-Norddeich Airport	Norden	DE
BPS	Porto Seguro Airport	Porto Seguro	BR
QIG	Iguatu Airport	Iguatu	BR
PMW	Brigadeiro Lysias Rodrigues Airport	Palmas	BR
MSO	Missoula International Airport	Missoula	US
BDB	Bundaberg Airport	Bundaberg	AU
SGR	Sugar Land Regional Airport	Sugar Land	US
APA	Centennial Airport	Denver	US
CVN	Clovis Municipal Airport	Clovis	US
FST	Fort Stockton Pecos County Airport	Fort Stockton	US
LVS	Las Vegas Municipal Airport	Las Vegas	US
IWS	West Houston Airport	Houston	US
LRU	Las Cruces International Airport	Las Cruces	US
BKD	Stephens County Airport	Breckenridge	US
TPL	Draughon Miller Central Texas Regional Airport	Temple	US
SRZ	El Trompillo Airport	Santa Cruz	BO
EGE	Eagle County Regional Airport	Vail	US
CGF	Cuyahoga County Airport	Richmond Heights	US
MFD	Mansfield Lahm Regional Airport	Mansfield	US
CSG	Columbus Metropolitan Airport	Columbus	US
LAW	Lawton Fort Sill Regional Airport	Lawton	US
FNL	Northern Colorado Regional Airport	Fort Collins	US
FLG	Flagstaff Pulliam Airport	Flagstaff	US
TVL	Lake Tahoe Airport	South Lake Tahoe	US
TWF	Joslin Field Magic Valley Regional Airport	Twin Falls	US
GOJ	Nizhny Novgorod Strigino International Airport	Nizhniy Novgorod	RU
HQM	Bowerman Airport	Hoquiam	US
ERI	Erie International Tom Ridge Field	Erie	US
HYA	Barnstable Municipal Boardman Polando Field	Barnstable	US
SPR	San Pedro Airport	San Pedro	BZ
SDX	Sedona Airport	Sedona	US
MGW	Morgantown Municipal Walter L. Bill Hart Field	Morgantown	US
CRW	Yeager Airport	Charleston	US
AVP	Wilkes Barre Scranton International Airport	Scranton	US
BJI	Bemidji Regional Airport	Bemidji	US
THG	Thangool Airport	Biloela	AU
FGI	Fagali'i Airport	Apia	WS
FAR	Hector International Airport	Fargo	US
MKC	Charles B. Wheeler Downtown Airport	Kansas City	US
GCC	Gillette Campbell County Airport	Gillette	US
TOF	Bogashevo Airport	Tomsk	RU
NZJ	El Toro Marine Corps Air Station	Santa Ana	US
PHY	Phetchabun Airport	Phetchabun	TH
CJM	Chumphon Airport	Chumphon	TH
SWA	Jieyang Chaoshan International Airport	Shantou	CN
GEO	Cheddi Jagan International Airport	Georgetown	GY
AGT	Guarani International Airport	Ciudad del Este	PY
OGL	Eugene F. Correira International Airport	Georgetown	GY
DNH	Dunhuang Airport	Dunhuang	CN
AOI	Ancona Falconara Airport	Ancona	IT
SAW	Sabiha Gökçen International Airport	Istanbul	TR
BME	Broome International Airport	Broome	AU
NTL	Newcastle Airport	Newcastle	AU
KLU	Klagenfurt Airport	Klagenfurt	AT
HFT	Hammerfest Airport	Hammerfest	NO
IKA	Imam Khomeini International Airport	Tehran	IR
MHD	Mashhad International Airport	Mashhad	IR
MEI	Key Field	Meridian	US
SPI	Abraham Lincoln Capital Airport	Springfield	US
CEZ	Cortez Municipal Airport	Cortez	US
HDN	Yampa Valley Airport	Hayden	US
GUP	Gallup Municipal Airport	Gallup	US
LBL	Liberal Mid-America Regional Airport	Liberal	US
LAA	Lamar Municipal Airport	Lamar	US
COD	Yellowstone Regional Airport	Cody	US
SGF	Springfield Branson National Airport	Springfield	US
NVK	Narvik Framnes Airport	Narvik	NO
FBU	Oslo, Fornebu Airport	Oslo	NO
NSK	Norilsk-Alykel Airport	Norilsk	RU
AAQ	Anapa Vityazevo Airport	Anapa	RU
JLN	Joplin Regional Airport	Joplin	US
ABE	Lehigh Valley International Airport	Allentown	US
XNA	Northwest Arkansas Regional Airport	Bentonville	US
GUW	Atyrau Airport	Atyrau	KZ
SBN	South Bend Regional Airport	South Bend	US
BKA	Bykovo Airport	Moscow	RU
ARH	Talagi Airport	Arkhangelsk	RU
RTW	Saratov Central Airport	Saratov	RU
NOJ	Noyabrsk Airport	Noyabrsk	RU
UCT	Ukhta Airport	Ukhta	RU
USK	Usinsk Airport	Usinsk	RU
PEX	Pechora Airport	Pechora	RU
PKV	Pskov Airport	Pskov	RU
KJA	Yemelyanovo Airport	Krasnoyarsk	RU
IWA	Ivanovo South Airport	Ivanovo	RU
CGQ	Longjia Airport	Changchun	CN
KIJ	Niigata Airport	Niigata	JP
HHP	Shun Tak Heliport	Hong Kong	HK
AKS	Gwaunaru'u Airport	Auki	SB
IRA	Ngorangora Airport	Kirakira	SB
GZO	Nusatupe Airport	Gizo	SB
CMU	Chimbu Airport	Kundiawa	PG
DAU	Daru Airport	Daru	PG
HKN	Kimbe Airport	Hoskins	PG
UNG	Kiunga Airport	Kiunga	PG
KMA	Kerema Airport	Kerema	PG
KVG	Kavieng Airport	Kavieng	PG
MDU	Mendi Airport	Mendi	PG
TIZ	Tari Airport	Tari	PG
VAI	Vanimo Airport	Vanimo	PG
JFR	Paamiut Heliport	Paamiut	GL
JJU	Qaqortoq Heliport	Qaqortoq	GL
NAQ	Qaanaaq Airport	Qaanaaq	GL
JHS	Sisimiut Airport	Sisimiut	GL
JUV	Upernavik Airport	Upernavik	GL
JQA	Qaarsut Airport	Uummannaq	GL
YWS	Whistler/Green Lake Water Aerodrome	Whistler	CA
YAG	Fort Frances Municipal Airport	Fort Frances	CA
CXH	Vancouver Harbour Water Aerodrome	Vancouver	CA
YMT	Chapais Airport	Chibougamau	CA
YPW	Powell River Airport	Powell River	CA
YQD	The Pas Airport	The Pas	CA
YVZ	Deer Lake Airport	Deer Lake	CA
ZBF	Bathurst Airport	Bathurst	CA
BLJ	Batna Airport	Batna	DZ
KMS	Kumasi Airport	Kumasi	GH
NQT	Nottingham Airport	Nottingham	GB
LWK	Lerwick / Tingwall Airport	Lerwick	GB
PZE	Penzance Heliport	Penzance	GB
OSY	Namsos Høknesøra Airport	Namsos	NO
MQN	Mo i Rana Airport, Røssvoll	Mo i Rana	NO
BZG	Bydgoszcz Ignacy Jan Paderewski Airport	Bydgoszcz	PL
LCJ	Łódź Władysław Reymont Airport	Lodz	PL
KSD	Karlstad Airport	Karlstad	SE
VNT	Ventspils International Airport	Ventspils	LV
QRA	Rand Airport	Johannesburg	ZA
GNZ	Ghanzi Airport	Ghanzi	BW
CIP	Chipata Airport	Chipata	ZM
YVA	Iconi Airport	Moroni	KM
MXT	Maintirano Airport	Maintirano	MG
WAM	Ambatondrazaka Airport	Ambatondrazaka	MG
WMA	Mandritsara Airport	Mandritsara	MG
MJA	Manja Airport	Manja	MG
DUE	Dundo Airport	Dundo	AO
VPE	Ngjiva Pereira Airport	Ondjiva	AO
MSZ	Namibe Airport	Mocamedes	AO
KOU	Koulamoutou Mabimbi Airport	Koulamoutou	GA
MJL	Mouilla Ville Airport	Mouila	GA
TCH	Tchibanga Airport	Tchibanga	GA
VPY	Chimoio Airport	Chimoio	MZ
SRH	Sarh Airport	Sarh	TD
BOA	Boma Airport	Boma	CD
MAT	Tshimpi Airport	Matadi	CD
INO	Inongo Airport	Inongo	CD
BSU	Basankusu Airport	Basankusu	CD
TSH	Tshikapa Airport	Tshikapa	CD
LJA	Lodja Airport	Lodja	CD
PFR	Ilebo Airport	Ilebo	CD
KBS	Bo Airport	Bo	SL
KEN	Kenema Airport	Kenema	SL
OXB	Osvaldo Vieira International Airport	Bissau	GW
GDE	Gode Airport	Gode	ET
GOR	Gore Airport	Gore	ET
MGQ	Aden Adde International Airport	Mogadishu	SO
ATZ	Assiut International Airport	Asyut	EG
MYD	Malindi Airport	Malindi	KE
NYK	Nanyuki Airport	Nanyuki	KE
TOB	Gamal Abdel Nasser Airport	Tobruk	LY
MJI	Mitiga Airport	Tripoli	LY
LAQ	La Abraq Airport	Al Bayda'	LY
ATB	Atbara Airport	Atbara	SD
UYL	Nyala Airport	Nyala	SD
PZU	Port Sudan New International Airport	Port Sudan	SD
BKZ	Bukoba Airport	Bukoba	TZ
TKQ	Kigoma Airport	Kigoma	TZ
LDI	Lindi Airport	Lindi	TZ
MUZ	Musoma Airport	Musoma	TZ
SHY	Shinyanga Airport	Shinyanga	TZ
TBO	Tabora Airport	Tabora	TZ
RUA	Arua Airport	Arua	UG
ULU	Gulu Airport	Gulu	UG
DIU	Diu Airport	Diu	IN
ABR	Aberdeen Regional Airport	Aberdeen	US
ABY	Southwest Georgia Regional Airport	Albany	US
AHN	Athens Ben Epps Airport	Athens	US
ALM	Alamogordo White Sands Regional Airport	Alamogordo	US
ALO	Waterloo Regional Airport	Waterloo	US
ALW	Walla Walla Regional Airport	Walla Walla	US
APN	Alpena County Regional Airport	Alpena	US
ATY	Watertown Regional Airport	Watertown	US
BFD	Bradford Regional Airport	Bradford	US
BFF	Western Neb. Rgnl/William B. Heilig Airport	Scottsbluff	US
BKW	Raleigh County Memorial Airport	Beckley	US
BQK	Brunswick Golden Isles Airport	Brunswick	US
BRL	Southeast Iowa Regional Airport	Burlington	US
CEC	Jack Mc Namara Field Airport	Crescent City	US
CGI	Cape Girardeau Regional Airport	Cape Girardeau	US
CKB	North Central West Virginia Airport	Clarksburg	US
CLM	William R Fairchild International Airport	Port Angeles	US
DDC	Dodge City Regional Airport	Dodge City	US
EAU	Chippewa Valley Regional Airport	Eau Claire	US
EKO	Elko Regional Airport	Elko	US
EWB	New Bedford Regional Airport	New Bedford	US
FAY	Fayetteville Regional Grannis Field	Fayetteville	US
GGW	Wokal Field Glasgow International Airport	Glasgow	US
GRI	Central Nebraska Regional Airport	Grand Island	US
HOT	Memorial Field	Hot Springs	US
HTS	Tri-State/Milton J. Ferguson Field	Huntington	US
IRK	Kirksville Regional Airport	Kirksville	US
JMS	Jamestown Regional Airport	Jamestown	US
LAR	Laramie Regional Airport	Laramie	US
LBE	Arnold Palmer Regional Airport	Latrobe	US
LBF	North Platte Regional Airport Lee Bird Field	North Platte	US
LEB	Lebanon Municipal Airport	Lebanon	US
LMT	Crater Lake-Klamath Regional Airport	Klamath Falls	US
LNS	Lancaster Airport	Lancaster	US
LWT	Lewistown Municipal Airport	Lewistown	US
LYH	Lynchburg Regional Preston Glenn Field	Lynchburg	US
MKG	Muskegon County Airport	Muskegon	US
MLS	Frank Wiley Field	Miles City	US
MSL	Northwest Alabama Regional Airport	Muscle Shoals	US
OTH	Southwest Oregon Regional Airport	North Bend	US
OWB	Owensboro Daviess County Airport	Owensboro	US
PIH	Pocatello Regional Airport	Pocatello	US
PIR	Pierre Regional Airport	Pierre	US
PSM	Portsmouth International at Pease Airport	Portsmouth	US
RDG	Reading Regional Carl A Spaatz Field	Reading	US
RHI	Rhinelander Oneida County Airport	Rhinelander	US
RKS	Southwest Wyoming Regional Airport	Rock Springs	US
RUT	Rutland - Southern Vermont Regional Airport	Rutland	US
SBP	San Luis County Regional Airport	San Luis Obispo	US
SHR	Sheridan County Airport	Sheridan	US
SLK	Adirondack Regional Airport	Saranac Lake	US
SLN	Salina Municipal Airport	Salina	US
SMX	Santa Maria Pub/Capt G Allan Hancock Field	Santa Maria	US
TUP	Tupelo Regional Airport	Tupelo	US
UIN	Quincy Regional Baldwin Field	Quincy	US
VCT	Victoria Regional Airport	Victoria	US
VLD	Valdosta Regional Airport	Valdosta	US
WRL	Worland Municipal Airport	Worland	US
YKM	Yakima Air Terminal McAllister Field	Yakima	US
ECN	Ercan International Airport	Nicosia	CY
AOT	Aosta Airport	Aosta	IT
QSR	Salerno Costa d'Amalfi Airport	Salerno	IT
BNX	Banja Luka International Airport	Banja Luka	BA
USQ	Uşak Airport	Usak	TR
KSY	Kars Airport	Kars	TR
SFQ	Şanlıurfa Airport	Sanliurfa	TR
KCM	Kahramanmaraş Airport	Kahramanmaras	TR
AJI	Ağrı Airport	Agri	TR
ADF	Adıyaman Airport	Adiyaman	TR
ISE	Süleyman Demirel International Airport	Isparta	TR
SZF	Samsun Çarşamba Airport	Samsun	TR
AZS	Samaná El Catey International Airport	Samana	DO
PBR	Puerto Barrios Airport	Puerto Barrios	GT
PEU	Puerto Lempira Airport	Puerto Lempira	HN
CYW	Captain Rogelio Castillo National Airport	Celaya	MX
GUB	Guerrero Negro Airport	Guerrero Negro	MX
PLP	Captain Ramon Xatruch Airport	La Palma	PA
SYQ	Tobias Bolanos International Airport	San Jose	CR
JEE	Jérémie Airport	Jeremie	HT
PAX	Port-de-Paix Airport	Port-de-Paix	HT
PID	Nassau Paradise Island Airport	Nassau	BS
SLH	Sola Airport	Sola	VU
FBD	Fayzabad Airport	Faizabad	AF
BXR	Bam Airport	Bam	IR
RJN	Rafsanjan Airport	Rafsanjan	IR
AFZ	Sabzevar National Airport	Sabzevar	IR
ADU	Ardabil Airport	Ardabil	IR
BNP	Bannu Airport	Bannu	PK
BHV	Bahawalpur Airport	Bahawalpur	PK
CJL	Chitral Airport	Chitral	PK
DEA	Dera Ghazi Khan Airport	Dera Ghazi Khan	PK
KDD	Khuzdar Airport	Khuzdar	PK
PAJ	Parachinar Airport	Parachinar	PK
OKD	Okadama Airport	Sapporo	JP
HSG	Saga Airport	Saga	JP
NKM	Nagoya Airport	Nagoya	JP
FKS	Fukushima Airport	Fukushima	JP
KUV	Kunsan Air Base	Kunsan	KR
MPK	Mokpo Heliport	Mokpo	KR
WJU	Wonju/Hoengseong Air Base (K-38/K-46)	Wonju	KR
JOL	Jolo Airport	Jolo	PH
TDG	Tandag Airport	Tandag	PH
WNP	Naga Airport	Naga	PH
BSO	Basco Airport	Basco	PH
SFE	San Fernando Airport	San Fernando	PH
TUG	Tuguegarao Airport	Tuguegarao	PH
VRC	Virac Airport	Virac	PH
CYP	Calbayog Airport	Calbayog City	PH
CRM	Catarman National Airport	Catarman	PH
MBT	Moises R. Espinosa Airport	Masbate	PH
RXS	Roxas Airport	Roxas City	PH
TTG	General Enrique Mosconi Airport	Tartagal	AR
LHS	Las Heras Airport	Las Heras	AR
OES	Antoine de Saint Exupéry Airport	San Antonio Oeste	AR
ING	Lago Argentino Airport	El Calafate	AR
GGS	Gobernador Gregores Airport	Gobernador Gregores	AR
NEC	Necochea Airport	Necochea	AR
RIA	Santa Maria Airport	Santa Maria	BR
SOD	Sorocaba Airport	Sorocaba	BR
ESM	General Rivadeneira Airport	Esmeraldas	EC
PSY	Port Stanley Airport	Stanley	FK
CRC	Santa Ana Airport	Cartago	CO
EYP	El Yopal Airport	Yopal	CO
RIB	Capitán Av. Selin Zeitun Lopez Airport	Riberalta	BO
REY	Reyes Airport	Reyes	BO
SRJ	Capitán Av. German Quiroga G. Airport	San Borja	BO
ORG	Zorg en Hoop Airport	Paramaribo	SR
CJA	Mayor General FAP Armando Revoredo Iglesias Airport	Cajamarca	PE
NZC	Maria Reiche Neuman Airport	Nazca	PE
SRA	Santa Rosa Airport	Santa Rosa	BR
MYC	Escuela Mariscal Sucre Airport	Maracay	VE
KOV	Kokshetau Airport	Kokshetau	KZ
NER	Chulman Airport	Neryungri	RU
CYX	Cherskiy Airport	Cherskiy	RU
IKS	Tiksi Airport	Tiksi	RU
DYR	Ugolny Airport	Anadyr	RU
OHO	Okhotsk Airport	Okhotsk	RU
IFO	Ivano-Frankivsk International Airport	Ivano-Frankivsk	UA
RWN	Rivne International Airport	Rivne	UA
CEE	Cherepovets Airport	Cherepovets	RU
AMV	Amderma Airport	Amderma	RU
KSZ	Kotlas Airport	Kotlas	RU
PES	Petrozavodsk Airport	Petrozavodsk	RU
GNA	Hrodna Airport	Hrodna	BY
EIE	Yeniseysk Airport	Yeniseysk	RU
KYZ	Kyzyl Airport	Kyzyl	RU
NOZ	Spichenkovo Airport	Novokuznetsk	RU
HTG	Khatanga Airport	Khatanga	RU
IAA	Igarka Airport	Igarka	RU
NAL	Nalchik Airport	Nalchik	RU
OGZ	Beslan Airport	Beslan	RU
ESL	Elista Airport	Elista	RU
BLF	Mercer County Airport	Bluefield	US
GLH	Mid Delta Regional Airport	Greenville	US
PSC	Tri Cities Airport	Pasco	US
SLY	Salekhard Airport	Salekhard	RU
HMA	Khanty Mansiysk Airport	Khanty-Mansiysk	RU
NYA	Nyagan Airport	Nyagan	RU
IJK	Izhevsk Airport	Izhevsk	RU
KVX	Pobedilovo Airport	Kirov	RU
NYM	Nadym Airport	Nadym	RU
NFG	Nefteyugansk Airport	Nefteyugansk	RU
KRO	Kurgan Airport	Kurgan	RU
NMA	Namangan Airport	Namangan	UZ
NCU	Nukus Airport	Nukus	UZ
RYB	Staroselye Airport	Rybinsk	RU
EGO	Belgorod International Airport	Belgorod	RU
URS	Kursk East Airport	Kursk	RU
LPK	Lipetsk Airport	Lipetsk	RU
VKT	Vorkuta Airport	Vorkuta	RU
UUA	Bugulma Airport	Bugulma	RU
JOK	Yoshkar-Ola Airport	Yoshkar-Ola	RU
CSY	Cheboksary Airport	Cheboksary	RU
ULY	Ulyanovsk East Airport	Ulyanovsk	RU
OSW	Orsk Airport	Orsk	RU
PEZ	Penza Airport	Penza	RU
SKX	Saransk Airport	Saransk	RU
BWO	Balakovo Airport	Balakovo	RU
HBX	Hubli Airport	Hubli	IN
BBM	Battambang Airport	Battambang	KH
SHL	Shillong Airport	Shillong	IN
GAU	Lokpriya Gopinath Bordoloi International Airport	Guwahati	IN
TEZ	Tezpur Airport	Tezpur	IN
BHR	Bharatpur Airport	Bharatpur	NP
MAQ	Mae Sot Airport	Tak	TH
HPH	Cat Bi International Airport	Haiphong	VN
CXR	Cam Ranh Airport	Nha Trang	VN
VCA	Can Tho International Airport	Can Tho	VN
PXU	Pleiku Airport	Pleiku	VN
VII	Vinh Airport	Vinh	VN
TVY	Dawei Airport	Dawei	MM
LIW	Loikaw Airport	Loikaw	MM
MNU	Mawlamyine Airport	Mawlamyine	MM
BSX	Pathein Airport	Pathein	MM
HLP	Halim Perdanakusuma International Airport	Jakarta	ID
ALH	Albany Airport	Albany	AU
BCI	Barcaldine Airport	Barcaldine	AU
BVI	Birdsville Airport	Birdsville	AU
BHQ	Broken Hill Airport	Broken Hill	AU
BEU	Bedourie Airport	Bedourie	AU
BRK	Bourke Airport	Bourke	AU
BUC	Burketown Airport	Burketown	AU
BQL	Boulia Airport	Boulia	AU
BHS	Bathurst Airport	Bathurst	AU
CVQ	Carnarvon Airport	Carnarvon	AU
CNJ	Cloncurry Airport	Cloncurry	AU
CED	Ceduna Airport	Ceduna	AU
OOM	Cooma Snowy Mountains Airport	Cooma	AU
DPO	Devonport Airport	Devonport	AU
EPR	Esperance Airport	Esperance	AU
GET	Geraldton Airport	Geraldton	AU
GLT	Gladstone Airport	Gladstone	AU
GFF	Griffith Airport	Griffith	AU
HGD	Hughenden Airport	Hughenden	AU
KAX	Kalbarri Airport	Kalbarri	AU
KRB	Karumba Airport	Karumba	AU
LNO	Leonora Airport	Leonora	AU
LSY	Lismore Airport	Lismore	AU
LRE	Longreach Airport	Longreach	AU
LVO	Laverton Airport	Laverton	AU
MKR	Meekatharra Airport	Meekatharra	AU
MIM	Merimbula Airport	Merimbula	AU
MQL	Mildura Airport	Mildura	AU
MMG	Mount Magnet Airport	Mount Magnet	AU
MRZ	Moree Airport	Moree	AU
MOV	Moranbah Airport	Moranbah	AU
MGB	Mount Gambier Airport	Mount Gambier	AU
MBH	Maryborough Airport	Maryborough	AU
NAA	Narrabri Airport	Narrabri	AU
ZNE	Newman Airport	Newman	AU
PKE	Parkes Airport	Parkes	AU
PLO	Port Lincoln Airport	Port Lincoln	AU
PQQ	Port Macquarie Airport	Port Macquarie	AU
PTJ	Portland Airport	Portland	AU
ULP	Quilpie Airport	Quilpie	AU
RMA	Roma Airport	Roma	AU
XTG	Thargomindah Airport	Thargomindah	AU
WNR	Windorah Airport	Windorah	AU
WYA	Whyalla Airport	Whyalla	AU
WOL	Wollongong Airport	Wollongong	AU
WIN	Winton Airport	Winton	AU
BWT	Wynyard Airport	Burnie	AU
NAY	Beijing Nanyuan Airport	Beijing	CN
CIF	Chifeng Airport	Chifeng	CN
CIH	Changzhi Airport	Changzhi	CN
HET	Baita International Airport	Hohhot	CN
BAV	Baotou Airport	Baotou	CN
SJW	Shijiazhuang Daguocun International Airport	Shijiazhuang	CN
TGO	Tongliao Airport	Tongliao	CN
HLH	Ulanhot Airport	Ulanhot	CN
BHY	Beihai Airport	Beihai	CN
CGD	Changde Airport	Changde	CN
ZUH	Zhuhai Jinwan Airport	Zhuhai	CN
LZH	Liuzhou Bailian Airport	Liuzhou	CN
ZHA	Zhanjiang Airport	Zhanjiang	CN
NNY	Nanyang Jiangying Airport	Nanyang	CN
AKA	Ankang Wulipu Airport	Ankang	CN
GOQ	Golmud Airport	Golmud	CN
HZG	Hanzhong Chenggu Airport	Hanzhong	CN
IQN	Qingyang Airport	Qingyang	CN
XNN	Xining Caojiabu Airport	Xining	CN
ENY	Yan'an Ershilipu Airport	Yan'an	CN
UYN	Yulin Yuyang Airport	Yulin	CN
DLZ	Dalanzadgad Airport	Dalanzadgad	MN
SYM	Pu'er Simao Airport	Simao	CN
ZAT	Zhaotong Airport	Zhaotong	CN
KOW	Ganzhou Airport	Ganzhou	CN
JDZ	Jingdezhen Airport	Jingdezhen	CN
JIU	Jiujiang Lushan Airport	Jiujiang	CN
JUZ	Quzhou Airport	Quzhou	CN
HYN	Huangyan Luqiao Airport	Huangyan	CN
LYI	Shubuling Airport	Linyi	CN
JJN	Quanzhou Jinjiang International Airport	Quanzhou	CN
TXN	Tunxi International Airport	Huangshan	CN
WEF	Weifang Airport	Weifang	CN
WEH	Weihai Airport	Weihai	CN
WUX	Sunan Shuofang International Airport	Wuxi	CN
WUS	Nanping Wuyishan Airport	Wuyishan	CN
WNZ	Wenzhou Longwan International Airport	Wenzhou	CN
YNZ	Yancheng Airport	Yancheng	CN
YIW	Yiwu Airport	Yiwu	CN
HSN	Zhoushan Airport	Zhoushan	CN
DAX	Dachuan Airport	Dazhou	CN
GYS	Guangyuan Airport	Guangyuan	CN
LZO	Luzhou Airport	Luzhou	CN
MIG	Mianyang Airport	Mianyang	CN
NAO	Nanchong Airport	Nanchong	CN
AKU	Aksu Airport	Aksu	CN
KCA	Kuqa Airport	Kuqa	CN
KRL	Korla Airport	Korla	CN
KRY	Karamay Airport	Karamay	CN
HEK	Heihe Airport	Heihe	CN
JMU	Jiamusi Airport	Jiamusi	CN
JNZ	Jinzhou Airport	Jinzhou	CN
NDG	Qiqihar Sanjiazi Airport	Qiqihar	CN
YNJ	Yanji Chaoyangchuan Airport	Yanji	CN
WKL	Waikoloa Heliport	Waikoloa Village	US
ORH	Worcester Regional Airport	Worcester	US
AQG	Anqing Tianzhushan Airport	Anqing	CN
SHP	Shanhaiguan Airport	Qinhuangdao	CN
YCU	Yuncheng Guangong Airport	Yuncheng	CN
JGN	Jiayuguan Airport	Jiayuguan	CN
DDG	Dandong Airport	Dandong	CN
PWT	Bremerton National Airport	Bremerton	US
SPW	Spencer Municipal Airport	Spencer	US
QSA	Sabadell Airport	Sabadell	ES
JEF	Jefferson City Memorial Airport	Jefferson City	US
KMW	Kostroma Sokerkino Airport	Kostroma	RU
ERM	Erechim Airport	Erechim	BR
FUL	Fullerton Municipal Airport	Fullerton	US
USA	Concord-Padgett Regional Airport	Concord	US
QSF	Ain Arnat Airport	Setif	DZ
LRH	La Rochelle-Île de Ré Airport	La Rochelle	FR
SUN	Friedman Memorial Airport	Hailey	US
MCW	Mason City Municipal Airport	Mason City	US
AZA	Phoenix-Mesa-Gateway Airport	Mesa	US
KVK	Kirovsk-Apatity Airport	Apatity	RU
GVR	Coronel Altino Machado de Oliveira Airport	Governador Valadares	BR
HGR	Hagerstown Regional Richard A Henson Field	Hagerstown	US
GOP	Gorakhpur Airport	Gorakhpur	IN
WUZ	Wuzhou Changzhoudao Airport	Wuzhou	CN
TBH	Tugdan Airport	Romblon	PH
ACP	Sahand Airport	Maragheh	IR
GBT	Gorgan Airport	Gorgan	IR
IIL	Ilam Airport	Ilam	IR
TCG	Tacheng Airport	Tacheng	CN
MQM	Mardin Airport	Mardin	TR
LEN	Leon Airport	Leon	ES
RGS	Burgos Airport	Burgos	ES
NDC	Nanded Airport	Nanded	IN
SLV	Shimla Airport	Shimla	IN
CHG	Chaoyang Airport	Chaoyang	CN
BHG	Brus Laguna Airport	Brus Laguna	HN
PDP	Capitan Corbeta CA Curbelo International Airport	Punta del Este	UY
CKZ	Çanakkale Airport	Canakkale	TR
MSR	Muş Airport	Mus	TR
NOP	Sinop Airport	Sinop	TR
HDM	Hamadan Airport	Hamadan	IR
GFN	Grafton Airport	Grafton	AU
OAG	Orange Airport	Orange	AU
TRO	Taree Airport	Taree	AU
HOH	Hohenems-Dornbirn Airport	Hohenems	AT
ESC	Delta County Airport	Escanaba	US
GUL	Goulburn Airport	Goulburn	AU
CES	Cessnock Airport	Cessnock	AU
NSO	Scone Airport	Scone	AU
DGE	Mudgee Airport	Mudgee	AU
MTL	Maitland Airport	Maitland	AU
MWA	Williamson County Regional Airport	Marion	US
KIK	Kirkuk Air Base	Kirkuk	IQ
XJD	Al Udeid Air Base	Doha	QA
IMT	Ford Airport	Iron Mountain	US
MGC	Michigan City Municipal Airport	Michigan City	US
SWD	Seward Airport	Seward	US
AUW	Wausau Downtown Airport	Wausau	US
MYP	Mary Airport	Mary	TM
MIE	Delaware County Johnson Field	Muncie	US
LAF	Purdue University Airport	Lafayette	US
VGT	North Las Vegas Airport	Las Vegas	US
ENW	Kenosha Regional Airport	Kenosha	US
PDT	Eastern Oregon Regional At Pendleton Airport	Pendleton	US
KTR	Tindal Airport	Katherine	AU
NOA	Nowra Airport	Nowra	AU
UCK	Lutsk Airport	Lutsk	UA
BQT	Brest Airport	Brest	BY
OSH	Wittman Regional Airport	Oshkosh	US
BXG	Bendigo Airport	Bendigo	AU
EAT	Pangborn Memorial Airport	Wenatchee	US
ARE	Antonio Nery Juarbe Pol Airport	Arecibo	PR
KCK	Kirensk Airport	Kirensk	RU
QLS	Lausanne-Blécherette Airport	Lausanne	CH
ZJI	Locarno Airport	Locarno	CH
QNC	Neuchatel Airport	Neuchatel	CH
TGK	Taganrog Yuzhny Airport	Taganrog	RU
GDZ	Gelendzhik Airport	Gelendzhik	RU
IAR	Tunoshna Airport	Yaroslavl	RU
JNG	Jining Qufu Airport	Jining	CN
DRK	Drake Bay Airport	Puntarenas	CR
AAT	Altay Air Base	Altay	CN
FWH	NAS Fort Worth JRB/Carswell Field	Dallas	US
NZH	Manzhouli Xijiao Airport	Manzhouli	CN
WUA	Wuhai Airport	Wuhai	CN
GYY	Gary Chicago International Airport	Gary	US
BRD	Brainerd Lakes Regional Airport	Brainerd	US
LWB	Greenbrier Valley Airport	Lewisburg	US
PGV	Pitt Greenville Airport	Greenville	US
OXR	Oxnard Airport	Oxnard	US
BKG	Branson Airport	Branson	US
TEN	Tongren Fenghuang Airport	Tongren	CN
NBC	Begishevo Airport	Nizhnekamsk	RU
NLP	Nelspruit Airport	Nelspruit	ZA
RHP	Ramechhap Airport	Ramechhap	NP
STS	Charles M. Schulz Sonoma County Airport	Santa Rosa	US
ISM	Kissimmee Gateway Airport	Kissimmee	US
LCQ	Lake City Gateway Airport	Lake City	US
LGU	Logan-Cache Airport	Logan	US
BMC	Brigham City Regional Airport	Brigham City	US
ASE	Aspen-Pitkin Co/Sardy Field	Aspen	US
ULV	Ulyanovsk Baratayevka Airport	Ulyanovsk	RU
ERV	Kerrville Municipal Louis Schreiner Field	Kerrville	US
GED	Sussex County Airport	Georgetown	US
ZSW	Prince Rupert/Seal Cove Seaplane Base	Prince Rupert	CA
GBD	Great Bend Municipal Airport	Great Bend	US
HYS	Hays Regional Airport	Hays	US
TVF	Thief River Falls Regional Airport	Thief River Falls	US
ZIN	Interlaken Air Base	Interlaken	CH
SWT	Strezhevoy Airport	Strezhevoy	RU
HUT	Hutchinson Municipal Airport	Hutchinson	US
OAI	Bagram Air Base	Kabul	AF
AKH	Prince Sultan Air Base	Al Kharj	SA
GUC	Gunnison Crested Butte Regional Airport	Gunnison	US
TOA	Zamperini Field	Torrance	US
MBL	Manistee Co Blacker Airport	Manistee	US
PGD	Charlotte County Airport	Punta Gorda	US
JHW	Chautauqua County-Jamestown Airport	Jamestown	US
YTM	La Macaza / Mont-Tremblant International Inc Airport	Mont-Tremblant	CA
SME	Lake Cumberland Regional Airport	Somerset	US
DVL	Devils Lake Regional Airport	Devils Lake	US
DIK	Dickinson Theodore Roosevelt Regional Airport	Dickinson	US
SDY	Sidney - Richland Regional Airport	Sidney	US
CDR	Chadron Municipal Airport	Chadron	US
AIA	Alliance Municipal Airport	Alliance	US
MCK	Mc Cook Ben Nelson Regional Airport	McCook	US
MTH	The Florida Keys Marathon Airport	Marathon	US
GDV	Dawson Community Airport	Glendive	US
ALS	San Luis Valley Regional Bergman Field	Alamosa	US
CNY	Canyonlands Field	Moab	US
VEL	Vernal Regional Airport	Vernal	US
RUI	Sierra Blanca Regional Airport	Ruidoso	US
SOW	Show Low Regional Airport	Show Low	US
MMH	Mammoth Yosemite Airport	Mammoth Lakes	US
AST	Astoria Regional Airport	Astoria	US
ONP	Newport Municipal Airport	Newport	US
MLL	Marshall Don Hunter Sr Airport	Marshall	US
EAA	Eagle Airport	Eagle	US
CEM	Central Airport	Central	US
VIS	Visalia Municipal Airport	Visalia	US
MCE	Merced Regional Macready Field	Merced	US
CPQ	Amarais Airport	Campinas	BR
GYR	Phoenix Goodyear Airport	Goodyear	US
TWB	Toowoomba Airport	Toowoomba	AU
KPV	Perryville Airport	Perryville	US
ABL	Ambler Airport	Ambler	US
SMK	St Michael Airport	St. Michael	US
PNT	Tte. Julio Gallardo Airport	Puerto Natales	CL
IGB	Cabo F.A.A. H. R. Bordón Airport	Ingeniero Jacobacci	AR
YTF	Alma Airport	Alma	CA
YXK	Rimouski Airport	Rimouski	CA
YBY	Bonnyville Airport	Bonnyville	CA
ZNA	Nanaimo Harbour Water Airport	Nanaimo	CA
NCR	San Carlos	San Carlos	NI
NRR	José Aponte de la Torre Airport	Ceiba	PR
ARR	D. Casimiro Szlapelis Airport	Alto Rio Senguer	AR
UYU	Uyuni Airport	Uyuni	BO
ABN	Albina Airport	Albina	SR
MOJ	Moengo Airstrip	Moengo	SR
ICK	Nieuw Nickerie Airport	Nieuw Nickerie	SR
TOT	Totness Airport	Totness	SR
USI	Mabaruma Airport	Mabaruma	GY
MHA	Mahdia Airport	Mahdia	GY
PJC	Dr Augusto Roberto Fuster International Airport	Pedro Juan Caballero	PY
BQJ	Batagay Airport	Batagay	RU
CFB	Cabo Frio Airport	Cabo Frio	BR
OPS	Presidente João Batista Figueiredo Airport	Sinop	BR
GRP	Gurupi Airport	Gurupi	BR
BVS	Breves Airport	Breves	BR
PIN	Parintins Airport	Parintins	BR
BRA	Barreiras Airport	Barreiras	BR
AUX	Araguaína Airport	Araguaina	BR
FRC	Tenente Lund Pressoto Airport	Franca	BR
DOU	Dourados Airport	Dourados	BR
ROO	Maestro Marinho Franco Airport	Rondonopolis	BR
GPB	Tancredo Thomas de Faria Airport	Guarapuava	BR
JCB	Santa Terezinha Airport	Joacaba	BR
RVD	General Leite de Castro Airport	Rio Verde	BR
AAX	Romeu Zema Airport	Araxa	BR
MBZ	Maués Airport	Maues	BR
CIZ	Coari Airport	Coari	BR
BAZ	Barcelos Airport	Barcelos	BR
GNM	Guanambi Airport	Guanambi	BR
QDJ	Tsletsi Airport	Djelfa	DZ
LBZ	Lucapa Airport	Lucapa	AO
MRB	Eastern WV Regional Airport/Shepherd Field	Martinsburg	US
AWA	Awassa Airport	Awasa	ET
JIJ	Wilwal International Airport	Jijiga	ET
QHR	Harar Meda Airport	Debre Zeyit	ET
GOB	Robe Airport	Goba	ET
MYB	Mayumba Airport	Mayumba	GA
CPA	Cape Palmas Airport	Greenville	LR
MAX	Ouro Sogui Airport	Matam	SN
HTY	Hatay Airport	Hatay	TR
FUO	Foshan Shadi Airport	Foshan	CN
HUZ	Huizhou Airport	Huizhou	CN
VGD	Vologda Airport	Vologda	RU
SYS	Saskylakh Airport	Saskylakh	RU
LDG	Leshukonskoye Airport	Arkhangelsk	RU
RKH	Rock Hill - York County Airport	Rock Hill	US
AGC	Allegheny County Airport	Pittsburgh	US
VQQ	Cecil Airport	Jacksonville	US
FTY	Fulton County Airport Brown Field	Atlanta	US
ZAJ	Zaranj Airport	Zaranj	AF
FUG	Fuyang Xiguan Airport	Fuyang	CN
LCX	Longyan Guanzhishan Airport	Longyan	CN
BSD	Baoshan Yunduan Airport	Baoshan	CN
ACX	Xingyi Airport	Xingyi	CN
OSU	The Ohio State University Airport - Don Scott Field	Columbus	US
ADS	Addison Airport	Addison	US
DSI	Destin Executive Airport	Destin	US
KHE	Kherson International Airport	Kherson	UA
HJJ	Zhijiang Airport	Zhijiang	CN
YQI	Yarmouth Airport	Yarmouth	CA
ISO	Kinston Regional Jetport At Stallings Field	Kinston	US
FFA	First Flight Airport	Kill Devil Hills	US
LNJ	Lintsang Airfield	Lincang	CN
YES	Yasouj Airport	Yasuj	IR
OSM	Mosul International Airport	Mosul	IQ
TJH	Tajima Airport	Toyooka	JP
UGA	Bulgan Airport	Bulgan	MN
ULO	Ulaangom Airport	Ulaangom	MN
TAZ	Daşoguz Airport	Dasoguz	TM
HLT	Hamilton Airport	Hamilton	AU
HCQ	Halls Creek Airport	Halls Creek	AU
RVT	Ravensthorpe Airport	Ravensthorpe	AU
PVU	Provo Municipal Airport	Provo	US
SBS	Steamboat Springs Bob Adams Field	Steamboat Springs	US
DTA	Delta Municipal Airport	Delta	US
PUC	Carbon County Regional/Buck Davis Field	Price	US
LAM	Los Alamos Airport	Los Alamos	US
HII	Lake Havasu City Airport	Lake Havasu City	US
INW	Winslow Lindbergh Regional Airport	Winslow	US
DGL	Douglas Municipal Airport	Douglas	US
WTZ	Whitianga Airport	Whitianga	NZ
BOW	Bartow Municipal Airport	Bartow	US
LVK	Livermore Municipal Airport	Livermore	US
TRM	Jacqueline Cochran Regional Airport	Palm Springs	US
SMO	Santa Monica Municipal Airport	Santa Monica	US
UDD	Bermuda Dunes Airport	Palm Springs	US
SCF	Scottsdale Airport	Scottsdale	US
OLM	Olympia Regional Airport	Olympia	US
RIL	Garfield County Regional Airport	Rifle	US
PDK	DeKalb Peachtree Airport	Atlanta	US
BMG	Monroe County Airport	Bloomington	US
SUA	Witham Field	Stuart	US
MMU	Morristown Municipal Airport	Morristown	US
APC	Napa County Airport	Napa	US
SDM	Brown Field Municipal Airport	San Diego	US
VNC	Venice Municipal Airport	Venice	US
PHK	Palm Beach County Glades Airport	Pahokee	US
ECP	Northwest Florida Beaches International Airport	Panama City	US
SBD	San Bernardino International Airport	San Bernardino	US
VAL	Valença Airport	Valenca	BR
CAU	Caruaru Airport	Caruaru	BR
SQL	San Carlos Airport	San Carlos	US
RWI	Rocky Mount Wilson Regional Airport	Rocky Mount	US
SXQ	Soldotna Airport	Soldotna	US
SEE	Gillespie Field	El Cajon	US
TKF	Truckee Tahoe Airport	Truckee	US
FRJ	Fréjus Airport	Frejus	FR
GEX	Geelong Airport	Geelong	AU
JRA	West 30th St. Heliport	New York	US
LAL	Lakeland Linder International Airport	Lakeland	US
MYQ	Mysore Airport	Mysore	IN
MGY	Dayton-Wright Brothers Airport	Dayton	US
EMP	Emporia Municipal Airport	Kempten	DE
QYD	Oksywie Military Air Base	Gdynia	PL
OLV	Olive Branch Airport	Olive Branch	US
KNA	Viña del mar Airport	Vina del Mar	CL
ONQ	Zonguldak Airport	Zonguldak	TR
SLE	Salem Municipal Airport/McNary Field	Salem	US
LND	Hunt Field	Lindau	DE
MWC	Lawrence J Timmerman Airport	Milwaukee	US
JVL	Southern Wisconsin Regional Airport	Janesville	US
LZU	Gwinnett County Briscoe Field	Lawrenceville	US
BWG	Bowling Green Warren County Regional Airport	Bowling Green	US
RVS	Richard Lloyd Jones Jr Airport	Tulsa	US
UKS	Belbek Airport	Sevastopol	UA
JCI	New Century Aircenter Airport	Olathe	US
ESN	Easton Newnam Field	Easton	US
HMR	Stafsberg Airport	Hamar	NO
MYV	Yuba County Airport	Yuba City	US
DUC	Halliburton Field	Duncan	US
UVA	Garner Field	Uvalde	US
LOT	Lewis University Airport	Lockport	US
CCR	Buchanan Field	Concord	US
YUS	Yushu Batang Airport	Yushu	CN
YOO	Toronto/Oshawa Executive Airport	Oshawa	CA
NYW	Monywar Airport	Monywa	MM
ATO	Ohio University Snyder Field	Athens	US
SGH	Springfield-Beckley Municipal Airport	Springfield	US
HEX	Herrera Airport	Santo Domingo	DO
HGS	Hastings Airport	Freetown	SL
TOP	Philip Billard Municipal Airport	Topeka	US
MQY	Smyrna Airport	Smyrna	US
KLS	Southwest Washington Regional Airport	Kelso	US
KHC	Kerch Airport	Kerch	UA
ILN	Wilmington Airpark	Wilmington	US
AVW	Marana Regional Airport	Tucson	US
CGZ	Casa Grande Municipal Airport	Casa Grande	US
BXK	Buckeye Municipal Airport	Buckeye	US
MMI	McMinn County Airport	Athens	US
STK	Sterling Municipal Airport	Sterling	US
RWL	Rawlins Municipal Airport/Harvey Field	Rawlins	US
CDW	Essex County Airport	Caldwell	US
TVI	Thomasville Regional Airport	Thomasville	US
HSH	Henderson Executive Airport	Henderson	US
TMA	Henry Tift Myers Airport	Tifton	US
FRG	Republic Airport	Farmingdale	US
ZHY	Zhongwei Shapotou Airport	Zhongwei	CN
TXG	Taichung Airport	Taichung	TW
HLG	Wheeling Ohio County Airport	Wheeling	US
XYE	Ye Airport	Ye	MM
DWC	Al Maktoum International Airport	Dubai	AE
RKP	Aransas County Airport	Rockport	US
MFX	Méribel Altiport	Ajaccio	FR
TTD	Portland Troutdale Airport	Troutdale	US
HIO	Portland Hillsboro Airport	Hillsboro	US
KHT	Khost Airport	Khost	AF
PRZ	Prineville Airport	Prineville	US
RBL	Red Bluff Municipal Airport	Red Bluff	US
NOT	Marin County Airport - Gnoss Field	Novato	US
LKV	Lake County Airport	Lakeview	US
OTK	Tillamook Airport	Tillamook	US
ONO	Ontario Municipal Airport	Ontario	US
DLS	Columbia Gorge Regional the Dalles Municipal Airport	The Dalles	US
GAI	Montgomery County Airpark	Gaithersburg	US
YTA	Pembroke Airport	Pembroke	CA
YCC	Cornwall Regional Airport	Cornwall	CA
IZA	Zona da Mata Regional Airport	Juiz de Fora	BR
MVL	Morrisville Stowe State Airport	Morrisville	US
RBD	Dallas Executive Airport	Dallas	US
BXY	Krainiy Airport	Baikonur	KZ
BGE	Decatur County Industrial Air Park	Bainbridge	US
WHP	Whiteman Airport	Los Angeles	US
MAE	Madera Municipal Airport	Madera	US
YZZ	Trail Airport	Trail	CA
LDX	Saint-Laurent-du-Maroni Airport	Saint-Laurent-du-Maroni	GF
RVY	Presidente General Don Oscar D. Gestido International Airport	Rivera	UY
POJ	Patos de Minas Airport	Patos de Minas	BR
JTC	Bauru - Arealva Airport	Bauru	BR
CFC	Caçador Airport	Cacador	BR
ERN	Eirunepé Airport	Eirunepe	BR
CCI	Concórdia Airport	Concordia	BR
DTI	Diamantina Airport	Diamantina	BR
FBA	Fonte Boa Airport	Fonte Boa	BR
ORX	Oriximiná Airport	Oriximina	BR
GZP	Gazipaşa Airport	Alanya	TR
FPR	St Lucie County International Airport	Fort Pierce	US
PYM	Plymouth Municipal Airport	Plymouth	US
NCO	Quonset State Airport	North Kingstown	US
OWD	Norwood Memorial Airport	Norwood	US
BAF	Westfield-Barnes Regional Airport	Westfield	US
MGJ	Orange County Airport	Montgomery	US
HAR	Capital City Airport	Harrisburg	US
DXR	Danbury Municipal Airport	Danbury	US
ASH	Boire Field	Nashua	US
LWM	Lawrence Municipal Airport	Lawrence	US
OXC	Waterbury Oxford Airport	Oxford	US
RMG	Richard B Russell Airport	Rome	US
GAD	Northeast Alabama Regional Airport	Gadsden	US
WDR	Barrow County Airport	Winder	US
DNN	Dalton Municipal Airport	Dalton	US
LGC	LaGrange Callaway Airport	LaGrange	US
GVL	Lee Gilmer Memorial Airport	Gainesville	US
HHH	Hilton Head Airport	Hilton Head Island	US
DNL	Daniel Field	Augusta	US
MRN	Foothills Regional Airport	Morganton	US
PVL	Pike County-Hatcher Field	Pikeville	US
TOC	Toccoa Airport - R.G. Letourneau Field	Toccoa	US
PLV	Suprunovka Airport	Poltava	UA
OYL	Moyale Airport	Moyale	KE
THX	Turukhansk Airport	Turukhansk	RU
TGP	Podkamennaya Tunguska Airport	Bor	RU
AFW	Fort Worth Alliance Airport	Fort Worth	US
YHF	Hearst René Fontaine Municipal Airport	Hearst	CA
YKX	Kirkland Lake Airport	Kirkland Lake	CA
LWC	Lawrence Municipal Airport	Lawrence	US
PPM	Pompano Beach Airpark	Pompano Beach	US
LOP	Lombok International Airport	Praya	ID
HDG	Handan Airport	Handan	CN
LOZ	London-Corbin Airport/Magee Field	London	US
FBG	Simmons Army Air Field	Fredericksburg	US
WMI	Modlin Airport	Warsaw	PL
JXA	Jixi Xingkaihu Airport	Jixi	CN
JDG	Jeongseok Airport	Seogwipo	KR
YGM	Gimli Industrial Park Airport	Gimli	CA
RAC	John H Batten Airport	Racine	US
TIW	Tacoma Narrows Airport	Tacoma	US
GUF	Jack Edwards Airport	Gulf Shores	US
HIW	Hiroshimanishi Airport	Hiroshima	JP
HZL	Hazleton Municipal Airport	Hazleton	US
CBE	Greater Cumberland Regional Airport	Cumberland	US
WYN	Wyndham Airport	Wyndham	AU
KLF	Grabtsevo Airport	Kaluga	RU
JOT	Joliet Regional Airport	Joliet	US
VYS	Illinois Valley Regional Airport-Walter A Duncan Field	Peru	US
JXN	Jackson County Reynolds Field	Jackson	US
BBX	Wings Field	Philadelphia	US
OBE	Okeechobee County Airport	Okeechobee	US
SEF	Sebring Regional Airport	Sebring	US
AVO	Avon Park Executive Airport	Avon Park	US
GIF	Winter Haven Regional Airport - Gilbert Field	Winter Haven	US
ZPH	Zephyrhills Municipal Airport	Zephyrhills	US
OCF	Ocala International Airport - Jim Taylor Field	Ocala	US
AIK	Aiken Regional Airport	Aiken	US
CDN	Woodward Field	Camden	US
LBT	Lumberton Regional Airport	Lumberton	US
SVH	Statesville Regional Airport	Statesville	US
LHV	William T. Piper Memorial Airport	Lock Haven	US
BKL	Burke Lakefront Airport	Cleveland	US
DKK	Chautauqua County-Dunkirk Airport	Dunkirk	US
LLY	South Jersey Regional Airport	Mount Holly	US
LDJ	Linden Airport	Linden	US
ANQ	Tri State Steuben County Airport	Angola	US
CLW	Clearwater Air Park	Clearwater	US
CGX	Chicago Meigs Airport	Chicago	US
CRE	Grand Strand Airport	North Myrtle Beach	US
WBW	Wilkes Barre Wyoming Valley Airport	Wilkes-Barre	US
LNN	Willoughby Lost Nation Municipal Airport	Willoughby	US
UMD	Uummannaq Heliport	Uummannaq	GL
FFT	Capital City Airport	Frankfort	US
LEW	Auburn Lewiston Municipal Airport	Lewiston	US
MFI	Marshfield Municipal Airport	Marshfield	US
ISW	Alexander Field South Wood County Airport	Wisconsin Rapids	US
CWI	Clinton Municipal Airport	Clinton	US
BVY	Beverly Municipal Airport	Beverly	US
OSF	Ostafyevo International Airport	Moscow	RU
POF	Poplar Bluff Municipal Airport	Poplar Bluff	US
EOK	Keokuk Municipal Airport	Keokuk	US
PSL	Perth/Scone Airport	Perth	GB
STP	St Paul Downtown Holman Field	St. Paul	US
DKS	Dikson Airport	Dikson	RU
HAO	Butler Co Regional Airport - Hogan Field	Hamilton	US
GAS	Garissa Airport	Garissa	KE
HOA	Hola Airport	Hola	KE
KEY	Kericho Airport	Kericho	KE
ATJ	Antsirabe Airport	Antsirabe	MG
OVA	Bekily Airport	Bekily	MG
RGK	Gorno-Altaysk Airport	Gorno-Altaysk	RU
FLD	Fond du Lac County Airport	Fond du Lac	US
STE	Stevens Point Municipal Airport	Stevens Point	US
GQQ	Galion Municipal Airport	Galion	US
CKV	Clarksville–Montgomery County Regional Airport	Clarksville	US
LPC	Lompoc Airport	Lompoc	US
CTH	Chester County G O Carlson Airport	Coatesville	US
BST	Bost Airport	Lashkar Gah	AF
LLK	Lankaran International Airport	Lankaran	AZ
GBB	Gabala International Airport	Qabala	AZ
ZTU	Zaqatala International Airport	Zaqatala	AZ
LKP	Lake Placid Airport	Lake Placid	US
KDY	Typliy Klyuch Airport	Khandyga	RU
GYG	Magan Airport	Yakutsk	RU
AOH	Lima Allen County Airport	Lima	US
DSO	Sondok Airport	Hamhung	KP
SSI	Malcolm McKinnon Airport	Brunswick	US
BFP	Beaver County Airport	Beaver Falls	US
GGE	Georgetown County Airport	Georgetown	US
HDI	Hardwick Field	Cleveland	US
RNT	Renton Municipal Airport	Renton	US
POC	Brackett Field	La Verne	US
CEU	Oconee County Regional Airport	Clemson	US
BEC	Beech Factory Airport	Wichita	US
SNY	Sidney Municipal-Lloyd W Carr Field	Sidney	US
IFL	Innisfail Airport	Innisfail	AU
JRF	Kalaeloa Airport	Kapolei	US
BIN	Bamiyan Airport	Bamyan	AF
NBS	Changbaishan Airport	Baishan	CN
LUZ	Lublin Airport	Lublin	PL
LLF	Lingling Airport	Yongzhou	CN
ONS	Onslow Airport	Onslow	AU
TDR	Theodore Airport	Theodore	AU
WBU	Boulder Municipal Airport	Boulder	US
PAO	Palo Alto Airport of Santa Clara County	Palo Alto	US
MSC	Falcon Field	Mesa	US
YTY	Yangzhou Taizhou Airport	Yangzhou	CN
PTK	Oakland County International Airport	Pontiac	US
KSI	Kissidougou Airport	Kissidougou	GN
EEN	Dillant Hopkins Airport	Keene	US
RCS	Rochester Airport	Rochester	GB
IOW	Iowa City Municipal Airport	Iowa City	US
TLQ	Turpan Jiaohe Airport	Turpan	CN
ANP	Lee Airport	Annapolis	US
FXO	Cuamba Airport	Cuamba	MZ
ZTR	Zhytomyr Airport	Zhytomyr	UA
PEQ	Pecos Municipal Airport	Pecos	US
HBG	Hattiesburg Bobby L Chain Municipal Airport	Hattiesburg	US
QCJ	Botucatu - Tancredo de Almeida Neves Airport	Botucatu	BR
QSC	Mário Pereira Lopes–São Carlos Airport	Sao Carlos	BR
YKN	Chan Gurney Municipal Airport	Yankton	US
ZBM	Bromont (Roland Desourdy) Airport	Bromont	CA
KTI	Kratie Airport	Kratie	KH
GYU	Guyuan Liupanshan Airport	Guyuan	CN
KRH	Redhill Aerodrome	Redhill	GB
CCL	Chinchilla Airport	Chinchilla	AU
HWD	Hayward Executive Airport	Hayward	US
ARB	Ann Arbor Municipal Airport	Ann Arbor	US
SHT	Shepparton Airport	Shepparton	AU
WIO	Wilcannia Airport	Wilcannia	AU
BFJ	Bijie Feixiong Airport	Bijie	CN
ULK	Lensk Airport	Lensk	RU
KVR	Kavalerovo Airport	Kavalerovo	RU
IGD	Iğdır Airport	Igdir	TR
GNY	Şanlıurfa GAP Airport	Sanliurfa	TR
KZR	Zafer Airport	Kutahya	TR
VLU	Velikiye Luki Airport	Velikiye Luki	RU
NGZ	Alameda Naval Air Station	Alameda	US
YCN	Cochrane Airport	Cochrane	CA
BJP	Estadual Arthur Siqueira Airport	Braganca Paulista	BR
SEK	Srednekolymsk Airport	Srednekolymsk	RU
IVR	Inverell Airport	Inverell	AU
GLI	Glen Innes Airport	Glen Innes	AU
YIC	Yichun Mingyueshan Airport	Yichun	CN
PTB	Dinwiddie County Airport	Petersburg	US
SBM	Sheboygan County Memorial Airport	Sheboygan	US
MZJ	Pinal Airpark	Marana	US
SAD	Safford Regional Airport	Safford	US
EKB	Ekibastuz Airport	Ekibastuz	KZ
SIK	Sikeston Memorial Municipal Airport	Sikeston	US
GFL	Floyd Bennett Memorial Airport	Queensbury	US
MTN	Martin State Airport	Baltimore	US
NEW	Lakefront Airport	New Orleans	US
COE	Coeur D'Alene - Pappy Boyington Field	Coeur d'Alene	US
BMT	Beaumont Municipal Airport	Beaumont	US
DNV	Vermilion Regional Airport	Danville	US
TIX	Space Coast Regional Airport	Titusville	US
AAP	Andrau Airpark	Houston	US
FCM	Flying Cloud Airport	Eden Prairie	US
OJC	Johnson County Executive Airport	Olathe	US
TKT	Tak Airport	Tak	TH
YPD	Parry Sound Area Municipal Airport	Parry Sound	CA
MNZ	Manassas Regional Airport/Harry P. Davis Field	Manassas	US
LJN	Texas Gulf Coast Regional Airport	Angleton	US
BGG	Bingöl Çeltiksuyu Airport	Bingol	TR
KFS	Kastamonu Airport	Kastamonu	TR
ZKP	Zyryanka Airport	Zyryanka	RU
ADH	Aldan Airport	Aldan	RU
OLZ	Olyokminsk Airport	Olekminsk	RU
BOR	Fontaine Airport	Belfort	FR
OBC	Obock Airport	Obock	DJ
BTZ	Bursa Airport	Bursa	TR
EWK	Newton City-County Airport	Newton	US
BSJ	Bairnsdale Airport	Bairnsdale	AU
TZR	Taszár Air Base	Columbus	US
CLS	Chehalis Centralia Airport	Chehalis	US
EVW	Evanston-Uinta County Airport-Burns Field	Evanston	US
MEO	Dare County Regional Airport	Manteo	US
AUO	Auburn University Regional Airport	Auburn	US
DBN	W H 'Bud' Barron Airport	Dublin	US
CVO	Corvallis Municipal Airport	Corvallis	US
OGD	Ogden Hinckley Airport	Ogden	US
AKO	Colorado Plains Regional Airport	Akron	US
SHN	Sanderson Field	Shelton	US
GFO	Bartica A Airport	Bartica	GY
DYL	Doylestown Airport	Doylestown	US
TGI	Tingo Maria Airport	Tingo Maria	PE
TJL	Plínio Alarcom Airport	Tres Lagoas	BR
YZY	Zhangye Ganzhou Airport	Zhangye	CN
OCW	Warren Field	Washington	US
MHC	Mocopulli Airport	Castro	CL
SWO	Stillwater Regional Airport	Stillwater	US
OKM	Okmulgee Regional Airport	Okmulgee	US
CUH	Cushing Municipal Airport	Cushing	US
CSM	Clinton Sherman Airport	Clinton	US
WLD	Strother Field	Winfield	US
PWA	Wiley Post Airport	Oklahoma City	US
DTN	Shreveport Downtown Airport	Shreveport	US
SEP	Stephenville Clark Regional Airport	Stephenville	US
ADT	Ada Regional Airport	Ada	US
IKB	Wilkes County Airport	North Wilkesboro	US
DAN	Danville Regional Airport	Danville	US
HCW	Cheraw Municipal Airport/Lynch Bellinger Field	Cheraw	US
BEM	Beni Mellal Airport	Beni Mellal	MA
NKT	Şırnak Şerafettin Elçi Airport	Cizre	TR
SUY	Suntar Airport	Suntar	RU
ABB	Asaba International Airport	Asaba	NG
QUO	Akwa Ibom International Airport	Uyo	NG
KAA	Kasama Airport	Kasama	ZM
SGX	Songea Airport	Songea	TZ
JUH	Jiuhuashan Airport	Chizhou	CN
AOG	Anshan Air Base	Anshan	CN
DQA	Saertu Airport	Daqing	CN
ZYI	Zunyi Xinzhou Airport	Zunyi	CN
AVA	Anshun Huangguoshu Airport	Anshun	CN
KSS	Sikasso Airport	Sikasso	ML
WTB	Toowoomba Wellcamp Airport	Toowoomba	AU
SZV	Suzhou Guangfu Airport	Suzhou	CN
WMB	Warrnambool Airport	Warrnambool	AU
RCM	Richmond Airport	Richmond	AU
KNO	Kualanamu International Airport	Medan	ID
AMN	Gratiot Community Airport	Kamloops	CA
EMT	San Gabriel Valley Airport	El Monte	US
FAH	Farah Airport	Farah	AF
KRQ	Kramatorsk Airport	Kramatorsk	UA
JAS	Jasper County Airport-Bell Field	Jasper	US
ALE	Alpine Casparis Municipal Airport	Alpine	US
BUY	Bunbury Airport	Bunbury	AU
CCB	Cable Airport	Upland	US
EKI	Elkhart Municipal Airport	Elkhart	US
CUB	Jim Hamilton L.B. Owens Airport	Columbia	US
GDC	Donaldson Field Airport	Greenville	US
HVS	Hartsville Regional Airport	Hartsville	US
LEE	Leesburg International Airport	Leesburg	US
PPY	Pouso Alegre Airport	Pouso Alegre	BR
DIQ	Brigadeiro Cabral Airport	Divinopolis	BR
BWX	Blimbingsari Airport	Banyuwangi	ID
CNO	Chino Airport	Chino	US
PKX	Beijing Daxing International Airport	Beijing	CN
HAF	Half Moon Bay Airport	Half Moon Bay	US
HCJ	Hechi Jinchengjiang Airport	Hechi	CN
WJF	General WM J Fox Airfield	Lancaster	US
UBT	Ubatuba Airport	Ubatuba	BR
TNW	Jumandy Airport	Tena	EC
FYJ	Dongji Aiport	Fuyuan	CN
ZQZ	Zhangjiakou Ningyuan Airport	Zhangjiakou	CN
HNY	Hengyang Nanyue Airport	Hengyang	CN
WOS	Wonsan Kalma International Airport	Wonsan	KP
IGT	Magas Airport	Magas	RU
ASN	Talladega Municipal Airport	Talladega	US
GMU	Greenville Downtown Airport	Greenville	US
TOI	Troy Municipal Airport at N Kenneth Campbell Field	Troy	US
ETS	Enterprise Municipal Airport	Enterprise	US
ALX	Thomas C Russell Field	Alexander City	US
DOH	Hamad International Airport	Doha	QA
HZP	Fort Mackay / Horizon Airport	Wood Buffalo	CA
PTT	Pratt Regional Airport	Pratt	US
LXN	Jim Kelly Field	Lexington	US
CBF	Council Bluffs Municipal Airport	Council Bluffs	US
OKK	Kokomo Municipal Airport	Kokomo	US
GBG	Galesburg Municipal Airport	Galesburg	US
GUY	Guymon Municipal Airport	Guymon	US
IDP	Independence Municipal Airport	Independence	US
BBC	Bay City Municipal Airport	Bay City	US
PRX	Cox Field	Paris	US
CFV	Coffeyville Municipal Airport	Coffeyville	US
GXY	Greeley–Weld County Airport	Greeley	US
OEL	Oryol Yuzhny Airport	Oakley	US
FET	Fremont Municipal Airport	Fremont	US
LGD	La Grande/Union County Airport	La Grande	US
MPO	Pocono Mountains Municipal Airport	Mount Pocono	US
UKT	Quakertown Airport	Quakertown	US
YBA	Banff Airport	Banff	CA
BNG	Banning Municipal Airport	Banning	US
TFL	Juscelino Kubitscheck Airport	Teofilo Otoni	BR
TPF	Peter O Knight Airport	Tampa	US
REZ	Resende Airport	Resende	BR
KBN	Tunta Airport	Kabinda	CD
IKL	Ikela Airport	Ikela	CD
AIR	Aripuanã Airport	Aripuana	BR
CCX	Cáceres Airport	Caceres	BR
BMB	Bumbar Airport	Bumba	CD
APQ	Arapiraca Airport	Arapiraca	BR
FLB	Cangapara Airport	Floriano	BR
PCS	Picos Airport	Picos	BR
BNC	Beni Airport	Beni	CD
BNB	Boende Airport	Boende	CD
MLZ	Cerro Largo International Airport	Melo	UY
PDU	Tydeo Larre Borges Airport	Paysandu	UY
HSM	Horsham Airport	Horsham	AU
SWH	Swan Hill Airport	Swan Hill	AU
KOO	Kongolo Airport	Kongolo	CD
LDM	Mason County Airport	Ludington	US
RHV	Reid-Hillview Airport of Santa Clara County	San Jose	US
KZF	Kaintiba Airport	Kieta	PG
YKO	Hakkari Yüksekova Airport	Hakkari	TR
BUT	Bathpalathang Airport	Jakar	BT
TQL	Tarko-Sale Airport	Tarko-Sale	RU
BPL	Alashankou Bole (Bortala) airport	Bole	CN
ACS	Achinsk Airport	Achinsk	RU
YJP	Hinton/Jasper-Hinton Airport	Hinton	CA
WVI	Watsonville Municipal Airport	Watsonville	US
HLI	Hollister Municipal Airport	Hollister	US
RIZ	Rizhao Shanzihe Airport	Rizhao	CN
SQJ	Shaxian Airport	Sanming	CN
YSE	Squamish Airport	Squamish	CA
YEY	Amos/Magny Airport	Amos	CA
YHE	Hope Airport	Hope	CA
YME	Matane Airport	Matane	CA
YOS	Owen Sound / Billy Bishop Regional Airport	Owen Sound	CA
YRO	Ottawa / Rockcliffe Airport	Ottawa	CA
YSH	Smiths Falls-Montague (Russ Beach) Airport	Smiths Falls	CA
YVE	Vernon Airport	Vernon	CA
YSN	Shuswap Regional Airport	Salmon Arm	CA
FNB	Neubrandenburg Airport	Neubrandenburg	DE
DGP	Daugavpils Intrenational Airport	Daugavpils	LV
NDD	Sumbe Airport	Sumbe	AO
MAI	Mangochi Airport	Mangochi	MW
AXN	Chandler Field	Alexandria	US
CLU	Columbus Municipal Airport	Columbus	US
BBD	Curtis Field	Brady	US
BIH	Eastern Sierra Regional Airport	Bishop	US
BKE	Baker City Municipal Airport	Baker City	US
WMH	Ozark Regional Airport	Mountain Home	US
BTL	W K Kellogg Airport	Battle Creek	US
BYI	Burley Municipal Airport	Burley	US
CCY	Northeast Iowa Regional Airport	Charles City	US
CNU	Chanute Martin Johnson Airport	Chanute	US
CRG	Jacksonville Executive at Craig Airport	Jacksonville	US
CSV	Crossville Memorial Whitson Field	Crossville	US
DAA	Davison Army Air Field	Fort Belvoir	US
DMN	Deming Municipal Airport	Deming	US
EED	Needles Airport	Needles	US
EGI	Duke Field	Crestview	US
EKA	Murray Field	Eureka	US
HYR	Sawyer County Airport	Hayward	US
NHZ	Brunswick Executive Airport	Brunswick	US
OGB	Orangeburg Municipal Airport	Orangeburg	US
OTM	Ottumwa Regional Airport	Ottumwa	US
POU	Dutchess County Airport	Poughkeepsie	US
SNS	Salinas Municipal Airport	Salinas	US
UKI	Ukiah Municipal Airport	Ukiah	US
UOX	University Oxford Airport	Oxford	US
HTV	Huntsville Regional Airport	Huntsville	US
WMC	Winnemucca Municipal Airport	Winnemucca	US
WWR	West Woodward Airport	Woodward	US
ZZV	Zanesville Municipal Airport	Zanesville	US
ECV	Cuatro Vientos Airport	Madrid	ES
XPL	Coronel Enrique Soto Cano Air Base	Comayagua	HN
XXN	Riyadh Air Base	Riyadh	SA
PYK	Payam International Airport	Karaj	IR
SGI	Mushaf Air Base	Sargodha	PK
WWA	Wasilla Airport	Wasilla	US
IWK	Iwakuni Marine Corps Air Station	Iwakuni	JP
BAT	Chafei Amsei Airport	Barretos	BR
TOQ	Barriles Airport	Tocopilla	CL
TLX	Panguilemo Airport	Talca	CL
ZIC	Victoria Airport	Victoria	CL
TTC	Las Breas Airport	Taltal	CL
INA	Inta Airport	Inta	RU
ZIX	Zhigansk Airport	Zhigansk	RU
RDP	Kazi Nazrul Islam Airport	Durgapur	IN
LNX	Smolensk North Airport	Smolensk	RU
DNQ	Deniliquin Airport	Deniliquin	AU
FRB	Forbes Airport	Forbes	AU
TGN	Latrobe Valley Airport	Morwell	AU
SXE	West Sale Airport	Sale	AU
WDS	Shiyan Wudangshan Airport	Shiyan	CN
BFU	Bengbu Airport	Bengbu	CN
WHU	Wuhu Air Base	Wuhu	CN
YKH	Yingkou Lanqi Airport	Yingkou	CN
HYD	Rajiv Gandhi International Airport	Hyderabad	IN
PKO	Parakou Airport	Parakou	BJ
KDC	Kandi Airport	Kandi	BJ
BIB	Baidoa Airport	Baidoa	SO
GOO	Goondiwindi Airport	Goondiwindi	AU
APT	Marion County Brown Field	Jasper	US
DCU	Pryor Field Regional Airport	Decatur	US
GLW	Glasgow Municipal Airport	Glasgow	US
RNZ	Jasper County Airport	Rensselaer	US
TBR	Statesboro Bulloch County Airport	Statesboro	US
WKI	Hwange (Town) Airport	Hwange	ZW
KLJ	Klaipėda Airport	Klaipeda	LT
QND	Cenej Airport	Novi Sad	RS
PCD	Prairie Du Chien Municipal Airport	Prairie du Chien	US
TSM	Taos Regional Airport	Taos	US
RTN	Raton Municipal-Crews Field	Raton	US
PPA	Perry Lefors Field	Pampa	US
BGD	Hutchinson County Airport	Borger	US
NGK	Nogliki Airport	Nogliki	RU
ZBO	Bowen Airport	Bowen	AU
KEO	Odienne Airport	Odienne	CI
GII	Siguiri Airport	Siguiri	GN
WGN	Shaoyang Wugang Airport	Shaoyang	CN
PPF	Tri-City Airport	Parsons	US
AYS	Waycross Ware County Airport	Waycross	US
PMH	Greater Portsmouth Regional Airport	Portsmouth	US
NAC	Naracoorte Airport	Naracoorte	AU
PGZ	Ponta Grossa Airport - Comandante Antonio Amilton Beraldo	Ponta Grossa	BR
CUD	Caloundra Airport	Caloundra	AU
ENO	Encarnación Airport	Encarnacion	PY
NYR	Nyurba Airport	Nyurba	RU
VHV	Verkhnevilyuisk Airport	Verkhnevilyuysk	RU
ION	Impfondo Airport	Impfondo	CG
EBH	El Bayadh Airport	El Bayadh	DZ
BCU	Sir Abubakar Tafawa Balewa International Airport	Bauchi	NG
GMO	Gombe Lawanti International Airport	Gombe	NG
KDA	Kolda North Airport	Kolda	SN
QSI	Moshi Airport	Moshi	TZ
MNS	Mansa Airport	Mansa	ZM
GZI	Ghazni Airport	Ghazni	AF
DBC	Baicheng Chang'an Airport	Baicheng	CN
SQD	Shangrao Sanqingshan Airport	Shangrao	CN
WMT	Zunyi Maotai Airport	Zunyi	CN
CDE	Chengde Puning Airport	Chengde	CN
DTU	Wudalianchi Dedu Airport	Wudalianchi	CN
PBQ	Pimenta Bueno Airport	Pimenta Bueno	BR
WUT	Xinzhou Wutaishan Airport	Xinzhou	CN
SUP	Trunojoyo Airport	Sumenep	ID
BGL	Baglung Airport	Baglung	NP
AEI	Algeciras Heliport	Algeciras	ES
KSE	Kasese Airport	Kasese	UG
NCJ	Sunchales Aeroclub Airport	Sunchales	AR
IST	Istanbul Airport	Istanbul	TR
KQH	Kishangarh Airport	Ajmer	IN
ZCO	La Araucanía Airport	Temuco	CL
VDI	Vidalia Regional Airport	Vidalia	US
ISB	New Islamabad International Airport	Islamabad	PK
MHE	Mitchell Municipal Airport	Mitchell	US
GIT	Mchauru Airport	Geita	TZ
GID	Gitega Airport	Gitega	BI
RMU	Región de Murcia International Airport	Murcia	ES
ZXT	Zabrat Airport	Baku	AZ
JAM	Bezmer Air Base	Yambol	BG
MBI	Songwe Airport	Mbeya	TZ
CPO	Desierto de Atacama Airport	Copiapo	CL
\.


--
-- Data for Name: borders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.borders (country1_iso2, country2_iso2) FROM stdin;
AD	ES
AE	OM
AE	SA
AF	CN
AF	IR
AF	PK
AF	TJ
AF	TM
AF	UZ
AL	GR
AL	ME
AL	MK
AL	RS
AM	AZ
AM	GE
AM	IR
AM	TR
AO	CG
AO	CD
AO	ZM
AR	BO
AR	BR
AR	CL
AR	PY
AR	UY
AT	CZ
AT	DE
AT	HU
AT	IT
AT	LI
AT	SK
AT	SI
AT	CH
AZ	AM
AZ	GE
AZ	IR
AZ	RU
AZ	TR
BA	HR
BA	ME
BA	RS
BD	IN
BD	MM
BE	FR
BE	DE
BE	LU
BE	NL
BF	BJ
BF	CI
BF	GH
BF	ML
BF	NE
BF	TG
BG	GR
BG	MK
BG	RO
BG	RS
BG	TR
BI	CD
BI	RW
BI	TZ
BJ	BF
BJ	NE
BJ	NG
BJ	TG
BN	MY
BO	AR
BO	BR
BO	CL
BO	PY
BO	PE
BR	AR
BR	BO
BR	CO
BR	GF
BR	GY
BR	PY
BR	PE
BR	SR
BR	UY
BR	VE
BT	CN
BT	IN
BW	ZA
BW	ZM
BW	ZW
BY	LV
BY	LT
BY	PL
BY	RU
BY	UA
BZ	GT
BZ	MX
CA	US
CD	AO
CD	BI
CD	CF
CD	CG
CD	RW
CD	SS
CD	TZ
CD	UG
CD	ZM
CF	CM
CF	TD
CF	CG
CF	CD
CF	SS
CF	SD
CG	AO
CG	CM
CG	CF
CG	CD
CG	GA
CH	AT
CH	FR
CH	DE
CH	IT
CH	LI
CI	BF
CI	GH
CI	GN
CI	LR
CI	ML
CL	AR
CL	BO
CL	PE
CM	CF
CM	TD
CM	CG
CM	GQ
CM	GA
CM	NG
CN	AF
CN	BT
CN	HK
CN	IN
CN	KZ
CN	KP
CN	KG
CN	LA
CN	MO
CN	MN
CN	MM
CN	NP
CN	PK
CN	RU
CN	TJ
CN	VN
CO	BR
CO	EC
CO	PA
CO	PE
CO	VE
CR	NI
CR	PA
CZ	AT
CZ	DE
CZ	PL
CZ	SK
DE	AT
DE	BE
DE	CZ
DE	DK
DE	FR
DE	LU
DE	NL
DE	PL
DE	CH
DJ	ER
DJ	ET
DJ	SO
DK	DE
DO	HT
DZ	LY
DZ	ML
DZ	MR
DZ	MA
DZ	NE
DZ	TN
DZ	EH
EC	CO
EC	PE
EE	LV
EE	RU
EG	IL
EG	LY
EG	PS
EG	SD
EH	DZ
EH	MR
EH	MA
ER	DJ
ER	ET
ER	SD
ES	AD
ES	FR
ES	GI
ES	MA
ES	PT
ET	DJ
ET	ER
ET	KE
ET	SO
ET	SS
ET	SD
FI	NO
FI	RU
FI	SE
FR	AD
FR	BE
FR	DE
FR	IT
FR	LU
FR	MC
FR	ES
FR	CH
GA	CM
GA	CG
GA	GQ
GB	IE
GE	AM
GE	AZ
GE	RU
GE	TR
GF	BR
GF	SR
GH	BF
GH	CI
GH	TG
GI	ES
GM	SN
GN	CI
GN	GW
GN	LR
GN	ML
GN	SN
GN	SL
GQ	CM
GQ	GA
GR	AL
GR	BG
GR	MK
GR	TR
GT	BZ
GT	SV
GT	HN
GT	MX
GW	GN
GW	SN
GY	BR
GY	SR
GY	VE
HK	CN
HN	SV
HN	GT
HN	NI
HR	BA
HR	HU
HR	ME
HR	RS
HR	SI
HT	DO
HU	AT
HU	HR
HU	RO
HU	RS
HU	SK
HU	SI
HU	UA
ID	MY
ID	PG
ID	TL
IE	GB
IL	EG
IL	JO
IL	LB
IL	PS
IL	SY
IN	BD
IN	BT
IN	CN
IN	MM
IN	NP
IN	PK
IQ	IR
IQ	JO
IQ	KW
IQ	SA
IQ	SY
IQ	TR
IR	AF
IR	AM
IR	AZ
IR	IQ
IR	PK
IR	TR
IR	TM
IT	AT
IT	FR
IT	SM
IT	SI
IT	CH
IT	VA
JO	IQ
JO	IL
JO	PS
JO	SA
JO	SY
KE	ET
KE	SO
KE	SS
KE	TZ
KE	UG
KG	CN
KG	KZ
KG	TJ
KG	UZ
KH	LA
KH	TH
KH	VN
KP	CN
KP	KR
KP	RU
KR	KP
KW	IQ
KW	SA
KZ	CN
KZ	KG
KZ	RU
KZ	TM
KZ	UZ
LA	CN
LA	KH
LA	MM
LA	TH
LA	VN
LB	IL
LB	SY
LI	AT
LI	CH
LR	CI
LR	GN
LR	SL
LS	ZA
LT	BY
LT	LV
LT	PL
LT	RU
LU	BE
LU	DE
LU	FR
LV	BY
LV	EE
LV	LT
LV	RU
LY	DZ
LY	TD
LY	EG
LY	NE
LY	SD
LY	TN
MA	DZ
MA	ES
MA	EH
MC	FR
MD	RO
MD	UA
ME	AL
ME	BA
ME	HR
ME	RS
MK	AL
MK	BG
MK	GR
MK	RS
ML	DZ
ML	BF
ML	CI
ML	GN
ML	MR
ML	NE
ML	SN
MM	BD
MM	CN
MM	IN
MM	LA
MM	TH
MN	CN
MN	RU
MO	CN
MR	DZ
MR	ML
MR	SN
MR	EH
MW	MZ
MW	TZ
MW	ZM
MX	BZ
MX	GT
MX	US
MY	BN
MY	ID
MY	TH
MZ	MW
MZ	SZ
MZ	ZA
MZ	TZ
MZ	ZM
MZ	ZW
NE	DZ
NE	BJ
NE	BF
NE	TD
NE	LY
NE	ML
NE	NG
NG	BJ
NG	CM
NG	TD
NG	NE
NI	CR
NI	HN
NL	BE
NL	DE
NO	FI
NO	RU
NO	SE
NP	CN
NP	IN
OM	AE
OM	SA
OM	YE
PA	CO
PA	CR
PE	BO
PE	BR
PE	CL
PE	CO
PE	EC
PG	ID
PK	AF
PK	CN
PK	IN
PK	IR
PL	BY
PL	CZ
PL	DE
PL	LT
PL	RU
PL	SK
PL	UA
PS	EG
PS	IL
PS	JO
PT	ES
PY	AR
PY	BO
PY	BR
QA	SA
RO	BG
RO	HU
RO	MD
RO	RS
RO	UA
RS	AL
RS	BA
RS	BG
RS	HR
RS	HU
RS	ME
RS	MK
RS	RO
RU	AZ
RU	BY
RU	CN
RU	EE
RU	FI
RU	GE
RU	KZ
RU	KP
RU	LV
RU	LT
RU	MN
RU	NO
RU	PL
RU	UA
RW	BI
RW	CD
RW	TZ
RW	UG
SA	IQ
SA	JO
SA	KW
SA	OM
SA	QA
SA	AE
SA	YE
SD	CF
SD	TD
SD	EG
SD	ET
SD	ER
SD	LY
SD	SS
SE	FI
SE	NO
SI	AT
SI	HR
SI	HU
SI	IT
SK	AT
SK	CZ
SK	HU
SK	PL
SK	UA
SL	GN
SL	LR
SM	IT
SN	GM
SN	GN
SN	GW
SN	ML
SN	MR
SO	DJ
SO	ET
SO	KE
SR	BR
SR	GF
SR	GY
SS	CF
SS	CD
SS	ET
SS	KE
SS	SD
SS	UG
SV	GT
SV	HN
SY	IQ
SY	IL
SY	JO
SY	LB
SY	TR
SZ	MZ
SZ	ZA
TD	CM
TD	CF
TD	LY
TD	NE
TD	NG
TD	SD
TG	BJ
TG	BF
TG	GH
TH	KH
TH	LA
TH	MY
TH	MM
TJ	AF
TJ	CN
TJ	KG
TJ	UZ
TL	ID
TM	AF
TM	IR
TM	KZ
TM	UZ
TN	DZ
TN	LY
TR	AM
TR	AZ
TR	BG
TR	GE
TR	GR
TR	IR
TR	IQ
TR	SY
TZ	BI
TZ	CD
TZ	KE
TZ	MW
TZ	MZ
TZ	RW
TZ	UG
TZ	ZM
UA	BY
UA	HU
UA	MD
UA	PL
UA	RO
UA	RU
UA	SK
UG	CD
UG	KE
UG	RW
UG	SS
UG	TZ
US	CA
US	MX
UY	AR
UY	BR
UZ	AF
UZ	KZ
UZ	KG
UZ	TJ
UZ	TM
VA	IT
VE	BR
VE	CO
VE	GY
VN	KH
VN	CN
VN	LA
YE	OM
YE	SA
ZA	BW
ZA	LS
ZA	MZ
ZA	SZ
ZA	ZW
ZM	AO
ZM	BW
ZM	CD
ZM	MW
ZM	MZ
ZM	TZ
ZM	ZW
ZW	BW
ZW	MZ
ZW	ZA
ZW	ZM
AG	\N
AI	\N
AO	\N
AS	\N
AU	\N
AW	\N
BB	\N
BH	\N
BM	\N
BS	\N
BW	\N
CK	\N
CU	\N
CV	\N
CY	\N
DM	\N
FJ	\N
FK	\N
FM	\N
GD	\N
GL	\N
GP	\N
GU	\N
IS	\N
JM	\N
JP	\N
KI	\N
KM	\N
KN	\N
KY	\N
LC	\N
LK	\N
MG	\N
MH	\N
MP	\N
MS	\N
MT	\N
MU	\N
MV	\N
NC	\N
NF	\N
NR	\N
NU	\N
NZ	\N
PF	\N
PH	\N
PN	\N
PR	\N
PW	\N
RE	\N
SB	\N
SC	\N
SG	\N
ST	\N
TC	\N
TK	\N
TO	\N
TT	\N
TV	\N
TW	\N
VC	\N
VG	\N
VI	\N
VU	\N
WF	\N
WS	\N
ZA	\N
ZM	\N
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (name, country_iso2, capital, population) FROM stdin;
Huixquilucan	MX	minor	224042
Dayr az Zawr	SY	admin	211857
Ciudad Lopez Mateos	MX	minor	489937
Bingol	TR	admin	160165
Utrecht	NL	admin	640000
Erbil	IQ	admin	852500
Ma'anshan	CN	minor	2202899
Bissau	GW	primary	395954
Mexico City	MX	primary	20996000
Malolos	PH	admin	252074
Eslamshahr	IR	minor	548620
Campeche	MX	admin	220389
Sao Paulo	BR	admin	22046000
Hamm	DE	minor	179111
As Samawah	IQ	admin	215000
Dhamar	YE	admin	160114
Maimanah	AF	admin	199795
Makurdi	NG	admin	292645
Arkhangelsk	RU	admin	351488
Brno	CZ	admin	381346
Wancheng	CN	minor	545597
Makati City	PH	admin	582602
Rabat	MA	primary	1628000
Krasnodar	RU	admin	881476
Odense	DK	minor	158222
Kayseri	TR	admin	1389680
Aqtau	KZ	admin	183350
Kasama	ZM	admin	200000
Zhuhai	CN	minor	1562000
Vladimir	RU	admin	356168
`Ar`ar	SA	admin	167057
Mbandaka	CD	admin	274996
Bulawayo	ZW	admin	653337
Mazar-e Sharif	AF	admin	427600
Arusha	TZ	admin	416442
Ranchi	IN	admin	1073440
Pingquan	CN	minor	446939
Abakan	RU	admin	181709
Gorontalo	ID	admin	191897
Matsue	JP	admin	203565
Guanare	VE	admin	192644
Abu Dhabi	AE	primary	1000000
Baranavichy	BY	minor	175000
Tocuyito	VE	minor	197446
Weihai	CN	minor	2596753
Tacloban	PH	admin	242089
San Justo	AR	minor	136604
Santiago del Estero	AR	admin	252192
Holguin	CU	admin	350191
Merida	MX	admin	892363
Naha	JP	admin	317606
Kirsehir	TR	admin	153511
Zhaodong	CN	minor	980000
Xishan	CN	minor	1060000
Long Xuyen	VN	admin	278658
Comodoro Rivadavia	AR	minor	173266
Riobamba	EC	admin	146324
Trabzon	TR	admin	807903
Juba	SS	primary	372410
Melitopol'	UA	minor	154992
Yaroslavl	RU	admin	608079
Nizhniy Novgorod	RU	admin	1264075
Gent	BE	minor	262219
Sumbawanga	TZ	admin	147483
Caracas	VE	primary	1943901
Tuguegarao	PH	admin	153502
Craiova	RO	admin	269506
Lianran	CN	minor	341341
Oradea	RO	admin	196367
Nema	MR	admin	200000
Malmo	SE	admin	321845
Dongning	CN	minor	210000
Saarbrucken	DE	admin	180741
Bobo-Dioulasso	BF	admin	360106
Yuzhno-Sakhalinsk	RU	admin	194882
Rawalpindi	PK	minor	2098231
Las Tunas	CU	admin	202105
La Paz	BO	primary	2867504
Maradi	NE	admin	267249
Cartago	CR	admin	221733
Jincheng	CN	minor	2120000
Changchun	CN	admin	7674439
Aachen	DE	minor	247380
Cajamarca	PE	admin	201329
Qingdao	CN	minor	5775000
Oulu	FI	admin	200526
Sfax	TN	admin	453050
Morogoro	TZ	admin	207000
Castellon de la Plana	ES	minor	171728
Heze	CN	minor	8750000
Al Fayyum	EG	admin	315940
Xichang	CN	minor	712434
Zhangping	CN	minor	242000
Denver	US	admin	2876625
Lanus	AR	minor	459263
Cork	IE	admin	208669
Nancy	FR	minor	434565
Potsdam	DE	admin	178089
Chemnitz	DE	minor	245403
Bandar-e Bushehr	IR	admin	195222
Monaco	MC	primary	36371
Xinzhou	CN	minor	3067501
Jambi	ID	admin	602187
Zhuji	CN	minor	1157938
Luofeng	CN	minor	570898
Oberhausen	DE	minor	210829
Lubeck	DE	minor	217198
Xinxing	CN	minor	627475
Sri Jayewardenepura Kotte	LK	primary	115826
Zhaoqing	CN	minor	4151700
Guarenas	VE	minor	208663
Isiro	CD	admin	157196
Man	CI	admin	146974
Leon de los Aldama	MX	minor	1454793
Chattogram	BD	admin	2581643
Taozhou	CN	minor	487243
Heihe	CN	minor	1750000
Pakdasht	IR	minor	236319
Los Angeles	CL	minor	218000
Sidi Bel Abbes	DZ	admin	212935
Ado-Ekiti	NG	admin	446749
Hoeryong	KP	minor	153532
Herat	AF	admin	436300
Celaya	MX	minor	468469
Trece Martires City	PH	admin	155713
Rotterdam	NL	minor	1005000
Shymkent	KZ	admin	1018974
Guadalajara	MX	admin	5253000
Ryazan	RU	admin	537622
Al Qamishli	SY	minor	184231
Gangneung	KR	minor	215677
Isparta	TR	admin	258375
Banjarmasin	ID	admin	692793
Jixi	CN	minor	1950000
Lishui	CN	minor	2116957
Naucalpan de Juarez	MX	minor	833779
Pudong	CN	minor	5187200
Cebu City	PH	admin	922611
Nagoya	JP	admin	9113000
Ravenna	IT	minor	159162
San Salvador de Jujuy	AR	admin	321789
Dolores Hidalgo Cuna de la Independencia Nacional	MX	minor	148173
Baku	AZ	primary	2181800
Chicoloapan	MX	minor	175053
Guiyang	CN	admin	4365000
Belgrade	RS	primary	1378682
Gulu	UG	admin	146858
Dashiqiao	CN	minor	704891
Piedras Negras	MX	minor	163595
Palembang	ID	admin	1452456
Yamaguchi	JP	admin	194990
Tijuana	MX	minor	2384609
Medea	DZ	admin	138355
Changsha	CN	admin	7044118
Bukan	IR	minor	248900
Qarshi	UZ	admin	254600
Las Palmas	ES	admin	379925
Cuautitlan Izcalli	MX	minor	511675
Tacna	PE	admin	286240
Lagos de Moreno	MX	minor	164981
Carlos Manuel de Cespedes	CU	minor	224488
Ji'an	CN	minor	4956600
Huelva	ES	minor	143663
Catia La Mar	VE	minor	661897
Lutsk	UA	admin	216505
Oldenburg	DE	minor	168210
Guatire	VE	minor	187262
Kolwezi	CD	admin	418000
Mykolaiv	UA	admin	498748
Bida	NG	minor	173849
Jiangmen	CN	minor	4448871
San-Pedro	CI	admin	210273
Bujumbura	BI	primary	658859
Oslo	NO	primary	693494
Szczecin	PL	admin	403833
Al `Aqabah	JO	admin	140000
Oran	DZ	admin	852000
Toluca	MX	admin	819561
Monteria	CO	admin	460223
Arua	UG	admin	250000
Santa Ana	SV	admin	270413
Zhuangyuan	CN	minor	626683
Luhansk	UA	admin	417990
Rimini	IT	minor	149403
Vaduz	LI	primary	36281
Kohat	PK	minor	170800
Shuangqiao	CN	minor	733000
Liaocheng	CN	minor	5955300
Patna	IN	admin	1684222
Khujand	TJ	admin	181600
Xinpu	CN	minor	4790000
Goyang	KR	minor	1061929
Taihe	CN	minor	924531
Merlo	AR	minor	244168
Quchan	IR	minor	145531
Kuala Lumpur	MY	primary	8285000
Antipolo	PH	admin	776386
Konya	TR	admin	2232374
Malaybalay	PH	admin	174625
Okayama	JP	admin	720865
Hailun	CN	minor	850000
San Felipe	VE	admin	220786
Shibin al Kawm	EG	admin	182900
Taoyuan District	TW	admin	443273
Medina	SA	admin	1180770
Legazpi City	PH	admin	196639
Lima	PE	primary	9848000
Tepatitlan de Morelos	MX	minor	141322
Baishan	CN	minor	330000
Limassol	CY	admin	235056
Digos	PH	admin	169393
Kherson	UA	admin	291428
Sumqayit	AZ	admin	341200
Yaounde	CM	primary	2440462
Pucallpa	PE	admin	326040
Berazategui	AR	minor	180523
Banda Aceh	ID	admin	235305
Tulua	CO	minor	165501
Wuhai	CN	minor	477000
Kaunas	LT	admin	288466
Miluo Chengguanzhen	CN	minor	692080
Polokwane	ZA	admin	220045
Cumana	VE	admin	374706
Oita	JP	admin	477701
Hamilton	NZ	admin	169300
Mudanjiang	CN	minor	2790000
Cuenca	EC	admin	329928
Mumbai	IN	admin	23355000
Qinzhou	CN	minor	3079721
Petropavlovsk-Kamchatskiy	RU	admin	181216
Georgetown	GY	primary	200500
Tainan	TW	admin	1883831
Santa Marta	CO	admin	515556
Vila Nova de Gaia	PT	minor	302295
Lublin	PL	admin	339850
Hanoi	VN	primary	7785000
Matagalpa	NI	admin	156218
Sa Dec	VN	minor	213610
Malakal	SS	admin	147450
Jahrom	IR	minor	141634
Ajdabiya	LY	admin	143833
Kutaisi	GE	admin	147900
Vung Tau	VN	admin	327000
Chongqing	CN	admin	7739000
Tapachula	MX	minor	320451
Darwin	AU	admin	136828
Lu'an	CN	minor	6090000
Lusaka	ZM	primary	1742979
Beirut	LB	primary	361366
Namp'o	KP	admin	310864
Coimbra	PT	admin	143396
Tekirdag	TR	admin	1029927
Yibin	CN	minor	4456000
Dagupan City	PH	admin	171271
San Cristobal	DO	admin	154040
Duisburg	DE	minor	498590
Gemena	CD	admin	198056
Chongzuo	CN	minor	1994285
Esfahan	IR	admin	1756126
Jizzax	UZ	admin	163200
Cuautla	MX	minor	175208
Constanta	RO	admin	283872
Piranshahr	IR	minor	138864
Talca	CL	admin	197479
Antananarivo	MG	primary	2610000
Chengxiang	CN	minor	709500
Nasim Shahr	IR	minor	200393
Rzeszow	PL	admin	182548
Osaka	JP	admin	14977000
Graz	AT	admin	289440
Rasht	IR	admin	639951
Braila	RO	admin	180302
Cam Pha	VN	minor	156000
Ivano-Frankivsk	UA	admin	236602
Shanghai	CN	admin	22120000
Genoa	IT	admin	580097
Accra	GH	primary	2291352
Shimla	IN	admin	206575
Sibiu	RO	admin	147245
Daegu	KR	admin	2461002
Santiago de Cuba	CU	admin	444851
Wiesbaden	DE	admin	278342
Az Zawiyah	LY	admin	200000
Shah Alam	MY	admin	584340
Santiago	DO	admin	1550753
Little Rock	US	admin	439815
Zahedan	IR	admin	560725
Shihezi	CN	minor	380130
Huilong	CN	minor	972525
Rouen	FR	admin	494382
Nalchik	RU	admin	265162
Bielefeld	DE	minor	333786
Umuahia	NG	admin	359230
Bergen	NO	admin	257087
Kota Bharu	MY	admin	491237
Puerto Princesa	PH	admin	255116
Ca Mau	VN	admin	315270
Igdir	TR	admin	137613
Kaihua	CN	minor	481505
Limoges	FR	minor	283823
Bac Ninh	VN	admin	520000
Rybnik	PL	minor	141000
Mostar	BA	minor	163067
Kyiv	UA	primary	2967000
Gaziantep	TR	admin	2028563
Salerno	IT	minor	135066
Kaolack	SN	admin	172305
Culiacan	MX	admin	785800
Sirjan	IR	minor	175000
Yakeshi	CN	minor	352173
Wellington	NZ	primary	418500
Sousse	TN	admin	327004
Izmir	TR	admin	4320519
Bertoua	CM	admin	173000
Chenzhou	CN	minor	4581778
Cizre	TR	minor	143124
Multan	PK	minor	1606481
Urumqi	CN	admin	3112559
Ciudad Apodaca	MX	minor	523370
Topeka	US	admin	147458
Singaraja	ID	minor	234468
Santo Domingo de los Colorados	EC	admin	270875
Puyang Chengguanzhen	CN	minor	666322
Cotabato	PH	admin	299438
Yangshe	CN	minor	1253100
Huzhou	CN	minor	2893542
Aksaray	TR	admin	295351
Patra	GR	admin	167446
Shahrud	IR	minor	150129
Mekele	ET	admin	323700
Dnipro	UA	admin	983836
Rangpur	BD	admin	294265
Tanta	EG	admin	429503
Kunduz	AF	admin	259809
Tororo	UG	admin	150000
Mus	TR	admin	193394
Yangjiang	CN	minor	2357000
Al Basrah	IQ	admin	1225793
Bucheon	KR	minor	867678
Gonbad-e Kavus	IR	minor	151910
Khabarovsk	RU	admin	616242
Neijiang	CN	minor	4238000
Banha	EG	admin	157701
Kanazawa	JP	admin	463873
Haifa	IL	admin	281087
Pecs	HU	admin	142873
Kirikkale	TR	admin	196645
Palu	ID	admin	359350
Altay	CN	minor	142000
Annaba	DZ	admin	257359
Tanch'on	KP	\N	345876
Valencia	VE	admin	1484430
London	GB	primary	10979000
Djelfa	DZ	admin	265833
Xiaoxita	CN	minor	4115000
San Diego	VE	minor	187215
Canberra	AU	primary	426704
Shishi	CN	minor	693000
Mandaue City	PH	admin	362654
Nam Dinh	VN	admin	352108
Rio Branco	BR	admin	383443
Ha Tinh	VN	admin	165396
Jose Maria Ezeiza	AR	minor	160219
Qingnian	CN	minor	760781
Toulon	FR	minor	171953
Yanshi Chengguanzhen	CN	minor	666696
Lobamba	SZ	primary	5800
Farg`ona	UZ	admin	340600
Nagasaki	JP	admin	411421
Varamin	IR	minor	225628
Usak	TR	admin	252044
Osmaniye	TR	admin	264373
Ciudad Guayana	VE	minor	751331
Nice	FR	minor	1006402
Ondo	NG	minor	257005
Gedaref	SD	admin	354927
Daejeon	KR	admin	1475221
Gifu	JP	admin	401534
Toulouse	FR	admin	968638
N'Djamena	TD	primary	1092066
Latakia	SY	admin	700000
Salt Lake City	US	admin	1098526
Thessaloniki	GR	admin	315196
Iasi	RO	admin	290422
Tulancingo	MX	minor	151582
Amiens	FR	minor	136105
Escuintla	GT	admin	172708
Al Hasakah	SY	admin	188160
Kragujevac	RS	admin	150623
Minatitlan	MX	minor	356020
Barahona	DO	admin	138159
Bila Tserkva	UA	minor	208944
Pontianak	ID	admin	618388
Colombo	LK	primary	752993
Jinotega	NI	admin	136342
Modena	IT	minor	184727
Babruysk	BY	minor	212200
Monchengladbach	DE	minor	261454
Le Mans	FR	minor	142946
Al Mukalla	YE	admin	144137
Nairobi	KE	primary	5545000
Ganca	AZ	admin	331400
Brussels	BE	primary	185103
Tuxpam de Rodriguez Cano	MX	minor	143362
Surigao	PH	admin	154137
Guadalupe	MX	minor	691931
La Ceiba	HN	admin	145926
Zinder	NE	admin	322935
Sapporo	JP	admin	1958756
Pinar del Rio	CU	admin	188614
Ensenada	MX	minor	522768
Tambov	RU	admin	290365
Longjing	CN	minor	180307
Taraz	KZ	admin	406262
Al Marj	LY	admin	169540
Usulutan	SV	admin	378606
Cao Lanh	VN	admin	149837
Anlu	CN	minor	720000
Wuwei	CN	minor	1890000
Toyama	JP	admin	415816
Shangzhi	CN	minor	585386
Ra's al Khaymah	AE	admin	160849
Saint-Etienne	FR	minor	172565
Bejaia	DZ	admin	176139
Chimalhuacan	MX	minor	614453
Bishkek	KG	primary	1027200
Pekanbaru	ID	admin	855221
Xalapa	MX	admin	525147
Saga	JP	admin	233514
Sarajevo	BA	primary	275524
Ingolstadt	DE	minor	136981
Leiyang	CN	minor	1151554
Sanming	CN	minor	2580000
Lome	TG	primary	837437
Huludao	CN	minor	2787000
Amasya	TR	admin	149084
Coacalco	MX	minor	278064
Batangas	PH	admin	329874
George	ZA	\N	157394
Garcia	MX	minor	145867
Pingxiang	CN	minor	2001027
Balikesir	TR	admin	331788
Reynosa	MX	minor	725793
Bamenda	CM	admin	269530
Lecheng	CN	minor	419500
Pokhara	NP	admin	353841
Xiamen	CN	minor	4110000
Dingxi	CN	minor	2930000
Nantes	FR	admin	633690
Hailin	CN	minor	420000
Soledad	CO	minor	698852
Al Hillah	IQ	admin	541034
Oral	KZ	admin	271900
Pasay City	PH	admin	416522
Bonn	DE	minor	327258
Panama City	PA	primary	880691
Batman	TR	admin	447106
Sacramento	US	admin	1898019
Bloemfontein	ZA	primary	256185
Armenia	CO	admin	301226
Quy Nhon	VN	admin	311000
Peristeri	GR	minor	139981
Yakou	CN	minor	313828
Czestochowa	PL	minor	228179
Hannover	DE	admin	538068
N'Zerekore	GN	admin	168121
Les Cayes	HT	admin	175457
Ciudad Santa Catarina	MX	minor	259896
Inegol	TR	minor	268155
Setif	DZ	admin	288461
Ivanovo	RU	admin	406933
San Fernando	VE	admin	194274
Doha	QA	primary	1312947
Pakpattan	PK	minor	139525
Beersheba	IL	admin	209000
Cheongju	KR	admin	833276
Malabo	GQ	primary	187302
Salta	AR	admin	535303
Nampula	MZ	admin	477900
Tlaquepaque	MX	minor	575942
Hobart	AU	admin	240342
Kingston	JM	primary	580000
Jiamusi	CN	minor	2360000
Mosul	IQ	admin	1694000
Ghulja	CN	minor	403489
Bello	CO	minor	519670
Dar`a	SY	admin	146481
Gdynia	PL	minor	247672
Az Zaqaziq	EG	admin	302840
Turpan	CN	minor	622903
Puerto Vallarta	MX	minor	221200
Tlalnepantla	MX	minor	750224
Ulan-Ude	RU	admin	431922
Wuyishan	CN	minor	238000
Ghazni	AF	admin	143379
Banyuwangi	ID	minor	172424
Krefeld	DE	minor	227020
Bata	GQ	admin	250770
Anqing	CN	minor	4723000
Jinchang	CN	minor	464200
Praia	CV	primary	127832
Lviv	UA	admin	724314
Moshi	TZ	admin	144739
Pinrang	ID	minor	182731
Karamay	CN	minor	391008
Burgas	BG	admin	226868
Talas	TR	minor	157695
Changhua	TW	admin	750000
Salamanca	MX	minor	260759
Tongshan	CN	minor	8669000
Sofia	BG	primary	1355142
Sakarya	TR	admin	260109
Babol	IR	minor	250217
Kropyvnytskyi	UA	admin	227413
Bandirma	TR	minor	154359
Katowice	PL	admin	276499
Bangalore	IN	admin	13707000
Brest	FR	minor	300300
Misratah	LY	admin	259056
Stara Zagora	BG	admin	158668
Meicheng	CN	minor	500292
Linjiang	CN	minor	173903
Lianshan	CN	minor	2426000
Metepec	MX	minor	206005
Homs	SY	admin	900492
Pathein	MM	admin	237089
Khartoum	SD	primary	7282000
Wusong	CN	minor	720000
Xiping	CN	minor	1873000
Thanh Hoa	VN	admin	393294
Augsburg	DE	minor	295135
Irbid	JO	admin	1088100
Chaoyang	CN	\N	3370000
Mannheim	DE	minor	309370
Guang'an	CN	minor	3723000
Logrono	ES	admin	143698
Valdivia	CL	admin	150048
Kadugli	SD	admin	176931
Suhaj	EG	admin	193931
Sao Tome	ST	primary	56166
Santa Cruz	BO	admin	3151676
Navotas	PH	admin	249463
Nagqu	CN	minor	414554
Ulaanbaatar	MN	primary	1396288
Tbilisi	GE	primary	1118035
Ocumare del Tuy	VE	minor	150000
Liuzhou	CN	minor	3758704
Luanda	AO	primary	8417000
Tours	FR	minor	135787
Maebashi	JP	admin	332999
Linz	AT	admin	204846
Tver	RU	admin	419363
Kindu	CD	admin	262914
Donetsk	UA	admin	929063
Orleans	FR	admin	282828
Metz	FR	minor	391187
Cordoba	ES	minor	325701
Al Fallujah	IQ	minor	326471
Freiburg im Breisgau	DE	minor	230241
Mandi Bahauddin	PK	minor	157352
Grenoble	FR	minor	687985
Chilpancingo	MX	admin	187251
Nong'an	CN	minor	141482
Chillan	CL	admin	164270
Gliwice	PL	minor	179806
Santiago	CL	primary	7007000
Turgutlu	TR	minor	163223
Shahriar	IR	minor	309607
Bor	SS	admin	315351
Neiva	CO	admin	316033
Tirana	AL	primary	418495
Haicheng	CN	minor	1293877
Luxembourg	LU	primary	122273
Chinandega	NI	admin	151707
Mubi	NG	minor	225705
Shuozhou	CN	minor	1714857
Keelung	TW	admin	370155
Medellin	CO	admin	2529403
Tiraspol	MD	admin	157000
Parakou	BJ	admin	188853
Tebessa	DZ	admin	194461
Dushanbe	TJ	primary	780000
Shengli	CN	minor	1790000
Kumul	CN	minor	300848
San Marino	SM	primary	4040
Gharyan	LY	admin	187854
Adana	TR	admin	2220125
Dong Hoi	VN	admin	160325
Marivan	IR	minor	136654
Lodz	PL	admin	690422
Tanga	TZ	admin	243580
Al Kut	IQ	admin	321521
Ardabil	IR	admin	482632
Fuqing	CN	minor	1316000
Rancagua	CL	admin	231370
Cabimas	VE	minor	351735
Braga	PT	admin	181494
Ilorin	NG	admin	847582
Changzhi	CN	minor	3230000
Wakayama	JP	admin	355825
Asmara	ER	primary	963000
Kuytun	CN	minor	166261
Cochabamba	BO	admin	632013
Chizhou	CN	minor	1430000
Buraydah	SA	admin	614093
El Geneina	SD	admin	162981
Granada	ES	minor	232462
Thies	SN	admin	293001
Heidelberg	DE	minor	160355
Guangming	CN	minor	437559
La Romana	DO	admin	208437
Frankfurt	DE	minor	753056
Durango	MX	admin	654876
Quang Ngai	VN	admin	260252
Caloocan City	PH	admin	1583978
Ngaoundere	CM	admin	189800
Punto Fijo	VE	minor	287558
Brest	BY	admin	339700
Chita	RU	admin	347088
E'zhou	CN	minor	1031000
Karbala'	IQ	admin	690100
Tanbei	CN	minor	447701
Marvdasht	IR	minor	148858
Bago	MM	admin	284179
Pago Pago	AS	primary	12576
Tunis	TN	primary	1200000
Shijiazhuang	CN	admin	10784600
Ngerulmud	PW	primary	0
Khomeyni Shahr	IR	minor	218737
Guacara	VE	minor	194009
Maracaibo	VE	admin	1551539
Solingen	DE	minor	159360
Ciudad Benito Juarez	MX	minor	260683
Ghandinagar	IN	admin	195891
Mbale	UG	admin	402368
Sittwe	MM	admin	181000
Turkmenabat	TM	admin	408906
Piraeus	GR	minor	466065
Yilan	TW	admin	150000
Tieli	CN	minor	390000
Soledad de Graciano Sanchez	MX	minor	215968
Chiba	JP	admin	980203
Port-au-Prince	HT	primary	987310
Kharkiv	UA	admin	1446107
Kahramanmaras	TR	admin	443575
Zango	NG	minor	154743
Kiel	DE	admin	247548
Baiyin	CN	minor	1799000
Tete	MZ	admin	152909
Simao	CN	minor	162725
Le Havre	FR	minor	235218
Mecca	SA	admin	1700000
Ciudad del Carmen	MX	minor	169466
Zhanjiang	CN	minor	6900000
Khorramabad	IR	admin	348216
Ibadan	NG	admin	2628000
Andong	KR	admin	162180
Elazig	TR	admin	421726
Castries	LC	primary	70000
Mainz	DE	admin	184997
Buenos Aires	AR	primary	16157000
Orumiyeh	IR	admin	736224
Palikir	FM	primary	6227
Durres	AL	admin	142432
Yamoussoukro	CI	primary	355573
Semarang	ID	admin	1621384
Dire Dawa	ET	admin	277000
Shaoxing	CN	minor	4912239
Calama	CL	minor	157575
Iligan	PH	admin	342618
Lanzhou	CN	admin	3616163
Myitkyina	MM	admin	243031
Dusseldorf	DE	admin	619294
Ahmadabad	IN	minor	7410000
Banjar	ID	minor	182819
Gabes	TN	admin	219517
Kalemie	CD	admin	206257
Male	MV	primary	133019
Melbourne	AU	admin	5078193
Nicolas Romero	MX	minor	366602
Dar es Salaam	TZ	primary	6698000
Paris	FR	primary	11020000
Boca del Rio	MX	minor	138058
Xiangyang	CN	minor	5844000
Braunschweig	DE	minor	248292
Muscat	OM	primary	1421409
Baton Rouge	US	admin	570308
Ha'il	SA	admin	385257
Nakuru	KE	admin	307990
Mandalay	MM	admin	1225546
Tongchuan	CN	minor	835600
Coatzacoalcos	MX	minor	319187
Shanwei	CN	minor	2990000
Rizhao	CN	minor	2720000
Komsomol'sk-na-Amure	RU	minor	249810
Bandar Lampung	ID	admin	1166761
La Victoria	VE	minor	214492
Mokpo	KR	minor	239524
Liege	BE	minor	197885
Reggio Emilia	IT	minor	170996
El Tigre	VE	minor	236566
Zanzibar	TZ	admin	205870
Taunggyi	MM	admin	160115
Tampere	FI	admin	225118
Aswan	EG	admin	267913
Zapopan	MX	minor	1155790
Zhenzhou	CN	minor	564021
Qina	EG	admin	201191
Saveh	IR	minor	220762
Abbottabad	PK	minor	148587
Honiara	SB	primary	84520
A Coruna	ES	minor	370610
Leling	CN	minor	689867
Sokoto	NG	admin	732178
Abeokuta	NG	admin	888924
Voronezh	RU	admin	1047549
Paderborn	DE	minor	150580
Zaragoza	ES	admin	649404
Ljubljana	SI	primary	284355
Tecamac	MX	minor	364579
Yancheng	CN	minor	7260240
Kabul	AF	primary	3678034
Darmstadt	DE	minor	159207
Tripoli	LY	primary	1126000
Puerto Montt	CL	admin	245902
Dublin	IE	primary	1173179
Weinan	CN	minor	5300000
Yicheng	CN	minor	1082929
Shiraz	IR	admin	1460665
Nizip	TR	minor	142389
La Rioja	AR	admin	180995
Xiashi	CN	minor	806966
Salvador	BR	admin	2921087
Cua	VE	minor	214823
Dortmund	DE	minor	587010
Hamburg	DE	admin	1841179
Pietermaritzburg	ZA	admin	750845
Sekondi	GH	admin	286248
Chang'an	CN	minor	537500
Aizawl	IN	admin	283021
Basuo	CN	minor	408309
Madurai	IN	minor	1561129
Riohacha	CO	admin	167865
Tonala	MX	minor	374258
Nangandao	CN	minor	5516000
Bo	SL	admin	174354
Tangdong	CN	minor	337495
Hefei	CN	admin	7457027
Nuremberg	DE	minor	518365
Wencheng	CN	minor	537426
Araure	VE	minor	188800
Magdeburg	DE	admin	238697
Antofagasta	CL	admin	380695
Benin City	NG	admin	1190000
Oyo	NG	minor	736072
Mizhou	CN	minor	1081960
Minzhu	CN	minor	453265
Guangzhou	CN	admin	20902000
Faisalabad	PK	minor	3203846
Oklahoma City	US	admin	972943
Orenburg	RU	admin	564443
Prabumulih	ID	minor	188082
Ixtapaluca	MX	minor	495563
Galati	RO	admin	249432
Jiangguanchi	CN	minor	4289000
Salihli	TR	minor	161562
Papantla de Olarte	MX	minor	152863
Kandahar	AF	admin	491500
Zurich	CH	admin	434008
Concordia	AR	minor	149450
Cusco	PE	admin	428450
Paju	KR	minor	415345
Aomori	JP	admin	276567
Rosario	AR	minor	1193605
Barranquilla	CO	admin	1798000
Izhevsk	RU	admin	646277
Amman	JO	primary	4007526
Funafuti	TV	primary	6025
Catamarca	AR	admin	159139
Nouakchott	MR	primary	1077169
Medan	ID	admin	2210625
Dodoma	TZ	primary	410956
Nanping	CN	minor	2690000
Al Hudaydah	YE	admin	548433
Port of Spain	TT	primary	37074
An Najaf	IQ	admin	724700
Vantaa	FI	minor	214605
Utsunomiya	JP	admin	519255
Tabuk	SA	admin	512629
Jiayuguan	CN	minor	231853
Kumamoto	JP	admin	739393
Al Minya	EG	admin	236043
Ciudad Victoria	MX	admin	305155
Edirne	TR	admin	180327
Sylhet	BD	admin	479837
Prague	CZ	primary	1324277
Kafr ash Shaykh	EG	admin	147393
Malard	IR	minor	281027
Chelyabinsk	RU	admin	1202371
Changwon	KR	admin	1046054
Jieyang	CN	minor	5634000
Tacheng	CN	minor	161037
Phnom Penh	KH	primary	2129371
Otsu	JP	admin	342175
Fianarantsoa	MG	admin	184184
Andorra la Vella	AD	primary	22151
Maputo	MZ	primary	1191613
Butuan	PH	admin	337063
Ogbomoso	NG	minor	1032000
Owerri	NG	admin	1401873
Kuala Terengganu	MY	admin	255109
Songyang	CN	minor	668592
Benghazi	LY	admin	631555
Saint Petersburg	RU	admin	5351935
Malabon	PH	admin	365525
Ciego de Avila	CU	admin	143449
Djibouti	DJ	primary	562000
Hyesan	KP	minor	192680
Ganzhou	CN	minor	8677600
Eregli	TR	minor	175605
Smolensk	RU	admin	329853
Miyazaki	JP	admin	398307
Pingtung	TW	admin	503530
Pamplona	ES	admin	201653
Zhongwei	CN	minor	1046000
Maseru	LS	primary	330790
Seoul	KR	primary	21794000
Matsuyama	JP	admin	509139
Amadora	PT	minor	175136
Ha Long	VN	admin	172915
Brisbane	AU	admin	2514184
Geneva	CH	admin	201818
Dresden	DE	admin	555805
Jiaji	CN	minor	483217
Temuco	CL	admin	282415
Khulna	BD	admin	1311100
Bukavu	CD	admin	436779
Campo Grande	BR	admin	874210
Ilagan	PH	admin	145568
Cagliari	IT	admin	291511
Bangkok	TH	primary	17066000
Huanggang	CN	minor	6667000
Honolulu	US	admin	820987
Valencia	ES	admin	794288
Vitoria-Gasteiz	ES	admin	251774
Abidjan	CI	primary	4980000
Teresina	BR	admin	847430
Johannesburg	ZA	admin	4434827
Az Zarqa'	JO	admin	481300
Taipei	TW	primary	2684567
Brazzaville	CG	primary	1827000
Zhugang	CN	minor	616346
Tomsk	RU	admin	572740
Orel	RU	admin	311625
Jalalabad	AF	admin	205423
Khasavyurt	RU	minor	141259
Maia	PT	minor	135306
Sikasso	ML	admin	213977
Simferopol	UA	admin	341799
Nuku`alofa	TO	primary	24571
Cotonou	BJ	primary	762000
Aba	NG	minor	500183
Chiayi	TW	admin	268622
Port Said	EG	admin	524433
Irakleio	GR	admin	140730
Texcoco	MX	minor	259308
Banjul	GM	primary	31356
Pavlodar	KZ	admin	353930
Murmansk	RU	admin	298096
Mar del Plata	AR	minor	593337
Novi Sad	RS	admin	380000
Shaoguan	CN	minor	2997600
Port-Vila	VU	primary	51437
Al `Arish	EG	admin	178651
Kyoto	JP	admin	1805000
Thimphu	BT	primary	104000
Arak	IR	admin	484212
Naples	IT	admin	972212
Johor Bahru	MY	admin	497097
Bayamo	CU	admin	235107
Asyut	EG	admin	389307
Ashgabat	TM	primary	1031992
Yuxi	CN	minor	2303518
Corum	TR	admin	294807
Syktyvkar	RU	admin	245313
Ndola	ZM	admin	528330
Olympia	US	admin	200915
Viransehir	TR	minor	195910
Montevideo	UY	primary	1319108
Aksu	CN	minor	535657
Valladolid	ES	admin	298412
Velikiy Novgorod	RU	admin	222594
Ad Dammam	SA	admin	903312
Akita	JP	admin	306178
Damanhur	EG	admin	244043
Nawabshah	PK	minor	263102
Dispur	IN	admin	957352
Omsk	RU	admin	1178391
Copiapo	CL	admin	150804
Vientiane	LA	primary	760000
Wuhu	CN	minor	3842100
Iquique	CL	admin	188003
Moroni	KM	primary	111329
George Town	MY	admin	708127
Jinan	CN	admin	3250000
Quezon City	PH	admin	2936116
Perugia	IT	admin	165683
Kuantan	MY	admin	607778
Dadu	PK	minor	146179
Split	HR	admin	178102
Dera Ghazi Khan	PK	minor	264742
Cucuta	CO	admin	750000
Bangui	CF	primary	734350
Colon	PA	admin	241817
Sariwon	KP	admin	307764
Suwon	KR	admin	1234300
Qaraghandy	KZ	admin	501129
Colima	MX	admin	137383
Bandar `Abbas	IR	admin	435751
Kasur	PK	minor	314617
Pingliang	CN	minor	2190000
Phoenix	US	admin	4219697
Comitan	MX	minor	170000
Palermo	IT	admin	674435
Bolu	TR	admin	205525
Heyuan	CN	minor	3093900
Qamdo	CN	minor	598862
Kendari	ID	admin	331013
Angeles City	PH	admin	411634
Xianyang	CN	minor	5040000
Jacobabad	PK	minor	200815
Kota Kinabalu	MY	admin	452058
Maragheh	IR	minor	175255
Hai Duong	VN	admin	507469
Korla	CN	minor	549324
Bydgoszcz	PL	admin	358614
Arequipa	PE	admin	1008290
Ahvaz	IR	admin	1184788
Tokushima	JP	admin	255167
Valledupar	CO	admin	490075
Hamadan	IR	admin	528256
Chiclayo	PE	admin	552508
Taiyuan	CN	admin	3398000
Formosa	AR	admin	222226
St. Paul	US	admin	308096
Yichun	CN	minor	6048700
Cilacap	ID	minor	1174964
Guimaraes	PT	minor	158124
Roseau	DM	primary	16582
Rome	IT	primary	2872800
Torbat-e Heydariyeh	IR	minor	140019
Tianjin	CN	admin	10800000
Rio de Janeiro	BR	admin	12272000
Chengguan	CN	minor	740435
Wenchang	CN	minor	664455
Bechar	DZ	admin	143382
Kostroma	RU	admin	277648
Adelaide	AU	admin	1345777
Dazhou	CN	minor	5693000
Radom	PL	minor	219703
Hegang	CN	minor	1100000
Clermont-Ferrand	FR	minor	143886
Belo Horizonte	BR	admin	5159000
Longyan	CN	minor	2640000
Zacatecas	MX	admin	138152
Nicosia	CY	primary	330000
Muzaffargarh	PK	minor	163268
Rongjiawan	CN	minor	826000
Gondomar	PT	minor	168027
Shuanghejiedao	CN	minor	360000
Chiniot	PK	minor	477781
Jinhua	CN	minor	5361572
Tongliao	CN	minor	3094600
Pointe-Noire	CG	admin	829134
Ruse	BG	admin	163712
Barcelona	VE	admin	448016
Cape Town	ZA	primary	433688
Quetzaltenango	GT	admin	225000
Makassar	ID	admin	1651146
San Juan	AR	admin	471389
Jingcheng	CN	minor	684360
Pitesti	RO	admin	155383
Sharjah	AE	admin	1400000
Hangzhou	CN	admin	6446000
Cabinda	AO	admin	550000
Haiphong	VN	admin	2103500
San Cristobal	VE	admin	743924
Torbali	TR	minor	178772
Bac Lieu	VN	admin	225000
Zagreb	HR	primary	790017
Jijel	DZ	admin	148000
Taichung	TW	admin	2803894
Tallahassee	US	admin	257601
Xicheng	CN	minor	459781
Zaporizhzhia	UA	admin	741717
Ikare	NG	minor	1099931
San Juan del Rio	MX	minor	241699
Agri	TR	admin	149188
Saitama	JP	admin	1307931
Comayagua	HN	admin	144785
Tlemcen	DZ	admin	173531
Bacau	RO	admin	144307
Sanandaj	IR	admin	373987
Jyvaskyla	FI	admin	137368
Nagano	JP	admin	370057
Chimoio	MZ	admin	238976
Maiduguri	NG	admin	1197497
Essen	DE	minor	583109
Vinh	VN	admin	490000
Yiwu	CN	minor	1234015
Alor Setar	MY	admin	217000
Licheng	CN	minor	749522
Yingcheng	CN	minor	986400
Jiujiang	CN	minor	4728778
Bauchi	NG	admin	693700
Sapele	NG	minor	309162
Ayacucho	PE	admin	180766
Qiqihar	CN	minor	5367003
Popayan	CO	admin	300837
Shanhu	CN	minor	679762
Verona	IT	minor	252520
Peshawar	PK	admin	1970042
Tyumen	RU	admin	744554
Aguascalientes	MX	admin	934424
Leping	CN	minor	852800
Portoviejo	EC	admin	206682
Zhangye	CN	minor	1270000
Navojoa	MX	minor	157729
Cairo	EG	primary	19372000
Boulogne-Billancourt	FR	minor	120071
Dongtai	CN	minor	990306
Milan	IT	admin	1351562
Atyrau	KZ	admin	163221
Anaco	VE	minor	162704
San Salvador	SV	primary	567698
Constantine	DZ	admin	448374
Los Teques	VE	admin	251200
Bilbao	ES	minor	346843
Bursa	TR	admin	2901396
Raleigh	US	admin	1038738
Meizhou	CN	minor	4378800
Adiyaman	TR	admin	304615
Turin	IT	admin	870952
Hotan	CN	minor	322300
Yazd	IR	admin	486152
Chisinau	MD	primary	685900
Recife	BR	admin	1555039
Corlu	TR	minor	262862
Bizerte	TN	admin	139843
Guilin	CN	minor	4747963
Ruda Slaska	PL	minor	139412
Fu'an	CN	minor	577000
Zalantun	CN	minor	366323
Changde	CN	minor	5717200
Mahajanga	MG	admin	154657
Donostia	ES	minor	357468
Tarawa	KI	primary	28802
Onitsha	NG	minor	7635000
Kermanshah	IR	admin	851405
Olsztyn	PL	admin	173599
Burgos	ES	minor	170183
Saint-Louis	SN	admin	176000
Pskov	RU	admin	209840
Pachuca	MX	admin	277375
Islamabad	PK	primary	1365000
Herne	DE	minor	156374
Yokohama	JP	admin	3748781
Ijebu-Ode	NG	minor	209175
Dili	TL	primary	222323
Kryvyy Rih	UA	minor	629695
Tanjungpinang	ID	admin	203008
Berlin	DE	primary	3644826
Valparaiso	CL	admin	296655
Gdansk	PL	admin	464254
Nezahualcoyotl	MX	minor	1110565
Guantanamo	CU	admin	228436
Batumi	GE	admin	154600
Mesa	US	\N	518012
Zunhua	CN	minor	737011
Odesa	UA	admin	1010783
Beira	MZ	admin	439264
Saltillo	MX	admin	807537
Deyang	CN	minor	3636000
Fethiye	TR	minor	157745
Son Tay	VN	minor	189547
Dawei	MM	admin	139900
Sumy	UA	admin	265758
Ambon	ID	admin	372249
Lingbao Chengguanzhen	CN	minor	721049
Matosinhos	PT	minor	175478
Jiannan	CN	minor	477868
Bien Hoa	VN	admin	1104000
Kikwit	CD	admin	637736
Siem Reap	KH	admin	147866
Al `Amarah	IQ	admin	345007
Brasilia	BR	primary	3015268
Saint-Denis	RE	admin	190047
Ankara	TR	primary	5503985
Valletta	MT	primary	6444
Yoshkar-Ola	RU	admin	266675
Chetumal	MX	admin	151243
Karaj	IR	admin	1592492
Bafoussam	CM	admin	290768
Istanbul	TR	admin	15154000
Aix-en-Provence	FR	minor	142482
Sarh	TD	admin	169196
Luohe	CN	minor	2500000
Jeju	KR	admin	435413
Wuhan	CN	admin	8962000
Gothenburg	SE	admin	600473
Chlef	DZ	admin	155134
Manama	BH	primary	157474
Penza	RU	admin	523726
Fukang	CN	minor	165006
Kisumu	KE	admin	409928
Playa del Carmen	MX	minor	252087
Uyo	NG	admin	554906
Sao Luis	BR	admin	1073893
Skopje	MK	primary	640000
Shekhupura	PK	minor	411834
Kano	NG	admin	2828861
San Pedro de Macoris	DO	admin	217899
Palangkaraya	ID	admin	249434
Jin'e	CN	minor	633210
Port Moresby	PG	primary	364125
Coro	VE	admin	284266
Plovdiv	BG	admin	384088
Kaohsiung	TW	admin	2773533
Cartagena	CO	admin	1036412
Nazilli	TR	minor	156748
Chifeng	CN	minor	4376600
Suohe	CN	minor	626700
Tripoli	LB	admin	530000
Siirt	TR	admin	166332
Torun	PL	admin	202521
Batna	DZ	admin	290645
Agadir	MA	admin	421844
Perth	AU	admin	2059484
Mbabane	SZ	primary	90138
Iloilo	PH	admin	447992
Kimberley	ZA	admin	165264
Niigata	JP	admin	796500
Jaipur	IN	admin	3073350
Balti	MD	admin	144800
Guayaquil	EC	admin	2723665
Blantyre	MW	admin	1895973
Melaka	MY	admin	455300
Cordoba	AR	admin	1329604
Suez	EG	admin	485342
Minsk	BY	primary	2020600
Yan'an Beilu	CN	minor	426253
Foggia	IT	minor	151975
San Fernando	PH	admin	306659
Xining	CN	admin	2154000
Quanzhou	CN	minor	6480000
Gueckedou	GN	minor	221715
Juarez	MX	minor	1321004
Encheng	CN	minor	492814
Belem	BR	admin	1393399
San Cristobal	MX	minor	158027
Budapest	HU	primary	1752286
Maykop	RU	admin	141970
Garoua	CM	admin	235996
Van	TR	admin	353419
Sucre	BO	primary	300000
Regensburg	DE	minor	152610
Ji'an Shi	CN	minor	222938
Stuttgart	DE	admin	634830
Benguela	AO	admin	513000
Hunchun	CN	minor	225454
Souk Ahras	DZ	admin	134947
Sydney	AU	admin	5312163
Chennai	IN	admin	11324000
Imphal	IN	admin	268243
Tegucigalpa	HN	primary	1126534
Florencio Varela	AR	minor	146704
Helixi	CN	minor	376857
Sanliurfa	TR	admin	1985753
Ning'an	CN	minor	440000
Iquitos	PE	admin	377609
Donghua	CN	minor	189333
Pereira	CO	admin	568750
Phan Rang-Thap Cham	VN	admin	179773
Manizales	CO	admin	375848
Larkana	PK	minor	435817
Ludwigshafen	DE	minor	171061
Petrozavodsk	RU	admin	278551
Shaowu	CN	minor	278000
Klaipeda	LT	admin	164310
Kashan	IR	minor	432557
General Santos	PH	admin	594446
Ed Damazin	SD	admin	186051
Awasa	ET	admin	300100
Kaduna	NG	admin	760084
Hatay	TR	admin	377793
Manisa	TR	admin	243971
Kigali	RW	primary	745261
Shenyang	CN	admin	7105000
Najafabad	IR	minor	235281
Vitoria	BR	admin	1704000
Keren	ER	admin	150000
Ciudad Valles	MX	minor	176935
Kiziltepe	TR	minor	252656
As Sulaymaniyah	IQ	admin	656100
Lausanne	CH	admin	138905
Encarnacion	PY	admin	136308
Nada	CN	minor	932356
Tlajomulco de Zuniga	MX	minor	549442
Yalova	TR	admin	144407
Neyshabur	IR	minor	221700
Miskolc	HU	admin	154521
Yinchuan	CN	admin	1616000
Odivelas	PT	minor	144549
San Luis Rio Colorado	MX	minor	192739
Padova	IT	minor	211560
Bordeaux	FR	admin	257804
Espoo	FI	minor	269802
Tampico	MX	minor	314418
Zijinglu	CN	minor	807857
Sincelejo	CO	admin	279031
Zhongba	CN	minor	762140
New Delhi	IN	primary	142004
Messina	IT	minor	236962
Nyala	SD	admin	227183
San Bernardo	CL	minor	246762
Nukus	UZ	admin	170362
Dadukou	CN	minor	1144000
Kaluga	RU	admin	341892
Yeosu	KR	minor	341994
Santa Cruz	ES	admin	207312
Machala	EC	admin	231260
Guanajuato	MX	admin	171709
Timisoara	RO	admin	319279
Cap-Haitien	HT	admin	190289
Ash Shatrah	IQ	minor	161949
Catania	IT	minor	311584
Marawi City	PH	admin	201785
Lyon	FR	admin	516092
Port Louis	MU	primary	149194
Palo Negro	VE	minor	153706
Blida	DZ	admin	331779
Brikama	GM	admin	195136
Biskra	DZ	admin	204661
Silao	MX	minor	147123
Brasov	RO	admin	290743
Nassau	BS	primary	274400
Podgorica	ME	primary	174515
Tarragona	ES	minor	134515
Delicias	MX	minor	148045
Szeged	HU	admin	160766
Badajoz	ES	minor	150702
Potosi	BO	admin	189652
Alicante	ES	minor	334887
Dongyang	CN	minor	804398
Lichinga	MZ	admin	142253
Saint George's	GD	primary	4315
Mogadishu	SO	primary	2120000
Ho Chi Minh City	VN	admin	13312000
Cheboksary	RU	admin	489498
Giza	EG	admin	3021542
Dijon	FR	admin	156920
Villahermosa	MX	admin	640359
Banja Luka	BA	admin	199191
Zhoukou	CN	minor	9901000
Quito	EC	primary	2011388
Shibirghan	AF	admin	175599
Piura	PE	admin	473025
Torreon	MX	minor	679288
Hyderabad	IN	admin	9746000
Vienna	AT	primary	1840573
Hrodna	BY	admin	356900
Huichang	CN	minor	367113
Sivas	TR	admin	377561
Langzhong	CN	minor	728935
Katsina	NG	admin	432149
Kingstown	VC	primary	25418
Christchurch	NZ	admin	377200
Sialkot City	PK	minor	3893672
Qianzhou	CN	minor	301000
Harar	ET	admin	174994
Rennes	FR	admin	727357
Xinhualu	CN	minor	758079
Padang	ID	admin	914970
Kokshetau	KZ	admin	153057
Shangrao	CN	minor	6579714
Yaritagua	VE	minor	140256
Florence	IT	admin	382258
Rucheng	CN	minor	1267066
Loja	EC	admin	170280
Jos	NG	admin	873943
Ecatepec	MX	minor	1656107
Lisbon	PT	primary	506654
Surabaya	ID	admin	4975000
Camaguey	CU	admin	321992
Vlore	AL	admin	130827
`Ajman	AE	admin	238119
Xigaze	CN	minor	679771
Cancun	MX	minor	743626
Zhangjiajie	CN	minor	1486000
Maceio	BR	admin	1029129
Antsirabe	MG	minor	257163
Rafsanjan	IR	minor	161909
Nanning	CN	admin	7153300
Hamhung	KP	admin	614198
Khmelnytskyi	UA	admin	274176
Mexicali	MX	admin	1102342
Quetta	PK	admin	1140000
City of Paranaque	PH	admin	665822
Basel	CH	admin	177595
Algiers	DZ	primary	3415811
Erzurum	TR	admin	767848
Menemen	TR	minor	174564
Suining	CN	minor	3556000
Ciudad Acuna	MX	minor	216099
Bojnurd	IR	admin	199791
Martapura	ID	minor	198239
Sendai	JP	admin	1058070
Al Ghardaqah	EG	admin	160901
Saint John's	AG	primary	21926
Lang Son	VN	admin	148000
Ordu	TR	admin	155117
Uruapan	MX	minor	315350
Gwangju	KR	admin	1501557
Guixi	CN	minor	647240
Zhoushan	CN	minor	1121261
Kaesong	KP	minor	338155
Nigde	TR	admin	224289
Taixing	CN	minor	1073921
Dongta	CN	minor	261677
San Miguel de Allende	MX	minor	139297
Lira	UG	admin	135445
Gorgan	IR	admin	312223
Wuzhou	CN	minor	2882200
Jose C. Paz	AR	minor	216637
Jerusalem	IL	primary	919438
Pagadian	PH	admin	199060
Sidon	LB	admin	200000
Zabrze	PL	minor	174349
Zielona Gora	PL	admin	139330
Boulogne-sur-Mer	FR	minor	133062
Kairouan	TN	admin	144522
Hagen	DE	minor	188814
Tarsus	TR	minor	339676
Lilongwe	MW	primary	781538
Porto Alegre	BR	admin	1484941
Wuxi	CN	minor	4580000
Rajshahi	BD	admin	448087
Tallinn	EE	primary	434562
Kunming	CN	admin	6250000
Malatya	TR	admin	461574
Tangier	MA	admin	947952
Chihuahua	MX	admin	878062
Guiping	CN	minor	1496904
Gwangyang	KR	minor	151834
Mazatan	MX	minor	500000
Delhi	IN	admin	29617000
Vinnytsia	UA	admin	371855
Semnan	IR	admin	153680
Ningde	CN	minor	2910000
Niamey	NE	primary	1026848
Harare	ZW	primary	1606000
Wad Medani	SD	admin	332714
Chalco	MX	minor	310130
Takamatsu	JP	admin	418772
Maroua	CM	admin	319941
Namangan	UZ	admin	408500
Hagta	GU	primary	1051
Rach Gia	VN	admin	250660
Jinshi	CN	minor	251064
Bamiantong	CN	minor	330000
Pocheon	KR	minor	163388
Bamako	ML	primary	2009109
Malaga	ES	minor	574654
Dhaka	BD	primary	15443000
Sorsogon	PH	admin	168110
David	PA	admin	144858
Huizhou	CN	minor	3875000
Agartala	IN	admin	522613
Aracaju	BR	admin	685356
Ica	PE	admin	282407
Zhubei	TW	admin	200000
Haeju	KP	admin	241599
Sanya	CN	minor	362689
Shima	CN	minor	956400
Veracruz	MX	minor	552156
Dehra Dun	IN	admin	578420
Goiania	BR	admin	1393575
Perm	RU	admin	1048005
Chengdu	CN	admin	11309000
Thu Dau Mot	VN	admin	244277
Xibeijie	CN	minor	977600
Yunxian Chengguanzhen	CN	minor	133558
Santander	ES	admin	172539
Lagos	NG	minor	15279000
Nay Pyi Taw	MM	primary	1160242
Ulsan	KR	admin	1166033
Eindhoven	NL	minor	398053
Al Mansurah	EG	admin	439348
Cherkasy	UA	admin	276360
Mbeya	TZ	admin	291649
Trujillo	PE	admin	919899
Joao Pessoa	BR	admin	801718
Bratislava	SK	primary	429564
Groningen	NL	admin	216688
Mulheim	DE	minor	170880
Toamasina	MG	admin	225116
San Francisco de Macoris	DO	admin	174879
Quelimane	MZ	admin	192876
Dongguan	CN	minor	7981000
Rize	TR	admin	141143
Jianshe	CN	minor	687130
Oaxaca	MX	admin	300050
Gujranwala	PK	minor	1569090
Turmero	VE	minor	254880
Bridgetown	BB	primary	110000
Nonthaburi	TH	admin	255671
Palma	ES	admin	416065
Ciudad Madero	MX	minor	209175
Thai Binh	VN	admin	268167
Lahore	PK	admin	11021000
Guatemala City	GT	primary	2450212
Yakutsk	RU	admin	307911
San Nicolas de los Arroyos	AR	minor	160000
Ar Raqqah	SY	admin	196529
Kaifeng Chengguanzhen	CN	minor	872000
Zhongshan	CN	minor	3121275
Yangquan	CN	minor	1300000
Heroica Nogales	MX	minor	220292
Nis	RS	admin	183164
Djougou	BJ	admin	202810
Debrecen	HU	admin	201432
Damascus	SY	primary	1754000
Shahin Shahr	IR	minor	173329
Almada	PT	minor	174030
Parma	IT	minor	194417
Vila Franca de Xira	PT	minor	136886
Lucena	PH	admin	266248
Xi'an	CN	admin	7135000
Boa Vista	BR	admin	326419
Singapore	SG	primary	5745000
Huanuco	PE	admin	196627
Owo	NG	minor	276574
Wroclaw	PL	admin	638586
Luxor	EG	admin	202232
Huacho	PE	admin	200585
Fenglu	CN	minor	169366
Apia	WS	primary	37708
Mataram	ID	admin	408900
Zhangzhou	CN	minor	5140000
Ta`izz	YE	admin	596672
Fortaleza	BR	admin	2452185
Pasto	CO	admin	382236
Nevsehir	TR	admin	143194
Sevastopol	UA	admin	428753
Puerto Cabello	VE	minor	209080
Wutong	CN	minor	815848
Lianyuan	CN	minor	1162928
Shillong	IN	admin	143229
Zhuzhou	CN	minor	3855609
Huambo	AO	admin	665564
Zanjan	IR	admin	433475
Indianapolis	US	admin	1588961
Ostrava	CZ	admin	287968
Zabid	YE	minor	152504
Fukuoka	JP	admin	2128000
Cuernavaca	MX	admin	366321
Santo Domingo	DO	primary	2581827
Saransk	RU	admin	314789
Bielsko-Biala	PL	minor	172781
Viet Tri	VN	admin	277539
Chengjiao	CN	minor	495744
Iwo	NG	minor	250443
Kumasi	GH	admin	2069350
Qionghu	CN	minor	667104
Irapuato	MX	minor	380941
Poznan	PL	admin	538633
M'Sila	DZ	admin	150000
Osnabruck	DE	minor	164748
Queretaro	MX	admin	804663
San Luis	AR	admin	169947
Nanchong	CN	minor	6183000
Valenzuela	PH	admin	620422
Jhang City	PK	minor	365198
Saidu Sharif	PK	minor	1860310
Merida	VE	admin	300000
Puducherry	IN	admin	227411
Bukhara	UZ	admin	272500
Lubumbashi	CD	admin	1786397
Dunhua	CN	minor	483811
Anda	CN	minor	520000
Warsaw	PL	primary	1790658
Bandar-e Mahshahr	IR	minor	162797
Borujerd	IR	minor	234997
Yunzhong	CN	minor	326849
Nara	JP	admin	353989
Lipetsk	RU	admin	510439
Trieste	IT	admin	204338
Golmud	CN	minor	215214
Maturin	VE	admin	542259
Kazan	RU	admin	1243500
Thiruvananthapuram	IN	admin	743691
Larisa	GR	admin	144651
Volgograd	RU	admin	1015586
Basseterre	KN	primary	13220
San Miguel de Tucuman	AR	admin	605767
Gusau	NG	admin	226857
Horad Barysaw	BY	minor	155389
Reggio di Calabria	IT	minor	182703
Ailan Mubage	CN	minor	526745
Ciudad Bolivar	VE	admin	567953
Valera	VE	minor	191167
Tokat	TR	admin	201294
Prato	IT	minor	191749
Thai Nguyen	VN	admin	330000
La Guaira	VE	admin	275000
Madrid	ES	primary	3266126
Mito	JP	admin	269661
Minna	NG	admin	304113
Bologna	IT	admin	388367
Raipur	IN	admin	1010087
Tyre	LB	minor	160000
Tabriz	IR	admin	1558693
Tuy Hoa	VN	admin	242840
Tunja	CO	admin	179263
Kobe	JP	admin	1522944
Homyel'	BY	admin	510300
Iskenderun	TR	minor	297943
Kaliningrad	RU	admin	475056
Saida	DZ	admin	142213
Canakkale	TR	admin	180823
Tan An	VN	admin	137498
Antwerp	BE	minor	529247
Strasbourg	FR	admin	465069
Mostaganem	DZ	admin	145696
Mandaluyong City	PH	admin	386276
Fukushima	JP	admin	286742
Kofu	JP	admin	188406
Kielce	PL	admin	191605
Paramaribo	SR	primary	223757
Salzburg	AT	admin	154076
Haarlem	NL	admin	349957
Korfez	TR	minor	165503
Tizi Ouzou	DZ	admin	144000
Kanggye	KP	admin	251971
Bari	IT	admin	325183
Mahilyow	BY	admin	357100
Sabzevar	IR	minor	243700
Kosice	SK	admin	238593
Al Kufah	IQ	minor	166100
Stavropol	RU	admin	433577
Kuching	MY	admin	325132
Porto Velho	BR	admin	306180
Tuxtla	MX	admin	598710
Leon	NI	admin	174051
Hsinchu	TW	admin	445635
Resistencia	AR	admin	291720
Huancayo	PE	admin	378203
Pemba	MZ	admin	141316
Calicut	IN	minor	431560
Hamah	SY	admin	312994
Mwanza	TZ	admin	385810
Marseille	FR	admin	870018
Yekaterinburg	RU	admin	1468833
Monclova	MX	minor	231107
Hat Yai	TH	minor	159130
Varna	BG	admin	369162
Bhopal	IN	admin	1883381
Chaozhou	CN	minor	2620000
Dengtalu	CN	minor	887000
Fuding	CN	minor	542000
Tehran	IR	primary	13633000
Denizli	TR	admin	963464
Osorno	CL	minor	147460
San Jose	CR	primary	288054
Charleroi	BE	minor	201816
Chuncheon	KR	admin	281596
Porto	PT	admin	237591
Ismailia	EG	admin	293184
Golcuk	TR	minor	162584
Damietta	EG	admin	206664
Kirkuk	IQ	admin	975000
Bahia Blanca	AR	minor	299101
Villa de Cura	VE	minor	145098
Puxi	CN	minor	809535
Muntinlupa City	PH	admin	504509
Zhytomyr	UA	admin	266936
Cagayan de Oro	PH	admin	675950
Barrancabermeja	CO	minor	191403
Tagum	PH	admin	259444
Krakow	PL	admin	766739
Tiaret	DZ	admin	178915
Linxia Chengguanzhen	CN	minor	274466
Jember	ID	minor	298585
Pasig City	PH	admin	755300
Sosnowiec	PL	minor	199974
Mazatlan	MX	minor	502547
Curitiba	BR	admin	1879355
Gaborone	BW	primary	231626
Barnaul	RU	admin	633301
Mati	PH	admin	141141
Chernivtsi	UA	admin	266550
Hiroshima	JP	admin	1306589
Coquimbo	CL	minor	204068
Vilnius	LT	primary	574147
Santa Teresa del Tuy	VE	minor	525321
Macapa	BR	admin	474706
Aarhus	DK	minor	237551
Taizhou	CN	minor	5968838
Eskisehir	TR	admin	871187
Samarkand	UZ	admin	504423
Cuauhtemoc	MX	minor	168482
Saqqez	IR	minor	165258
Tel Aviv-Yafo	IL	admin	451523
Acapulco de Juarez	MX	minor	687608
Korhogo	CI	admin	286071
Tarija	BO	admin	179528
Bogota	CO	primary	9464000
Wau	SS	admin	163442
Jiutepec	MX	minor	153704
Mashhad	IR	admin	3001184
Ormoc	PH	admin	215031
Sanaa	YE	primary	2957000
Hohhot	CN	admin	2635000
Aydin	TR	admin	191037
Likasi	CD	\N	422535
Masaya	NI	admin	139582
Astrakhan	RU	admin	532504
Kisangani	CD	admin	935977
Apapa	NG	minor	217362
Khowy	IR	minor	182000
Kocaeli	TR	admin	363416
Rajin	KP	admin	196954
Skikda	DZ	admin	163318
Changzhou	CN	minor	4592431
Capitol Hill	MP	primary	2500
Bani Suwayf	EG	admin	193048
Can Tho	VN	admin	1237300
Yola	NG	admin	392854
San Luis Potosi	MX	admin	824229
Sahiwal	PK	minor	247706
Baghdad	IQ	primary	5796000
Yangsan	KR	minor	297532
Kolkata	IN	admin	17560000
Najran	SA	admin	298288
Ile-Ife	NG	minor	501952
Sukkur	PK	minor	476776
Xushan	CN	minor	1502000
Petropavl	KZ	admin	216406
Munster	DE	minor	314319
Porto-Novo	BJ	primary	300000
Barishal	BD	admin	230000
Bhubaneshwar	IN	admin	837737
Denpasar	ID	admin	834881
Cluj-Napoca	RO	admin	324576
Meru	KE	admin	1833000
Mutare	ZW	admin	188243
Jijiga	ET	admin	159300
Trondheim	NO	minor	183378
Chernihiv	UA	admin	294522
An Nasiriyah	IQ	admin	541600
Bartin	TR	admin	155016
Andijon	UZ	admin	441700
Asuncion	PY	primary	1870000
Mirpur Khas	PK	minor	236961
Hai'an	CN	minor	866337
Mbuji-Mayi	CD	admin	1295000
Poza Rica de Hidalgo	MX	minor	200119
Yong'an	CN	minor	357000
Hpa-An	MM	admin	421525
Wuzhong	CN	minor	1284000
Groznyy	RU	admin	291687
Tula	RU	admin	485221
Duzce	TR	admin	240633
Puyang	CN	minor	3580000
Lianzhou	CN	minor	384700
Kuiju	CN	minor	581470
Luocheng	CN	minor	959006
Putian	CN	minor	2900000
Ch'ongjin	KP	minor	667929
Sevilla	ES	admin	1212045
Kidapawan	PH	admin	140195
Beidao	CN	minor	1225000
Weichanglu	CN	minor	859424
Arnhem	NL	admin	141674
Phan Thiet	VN	admin	205333
Dasoguz	TM	admin	227184
Bucaramanga	CO	admin	581130
Maoming	CN	minor	6706000
Ciudad Obregon	MX	minor	405000
Stockholm	SE	primary	972647
Santa Fe	AR	admin	405683
Bandar Seri Begawan	BN	primary	50000
Buon Ma Thuot	VN	admin	340000
Riyadh	SA	primary	6881000
Amsterdam	NL	primary	1031000
Taranto	IT	minor	198283
Yanjiang	CN	minor	4217000
Busan	KR	admin	3440484
Tarlac City	PH	admin	342493
Nur-Sultan	KZ	primary	1078362
Tultitlan de Mariano Escobedo	MX	minor	486998
Fes	MA	admin	1112072
Concepcion	CL	admin	217537
Osogbo	NG	admin	408245
Jeonju	KR	minor	653055
Bouake	CI	admin	659233
Monterrey	MX	admin	4295000
Foshan	CN	minor	7194311
Bordj Bou Arreridj	DZ	admin	168346
Barcelona	ES	admin	4588000
Oujda-Angad	MA	admin	494252
Pak Kret	TH	minor	184501
Kerman	IR	admin	573449
Jakarta	ID	primary	34540000
Arad	RO	admin	159074
Sonsonate	SV	admin	168947
Cuiaba	BR	admin	585367
Barquisimeto	VE	admin	1059092
Managua	NI	primary	1028808
Incheon	KR	admin	2913024
Florencia	CO	admin	143871
Acarigua	VE	minor	195637
Jingdezhen	CN	minor	1587477
Turkistan	KZ	admin	227098
Diyarbakir	TR	admin	1732396
Mombasa	KE	admin	1200000
Kursk	RU	admin	449063
Zemun	RS	minor	161596
Puerto La Cruz	VE	minor	306261
Bengkulu	ID	admin	360495
Esmeraldas	EC	admin	154035
Zaria	NG	minor	889000
Venice	IT	admin	261905
Lhasa	CN	admin	902500
Kashgar	CN	minor	506640
Majuro	MH	primary	25400
Bandung	ID	admin	2394873
Neuss	DE	minor	153796
Alanya	TR	minor	312319
Birjand	IR	admin	178020
Bialystok	PL	admin	297288
Sargodha	PK	minor	602631
Mymensingh	BD	admin	330126
Kathmandu	NP	primary	975453
Pyongyang	KP	primary	2863000
Damaturu	NG	admin	255895
Yutan	CN	minor	1368117
Baguio City	PH	admin	345366
Manado	ID	admin	461636
Tamale	GH	admin	466723
Monrovia	LR	primary	1021762
Barinas	VE	admin	873962
Aden	YE	admin	507355
Sancti Spiritus	CU	admin	138504
Erfurt	DE	admin	203254
Pohang	KR	minor	520305
Salamanca	ES	minor	144228
Godoy Cruz	AR	minor	191299
Shantou	CN	minor	5319028
Reykjavik	IS	primary	128793
Salalah	OM	admin	178469
Vitsyebsk	BY	admin	364800
Rangoon	MM	primary	5430000
Tetovo	MK	admin	142030
Manzanillo	MX	minor	184541
Naga City	PH	admin	196003
Gaizhou	CN	minor	691595
Gelsenkirchen	DE	minor	260654
Kenema	SL	admin	188463
Dubai	AE	admin	2502715
Malayer	IR	minor	170237
Goma	CD	admin	144124
Gomez Palacio	MX	minor	327985
Gujrat	PK	minor	328512
Bahawalpur	PK	minor	681696
Nyanza	RW	admin	225209
Irkutsk	RU	admin	623736
Kurgan	RU	admin	322042
Arica	CL	admin	202131
Shiyan	CN	minor	3228000
Hue	VN	admin	455230
Los Mochis	MX	minor	256613
Kastamonu	TR	admin	148931
Leverkusen	DE	minor	163838
Luanzhou	CN	minor	554315
Suncheon	KR	minor	265390
Belgorod	RU	admin	391135
Nantong	CN	minor	7282835
Bremen	DE	admin	724909
Brescia	IT	minor	197008
Qingping	CN	minor	797200
Ciudad del Este	PY	admin	304282
Freetown	SL	primary	951000
Bytom	PL	minor	171515
Puebla	MX	admin	1576259
Karachi	PK	admin	14835000
Dahuk	IQ	admin	330600
Amol	IR	minor	237528
Chandigarh	IN	admin	1026459
Montpellier	FR	minor	607896
Oeiras	PT	minor	172120
Ploiesti	RO	admin	209945
Zhenjiang	CN	minor	3113384
Sinuiju	KP	admin	359341
Aqtobe	KZ	admin	387807
Wuppertal	DE	minor	354382
Villavicencio	CO	admin	527668
Yogyakarta	ID	admin	422732
Oviedo	ES	admin	189434
Shahr-e Kord	IR	admin	159775
Parana	AR	admin	247863
Huangshi	CN	minor	2419000
El Fasher	SD	admin	252609
Qazvin	IR	admin	381598
Nha Trang	VN	admin	392279
Cali	CO	admin	2471474
La Plata	AR	admin	186527
Douala	CM	admin	2446945
Alexandria	EG	admin	4870000
Tianchang	CN	minor	602840
Ad Diwaniyah	IQ	admin	391600
Pleiku	VN	admin	142900
Ouagadougou	BF	primary	1626950
Antalya	TR	admin	2426356
La Vega	DO	admin	220279
Quilpue	CL	minor	147991
Havana	CU	primary	2141652
Maracay	VE	admin	407109
Morioka	JP	admin	292554
Port Sudan	SD	admin	489275
Yushan	CN	minor	1651200
Samarinda	ID	admin	753370
Reims	FR	minor	182460
Osh	KG	admin	251000
Plzen	CZ	admin	174842
Saratov	RU	admin	845300
Kuwait City	KW	primary	637411
Huangshan	CN	minor	1470000
Karaman	TR	admin	194018
Almeria	ES	minor	198533
La Paz	MX	admin	244219
Lille	FR	admin	232787
Fangting	CN	minor	412758
Davao	PH	admin	1632991
Ciudad General Escobedo	MX	minor	363436
Marikina City	PH	admin	450741
Gonaives	HT	admin	324043
Bacolod	PH	admin	561875
Mocamedes	AO	admin	162000
Novosibirsk	RU	admin	1602915
Rivne	UA	admin	245630
Mardan	PK	minor	300424
Vladikavkaz	RU	admin	306978
Xinyu	CN	minor	1186700
Calabar	NG	admin	461796
Mersin	TR	admin	1814468
Enugu	NG	admin	715774
Biratnagar	NP	admin	242548
Corrientes	AR	admin	352646
Daloa	CI	admin	255168
Tehuacan	MX	minor	274906
Oskemen	KZ	admin	316699
Zhangjiakou Shi Xuanhua Qu	CN	minor	409745
Qincheng	CN	minor	3400000
Idlib	SY	admin	165000
Gaoyou	CN	minor	811800
Pretoria	ZA	primary	741651
Wenlan	CN	minor	417156
Krasnoyarsk	RU	admin	1083865
Vladivostok	RU	admin	606589
Mary	TM	admin	208682
Akure	NG	admin	420594
Zhengzhou	CN	admin	7005000
Taguig City	PH	admin	804915
Tashkent	UZ	primary	2424100
Sari	IR	admin	347402
Az Zubayr	IQ	minor	370000
Makhachkala	RU	admin	592976
Moundou	TD	admin	142462
Hong'an	CN	minor	289999
Samara	RU	admin	1169719
Helsinki	FI	primary	642045
Kagoshima	JP	admin	595319
Ningbo	CN	minor	7639000
Jayapura	ID	admin	413283
Moscow	RU	primary	17125000
Poltava	UA	admin	317847
Bahir Dar	ET	admin	243300
Carupano	VE	minor	173877
Marrakech	MA	admin	928850
Bryansk	RU	admin	406553
Bucharest	RO	primary	1883425
Florianopolis	BR	admin	477798
Turku	FI	admin	187604
Sangli	IN	\N	436639
Ibague	CO	admin	541101
Posadas	AR	admin	275988
Yingkou	CN	minor	2220000
Livorno	IT	minor	159020
Casablanca	MA	admin	4370000
Ambato	EC	admin	165185
Jian'ou	CN	minor	456000
Abuja	NG	primary	1235880
Matanzas	CU	admin	145246
Neuquen	AR	admin	231198
Ufa	RU	admin	1115560
Wonsan	KP	admin	363127
San Pedro Sula	HN	admin	1073824
Matadi	CD	admin	306053
Afyonkarahisar	TR	admin	299673
Port Harcourt	NG	admin	1005904
Angers	FR	minor	152960
Quilmes	AR	minor	230810
Mianyang	CN	minor	4945000
Funtua	NG	minor	180475
Kassala	SD	admin	536009
El Oued	DZ	admin	177497
Tepic	MX	admin	332863
Ar Ramadi	IQ	admin	456853
Harbin	CN	admin	4458000
Srinagar	IN	admin	1180570
Dezhou	CN	minor	5470000
Nanjing	CN	admin	7496000
Qingyang	CN	minor	2111000
Libreville	GA	primary	797003
Kupang	ID	admin	433970
Luzhou	CN	minor	4291000
Qostanay	KZ	admin	217135
Yingchuan	CN	minor	1131896
Luzhang	CN	minor	184835
Khost	AF	admin	160214
Bern	CH	primary	133798
Awka	NG	admin	301657
Manaus	BR	admin	1802014
Gweru	ZW	admin	141260
Yerevan	AM	primary	1075800
Suihua	CN	minor	5420000
Zonguldak	TR	admin	156918
Suva	FJ	primary	88271
Seremban	MY	admin	419536
La Serena	CL	admin	221054
Olongapo	PH	admin	233040
Bochum	DE	minor	364628
Bhisho	ZA	admin	160997
Majene	ID	minor	272377
Mulhouse	FR	minor	285121
Ternopil	UA	admin	218653
Shenzhen	CN	minor	15929000
Kinshasa	CD	primary	13528000
Buenaventura	CO	minor	252805
Ba`qubah	IQ	admin	467900
Nuevo Laredo	MX	minor	373725
Jiaxing	CN	minor	4501657
Ziguinchor	SN	admin	205294
Luleburgaz	TR	minor	148037
Haikou	CN	admin	2046189
Okara	PK	minor	232386
Munich	DE	admin	1471508
Santa Clara	CU	admin	207963
Cape Coast	GH	admin	143015
Kampala	UG	primary	1659600
San Juan	PH	admin	122180
Zamboanga City	PH	admin	861799
Kananga	CD	admin	1971704
Samarra'	IQ	minor	140400
Xinshi	CN	minor	636776
New Mirpur	PK	minor	523500
San Nicolas de los Garza	MX	minor	476761
Fukui	JP	admin	262530
Hermosillo	MX	admin	812229
Leipzig	DE	minor	542529
Al Bayda'	LY	admin	250000
Nanchang	CN	admin	5042565
San Miguel	SV	admin	218410
Cordoba	MX	minor	218153
Mawlamyine	MM	admin	253734
Bellevue	US	\N	148164
Heroica Matamoros	MX	minor	520367
Wuxue	CN	minor	644247
Serang	ID	admin	613356
Baicheng	CN	minor	3466758
Gimpo	KR	minor	352683
The Hague	NL	primary	1406000
Kemerovo	RU	admin	556920
Auckland	NZ	admin	1467800
Samsun	TR	admin	1335716
Soc Trang	VN	admin	300000
El Obeid	SD	admin	418280
Albacete	ES	minor	173329
Ulyanovsk	RU	admin	624518
Qom	IR	admin	1201158
Manzanillo	CU	minor	150999
Eldoret	KE	admin	193830
Manila	PH	primary	23088000
Roxas City	PH	admin	167003
Aleppo	SY	admin	1834093
Lucknow	IN	admin	3382000
Dezful	IR	minor	264709
Murcia	ES	admin	406807
Warri	NG	minor	830106
Yatou	CN	minor	670251
Kremenchuk	UA	minor	234073
Nantou	TW	admin	165000
Belmopan	BZ	primary	17222
Erzincan	TR	admin	157452
Conakry	GN	primary	1667864
Boise	US	admin	389280
Karlsruhe	DE	minor	313092
Vologda	RU	admin	313012
Nimes	FR	minor	151001
Tsu	JP	admin	275371
Meihekou	CN	minor	618251
Riga	LV	primary	698529
Dakar	SN	primary	1146053
Victoria	SC	primary	26450
Beijing	CN	primary	19433000
Gunungsitoli	ID	minor	137104
Callao	PE	admin	1129854
Lapu-Lapu City	PH	admin	408112
Boaco	NI	admin	317000
Addis Ababa	ET	primary	3041002
Shahr-e Qods	IR	minor	309605
Gombe	NG	admin	270366
Ipoh	MY	admin	866772
Abha	SA	admin	236157
Kassel	DE	minor	201585
Shizuoka	JP	admin	691185
Copenhagen	DK	primary	1085000
Cienfuegos	CU	admin	164924
Athens	GR	primary	664046
Beichengqu	CN	minor	245608
Kutahya	TR	admin	266784
Lashkar Gah	AF	admin	201546
Bled	SI	admin	4929
Mondim de Basto	PT	minor	7493
Kadirli	TR	minor	124053
Nioro	ML	minor	14421
Miltenberg	DE	minor	9355
Lauterbach	DE	minor	13664
Olomouc	CZ	admin	100663
Lianhe	CN	minor	121367
Csorna	HU	minor	10228
Ciudad Choluteca	HN	admin	120000
Sokal'	UA	minor	20986
Ciudad Guzman	MX	minor	97
Artvin	TR	admin	35081
Bonab	IR	minor	75332
Dingli	MT	admin	0
Mityana	UG	admin	41131
Umarkot	PK	minor	35059
Mariehamn	FI	admin	11461
Estremoz	PT	minor	14318
Turnisce	SI	admin	0
Udine	IT	minor	99341
Tarnow	PL	minor	110956
Arnstadt	DE	minor	27304
Ghardaia	DZ	admin	125480
Makokou	GA	admin	17070
Cerknica	SI	admin	0
Dunleary	IE	admin	23857
Tomohon	ID	minor	96411
Xylokastro	GR	minor	5500
Moron	MN	admin	36082
Coronel Oviedo	PY	admin	88101
Sefwi Wiawso	GH	admin	0
Arlit	NE	minor	100000
Tenosique	MX	minor	31392
Beylaqan	AZ	admin	12263
Calvillo	MX	minor	19742
Samraong	KH	admin	0
Mpigi	UG	admin	11082
Khur	IR	minor	6216
Oum el Bouaghi	DZ	admin	100821
Cergy	FR	minor	65177
Izucar de Matamoros	MX	minor	41042
Mojkovac	ME	admin	10066
Tarnowskie Gory	PL	minor	60879
Tuapse	RU	minor	62269
Kozloduy	BG	minor	12400
Espinho	PT	minor	31786
Baghlan	AF	minor	39228
Schwabisch Hall	DE	minor	40440
Bosilegrad	RS	admin	0
Moron	AR	minor	99066
Cerrillos	AR	minor	11498
Istaravshan	TJ	minor	57400
Siaya	KE	admin	0
Johvi	EE	admin	10541
Jolo	PH	admin	0
Kaya	BF	admin	40017
Trgoviste	RS	admin	0
Mitoma	UG	admin	0
Sihanoukville	KH	admin	0
Madruga	CU	minor	30640
Ngozi	BI	admin	39884
Finderne	US	\N	5976
Bulambuli	UG	admin	0
Retalhuleu	GT	admin	40000
Cienaga	CO	minor	131171
Ajdovscina	SI	admin	6596
Dar Naim	MR	admin	0
Portimao	PT	minor	55614
Trikala	GR	minor	61653
Rivera	UY	admin	78900
Apaseo el Alto	MX	minor	64443
Perpignan	FR	minor	120158
Villach	AT	minor	61879
Kole	UG	admin	0
Khanabad	AF	minor	26803
Techiman	GH	admin	0
Nyiradony	HU	minor	7677
Gibara	CU	minor	71126
Buda-Kashalyova	BY	minor	8800
Pieksamaki	FI	minor	18220
Bad Kreuznach	DE	minor	50948
`Amran	YE	admin	90792
Biberach	DE	minor	32938
Dedza	MW	admin	15608
Esquel	AR	minor	36687
Salinas Victoria	MX	minor	27848
Medveda	RS	admin	0
Totness	SR	admin	1685
Mahdia	TN	admin	45977
Laval	FR	minor	49492
Cadereyta	MX	minor	13347
Apatin	RS	admin	0
Kandi	BJ	admin	109701
Vladimirci	RS	admin	0
Cosala	MX	minor	6577
Kozlu	TR	minor	48381
Sonbong	KP	minor	60864
Povoa de Varzim	PT	minor	63408
Stara Pazova	RS	admin	0
Elassona	GR	minor	7338
Tunceli	TR	admin	38504
Bangued	PH	admin	0
Champoton	MX	minor	30881
Naukseni	LV	admin	0
Chiradzulu	MW	admin	1580
Dikili	TR	minor	44172
Livno	BA	minor	9045
San Rafael	AR	minor	107997
Amfissa	GR	minor	6919
Diepholz	DE	minor	16882
Myadzyel	BY	minor	7100
Szigetszentmiklos	HU	minor	38591
Luba	GQ	admin	7739
Varena	LT	admin	8477
`Ayn `Isa	SY	minor	6730
Tarim	YE	minor	105552
Baidoa	SO	admin	129839
Aveiro	PT	admin	78450
Inirida	CO	admin	9065
Massawa	ER	admin	39758
Ozurgeti	GE	admin	0
Pula	HR	minor	57053
Kirundo	BI	admin	10024
Karakol	KG	admin	63377
Trstenik	RS	admin	17180
Quinhamel	GW	admin	42659
Mali	GN	minor	5479
San Cristobal Verapaz	GT	minor	54704
Rambouillet	FR	minor	26736
Tataouine	TN	admin	62577
Lebedyn	UA	minor	14301
Kaberamaido	UG	admin	3400
Bayat	TR	minor	16525
Villa Mercedes	AR	minor	111391
Phayao	TH	admin	17467
Sensuntepeque	SV	admin	26989
Daru	PG	admin	12879
Ar Rustaq	OM	admin	0
San Antonino Castillo Velasco	MX	minor	6009
Vejle	DK	admin	51177
Ibanda	UG	admin	0
Matam	SN	admin	0
Puerto Lempira	HN	admin	4856
Kronach	DE	minor	16874
Azare	NG	minor	105687
Ahar	IR	minor	100641
Inowroclaw	PL	minor	76086
Bregenz	AT	admin	28697
Kannus	FI	minor	5520
Temascaltepec de Gonzalez	MX	minor	30336
San Francisco	SV	admin	16152
Bitburg	DE	minor	14904
Ulbroka	LV	admin	0
Nitra	SK	admin	77374
Kuchinarai	TH	minor	11753
Naantali	FI	minor	18916
Ruyigi	BI	admin	7139
Santa Lucija	MT	admin	0
Errachidia	MA	admin	92374
Korneuburg	AT	minor	12986
Bu'aale	SO	admin	1490
Kalynivka	UA	minor	18906
Jaunpiebalga	LV	admin	0
San Jose del Cabo	MX	minor	93069
Einsiedeln	CH	minor	15550
Black River	JM	admin	4261
Ourem	PT	minor	45932
Kalangala	UG	admin	5200
Lecherias	VE	minor	37829
Ansbach	DE	minor	41847
Salamina	GR	minor	25370
San Pedro La Laguna	GT	minor	10150
Zelezniki	SI	admin	0
Suong	KH	admin	0
Apostolove	UA	minor	13792
Morahalom	HU	minor	6145
Gashua	NG	minor	125817
Banlung	KH	admin	0
Gurjaani	GE	minor	9467
Gutersloh	DE	minor	100194
Patnos	TR	minor	122833
Compiegne	FR	minor	40199
Kuaidamao	CN	minor	27227
Cidade Velha	CV	admin	2148
Labinsk	RU	minor	60164
Punta Arenas	CL	admin	123403
Kalanchak	UA	minor	9224
Sarpang	BT	admin	0
Drvar	BA	minor	7506
Gbarnga	LR	admin	45835
Bupoto	UG	admin	0
Lang Suan	TH	minor	11250
Dongola	SD	admin	26404
Terras de Bouro	PT	minor	7253
Lendava	SI	admin	2919
Ojinaga	MX	minor	28040
Ebersberg	DE	minor	12239
Amatitan	MX	minor	15344
Grimstad	NO	minor	13304
Bergamo	IT	minor	119806
Mikolow	PL	minor	42053
Jablanica	BA	minor	10580
Puerto Armuelles	PA	minor	19763
Juchitepec	MX	minor	23497
Zhashkiv	UA	minor	13853
Bangolo	CI	admin	0
Montemor-o-Novo	PT	minor	17437
Nola	CF	admin	26809
Camargo	MX	minor	40221
Ash Shaykh `Uthman	YE	minor	105248
Berezivka	UA	minor	9845
Tongyangdao	CN	minor	27476
Phichit	TH	admin	22299
Heroica Ciudad de Tlaxiaco	MX	minor	21391
Esposende	PT	minor	34254
Alcochete	PT	minor	17569
Malo Crnice	RS	admin	0
Novohrad-Volynskyi	UA	minor	56288
Mahdia	GY	admin	0
Yarim	YE	minor	34805
Nazarabad	IR	minor	119512
Ivanic-Grad	HR	minor	14723
Al Malikiyah	SY	minor	39000
Ar Rastan	SY	minor	61176
Krsko	SI	admin	0
Uriangato	MX	minor	59305
Piatra Neamt	RO	admin	85055
Kemijarvi	FI	minor	7766
Mansehra	PK	minor	69085
Perito Moreno	AR	minor	4617
Aibak	AF	admin	4938
Panaji	IN	admin	40017
Pehcevo	MK	admin	3237
Alebtong	UG	admin	0
Rincon de Romos	MX	minor	27988
Osecina	RS	admin	0
Argos Orestiko	GR	minor	7473
Weiz	AT	minor	11431
Magas	RU	admin	10333
Seye	MX	minor	8369
Ljutomer	SI	admin	0
Donauworth	DE	minor	20080
Kasanda	UG	admin	0
Bartica	GY	admin	8532
Salto del Guaira	PY	admin	37600
Raahe	FI	minor	25165
Atoyac de Alvarez	MX	minor	20515
Greymouth	NZ	admin	8160
Ingelheim	DE	minor	35146
Jiroft	IR	minor	130429
Tariba	VE	minor	128590
Zalaszentgrot	HU	minor	6263
Tutrakan	BG	minor	10370
Sodrazica	SI	admin	0
Saucillo	MX	minor	11004
San Martin de los Andes	AR	minor	27956
Acquaviva	SM	admin	0
San Carlos del Zulia	VE	minor	80000
Gabu	GW	admin	14430
Kratovo	MK	admin	6924
Tepalcatepec	MX	minor	42879
Ban Na San	TH	minor	19801
Golega	PT	minor	5465
Bariadi	TZ	admin	0
Palma Soriano	CU	minor	76500
Elk	PL	minor	60621
Cibitoke	BI	admin	0
Ferkessedougou	CI	minor	62008
Timbuktu	ML	admin	35330
Hyvinkaa	FI	minor	46463
Pul-e Khumri	AF	admin	113500
Maxcanu	MX	minor	12621
Pavlohrad	UA	minor	106082
Nebbi	UG	admin	30354
Plon	DE	minor	8914
Barreiro	PT	minor	78764
Almoloya del Rio	MX	minor	8939
El Calafate	AR	minor	21132
Shkoder	AL	admin	112276
Saint-Germain-en-Laye	FR	minor	44753
Brcko	BA	admin	0
Mae Hong Son	TH	admin	6526
Dax	FR	minor	20681
Bondoukou	CI	admin	58297
Nopaltepec	MX	minor	8182
Al Hajar al Aswad	SY	minor	101827
Prievidza	SK	minor	48134
Santa Maria Huatulco	MX	minor	7409
Oswiecim	PL	minor	39057
Mukdahan	TH	admin	33102
Doba	TD	admin	29597
Kwidzyn	PL	minor	40008
Armamar	PT	minor	6297
Seinajoki	FI	admin	61530
Ennis	IE	admin	0
Argenteuil	FR	minor	110210
Kastoria	GR	minor	13387
Jurmala	LV	admin	48606
Brokopondo	SR	admin	8340
Junin	AR	minor	85007
Keszthely	HU	minor	19387
Lokhvytsya	UA	minor	11485
Lumphat	KH	minor	19205
Drabesi	LV	admin	0
Irig	RS	admin	4848
Dzhankoy	UA	minor	38714
Sentrupert	SI	admin	0
Cayirova	TR	minor	129655
Tulcea	RO	admin	73707
Tucacas	VE	minor	13901
Nouna	BF	minor	29048
Luena	AO	admin	21115
Imgarr	MT	admin	0
Mislinja	SI	admin	0
Serta	PT	minor	15880
Agago	UG	admin	0
Hung Yen	VN	admin	0
Ali Sabieh	DJ	admin	37939
Koudougou	BF	admin	87347
Cuautitlan	MX	minor	110385
Sangar	RU	\N	4633
Iganga	UG	admin	45024
Salzgitter	DE	minor	104948
San Francisco de los Romo	MX	minor	46454
Mwatate	KE	admin	0
Krasnodon	UA	minor	43683
Lao Cai	VN	admin	67206
Saulkrasti	LV	admin	2813
Sredisce ob Dravi	SI	admin	0
Preili	LV	admin	6522
Andimeshk	IR	minor	135116
Sassari	IT	minor	116641
Paso de Ovejas	MX	minor	33392
Pokrovsk	UA	minor	63437
Kardla	EE	admin	3230
Jazan	SA	admin	127743
Rasdhoo	MV	admin	0
Mstsislaw	BY	minor	10200
Bolgatanga	GH	admin	66685
Vojnik	SI	admin	0
Robat Karim	IR	minor	105393
Lucani	RS	admin	0
Dobrovnik	SI	admin	0
Offenburg	DE	minor	59646
Viljandi	EE	admin	17407
Tire	TR	minor	84457
Albi	FR	minor	48970
Knezha	BG	minor	11124
Khenchela	DZ	admin	108580
Lucenec	SK	minor	27991
Cakovec	HR	admin	30455
Akyaka	TR	minor	10985
Diourbel	SN	admin	100445
Studenicani	MK	admin	0
Viedma	AR	admin	59122
Tomar	PT	minor	40677
Cananea	MX	minor	31560
Mae Sot	TH	minor	31530
Basse-Terre	GP	admin	0
Masalli	AZ	admin	14746
Fulda	DE	minor	68586
Al Mahwit	YE	admin	10593
Sombrerete	MX	minor	58201
Hlohovec	SK	minor	21715
Valky	UA	minor	9235
Cirkulane	SI	admin	0
Mugla	TR	admin	56619
San Ignacio	BZ	admin	16977
Kantharalak	TH	minor	19392
Grudziadz	PL	minor	95964
Bugiri	UG	admin	0
Smolyan	BG	admin	31548
Calheta de Sao Miguel	CV	admin	4123
Etampes	FR	minor	25092
Pinal de Amoles	MX	minor	25325
Kerava	FI	minor	35293
Marsabit	KE	admin	17127
Banska Bystrica	SK	admin	78327
Satu Mare	RO	admin	102411
Benedikt	SI	admin	0
Pajacuaran	MX	minor	10014
Keuruu	FI	minor	10117
Nida	LT	admin	2385
Wiltz	LU	admin	0
Gannan	CN	minor	59239
Phuket	TH	admin	77610
Horodyshche	UA	minor	13799
Gelnica	SK	minor	6099
Castres	FR	minor	41636
Ho	GH	admin	83715
Nagykallo	HU	minor	9214
Marmaris	TR	minor	94247
Senglea	MT	admin	0
Pesnica	SI	admin	0
Malaryta	BY	minor	12800
Alabel	PH	admin	0
Couva	TT	admin	48858
Lahat	ID	minor	65906
Buba	GW	admin	0
Mocoa	CO	admin	22035
Pereyaslav-Khmel'nyts'kyy	UA	minor	27088
Tepechitlan	MX	minor	8972
Quibor	VE	minor	110536
Villa del Carbon	MX	minor	39587
Gulkevichi	RU	minor	34215
Hamar	NO	admin	27947
Koh Kong	KH	admin	33134
Mateszalka	HU	minor	16576
Zuwarah	LY	admin	80310
Trincomalee	LK	admin	99135
Zapala	AR	minor	32097
Guachochi	MX	minor	14513
Balakliia	UA	minor	28868
Koupela	BF	minor	32052
San Luis de la Paz	MX	minor	101370
Ciudad Tula	MX	minor	10043
Salo	FI	minor	53890
Serravalle	SM	admin	0
Interlaken	CH	minor	5592
Ciudad Serdan	MX	minor	23824
Samut Prakan	TH	admin	51309
Kitui	KE	admin	13244
Dalaba	GN	minor	6349
Trnava	SK	admin	65382
Lacin	AZ	admin	0
Panevezys	LT	admin	91054
Muhldorf	DE	minor	20323
Mantes-la-Jolie	FR	minor	44299
Vila do Conde	PT	minor	79533
Chon Buri	TH	admin	29961
Salcininkai	LT	admin	6664
Duitama	CO	minor	101156
Kudahuvadhoo	MV	admin	0
Celle	DE	minor	69602
Las Lajas	AR	minor	1218
Manafwa	UG	admin	0
Velika Kladusa	BA	minor	6902
Gavarr	AM	admin	8751
Calpulalpan	MX	minor	33263
Loango	CG	admin	0
Bourg-en-Bresse	FR	minor	41527
Lorient	FR	minor	57149
Zwolle	NL	admin	111805
Akcakale	TR	minor	113194
Barentu	ER	admin	0
Ubarana	BR	\N	5910
Funadhoo	MV	admin	0
Weno	FM	admin	0
Svilajnac	RS	admin	0
Lucea	JM	admin	6002
San Ramon de la Nueva Oran	AR	minor	74059
Jalpan	MX	minor	22025
Crna Trava	RS	admin	0
Lelystad	NL	admin	0
Coka	RS	admin	4707
Klyetsk	BY	minor	11400
Pakruojis	LT	admin	4640
Santiago Papasquiaro	MX	minor	26121
Floriana	MT	admin	0
Skofja Loka	SI	admin	0
Kampong Cham	KH	admin	118242
Mirna Pec	SI	admin	0
San Juan de Sabinas	MX	minor	63522
Falavarjan	IR	minor	37740
Luebo	CD	admin	35183
Curico	CL	minor	125275
Mionica	RS	admin	0
Lozovo	MK	admin	0
Wolsztyn	PL	minor	13477
Kanchanaburi	TH	admin	29581
Ad Dis ash Sharqiyah	YE	minor	16614
Rorvik	NO	minor	2615
Verkhn'odniprovs'k	UA	minor	10314
Luwuk	ID	minor	47778
Kukes	AL	admin	16719
Rezvanshahr	IR	minor	12355
Lom	BG	minor	25172
Vrhnika	SI	admin	0
Millau	FR	minor	22109
Qusar	AZ	admin	14230
Sliven	BG	admin	107570
Brandenburg	DE	minor	72124
Huatabampo	MX	minor	30426
Angola	US	\N	11352
Phitsanulok	TH	admin	70871
Oliveira do Bairro	PT	minor	23028
Photharam	TH	minor	9575
Gunzburg	DE	minor	20707
Ferreira do Zezere	PT	minor	8619
Kauhajoki	FI	minor	13875
Thulusdhoo	MV	admin	0
Heinsberg	DE	minor	41946
Yoro	HN	admin	64425
Saint-Laurent-du-Maroni	GF	minor	24287
Nuevo Casas Grandes	MX	minor	55553
Mandeville	JM	admin	48317
San Joaquin	MX	minor	8865
Tayoltita	MX	minor	5124
Kam'yanka-Dniprovs'ka	UA	minor	12638
Phon	TH	minor	11593
Santa Cruz Atizapan	MX	minor	8909
Loja	LV	admin	0
Mianwali	PK	minor	95007
Ludza	LV	admin	8071
Ramla	IL	admin	75500
Ntcheu	MW	admin	10445
Olavarria	AR	minor	86320
Polva	EE	admin	5324
Ouesso	CG	admin	28320
Machinga	MW	admin	1418
Daman	IN	admin	39737
Divaca	SI	admin	0
Villanueva	MX	minor	32835
Oroshaza	HU	minor	27492
Montegiardino	SM	admin	0
Buka	PG	admin	0
Manadhoo	MV	admin	0
Ocnita	MD	admin	7254
Kaharlyk	UA	minor	13544
Janoshalma	HU	minor	8336
Tromso	NO	admin	38980
Azul	AR	minor	55728
Khmil'nyk	UA	minor	27941
Dimitrovgrad	RS	admin	0
Guira de Melena	CU	minor	37838
Telenesti	MD	admin	7227
Liezen	AT	minor	8191
Xai	LA	admin	0
Limburg	DE	minor	35243
Bismarck	US	admin	98345
Grayvoron	RU	minor	6449
Bria	CF	admin	35204
Bekes	HU	minor	18322
Carnikava	LV	admin	0
Cardenas	MX	minor	79875
Homa Bay	KE	admin	32174
Moletai	LT	admin	5587
Lethem	GY	admin	3000
Odranci	SI	admin	0
Longford	IE	admin	0
Pieta	MT	admin	0
Amlash	IR	minor	15047
Al Karak	JO	admin	21678
Muyinga	BI	admin	9609
Somero	FI	minor	9093
Bayburt	TR	admin	66633
Sarbogard	HU	minor	11937
Roanne	FR	minor	34366
Saint-Malo	FR	minor	46097
Montemorelos	MX	minor	60829
Naval	PH	admin	0
Ovacik	TR	minor	6998
Gorno-Altaysk	RU	admin	63214
Tougan	BF	minor	17590
Svay Rieng	KH	admin	23956
Jakobstad	FI	minor	19436
Jesus Maria	MX	minor	43012
Songkhla	TH	admin	63834
Behbahan	IR	minor	122604
Ziri	SI	admin	0
Tambacounda	SN	admin	78800
Annapolis	US	admin	39223
Uzhhorod	UA	admin	114897
Koulikoro	ML	admin	23919
Martonvasar	HU	minor	5672
Palenga	UG	admin	0
Macas	EC	admin	18984
Bahia Honda	CU	minor	43483
Vigan	PH	admin	53879
Baucau	TL	admin	14961
Bolhrad	UA	minor	17400
Pohrebyshche	UA	minor	9525
Touba	CI	minor	31844
Elbasan	AL	admin	78703
Plav	ME	admin	13805
Yala	TH	admin	61250
Kinna	SE	minor	15373
Tal'ne	UA	minor	13558
Jaen	ES	minor	112999
Sangerhausen	DE	minor	26297
Maun	BW	admin	49945
Garissa	KE	admin	65881
Wajir	KE	admin	45771
Salyan	AZ	admin	30396
Qitai	CN	minor	18831
Volodymyr-Volyns'kyy	UA	minor	38901
Coburg	DE	minor	61054
Kashmar	IR	minor	102282
Solola	GT	admin	45373
La Rochelle	FR	minor	75735
Etchojoa	MX	minor	56129
Cadca	SK	minor	24315
Backa Palanka	RS	admin	29449
Oroquieta	PH	admin	70757
Cadaval	PT	minor	14525
Qadsayya	SY	minor	33571
Villa Donato Guerra	MX	minor	29621
Lagkadas	GR	minor	7764
Miedzyrzecz	PL	minor	18459
Nyamira	KE	admin	0
La Barca	MX	minor	35345
Xico	MX	minor	38198
Magdalena de Kino	MX	minor	23359
Takeo	KH	admin	52000
Belcista	MK	admin	0
Megara	GR	minor	23456
Puspokladany	HU	minor	14154
Mucuchies	VE	minor	5900
Utena	LT	admin	26491
Nakhon Nayok	TH	admin	16195
Videm pri Ptuju	SI	admin	0
Rawah	IQ	minor	19629
Dunkerque	FR	minor	87353
Poti	GE	minor	47149
Spittal an der Drau	AT	minor	15413
Safotu	WS	admin	0
As Salt	JO	admin	88900
Novo Mesto	SI	admin	23341
Huittinen	FI	minor	10473
Halacho	MX	minor	9412
Loreto	MX	minor	43411
Penamacor	PT	minor	5682
Bubanza	BI	admin	20031
Xalatlaco	MX	minor	26865
Kiruhura	UG	admin	0
Pita	GN	minor	20052
Urgut Shahri	UZ	minor	99675
Ub	RS	admin	0
Mercedes	UY	admin	41974
Karditsa	GR	minor	38554
Akjoujt	MR	admin	370
Kirchheimbolanden	DE	minor	7802
Sao Joao da Madeira	PT	minor	21713
Celldomolk	HU	minor	10646
Dunakeszi	HU	minor	43490
Asosa	ET	admin	20226
Paphos	CY	admin	35961
Mae Sai	TH	minor	20699
Rostusa	MK	admin	0
San Fernando	MX	minor	29171
Shushtar	IR	minor	101878
Daga	BT	admin	0
Pernik	BG	admin	83973
Vac	HU	minor	32828
Kasaali	UG	admin	0
Nilandhoo	MV	admin	0
Otuke	UG	admin	0
Szczytno	PL	minor	23500
Koforidua	GH	admin	127334
Nokia	FI	minor	33322
Kemer	TR	minor	43226
Nakhon Ratchasima	TH	admin	134440
Santa Ana Nextlalpan	MX	minor	22507
Tenabo	MX	minor	7543
Siatista	GR	minor	5490
Alexandria	RO	admin	45434
Chascomus	AR	minor	21054
Prilep	MK	admin	66817
Monte Escobedo	MX	minor	8929
Vuzenica	SI	admin	0
Qo`ng`irot Shahri	UZ	minor	70100
Ropazi	LV	admin	0
Mahmud-e Raqi	AF	admin	7407
Macerata	IT	minor	42209
Lomza	PL	minor	62700
Pakxan	LA	admin	0
Ntara	UG	admin	0
Primorsko-Akhtarsk	RU	minor	32180
Detmold	DE	minor	74388
Montijo	PT	minor	51222
Dhihdhoo	MV	admin	0
Regen	DE	minor	11001
Kosiv	UA	minor	8522
Meoqui	MX	minor	22574
Boac	PH	admin	0
Pacora	PA	minor	52494
Tozeur	TN	admin	39504
Joaquin V. Gonzalez	AR	minor	13376
Rucava	LV	admin	0
Sabinov	SK	minor	12700
Haradok	BY	minor	11800
Saint Paul's Bay	MT	admin	0
Zvenyhorodka	UA	minor	17078
Capellen	LU	admin	0
Kangar	MY	admin	48898
Lokoja	NG	admin	60579
Norak	TJ	minor	18950
Mokronog	SI	admin	0
Jimenez	MX	minor	34281
Erding	DE	minor	36469
Palo Alto	MX	minor	5399
Liuhe	CN	minor	68938
Sam Phran	TH	minor	17611
Zarand	IR	minor	63744
Alytus	LT	admin	51534
Naxxar	MT	admin	0
Primero de Enero	CU	minor	29117
Ilirska Bistrica	SI	admin	0
Ptuj	SI	admin	23957
Kas	TR	minor	58600
Chapala	MX	minor	21596
Sodankyla	FI	minor	8942
Poljcane	SI	admin	0
Haskovo	BG	admin	93821
Mali Zvornik	RS	admin	0
Kizilyurt	RU	minor	37171
Astara	AZ	admin	16800
Osterode	DE	minor	21731
Sint-Niklaas	BE	minor	76756
Alcacer do Sal	PT	minor	13046
Port Antonio	JM	admin	14400
Viqueque	TL	admin	6078
Luwero	UG	admin	0
Medvode	SI	admin	0
Montauban	FR	minor	60810
At Tall	SY	minor	63554
Placetas	CU	minor	71208
Oranjestad	NL	admin	0
Siliana	TN	admin	26960
Apsheronsk	RU	minor	39762
Seferhisar	TR	minor	44526
Rottweil	DE	minor	25274
Butaleja	UG	admin	0
Dalandzadgad	MN	admin	0
Rendsburg	DE	minor	28470
Perleberg	DE	minor	12141
Lebork	PL	minor	35374
Joensuu	FI	admin	75514
Alencon	FR	minor	25848
Tralee	IE	admin	26384
Niort	FR	minor	58707
Mendoza	AR	admin	114822
Warin Chamrap	TH	minor	28154
Song Phi Nong	TH	minor	12926
Besancon	FR	minor	115934
Korostyshiv	UA	minor	25445
Eger	HU	admin	52898
Aileu	TL	admin	0
Glyfada	GR	minor	87305
Novomoskovs'k	UA	minor	70749
Jobabo	CU	minor	47350
Kwale	KE	admin	0
Melena del Sur	CU	minor	20646
Koboko	UG	admin	0
Lecce	IT	minor	94892
San Juan Bautista	PY	admin	7882
Yeghegnadzor	AM	admin	8200
Vila Nova de Foz Coa	PT	minor	7312
Kourou	GF	minor	24029
Ban Dung	TH	minor	15913
Semikarakorsk	RU	minor	22030
Kilkenny	IE	admin	22179
Minden	DE	minor	81682
Qax	AZ	admin	11415
Xai-Xai	MZ	admin	116343
Bad Neustadt	DE	minor	15411
Lajas	CU	minor	22602
Puente Nacional	MX	minor	22454
Sarpsborg	NO	minor	54678
Mzimba	MW	admin	19308
Zaghouan	TN	admin	16911
Kavala	GR	minor	54027
Tiszaujvaros	HU	minor	15371
Lagawe	PH	admin	0
Coatepec Harinas	MX	minor	31860
Roja	LV	admin	0
Aanekoski	FI	minor	19919
Arawa	PG	\N	40266
Bad Hersfeld	DE	minor	29800
Rio Gallegos	AR	admin	95796
Byalynichy	BY	minor	10000
Skrunda	LV	admin	1970
Eceabat	TR	minor	8912
Ishqoshim	TJ	minor	6567
Radlje ob Dravi	SI	admin	0
Diekirch	LU	admin	6242
Mafeteng	LS	admin	57059
Koktokay	CN	minor	80000
Bijeljina	BA	minor	114663
Hlybokaye	BY	minor	17800
Ma`an	JO	admin	50350
Orikhiv	UA	minor	14479
Linares	CL	minor	73602
Doboj	BA	minor	68514
Aloja	LV	admin	1120
Ponta Delgada	PT	admin	68809
Boende	CD	admin	32091
Arandelovac	RS	admin	0
Dabola	GN	minor	38617
Svishtov	BG	minor	24459
Mandera	KE	admin	30433
Hrastnik	SI	admin	4995
Farafangana	MG	minor	24764
Nova Vas	SI	admin	0
Xichu	MX	minor	11323
City of Isabela	PH	admin	112788
Tuttlingen	DE	minor	35730
Sabaneta	VE	minor	27850
Tyrnavos	GR	minor	11069
Mulifanua	WS	admin	0
Sonthofen	DE	minor	21541
Samana	DO	minor	11432
Dalanzadgad	MN	minor	19396
Ko Samui	TH	minor	67265
Koundara	GN	minor	13990
Tivat	ME	admin	0
Kalush	UA	minor	66406
Chavusy	BY	minor	10300
Koani	TZ	admin	0
Povazska Bystrica	SK	minor	39837
Tlacotalpan	MX	minor	8853
Puerto Narino	CO	minor	6816
Nabunturan	PH	admin	0
Freising	DE	minor	48634
Ecatzingo	MX	minor	9369
Biu	NG	minor	95005
Cunduacan	MX	minor	81392
Mezokovacshaza	HU	minor	5787
Strenci	LV	admin	1107
Ostroh	UA	minor	15642
Kretinga	LT	admin	17787
Kinik	TR	minor	29803
Quba	AZ	admin	20791
Nasice	HR	minor	7888
Cesme	TR	minor	43489
Polatsk	BY	minor	81000
Bukwo	UG	admin	0
Miercurea-Ciuc	RO	admin	38966
Beryslav	UA	minor	12417
Manga	BF	admin	15173
Pierre	US	admin	14659
Cerritos	MX	minor	14804
La Quiaca	AR	minor	13761
Ceylanpinar	TR	minor	87684
Beziers	FR	minor	77177
Dowa	MW	admin	0
Greenville	LR	admin	10374
Compostela	MX	minor	37478
Koknese	LV	admin	2818
Maumere	ID	minor	104285
El Tocuyo	VE	minor	41327
Kamnik	SI	admin	0
Vasyl'kiv	UA	minor	37696
Sevnica	SI	admin	0
Qaqortoq	GL	admin	3093
Encs	HU	minor	6254
Chepes	AR	minor	6020
Pala	TD	admin	0
Amberg	DE	minor	41970
Chaguanas	TT	admin	83489
Tuyen Quang	VN	admin	36430
Linkou	CN	minor	77754
Qazax	AZ	admin	28000
Tarbes	FR	minor	41518
Konibodom	TJ	minor	50400
Savannakhet	LA	admin	124000
Krychaw	BY	minor	24500
Boleslawiec	PL	minor	39412
Sarcelles	FR	minor	58587
Kedougou	SN	admin	18226
San Giljan	MT	admin	0
Bozoum	CF	admin	20665
San Antonio del Tachira	VE	minor	61630
Penon Blanco	MX	minor	5271
Miklavz na Dravskem Polju	SI	admin	0
Phra Phutthabat	TH	minor	34322
Uzunkopru	TR	minor	61485
Humahuaca	AR	minor	11369
Dean Funes	AR	minor	21518
Hjo	SE	minor	6351
Francistown	BW	admin	89979
Ayapango	MX	minor	8864
Asaba	NG	admin	0
Zurrieq	MT	admin	0
Ain Temouchent	DZ	admin	0
Vlasotince	RS	admin	0
Hanga Roa	CL	minor	7163
Razkrizje	SI	admin	0
Polessk	RU	minor	7011
Nyeri	KE	admin	98908
Keffi	NG	minor	85911
Itanagar	IN	admin	59490
Tubingen	DE	minor	90546
Ayutla de los Libres	MX	minor	15370
Selcuk	TR	minor	36360
Madaoua	NE	minor	24804
Scharding	AT	minor	5253
Kivioli	EE	minor	5504
Zlate Moravce	SK	minor	11583
Karukh	AF	minor	17484
Lospalos	TL	admin	0
Lubny	UA	minor	45786
Paiania	GR	minor	14595
Jinotepe	NI	admin	52175
Presov	SK	admin	88680
Wels	AT	minor	61233
Lebu	CL	minor	22345
Tanjungpandan	ID	minor	62374
Wagrowiec	PL	minor	24529
Crna na Koroskem	SI	admin	0
Tam Ky	VN	admin	0
Mongar	BT	admin	0
Laboulaye	AR	minor	20534
Sesimbra	PT	minor	49500
Schwaz	AT	minor	13728
Luckenwalde	DE	minor	20522
Soure	PT	minor	19245
Kerema	PG	admin	5646
Bududa	UG	admin	0
Guines	CU	minor	66892
Nieuw Amsterdam	SR	admin	4935
Boorama	SO	admin	0
Skierniewice	PL	minor	47837
Telsiai	LT	admin	22039
Trancas	AR	minor	1599
Hallein	AT	minor	21150
Sala	LV	admin	0
Trogir	HR	minor	13260
Ribeira Brava	CV	admin	0
Wegorzewo	PL	minor	12186
Beauvais	FR	minor	56020
Jaltenango	MX	minor	10427
Kidal	ML	admin	0
Karcag	HU	minor	19732
Vanadzor	AM	admin	90525
Tarashcha	UA	minor	10195
Kristiansand	NO	minor	64057
Polzela	SI	admin	0
Ben Tre	VN	admin	59442
Bacsalmas	HU	minor	6453
Ntungamo	UG	admin	16400
Gummersbach	DE	minor	50688
Creteil	FR	minor	90605
Canada de Gomez	AR	minor	29205
Bilwi	NI	admin	33600
Buikwe	UG	admin	0
Ubon Ratchathani	TH	admin	79023
Al Bayda'	YE	admin	37821
Taxco de Alarcon	MX	minor	98854
Kerugoya	KE	admin	0
Mtwara	TZ	admin	92602
Jarash	JO	admin	50745
Tartagal	AR	minor	60819
Kibingo	UG	admin	0
Vranje	RS	admin	55138
Zhmerynka	UA	minor	34537
Cova Figueira	CV	admin	0
Markovci	SI	admin	0
Ylojarvi	FI	minor	32738
Cahul	MD	admin	30018
Siegen	DE	minor	102836
Neman	RU	minor	10931
Tando Allahyar	PK	minor	133487
Chos Malal	AR	minor	8556
Nea Moudania	GR	minor	9342
Kalamata	GR	minor	71823
Smederevska Palanka	RS	admin	0
Kovel'	UA	minor	69089
Swidnica	PL	minor	57761
Bus'k	UA	minor	8624
Muta	SI	admin	0
Carora	VE	minor	112600
Sparti	GR	minor	16187
Vicenza	IT	minor	112408
Sharhorod	UA	minor	7029
Kyustendil	BG	admin	63359
Northeim	DE	minor	29107
Massenya	TD	admin	3680
Elista	RU	admin	103132
Saint-Quentin	FR	minor	53816
Hunucma	MX	minor	24910
Masindi	UG	admin	31486
Nili	AF	admin	0
Vaasa	FI	admin	67619
Knic	RS	admin	0
Guelma	DZ	admin	123590
Eydhafushi	MV	admin	0
Eisenstadt	AT	admin	14476
Rosales	MX	minor	5570
Peshkopi	AL	admin	13251
Kalkara	MT	admin	0
Santa Tecla	SV	admin	124694
Ma'erkang	CN	minor	58437
Ludenscheid	DE	minor	72611
Finike	TR	minor	48131
Sebba	BF	minor	3273
Pinneberg	DE	minor	43280
Cinfaes	PT	minor	20427
Tidjikja	MR	admin	19981
Perg	AT	minor	8388
Baraki Barak	AF	minor	22305
Kisii	KE	admin	37531
Zelenogradsk	RU	minor	15493
Pedro Juan Caballero	PY	admin	122190
Jawhar	SO	admin	111308
Andkhoy	AF	minor	13137
Dayr Hafir	SY	minor	35409
Sursee	CH	minor	9900
Bam	IR	minor	127396
Rimavska Sobota	SK	minor	24010
Clonmel	IE	admin	0
Vranov nad Topl'ou	SK	minor	22589
Becej	RS	admin	0
Aregua	PY	admin	0
Ciudad Ojeda	VE	minor	122124
Kosjeric	RS	admin	0
Puerto Barrios	GT	admin	121562
Germersheim	DE	minor	20779
Kamina	CD	admin	128803
Braslaw	BY	minor	9400
Schaffhausen	CH	admin	36587
Alsunga	LV	admin	0
La Roche-sur-Yon	FR	minor	54372
Gorlice	PL	minor	27597
Gafsa	TN	admin	126803
Doctor Mora	MX	minor	24976
Chipata	ZM	admin	98416
Kathu	TH	minor	26078
Phu Ly	VN	admin	0
Khust	UA	minor	28424
Kundiawa	PG	admin	9383
Akniste	LV	admin	1036
Nusaybin	TR	minor	105856
Brezno	SK	minor	21082
Uman'	UA	minor	82762
Tumbes	PE	admin	96946
Linden	GY	admin	29298
Horodok	UA	minor	16516
Migori	KE	admin	0
Umm al Qaywayn	AE	admin	44411
Vil'nyans'k	UA	minor	15044
Kabudarahang	IR	minor	19216
Debe	TT	admin	0
Mansa	ZM	admin	129185
Yenagoa	NG	admin	0
Olpe	DE	minor	24688
Sveta Trojica v Slovenskih Goricah	SI	admin	0
Victorica	AR	minor	4458
Huejotzingo	MX	minor	25684
Sing Buri	TH	admin	17843
Silale	LT	admin	5114
Aweil	SS	admin	46705
Ulaan-Uul	MN	minor	3726
Hartberg	AT	minor	6650
Yopal	CO	admin	61029
Zhydachiv	UA	minor	10962
Soro	DK	admin	7167
Nogent-sur-Marne	FR	minor	32851
Kuldiga	LV	admin	11768
Montego Bay	JM	admin	110115
Dabrowa Gornicza	PL	minor	122712
Jever	DE	minor	14301
Mangochi	MW	admin	51429
G'ijduvon Shahri	UZ	minor	30486
Stans	CH	admin	8393
Concordia	MX	minor	8328
Khamir	YE	minor	15333
Sonneberg	DE	minor	23830
Penela	PT	minor	5983
Tlayacapan	MX	minor	14467
Praya	ID	minor	35183
Nagykanizsa	HU	admin	46866
Konotop	UA	minor	103547
Kiuruvesi	FI	minor	8600
Los Andes	CL	minor	68093
Colonia del Sacramento	UY	admin	26231
Chatellerault	FR	minor	31840
Sibiti	CG	admin	22811
Agadez	NE	admin	117770
Havran	TR	minor	27741
Santiago Ixcuintla	MX	minor	18365
Idrija	SI	admin	5843
Myrhorod	UA	minor	40160
Bafra	TR	minor	97452
Siquijor	PH	admin	0
Altenburg	DE	minor	32074
Villaguay	AR	minor	49445
Oguz	AZ	admin	7400
Neiba	DO	minor	25731
Pastavy	BY	minor	19300
Uchquduq Shahri	UZ	minor	24200
Zacualpan	MX	minor	13800
Kikinda	RS	admin	38065
Kotka	FI	minor	54319
Jisr ash Shughur	SY	minor	44322
Valparaiso	MX	minor	12919
Dravograd	SI	admin	3163
Sirvintos	LT	admin	5744
Juigalpa	NI	admin	60583
Karabuk	TR	admin	131989
Al Hazm	YE	admin	0
Boryeong	KR	minor	101852
Baniyas	SY	minor	43151
Simmern	DE	minor	7950
Faro	PT	admin	64560
Gusinje	ME	admin	0
Ljig	RS	admin	0
Bagrationovsk	RU	minor	6482
Afega	WS	admin	0
Cinar	TR	minor	74207
Merida	ES	admin	59335
Ulubey	TR	minor	12955
Taraclia	MD	admin	12355
Ratnapura	LK	admin	47832
Salavan	LA	admin	5521
Zarnovica	SK	minor	6284
Pescara	IT	minor	120286
Sarreguemines	FR	minor	20783
Macka	TR	minor	26626
Hlukhiv	UA	minor	33478
Masjed Soleyman	IR	minor	100497
Urla	TR	minor	66360
Klosterneuburg	AT	minor	27058
Trnovska Vas	SI	admin	0
Huaraz	PE	admin	118836
Charikar	AF	admin	53676
Ghaxaq	MT	admin	0
Sao Joao da Pesqueira	PT	minor	7874
Ghajnsielem	MT	admin	0
Szombathely	HU	admin	78407
Prevalje	SI	admin	0
Jamay	MX	minor	24753
Colmar	FR	minor	69105
Sarmiento	AR	minor	5185
Naju	KR	minor	92582
Muan	KR	admin	0
Naftalan	AZ	admin	7700
San Martin	AR	minor	117399
Amstetten	AT	minor	23656
Kos	GR	minor	19244
Marcali	HU	minor	11169
Zilina	SK	admin	82704
P'yongsong	KP	admin	0
Az Zabadani	SY	minor	26285
Steinfurt	DE	minor	34084
Kapakli	TR	minor	116882
Bijar	IR	minor	53871
Kardzhali	BG	admin	66128
Agdas	AZ	admin	29600
Kecskemet	HU	admin	110687
Kiambu	KE	admin	0
Chelm	PL	minor	63734
Sola	VU	admin	0
Brake	DE	minor	14965
Ad Duraykish	SY	minor	13244
Nea Ionia	GR	minor	67134
Kato Achaia	GR	minor	6618
Catanzaro	IT	admin	90240
Lice	TR	minor	26163
Vila Vicosa	PT	minor	8319
Amdjarass	TD	admin	0
Sfantu-Gheorghe	RO	admin	56006
Marhanets'	UA	minor	47141
Remscheid	DE	minor	110994
Goz-Beida	TD	admin	66107
Fuzuli	AZ	admin	0
Loule	PT	minor	70622
Wang Saphung	TH	minor	11992
Dolny Kubin	SK	minor	18905
Kezmarok	SK	minor	16481
Svidnik	SK	minor	11096
Wang Nam Yen	TH	minor	21301
Jayrud	SY	minor	39903
Santana	ST	admin	0
Tetecala	MX	minor	6473
Kabwe	ZM	admin	117517
Abancay	PE	admin	72277
Amioun	LB	minor	10000
Ucar	AZ	admin	0
Condeixa-a-Nova	PT	minor	17078
Greytown	NI	minor	275
Khanty-Mansiysk	RU	admin	98692
Umea	SE	admin	89607
La Union	CL	minor	26517
Vares	BA	minor	9556
Kerben	KG	minor	14141
Divo	CI	minor	127867
At Tafilah	JO	admin	25429
Lerdo de Tejada	MX	minor	19606
Kamuli	UG	admin	12764
Hargeysa	SO	admin	0
Puntarenas	CR	admin	41528
Barda	AZ	admin	38500
Pedra Badejo	CV	admin	9530
Modling	AT	minor	20555
Hajduszoboszlo	HU	minor	23873
Homburg	DE	minor	41811
Zaqatala	AZ	admin	31300
Wilhelmshaven	DE	minor	76097
Chania	GR	minor	53910
Zhovkva	UA	minor	13834
Dolores	AR	minor	25190
General Bravo	MX	minor	5385
Beyla	GN	minor	13204
Podlehnik	SI	admin	0
Shostka	UA	minor	76788
Tielt	BE	minor	20422
Saatli	AZ	admin	17900
Kaeng Khoi	TH	minor	12752
Hoima	UG	admin	0
Tvrdosin	SK	minor	9195
Tinaquillo	VE	minor	110000
Skelleftea	SE	minor	31311
Rayong	TH	admin	61902
Ahtari	FI	minor	6068
Skien	NO	admin	73330
Lwowek Slaski	PL	minor	9500
Salihorsk	BY	minor	101400
Lousada	PT	minor	47387
Fria	GN	minor	23729
Mohacs	HU	minor	17089
Zabljak	ME	admin	0
Obukhiv	UA	minor	33204
Zombo	UG	admin	0
Wiener Neustadt	AT	minor	82762
Kiffa	MR	admin	110714
Kayanza	BI	admin	21767
Wesel	DE	minor	60357
Bad Neuenahr-Ahrweiler	DE	minor	28251
Szarvas	HU	minor	15565
Rankovce	MK	admin	0
Cantemir	MD	admin	3429
Ourique	PT	minor	5389
Flores	GT	admin	38035
Qinggang	CN	minor	64182
Vevcani	MK	admin	0
Riihimaki	FI	minor	29269
Jilotepec	MX	minor	100808
Singuilucan	MX	minor	13143
Kuressaare	EE	admin	13097
Opoczno	PL	minor	21780
Sotik Post	KE	admin	0
Castelli	AR	minor	9421
Vanersborg	SE	minor	21835
Mont-de-Marsan	FR	minor	29554
Asadabad	AF	admin	48400
Pyetrykaw	BY	minor	10000
Fatick	SN	admin	24243
Amuria	UG	admin	0
Bytow	PL	minor	16888
Mokhotlong	LS	admin	8809
Saintes	FR	minor	25470
Beocin	RS	admin	8058
Chumphon	TH	admin	33516
Sezana	SI	admin	11842
Yelimane	ML	minor	988
Bluefields	NI	admin	45547
Ghanzi	BW	admin	6306
Cozumel	MX	minor	77236
Cucer-Sandevo	MK	admin	0
Lapovo	RS	admin	7143
Zgorzelec	PL	minor	31359
Slatina	HR	minor	10208
Heroica Caborca	MX	minor	59922
Muli	MV	admin	0
Pozega	HR	admin	0
Vilyeyka	BY	minor	27400
An Nabk	SY	minor	52502
Beledweyne	SO	admin	62945
Mozirje	SI	admin	0
Mosonmagyarovar	HU	minor	33318
Kempten	DE	minor	68907
Ragusa	IT	minor	68956
Felgueiras	PT	minor	58065
Vibo Valentia	IT	minor	33957
Puchov	SK	minor	17810
Star Dojran	MK	admin	0
Kogon Shahri	UZ	minor	107566
Alto Rio Senguer	AR	minor	1570
Kralendijk	NL	admin	12531
Zempoala	MX	minor	27333
Roura	GF	minor	2229
Elvas	PT	minor	20706
Imsida	MT	admin	0
Ipsala	TR	minor	27498
Jacmel	HT	admin	33563
Bershad'	UA	minor	12795
Butalangu	UG	admin	0
Fafe	PT	minor	50633
Kirkop	MT	admin	0
Reconquista	AR	minor	70549
Szolnok	HU	admin	71285
Orhei	MD	admin	21065
Kozani	GR	admin	41066
Ntoroko	UG	admin	0
Gualeguay	AR	minor	43009
Kyzyl	RU	admin	116015
Bruges	BE	minor	118053
Elefsina	GR	minor	24910
Caacupe	PY	admin	21696
Ipiales	CO	minor	109116
Pijijiapan	MX	minor	53525
Fayroz Koh	AF	admin	15000
Thonon-les-Bains	FR	minor	34756
Tamasi	HU	minor	7986
Fuerte Olimpo	PY	admin	2475
Poldasht	IR	minor	11472
Szekesfehervar	HU	admin	96940
May Pen	JM	admin	135142
Gustrow	DE	minor	29241
Jaunjelgava	LV	admin	1890
Al Qaryatayn	SY	minor	37820
Lanchkhuti	GE	minor	6395
Sisophon	KH	admin	50302
Vila Verde	PT	minor	47888
Cheyenne	US	admin	79484
Azna	IR	minor	47489
Bilopillya	UA	minor	15215
Villa Angela	AR	minor	30051
Erfelek	TR	minor	12049
Planken	LI	admin	0
Kemalpasa	TR	minor	106298
Kristinestad	FI	minor	6793
Zolotonosha	UA	minor	27847
Devin	BG	minor	6859
Coronel Dorrego	AR	minor	11510
Nacajuca	MX	minor	83356
Castro Marim	PT	minor	6747
Damascus	US	\N	15094
Yako	BF	minor	22904
Amealco	MX	minor	56457
Menderes	TR	minor	93796
Sempeter pri Gorici	SI	admin	0
Susques	AR	minor	1093
Gyula	HU	minor	29308
Kitzingen	DE	minor	21704
Bender	MD	admin	91882
Sousel	PT	minor	5074
Nueva Ocotepeque	HN	admin	8780
Sokhumi	GE	admin	64441
Metlika	SI	admin	0
Nabilatuk	UG	admin	0
Tantoyuca	MX	minor	23893
Balzers	LI	admin	0
Kelme	LT	admin	8206
Boli	CN	minor	95260
Dubrovnik	HR	admin	42615
Covilha	PT	minor	51797
Fomboni	KM	admin	0
Bua Yai	TH	minor	14168
Gaigirgordub	PA	admin	10
Cherkessk	RU	admin	122395
Famenin	IR	minor	14019
Al Khawr	QA	admin	0
Korenovsk	RU	minor	42019
Safi	MT	admin	0
Batken	KG	admin	12134
Stefan Voda	MD	admin	7078
Basco	PH	admin	0
Yuscaran	HN	admin	11396
Lamia	GR	admin	52006
Mohale's Hoek	LS	admin	24992
Paraguari	PY	admin	18881
Rauma	FI	minor	39809
Phu Quoc	VN	minor	70000
Ra's al `Ayn	SY	minor	29347
Isale	BI	admin	0
Gilgit	PK	minor	8851
Putnok	HU	minor	6492
Frankenthal	DE	minor	48561
Urus-Martan	RU	minor	59954
Belchatow	PL	minor	59025
Jegunovce	MK	admin	0
Juneau	US	admin	25085
Bocas del Toro	PA	admin	12996
Triesen	LI	admin	0
Hajdunanas	HU	minor	16828
Weinfelden	CH	minor	11534
Unye	TR	minor	126702
Iseyin	NG	minor	98071
Hun	LY	admin	18878
Perechyn	UA	minor	6683
Hatvan	HU	minor	20167
Avellaneda	AR	minor	24313
Bayan Hot	CN	minor	56387
Norrkoping	SE	minor	88639
Zhabinka	BY	minor	14000
Jelenia Gora	PL	minor	84306
Cacak	RS	admin	71883
Dzilam Gonzalez	MX	minor	5875
Toprakkale	TR	minor	20127
Boosaaso	SO	admin	46969
Ivanava	BY	minor	16600
Velike Lasce	SI	admin	0
Tindouf	DZ	admin	18270
Baldone	LV	admin	3996
Lop Buri	TH	admin	24166
Trongsa	BT	admin	0
San Carlos de Bariloche	AR	minor	112887
Kolda	SN	admin	62258
Estarreja	PT	minor	26997
Pabianice	PL	minor	64988
Macuspana	MX	minor	30661
Amudat	UG	admin	0
Dingolfing	DE	minor	19839
Senica	SK	minor	20342
T'q'ibuli	GE	minor	9770
Race	SI	admin	0
Birzebbuga	MT	admin	0
Deggendorf	DE	minor	33585
Rezina	MD	admin	11032
Mandalgovi	MN	admin	2984
Varazdin	HR	admin	0
Chongshan	CN	minor	104119
Ilok	HR	minor	5072
Aalen	DE	minor	68456
Bentiu	SS	admin	7781
Klimavichy	BY	minor	15600
Sigmaringen	DE	minor	17278
Neumarkt	DE	minor	40002
Bulgan	MN	admin	12323
Gombe	UG	admin	0
Haysyn	UA	minor	25672
Drochia	MD	admin	13150
Hrazdan	AM	admin	0
Zahle	LB	admin	100000
Nawa	SY	minor	63676
Cabrayil	AZ	admin	0
Nakhon Sawan	TH	admin	86439
La Palma	CU	minor	35346
Elblag	PL	minor	122568
Steinfort	LU	minor	5459
Chalatenango	SV	admin	29271
Versailles	FR	minor	85862
Xirdalan	AZ	admin	95200
Slatina	RO	admin	70293
Matamoros	MX	minor	48511
Assomada	CV	admin	12026
Santa Rita	VE	minor	31810
Vila Real	PT	admin	51850
Giurgiu	RO	admin	61353
Kasese	UG	admin	67269
Palmela	PT	minor	62831
Jinja	UG	admin	72931
Erzin	TR	minor	41368
Cesis	LV	admin	15293
Mineral del Monte	MX	minor	11944
Khlong Luang	TH	minor	56128
Whangarei	NZ	admin	52600
Nizwa	OM	admin	70000
Berettyoujfalu	HU	minor	14690
Sultandagi	TR	minor	15076
Imuris	MX	minor	9921
Westerstede	DE	minor	22778
Adazi	LV	admin	0
Raska	RS	admin	0
Fortin de las Flores	MX	minor	18965
Pazin	HR	admin	0
Batalha	PT	minor	15805
Relizane	DZ	admin	0
Valle de La Pascua	VE	minor	115902
Rossosh	RU	minor	62827
Maintirano	MG	minor	5925
Wurzburg	DE	minor	127880
San Lawrenz	MT	admin	0
Bragado	AR	minor	33222
Zvolen	SK	minor	42476
San Pablo Villa de Mitla	MX	minor	7547
Birzai	LT	admin	10561
Bongor	TD	admin	27770
Psachna	GR	minor	5827
Pargas	FI	minor	15457
Sonson	CO	minor	18817
Nabire	ID	minor	43898
Mchinji	MW	admin	18305
Rada`	YE	minor	45233
Didymoteicho	GR	minor	9263
Rijeka	HR	admin	128624
Kontagora	NG	minor	98754
Boblingen	DE	minor	50155
Porlamar	VE	minor	120924
Zacatlan	MX	minor	76296
Kissidougou	GN	minor	66815
Thyolo	MW	admin	7029
Chernyakhovsk	RU	minor	35888
Tepezala	MX	minor	20926
Prosperidad	PH	admin	0
Mascara	DZ	admin	108587
Bolzano	IT	minor	107317
Bela Crkva	RS	admin	10675
Hamina	FI	minor	20851
Aioun	MR	admin	1423
Cherykaw	BY	minor	8000
Kaniv	UA	minor	24532
Puerto Berrio	CO	minor	33983
Cibla	LV	admin	0
Eisenach	DE	minor	42370
Cabarroguis	PH	admin	0
Dera Ismail Khan	PK	minor	109686
Valjevo	RS	admin	90312
Liberia	CR	admin	45380
Halberstadt	DE	minor	40256
Castelo Branco	PT	admin	56109
Montana	BG	admin	49597
Beja	TN	admin	59567
Mapimi	MX	minor	5623
Waitangi	NZ	admin	300
Kinkala	CG	admin	13882
Kirawsk	BY	minor	8200
Santo Tomas de los Platanos	MX	minor	8888
Hoxter	DE	minor	28824
Kremenets'	UA	minor	20837
Aleksinac	RS	admin	0
Caazapa	PY	admin	5504
Ros Comain	IE	admin	4860
Ayapel	CO	minor	23639
Imias	CU	minor	9699
Sakete	BJ	admin	0
Islahiye	TR	minor	67674
Jamshoro	PK	minor	80000
Yenice	TR	minor	21625
Chortkiv	UA	minor	29169
Kakamega	KE	admin	91778
Puyo	EC	admin	24881
Pontevedra	ES	minor	83029
Ariana	TN	admin	97687
Leibnitz	AT	minor	12176
Lodwar	KE	admin	82970
Khasab	OM	admin	17777
Jwaneng	BW	admin	0
Kibiito	UG	admin	0
Balvi	LV	admin	6334
Jurovski Dol	SI	admin	0
Sambir	UA	minor	35026
Sassandra	CI	minor	38411
Dabou	CI	admin	72913
Ansiao	PT	minor	13128
Salsk	RU	minor	57622
Vodice	SI	admin	0
Maidan Shahr	AF	admin	35008
Grodzisk Mazowiecki	PL	minor	26881
Bauta	CU	minor	23557
Suhl	DE	minor	36955
Rioverde	MX	minor	69613
Monaghan	IE	admin	5937
Surin	TH	admin	39728
Rabak	SD	admin	0
Abdurahmoni Jomi	TJ	minor	8925
Ja`ar	YE	minor	29495
Onverwacht	SR	admin	2105
Rogasovci	SI	admin	0
Bauska	LV	admin	9348
Myronivka	UA	minor	11478
Cottbus	DE	minor	100219
Braslovce	SI	admin	0
Buynaksk	RU	minor	65080
Causeni	MD	admin	15939
Zvornik	BA	minor	63686
Petrovec	MK	admin	0
Isingiro	UG	admin	0
Cimislia	MD	admin	11997
Puno	PE	admin	128637
Gharghur	MT	admin	0
Alexandroupoli	GR	minor	57812
Cholet	FR	minor	53917
Aalst	BE	minor	85715
Ermoupoli	GR	admin	12260
Gottingen	DE	minor	119801
Huasca de Ocampo	MX	minor	15201
Lazdijai	LT	admin	3985
Cueramaro	MX	minor	25610
Krizevci	SI	admin	0
Artemisa	CU	admin	59130
Mindelo	CV	admin	70468
Kurikka	FI	minor	21734
Quimper	FR	minor	62985
Veles	MK	admin	45037
Nakhon Phanom	TH	admin	26437
Bilgoraj	PL	minor	27290
Tallaght	IE	admin	0
Ash Shihaniyah	QA	admin	0
Ocana	CO	minor	83511
Usti nad Labem	CZ	admin	92716
Cerro Azul	MX	minor	23573
Cuajinicuilapa	MX	minor	25922
Sanski Most	BA	minor	47359
Mullingar	IE	admin	0
Lezhe	AL	admin	15510
New Brighton	GB	\N	15149
Huaquechula	MX	minor	26114
Faetano	SM	admin	0
Al Kufrah	LY	admin	0
Kankan	GN	admin	114009
Paracin	RS	admin	0
Zmiiv	UA	minor	17063
Of	TR	minor	43499
Lorengau	PG	admin	5806
Gyegu	CN	minor	23000
Zell am See	AT	minor	9762
Indramayu	ID	minor	123263
Jelgava	LV	admin	55972
Kiruna	SE	minor	18154
Cesvaine	LV	admin	1410
Annaberg-Buchholz	DE	minor	19769
Tsetserleg	MN	admin	18519
Kristiansund	NO	minor	18273
Alotau	PG	admin	11624
Trat	TH	admin	10413
Kavadarci	MK	admin	38741
Jonkoping	SE	admin	89780
Zarasai	LT	admin	6458
Nelas	PT	minor	14037
Postojna	SI	admin	0
Hongseong	KR	admin	0
Ciudad Hidalgo	MX	minor	122619
Lankaran	AZ	admin	51300
Bardai	TD	admin	0
Kokopo	PG	admin	0
Mao	DO	admin	48297
Podcetrtek	SI	admin	0
Trbovlje	SI	admin	0
Ilukste	LV	admin	2365
Cocieri	MD	admin	0
San Diego de la Union	MX	minor	39663
Kostiantynivka	UA	minor	72888
Sremski Karlovci	RS	admin	8750
Cojutepeque	SV	admin	48411
Bonyhad	HU	minor	12982
Sankt Wendel	DE	minor	25862
Chake Chake	TZ	admin	49959
Biala Podlaska	PL	minor	57498
Zwettl	AT	minor	10908
El Bayadh	DZ	admin	67413
Urganch	UZ	admin	135100
Majsperk	SI	admin	0
Sardasht	IR	minor	50000
Herzberg	DE	minor	9027
Evreux	FR	minor	47733
Bourges	FR	minor	64551
Sakaka	SA	admin	128332
Narpes	FI	minor	9387
Yambio	SS	admin	40382
Birnin Konni	NE	minor	65252
Soissons	FR	minor	28530
Braniewo	PL	minor	17123
Velika Gorica	HR	minor	63517
Mielec	PL	minor	60628
Bontoc	PH	admin	0
Dumaguete City	PH	admin	131377
Nova Gorica	SI	admin	13852
Ciudad Sabinas Hidalgo	MX	minor	32047
Rovaniemi	FI	admin	61763
Carrick on Shannon	IE	admin	0
Phatthalung	TH	admin	35039
Omitlan de Juarez	MX	minor	7529
Szikszo	HU	minor	5278
Bastogne	BE	minor	15894
Kakumiro	UG	admin	0
Nueve de Julio	AR	minor	36494
Castro Daire	PT	minor	15339
Ban Pong	TH	minor	17298
Zabbar	MT	admin	0
Madaba	JO	admin	0
Sindos	GR	minor	9289
La Piedad	MX	minor	99837
Al `Amadiyah	IQ	minor	11000
Santiago	MX	minor	37886
Saint-Dizier	FR	minor	26300
Marcos Juarez	AR	minor	27004
Antigua Guatemala	GT	admin	45669
Boke	GN	admin	116270
Veliko Gradiste	RS	admin	0
Lutuhyne	UA	minor	18107
Rabat	MT	admin	0
Qivraq	AZ	admin	0
Medzilaborce	SK	minor	6612
Moca	DO	minor	61834
San Jose de las Lajas	CU	admin	0
Ixtapan de la Sal	MX	minor	30073
Gostivar	MK	admin	35847
Kluczbork	PL	minor	26164
Hillerod	DK	admin	28313
Monastir	TN	admin	71546
Rietavas	LT	admin	3308
Yatagan	TR	minor	44940
Blenheim	NZ	admin	26400
Guadalajara	ES	minor	82376
Trujillo	VE	admin	38110
Porvenir	CL	minor	5992
Andria	IT	minor	100365
Nelspruit	ZA	admin	0
Mubende	UG	admin	18936
Dobrovo	SI	admin	0
Vaxjo	SE	admin	59600
Bad Homburg	DE	minor	54248
Neuwied	DE	minor	64574
Chyhyryn	UA	minor	8962
Makale	ID	minor	9960
Aboisso	CI	minor	37654
Marmara Ereglisi	TR	minor	25873
Suhbaatar	MN	admin	24235
Spata	GR	minor	9198
Valence	FR	minor	63714
Penamiller	MX	minor	17007
Nordhorn	DE	minor	53403
Aydincik	TR	minor	11088
Pljevlja	ME	admin	30786
Siedlce	PL	minor	76585
Steyr	AT	minor	38331
Hassfurt	DE	minor	13609
Morozovsk	RU	minor	25198
Taft	IR	minor	18464
Dzuunmod	MN	admin	18048
Grosuplje	SI	admin	0
Riscani	MD	admin	9259
Dagda	LV	admin	2122
Sultepec	MX	minor	24986
Akhalkalaki	GE	minor	8295
Say'un	YE	minor	68747
Tame	CO	minor	29099
Laprida	AR	minor	8178
Libertador General San Martin	AR	minor	49267
Goppingen	DE	minor	57558
Santiago	PA	admin	45955
Walcz	PL	minor	26354
Osijek	HR	admin	103162
Haskoy	TR	minor	25749
The Bottom	NL	admin	0
Rwamagana	RW	admin	18009
Si Satchanalai	TH	minor	15691
Albu Kamal	SY	minor	80808
Alexandreia	GR	minor	14821
Gmunden	AT	minor	13191
Probistip	MK	admin	3110
Nurmes	FI	minor	7996
Kajiado	KE	admin	0
Kagadi	UG	admin	0
La Libertad	GT	minor	8646
Balassagyarmat	HU	minor	14873
Nkhotakota	MW	admin	59854
Argostoli	GR	minor	9748
Centar Zupa	MK	admin	0
Chabahar	IR	minor	106739
Savnik	ME	admin	0
Majdanpek	RS	admin	0
Frederikshavn	DK	minor	24103
Millerovo	RU	minor	35384
Alashankou	CN	minor	40000
Satoraljaujhely	HU	minor	14253
Izyaslav	UA	minor	16901
Asti	IT	minor	76173
Alajuela	CR	admin	42975
Tiszafured	HU	minor	10745
Brovary	UA	minor	102856
Satupa`itea	WS	admin	0
Dikhil	DJ	admin	35000
Maldonado	UY	admin	62592
Melgaco	PT	minor	9213
Odemira	PT	minor	26066
Rekovac	RS	admin	0
Borger	US	\N	12718
Senak'i	GE	minor	21596
Lielvarde	LV	admin	5973
Ziar nad Hronom	SK	minor	19188
Klodzko	PL	minor	27193
Ponte de Lima	PT	minor	43498
Seguela	CI	admin	51157
Parun	AF	admin	0
Pilsrundale	LV	admin	0
Holzminden	DE	minor	19998
Valga	EE	admin	12182
Suwalki	PL	minor	69626
Ig	SI	admin	0
Mendefera	ER	admin	28492
Garbahaarrey	SO	admin	43000
Fort Wellington	GY	admin	0
Maladzyechna	BY	minor	91900
Raseiniai	LT	admin	0
Neusiedl am See	AT	minor	8235
Kobarid	SI	admin	4
Kuala Kapuas	ID	minor	35632
Gadabay	AZ	admin	5049
Husum	DE	minor	23158
Kyparissia	GR	minor	5131
Fontana	MT	admin	0
Derecske	HU	minor	8403
Pezinok	SK	minor	22861
Autlan de Navarro	MX	minor	60572
Nikaia	GR	minor	89380
Lobos	AR	minor	18278
Viseu	PT	admin	99274
Dok Kham Tai	TH	minor	13450
Nenagh	IE	admin	0
Rypin	PL	minor	16558
Chengjiao Chengguanzhen	CN	minor	67826
Masyaf	SY	minor	37109
Potenza	IT	admin	67211
Guasdualito	VE	minor	128025
Miragoane	HT	admin	0
Vukovar	HR	admin	24938
Brindisi	IT	minor	87141
Varpalota	HU	minor	19484
Varese	IT	minor	80629
Kapyl'	BY	minor	10400
Tabua	PT	minor	12071
Pyrgos	GR	minor	24359
Nochistlan de Mejia	MX	minor	27932
Rio Grande	AR	minor	31095
Stropkov	SK	minor	10654
Kladovo	RS	admin	0
Slonim	BY	minor	50100
Gharb	MT	admin	0
Starobilsk	UA	minor	18796
Villagran	MX	minor	45941
Fuman	IR	minor	27763
Giannitsa	GR	minor	29789
Kitgum	UG	admin	56891
Al Mafraq	JO	admin	57118
As Salamiyah	SY	minor	110683
Balchik	BG	minor	13393
Radomyshl	UA	minor	14607
Nytva	RU	minor	18608
Rugaji	LV	admin	0
Kara-Suu	KG	minor	20862
Savonlinna	FI	minor	35523
Tissemsilt	DZ	admin	75197
Mahibadhoo	MV	admin	0
Pruszkow	PL	minor	61237
Heppenheim	DE	minor	26023
Marinha Grande	PT	minor	38681
Diapaga	BF	minor	26013
Mondorf-les-Bains	LU	minor	5359
El Rosario	MX	minor	16002
Wote	KE	admin	0
Santo Domingo Este	DO	admin	0
Poltar	SK	minor	5693
Hashtpar	IR	minor	54178
Borzna	UA	minor	10205
Veymandoo	MV	admin	0
Kingisepp	RU	minor	47313
Stip	MK	admin	43652
Trang	TH	admin	60591
Rozaje	ME	admin	9422
Acatzingo	MX	minor	52078
Bitola	MK	admin	84002
Nallihan	TR	minor	28091
Tikhoretsk	RU	minor	57771
Nowa Sol	PL	minor	39721
Tripoli	GR	admin	30866
Kerkyra	GR	admin	24838
Kunszentmarton	HU	minor	8034
Caldiran	TR	minor	63013
Kasane	BW	admin	9250
Lorrach	DE	minor	49347
Pleszew	PL	minor	20365
L'Aquila	IT	admin	68503
Sawankhalok	TH	minor	17148
Agboville	CI	minor	81770
Playas de Rosarito	MX	minor	65278
Tigoa	SB	admin	0
Redange-sur-Attert	LU	admin	0
Franceville	GA	admin	42967
Eschen	LI	admin	0
Ketrzyn	PL	minor	27827
Neuruppin	DE	minor	30846
Villa Victoria	MX	minor	77819
Manouba	TN	admin	0
Santa Venera	MT	admin	0
Buyende	UG	admin	0
Kanal	SI	admin	0
Nowe Miasto Lubawskie	PL	minor	10997
Heidenheim	DE	minor	49526
Nong Bua Lamphu	TH	admin	21528
Tbeng Meanchey	KH	admin	24380
General Conesa	AR	minor	2958
Aichach	DE	minor	21434
Gzira	MT	admin	0
Nsiika	UG	admin	0
Jamapa	MX	minor	9772
Villa Diaz Ordaz	MX	minor	6646
Bijelo Polje	ME	admin	0
Xewkija	MT	admin	0
Albina	SR	admin	5247
Salcaja	GT	minor	17535
Mena	UA	minor	11670
Tofol	FM	admin	0
Jaszbereny	HU	minor	27439
Nafplio	GR	minor	14203
Sonoita	MX	minor	12849
Kaiserslautern	DE	minor	100030
Vi Thanh	VN	admin	97200
Bergama	TR	minor	103185
Reguengos de Monsaraz	PT	minor	10828
Oblesevo	MK	admin	0
Viana do Castelo	PT	admin	88725
Nsukka	NG	minor	111017
Rogatec	SI	admin	0
Puerto Lopez	CO	minor	16678
Hof	DE	minor	45930
Rastatt	DE	minor	49783
Zetale	SI	admin	0
Sai Buri	TH	minor	14137
Ban Bueng	TH	minor	19346
Canillo	AD	admin	0
Almoloya de Alquisiras	MX	minor	14196
Orebro	SE	admin	125817
Narok	KE	admin	0
Sar-e Pul	AF	admin	51075
Dawran ad Daydah	YE	minor	5695
Kapchorwa	UG	admin	0
Kidricevo	SI	admin	0
Manokwari	ID	admin	74504
Kalibo	PH	admin	0
Okhansk	RU	minor	7087
Nemyriv	UA	minor	11697
Zardab	AZ	admin	8450
Sakiai	LT	admin	5383
Kranjska Gora	SI	admin	0
Maha Sarakham	TH	admin	52866
Ungheni	MD	admin	30804
Baneh	IR	minor	110218
Un'goofaaru	MV	admin	0
Godollo	HU	minor	32131
Dogubayazit	TR	minor	121263
Sao Joao dos Angolares	ST	admin	0
Berisso	AR	minor	101123
Srbobran	RS	admin	0
Banovce nad Bebravou	SK	minor	18350
Santa Cruz	PH	admin	0
Izola	SI	admin	10381
Tul'chyn	UA	minor	15051
Gornji Grad	SI	admin	0
Kirakira	SB	admin	0
Contla	MX	minor	27610
Mohyliv-Podil's'kyy	UA	minor	30982
Sikhio	TH	minor	18209
Juma Shahri	UZ	minor	15571
Grevenmacher	LU	admin	3958
Chaiyaphum	TH	admin	36923
Laon	FR	minor	24876
Nogales	MX	minor	21113
Cospicua	MT	admin	0
Kilimli	TR	minor	35323
Huandacareo	MX	minor	11592
Phetchabun	TH	admin	22121
Coronel Suarez	AR	minor	23621
Yavoriv	UA	minor	13057
Voitsberg	AT	minor	9403
Vawkavysk	BY	minor	42600
Vinh Long	VN	admin	103314
Garkalne	LV	admin	0
Mamburao	PH	admin	0
Montlucon	FR	minor	35653
Haldensleben	DE	minor	19247
Tecate	MX	minor	64764
Zalau	RO	admin	56202
Goslar	DE	minor	50753
Larnaca	CY	admin	48947
Bazarak	AF	admin	0
Bungoma	KE	admin	55857
Moravske-Toplice	SI	admin	0
Velingrad	BG	minor	25764
Pinki	LV	admin	0
Dutse	NG	admin	17129
Bhakkar	PK	minor	88472
Okhtyrka	UA	minor	47971
Lipkovo	MK	admin	0
Smarjeske Toplice	SI	admin	0
Mopti	ML	admin	108456
Quibdo	CO	admin	130825
Rio Claro	TT	admin	0
Kantang	TH	minor	12533
Bac Kan	VN	admin	29227
Demir Hisar	MK	admin	2593
Birendranagar	NP	admin	47914
Ganserndorf	AT	minor	11404
Tepetlixpa	MX	minor	18327
Litija	SI	admin	0
Izra`	SY	minor	19158
Rakhiv	UA	minor	15621
Babusnica	RS	admin	0
Zary	PL	minor	37502
Agios Nikolaos	GR	minor	11421
Tak	TH	admin	17565
Muhlhausen	DE	minor	36200
Tequila	MX	minor	42009
Daet	PH	admin	0
Belfort	FR	minor	114445
Szigetvar	HU	minor	10421
Tequixquiac	MX	minor	22676
Ocosingo	MX	minor	41878
Bamyan	AF	admin	61863
Luqa	MT	admin	0
Vilvoorde	BE	minor	44015
Butha-Buthe	LS	admin	10000
Batonyterenye	HU	minor	11829
Colon	AR	minor	24835
Kitee	FI	minor	10832
Ar Rayyan	QA	admin	0
Neuchatel	CH	admin	33475
Qabala	AZ	admin	0
Termiz	UZ	admin	136200
Puerto Aysen	CL	minor	17441
Taitung	TW	admin	108905
Kara	TG	admin	0
Sastamala	FI	minor	25220
Cortazar	MX	minor	57748
Gradsko	MK	admin	0
Valmiera	LV	admin	25093
San Jose	UY	admin	36747
Obo	CF	admin	12887
Siparia	TT	admin	0
Dachau	DE	minor	47400
Valle Hermoso	MX	minor	68573
Pokrov	UA	minor	39497
Ixcateopan de Cuauhtemoc	MX	minor	6104
Dombovar	HU	minor	17995
Chiang Mai	TH	admin	132634
Tiran	IR	minor	15673
Imdina	MT	admin	0
Jurbarkas	LT	admin	10376
Kone	NC	admin	0
Aschaffenburg	DE	minor	70527
Emmendingen	DE	minor	27882
Ostersund	SE	admin	46178
Hammerfest	NO	minor	8073
Neufchateau	BE	minor	7679
Vwawa	TZ	admin	0
Berkovitsa	BG	minor	14993
Tiszakecske	HU	minor	11990
Calkini	MX	minor	14934
Iecava	LV	admin	0
Castro	CL	minor	33417
Kavaratti	IN	admin	10688
Lubana	LV	admin	1596
Tuban	ID	minor	76242
Merseburg	DE	minor	34080
Toliara	MG	admin	115319
Aigina	GR	minor	6867
Ancona	IT	admin	100721
Novi Becej	RS	admin	0
Saurimo	AO	admin	41316
Masty	BY	minor	15200
Pampa del Infierno	AR	minor	2921
Jesenice	SI	admin	0
Tanjung Selor	ID	admin	0
Inongo	CD	admin	40113
San Fernando	CL	minor	58367
Bol	TD	admin	11700
Yara	CU	minor	59415
Xalisco	MX	minor	21899
Vovchansk	UA	minor	18644
Zadar	HR	admin	75082
Pfaffenhofen	DE	minor	25917
Soyaniquilpan	MX	minor	10719
Menges	SI	admin	0
Bayindir	TR	minor	40584
Peso da Regua	PT	minor	17131
Dubno	UA	minor	37545
Hulyaypole	UA	minor	14678
La Banda	AR	minor	106441
Fgura	MT	admin	0
Kuqa	CN	minor	111499
Tata	HU	minor	23377
Zwickau	DE	minor	89540
Saki	AZ	admin	68360
Saint-Denis	FR	minor	111135
Fada Ngourma	BF	admin	33910
Slivnitsa	BG	minor	7320
Cerkno	SI	admin	0
Charallave	VE	minor	117707
Phrae	TH	admin	16668
San	ML	minor	41386
Chumbicha	AR	minor	2572
Aosta	IT	admin	34062
Baltiysk	RU	minor	33317
Zirc	HU	minor	6805
Uliastay	MN	admin	22006
Leeuwarden	NL	admin	125778
Hanau	DE	minor	96023
Bethune	FR	minor	24895
Sopron	HU	admin	62454
Heyin	CN	minor	7642
Thakhek	LA	admin	70000
Lozova	UA	minor	55827
Tibro	SE	minor	8572
Sremska Mitrovica	RS	admin	0
Satao	PT	minor	12444
Greifswald	DE	minor	59382
Chadegan	IR	minor	7037
Borovnica	SI	admin	0
Madang	PG	admin	62023
Martin	SK	minor	54978
Comonfort	MX	minor	67642
Resen	MK	admin	0
Saky	UA	minor	24885
Pabellon de Arteaga	MX	minor	28633
Phalombe	MW	admin	0
Zomba	MW	admin	101140
Ribeira Grande	CV	admin	0
San Julian	AR	minor	2347
Moquegua	PE	admin	69882
Zamora	ES	minor	61406
Aguiar da Beira	PT	minor	5473
Yambol	BG	admin	84232
Mparo	UG	admin	0
San Juan de los Morros	VE	admin	87739
Bicske	HU	minor	11969
Kanifing	GM	admin	0
Kranj	SI	admin	56081
Zinjibar	YE	admin	70801
Tall `Afar	IQ	minor	80000
Atakpame	TG	admin	80683
Sarnen	CH	admin	10368
Marupe	LV	admin	0
Rodez	FR	minor	24057
Torokszentmiklos	HU	minor	19890
San Pedro Pochutla	MX	minor	13685
Ignalina	LT	admin	0
Kaffrine	SN	admin	0
Kurganinsk	RU	minor	48439
Zolochiv	UA	minor	24059
Dosso	NE	admin	49750
Abinsk	RU	minor	38547
Al `Aziziyah	LY	admin	4000
Bueng Kan	TH	admin	4494
Ruggell	LI	admin	0
Nombre de Dios	MX	minor	5302
Krems an der Donau	AT	minor	24610
Mila	DZ	admin	0
Haapajarvi	FI	minor	7438
Kobilje	SI	admin	0
Nagua	DO	minor	33862
Porto de Mos	PT	minor	24342
Dong Xoai	VN	admin	0
Hodrogo	MN	minor	10
Incukalns	LV	admin	0
Beloslav	BG	minor	8017
Bernburg	DE	minor	32674
Molndal	SE	minor	37233
Meppen	DE	minor	35373
Soroca	MD	admin	22196
Burdur	TR	admin	113077
Kizlyar	RU	minor	49247
Khlung	TH	minor	11073
Turicato	MX	minor	31877
Prebold	SI	admin	0
La Chorrera	PA	admin	68896
San Jacinto	CO	minor	21644
Agrigento	IT	minor	59329
Szentgotthard	HU	minor	8864
Sabac	RS	admin	0
Lisieux	FR	minor	20318
Kayes	ML	admin	77207
Felipe Carrillo Puerto	MX	minor	25744
Berane	ME	admin	11776
Myory	BY	minor	7900
Kosonsoy	UZ	minor	31217
Abengourou	CI	admin	104020
Taybad	IR	minor	56562
Furth	DE	minor	127748
Ngora	UG	admin	0
Proenca-a-Nova	PT	minor	8314
Torres Vedras	PT	minor	79465
La Massana	AD	admin	0
Domagnano	SM	admin	0
Neubrandenburg	DE	minor	64086
Mali Idos	RS	admin	0
Puerto Baquerizo Moreno	EC	admin	6533
Celorico da Beira	PT	minor	7693
Cankova	SI	admin	0
Novoselytsya	UA	minor	7588
Laghouat	DZ	admin	113872
Carson City	US	admin	58756
Krumovgrad	BG	minor	8800
Durazno	UY	admin	34372
Ibra'	OM	admin	0
Jarvenpaa	FI	minor	40106
Lae	PG	admin	131052
San Jose Iturbide	MX	minor	54661
Pallisa	UG	admin	30745
Jaworzno	PL	minor	94305
Haapsalu	EE	admin	9675
Huancavelica	PE	admin	49570
Vierzon	FR	minor	25903
Semirom	IR	minor	26260
Parchim	DE	minor	18037
Stendal	DE	minor	39439
Brezovica	SI	admin	0
Nikopol'	UA	minor	112102
Popondetta	PG	admin	28198
Bangassou	CF	admin	31453
Ascension	MX	minor	13456
Treinta y Tres	UY	admin	25477
Nelson	NZ	admin	49300
Sunyani	GH	admin	70299
Lakatoro	VU	admin	705
Destrnik	SI	admin	0
Emden	DE	minor	49913
Vilkaviskis	LT	admin	9855
Uzice	RS	admin	59747
Cacheu	GW	admin	9882
Sligo	IE	admin	19452
Natanz	IR	minor	44000
Como	IT	minor	84378
Malyn	UA	minor	26204
Irshava	UA	minor	9276
Litochoro	GR	minor	6995
Goya	AR	minor	72304
Rantepao	ID	minor	43123
Patzcuaro	MX	minor	79868
Sumbe	AO	admin	26000
Diebougou	BF	minor	12732
Al Wakrah	QA	admin	0
Enying	HU	minor	6655
Nhlangano	SZ	admin	0
Puerto Plata	DO	minor	119897
Ed Daein	SD	admin	0
San Pedro	AR	minor	58430
Roatan	HN	admin	7514
Gera	DE	minor	94152
Garzon	CO	minor	56603
Watampone	ID	minor	81629
Nalerigu	GH	admin	0
Cantaura	VE	minor	89552
Bayt al Faqih	YE	minor	41652
Criuleni	MD	admin	6708
Marneuli	GE	minor	20211
Puerto Ayacucho	VE	admin	80000
Celje	SI	admin	37875
Mukacheve	UA	minor	86257
Salmas	IR	minor	79560
San Antonio Oeste	AR	minor	16265
Ferrara	IT	minor	132009
Ambrolauri	GE	admin	2047
Straseni	MD	admin	18376
Telimele	GN	minor	30311
Santa Elena	EC	admin	39681
Nueva Gerona	CU	admin	46264
Brezice	SI	admin	0
Sakon Nakhon	TH	admin	53618
Starogard Gdanski	PL	minor	48690
Vechta	DE	minor	32433
Targu Jiu	RO	admin	82504
Mbanza Kongo	AO	admin	60182
Port-Gentil	GA	admin	116836
Ribeira de Pena	PT	minor	6544
Chiquinquira	CO	minor	53975
Bushenyi	UG	admin	0
Cestos City	LR	admin	2578
Laascaanood	SO	admin	0
Recklinghausen	DE	minor	112267
Angostura	MX	minor	5086
Hameln	DE	minor	57510
Limerick	IE	admin	58319
Heydarabad	AZ	admin	0
Port Maria	JM	admin	7906
Kusadasi	TR	minor	113580
Corinto	NI	minor	22000
Bukedea	UG	admin	0
Zumpango	MX	minor	50742
Lillehammer	NO	minor	20580
Skocjan	SI	admin	0
Nea Filadelfeia	GR	minor	25734
Salzwedel	DE	minor	23655
Korbach	DE	minor	23581
Svislach	BY	minor	6400
Taro	SB	admin	0
Bobigny	FR	minor	53640
Blace	RS	admin	0
Kastav	HR	minor	10472
Guapi	CO	minor	13853
Kolasin	ME	admin	0
Caldas da Rainha	PT	minor	51729
Chalkida	GR	minor	59125
Brody	UA	minor	23752
Kubrat	BG	minor	10011
Portalegre	PT	admin	24930
Edessa	GR	minor	18229
Bayonne	FR	minor	51228
Waidhofen an der Thaya	AT	minor	5501
Belogradchik	BG	minor	5775
Tempoal de Sanchez	MX	minor	12237
Victoria	MX	minor	17764
Puerto Francisco de Orellana	EC	admin	40730
Kisber	HU	minor	5336
Catemaco	MX	minor	27615
Badulla	LK	admin	42923
Sigulda	LV	admin	11821
Ipil	PH	admin	0
Trebisov	SK	minor	24587
Koufalia	GR	minor	7850
Maardu	EE	minor	17141
Sahuaripa	MX	minor	5792
Cafayate	AR	minor	11785
Pilar	PY	admin	32810
Eeklo	BE	minor	20890
Otukpo	NG	minor	68220
Saalfeld	DE	minor	29457
Toledo	ES	admin	74632
Rafaela	AR	minor	92945
Ohrid	MK	admin	55749
Gusev	RU	minor	28484
Cuitzeo del Porvenir	MX	minor	28227
Brive-la-Gaillarde	FR	minor	46916
Mobaye	CF	admin	7176
Ixtapan del Oro	MX	minor	6349
Nabatiye	LB	admin	80000
Zuzemberk	SI	admin	0
Sultanhani	TR	minor	10884
Hunedoara	RO	admin	0
Ocoyoacac	MX	minor	61805
Lamwo	UG	admin	0
Slavyansk-na-Kubani	RU	minor	66285
Khobi	GE	minor	5600
Sokode	TG	admin	113000
Kobryn	BY	minor	52600
Treviso	IT	minor	83950
Kati	ML	minor	66895
Kaliro	UG	admin	0
Kisvarda	HU	minor	16084
Pozega	RS	admin	0
Drobeta-Turnu Severin	RO	admin	92617
Asipovichy	BY	minor	29900
Aarau	CH	admin	21268
Lukow	PL	minor	30381
Pluzine	ME	admin	0
Pariaman	ID	minor	85485
Acayucan	MX	minor	83817
Al Atarib	SY	minor	10657
San Pedro	MX	minor	53688
Neu-Ulm	DE	minor	58707
Levanger	NO	minor	10333
Puerto Piritu	VE	minor	25981
Uttaradit	TH	admin	33930
Napak	UG	admin	0
Banamba	ML	minor	30591
Villingen-Schwenningen	DE	minor	85181
Slavonski Brod	HR	admin	56769
Erdenet	MN	admin	79647
Slobozia	RO	admin	45891
Bergisch Gladbach	DE	minor	111966
Janakpur	NP	admin	97776
Baabda	LB	admin	9000
Balatonalmadi	HU	minor	8640
Sid	RS	admin	0
Gudermes	RU	minor	52908
Bossangoa	CF	admin	37780
Rackeve	HU	minor	10605
Port Laoise	IE	admin	0
Ondjiva	AO	admin	10169
Police	PL	minor	33152
Alamo	MX	minor	25159
Felidhoo	MV	admin	0
Berat	AL	admin	36496
Makedonska Kamenica	MK	admin	0
Lamego	PT	minor	26691
New Amsterdam	GY	admin	46874
Tunapuna	TT	admin	17650
Kibuku	UG	admin	0
Sambava	MG	minor	43465
Bukomansimbi	UG	admin	0
Oberwil	CH	\N	11136
Draguignan	FR	minor	39340
Siggiewi	MT	admin	0
Naklo nad Notecia	PL	minor	19507
Osterholz-Scharmbeck	DE	minor	30300
Kazincbarcika	HU	minor	26337
Erlangen	DE	minor	111962
Viesca	MX	minor	19328
Bobrynets'	UA	minor	10898
Daruvar	HR	minor	9815
Chuhuiv	UA	minor	33144
Zacapa	GT	admin	36088
Lingayen	PH	admin	0
Grobina	LV	admin	3631
Kiryandongo	UG	admin	0
Zilupe	LV	admin	1469
Toba Tek Singh	PK	minor	75943
Sejong	KR	admin	0
Fougeres	FR	minor	20418
Itzehoe	DE	minor	31879
Dambai	GH	admin	0
Richmond	NZ	admin	15000
P'yatykhatky	UA	minor	18845
Villeneuve-sur-Lot	FR	minor	22064
Sens	FR	minor	25935
Mons	BE	minor	95299
Xiva	UZ	minor	55568
Santa Rosa	AR	admin	103860
Aszod	HU	minor	6184
Gardabani	GE	minor	15100
Chinhoyi	ZW	admin	56794
Lichtenfels	DE	minor	20133
Kuopio	FI	admin	112117
Talachyn	BY	minor	9900
Oranienburg	DE	minor	44512
Snyatyn	UA	minor	9942
Vienne	FR	minor	29306
Natitingou	BJ	admin	80892
Hola	KE	admin	6931
Vargarda	SE	minor	5735
Waldshut-Tiengen	DE	minor	24226
Echternach	LU	admin	5617
Ozd	HU	minor	32564
Tulum	MX	minor	18233
Godawari	NP	admin	0
Temamatla	MX	minor	11206
Carcassonne	FR	minor	46031
Nakasongola	UG	admin	6921
Attapu	LA	admin	19200
Glarus	CH	admin	12515
Pfarrkirchen	DE	minor	12677
Kranuan	TH	minor	10726
Assen	NL	admin	62237
Temascalapa	MX	minor	33063
Trebnje	SI	admin	0
Bugojno	BA	minor	34559
Sliema	MT	admin	0
Famagusta	CY	admin	40920
Caripito	VE	minor	64955
Liestal	CH	admin	14390
Birobidzhan	RU	admin	73623
Embu	KE	admin	41092
Wschowa	PL	minor	14607
Francisco I. Madero	MX	minor	50084
Antsiranana	MG	admin	82937
Eichstatt	DE	minor	13525
Palaiseau	FR	minor	35514
Sommerda	DE	minor	19034
Goure	NE	minor	14639
Villa Luvianos	MX	minor	28215
Kampot	KH	admin	39186
Marsaxlokk	MT	admin	0
San Vicente del Caguan	CO	minor	1500
Haa	BT	admin	0
Tacotalpa	MX	minor	8071
Suphan Buri	TH	admin	26164
Lyuban'	BY	minor	11600
Namsos	NO	minor	8471
Tirschenreuth	DE	minor	8707
Ndalatando	AO	admin	8144
Longjiang	CN	minor	106384
Sarikaya	TR	minor	33010
Yabrud	SY	minor	47136
Azogues	EC	admin	33848
Dusheti	GE	minor	6167
Prokuplje	RS	admin	0
Tailai	CN	minor	75992
Suhar	OM	admin	0
Altagracia de Orituco	VE	minor	40052
Guelmim	MA	admin	118318
Gar	CN	minor	10000
Agen	FR	minor	33576
Samtse	BT	admin	0
Daskasan	AZ	admin	10700
Bafata	GW	admin	22501
Walbrzych	PL	minor	116069
Imtarfa	MT	admin	0
Lubaczow	PL	minor	12415
Beydag	TR	minor	12507
Leoben	AT	minor	24645
Saumur	FR	minor	26734
Levoca	SK	minor	14803
Jovellanos	CU	minor	58685
Komen	SI	admin	0
Ma`bar	YE	minor	24707
Kanjiza	RS	admin	10200
Kysucke Nove Mesto	SK	minor	15132
Uige	AO	admin	60008
Balkh	AF	minor	77000
Caseros	AR	minor	95785
Arles	FR	minor	52548
Lai	TD	admin	19382
Kanasin	MX	minor	77240
Rovinj	HR	minor	14294
Amatepec	MX	minor	27026
Giessen	DE	minor	88546
La Trinidad	PH	admin	0
Hinwil	CH	minor	11179
Pomorie	BG	minor	14634
Secanj	RS	admin	0
Idah	NG	minor	75087
Dong Ha	VN	admin	17662
Cuito	AO	admin	114286
Aran Bidgol	IR	minor	55651
Speyer	DE	minor	50378
Tsimasham	BT	admin	0
Tobruk	LY	admin	135832
Vahdat	TJ	minor	40600
Ales	FR	minor	40219
Mersch	LU	admin	0
Bruck an der Mur	AT	minor	15837
Pruzhany	BY	minor	18900
Topola	RS	admin	0
Masbate	PH	admin	95389
Buchach	UA	minor	12511
Belorechensk	RU	minor	52082
Ar Rutbah	IQ	minor	22370
Smarhon'	BY	minor	36300
Ourense	ES	minor	105233
San Francisco	AR	minor	62000
Lappeenranta	FI	admin	72875
Tarouca	PT	minor	8048
Polgardi	HU	minor	6917
Yeniceoba	TR	minor	6872
Rokiskis	LT	admin	12738
Koblenz	DE	minor	114024
Xekong	LA	admin	0
Solwezi	ZM	admin	65000
Ismayilli	AZ	admin	20660
Nagykoros	HU	minor	23605
Karlskrona	SE	admin	35212
Boumerdes	DZ	admin	41685
Cajetina	RS	admin	0
Izmayil	UA	minor	71594
Mirandela	PT	minor	23850
Swabi	PK	minor	115018
Ordubad	AZ	admin	10372
Preddvor	SI	admin	0
Gizo	SB	admin	6154
Tshabong	BW	admin	9679
Erd	HU	minor	66892
Gross-Gerau	DE	minor	25302
Ovalle	CL	minor	75864
Ol Kalou	KE	admin	0
Sabaneta	DO	minor	16380
Dimbokro	CI	admin	67349
Prymors'k	UA	minor	11679
Innsbruck	AT	admin	132493
Douliu	TW	admin	106653
Landa de Matamoros	MX	minor	18905
Kon Tum	VN	admin	0
Paimio	FI	minor	10620
Davaci	AZ	admin	0
Babak	AZ	minor	5600
Khulm	AF	minor	28078
Qal`ah-ye Now	AF	admin	5340
Cerro de Pasco	PE	admin	58899
Laoag	PH	admin	111125
Ulaangom	MN	admin	26319
Merzig	DE	minor	29745
Stadthagen	DE	minor	22247
Skalica	SK	minor	14967
Dolneni	MK	admin	0
Resende	PT	minor	11364
La Asuncion	VE	admin	35084
Assab	ER	admin	74405
Gangtok	IN	admin	100286
Halych	UA	minor	6196
Saint-Nazaire	FR	minor	69993
Santa Ana	MX	minor	10593
Temerin	RS	admin	0
Visby	SE	admin	24693
An Cabhan	IE	admin	0
Skuodas	LT	admin	5610
Mo i Rana	NO	minor	18899
Acambaro	MX	minor	57972
Rivas	NI	admin	31941
Karpenisi	GR	minor	7183
Birkirkara	MT	admin	24356
Nyiregyhaza	HU	admin	116799
Kimbe	PG	admin	18847
Lasko	SI	admin	0
Sao Domingos	CV	admin	2818
Massakory	TD	admin	0
Chitre	PA	admin	46191
Notodden	NO	minor	9072
Mtskheta	GE	admin	7940
Tolmin	SI	admin	0
Gospic	HR	admin	5695
Tepotzotlan	MX	minor	67724
Santiago de Compostela	ES	admin	92430
Mwanza	MW	admin	11379
Bergerac	FR	minor	26833
Bopolu	LR	admin	0
Bosilovo	MK	admin	0
Middelburg	NL	admin	46485
San Luis	GT	minor	132470
Jindayris	SY	minor	13661
Salekhard	RU	admin	48507
Kavarna	BG	minor	12369
Heilbad Heiligenstadt	DE	minor	17105
Bad Reichenhall	DE	minor	18278
Gotha	DE	minor	45733
Moroto	UG	admin	371
Tlahualilo de Zaragoza	MX	minor	9517
Leribe	LS	admin	47675
Epinal	FR	minor	93184
Novara	IT	minor	104284
Kanungu	UG	admin	0
Magtymguly	TM	minor	8412
Dhuusamarreeb	SO	admin	447
Volkermarkt	AT	minor	10946
Malanje	AO	admin	125856
Acanceh	MX	minor	10968
Jakar	BT	admin	0
Jaguey Grande	CU	minor	87771
`Ajlun	JO	admin	0
Tacuarembo	UY	admin	54277
Bor	RS	admin	34159
Bergheim	DE	minor	61612
Chavinda	MX	minor	10258
Rochefort	FR	minor	24151
Kaarina	FI	minor	32590
Punta Alta	AR	minor	57209
Soldanesti	MD	admin	5883
Kirklareli	TR	admin	102909
Lovisa	FI	minor	15311
Paredes	PT	minor	86854
Toumodi	CI	minor	39005
Kampong Thom	KH	admin	31871
General Pico	AR	minor	57029
Isfana	KG	minor	18244
Monte Quemado	AR	minor	11387
Ulricehamn	SE	minor	11443
Katakwi	UG	admin	8400
Velika Polana	SI	admin	0
Zrenjanin	RS	admin	76511
Gulbene	LV	admin	7507
Sabanalarga	CO	minor	68535
Cuatro Cienegas de Carranza	MX	minor	10309
Unna	DE	minor	58633
Fish Town	LR	admin	0
Bakjagol	KR	admin	0
Kalvarija	LT	admin	4100
Igreja	CV	admin	0
Hincesti	MD	admin	12491
Osilnica	SI	admin	0
Auki	SB	admin	0
Kostanjevica na Krki	SI	admin	0
Shira	RU	\N	9358
Anadyr	RU	admin	15604
Ojuelos de Jalisco	MX	minor	32357
Soest	DE	minor	47460
Jaffna	LK	admin	88138
Phonsavan	LA	admin	0
Mapire	VE	minor	5326
Navolato	MX	minor	28676
Saldus	LV	admin	10311
Tapa	EE	minor	5706
Nuevo Ideal	MX	minor	10876
Kamwenge	UG	admin	0
Zupanja	HR	minor	12090
Krapina	HR	admin	0
Tixtla de Guerrero	MX	minor	21720
La Grita	VE	minor	88450
Lamphun	TH	admin	12595
Kibaha	TZ	admin	23050
Nazareth	IL	admin	83400
Vasylivka	UA	minor	13166
Dovzhansk	UA	minor	95153
Tartus	SY	admin	89457
Almeirim	PT	minor	23376
Otumba	MX	minor	29873
Prudnik	PL	minor	21237
Selnica ob Dravi	SI	admin	0
Pale	GQ	admin	5008
Owando	CG	admin	34070
Gokcebey	TR	minor	21655
Kandy	LK	admin	111701
Krupina	SK	minor	7890
Botosani	RO	admin	106847
Calimaya	MX	minor	47033
Huauchinango	MX	minor	97753
Hodos	SI	admin	0
Bensonville	LR	admin	4089
Concepcion	PY	admin	87215
Panagyurishte	BG	minor	18350
Stromstad	SE	minor	7355
Tallkalakh	SY	minor	35445
Santa Marta de Penaguiao	PT	minor	7356
Kara-Balta	KG	minor	74133
Madera	MX	minor	15447
Tulagi	SB	admin	0
Lucheng	CN	minor	130142
Kupiansk	UA	minor	6893
Filadelfia	PY	admin	10470
Romblon	PH	admin	0
Porto Novo	CV	admin	0
Goygol	AZ	admin	15338
Onoto	VE	minor	11378
Muret	FR	minor	24945
Ain Defla	DZ	admin	0
Narowlya	BY	minor	8300
Ixmiquilpan	MX	minor	73903
Verzej	SI	admin	0
Turcianske Teplice	SK	minor	6390
Kumi	UG	admin	13000
Trinidad	BO	admin	101454
Bombarral	PT	minor	13193
Sadao	TH	minor	21086
Memmingen	DE	minor	43837
La Union	SV	admin	26807
Balzan	MT	admin	0
Kaposvar	HU	admin	61441
Santo Antonio	ST	admin	0
Ahram	IR	minor	12182
Rethymno	GR	minor	32468
Ouargla	DZ	admin	133024
Ieper	BE	minor	34964
Phibun Mangsahan	TH	minor	10842
Gyangze	CN	minor	10000
Puerto Carreno	CO	admin	16763
Tlapa de Comonfort	MX	minor	37975
Cuilapa	GT	admin	16484
Pforzheim	DE	minor	125542
Khotyn	UA	minor	9262
Birnin Kebbi	NG	admin	108164
Ahuacatlan	MX	minor	8819
Baalbek	LB	admin	24000
Nueva Loja	EC	admin	48562
Jendouba	TN	admin	51408
Darayya	SY	minor	84044
Kurumul	PG	admin	0
Rumonge	BI	admin	0
Videm	SI	admin	0
`Ataq	YE	admin	37315
Naklo	SI	admin	1776
Petrovac na Mlavi	RS	admin	0
Roi Et	TH	admin	35219
Heinola	FI	minor	19575
Samandag	TR	minor	121109
Abra Pampa	AR	minor	4480
Tokmak	UA	minor	31016
Weissenburg	DE	minor	18464
Frankfurt (Oder)	DE	minor	57873
Focsani	RO	admin	79315
Epernay	FR	minor	22671
Ornskoldsvik	SE	minor	27749
Sarvar	HU	minor	15072
Sa Kaeo	TH	admin	17864
Sabha	LY	admin	116016
Ciudad Rio Bravo	MX	minor	101481
Bannu	PK	minor	62191
Taphan Hin	TH	minor	15329
Delcevo	MK	admin	11500
Jaunpils	LV	admin	0
Ad Dali`	YE	admin	0
Dobrich	BG	admin	104530
Mexicaltzingo	MX	minor	10161
Kitale	KE	admin	63245
Ciro Redondo	CU	minor	28370
Jincheng	TW	admin	0
Esbjerg	DK	minor	72205
Siauliai	LT	admin	107086
Mafra	PT	minor	76685
Takestan	IR	minor	73625
Hithadhoo	MV	admin	0
Comendador	DO	minor	43894
Phanat Nikhom	TH	minor	11032
Ch'iatura	GE	minor	12803
Yakacik	TR	minor	41409
Sankt Veit an der Glan	AT	minor	12547
Ikskile	LV	admin	6597
Indija	RS	admin	0
Fonadhoo	MV	admin	0
Karbinci	MK	admin	0
Gorzow Wielkopolski	PL	admin	124295
Kriva Palanka	MK	admin	14558
Namayingo	UG	admin	0
Loei	TH	admin	22339
Perote	MX	minor	37516
Ikaalinen	FI	minor	7207
Ajaccio	FR	admin	70659
Gornja Radgona	SI	admin	3052
Pecinci	RS	admin	0
Debar	MK	admin	14561
Bronnoysund	NO	minor	5050
Gwadar	PK	minor	51901
Hualien	TW	admin	109251
Szerencs	HU	minor	8676
Cadiz	ES	minor	116027
Parras de la Fuente	MX	minor	45423
Birstonas	LT	admin	2422
Pathum Thani	TH	admin	13987
Ikeja	NG	admin	0
Tengyue	CN	minor	126058
Ciudad Lerdo	MX	minor	79669
Opochka	RU	minor	10148
Neumunster	DE	minor	79487
Nazare	PT	minor	15158
Heves	HU	minor	10275
San Salvador	MX	minor	28637
Sumeg	HU	minor	6037
Bilasuvar	AZ	admin	22800
Jutiapa	GT	admin	50681
Yayladagi	TR	minor	35460
Udon Thani	TH	admin	130274
Kyegegwa	UG	admin	0
Buabidi	PA	admin	0
Shariff Aguak	PH	admin	0
Wangdue Phodrang	BT	admin	5000
Soke	TR	minor	77341
Escaldes-Engordany	AD	admin	0
Buala	SB	admin	0
Naas	IE	admin	21393
Belize City	BZ	admin	57169
Cha-am	TH	minor	35581
Kouvola	FI	admin	85855
Michalovce	SK	minor	39151
Tatabanya	HU	admin	65845
Tank	PK	minor	44996
Same	TL	admin	2100
Arafat	MR	admin	0
Lindi	TZ	admin	41549
Danilovgrad	ME	admin	0
Jinzhong	CN	minor	5170
Villa de Alvarez	MX	minor	117600
Al Fujayrah	AE	admin	93673
Dinguiraye	GN	minor	6062
Chachoengsao	TH	admin	39570
Koutiala	ML	minor	104927
Ainaro	TL	admin	15558
Ravensburg	DE	minor	50623
Bakhmut	UA	minor	75798
Shaqlawah	IQ	minor	25000
Wa	GH	admin	78107
Kutno	PL	minor	47557
Chapa de Mota	MX	minor	21746
Tubod	PH	admin	0
Tamuin	MX	minor	35446
Orimattila	FI	minor	16326
Calapan	PH	admin	133893
San Pedro Garza Garcia	MX	minor	122009
Kitzbuhel	AT	minor	8272
Ingeniero Guillermo N. Juarez	AR	minor	6453
Baranivka	UA	minor	11765
Revuca	SK	minor	12249
Lyantonde	UG	admin	0
Nautla	MX	minor	2890
Napier	NZ	admin	62800
Agsu	AZ	admin	20200
San Jose de Gracia	MX	minor	8896
Valenciennes	FR	minor	43336
Nykoping	SE	admin	33546
Gmund	AT	minor	5375
Jursinci	SI	admin	0
Kunhegyes	HU	minor	7521
Alquizar	CU	minor	29616
Skadovs'k	UA	minor	18482
Ape	LV	admin	876
Plock	PL	minor	120000
Barletta	IT	minor	107830
Acatlan	MX	minor	17914
Tandil	AR	minor	116917
Xanthi	GR	minor	56122
Uthai Thani	TH	admin	15434
Aurillac	FR	minor	25499
Ardanuc	TR	minor	12056
Miranda do Corvo	PT	minor	13098
Czluchow	PL	minor	14625
Nan	TH	admin	20595
Borgo Maggiore	SM	admin	0
Slovenska Bistrica	SI	admin	0
Pinhel	PT	minor	9627
Voinjama	LR	admin	26594
Wexford	IE	admin	0
Avignon	FR	minor	93671
Kraljevo	RS	admin	66688
Dubrowna	BY	minor	7100
Swiecie	PL	minor	26026
Puerto Natales	CL	minor	19023
Escuinapa	MX	minor	30790
Xochistlahuaca	MX	minor	28089
Yeysk	RU	minor	85760
Nowshera	PK	minor	118594
Navoiy	UZ	admin	0
Golubac	RS	admin	0
Groningen	SR	admin	3216
Damghan	IR	minor	57331
Hohoe	GH	\N	56202
Virac	PH	admin	0
Gornji Petrovci	SI	admin	0
Balanga	PH	admin	96061
Waterford	IE	admin	48369
Las Tablas	PA	admin	9255
Axapusco	MX	minor	21915
Belisce	HR	minor	7197
Lindong	CN	minor	50000
Kerewan	GM	admin	2751
Belen	AR	minor	11359
Wewak	PG	admin	25143
Mezotur	HU	minor	16086
Segou	ML	admin	133501
Caimito	CU	minor	36813
Puerto Limon	CR	admin	61072
Ouahigouya	BF	admin	79504
Abomey	BJ	admin	82154
Komijan	IR	minor	7358
Freudenstadt	DE	minor	23442
Antony	FR	minor	62570
Toijala	FI	minor	17043
Carpentras	FR	minor	28309
Ntchisi	MW	admin	0
Montpelier	US	admin	7372
Lhuentse	BT	admin	0
Kulhudhuffushi	MV	admin	0
Tecolutla	MX	minor	24258
Gyal	HU	minor	23628
Bochnia	PL	minor	30075
Sankt Gallen	CH	admin	75833
Kufstein	AT	minor	19223
Iringa	TZ	admin	111820
Donji Miholjac	HR	minor	6226
Tomislavgrad	BA	minor	5760
Tlachichilco	MX	minor	10729
Zebbug	MT	admin	0
Bokhtar	TJ	admin	75450
Benjamin Hill	MX	minor	5285
Puerto Maldonado	PE	admin	85024
Sibenik	HR	admin	46332
Zarrin Shahr	IR	minor	55984
Nguru	NG	minor	111014
Cramahe	CA	\N	6355
Swidnik	PL	minor	42797
Boljevac	RS	admin	0
Phra Pradaeng	TH	minor	10190
Morondava	MG	minor	36803
Neves	ST	admin	0
Girardot	CO	minor	130289
Louang Namtha	LA	admin	3225
Brzeg	PL	minor	36541
Trollhattan	SE	minor	44543
Guanajay	CU	minor	22839
Oroszlany	HU	minor	18171
Loikaw	MM	admin	11000
Harjavalta	FI	minor	7296
Wabag	PG	admin	3958
Valle de Bravo	MX	minor	61559
Nazarje	SI	admin	0
Chitipa	MW	admin	13412
Hato Mayor	DO	minor	35999
Vasteras	SE	admin	127799
Galle	LK	admin	99478
Loimaa	FI	minor	16467
Dol	SI	admin	0
Pervomaiskyi	UA	minor	30048
Hassa	TR	minor	56409
Ixtlahuaca	MX	minor	126505
Ilhavo	PT	minor	40349
Murang'a	KE	admin	0
Opole	PL	admin	127792
Asau	WS	admin	0
Kabugao	PH	admin	0
Juchitan de Zaragoza	MX	minor	74825
General Juan Madariaga	AR	minor	18089
Ebolowa	CM	admin	87875
Bardejov	SK	minor	32587
Korosten	UA	minor	63525
Andrijevica	ME	admin	0
Saratamata	VU	admin	0
Kaga Bandoro	CF	admin	24661
Marand	IR	minor	130825
Trindade	ST	admin	6636
Tulcan	EC	admin	53558
Macenta	GN	minor	43102
Mut	TR	minor	62853
Mongu	ZM	admin	52534
Mora	SE	minor	12858
Selibaby	MR	admin	460
Empalme	MX	minor	42516
Albergaria-a-Velha	PT	minor	25252
Colon	CU	minor	72000
Dangriga	BZ	admin	9096
Zhanggu	CN	minor	70000
Halba	LB	admin	0
Chalons-en-Champagne	FR	minor	44753
Poiares	PT	minor	7281
Siena	IT	minor	53772
Kalaki	UG	admin	0
Aracinovo	MK	admin	0
Tarin Kot	AF	admin	10000
Sisak	HR	admin	33322
Lubben	DE	minor	14024
Al Bahah	SA	admin	95089
Svyetlahorsk	BY	minor	80700
Sampit	ID	minor	92710
Polygyros	GR	minor	6121
Nueva Paz	CU	minor	24277
Ayancik	TR	minor	23720
Jaque	PA	minor	1357
Wittenberg	DE	minor	46008
Murca	PT	minor	5952
Abakaliki	NG	admin	0
Appenzell	CH	admin	5649
Megalopoli	GR	minor	5748
Guidan Roumdji	NE	minor	17525
Partizanske	SK	minor	22653
Zgornja Kungota	SI	admin	0
Candelaria	MX	minor	9812
Sangre Grande	TT	admin	0
San Nicolas Tolentino	MX	minor	5547
Kuacjok	SS	admin	0
Kolobrzeg	PL	minor	46716
Fada	TD	admin	448
Merosina	RS	admin	0
Moa	CU	minor	57652
Novi Knezevac	RS	admin	0
Preveza	GR	minor	19042
Murtosa	PT	minor	10585
Tamanrasset	DZ	admin	76000
Ruse	SI	admin	7351
Coroneo	MX	minor	10347
Bad Durkheim	DE	minor	18476
Bamberg	DE	minor	77592
Songea	TZ	admin	99961
Nafpaktos	GR	minor	13415
Kalampaka	GR	minor	8330
Putyvl'	UA	minor	15778
Jarabulus	SY	minor	11570
Tenango de Doria	MX	minor	15793
Dobrush	BY	minor	18300
Chudniv	UA	minor	5583
Mositai	CN	minor	102214
Bouira	DZ	admin	68545
Haparanda	SE	minor	6642
Tecoman	MX	minor	112726
San Jose de Aerocuar	VE	minor	11162
Hildburghausen	DE	minor	11836
Deutschlandsberg	AT	minor	11604
Al Qunaytirah	SY	admin	37022
Wieliczka	PL	minor	21878
Rozhyshche	UA	minor	12953
Babahoyo	EC	admin	90191
Castanos	MX	minor	22401
Alpiarca	PT	minor	7702
Nanterre	FR	minor	95105
Sembabule	UG	admin	0
Vinh Yen	VN	admin	0
Harper	LR	admin	32661
Gaalkacyo	SO	admin	61200
Vitanje	SI	admin	0
Vannes	FR	minor	53352
Feldbach	AT	minor	13369
Kyankwanzi	UG	admin	0
Sveta Ana	SI	admin	0
Cochem	DE	minor	5312
Brus	RS	admin	0
Kuusamo	FI	minor	15688
Hoh Ereg	CN	minor	23776
Adygeysk	RU	minor	12745
Atlatlahucan	MX	minor	22079
Kozina	SI	admin	0
I`zaz	SY	minor	31534
Rapperswil-Jona	CH	minor	26989
Novo Selo	MK	admin	2829
Istres	FR	minor	43133
Karuzi	BI	admin	10705
Lukovica	SI	admin	0
Jamsa	FI	minor	21542
Sieradz	PL	minor	42120
Kilis	TR	admin	116034
Wangqing	CN	minor	88732
Dornbirn	AT	minor	48067
Lubango	AO	admin	0
Fort Liberte	HT	admin	11465
Byumba	RW	admin	34544
Ergli	LV	admin	0
Ulcinj	ME	admin	19921
Mersrags	LV	admin	0
Penonome	PA	admin	28766
Darnah	LY	admin	127974
Alba Iulia	RO	admin	63536
Lamu	KE	admin	18382
Anyksciai	LT	admin	9190
Altay	MN	admin	15800
Paide	EE	admin	7905
Nevers	FR	minor	32990
Smarde	LV	admin	0
Pamplona	CO	minor	53587
Coutances	FR	minor	8501
Barvynkove	UA	minor	8660
Espargos	CV	admin	6173
Nong Khai	TH	admin	48274
Ma`arratmisrin	SY	minor	37490
Nara	ML	minor	18459
Naco	MX	minor	6401
Forchheim	DE	minor	32171
Porto Ingles	CV	admin	3056
Saint Ann's Bay	JM	admin	13671
Tutong	BN	admin	0
Kristianstad	SE	minor	32188
Saarlouis	DE	minor	34552
Oudenaarde	BE	minor	31132
Lubartow	PL	minor	22138
Sinnamary	GF	minor	3180
Victoria	MT	admin	0
Ozolnieki	LV	admin	0
Dun Dealgan	IE	admin	39004
Lahti	FI	admin	118119
Tamazunchale	MX	minor	72685
Chateauroux	FR	minor	43741
Parkano	FI	minor	6766
Tyrnyauz	RU	minor	20513
Almyros	GR	minor	7955
Kaufbeuren	DE	minor	43893
Jurado	CO	minor	2351
Amvrosiivka	UA	minor	18413
Virovitica	HR	admin	21291
Ben Arous	TN	admin	0
Nykarleby	FI	minor	7564
Lujan	AR	minor	81749
Burco	SO	admin	0
Sagua la Grande	CU	minor	53077
Melun	FR	minor	40032
Oborniki	PL	minor	17895
Hofheim	DE	minor	39766
Santiago Tulantepec	MX	minor	16078
Florida	CU	minor	71676
Znam'yanka	UA	minor	22936
Chimboy Shahri	UZ	minor	36917
Donduseni	MD	admin	7101
Arras	FR	minor	41019
Delemont	CH	admin	12682
Labin	HR	minor	11642
Wunsiedel	DE	minor	9259
Busesa	UG	admin	0
Mazyr	BY	minor	105700
Durdevac	HR	minor	8862
Tena	EC	admin	23307
Montabaur	DE	minor	13691
Cartago	CO	minor	134827
Palmerston North	NZ	admin	80300
Louangphabang	LA	admin	53792
Narva	EE	minor	57130
Kabale	UG	admin	44600
Novaci	MK	admin	0
Altamira	MX	minor	59536
Susa	AZ	admin	0
Tchibanga	GA	admin	19365
Choybalsan	MN	admin	38150
Sentilj	SI	admin	0
Chartres	FR	minor	38578
Meschede	DE	minor	29921
Wil	CH	minor	23768
Busia	UG	admin	47100
Penjamo	MX	minor	40076
Moimenta da Beira	PT	minor	10212
Leiria	PT	admin	126897
Salto	UY	admin	124878
Remich	LU	admin	3732
Ponte de Sor	PT	minor	16722
Forde	NO	minor	10339
Vratsa	BG	admin	69493
Pori	FI	admin	85363
's-Hertogenbosch	NL	admin	134520
Arlon	BE	minor	29733
Pombal	PT	minor	55217
Tartu	EE	admin	93865
Vladicin Han	RS	admin	0
Zelenikovo	MK	admin	0
Zapotlan de Juarez	MX	minor	16493
Rustavi	GE	admin	125103
Pembroke	MT	admin	0
Dolisie	CG	admin	103894
Mayskiy	RU	minor	27074
Hradec Kralove	CZ	admin	92939
Leova	MD	admin	7443
Serres	GR	minor	58287
Swords	IE	admin	33998
Suileng	CN	minor	57789
Magong	TW	admin	56435
Geita	TZ	admin	1536
Sayhut	YE	minor	189
Battambang	KH	admin	130000
Punta Gorda	BZ	admin	5026
Sines	PT	minor	14238
Thoen	TH	minor	15360
Totontepec Villa de Morelos	MX	minor	5361
Crnomelj	SI	admin	0
Santa Rosa de Copan	HN	admin	56000
Kegums	LV	admin	2159
Shali	RU	minor	53807
Kombissiri	BF	minor	30137
Bogande	BF	minor	9854
Huanimaro	MX	minor	19693
Ulvila	FI	minor	13237
Fier	AL	admin	120655
Buurhakaba	SO	minor	31267
Staro Nagoricane	MK	admin	0
Hanko	FI	minor	8864
Pul-e `Alam	AF	admin	0
Borlange	SE	minor	39422
Gryfino	PL	minor	21555
Altenkirchen	DE	minor	6263
Luneburg	DE	minor	75351
Singerei	MD	admin	12465
Yany Kapu	UA	minor	25769
Sarpol-e Zahab	IR	minor	34632
Kumanovo	MK	admin	70842
Figueira da Foz	PT	minor	62125
Tierra Colorada	MX	minor	10502
Campo Maior	PT	minor	8456
Sveti Nikole	MK	admin	13746
Sarur	AZ	admin	0
Povoa de Lanhoso	PT	minor	21886
Haciqabul	AZ	admin	21504
Sant Julia de Loria	AD	admin	0
Prokhladnyy	RU	minor	57883
Bad Ems	DE	minor	9681
Serpa	PT	minor	15623
Kapsabet	KE	admin	0
Nove Mesto nad Vahom	SK	minor	20066
Soma	TR	minor	108981
Ta' Xbiex	MT	admin	0
Ciudad Manuel Doblado	MX	minor	38309
Kiato	GR	minor	9812
Recica	SI	admin	0
Hamrun	MT	admin	0
Sukhothai	TH	admin	15618
Gomez Farias	MX	minor	5330
Ahumada	MX	minor	8575
Takhli	TH	minor	24563
Tlalpujahua de Rayon	MX	minor	27788
Abasolo	MX	minor	27389
Ghasri	MT	admin	0
Lukavac	BA	minor	46731
Aranguez	TT	admin	0
Pursat	KH	admin	52476
Tukums	LV	admin	17075
Poso	ID	minor	47110
Schwabach	DE	minor	40792
Druskininkai	LT	admin	12576
Coalcoman de Vazquez Pallares	MX	minor	10715
Nesebar	BG	minor	13559
Ouidah	BJ	admin	83503
Pedernales	DO	minor	11072
Lens	FR	minor	31415
Hopelchen	MX	minor	7295
Labe	GN	admin	107695
Tizimin	MX	minor	46971
Moita	PT	minor	66029
Orange Walk	BZ	admin	18000
Cagua	VE	minor	122571
Leer	DE	minor	34486
Jose Maria Morelos	MX	minor	11750
Pultusk	PL	minor	19229
Schellenberg	LI	admin	0
Lousa	PT	minor	17604
Lampang	TH	admin	55044
Encamp	AD	admin	0
Kallithea	GR	minor	100641
Laitila	FI	minor	8520
Higuey	DO	minor	123787
Guerrero	MX	minor	7751
Ushuaia	AR	admin	56956
Bakhchysaray	UA	minor	27351
Allende	MX	minor	20694
Ometepec	MX	minor	30271
Pergamino	AR	minor	87652
Les Sables-d'Olonne	FR	minor	44017
Kirkenes	NO	minor	3529
Landeck	AT	minor	7725
Pinarbasi	TR	minor	26911
Yuanquan	CN	minor	17886
Lancut	PL	minor	17749
Mpanda	TZ	admin	73338
Kurdamir	AZ	admin	15385
Svitlovods'k	UA	minor	45312
Lom Sak	TH	minor	12290
Quillota	CL	minor	90517
Egersund	NO	minor	11433
Drammen	NO	minor	90722
Coatepec	MX	minor	92127
Przemysl	PL	minor	67847
Siguiri	GN	minor	50159
Salaspils	LV	admin	16616
Altamirano	MX	minor	9200
Campobasso	IT	admin	50762
Vipava	SI	admin	0
Makamba	BI	admin	9396
Romita	MX	minor	51825
Amozoc	MX	minor	60517
Veszprem	HU	admin	59738
Spisska Nova Ves	SK	minor	37326
Dokolo	UG	admin	0
Bjelovar	HR	admin	40276
Kozje	SI	admin	0
Punakha	BT	admin	5000
Kotli	PK	minor	21462
Hayma'	OM	admin	0
Kebili	TN	admin	19875
Lampazos de Naranjo	MX	minor	5305
Kleve	DE	minor	51845
Ylivieska	FI	minor	15039
Kokkola	FI	admin	47570
Kaedi	MR	admin	0
Krabi	TH	admin	30499
Flensburg	DE	minor	90164
Kocevje	SI	admin	0
Lokossa	BJ	admin	86971
Guadalupe	ST	admin	0
Reutlingen	DE	minor	115966
Alavus	FI	minor	12044
Kismaayo	SO	admin	73300
Benevento	IT	minor	61791
Piacenza	IT	minor	103082
Szentlorinc	HU	minor	6184
Caceres	ES	minor	96126
Fribourg	CH	admin	38365
Mosta	MT	admin	0
Xaignabouli	LA	admin	16200
Bad Schwalbach	DE	minor	11187
Porec	HR	minor	7585
Maribor	SI	admin	112325
Gwanda	ZW	admin	14450
Calabozo	VE	minor	131989
Subotica	RS	admin	105681
Grand-Bassam	CI	minor	73772
Forli	IT	minor	117859
Cegled	HU	minor	35523
Giresun	TR	admin	135920
Kula	RS	admin	0
Dunajska Streda	SK	minor	22643
Trzin	SI	admin	0
Moroleon	MX	minor	41909
Abeche	TD	admin	76492
Ha Giang	VN	admin	38362
Ilam	IR	admin	0
Malacky	SK	minor	17430
Ihosy	MG	minor	16990
Son La	VN	admin	19054
Gastre	AR	minor	602
Turbo	CO	minor	50508
Bongao	PH	admin	0
Tarrafal	CV	admin	0
Khashuri	GE	minor	28500
Tlumach	UA	minor	8886
Chortoq	UZ	minor	35615
Diffa	NE	admin	30988
Rohatyn	UA	minor	7797
Gisborne	NZ	admin	35500
San Cristobal	CU	minor	29119
Koprivnica	HR	admin	0
Izyum	UA	minor	13108
Liberec	CZ	admin	104802
Zongolica	MX	minor	43871
Tidaholm	SE	minor	8233
Bajina Basta	RS	admin	26022
Kicevo	MK	admin	27067
Ghat	LY	admin	22000
Miren	SI	admin	0
Phongsali	LA	admin	15083
San Juan del Sur	NI	minor	7790
Al Hayy	IQ	minor	82900
Kruhlaye	BY	minor	7600
Liquica	TL	admin	5152
Bosanska Krupa	BA	minor	29659
Pirna	DE	minor	38316
Tra Vinh	VN	admin	131360
Veinticinco de Mayo	AR	minor	23408
Cicevac	RS	admin	0
Rottenmann	AT	\N	5232
Figueira de Castelo Rodrigo	PT	minor	6260
La Palma	PA	admin	1845
Jiblah	YE	minor	15431
Beaune	FR	minor	21031
Cuprija	RS	admin	0
Luganville	VU	admin	13397
Falmouth	JM	admin	7779
Biak	ID	minor	103610
Tezontepec	MX	minor	10723
Contamana	PE	minor	18921
Livadeia	GR	minor	21379
Zavrc	SI	admin	0
Pfaffikon	CH	minor	11817
Ashtarak	AM	admin	21600
Yasynuvata	UA	minor	35303
Castro Verde	PT	minor	7276
Sentjernej	SI	admin	0
Anenii Noi	MD	admin	10872
Mayari	CU	minor	102354
Oleiros	PT	minor	5721
General Toshevo	BG	minor	7157
Coesfeld	DE	minor	36217
Euskirchen	DE	minor	57975
Dolyns'ka	UA	minor	19287
Chamical	AR	minor	8989
Kanoni	UG	admin	0
Nsanje	MW	admin	21774
Apan	MX	minor	39247
Dornava	SI	admin	0
Selibe Phikwe	BW	admin	49724
Heredia	CR	admin	22700
Kandava	LV	admin	3651
Ibrany	HU	minor	6648
Stryy	UA	minor	59325
Guadalupe y Calvo	MX	minor	5816
Santa Catarina	MX	minor	5120
Ratzeburg	DE	minor	14652
Bovec	SI	admin	0
Zarate	AR	minor	98522
Zacatepec	MX	minor	36159
Kocani	MK	admin	28330
Gardez	AF	admin	103601
Moss	NO	minor	36901
Bosanski Petrovac	BA	minor	7946
Krong Kep	KH	admin	35990
Zgornje Jezersko	SI	admin	0
Sveti Jurij	SI	admin	0
Chaumont	FR	minor	21945
Balingen	DE	minor	34217
Armavir	AM	admin	28800
Broceni	LV	admin	2779
Mingacevir	AZ	admin	98800
Xacmaz	AZ	admin	39900
Lulea	SE	admin	48749
Visaginas	LT	admin	18514
Impfondo	CG	admin	20859
Calarasi	RO	admin	65181
Sagaing	MM	admin	69917
Habo	SE	minor	8455
Calais	FR	minor	73911
Tangdukou	CN	minor	45617
Maasin	PH	admin	85560
Samux	AZ	admin	0
Spodnji Duplek	SI	admin	0
Bruck an der Leitha	AT	minor	7887
Derventa	BA	minor	12680
Faizabad	AF	admin	64704
Mira	PT	minor	12465
Strumica	MK	admin	45087
Ciudad Constitucion	MX	minor	45888
Aleksandrovac	RS	admin	0
Razgrad	BG	admin	41909
Drohobych	UA	minor	98015
Polatli	TR	minor	125075
Herford	DE	minor	66608
Gjovik	NO	minor	22719
Marsa Matruh	EG	admin	68339
Mayuge	UG	admin	0
Bunia	CD	admin	96764
Kotor	ME	admin	0
Peine	DE	minor	49952
Lugo	ES	minor	98276
Glodeni	MD	admin	8676
Aranyaprathet	TH	minor	16211
Haapavesi	FI	minor	7167
Pagegiai	LT	admin	0
Banes	CU	minor	34452
Isfara	TJ	minor	40000
Vianden	LU	admin	0
Jocotitlan	MX	minor	55403
Amarante	PT	minor	56264
Gudja	MT	admin	0
Babati	TZ	admin	30975
Porvoo	FI	minor	49928
Litvinov	CZ	\N	23661
Basarabeasca	MD	admin	8471
Drama	GR	minor	44823
Kasungu	MW	admin	0
Potiskum	NG	minor	86002
Mambajao	PH	admin	0
Buje	HR	minor	5182
Velenje	SI	admin	25333
Kayunga	UG	admin	21704
Smartno	SI	admin	0
Blagoevgrad	BG	admin	82606
Espita	MX	minor	11551
Zumpango del Rio	MX	minor	24719
Rubanda	UG	admin	0
Guastatoya	GT	admin	20050
Svolvaer	NO	minor	4686
Prijedor	BA	minor	89397
Karak	PK	minor	35844
Semic	SI	admin	0
Shinyanga	TZ	admin	107362
Merauke	ID	minor	34412
Aalborg	DK	admin	122219
Ixtenco	MX	minor	6791
Evinayong	GQ	admin	9155
Odemis	TR	minor	132511
Novi Pazar	RS	admin	66527
Tavira	PT	minor	26167
Valozhyn	BY	minor	9700
Spodnja Hajdina	SI	admin	0
Santa Lucia	VE	minor	112357
Baltinava	LV	admin	0
Morant Bay	JM	admin	0
Ciudad Melchor de Mencos	GT	minor	20273
Bayombong	PH	admin	0
Vidin	BG	admin	58018
Trzebnica	PL	minor	13161
Kalajoki	FI	minor	12621
Musoma	TZ	admin	103497
Poprad	SK	minor	52037
Sabugal	PT	minor	12544
Makole	SI	admin	0
Jogeva	EE	admin	5073
Tapalpa	MX	minor	19506
Forbach	FR	minor	21552
Emiliano Zapata	MX	minor	39702
Bindura	ZW	admin	46275
Dessau-Rosslau	DE	minor	81237
Tikrit	IQ	admin	105700
Wolfsburg	DE	minor	124151
Khan Shaykhun	SY	minor	55843
Kiskoros	HU	minor	13833
Bottrop	DE	minor	117383
Jilotlan de los Dolores	MX	minor	9917
Shahreza	IR	minor	134592
Menongue	AO	admin	13030
Buzau	RO	admin	115494
Dipolog	PH	admin	130759
Nisa	PT	minor	7450
Karkamis	TR	minor	10436
Olhao	PT	minor	45396
Jaltipan de Morelos	MX	minor	41644
Labuan	MY	admin	0
Arilje	RS	admin	0
Jagodina	RS	admin	0
Kekava	LV	admin	0
Tullamore	IE	admin	0
Zirovnica	SI	admin	0
Cankiri	TR	admin	96025
Negotino	MK	admin	13284
Puerto Penasco	MX	minor	62177
Gorlitz	DE	minor	56324
Landau	DE	minor	46677
Catarman	PH	admin	0
Schwerin	DE	admin	95818
Kankaanpaa	FI	minor	11769
Yozgat	TR	admin	105167
Bangar	BN	admin	0
Zabalj	RS	admin	9161
Budva	ME	admin	19218
Rukungiri	UG	admin	0
Gostynin	PL	minor	19414
Sobral de Monte Agraco	PT	minor	10156
Al Ghayzah	YE	admin	27404
Bad Fallingbostel	DE	minor	11852
Rio Cuarto	AR	minor	158
Torit	SS	admin	17957
Busia	KE	admin	30777
Orlu	NG	minor	9351
Krymsk	RU	minor	57229
Lorica	CO	minor	52771
Robertsport	LR	admin	11969
Enerhodar	UA	minor	53567
Don Sak	TH	minor	11934
Qarqan	CN	minor	32494
Bolama	GW	admin	4819
Mongo	TD	admin	27763
Rosso	MR	admin	47203
Straza	SI	admin	0
Rubirizi	UG	admin	0
Lucerne	CH	admin	81691
Vainode	LV	admin	0
Moussoro	TD	admin	16349
Snina	SK	minor	19855
Amatlan de los Reyes	MX	minor	9123
Vidigueira	PT	minor	5932
Hezuo	CN	minor	90290
Mamuju	ID	admin	0
Tierra Blanca	MX	minor	14515
Kormend	HU	minor	11236
Koumra	TD	admin	39852
Starnberg	DE	minor	23498
Choix	MX	minor	9306
Annecy	FR	minor	126924
Tari	PG	admin	0
Apaxco de Ocampo	MX	minor	13836
Obera	AR	minor	66112
Floro	NO	minor	8925
Kamphaeng Phet	TH	admin	29178
Krupki	BY	minor	8500
Mezica	SI	admin	0
Chaves	PT	minor	41243
Guaranda	EC	admin	23874
Chinsali	ZM	admin	14015
Bougouni	ML	minor	35450
Qacha's Nek	LS	admin	0
Idanha-a-Nova	PT	minor	9716
Ciechanow	PL	minor	46112
Zabari	RS	admin	0
Kohima	IN	admin	99039
Krotoszyn	PL	minor	29379
Tolcayuca	MX	minor	11746
Santarem	PT	admin	62200
Kraslava	LV	admin	7978
Lavrio	GR	minor	7078
Moron	CU	minor	59371
Panuco	MX	minor	33122
Tychy	PL	minor	129322
Kouroussa	GN	minor	14223
Ramotswa	BW	admin	0
La Chaux-de-Fonds	CH	minor	38965
Yen Bai	VN	admin	96540
Sannat	MT	admin	0
Roznava	SK	minor	19190
Komlo	HU	minor	22635
Panindicuaro	MX	minor	5565
Andrushivka	UA	minor	8606
Scarborough	TT	admin	0
Chalandri	GR	minor	74192
Tolanaro	MG	minor	16818
Leczna	PL	minor	21802
Crikvenica	HR	minor	11122
Oyam	UG	admin	0
Swieqi	MT	admin	0
Pavlovsk	RU	minor	24858
Dubrovytsya	UA	minor	9424
Csongrad	HU	minor	16027
Tubmanburg	LR	admin	0
Ponta do Sol	CV	admin	0
Delmenhorst	DE	minor	77607
Zagubica	RS	admin	0
Tabora	TZ	admin	127880
Ramos Arizpe	MX	minor	48228
Stalbe	LV	admin	0
Malargue	AR	minor	11847
Troyes	FR	minor	61652
Anouvong	LA	admin	0
Zalec	SI	admin	0
Ceske Budejovice	CZ	admin	94463
Rogaska Slatina	SI	admin	0
`Afrin	SY	minor	36562
Juventino Rosas	MX	minor	65479
Tutin	RS	admin	0
Vale de Cambra	PT	minor	22864
Kalungu	UG	admin	0
Det Udom	TH	minor	14264
Singa	SD	admin	0
Jablah	SY	minor	75505
Bimbo	CF	admin	124176
Neno	MW	admin	0
El Fuerte	MX	minor	12566
Gavle	SE	admin	68635
Nisporeni	MD	admin	10063
Kiskunmajsa	HU	minor	10968
Zrnovci	MK	admin	0
San Antonio de los Banos	CU	minor	33811
Fray Bentos	UY	admin	24406
Zaraza	VE	minor	62027
Anatuya	AR	minor	14133
Canelones	UY	admin	19698
Smarje	SI	admin	0
Zamora	EC	admin	12386
Xocavand	AZ	admin	0
Ivancna Gorica	SI	admin	0
Evora	PT	admin	55620
Tessalit	ML	minor	6000
Canatlan	MX	minor	10342
Santa Maria Huazolotitlan	MX	minor	11400
Akhaltsikhe	GE	admin	17903
Boulsa	BF	minor	17489
Aizkraukle	LV	admin	7745
Sombor	RS	admin	51471
Plandiste	RS	admin	0
Aglona	LV	admin	0
Dabas	HU	minor	17023
Namestovo	SK	minor	7876
Aridaia	GR	minor	6561
Tagbilaran City	PH	minor	105051
Malbork	PL	minor	38895
Al Mayadin	SY	minor	48922
Jena	DE	minor	111407
Banska Stiavnica	SK	minor	10097
Yomou	GN	minor	3614
Ambatondrazaka	MG	minor	43134
Temixco	MX	minor	116143
Belaya Kalitva	RU	minor	40275
Tearce	MK	admin	0
Panaba	MX	minor	5232
Alvarado	MX	minor	22330
Cham	DE	minor	16907
Samamea	WS	admin	0
Jesus Maria	AR	minor	31602
Salama	GT	admin	56359
Chitral	PK	minor	31100
Zacatelco	MX	minor	38466
Ukmerge	LT	admin	21226
Forst	DE	minor	18164
Marondera	ZW	admin	52283
Slawharad	BY	minor	7900
San Bartolo Tutotepec	MX	minor	17837
Arendal	NO	admin	30916
Shakhtarsk	UA	minor	49482
Acambay	MX	minor	56847
Traunstein	DE	minor	20520
Jalpa de Mendez	MX	minor	83356
Tillaberi	NE	admin	19262
Nieuw Nickerie	SR	admin	12818
Hoganas	SE	minor	15795
Senec	SK	minor	19410
Zorgo	BF	minor	23892
Bucak	TR	minor	64943
Eynesil	TR	minor	13955
Harasta	SY	minor	45974
Pivka	SI	admin	0
Setubal	PT	admin	121185
Cobija	BO	admin	46267
Ban Houayxay	LA	admin	17687
Kiskunhalas	HU	minor	27017
Point Fortin	TT	admin	0
Dobje	SI	admin	0
Leo	BF	minor	26884
Port Loko	SL	admin	0
Kam'yanets'-Podil's'kyy	UA	minor	100462
Roeselare	BE	minor	62301
Cabudare	VE	minor	70578
Koulamoutou	GA	admin	16222
Choele Choel	AR	minor	10146
Bonao	DO	minor	73269
Jordan	PH	admin	0
Rutana	BI	admin	20893
Mindelheim	DE	minor	15002
Beeskow	DE	minor	8042
Hecelchakan	MX	minor	10285
Kamien Pomorski	PL	minor	9144
Marco de Canavezes	PT	minor	53450
Berberati	CF	admin	76918
Derbent	RU	minor	123720
Ostrowiec Swietokrzyski	PL	minor	72001
Yevlax	AZ	admin	59036
Buta	CD	admin	45677
Namsan	KP	minor	80146
Kokemaki	FI	minor	7591
Herceg Novi	ME	admin	16493
Vynohradiv	UA	minor	25403
Septemvri	BG	minor	8813
Jaral del Progreso	MX	minor	31780
`Amuda	SY	minor	47580
San Blas	MX	minor	37478
Mistelbach	AT	minor	11559
Zweibrucken	DE	minor	34209
Nyirbator	HU	minor	11831
Ebebiyin	GQ	admin	36565
Lwengo	UG	admin	0
Saint-Georges	GF	minor	2742
Kericho	KE	admin	30023
Cambrai	FR	minor	32558
Nysa	PL	minor	46841
Al Kharijah	EG	admin	49991
Malinalco	MX	minor	22970
Kungur	RU	minor	65284
Ravne na Koroskem	SI	admin	0
Ivanjica	RS	admin	0
Saynshand	MN	admin	8776
Viersen	DE	minor	76905
Tarnobrzeg	PL	minor	47816
Schaan	LI	admin	5959
Moyo	UG	admin	22434
Sebezh	RU	minor	5401
Naifaru	MV	admin	0
Namur	BE	admin	110939
Luchow	DE	minor	9420
Bela Palanka	RS	admin	0
Vilaka	LV	admin	1309
El Banco	CO	minor	54522
Dapaong	TG	admin	0
Pasvalys	LT	admin	6768
Prienai	LT	admin	8610
Montbeliard	FR	minor	25395
Ende	ID	minor	77205
Benito Juarez	AR	minor	10609
Tultepec	MX	minor	91808
Sharan	AF	admin	0
Gvardeysk	RU	minor	13227
El Higo	MX	minor	7844
Gorom-Gorom	BF	minor	6691
Rakitovo	BG	minor	8977
San Jose Villa de Allende	MX	minor	52641
Odzaci	RS	admin	9021
Bogatic	RS	admin	0
Sogamoso	CO	minor	126551
La Esmeralda	VE	minor	150
Vyetka	BY	minor	8300
Vrapciste	MK	admin	0
Finnsnes	NO	minor	3907
Isla Mujeres	MX	minor	12491
Marathonas	GR	minor	7170
Schleiz	DE	minor	8854
Nakhon Si Thammarat	TH	admin	106322
Despotovac	RS	admin	0
Djibo	BF	minor	22223
Samkir	AZ	admin	40600
Limbazi	LV	admin	7221
Tadmur	SY	minor	51323
Santo Domingo Tehuantepec	MX	minor	64639
Borazjan	IR	minor	110567
`Ibri	OM	admin	101640
Antratsyt	UA	minor	54640
Agua Prieta	MX	minor	79138
La Huacana	MX	minor	9374
Bekescsaba	HU	admin	58996
Phon-Hong	LA	admin	0
Negotin	RS	admin	0
Tall Abyad	SY	minor	14825
Safotulafai	WS	admin	0
Ilava	SK	minor	5485
Anadia	PT	minor	29150
Maralal	KE	admin	20841
Ciudad de Atlixco	MX	minor	125000
Lahij	YE	admin	30661
Bundibugyo	UG	admin	0
Lai Chau	VN	admin	0
Nang Rong	TH	minor	21493
Solcava	SI	admin	0
Zejtun	MT	admin	0
Ribnica	SI	admin	0
Balatonfured	HU	minor	12923
Vocklabruck	AT	minor	12179
Rujiena	LV	admin	2887
Pancevo	RS	admin	76203
Ruzomberok	SK	minor	26854
Kampong Chhnang	KH	admin	41700
Skriveri	LV	admin	0
Auxerre	FR	minor	34634
Beltinci	SI	admin	0
Marburg	DE	minor	76851
Lohja	FI	minor	47353
Razanj	RS	admin	0
Monastyryshche	UA	minor	8925
Bor	TR	minor	60335
Riebini	LV	admin	0
Mabaruma	GY	admin	2972
Panjakent	TJ	minor	33000
Salovci	SI	admin	0
Chilecito	AR	minor	33724
Tha Maka	TH	minor	11966
Kistelek	HU	minor	6917
Changling	CN	minor	55841
Wismar	DE	minor	42550
Lobatse	BW	admin	29700
Sanniquellie	LR	admin	11415
Neuburg	DE	minor	29682
Kars	TR	admin	112260
Chur	CH	admin	35038
Nenjiang	CN	minor	50000
Katerini	GR	minor	55997
Jaramana	SY	minor	114363
Sever do Vouga	PT	minor	12356
Ziniare	BF	admin	12703
Macedo de Cavaleiros	PT	minor	15776
Latina	IT	minor	126181
Qing'an	CN	minor	53206
Linxi	CN	minor	679
Vera	AR	minor	9979
Tizayuca	MX	minor	100563
Chios	GR	minor	26850
Concepcion del Uruguay	AR	minor	72528
Surat Thani	TH	admin	130703
Rosenheim	DE	minor	63324
Galeana	MX	minor	38930
Gardony	HU	minor	11204
Parnu	EE	admin	39438
Obidos	PT	minor	11689
Batocina	RS	admin	0
Torgau	DE	minor	20065
Xghajra	MT	admin	0
At-Bashy	KG	minor	15601
Baden-Baden	DE	minor	55123
Louga	SN	admin	85075
Kapuvar	HU	minor	10281
Kapenguria	KE	admin	0
Bambari	CF	admin	41356
Choyr	MN	admin	0
Shahin Dezh	IR	minor	34204
Tlaltenango de Sanchez Roman	MX	minor	58560
San Carlos	NI	admin	13451
Sandnes	NO	minor	58694
El Oro de Hidalgo	MX	minor	31847
Damongo	GH	admin	0
Serere	UG	admin	0
Kostel	SI	admin	0
Findikli	TR	minor	16902
Chambas	CU	minor	41000
Santa Maria del Tule	MX	minor	8918
Ostrow Mazowiecka	PL	minor	22800
Nguigmi	NE	minor	17897
Jaltenco	MX	minor	26359
Smila	UA	minor	68536
Santa Eulalia	MX	minor	7135
Dobrova	SI	admin	0
Umm Salal `Ali	QA	admin	0
Semera	ET	admin	0
Nangan	TW	admin	7382
Chum Phae	TH	minor	31597
Mehtar Lam	AF	admin	17345
Krupanj	RS	admin	0
We	NC	admin	0
Ligatne	LV	admin	1015
Nica	LV	admin	0
Upata	VE	minor	53685
Grieskirchen	AT	minor	5002
Dole	FR	minor	23708
Phetchaburi	TH	admin	23235
Zacatecoluca	SV	admin	39613
Kant	KG	minor	21589
Tyachiv	UA	minor	9019
Esperanza	AR	minor	43300
Mjolby	SE	minor	13914
Maaseik	BE	minor	25201
Hajjah	YE	admin	46568
Penalva do Castelo	PT	minor	7956
Kelheim	DE	minor	16714
Chiquimula	GT	admin	41521
Kigoma	TZ	admin	130142
Bang Bua Thong	TH	minor	50141
Slutsk	BY	minor	61700
Swinoujscie	PL	minor	41479
Florencia	CU	minor	21150
Meiningen	DE	minor	24233
Tumaco	CO	minor	86713
Mazeikiai	LT	admin	34152
Zepce	BA	minor	31582
Murzuq	LY	admin	47324
Kozan	TR	minor	130495
Ciudad Tecun Uman	GT	minor	33426
Budakeszi	HU	minor	14330
Liptovsky Mikulas	SK	minor	32593
Acala	MX	minor	13889
Aurich	DE	minor	41991
Kemi	FI	minor	21758
Sao Bras de Alportel	PT	minor	10662
Horn	AT	minor	6520
Tatvan	TR	minor	73222
Yumbe	UG	admin	0
Sarospatak	HU	minor	11768
Ondorhaan	MN	admin	14723
Tuzla	BA	minor	110979
As Suqaylibiyah	SY	minor	17313
Horki	BY	minor	30500
Vecses	HU	minor	20935
Farsala	GR	minor	9298
Dien Bien Phu	VN	admin	0
Raydah	YE	minor	13971
Zakopane	PL	minor	27490
To`rtko`l Shahri	UZ	minor	50800
Blois	FR	minor	46086
Burtnieki	LV	admin	0
Krivogastani	MK	admin	0
Tenkodogo	BF	admin	38108
Bururi	BI	admin	4478
Orsha	BY	minor	108100
Bitlis	TR	admin	71501
Raca	RS	admin	0
Calilabad	AZ	admin	25846
Iten	KE	admin	0
Iranshahr	IR	minor	113750
Penacova	PT	minor	15251
Melchor Ocampo	MX	minor	37706
Pakwach	UG	admin	17541
Prey Veng	KH	admin	74000
Berehove	UA	minor	23732
Bad Tolz	DE	minor	18802
Altdorf	CH	admin	9401
Zihuatanejo	MX	minor	104609
Sa`dah	YE	admin	70203
Galanta	SK	minor	15029
Jalal-Abad	KG	admin	89004
Mamou	GN	admin	71153
Monza	IT	minor	122728
Caibarien	CU	minor	38479
Reo	BF	minor	37535
Koper	SI	admin	25611
Ban Phai	TH	minor	28913
Bama	NG	minor	118121
Moravce	SI	admin	0
Suonenjoki	FI	minor	7390
Yangirabot	UZ	minor	11364
Dobrna	SI	admin	0
Kindia	GN	admin	117062
Taibao	TW	admin	35000
La Paz	AR	minor	4400
Karonga	MW	admin	34207
Bouar	CF	admin	40353
Lypovets'	UA	minor	8463
Cherbourg	FR	minor	60991
Shumen	BG	admin	97719
Saint-Brieuc	FR	minor	44372
Vyshhorod	UA	minor	27825
Medenine	TN	admin	61705
Krk	HR	minor	6281
K'asp'i	GE	minor	13423
Viligili	MV	admin	0
Tahoua	NE	admin	115956
Krapkowice	PL	minor	16721
Goycay	AZ	admin	36200
Mouila	GA	admin	22469
Swiedbodzin	PL	minor	21988
Dori	BF	admin	37806
Adjumani	UG	admin	34700
Rubio	VE	minor	95041
Butebo	UG	admin	0
Kudymkar	RU	minor	31370
Vecpiebalga	LV	admin	0
Piest'any	SK	minor	29957
Nagykata	HU	minor	12280
Sal Rei	CV	admin	6357
Backi Petrovac	RS	admin	6727
Prachuap Khiri Khan	TH	admin	54018
Veroia	GR	minor	43158
Kostopil'	UA	minor	31463
Imst	AT	minor	10504
Zrece	SI	admin	0
Tomaz pri Ormozu	SI	admin	0
Velika Plana	RS	admin	0
Ahuachapan	SV	admin	110511
Snovsk	UA	minor	11390
Szentes	HU	minor	27080
Puerto Williams	CL	minor	1868
Xam Nua	LA	admin	38992
Beni Mellal	MA	admin	0
Santa Ana Chiautempan	MX	minor	46776
Jerez de Garcia Salinas	MX	minor	57610
Masvingo	ZW	admin	72527
Telsen	AR	minor	544
Steinkjer	NO	admin	12985
Ratchaburi	TH	admin	36339
Grad	SI	admin	0
Chambery	FR	minor	58919
Fresnillo	MX	minor	110892
Frias	AR	minor	13594
Ciudad de Huajuapam de Leon	MX	minor	77547
Bang Mun Nak	TH	minor	8756
Trier	DE	minor	110636
Santiago	PH	admin	134830
Krusevo	MK	admin	5507
Bang Racham	TH	minor	14577
Oyem	GA	admin	60685
Sapna	BA	minor	12136
Karlstad	SE	admin	74141
Farah	AF	admin	73647
Hasselt	BE	minor	69222
Lapua	FI	minor	14609
Esslingen	DE	minor	93542
Vyerkhnyadzvinsk	BY	minor	7000
Romny	UA	minor	40316
Gao	ML	admin	116967
Esztergom	HU	minor	28144
Qubadli	AZ	admin	73
Chrzanow	PL	minor	38989
Pangkalpinang	ID	admin	125933
Kamensk-Shakhtinskiy	RU	minor	88997
Cabeceiras de Basto	PT	minor	16710
Bologoye	RU	minor	21158
Wete	TZ	admin	26450
Pefki	GR	minor	21415
Wittlich	DE	minor	18995
Toktogul	KG	minor	26115
Pozo Almonte	CL	minor	9277
Suceava	RO	admin	92121
Rongwo	CN	minor	92601
Agstafa	AZ	admin	20200
Isiolo	KE	admin	45989
Gap	FR	minor	40895
Bodo	NO	admin	41720
Marktoberdorf	DE	minor	18539
Sotuta	MX	minor	5548
Spanish Town	JM	admin	131056
Salanso	BF	minor	10385
Fiorentino	SM	admin	0
Asuncion Nochixtlan	MX	minor	18525
Slovenj Gradec	SI	admin	0
Tursunzoda	TJ	minor	46700
Faranah	GN	admin	19469
Narbonne	FR	minor	54700
Orocue	CO	minor	2835
Djenne	ML	minor	32944
Maracha	UG	admin	0
Golpayegan	IR	minor	47849
Trashi Yangtse	BT	admin	0
Kuysinjaq	IQ	minor	19878
Duren	DE	minor	90733
Moura	PT	minor	15167
Voru	EE	admin	11859
Khrystynivka	UA	minor	10762
Vasilevo	MK	admin	0
Targoviste	RO	admin	79610
Bafoulabe	ML	minor	26823
Agcabadi	AZ	admin	39200
Necochea	AR	minor	80478
Ndele	CF	admin	11764
Dedougou	BF	admin	38862
Sinjar	IQ	minor	88023
Amnat Charoen	TH	admin	25858
Ijevan	AM	admin	0
La Cruz	MX	minor	15657
Pader	UG	admin	0
Kulmbach	DE	minor	25915
Stung Treng	KH	admin	29665
Gualeguaychu	AR	minor	109461
San Blas Atempa	MX	minor	18406
Mazsalaca	LV	admin	1133
Mechelen	BE	minor	86921
Kursumlija	RS	admin	0
Kedainiai	LT	admin	24177
Prenzlau	DE	minor	19024
Bistrita	RO	admin	75076
Panajachel	GT	minor	11142
Komenda	SI	admin	0
Kazlu Ruda	LT	admin	6018
Perigueux	FR	minor	29966
Uusikaupunki	FI	minor	15510
Zacualpan de Amilpas	MX	minor	9370
Torcy	FR	minor	22568
Baft	IR	minor	41105
Schwandorf	DE	minor	28828
Targu-Mures	RO	admin	134290
Koceni	LV	admin	0
Los Polvorines	AR	minor	60867
Kolonia	FM	admin	0
Pau	FR	minor	77130
Uelzen	DE	minor	33614
Furstenfeldbruck	DE	minor	37677
Apolda	DE	minor	22012
Tervel	BG	minor	7632
Villa Hayes	PY	admin	15643
Kattaqo'rg'on Shahri	UZ	minor	58950
Tandag	PH	admin	56364
Helsingborg	SE	minor	112496
Eutin	DE	minor	16971
Varshets	BG	minor	6500
Amecameca de Juarez	MX	minor	31687
Plavinas	LV	admin	3151
Trujillo	HN	admin	30000
Borba	PT	minor	7333
Kilkis	GR	minor	22914
Paks	HU	minor	18788
Meaux	FR	minor	54991
Djambala	CG	admin	9651
Nabeul	TN	admin	115149
Alibunar	RS	admin	3431
Paysandu	UY	admin	76429
Nacaome	HN	admin	13931
Tecuala	MX	minor	14921
Zaranj	AF	admin	49851
Gracias	HN	admin	50256
Adrar	DZ	admin	56910
Villa Constitucion	AR	minor	47374
Macon	FR	minor	33638
Proletarsk	RU	minor	19032
Stratford	NZ	admin	5740
Pazardzhik	BG	admin	84619
Santa Barbara	MX	minor	8765
Marka	SO	admin	1958
Luninyets	BY	minor	24000
Orivesi	FI	minor	9408
Kalinkavichy	BY	minor	37700
Hodmezovasarhely	HU	admin	43311
Nava	MX	minor	22192
Gobernador Gregores	AR	minor	2519
Khorramshahr	IR	minor	133097
Krathum Baen	TH	minor	21904
Lufilufi	WS	admin	0
Nordhausen	DE	minor	41791
Vecvarkava	LV	admin	0
Mirna	SI	admin	0
Moyobamba	PE	admin	50073
Jawor	PL	minor	24070
Villa del Rosario	CO	minor	69833
Tuzi	ME	admin	0
Comandante Fontana	AR	minor	4277
Karkkila	FI	minor	8969
Akmene	LT	admin	2429
Masaka	UG	admin	65373
Polykastro	GR	minor	7064
Bajil	YE	minor	46005
Derik	TR	minor	61830
Zernograd	RU	minor	24561
Iba	PH	admin	0
Livingston	GT	minor	76310
Rumuruti	KE	admin	0
Phra Nakhon Si Ayutthaya	TH	admin	52952
Zalingei	SD	admin	0
Bani	DO	minor	66709
Puerto Madryn	AR	minor	115353
Buea	CM	admin	131325
Chrysoupoli	GR	minor	8885
Clervaux	LU	admin	0
Artashat	AM	admin	25400
Masunga	BW	admin	0
Villa Maria	AR	minor	79356
Miranda do Douro	PT	minor	7482
Fastiv	UA	minor	45907
Garoowe	SO	admin	2568
Calw	DE	minor	23590
Sofifi	ID	admin	0
Tak Bai	TH	minor	18943
Temoaya	MX	minor	77714
Tinogasta	AR	minor	587
Szecseny	HU	minor	5695
Mardin	TR	admin	86948
Cerkvenjak	SI	admin	0
Presidencia Roque Saenz Pena	AR	minor	81879
Savalou	BJ	admin	0
Ordino	AD	admin	0
Gamprin	LI	admin	0
Gambela	ET	admin	0
Bollnas	SE	minor	13398
As Suwayda'	SY	admin	64730
Dorud	IR	minor	121608
Ibarra	EC	admin	131856
Zhob	PK	minor	88356
Tlalmanalco	MX	minor	46130
Bujanovac	RS	admin	0
Arruda dos Vinhos	PT	minor	13391
Sentjur	SI	admin	0
Antsohihy	MG	minor	21290
Yverdon-les-Bains	CH	minor	30157
Skvyra	UA	minor	15889
Kratie	KH	admin	60000
Nova Varos	RS	admin	0
Foca	BA	minor	12334
General Martin Miguel de Guemes	AR	minor	19828
Sobrance	SK	minor	6170
Tsimlyansk	RU	minor	14528
Skydra	GR	minor	5406
Baiquan	CN	minor	70472
Alamos	MX	minor	24493
Numan	NG	minor	77617
Angouleme	FR	minor	41740
Baradero	AR	minor	28537
Harnosand	SE	admin	18624
Zlin	CZ	admin	74935
Tiszavasvari	HU	minor	12508
Liepaja	LV	admin	69443
Monte Plata	DO	minor	15532
Auce	LV	admin	2343
Resita	RO	admin	83324
Vinica	MK	admin	10863
Qasr-e Shirin	IR	minor	11202
Sidi Bouzid	TN	admin	42098
Raba	ID	minor	106101
Szekszard	HU	admin	31795
Colonia	FM	admin	0
Misantla	MX	minor	64249
Kantunilkin	MX	minor	7150
Heilbronn	DE	minor	125960
Khvansar	IR	minor	20490
Goranboy	AZ	admin	7333
Cayenne	GF	admin	61550
Brzozow	PL	minor	26615
Kyrenia	CY	admin	33207
Birao	CF	admin	10178
Parral	MX	minor	109510
Gurpinar	TR	minor	35663
Vieira do Minho	PT	minor	12997
San Francisco del Rincon	MX	minor	113570
Coyhaique	CL	admin	49667
Leulumoega	WS	admin	0
Cabadbaran	PH	admin	73639
Radviliskis	LT	admin	15275
Zwedru	LR	admin	25678
Duma	SY	minor	123494
Kinoni	UG	admin	0
Qormi	MT	admin	16779
Karsava	LV	admin	2003
Kyenjojo	UG	admin	0
Cardenas	CU	minor	86700
Xo`jayli Shahri	UZ	minor	60401
San Marcos	GT	admin	25088
Marsa	MT	admin	0
San Carlos	VE	admin	120000
Machakos	KE	admin	114109
Berriozabal	MX	minor	51722
Qala	MT	admin	0
Zinacantepec	MX	minor	136167
Juticalpa	HN	admin	33260
Mulanje	MW	admin	20870
Berdychiv	UA	minor	76229
Plauen	DE	minor	64931
Lafia	NG	admin	127236
Kohtla-Jarve	EE	minor	35928
Sabinas	MX	minor	63522
Helmstedt	DE	minor	25728
Daugavpils	LV	admin	84592
Haugesund	NO	minor	45040
Murska Sobota	SI	admin	11679
Sinop	TR	admin	64544
Titel	RS	admin	0
Slovenske Konjice	SI	admin	0
Cicekdagi	TR	minor	14735
Gbadolite	CD	admin	50493
Landshut	DE	minor	72404
Alajarvi	FI	minor	10006
Vrbas	RS	admin	24112
Leon	ES	minor	124303
Barclayville	LR	admin	2733
Klichaw	BY	minor	7200
Lifford	IE	admin	0
Ochakiv	UA	minor	14705
Trofa	PT	minor	38999
La Esperanza	HN	admin	21000
Blahovishchenske	UA	minor	6232
Mongomo	GQ	admin	7251
Volcja Draga	SI	admin	0
Eldorado	AR	minor	17365
Koszeg	HU	minor	11805
Valandovo	MK	admin	4442
Su-ngai Kolok	TH	minor	41590
Gyomaendrod	HU	minor	12784
Falun	SE	admin	36477
Gyongyos	HU	minor	29337
Ath Thawrah	SY	minor	84000
Thermi	GR	minor	16004
Torbat-e Jam	IR	minor	100449
Radece	SI	admin	0
Fehergyarmat	HU	minor	7981
Mor	HU	minor	13936
Yasothon	TH	admin	20414
Tlanalapa	MX	minor	8662
Foammulah	MV	admin	0
Balmazujvaros	HU	minor	17109
Lieksa	FI	minor	11772
Pudasjarvi	FI	minor	8257
Myslowice	PL	minor	75183
Pailin	KH	admin	0
Mobarakeh	IR	minor	62454
Balta	UA	minor	19353
Ma`arrat an Nu`man	SY	minor	90000
Torres Novas	PT	minor	36717
Balaka	MW	admin	0
Yecapixtla	MX	minor	39859
Campoalegre	CO	minor	22568
Schwyz	CH	admin	15181
Hua Hin	TH	minor	59369
Vila do Bispo	PT	minor	5258
Sencur	SI	admin	0
Doljevac	RS	admin	0
Narathiwat	TH	admin	41342
Azua	DO	minor	59139
Thun	CH	minor	43743
Olevsk	UA	minor	10457
Pak Phanang	TH	minor	20425
Santiago Tianguistenco	MX	minor	64365
Samdrup Jongkhar	BT	admin	0
Puerto Deseado	AR	minor	14183
Soledad Atzompa	MX	minor	23130
Cloppenburg	DE	minor	34913
Takua Pa	TH	minor	8815
Alta	NO	minor	15342
Peshtera	BG	minor	21824
Svetlogorsk	RU	minor	13663
Orizaba	MX	minor	117273
Ostroleka	PL	minor	52900
Dunedin	NZ	admin	126255
Mezocsat	HU	minor	5661
Ed Damer	SD	admin	103941
Plunge	LT	admin	18042
Brzesko	PL	minor	16912
Stara L'ubovna	SK	minor	16348
Koscian	PL	minor	24086
Zlotoryja	PL	minor	16479
Vailoa	WS	admin	0
Magway	MM	admin	125973
Buri Ram	TH	admin	28613
Livani	LV	admin	7343
Temascalcingo	MX	minor	58169
Koceljeva	RS	admin	0
Gagnoa	CI	admin	123184
Pili	PH	admin	0
Mikkeli	FI	admin	54665
Kiboga	UG	admin	14512
Goroka	PG	admin	21507
Goaso	GH	admin	0
Monte Cristi	DO	minor	17001
Birkenfeld	DE	minor	6984
Guarda	PT	admin	42541
Buchanan	LR	admin	0
Podilsk	UA	minor	40155
Ash Shihr	YE	minor	68313
Zhlobin	BY	minor	77600
Luce	SI	admin	0
Starse	SI	admin	0
Hinche	HT	admin	18590
Dreux	FR	minor	31044
Chilapa de Alvarez	MX	minor	120790
Auch	FR	minor	21935
Naxcivan	AZ	admin	74500
Sattahip	TH	minor	23418
Nagyatad	HU	minor	10212
Oulainen	FI	minor	7610
Lebane	RS	admin	0
Ma'rib	YE	admin	16794
Capljina	BA	minor	28122
Mlawa	PL	minor	29836
Falesti	MD	admin	12074
Larache	MA	\N	120082
Heroica Guaymas	MX	minor	134153
Huehuetenango	GT	admin	58000
Arima	TT	admin	0
Freistadt	AT	minor	7909
Janjanbureh	GM	admin	3584
Naranjos	MX	minor	20073
Ankaran	SI	admin	3209
Varvarin	RS	admin	0
Piotrkow Trybunalski	PL	minor	74905
Tay Ninh	VN	admin	126370
Vila Real de Santo Antonio	PT	minor	19156
Jekabpils	LV	admin	22412
Sironko	UG	admin	14100
Tucupita	VE	admin	86487
Orchomenos	GR	minor	5238
Talsi	LV	admin	9264
Ventspils	LV	admin	35362
Otwock	PL	minor	42765
Log	SI	admin	0
Hovd	MN	admin	26023
Imqabba	MT	admin	0
Korinthos	GR	minor	30176
Jonava	LT	admin	27804
Caxito	AO	admin	28224
Papa	HU	minor	30382
Esteli	NI	admin	129924
Xicotencatl	MX	minor	9593
Mogila	MK	admin	0
Mettmann	DE	minor	38829
Union Choco	PA	admin	0
Ploce	HR	minor	6537
Radenci	SI	admin	0
Ikata-cho	JP	minor	8540
San Andres Timilpan	MX	minor	14335
Moncao	PT	minor	19230
Topol'cany	SK	minor	25492
Kuala Belait	BN	admin	30267
Cuxhaven	DE	minor	48358
Tres Arroyos	AR	minor	47136
Ban Chang	TH	minor	27668
Rocha	UY	admin	25422
Lyman	UA	minor	22315
Betong	TH	minor	26640
Pacos de Ferreira	PT	minor	56340
Santa Rosalia	MX	minor	14160
Arhavi	TR	minor	20565
Paro	BT	admin	15000
Al Qusayr	SY	minor	46772
Torre de Moncorvo	PT	minor	8572
Rezekne	LV	admin	28174
San Andres	CO	admin	71946
Ried im Innkreis	AT	minor	11903
Salacgriva	LV	admin	2729
Backa Topola	RS	admin	16171
Sortavala	RU	minor	18801
Tervete	LV	admin	0
Lupane	ZW	admin	0
Kaisiadorys	LT	admin	0
Stralsund	DE	minor	59421
Klagenfurt	AT	admin	101403
Legnica	PL	minor	101133
Carrazeda de Anciaes	PT	minor	6373
Petnjica	ME	admin	0
Judenburg	AT	minor	9960
Salima	MW	admin	71181
Teoloyucan	MX	minor	63115
Guamuchil	MX	minor	72500
Kungsor	SE	minor	5898
Viborg	DK	admin	34831
Sur	OM	admin	0
Tuxpan	MX	minor	34079
Bayanhongor	MN	admin	26252
Nurmijarvi	FI	minor	42709
Dendermonde	BE	minor	45673
Lahoysk	BY	minor	15000
Bielsk Podlaski	PL	minor	26493
Half Way Tree	JM	admin	96494
Vilani	LV	admin	2938
El Tarf	DZ	admin	25594
Mariel	CU	minor	42500
Amolatar	UG	admin	0
Bang Kruai	TH	minor	42390
Dunaujvaros	HU	admin	44200
Atar	MR	admin	24021
Redondo	PT	minor	7031
Pageralam	ID	minor	136244
Singida	TZ	admin	62432
Yardimli	AZ	admin	0
Salvatierra	MX	minor	34066
Charsadda	PK	minor	105414
Luuka Town	UG	admin	0
Virrat	FI	minor	7002
Esquipulas	GT	minor	65000
Nkhata Bay	MW	admin	22108
Latacunga	EC	admin	63842
Makeni	SL	admin	87679
Kerouane	GN	minor	15406
Minas	UY	admin	38446
Alta Gracia	AR	minor	48140
Tadjourah	DJ	admin	14820
Haymana	TR	minor	45931
Pinamar	AR	minor	45000
Waiblingen	DE	minor	55449
Keila	EE	minor	9758
Nereta	LV	admin	0
Pak Thong Chai	TH	minor	14272
Lincoln	AR	minor	24798
Po	BF	minor	17924
Ranong	TH	admin	16125
Zin'kiv	UA	minor	9856
San Pedro de Ycuamandiyu	PY	admin	35021
Lillesand	NO	minor	7930
Hisor	TJ	minor	23200
Oberwart	AT	minor	7572
Olbia	IT	minor	45366
Zug	CH	admin	30542
Meissen	DE	minor	28044
Pirmasens	DE	minor	40403
Gorisnica	SI	admin	0
San Antonio de los Cobres	AR	minor	5482
Pak Chong	TH	minor	35736
Ruma	RS	admin	0
Quivican	CU	minor	29253
Astravyets	BY	minor	13200
Az Za`ayin	QA	admin	0
Picos	CV	admin	0
Munxar	MT	admin	0
Nakapiripirit	UG	admin	0
Thung Song	TH	minor	30500
Surt	LY	admin	76788
Ragana	LV	admin	0
Vinhais	PT	minor	9066
Kobelyaky	UA	minor	9841
Guliston	UZ	admin	55600
Kotido	UG	admin	0
Braunau am Inn	AT	minor	17095
Phangnga	TH	admin	10412
Silistra	BG	admin	42651
Molepolole	BW	admin	67598
Tsirang	BT	admin	0
Shirvan	IR	minor	82790
Shepetivka	UA	minor	41415
Altotting	DE	minor	10119
Gornji Milanovac	RS	admin	0
Baruun-Urt	MN	admin	14297
Zgornje Gorje	SI	admin	0
Njombe	TZ	admin	46724
Wakiso	UG	admin	0
Chiesanuova	SM	admin	0
Baler	PH	admin	0
Mukono	UG	admin	0
As Sanamayn	SY	minor	26268
Bilecik	TR	admin	81723
Biltine	TD	admin	11000
Bukoba	TZ	admin	100504
Apac	UG	admin	0
Messini	GR	minor	6065
Khon Kaen	TH	admin	115928
Arjona	CO	minor	50405
Paraiso	MX	minor	86632
Ozumba	MX	minor	27207
Angol	CL	minor	53262
La Paz	HN	admin	41250
Stavanger	NO	admin	129300
Obock	DJ	admin	21200
Aliaga	TR	minor	95392
Yahotyn	UA	minor	19613
Lenart v Slovenskih Goricah	SI	admin	0
Tauberbischofsheim	DE	minor	13231
Bad Segeberg	DE	minor	17267
Ocampo	MX	minor	23500
Illintsi	UA	minor	11270
Hajduhadhaz	HU	minor	12669
Narvik	NO	minor	14148
Emirdag	TR	minor	37817
Reyhanli	TR	minor	98534
Bohodukhiv	UA	minor	15576
Kazimierza Wielka	PL	minor	5848
Vel'ky Krtis	SK	minor	12115
Bogdanci	MK	admin	6031
Horodenka	UA	minor	9113
Siyazan	AZ	admin	18655
Arvayheer	MN	admin	20000
Vendas Novas	PT	minor	11846
Tarxien	MT	admin	0
Sedhiou	SN	admin	0
Basse Santa Su	GM	admin	14380
Manbij	SY	minor	78255
Portel	PT	minor	6428
Kalmar	SE	admin	41110
Ormoz	SI	admin	12798
Pozarevac	RS	admin	0
Saarijarvi	FI	minor	9915
Kolomyya	UA	minor	61269
Alzey	DE	minor	18535
At Tur	EG	admin	12733
Guasave	MX	minor	71196
Entroncamento	PT	minor	20206
Balad	IQ	minor	80000
Satun	TH	admin	23612
Domzale	SI	admin	0
San Martin	CO	minor	16273
Baia Mare	RO	admin	123738
Sibut	CF	admin	22419
Lenti	HU	minor	7348
Rapla	EE	admin	5069
Pazar	TR	minor	14335
Sapouy	BF	minor	3837
Brig-Glis	CH	minor	13109
Ludwigsburg	DE	minor	93499
Tonsberg	NO	minor	56293
Xuddur	SO	admin	1639
Caen	FR	minor	105354
Breza	BA	minor	14564
Cuautepec de Hinojosa	MX	minor	45527
San Antonio	CL	minor	86239
My Tho	VN	admin	124143
Zajecar	RS	admin	0
Rumelange	LU	minor	5604
Bolnisi	GE	minor	8967
Mochudi	BW	admin	39700
Zagorje	SI	admin	0
Sumenep	ID	minor	84656
Putrajaya	MY	admin	67964
Levice	SK	minor	32735
Lauf	DE	minor	26515
Ardestan	IR	minor	14698
Polohy	UA	minor	18886
Chacabuco	AR	minor	34587
Mala Vyska	UA	minor	11614
Santa Cruz del Quiche	GT	admin	35000
Gyumri	AM	admin	121976
Tovuz	AZ	admin	13700
Leticia	CO	admin	32450
Tetiyiv	UA	minor	13015
Tha Mai	TH	minor	9843
Rorschach	CH	minor	9439
Pleven	BG	admin	123588
Esch-sur-Alzette	LU	admin	36218
Lagos	PT	minor	31049
El Carmen de Bolivar	CO	minor	60980
Dogbo	BJ	admin	0
Ljubno	SI	admin	0
Comala	MX	minor	20888
Chachapoyas	PE	admin	32026
Vanimo	PG	admin	11204
Santa Barbara	HN	admin	29283
Renens	CH	minor	20927
Lisala	CD	admin	79235
Ciudad Altamirano	MX	minor	24533
Temryuk	RU	minor	41133
Libourne	FR	minor	24845
Ramnicu Valcea	RO	admin	98776
Magangue	CO	minor	100313
Cieszyn	PL	minor	34513
Cihuatlan	MX	minor	30241
Lelydorp	SR	admin	0
Faya	TD	admin	13400
Bac Giang	VN	admin	53728
Charleville-Mezieres	FR	minor	46428
Zakhu	IQ	minor	134863
San Nicolas	CU	minor	21563
Sowa Town	BW	admin	0
Neftcala	AZ	admin	14241
Yi'an	CN	minor	39924
Da Nang	VN	admin	0
Ulm	DE	minor	126329
Agrinio	GR	minor	46899
Melo	UY	admin	55494
Sokcho	KR	minor	79846
Ogre	LV	admin	23533
Illapel	CL	minor	20751
Eschwege	DE	minor	19606
Pardubice	CZ	admin	91727
Mezokovesd	HU	minor	16107
Warendorf	DE	minor	37226
Nadur	MT	admin	0
Manzini	SZ	admin	110508
Gevgelija	MK	admin	15685
Wetzlar	DE	minor	52954
El Fula	SD	admin	0
Tetela del Volcan	MX	minor	10199
Illizi	DZ	admin	7957
Tejupilco	MX	minor	71077
Amuru	UG	admin	0
Freiberg	DE	minor	40885
Nar'yan-Mar	RU	admin	24775
Prijepolje	RS	admin	37059
Arraiolos	PT	minor	7363
Presevo	RS	admin	0
Kazerun	IR	minor	96683
Korce	AL	admin	51152
Dedoplists'q'aro	GE	minor	5940
Abbeville	FR	minor	22946
Solothurn	CH	admin	16777
Pakxe	LA	admin	119848
Pinsk	BY	minor	126300
Daun	DE	minor	7974
Arganil	PT	minor	12145
Conkal	MX	minor	7173
Invercargill	NZ	admin	48700
Bistrica ob Sotli	SI	admin	0
Mako	HU	minor	22514
Tarutung	ID	minor	1305
Gorazde	BA	minor	12512
Atenco	MX	minor	42739
Soledad de Doblado	MX	minor	27770
Baja	HU	minor	34788
Rawa Mazowiecka	PL	minor	17765
Thinadhoo	MV	admin	0
Kampong Speu	KH	admin	33231
Chiconcuac	MX	minor	19656
Ninh Binh	VN	admin	130517
Chimaltenango	GT	admin	82370
Samut Songkhram	TH	admin	28493
Akhmet'a	GE	minor	8600
Taurage	LT	admin	22002
Sondershausen	DE	minor	21513
Choma	ZM	admin	46746
Feldkirchen	AT	minor	14198
Bautzen	DE	minor	38329
Marsaskala	MT	admin	0
Sankt Johann im Pongau	AT	minor	10944
Kunszentmiklos	HU	minor	8248
Burg	DE	minor	22478
Ruteng	ID	minor	53976
Siklos	HU	minor	8912
Linkoping	SE	admin	114582
Anew	TM	admin	0
Worms	DE	minor	83330
Atlautla	MX	minor	27663
Dolenjske Toplice	SI	admin	0
Kitamilo	UG	admin	0
Opovo	RS	admin	0
Arta	DJ	admin	0
Terni	IT	minor	111189
Kucevo	RS	admin	0
Floresti	MD	admin	11998
Pilar	AR	minor	81120
Chanthaburi	TH	admin	23835
Sahbuz	AZ	admin	0
Imatra	FI	minor	27835
Aasiaat	GL	admin	3134
Huehuetoca	MX	minor	59721
Qobustan	AZ	admin	8100
Dakovo	HR	minor	27745
San Martin de las Piramides	MX	minor	21511
Catbalogan	PH	admin	103879
Weimar	DE	minor	65090
San Vicente	SV	admin	37326
Granada	NI	admin	105171
Ikot Abasi	NG	minor	34911
Hrebinka	UA	minor	10805
Cungus	TR	minor	11927
Baracoa	CU	minor	79797
Dundaga	LV	admin	0
San Gwann	MT	admin	0
Gumushane	TR	admin	57269
Hrib-Loski Potok	SI	admin	0
Weilheim	DE	minor	22477
Joniskis	LT	admin	8757
Shyryayeve	UA	minor	7238
Paola	MT	admin	0
Makedonski Brod	MK	admin	3740
Samobor	HR	minor	15147
Lovech	BG	admin	42343
Divrigi	TR	minor	16377
Siracusa	IT	minor	121171
Jalingo	NG	admin	117757
Zitiste	RS	admin	0
Naama	DZ	admin	0
El Limon	VE	minor	106206
Abim	UG	admin	0
Artigas	UY	admin	40658
Penafiel	PT	minor	72265
Volos	GR	minor	86046
San Fernando	TT	admin	55419
Bogovinje	MK	admin	0
Maliana	TL	admin	15800
Outokumpu	FI	minor	7139
Saleaula	WS	admin	0
Gonzalez	MX	minor	11212
El Salto	MX	minor	24241
Iisalmi	FI	minor	21945
Quthing	LS	admin	15000
Hakkari	TR	admin	81424
Gjirokaster	AL	admin	25301
Amahai	ID	minor	47653
Molde	NO	admin	18594
Kisoro	UG	admin	12900
Azov	RU	minor	80721
Bohinjska Bistrica	SI	admin	0
Mount Hagen	PG	admin	29765
Hadibu	YE	admin	11396
Kavieng	PG	admin	19728
Braganca	PT	admin	35341
Triesenberg	LI	admin	0
Svrljig	RS	admin	0
Kauniainen	FI	minor	9486
Harstad	NO	minor	21070
Tabuaco	PT	minor	6350
Fereydunshahr	IR	minor	13475
Santiago de Tolu	CO	minor	27390
Taftanaz	SY	minor	8540
Azambuja	PT	minor	21814
Ewo	CG	admin	9062
Kuhmo	FI	minor	8806
Loznica	RS	admin	86413
Hoa Binh	VN	admin	121309
Funchal	PT	admin	111892
Wittmund	DE	minor	20321
Kita	ML	minor	46435
Chorzow	PL	minor	111536
Nwoya	UG	admin	0
Cotija de la Paz	MX	minor	19018
Dundo	AO	admin	11985
Myjava	SK	minor	11708
Varaklani	LV	admin	1853
Bulisa	UG	admin	0
San Felipe	CL	minor	64120
Chikwawa	MW	admin	0
Sandomierz	PL	minor	24187
Krasnyy Sulin	RU	minor	38284
Kalbacar	AZ	admin	0
Sokobanja	RS	admin	7982
Krizevci	HR	minor	11231
Celorico de Basto	PT	minor	20098
Ciudad Mante	MX	minor	112061
Santiago Tuxtla	MX	minor	15681
Ramhormoz	IR	minor	49822
Thaba-Tseka	LS	admin	5423
Vrnjacka Banja	RS	admin	10065
Opatija	HR	minor	11659
Monor	HU	minor	18084
Rumphi	MW	admin	0
Belen	TR	minor	33540
Gaoual	GN	minor	7461
Socopo	VE	minor	101512
Alagir	RU	minor	20043
Vila Pouca de Aguiar	PT	minor	13187
Sjenica	RS	admin	14060
Acaxochitlan	MX	minor	34892
Vila Nova de Paiva	PT	minor	5176
Nova Crnja	RS	admin	0
Princes Town	TT	admin	0
Glubczyce	PL	minor	13572
Bac	RS	admin	6087
Joquicingo	MX	minor	11042
Sao Filipe	CV	admin	8122
Hidalgotitlan	MX	minor	19587
Poitiers	FR	minor	88291
Arauca	CO	admin	96814
Vichy	FR	minor	24166
Wichian Buri	TH	minor	22995
Lambarene	GA	admin	25310
Port Blair	IN	admin	127562
Aljustrel	PT	minor	9257
Sundsvall	SE	minor	73389
Vittoriosa	MT	admin	0
Villefranche-sur-Saone	FR	minor	36857
Waingapu	ID	minor	48828
Olecko	PL	minor	16508
Nidzica	PL	minor	13872
Senftenberg	DE	minor	24275
Gyor	HU	admin	132034
Grasse	FR	minor	50396
Rawson	AR	admin	31787
Aizpute	LV	admin	4237
Senta	RS	admin	20302
Horjul	SI	admin	0
Carlow	IE	admin	24272
Tisina	SI	admin	0
Vitomarci	SI	admin	0
Mutsamudu	KM	admin	30000
Si Racha	TH	minor	23400
Leczyca	PL	minor	15593
Casilda	AR	minor	35058
Salgotarjan	HU	admin	33579
Halmstad	SE	admin	55657
Seelow	DE	minor	5426
Forssa	FI	minor	17422
Ocotal	NI	admin	34580
Tuquerres	CO	minor	33979
Elektrenai	LT	admin	11156
Konce	MK	admin	0
Castlebar	IE	admin	0
Arroyo Seco	MX	minor	12493
Vaslui	RO	admin	55407
Bar	ME	admin	0
Kalisz	PL	minor	103738
Thionville	FR	minor	40701
Sloviansk	UA	minor	113196
Tougue	GN	minor	25531
Kulu	TR	minor	50667
Bojnik	RS	admin	0
Taluqan	AF	admin	77000
Horokhiv	UA	minor	9134
Aligudarz	IR	minor	78690
Pirot	RS	admin	0
San Jose del Guaviare	CO	admin	68878
Taldyqorghan	KZ	admin	129960
Kurunegala	LK	admin	0
Kovin	RS	admin	0
Chelmno	PL	minor	20428
Gia Nghia	VN	admin	0
Catio	GW	admin	26999
Zlatograd	BG	minor	7623
Capulhuac	MX	minor	30838
Gabrovo	BG	admin	62938
Boffa	GN	minor	2332
Lienz	AT	minor	11844
Aksay	RU	minor	46018
Genhe	CN	minor	110438
Escarcega	MX	minor	29477
Jounie	LB	minor	102221
Savona	IT	minor	61057
Vila Nova da Barquinha	PT	minor	7322
Bar	UA	minor	16136
Rakai	UG	admin	0
Korsun'-Shevchenkivs'kyy	UA	minor	18401
Murmuiza	LV	admin	0
Safita	SY	minor	32213
Guiglo	CI	minor	39134
Maiquetia	VE	minor	87909
Trebinje	BA	minor	31433
Kapan	AM	admin	43190
Anapa	RU	minor	81447
Mytilini	GR	admin	29328
Tocopilla	CL	minor	24460
Berovo	MK	admin	7002
E'erguna	CN	minor	76667
Nalut	LY	admin	66609
Qrendi	MT	admin	0
Tecpan de Galeana	MX	minor	14638
Dieppe	FR	minor	29080
Platon Sanchez	MX	minor	10009
Rosoman	MK	admin	0
Rinconada	AR	minor	6692
Kasserine	TN	admin	81987
Tlaxcala	MX	admin	14692
Lusambo	CD	admin	41416
Tunuyan	AR	minor	22834
Crensovci	SI	admin	0
Angel R. Cabada	MX	minor	11689
Wolfach	DE	\N	5850
Kamin'-Kashyrs'kyy	UA	minor	12489
Staryy Sambir	UA	minor	6630
Singhanakhon	TH	minor	42423
Vrbovec	HR	minor	14797
Tepetlaoxtoc	MX	minor	25523
Mbarara	UG	admin	83700
Nadvirna	UA	minor	22447
Matehuala	MX	minor	67717
Siemiatycze	PL	minor	15169
Pattani	TH	admin	44234
Binyin	UG	admin	0
Mosbach	DE	minor	23398
Schwelm	DE	minor	28542
Jimani	DO	minor	11414
Leskovac	RS	admin	60288
Nivala	FI	minor	10876
Isulan	PH	admin	0
Veliko Tarnovo	BG	admin	72207
Tolna	HU	minor	10987
Forecariah	GN	minor	12358
Wolfenbuttel	DE	minor	52174
Priekule	LV	admin	2167
Jalapa	GT	admin	122483
Kiskunfelegyhaza	HU	minor	29306
Zenica	BA	minor	70553
Lityn	UA	minor	6658
Mattersburg	AT	minor	7349
Comrat	MD	admin	20113
Balakan	AZ	admin	8134
Diriamba	NI	minor	57512
Coban	GT	admin	65194
Sangaree	US	\N	7760
Miahuatlan de Porfirio Diaz	MX	minor	17632
Isangel	VU	admin	0
Tzintzuntzan	MX	minor	12259
Uster	CH	minor	34442
Juan Aldama	MX	minor	14162
Smiltene	LV	admin	5306
Florida	UY	admin	33640
Ilinden	MK	admin	0
Banqiao	TW	admin	0
Miesbach	DE	minor	11562
Galway	IE	admin	79504
Kangaba	ML	minor	17232
Yawatahama-shi	JP	minor	32238
Silves	PT	minor	37126
Siteki	SZ	admin	6152
Lajkovac	RS	admin	0
L'Hay-les-Roses	FR	minor	31204
Tevragh Zeina	MR	admin	0
Palayan City	PH	admin	41041
Tha Bo	TH	minor	18320
Manatuto	TL	admin	9022
Trzic	SI	admin	0
Puconci	SI	admin	0
Chiang Rai	TH	admin	70610
Soroti	UG	admin	1038
Viana do Alentejo	PT	minor	5743
Ciudad Miguel Aleman	MX	minor	19997
Pavilosta	LV	admin	1035
Mendi	PG	admin	26252
Heide	DE	minor	21684
Stari Trg	SI	admin	0
Gleno	TL	admin	8133
Kalasin	TH	admin	34437
Plasnica	MK	admin	0
Balcarce	AR	minor	38823
Honda	CO	minor	35469
Eberswalde	DE	minor	40387
Apace	SI	admin	0
Vecumnieki	LV	admin	0
Charata	AR	minor	18297
Vreed-en-Hoop	GY	admin	0
Karlovy Vary	CZ	admin	48479
Radovis	MK	admin	16223
Beja	PT	admin	35854
Siteia	GR	minor	9348
Guabito	PA	minor	8387
Hollabrunn	AT	minor	11681
Santa Maria Tonameca	MX	minor	25130
Vransko	SI	admin	0
Chivilcoy	AR	minor	54514
Priekuli	LV	admin	0
Neunkirchen	DE	minor	46469
Khorugh	TJ	admin	28098
Samut Sakhon	TH	admin	60103
Oplotnica	SI	admin	0
Carhue	AR	minor	7190
Gorizia	IT	minor	34411
Fort Portal	UG	admin	42670
Piran	SI	admin	17491
Lyuboml'	UA	minor	10466
Passau	DE	minor	52469
Bouafle	CI	minor	60962
Sanare	VE	minor	48764
Tepeapulco	MX	minor	49850
Rodeo	AR	minor	701
Kivertsi	UA	minor	14195
Banfora	BF	admin	60288
Nakhon Pathom	TH	admin	78780
Kusel	DE	minor	5405
Cauquenes	CL	minor	31362
Pante Macassar	TL	admin	0
Zelino	MK	admin	0
Dobele	LV	admin	9272
Odienne	CI	admin	49857
Ciudad Cerralvo	MX	minor	7169
Pombas	CV	admin	0
Santa Maria del Oro	MX	minor	5878
Mellieha	MT	admin	0
Hajnowka	PL	minor	21442
Krusevac	RS	admin	58745
Cotui	DO	minor	79596
Kabinda	CD	admin	59004
Kreuzlingen	CH	minor	21801
Butwal	NP	admin	118462
Ovruch	UA	minor	15795
Hetauda	NP	admin	84671
Olaine	LV	admin	11132
Cholpon-Ata	KG	minor	11520
Pilisvorosvar	HU	minor	14148
Raisio	FI	minor	24290
Radovljica	SI	admin	0
Kakata	LR	admin	33945
San Felipe del Progreso	MX	minor	100201
Sarab	IR	minor	42057
Tequisquiapan	MX	minor	54929
Zitorada	RS	admin	0
Boone	US	\N	26146
Gorenja Vas	SI	admin	0
Ardahan	TR	admin	42226
Dolyna	UA	minor	20691
Gori	GE	admin	48143
Ang Thong	TH	admin	13277
Menaka	ML	minor	9110
Brvenica	MK	admin	0
Bad Kissingen	DE	minor	22444
San Antonio del Sur	CU	minor	26509
Marijampole	LT	admin	36602
Hameenlinna	FI	admin	68011
Sen Monorom	KH	admin	7500
Chilcuautla	MX	minor	15284
Oryahovo	BG	minor	5367
La Ligua	CL	minor	19127
Stade	DE	minor	47533
San Juan	DO	admin	72950
Kalymnos	GR	minor	12324
Totolapan	MX	minor	10790
Logatec	SI	admin	0
Savanna-la-Mar	JM	admin	30000
Edeleny	HU	minor	9389
Machiques	VE	minor	122734
San Martin Hidalgo	MX	minor	27777
Kupiskis	LT	admin	6321
Svendborg	DK	minor	29180
Bobov Dol	BG	minor	5651
Cienega de Flores	MX	minor	14268
Valka	LV	admin	4573
Perevalsk	UA	minor	26132
Bihac	BA	minor	43007
Celestun	MX	minor	6269
Bludenz	AT	minor	14539
Victoria	AR	minor	30623
Los Guayos	VE	minor	130345
Alesund	NO	minor	52163
Petatlan	MX	minor	44485
Somoto	NI	admin	20300
Winterthur	CH	minor	109775
Haguenau	FR	minor	34504
Lagodekhi	GE	minor	5198
Kalocsa	HU	minor	15490
Ljubovija	RS	admin	0
Farim	GW	admin	6792
Nova Sintra	CV	admin	0
Talas	KG	admin	35172
El Kef	TN	admin	47979
Almoloya	MX	minor	10638
Trashigang	BT	admin	0
Jihlava	CZ	admin	51216
Store	SI	admin	0
Balkanabat	TM	admin	89785
Whakatane	NZ	admin	15850
Pionerskiy	RU	minor	11312
Veurne	BE	minor	11790
Crotone	IT	minor	60010
Pulawy	PL	minor	49839
Rauna	LV	admin	0
Serowe	BW	admin	48573
Takab	IR	minor	43702
Chichihualco	MX	minor	10690
Aldama	MX	minor	24761
Vrsac	RS	admin	35701
Douai	FR	minor	39700
Madingou	CG	admin	22760
Almirante	PA	minor	8114
Mrkonjic Grad	BA	minor	7915
Al Faw	IQ	minor	105080
Visegrad	BA	minor	5869
Nizhyn	UA	minor	73283
Qalat	AF	admin	12191
Vihari	PK	minor	128034
Diego Martin	TT	admin	0
Lija	MT	admin	0
Harim	SY	minor	21934
Elva	EE	minor	5669
Cruz del Eje	AR	minor	52172
Telavi	GE	admin	20900
Liegi	LV	admin	0
Olgiy	MN	admin	28496
Palanga	LT	admin	15381
Mahikeng	ZA	admin	15117
Valkeakoski	FI	minor	21332
Malita	PH	admin	0
San Miguel Panixtlahuaca	MX	minor	5930
Ialoveni	MD	admin	12515
Biella	IT	minor	44616
San Isidro	AR	minor	43595
Saraburi	TH	admin	61750
Komarom	HU	minor	18805
Niksic	ME	admin	0
Sagarejo	GE	minor	10871
Mauren	LI	admin	4268
Maastricht	NL	admin	122378
Kabarnet	KE	admin	0
Corozal	BZ	admin	8800
Zabol	IR	minor	134590
Tenango del Aire	MX	minor	10578
Zouerate	MR	admin	56345
Rakvere	EE	admin	15189
Vobkent Shahri	UZ	minor	12351
Konstantinovsk	RU	minor	17160
Jaroslaw	PL	minor	38796
Naryn	KG	admin	34822
Hakha	MM	admin	20000
Khoyniki	BY	minor	13400
Fasa	IR	minor	110825
Idri	LY	admin	0
Gaya	NE	minor	63815
Zhemgang	BT	admin	0
Nowy Targ	PL	minor	33545
Prachin Buri	TH	admin	17768
Hajduboszormeny	HU	minor	30437
Madona	LV	admin	7206
Lovrenc na Pohorju	SI	admin	0
Chai Nat	TH	admin	12541
Kovacica	RS	admin	0
Hirado	JP	minor	29577
Gouveia	PT	minor	14046
Oroqen Zizhiqi	CN	minor	40128
Komotini	GR	admin	50990
Huamantla	MX	minor	51996
Dehaqan	IR	minor	16899
Timashevsk	RU	minor	51925
Madinat ash Shamal	QA	admin	0
Detva	SK	minor	14751
Mertola	PT	minor	7274
Sillamae	EE	minor	13964
Kibuye	RW	admin	12325
Zalaegerszeg	HU	admin	57403
Sierra Colorada	AR	minor	1522
Socorro	CO	minor	24895
Nuqui	CO	minor	2741
Wolfsberg	AT	minor	25035
Aluksne	LV	admin	6930
Beypazari	TR	minor	48274
Siegburg	DE	minor	41463
Chumsaeng	TH	minor	8426
Malpils	LV	admin	0
Wukari	NG	minor	92933
Belene	BG	minor	8122
Vasarosnameny	HU	minor	8618
Joao Teves	CV	admin	0
Rodos	GR	minor	56969
Kajaani	FI	admin	37622
Cochrane	CL	minor	2789
Ta Khmau	KH	admin	0
Tenancingo	MX	minor	90946
Targovishte	BG	admin	45535
Davos	CH	minor	10937
Goundam	ML	minor	8456
Kaabong	UG	admin	1137
Kumo	NG	minor	35712
Rathenow	DE	minor	24309
Epazoyucan	MX	minor	11522
Gasa	BT	admin	0
Bayreuth	DE	minor	74657
Mercedes	AR	minor	52949
Attard	MT	admin	0
Pemagatshel	BT	admin	0
Chiapa de Corzo	MX	minor	45077
Nove Zamky	SK	minor	38172
Demir Kapija	MK	admin	2547
Ciudad de Huitzuco	MX	minor	16025
Ar Rawdah	YE	minor	6649
Al Musayyib	IQ	minor	76454
Synel'nykove	UA	minor	30724
Bad Oldesloe	DE	minor	24744
Viesite	LV	admin	1580
Kulob	TJ	minor	95000
Al Jabin	YE	admin	0
Sabrosa	PT	minor	6361
Sal'a	SK	minor	22219
Sostanj	SI	admin	0
Avila	ES	minor	57744
Hildesheim	DE	minor	101990
Voznesens'k	UA	minor	35243
Cetinje	ME	admin	13991
Apizaco	MX	minor	81565
Montemor-o-Velho	PT	minor	26171
Salcedo	DO	minor	45299
San Simon de Guerrero	MX	minor	5408
Mbaiki	CF	admin	22166
Awbari	LY	admin	0
Orestiada	GR	minor	18426
Bilohirs'k	UA	minor	16428
Winsen	DE	minor	34896
Borken	DE	minor	42530
Cadereyta Jimenez	MX	minor	86445
Anuradhapura	LK	admin	118302
Szeghalom	HU	minor	8680
Sopot	PL	minor	37457
Imisli	AZ	admin	31310
Borongan	PH	admin	69297
Fuzesabony	HU	minor	7412
Caserta	IT	minor	75561
Figueiro dos Vinhos	PT	minor	6169
Straubing	DE	minor	47794
Knin	HR	minor	10633
Svatove	UA	minor	18417
Iracoubo	GF	minor	1536
Sabirabad	AZ	admin	18612
Ceerigaabo	SO	admin	0
Trakai	LT	admin	4430
Kenge	CD	admin	241
Wicklow	IE	admin	0
Struga	MK	admin	16559
Mkokotoni	TZ	minor	2572
Rio Maior	PT	minor	21192
Cerklje na Gorenjskem	SI	admin	0
Tysmenytsya	UA	minor	9287
Tornio	FI	minor	21928
Tartar	AZ	admin	12563
Bialogard	PL	minor	24570
Gadzin Han	RS	admin	0
El Seibo	DO	minor	23547
Radyvyliv	UA	minor	10190
Mahonda	TZ	admin	0
Si Sa Ket	TH	admin	42405
Dzhebel	BG	minor	8514
Da Lat	VN	admin	0
Knjazevac	RS	admin	0
Kailu	CN	minor	2809
Rumbek	SS	admin	32083
Lerik	AZ	admin	7301
Muramvya	BI	admin	5458
Valongo	PT	minor	93858
Vadso	NO	minor	4902
Kozyatyn	UA	minor	23610
Sirnak	TR	admin	93431
Mazatenango	GT	admin	64652
Barcs	HU	minor	10501
Kunzelsau	DE	minor	15391
Mariestad	SE	minor	14891
Tipasa	DZ	admin	25225
Freyung	DE	minor	7166
Mao	TD	admin	19004
Melk	AT	minor	5529
Sarkad	HU	minor	9677
Campana	AR	minor	86860
Candelaria	CU	minor	19523
Trim	IE	admin	0
Byaroza	BY	minor	28500
Turi	EE	minor	5257
Iguala de la Independencia	MX	minor	110390
Ioannina	GR	admin	65574
Paszto	HU	minor	9124
Ayvacik	TR	minor	33568
Skofljica	SI	admin	0
Edinet	MD	admin	15520
Zugdidi	GE	admin	42998
Port-de-Paix	HT	admin	34657
Lata	SB	admin	553
Bad Salzungen	DE	minor	20244
Linares	MX	minor	63104
Khalkhal	IR	minor	38521
Hangu	PK	minor	39766
Magadan	RU	admin	92782
Oshnaviyeh	IR	minor	70030
Xaghra	MT	admin	0
Escuintla	MX	minor	107638
Svetlyy	RU	minor	21928
Girona	ES	minor	101852
Spodnje Hoce	SI	admin	0
Tepoztlan	MX	minor	14130
Ati	TD	admin	20695
Varkaus	FI	minor	21155
Staryya Darohi	BY	minor	11200
Silute	LT	admin	15902
Gifhorn	DE	minor	42519
Koszalin	PL	minor	108576
Yaypan	UZ	minor	15984
Saue	EE	minor	5631
Greiz	DE	minor	20103
Siofok	HU	minor	25461
Kongsvinger	NO	minor	17829
Pichilemu	CL	minor	12776
Yasuj	IR	admin	108505
Ilulissat	GL	admin	4670
Timargara	PK	minor	58050
Villarrica	PY	admin	41157
Cuencame de Ceniceros	MX	minor	9848
Mitu	CO	admin	28382
Sopiste	MK	admin	0
Roskilde	DK	minor	44285
Ciudad Guadalupe Victoria	MX	minor	16506
Altar	MX	minor	7927
Viitasaari	FI	minor	6666
Xocali	AZ	admin	1397
Nouadhibou	MR	admin	118000
Tapolca	HU	minor	15072
Heniches'k	UA	minor	19869
Balancan	MX	minor	11895
Berdyans'k	UA	minor	114205
Leava	WF	admin	0
Bandar-e Genaveh	IR	minor	64110
Namutumba	UG	admin	0
Boryspil'	UA	minor	62281
Frontera	MX	minor	70160
Ada	RS	admin	10547
Ocuilan de Arteaga	MX	minor	26332
Miaoli	TW	admin	90963
Cankuzo	BI	admin	3624
Baiao	PT	minor	20522
Schleswig	DE	minor	25276
Bilhorod-Dnistrovs'kyy	UA	minor	57210
Calarasi	MD	admin	10808
Suai	TL	admin	0
Teyateyaneng	LS	admin	75115
Briceni	MD	admin	7314
Benavente	PT	minor	29019
Surdulica	RS	admin	0
Monchique	PT	minor	6045
Coquimatlan	MX	minor	13358
Trencin	SK	admin	55593
Wloclawek	PL	minor	110802
Svencionys	LT	admin	4458
Nova Gradiska	HR	minor	11821
Arezzo	IT	minor	91589
Ciudad Cuauhtemoc	MX	minor	9740
Trento	IT	admin	117185
Zinacantan	MX	minor	36489
Bytca	SK	minor	11362
Najasa	CU	minor	15579
Inhambane	MZ	admin	63837
Cao Bang	VN	admin	41112
Podvelka	SI	admin	0
Sandnessjoen	NO	minor	6052
Iklin	MT	admin	0
Kauhava	FI	minor	16784
Xizi	AZ	admin	0
Mocha	YE	minor	14562
Vallenar	CL	minor	44895
Myrina	GR	minor	5711
Tabor	SI	admin	0
Totonicapan	GT	admin	96392
Chalon-sur-Saone	FR	minor	45096
Kercem	MT	admin	0
Cocotitlan	MX	minor	12142
Al Buraymi	OM	admin	0
Dajabon	DO	minor	62046
Gniezno	PL	minor	70083
Mansa Konko	GM	admin	18672
Priboj	RS	admin	27133
Pati	ID	minor	122785
Bell Ville	AR	minor	33835
Neunkirchen	AT	minor	12879
Hola Prystan'	UA	minor	14479
Ajka	HU	minor	27995
Kanye	BW	admin	46831
Aleg	MR	admin	8388
Jeremie	HT	admin	30917
Sankt Polten	AT	admin	55514
Am-Timan	TD	admin	38261
Przeworsk	PL	minor	15713
Sisimiut	GL	admin	5539
Elverum	NO	minor	15117
Volosovo	RU	minor	11987
Kuzma	SI	admin	0
Boras	SE	minor	65008
Rayon	MX	minor	8590
Trancoso	PT	minor	9878
Smederevo	RS	admin	0
Halabjah	IQ	minor	65200
Pisa	IT	minor	89745
Raichur	IN	\N	255240
Lakeland	US	\N	302284
Avondale	US	\N	227289
Jingling	CN	\N	1418913
Rondonopolis	BR	\N	152912
Rostov	RU	\N	1125299
Franca	BR	\N	342112
Kota	IN	\N	1001694
Peoria	US	\N	256286
Allentown	US	\N	683794
Houston	US	\N	5464251
Haripur	IN	\N	158142
Mysore	IN	\N	1014227
Yulin	CN	\N	5487368
Hengyang	CN	\N	7148344
Hejin	CN	\N	395527
Sungai Petani	MY	\N	358499
Shimoga	IN	\N	654055
Lahad Datu	MY	\N	199830
Sukabumi	ID	\N	320970
Xingyi	CN	\N	783120
Nangong	CN	\N	476096
Ajmer	IN	\N	542321
Al Jubayl	SA	\N	237274
Fort Lauderdale	US	\N	182437
Huanglongsi	CN	\N	4676159
Jima	ET	\N	177900
Chengtangcun	CN	\N	1603659
Sao Bernardo do Campo	BR	\N	816925
Kunsan	KR	\N	275155
Qian'an	CN	\N	728160
Bhiwandi	IN	\N	1125898
Faridabad	IN	\N	1394000
Ingraj Bazar	IN	\N	205521
Kamalshahr	IR	\N	141166
Krishnanagar	IN	\N	153062
Nishinomiya-hama	JP	\N	487413
Tuxtepec	MX	\N	144555
Lyubertsy	RU	\N	197705
Cape Coral	US	\N	668382
Fengcheng	CN	\N	543933
Gainesville	US	\N	202335
Tucson	US	\N	888486
Trichinopoly	IN	\N	916857
Ichinomiya	JP	\N	379689
Rajahmundry	IN	\N	341831
Wenling	CN	\N	1366794
Tokorozawa	JP	\N	341409
Rustenburg	ZA	\N	165976
Kitwe	ZM	\N	504194
Kawagoe	JP	\N	337931
Makiivka	UA	\N	347376
Enterprise	US	\N	164314
Bharatpur	NP	\N	143836
Yato	JP	\N	237445
Visalia	US	\N	237386
Corpus Christi	US	\N	342464
Augusta	US	\N	390809
Pyatigorsk	RU	\N	145836
Chungju	KR	\N	211005
Santa Maria Texmelucan	MX	\N	135500
Kamirenjaku	JP	\N	192489
Cologne	DE	\N	1085664
Kure	JP	\N	218351
Harrisburg	US	\N	442289
Puning	CN	\N	2055552
Hartford	US	\N	905152
Nagpur	IN	\N	2405665
Begusarai	IN	\N	252008
Bitung	ID	\N	218520
Berezniki	RU	\N	145115
Bhuj	IN	\N	289429
Brookhaven	US	\N	484671
Panshi	CN	\N	539804
Anjomachi	JP	\N	188181
Ujjain	IN	\N	515215
Obiraki	JP	\N	174972
Niiza	JP	\N	164083
Guli	CN	\N	723490
Minamiozuma	JP	\N	224926
Gaozhou	CN	\N	1288665
San Jose del Monte	PH	\N	574089
Gatineau	CA	\N	276245
Hachioji	JP	\N	577560
Leshan	CN	\N	3364000
Brooklyn	US	\N	2559903
Brownsville	US	\N	227239
Comayaguela	HN	\N	1250000
Wichita	US	\N	482249
Bhavnagar	IN	\N	554978
Ribeirao Preto	BR	\N	666323
Chicacole	IN	\N	137944
Tama	JP	\N	147832
Binan	PH	\N	333028
Burnaby	CA	\N	232755
Barreiras	BR	\N	158292
Bayamon	PR	\N	165383
Chimbote	PE	\N	497875
Khamis Mushayt	SA	\N	430828
Zigong	CN	\N	2800000
Fort Wayne	US	\N	334122
Sihui	CN	\N	542873
Raurkela	IN	\N	625831
Pittsburgh	US	\N	1703266
Qujing	CN	\N	5855055
Spartanburg	US	\N	182701
Nottingham	GB	\N	768638
Botucatu	BR	\N	139483
Kamarhati	IN	\N	330211
Nchelenge	ZM	\N	147927
Ankang	CN	\N	1100000
Panihati	IN	\N	377347
Golmeh	IR	\N	152894
Long Beach	US	\N	462628
Ferraz de Vasconcelos	BR	\N	184700
Bade	TW	\N	172065
Zhongshu	CN	\N	679624
Hempstead	US	\N	768057
Palmas	BR	\N	272726
Staryy Oskol	RU	\N	223360
Cilegon	ID	\N	387543
Hejian	CN	\N	810306
Kramatorsk	UA	\N	159445
Provo	US	\N	500617
Waitakere	NZ	\N	208100
Haldia	IN	\N	200762
Sagay	PH	\N	146264
Burlington	CA	\N	183314
Sacaba	BO	\N	172466
Niagara Falls	CA	\N	308596
Huich'on	KP	\N	168180
Santa Cruz	US	\N	176428
Naperville	US	\N	148449
Marysville	US	\N	170009
Itabuna	BR	\N	221938
Mataro	ES	\N	183293
Pali	IN	\N	229956
Columbia	US	\N	560041
Kolhapur	IN	\N	750000
Mogi Guacu	BR	\N	147233
Atlanta	US	\N	5449398
Kitaku	JP	\N	997536
Ramat Gan	IL	\N	152596
Orange	US	\N	138669
Manchester	US	\N	162877
Muzaffarpur	IN	\N	333200
Tenali	IN	\N	164937
Godhra	IN	\N	161925
Palmdale	US	\N	155079
Xinmin	CN	\N	680000
Ciudad de Melilla	ES	\N	141308
Porbandar	IN	\N	234684
Waterbury	US	\N	189614
Ellore	IN	\N	203780
Fayetteville	US	\N	351246
Taganrog	RU	\N	250287
Bournemouth	GB	\N	183491
Halwan	EG	\N	619293
Pasuruan	ID	\N	186262
Tachikawa	JP	\N	180880
Naberezhnyye Chelny	RU	\N	529797
Campina Grande	BR	\N	405072
General Trias	PH	\N	314303
Drug	IN	\N	268806
Kumba	CM	\N	144413
Bilbays	EG	\N	141285
Bekasi	ID	\N	2381053
Jiaojiangcun	CN	\N	471500
Sirsa	IN	\N	181639
Jacarei	BR	\N	226539
Panabo	PH	\N	184599
Al `Ayn	AE	\N	766936
Udipi	IN	\N	165401
Barddhaman	IN	\N	314265
Indore	IN	\N	2201927
Sheffield	GB	\N	685368
Dunhuang	CN	\N	186027
Daye	CN	\N	909724
Rio Grande	BR	\N	187838
Novocherkassk	RU	\N	168766
Shenmu	CN	\N	455493
Nashua	US	\N	233917
Cadiz	PH	\N	283157
Ait Melloul	MA	\N	171847
Madiun	ID	\N	186099
Xinyi	CN	\N	913708
Punta del Este	UY	\N	159000
Sao Jose dos Pinhais	BR	\N	665063
Daqing	CN	\N	2904532
Ichikawa	JP	\N	495592
Ashino	JP	\N	198566
Holon	IL	\N	188834
Huntington	US	\N	202673
St. Catharines	CA	\N	309319
Shubra al Khaymah	EG	\N	1025569
Jaboatao	BR	\N	702621
Mangalore	IN	\N	623841
Detroit	US	\N	3506126
Al Khmissat	MA	\N	131542
Americana	BR	\N	479472
Huangyan	CN	\N	198713
Balikpapan	ID	\N	598043
Cabanatuan City	PH	\N	302231
Negombo	LK	\N	142136
Round Lake Beach	US	\N	279381
Oakashicho	JP	\N	299094
Bat Yam	IL	\N	128800
Marbella	ES	\N	143386
Zaozhuang	CN	\N	3650000
Irving	US	\N	239798
Rongcheng	CN	\N	1302891
Artux	CN	\N	240368
Vina del Mar	CL	\N	332875
Hindupur	IN	\N	151677
Newcastle	AU	\N	322278
Qa'em Shahr	IR	\N	204953
Talcahuano	CL	\N	147831
Batu	ID	\N	190184
Latur	IN	\N	374394
Isidro Casanova	AR	\N	190696
Omdurman	SD	\N	2805396
Roseville	US	\N	141500
Beihai	CN	\N	1539251
Thane	IN	\N	1261517
Worthing	GB	\N	183000
Meerut	IN	\N	1305429
Dzerzhinsk	RU	\N	231797
Islington	GB	\N	206125
Fuji	JP	\N	245078
Birganj	NP	\N	135904
Anju	KP	\N	240117
As Sib	OM	\N	237816
Liaoyang	CN	\N	1800000
Linhai	CN	\N	1028813
Tumkur	IN	\N	399606
Purnea	IN	\N	310817
Sakurazuka	JP	\N	225008
Kusatsu	JP	\N	141928
Petion-Ville	HT	\N	359615
Tacoma	US	\N	217827
Jinzhou	CN	\N	3000000
Shache	CN	\N	373492
Chittoor	IN	\N	160722
Tochigi	JP	\N	155714
Huddersfield	GB	\N	162949
Edmonton	CA	\N	1062643
Sunrise Manor	US	\N	192934
Beppucho	JP	\N	173890
Corona	US	\N	169868
Dibrugarh	IN	\N	154019
Kamianske	UA	\N	235066
Greensboro	US	\N	343090
Dehui	CN	\N	839786
Atsugicho	JP	\N	224677
Huaibei	CN	\N	2158000
Abertawe	GB	\N	245500
Wolverhampton	GB	\N	254406
Cangzhou	CN	\N	6800000
Kopeysk	RU	\N	147573
Zamora	MX	\N	141627
Leizhou	CN	\N	1427664
Jamaame	SO	\N	185270
Santa Rosa	PH	\N	353767
Nishio	JP	\N	169926
Yaizu	JP	\N	136807
Klerksdorp	ZA	\N	178921
London	CA	\N	383822
Garden Grove	US	\N	171644
Bilaspur	IN	\N	331030
Bulandshahr	IN	\N	198612
Sibu	MY	\N	247995
Fuquan	CN	\N	283904
Akola	IN	\N	425817
Comilla	BD	\N	389411
Moradabad	IN	\N	787000
Torrance	US	\N	143592
Madinat as Sadis min Uktubar	EG	\N	500000
Binxian	CN	\N	323256
Warner Robins	US	\N	155140
Dese	ET	\N	187900
Saguenay	CA	\N	144746
Kennewick	US	\N	240735
Surat	IN	\N	5807000
Wonju	KR	\N	330854
Pematangsiantar	ID	\N	278055
Santos	BR	\N	433966
Gandajika	CD	\N	154425
New Bedford	US	\N	149910
Liaoyuan	CN	\N	506548
Silchar	IN	\N	152393
Zhengjiatun	CN	\N	419529
Nanyang	CN	\N	12010000
Juazeiro do Norte	BR	\N	225230
Honcho	JP	\N	639107
Bago	PH	\N	170981
Frederick	US	\N	156787
Ciudad Nezahualcoyotl	MX	\N	1109363
Markham	CA	\N	328966
Coimbatore	IN	\N	959823
Podolsk	RU	\N	299660
Mojokerto	ID	\N	130196
Cuttack	IN	\N	606007
Saskatoon	CA	\N	246376
Tinnevelly	IN	\N	542200
Fatehpur	IN	\N	166480
Myeik	MM	\N	266720
Bikaner	IN	\N	529007
Pomona	US	\N	151691
Toyokawa	JP	\N	183823
Mohammedia	MA	\N	208612
Shaoyang	CN	\N	7071000
Clarksville	US	\N	188746
Hongzhai	CN	\N	355037
Sale	MA	\N	850403
Caruaru	BR	\N	242094
Tiruppur	IN	\N	650000
Poole	GB	\N	151500
Mahbubnagar	IN	\N	190400
Zhuanghe	CN	\N	905852
Louisville	US	\N	1005654
Tongren	CN	\N	3093204
Portland	US	\N	2074775
Akron	US	\N	565208
Krasnogorsk	RU	\N	171793
Banjarbaru	ID	\N	216600
Soka	JP	\N	250939
Imperatriz	BR	\N	218106
Iruma	JP	\N	146802
Xuanzhou	CN	\N	2580000
Pune	IN	\N	7764000
Ageoshimo	JP	\N	225907
Fairfield	US	\N	148683
Rochester	US	\N	703952
Baoshan	CN	\N	2506491
Poughkeepsie	US	\N	394760
Volgodonsk	RU	\N	171471
Chandannagar	IN	\N	166867
Huaycan	PE	\N	160000
Bene Beraq	IL	\N	193774
Weifang	CN	\N	9373000
Puri	IN	\N	201026
Sakura	JP	\N	170906
Fenyang	CN	\N	416212
Baltimore	US	\N	2106068
Dourados	BR	\N	162202
Alleppey	IN	\N	176783
Mbanza-Ngungu	CD	\N	197545
Bhiwani	IN	\N	197662
Jacksonville	US	\N	1181496
Fuxin	CN	\N	1930000
Concord	US	\N	652308
Bremerton	US	\N	218400
Kusong	KP	\N	196515
Oxnard	US	\N	387647
Zhangjiakou	CN	\N	4345491
Elektrostal	RU	\N	158508
Yanji	CN	\N	513072
Secunderabad	IN	\N	213698
Laredo	US	\N	262079
Sikar	IN	\N	400000
Xinji	CN	\N	615919
Marg`ilon	UZ	\N	215400
Koga	JP	\N	139274
Vaughan	CA	\N	306233
Probolinggo	ID	\N	223159
Olinda	BR	\N	921840
Tuscaloosa	US	\N	155499
Sosan	KR	\N	169221
Dandong	CN	\N	2400000
Qingyuan	CN	\N	3874000
Santarem	BR	\N	230428
Proddatur	IN	\N	163970
Fargo	US	\N	208675
Noginsk	RU	\N	229731
Braganca Paulista	BR	\N	160665
Vidisha	IN	\N	155959
Yangchun	CN	\N	849504
Dali	CN	\N	652045
Islip	US	\N	332862
Shuangshui	CN	\N	1221000
Henderson	US	\N	320189
Sagamihara	JP	\N	722828
Safi	MA	\N	308508
Escondido	US	\N	151625
Ekibastuz	KZ	\N	159760
Mesquite	US	\N	140937
Chaedok	KP	\N	187270
York	US	\N	233184
Yingtan	CN	\N	1288615
Santa Clarita	US	\N	312446
Welkom	ZA	\N	431944
Budaun	IN	\N	161555
Saddiqabad	PK	\N	189876
Xintai	CN	\N	1315942
Hangu	CN	\N	332793
San Diego	US	\N	3220118
Worcester	US	\N	498328
Alexandria	US	\N	159428
Yucheng	CN	\N	1512000
Hickory	US	\N	218323
Derby	GB	\N	270500
Aurora	US	\N	379289
Thornton	US	\N	141464
Gilbert	US	\N	254114
Ann Arbor	US	\N	322267
Oakland	US	\N	433031
Bole	CN	\N	235585
Sitalpur	IN	\N	164435
Jilin	CN	\N	2396000
Orlando	US	\N	1822394
Shahjanpur	IN	\N	320434
Itu	BR	\N	167095
Tasikmalaya	ID	\N	678027
Medford	US	\N	170876
Lafayette	US	\N	264357
Ube	JP	\N	164325
Jamalpur	BD	\N	167900
York	GB	\N	153717
Pingzhen	TW	\N	201632
Xin'an	CN	\N	920628
San Jose	US	\N	1798103
Zunyi	CN	\N	6127009
Fontana	US	\N	214547
Ramgundam	IN	\N	242979
Santo Tomas	PH	\N	179844
Toowoomba	AU	\N	136861
Malang	ID	\N	780000
Bontang	ID	\N	161413
Higashi-osaka	JP	\N	494640
Kukichuo	JP	\N	151106
Halifax	CA	\N	403131
Oakville	CA	\N	193832
Hugli	IN	\N	179931
Letpandan	MM	\N	176571
Noda	JP	\N	152652
Jieshou	CN	\N	561956
Tongchuanshi	CN	\N	282258
Los Angeles	US	\N	12750807
Kalamazoo	US	\N	215193
Blumenau	BR	\N	309011
Oceanside	US	\N	175742
Liverpool	GB	\N	864122
Almetyevsk	RU	\N	154262
Ogden	US	\N	578523
Yiyang	CN	\N	4174000
Anshan	CN	\N	3645884
Shuizhai	CN	\N	1003698
Bonita Springs	US	\N	421291
Londrina	BR	\N	520238
Bronx	US	\N	1418207
Fuyu	CN	\N	356905
Mauli	IN	\N	146213
Singkawang	ID	\N	230376
Asahikawa	JP	\N	334692
Tema	GH	\N	161612
Maua	BR	\N	453286
Novokuznetsk	RU	\N	552105
Madison	US	\N	447245
Kisarazu	JP	\N	135765
Dallas	US	\N	5743938
Temirtau	KZ	\N	185082
Muar	MY	\N	191346
Cholula de Rivadabia	MX	\N	193554
Grand Prairie	US	\N	194543
Houma	US	\N	140469
Sao Carlos	BR	\N	241389
Chigasaki	JP	\N	241887
Juiz de Fora	BR	\N	470193
Divinopolis	BR	\N	193832
Ludhiana	IN	\N	1649000
Yachiyo	JP	\N	197792
Xiangtan	CN	\N	2748552
Beining	CN	\N	514898
Croydon	GB	\N	192064
North Las Vegas	US	\N	251974
Tegucigalpita	HN	\N	196856
Santa Ana	US	\N	332318
Jaunpur	IN	\N	180362
Guwahati	IN	\N	957352
Cencheng	CN	\N	772113
Carolina	PR	\N	140072
Itami	JP	\N	198395
Mississauga	CA	\N	721599
Durgapur	IN	\N	566517
Tanauan	PH	\N	173366
Meishan	CN	\N	3020000
Jau	BR	\N	143283
Shenzhou	CN	\N	566087
Cotia	BR	\N	229548
Batu Pahat	MY	\N	140000
San Antonio	US	\N	2049293
Bakersfield	US	\N	579295
Atibaia	BR	\N	137187
Cartagena	ES	\N	214802
Jhansi	IN	\N	507000
Asan	KR	\N	319929
Chanda	IN	\N	595118
Lincang	CN	\N	2429497
Salavat	RU	\N	153181
Mangghystau	KZ	\N	147443
Patos de Minas	BR	\N	150833
Talisay	PH	\N	227645
Iksan	KR	\N	302310
Yulinshi	CN	\N	3328000
Sao Caetano do Sul	BR	\N	158024
Xiaoyi	CN	\N	468770
Zhaotong	CN	\N	5213521
Wollongong	AU	\N	302739
Kafr ad Dawwar	EG	\N	262748
Cam Ranh	VN	\N	146771
Dhahran	SA	\N	138135
Shinozaki	JP	\N	257038
Anantapur	IN	\N	267161
Vadodara	IN	\N	2065771
Shendi	SD	\N	186611
Hapur	IN	\N	242920
Wamba	CD	\N	146871
Uijeongbu	KR	\N	421579
Kariya	JP	\N	153190
San Juan	PR	\N	331165
Al Qatif	SA	\N	368892
Toyohashi	JP	\N	373234
Rio Claro	BR	\N	199961
Kalyan	IN	\N	1576614
Panipat	IN	\N	292808
Elkhart	US	\N	147567
Hachimancho	JP	\N	239046
Manta	EC	\N	217553
Ussuriysk	RU	\N	170660
Chuxiong	CN	\N	588620
P'yong-dong	KP	\N	236583
Swindon	GB	\N	192599
Iwata	JP	\N	166393
Santa Barbara	US	\N	202401
Lipa City	PH	\N	332386
Pembroke Pines	US	\N	173591
Birstall	GB	\N	1424216
Baojishi	CN	\N	3738700
Nova Friburgo	BR	\N	171991
Ipswich	AU	\N	163000
Yuci	CN	\N	840000
San Carlos City	PH	\N	188571
Greeley	US	\N	137810
Dhanbad	IN	\N	1246000
Pinghu	CN	\N	671834
Gulfport	US	\N	220987
Cary	US	\N	170282
Scranton	US	\N	384250
Angarsk	RU	\N	226374
Sochi	RU	\N	411524
Quilon	IN	\N	397419
Hollywood	US	\N	154817
Gujiao	CN	\N	220876
Tangshan	CN	\N	7100000
Laiyang	CN	\N	874127
North Hempstead	US	\N	230241
Townsville	AU	\N	180820
Livingstone	ZM	\N	136897
Taiping	MY	\N	237095
Zhijiang	CN	\N	495995
Itajai	BR	\N	327126
Uji	JP	\N	180975
Bauru	BR	\N	366992
Metro	ID	\N	161799
Huntington Beach	US	\N	199223
Macau	MO	\N	568700
Hialeah	US	\N	233339
Pabna	BD	\N	137888
Miami	US	\N	6445545
Bhayandar	IN	\N	814655
Jining	CN	\N	8023000
Severodvinsk	RU	\N	183996
Ipatinga	BR	\N	407894
Kakamigahara	JP	\N	144335
Port Elizabeth	ZA	\N	312392
Semey	KZ	\N	340000
San Jose	PH	\N	139738
Hamamatsu	JP	\N	791770
Palm Bay	US	\N	507002
Sale	GB	\N	134022
Ulhasnagar	IN	\N	506098
Yonkers	US	\N	200370
Jodhpur	IN	\N	995000
Danao	PH	\N	136471
Yuncheng	CN	\N	4860000
La Laguna	ES	\N	157503
Kediri	ID	\N	252000
Harrow	GB	\N	149246
Milwaukee	US	\N	1365787
Sarta	IR	\N	271467
Indio	US	\N	417059
Seogwipo	KR	\N	153861
Pensacola	US	\N	346921
Yueqing	CN	\N	1389332
Toledo	PH	\N	170335
Jamuria	IN	\N	149220
Passo Fundo	BR	\N	179529
Binjai	ID	\N	269053
Muridke	PK	\N	163268
East London	ZA	\N	338627
Etawah	IN	\N	257448
Montes Claros	BR	\N	361915
Bhatpara	IN	\N	386019
Nampa	US	\N	184428
Caerdydd	GB	\N	479000
Shrirampur	IN	\N	181842
Regina	CA	\N	215106
Guigang	CN	\N	4118808
Tottori	JP	\N	188740
Birmingham	GB	\N	2897303
Vizianagaram	IN	\N	228720
Cleveland	US	\N	1710093
Jicheon	KR	\N	137540
Xingtai	CN	\N	611739
Mariupol	UA	\N	449498
Fort Collins	US	\N	312666
Shangqiu	CN	\N	1753000
Surakarta	ID	\N	552118
Guarapuava	BR	\N	150850
Varzea Grande	BR	\N	249752
Bijie	CN	\N	6537498
Misato	JP	\N	141514
Balashikha	RU	\N	450771
Cirebon	ID	\N	316126
Calgary	CA	\N	1239220
Anshun	CN	\N	2297612
Armavir	RU	\N	190709
Matsudo	JP	\N	492671
Nizhnevartovsk	RU	\N	274575
Jackson	US	\N	325350
Mzuzu	MW	\N	150100
Las Pinas City	PH	\N	588894
Santa Maria	US	\N	140545
Frisco	US	\N	200490
Lianjiang	CN	\N	1443099
Amarillo	US	\N	205603
Carrollton	US	\N	139248
Potchefstroom	ZA	\N	148804
Charlotte	US	\N	1512923
Linfen	CN	\N	4316610
Muzaffarnagar	IN	\N	392451
Benoni	ZA	\N	158777
Ternate	ID	\N	204215
Karimnagar	IN	\N	289821
Columbus	US	\N	1562009
Jianguang	CN	\N	1507402
Huaihua	CN	\N	4741948
Shangzhou	CN	\N	2400000
Chofugaoka	JP	\N	239650
Jammu	IN	\N	502197
Erie	US	\N	184484
Narsingdi	BD	\N	185128
Rohtak	IN	\N	374292
Belgaum	IN	\N	488157
Beipiao	CN	\N	496164
Duyun	CN	\N	493574
Hechi	CN	\N	3830000
Hemet	US	\N	177253
High Point	US	\N	179913
Bharatpur	IN	\N	252342
Mingaora	PK	\N	279914
Oxford	GB	\N	154600
Jiaozuo	CN	\N	3540101
Zhongxiang	CN	\N	1022514
Huainan	CN	\N	2409000
Ontario	US	\N	185010
South Bend	US	\N	280498
Chinju	KR	\N	337230
Grand Rapids	US	\N	609314
Sumare	BR	\N	265955
Lajes	BR	\N	156727
Dayton	US	\N	718353
Allahabad	IN	\N	1201000
Hafr al Batin	SA	\N	249194
Sao Vicente	BR	\N	355542
Tyler	US	\N	143796
Sioux Falls	US	\N	187239
Ishizaki	JP	\N	141293
Barranca	PE	\N	144381
Paita	PE	\N	179346
Cherepovets	RU	\N	318856
Victorville	US	\N	346789
Lobito	AO	\N	207932
Gongzhuling	CN	\N	1092692
`Unayzah	SA	\N	163729
Shreveport	US	\N	280062
Fuyuan	CN	\N	480000
Wugang	CN	\N	734870
Osasco	BR	\N	694844
Northcote	NZ	\N	205605
Telford	GB	\N	142723
Kochi	IN	\N	677381
Colorado Springs	US	\N	642413
Seattle	US	\N	3789215
Jalgaon	IN	\N	460468
Trenton	US	\N	290716
Qufu	CN	\N	640498
Hedong	CN	\N	197885
Iwaki	JP	\N	340231
Petropolis	BR	\N	298142
Khanpur	PK	\N	160308
Kolpino	RU	\N	225801
Barueri	BR	\N	262275
Surgut	RU	\N	360590
Macon	US	\N	153159
Amravati	IN	\N	549370
Dundee	GB	\N	148270
Basildon	GB	\N	185900
Khuzdar	PK	\N	141395
Geelong	AU	\N	263280
Saharsa	IN	\N	156540
Franco da Rocha	BR	\N	145755
Saint-Marc	HT	\N	160181
Dindigul	IN	\N	207327
Muskegon	US	\N	153565
Vellore	IN	\N	177081
Bridgeport	US	\N	924449
Fuyang	CN	\N	8360000
Bukit Mertajam	MY	\N	210000
Pueblo	US	\N	143932
Kelowna	CA	\N	142146
Medinipur	IN	\N	169264
Tirupati	IN	\N	287482
Gurgaon	IN	\N	197340
Buenavista	MX	\N	206081
Philadelphia	US	\N	5649300
Ulanhot	CN	\N	327081
Moanda	CD	\N	153915
Boma	CD	\N	178638
Hubli	IN	\N	890000
Kunp'o	KR	\N	285721
Danbury	US	\N	176030
Jerez de la Frontera	ES	\N	212749
Santo Agostinho	BR	\N	185025
Ashdod	IL	\N	220174
Barasat	IN	\N	278435
Bogor	ID	\N	1030720
Naihati	IN	\N	217900
Xingcheng	CN	\N	993000
Jiangjiafan	CN	\N	400000
Hancheng	CN	\N	391164
Ottawa	CA	\N	989567
Caxias	BR	\N	134640
Halle	DE	\N	239257
Shimotoda	JP	\N	141724
Campinas	BR	\N	1164098
Dengtacun	CN	\N	496122
Umtata	ZA	\N	137772
Zhuozhou	CN	\N	603535
Sobral	BR	\N	157996
Sievierodonetsk	UA	\N	150000
Gaoping	CN	\N	2174000
Navsari	IN	\N	163000
Obuase	GH	\N	180460
Brahmanbaria	BD	\N	268279
Bezwada	IN	\N	1048240
Ghaziabad	IN	\N	2381452
Ogaki	JP	\N	158911
Bengbu	CN	\N	3525000
Khimki	RU	\N	244668
Syracuse	US	\N	404223
Winnipeg	CA	\N	705244
Reading	US	\N	267155
Rafael Castillo	AR	\N	147965
Chakradharpur	IN	\N	197953
Charleston	US	\N	628377
Minamisuita	JP	\N	381829
Pyeongtaek	KR	\N	457873
Narashino	JP	\N	173716
Toledo	US	\N	482111
Qyzylorda	KZ	\N	200900
Barrie	CA	\N	172657
Bhimavaram	IN	\N	142184
Sizhan	CN	\N	730400
Khartoum North	SD	\N	936349
Siping	CN	\N	3300000
Kakogawacho-honmachi	JP	\N	262308
Sao Jose do Rio Preto	BR	\N	442548
Shahe	CN	\N	486329
Huayin	CN	\N	258113
Biysk	RU	\N	203108
Carrefour	HT	\N	511345
Antioch	US	\N	302419
Hungnam	KP	\N	751322
Manchester	GB	\N	2705000
Raiganj	IN	\N	183612
Tarakan	ID	\N	201635
Tai'an	CN	\N	5499000
Kamakurayama	JP	\N	172262
Joliet	US	\N	147344
Murfreesboro	US	\N	179951
Madan	IR	\N	231476
Laval	CA	\N	422993
Chicago	US	\N	8604203
Kakinada	IN	\N	384182
St. Louis	US	\N	2024074
Rybinsk	RU	\N	190429
Newcastle	GB	\N	1650000
Greenville	US	\N	484465
Sterlitamak	RU	\N	280233
Laohekou	CN	\N	471482
Baotou	CN	\N	2700000
Takaoka	JP	\N	174806
Newport News	US	\N	179225
Yanbu`	SA	\N	267590
Lancaster	US	\N	401524
Uvira	CD	\N	170391
Fushun	CN	\N	2300000
Conjeeveram	IN	\N	164384
Al Kharj	SA	\N	298428
Jinghong	CN	\N	519935
Paradise	US	\N	233689
Huanghua	CN	\N	548507
Ozamiz City	PH	\N	141828
Kulti	IN	\N	313809
Reading	GB	\N	337108
Guangyuan	CN	\N	2484122
Fuzhou	CN	\N	5245000
Shulan	CN	\N	663403
Sato	JP	\N	237444
Taubate	BR	\N	302331
Diadema	BR	\N	412428
Jamshedpur	IN	\N	1558000
Richmond	CA	\N	198309
Zibo	CN	\N	4530597
Fort Worth	US	\N	909585
Volzhskiy	RU	\N	326055
Inazawa	JP	\N	135676
Norwich	GB	\N	213166
Chuzhou	CN	\N	4110000
Deo	IN	\N	173216
Aurangabad	IN	\N	1371330
Tetouan	MA	\N	380787
Al Khubar	SA	\N	219679
Arapiraca	BR	\N	187668
Uberlandia	BR	\N	604013
Higashi-murayama	JP	\N	150186
Patam	ID	\N	1029808
New Haven	US	\N	564830
Bali	IN	\N	293373
Chapeco	BR	\N	160157
Depok	ID	\N	1631951
Shuangyashan	CN	\N	1530000
Sannai	IN	\N	283004
Ilheus	BR	\N	230622
Santa Barbara d'Oeste	BR	\N	190139
Hulin	CN	\N	290000
Bhusaval	IN	\N	183001
Davenport	US	\N	285362
San Bernardino	US	\N	215784
Qo`qon	UZ	\N	350000
Pencheng	CN	\N	419047
Gyeongsan	KR	\N	278500
Valencia	PH	\N	192993
Ongole	IN	\N	252739
Joetsu	JP	\N	189881
Norwich	US	\N	200289
Ximeicun	CN	\N	1508000
Beaumont	US	\N	146091
Danjiangkou	CN	\N	443755
Warrington	GB	\N	165456
Tsuchiura	JP	\N	138517
Midland	US	\N	154793
Prokopyevsk	RU	\N	196406
Randburg	ZA	\N	337053
Parbhani	IN	\N	378326
Criciuma	BR	\N	204217
Agra	IN	\N	1585705
Petrolina	BR	\N	260985
Kamensk-Ural'skiy	RU	\N	169929
Nasik	IN	\N	1486053
Wudalianchi	CN	\N	360000
Edinburgh	GB	\N	488050
Springfield	US	\N	623401
Kimhae	KR	\N	534124
Al Mahallah al Kubra	EG	\N	543271
Mytishchi	RU	\N	205397
Xiantao	CN	\N	1175085
Kasugai	JP	\N	306876
Ch'ungmu	KR	\N	137208
Kabankalan	PH	\N	181977
Gwangmyeongni	KR	\N	318021
Yongji	CN	\N	444724
Renqiu	CN	\N	822455
Delmas	HT	\N	284079
Yuyao	CN	\N	1095000
Middelburg	ZA	\N	154706
Hitachi	JP	\N	176069
Yamagata	JP	\N	249327
Gisenyi	RW	\N	136830
Ksar El Kebir	MA	\N	306600
Tuticorin	IN	\N	436094
Chattanooga	US	\N	415501
Mahesana	IN	\N	184991
San Lorenzo	PY	\N	387977
Rancho Cucamonga	US	\N	177603
Xiulin	CN	\N	577022
Curepipe	MU	\N	299975
Petaling Jaya	MY	\N	638516
Jessore	BD	\N	243987
Xindi	CN	\N	819446
Lexington	US	\N	317110
Malegaon	IN	\N	690844
Rubtsovsk	RU	\N	145333
Jiangshan	CN	\N	467862
Grand Junction	US	\N	139143
Qarchak	IR	\N	231075
Bijapur	IN	\N	327427
Stoke-on-Trent	GB	\N	372775
Zhongli	TW	\N	1632616
Yan'an	CN	\N	2150000
Zouping	CN	\N	726722
Shiliguri	IN	\N	294546
Mogi das Cruzes	BR	\N	424633
Centurion	ZA	\N	236580
Garland	US	\N	239928
Mandsaur	IN	\N	141667
Piracicaba	BR	\N	342209
Sinp'o	KP	\N	152759
Hanam	KR	\N	154838
Santo Andre	BR	\N	710210
Novorossiysk	RU	\N	270774
Olathe	US	\N	140545
Oyster Bay	US	\N	297531
Joinvile	BR	\N	988000
Gijon	ES	\N	271780
Salem	US	\N	266804
Habra	IN	\N	147221
Yangzhou	CN	\N	4459000
Santa Rosa	US	\N	324634
Bareilly	IN	\N	1000000
McAllen	US	\N	804114
Eugene	US	\N	273439
Gwalior	IN	\N	1101981
Disuq	EG	\N	143404
Buffalo	US	\N	914341
Madhyamgram	IN	\N	196127
Rishon LeZiyyon	IL	\N	249860
Gonzalez Catan	AR	\N	238067
Shantipur	IN	\N	151777
Kawanakajima	JP	\N	1437266
Presidente Prudente	BR	\N	222192
Gastonia	US	\N	182581
Canton	US	\N	269418
Zhumadian	CN	\N	7640000
Fukuyama	JP	\N	462203
Aligarh	IN	\N	1131160
Maraba	BR	\N	266932
Campos	BR	\N	387417
Leicester	GB	\N	508916
Yantai	CN	\N	6516900
Moratuwa	LK	\N	200000
Morelia	MX	\N	784776
Tarapoto	PE	\N	240453
Rampur	IN	\N	296418
Hiratsuka	JP	\N	257729
Blagoveshchensk	RU	\N	224419
Tangail	BD	\N	180144
Cascavel	BR	\N	257172
Lhokseumawe	ID	\N	180200
Dam Dam	IN	\N	114786
Villanueva	HN	\N	157615
Kuwana	JP	\N	139587
Montgomery	US	\N	254634
Nanded	IN	\N	623708
Anchorage	US	\N	247949
Pingdu	CN	\N	1378900
Matsuzaka	JP	\N	160080
Sanzhou	CN	\N	1680000
Nehe	CN	\N	740000
Miass	RU	\N	151856
Foz do Iguacu	BR	\N	256088
Kihung	KR	\N	425184
Riverside	US	\N	2107852
Taihecun	CN	\N	930000
Sabadell	ES	\N	213644
Odintsovo	RU	\N	140537
Ichihara	JP	\N	270478
Plano	US	\N	287677
Cuddapah	IN	\N	344893
Yanggok	KR	\N	629061
Madanapalle	IN	\N	180180
Bristol	GB	\N	724000
Youngstown	US	\N	378732
El Progreso	HN	\N	143360
Sorocaba	BR	\N	644919
Jiaozhou	CN	\N	900500
Chirchiq	UZ	\N	159400
Iguacu	BR	\N	844583
Yei	SS	\N	185000
Portsmouth	GB	\N	855679
Loudi	CN	\N	3785627
Parnaiba	BR	\N	138008
Ocala	US	\N	169383
Dalian	CN	\N	4480000
Kusti	SD	\N	345068
Anapolis	BR	\N	366491
Jurong	CN	\N	617706
Lingyuan	CN	\N	570660
Zaoyang	CN	\N	1004741
Oshawa	CA	\N	166000
Magnitogorsk	RU	\N	418241
Yonago	JP	\N	147667
Yuanping	CN	\N	491213
Tamuramachi-moriyama	JP	\N	340560
Burhanpur	IN	\N	197233
Badalona	ES	\N	220440
Uberaba	BR	\N	325279
Salinas	US	\N	190972
Omaha	US	\N	847819
Bacoor	PH	\N	600609
Settat	MA	\N	142250
Vancouver	US	\N	184463
Al Manaqil	SD	\N	151827
Korolev	RU	\N	221797
Manukau City	NZ	\N	375600
Cairns	AU	\N	152729
Mossoro	BR	\N	202583
Imus	PH	\N	403785
Yokkaichi	JP	\N	310145
Ahmadnagar	IN	\N	350859
Las Vegas	US	\N	2104198
Pizhou	CN	\N	1458038
Yunfu	CN	\N	1470000
Yidu	CN	\N	384598
Dayan	CN	\N	1244769
Merced	US	\N	145149
Quillacollo	BO	\N	137182
Xiangxiang	CN	\N	787216
Firozabad	IN	\N	306409
Balurghat	IN	\N	153279
Novo Hamburgo	BR	\N	876990
Manzhouli	CN	\N	249472
Chongju	KP	\N	189742
Killeen	US	\N	258009
Kenitra	MA	\N	431282
Taboao da Serra	BR	\N	272177
Zhangshu	CN	\N	610424
Balakovo	RU	\N	191260
Asansol	IN	\N	563917
Kochi	JP	\N	328930
Flint	US	\N	332190
Fujin	CN	\N	470000
Hanzhong	CN	\N	3700000
Ichalkaranji	IN	\N	287570
Taza	MA	\N	148456
Richmond	US	\N	1075798
Chirala	IN	\N	172826
Kumi	KR	\N	421075
Benxi	CN	\N	1567000
Savannah	US	\N	276295
Surrey	CA	\N	517887
Meycauayan	PH	\N	209083
Nagercoil	IN	\N	224329
Durban	ZA	\N	595061
Brampton	CA	\N	593638
Songnam	KR	\N	948757
Manhattan	US	\N	1628706
Myingyan	MM	\N	163812
College Station	US	\N	215243
Taiping	CN	\N	407594
Gulbarga	IN	\N	483615
Vitoria da Conquista	BR	\N	308204
Xiaoganzhan	CN	\N	4665000
Sunderland	GB	\N	174286
Gaobeidian	CN	\N	640280
Fredericksburg	US	\N	168909
Overland Park	US	\N	195494
Oruro	BO	\N	264683
Huazhou	CN	\N	1468061
New Orleans	US	\N	1020886
Wenzhou	CN	\N	4310000
Cuddalore	IN	\N	173676
Ipswich	GB	\N	180000
Hospet	IN	\N	286007
Sullana	PE	\N	162434
Anaheim	US	\N	350365
Mwene-Ditu	CD	\N	189177
Barrechid	MA	\N	136634
Saidpur	BD	\N	232209
Aberdeen	GB	\N	214610
New York	US	\N	18713220
Kolomna	RU	\N	144125
Shouguang	CN	\N	1039205
Longquan	CN	\N	234626
Izumo	JP	\N	172784
San Francisco	US	\N	3592294
Schaarbeek	BE	\N	133010
Arlington	US	\N	398854
Mirzapur	IN	\N	2496970
Tanjore	IN	\N	222943
Fresno	US	\N	703498
Rahimyar Khan	PK	\N	353203
Tongjin	KR	\N	971327
Guri	KR	\N	180063
Komaki	JP	\N	148709
Anguo	CN	\N	370317
Hongjiang	CN	\N	498100
Victoria	CA	\N	335696
Okazaki	JP	\N	387294
Yushu	CN	\N	1304436
Tsukuba-kenkyugakuen-toshi	JP	\N	240987
Hitachi-Naka	JP	\N	155680
Haora	IN	\N	1077075
Padangsidempuan	ID	\N	225544
Puerto Cortes	HN	\N	200000
Albany	US	\N	586383
Durham	US	\N	424700
Mahabad	IR	\N	162434
Vila Velha	BR	\N	1209091
Quebec City	CA	\N	705103
Cedar Rapids	US	\N	188038
Denton	US	\N	457177
Sambalpur	IN	\N	310852
Al Mubarraz	SA	\N	298562
Kurnool	IN	\N	457633
Quevedo	EC	\N	150827
Beian	CN	\N	470000
Guntur	IN	\N	647508
Chau Doc	VN	\N	157298
Matola	MZ	\N	1032197
Villeurbanne	FR	\N	147712
Glendale	US	\N	252381
Nellore	IN	\N	547621
Chingola	ZM	\N	147448
Sunch'on	KP	\N	437000
Ratlam	IN	\N	273892
Kolar	IN	\N	144625
Dongxing	CN	\N	144709
Natal	BR	\N	980588
Pasadena	US	\N	151227
Bhagalpur	IN	\N	410210
Timon	BR	\N	203157
Nawabganj	BD	\N	142361
Huai'an	CN	\N	4799889
Barra Mansa	BR	\N	169386
Binghamton	US	\N	148145
Khammam	IN	\N	196283
Wafangdian	CN	\N	1024876
Nador	MA	\N	161726
North Port	US	\N	209070
Guankou	CN	\N	1168056
Sacala	MZ	\N	206449
Laibin	CN	\N	2099711
Kawaguchi	JP	\N	592373
Langfang	CN	\N	4358839
Kirov	RU	\N	501468
Surprise	US	\N	141664
Botou	CN	\N	584308
Solapur	IN	\N	951558
Suzuka	JP	\N	195762
Tieling	CN	\N	3000000
Port Arthur	US	\N	154468
Baramula	IN	\N	167986
Tampa	US	\N	2908063
Tangjin	KR	\N	163762
Pindamonhangaba	BR	\N	160614
Kansas City	US	\N	1636715
Xinyang	CN	\N	6634000
Dumai	ID	\N	264084
Toronto	CA	\N	5429524
Spokane	US	\N	412275
Bahraigh	IN	\N	182218
Karnal	IN	\N	225049
Lincoln	US	\N	289490
Abbotsford	CA	\N	141397
Kissimmee	US	\N	382720
Touggourt	DZ	\N	143270
Birmingham	US	\N	739573
Sherbrooke	CA	\N	161323
Hamilton	CA	\N	693645
Sao Jose dos Campos	BR	\N	688597
Jeddah	SA	\N	3976000
Cincinnati	US	\N	1662691
Lakewood	US	\N	157935
Carpina	BR	\N	165579
Sorong	ID	\N	272349
Rockford	US	\N	282762
Diaobingshancun	CN	\N	241431
Kaech'on	KP	\N	319554
Scottsdale	US	\N	258069
Atlantic City	US	\N	237054
Chula Vista	US	\N	274492
San Pablo de las Salinas	MX	\N	189453
Hortolandia	BR	\N	215819
Izuo	JP	\N	185208
Davangere	IN	\N	503564
Kyongju	KR	\N	264091
Taishan	CN	\N	941095
Danyang	CN	\N	980662
Rio Largo	BR	\N	158545
Anseong	KR	\N	194765
Montreal	CA	\N	3519595
Deltona	US	\N	198361
Wu'an	CN	\N	819000
Daiwanishi	JP	\N	153597
Yao	JP	\N	266386
Narayanganj	BD	\N	223622
Jabalpur	IN	\N	1267564
Zlatoust	RU	\N	167978
Miramar	US	\N	141191
Belfast	GB	\N	333871
Klang	MY	\N	878000
Mallawi	EG	\N	139929
Huntsville	US	\N	319249
Cabuyao	PH	\N	308745
Kokubunji	JP	\N	127790
Bankura	IN	\N	137386
Luton	GB	\N	213052
San Pablo	PH	\N	266068
Metairie	US	\N	143481
Baharampur	IN	\N	195223
Baoding	CN	\N	10700000
Sandton	ZA	\N	222415
Brahmapur	IN	\N	324726
Chitungwiza	ZW	\N	340360
Knoxville	US	\N	586048
Saharanpur	IN	\N	705478
Handan	CN	\N	8499000
Temara	MA	\N	313510
Sanhe	CN	\N	652042
Uiwang	KR	\N	154879
Castanhal	BR	\N	137406
Glasgow	GB	\N	985290
Jiangyin	CN	\N	1241045
Binzhou	CN	\N	3779200
Sandakan	MY	\N	396290
Pathankot	IN	\N	155909
Jinggangshan	CN	\N	157000
Milton Keynes	GB	\N	229941
Governador Valadares	BR	\N	250878
Ambala	IN	\N	146787
Moreno Valley	US	\N	213055
Yingmen	CN	\N	350000
Rajapalaiyam	IN	\N	369991
Kaiyuan	CN	\N	1160000
Kashiwa	JP	\N	429070
Nashville	US	\N	1081903
Nakhodka	RU	\N	159551
Marilia	BR	\N	232006
Gojra	PK	\N	157863
Jersey City	US	\N	262075
Macae	BR	\N	143029
Ibb	YE	\N	234837
Huadian	CN	\N	455339
Palm Coast	US	\N	417007
Jiutai	CN	\N	205399
Dasmarinas	PH	\N	659019
Coventry	GB	\N	362690
At Ta'if	SA	\N	579970
Saugor	IN	\N	328240
Springs	ZA	\N	236083
Cimahi	ID	\N	586580
Lorain	US	\N	180279
Chesapeake	US	\N	244835
Pingdingshan	CN	\N	4838000
Aracatuba	BR	\N	192757
Nalgonda	IN	\N	154326
Denov	UZ	\N	217274
Qingzhou	CN	\N	914047
Hisar	IN	\N	307024
San Pedro	PH	\N	325809
Warnes	BO	\N	214216
Baisha	CN	\N	446000
Gibraltar	GI	\N	187083
Ilford	GB	\N	168168
Fardis	IR	\N	181174
Winter Haven	US	\N	267069
Hebi	CN	\N	1419000
Dingzhou	CN	\N	1165182
Odessa	US	\N	155998
Limbe	CM	\N	212474
Fullerton	US	\N	138632
Sonipat	IN	\N	250521
Pelotas	BR	\N	320674
Albuquerque	US	\N	761195
Itapetininga	BR	\N	157016
Beni	CD	\N	332903
Al Hawiyah	SA	\N	148151
Kingston upon Hull	GB	\N	573300
Ponta Grossa	BR	\N	292177
Francisco Morato	BR	\N	168243
Jamnagar	IN	\N	479920
Ich'on	KR	\N	209003
Bratsk	RU	\N	231602
Anyang	KR	\N	573296
Nizamabad	IN	\N	388505
Bellary	IN	\N	445388
Uppsala	SE	\N	164535
Sambhal	IN	\N	220813
Chishui	CN	\N	237052
Kerch	UA	\N	149566
Orsk	RU	\N	230414
Vigo	ES	\N	295364
Barnstable	US	\N	242847
Qingzhen	CN	\N	467992
Sete Lagoas	BR	\N	201334
Quang Ha	VN	\N	1000000
Fyzabad	IN	\N	153047
Nazret	ET	\N	476892
Spring Valley	US	\N	199722
Neya	JP	\N	229974
Sunnyvale	US	\N	152703
Gitega	BI	\N	41944
Syzran	RU	\N	173260
Koshigaya	JP	\N	345458
Jalandhar	IN	\N	873725
Chengde	CN	\N	3610000
Fremont	US	\N	241110
Bima	ID	\N	136492
Ap Da Loi	VN	\N	256019
Hakodate	JP	\N	256222
Tebingtinggi	ID	\N	169786
Porto Amboim	AO	\N	137000
Machilipatnam	IN	\N	169892
Staten Island	US	\N	476143
Laiwu	CN	\N	1248636
St. Petersburg	US	\N	265351
Irvine	US	\N	287401
Salem	IN	\N	693236
Suzhou	CN	\N	5690000
Machida	JP	\N	434407
Wilmington	US	\N	255616
Al Jahra'	KW	\N	194193
Minneapolis	US	\N	2977172
Wuchuan	CN	\N	927275
Chech'on	KR	\N	136350
Naka	JP	\N	195318
Erode	IN	\N	151184
Longueuil	CA	\N	239700
Kitchener	CA	\N	470015
Chandler	US	\N	261165
Bhilwara	IN	\N	389911
Kasukabe	JP	\N	229932
Caxias do Sul	BR	\N	381270
Roodepoort	ZA	\N	326416
Toyota	JP	\N	426477
Al Hillah	SA	\N	594605
Chinchvad	IN	\N	1729320
Bidar	IN	\N	300136
Lubbock	US	\N	267648
Green Bay	US	\N	207557
Jequie	BR	\N	135574
Babylon	US	\N	211562
Bhilai	IN	\N	1097000
Rufisque	SN	\N	221066
Anqiu	CN	\N	947723
Calbayog City	PH	\N	183851
Gorakhpur	IN	\N	673446
Memphis	US	\N	1066967
Dhulia	IN	\N	479073
Champaign	US	\N	159443
Atbara	SD	\N	139768
Washington	US	\N	5379184
Adoni	IN	\N	184625
Tangerang	ID	\N	2237006
Myrtle Beach	US	\N	275579
Higashi-Hiroshima	JP	\N	195805
Murrieta	US	\N	496046
Roanoke	US	\N	214674
Gonder	ET	\N	323900
Masan	KR	\N	429612
Leesburg	US	\N	154574
Linghai	CN	\N	508079
Itaquaquecetuba	BR	\N	352801
Southampton	GB	\N	855569
Hengshui	CN	\N	4150000
Ueda	JP	\N	154201
Nandyal	IN	\N	200516
Butembo	CD	\N	217625
Fuchu	JP	\N	263932
Varanasi	IN	\N	1198491
Mudon	MM	\N	152300
Sanmenxia	CN	\N	2213000
Laixi	CN	\N	762900
Asheville	US	\N	312507
Virginia Beach	US	\N	1478868
Lubuklinggau	ID	\N	208225
Cawnpore	IN	\N	2701324
Sayama	JP	\N	149423
Linyi	CN	\N	10820000
Newark	US	\N	282011
Iskandar	UZ	\N	195633
Hayward	US	\N	159203
Quzhou	CN	\N	2185000
Rostock	DE	\N	208886
City of Calamba	PH	\N	454486
Jiexiu	CN	\N	406517
Vancouver	CA	\N	2264823
Winston-Salem	US	\N	422269
Mission Viejo	US	\N	590249
Baubau	ID	\N	152143
Gaomi	CN	\N	868715
Shizuishan	CN	\N	136570
Coquitlam	CA	\N	139284
Boston	US	\N	4688346
As Suwayhirah as Sahil	OM	\N	151349
Bintulu	MY	\N	151617
Vallejo	US	\N	173256
Lansing	US	\N	324286
Fukayacho	JP	\N	141966
Guyuan	CN	\N	1426000
Evansville	US	\N	230427
Langsa	ID	\N	178334
Patiala	IN	\N	329224
Hinthada	MM	\N	180728
Paranagua	BR	\N	141013
Dangyang	CN	\N	560000
Vishakhapatnam	IN	\N	2035922
Middlesbrough	GB	\N	174700
Shuyangzha	CN	\N	1770000
Tegal	ID	\N	275789
Hanchuan	CN	\N	1092700
Bazhou	CN	\N	3134000
Tottenham	GB	\N	129237
Trichur	IN	\N	315596
Pointe-a-Pitre	GP	\N	145511
Amritsar	IN	\N	1132383
Paterson	US	\N	145233
Richmond Hill	CA	\N	195022
Vereeniging	ZA	\N	1074000
Yongcheng	CN	\N	1240382
Lanxi	CN	\N	560514
Monywa	MM	\N	207489
Port St. Lucie	US	\N	461152
Nizhnekamsk	RU	\N	237250
Canoas	BR	\N	600000
Thousand Oaks	US	\N	215029
Huaiyin	CN	\N	1264000
Tolyatti	RU	\N	707408
Rui'an	CN	\N	1424667
Norfolk	US	\N	242742
Reno	US	\N	445020
Udaipur	IN	\N	451100
Norilsk	RU	\N	177428
Kashikishi	ZM	\N	150000
Des Moines	US	\N	473957
Changshu	CN	\N	1510100
Qinbaling	CN	\N	2500000
Appleton	US	\N	220570
Waco	US	\N	192315
Guangshui	CN	\N	755910
Qinhuangdao	CN	\N	2800000
Almaty	KZ	\N	1806833
Longba	CN	\N	2614000
Horlivka	UA	\N	256714
Ruiming	CN	\N	640600
Mandi Burewala	PK	\N	203454
Pocos de Caldas	BR	\N	146588
Handwara	IN	\N	269311
El Jadid	MA	\N	194934
Mobile	US	\N	315502
Limeira	BR	\N	296440
Mingguang	CN	\N	532732
Warangal	IN	\N	704570
Stockton	US	\N	397264
Heshan	CN	\N	494938
Oyama	JP	\N	167633
Queens	US	\N	2230722
Tiruvannamalai	IN	\N	138243
Tonk	IN	\N	181734
Gold Coast	AU	\N	679127
Alwar	IN	\N	341422
Jitpur	NP	\N	337785
Sarasota	US	\N	722243
Meknes	MA	\N	520428
Gaya	IN	\N	474093
Cabo Frio	BR	\N	186227
Itapecerica da Serra	BR	\N	167236
Ch'onan	KR	\N	651661
Indaiatuba	BR	\N	231033
Guarulhos	BR	\N	1324781
Tempe	US	\N	195805
Imabari	JP	\N	151956
Tanjungbalai	ID	\N	165763
Butterworth	MY	\N	821652
Kluang	MY	\N	169828
Shashi	CN	\N	520000
Kovrov	RU	\N	138552
Yongzhou	CN	\N	5180235
Levis	CA	\N	143414
Palopo	ID	\N	180130
McKinney	US	\N	258277
Hino	JP	\N	189945
Itapevi	BR	\N	223404
Nizhniy Tagil	RU	\N	355693
Blackpool	GB	\N	139720
Hagerstown	US	\N	184755
Feicheng	CN	\N	946627
Engels	RU	\N	225752
Maringa	BR	\N	328335
Tshikapa	CD	\N	267462
Hong Kong	HK	\N	7347000
Providence	US	\N	1203230
Chaohucun	CN	\N	782000
Uluberiya	IN	\N	235345
Volta Redonda	BR	\N	456362
Praia Grande	BR	\N	299261
Kumagaya	JP	\N	194959
Kawara	JP	\N	190109
El Paso	US	\N	843386
Huozhou	CN	\N	282905
Athens	US	\N	141532
Lengshuijiang	CN	\N	370300
Zama	JP	\N	130608
Mathura	IN	\N	330511
Yangmei	TW	\N	175000
Austin	US	\N	1687311
Luoyang	CN	\N	6549941
Mandya	IN	\N	137358
Ansan	KR	\N	652800
Mabalacat	PH	\N	250799
Feira de Santana	BR	\N	481911
Juliaca	PE	\N	291189
Songzi	CN	\N	765911
Elk Grove	US	\N	174775
Miri	MY	\N	234541
Shakhty	RU	\N	235492
Lake Charles	US	\N	156181
Vryheid	ZA	\N	150012
Santa Maria	BR	\N	249219
Saint Albans	GB	\N	147373
Yingzhong	CN	\N	334977
Petah Tiqwa	IL	\N	236169
Jundiai	BR	\N	401896
Portmore	JM	\N	170000
Modesto	US	\N	383134
Changping	CN	\N	614821
Netanya	IL	\N	217244
Leeds	GB	\N	1901934
Plymouth	GB	\N	267918
Carapicuiba	BR	\N	392294
Titagarh	IN	\N	116541
Niteroi	BR	\N	496696
Rajkot	IN	\N	1335397
Windsor	CA	\N	276165
Suqian	CN	\N	5290000
Zarzis	TN	\N	159161
Kharagpur	IN	\N	207604
Cidade de Nacala	MZ	\N	224795
Pekalongan	ID	\N	298386
Guaruja	BR	\N	311230
Osan	KR	\N	213840
Tulsa	US	\N	671033
Crato	BR	\N	273883
Al Hufuf	SA	\N	637389
Araraquara	BR	\N	226508
Macheng	CN	\N	849090
Hwasu-dong	KR	\N	655350
Nagareyama	JP	\N	193976
Dalai	CN	\N	418232
Lichuan	CN	\N	913700
Slough	GB	\N	164455
Koronadal	PH	\N	174942
Bozhou	CN	\N	5100000
Puqi	CN	\N	205164
Xingren	CN	\N	417919
Cachoeiro de Itapemirim	BR	\N	189889
Yuma	US	\N	142847
Flitwick	GB	\N	12700
Schoningen	DE	\N	11306
Great Chart	GB	\N	6801
Lake in the Hills	US	\N	28634
Anhembi	BR	\N	6307
Kulat	ID	\N	30012
Iwye	BY	\N	7400
Maintal	DE	\N	39298
Ashington	GB	\N	27764
Otofuke	JP	\N	44377
Progreso	US	\N	5944
Alzamay	RU	\N	5908
Fort Valley	US	\N	9683
Michigan City	US	\N	65058
Brea	US	\N	43255
Giv`atayim	IL	\N	59518
Narjeh	IR	\N	5604
Apex	US	\N	59300
Clairton	US	\N	6541
Kovylkino	RU	\N	19488
Laziska Gorne	PL	\N	21958
Grossbottwar	DE	\N	8512
Shelburne	US	\N	7728
Bridgeton	US	\N	33379
Furukawamen	JP	\N	13826
Belladere	HT	\N	60239
Tukwila	US	\N	20347
Paradise Valley	US	\N	14637
Zongo	CD	\N	17667
Dizicheh	IR	\N	17966
Dniprorudne	UA	\N	18468
Litchfield	US	\N	8538
Circleville	US	\N	15792
Fort St. John	CA	\N	20155
Beckett Ridge	US	\N	9114
Silver Springs Shores	US	\N	8966
Linden	US	\N	42361
Wisconsin Rapids	US	\N	27966
Haya	SD	\N	20000
Yungay	CL	\N	10884
La Troncal	EC	\N	35259
Blue Bell	US	\N	6212
Sashinami	JP	\N	13476
Prospect Park	US	\N	6492
Stony Point	US	\N	15393
Bad Soden am Taunus	DE	\N	22645
Belebey	RU	\N	60188
Akranes	IS	\N	7411
Northview	US	\N	15391
Ashton-Sandy Spring	US	\N	6136
Baldwinsville	US	\N	7822
St. Augustine Shores	US	\N	9418
Locust Grove	US	\N	8243
Puchuncavi	CL	\N	5271
Wadern	DE	\N	15727
Tillicoultry	GB	\N	5900
Wordsley	GB	\N	12582
Tocantins	BR	\N	15823
Taber	CA	\N	8428
Coco	PR	\N	5328
University Place	US	\N	34001
Sioux Center	US	\N	7174
Hainichen	DE	\N	8588
Rockledge	US	\N	28227
Villeparisis	FR	\N	26322
Archbald	US	\N	7030
Saint-Augustin-de-Desmaures	CA	\N	18141
Pleasant Hills	US	\N	8026
Havre de Grace	US	\N	14018
Asni	MA	\N	21244
Kawambwa	ZM	\N	20589
Royal Tunbridge Wells	GB	\N	59947
Grandville	US	\N	15858
Pembroke	US	\N	18304
Hettstedt	DE	\N	14023
Ilha de Mocambique	MZ	\N	14000
Vale	GE	\N	5031
Craig	US	\N	9553
Tasiilaq	GL	\N	2018
Young	AU	\N	10295
Duxbury	US	\N	15703
Wedel	DE	\N	33547
Mullaittivu	LK	\N	37339
Tasiusaq	GL	\N	250
Union Grove	US	\N	7251
Renton	US	\N	101751
Kirkland Lake	CA	\N	7981
Lindau	DE	\N	25490
Syosset	US	\N	19559
Morro Agudo	BR	\N	31620
Grand Ledge	US	\N	7896
Broadstairs	GB	\N	24903
Horazd'ovice	CZ	\N	5240
Waltham	US	\N	62495
Saranap	US	\N	6492
Nolinsk	RU	\N	9722
Cullercoats	GB	\N	9202
Minooka	US	\N	11397
Elkton	US	\N	15622
Lower Salford	US	\N	15318
Friendswood	US	\N	40290
Greece	US	\N	96197
Chikusei	JP	\N	100816
Gubin	PL	\N	17150
Iona	US	\N	14385
Ibara	JP	\N	39172
Kingston upon Thames	GB	\N	43013
Meinerzhagen	DE	\N	20397
Hillcrest	US	\N	7418
Foxborough	US	\N	17535
Shinmachi	JP	\N	6970
Ladyzhyn	UA	\N	22682
Sao Jose da Bela Vista	BR	\N	8823
Lower	US	\N	21838
Kalkar	DE	\N	13902
La Crosse	US	\N	100693
Neuenstadt am Kocher	DE	\N	10123
Chestnuthill	US	\N	16776
Torghay	KZ	\N	5277
Bataszek	HU	\N	6217
Collie	AU	\N	7192
West Memphis	US	\N	24402
Great Missenden	GB	\N	10138
Candler-McAfee	US	\N	24022
Bothwell	GB	\N	6458
Fountainhead-Orchard Hills	US	\N	5823
El Puerto de Santa Maria	ES	\N	88405
Bierun Stary	PL	\N	23640
Bella Vista	AR	\N	72000
Khrestivka	UA	\N	28149
Plymouth Meeting	US	\N	6557
Cukai	MY	\N	82425
Omchak	RU	\N	10
Middleborough Center	US	\N	7333
Pecica	RO	\N	12762
Hadera	IL	\N	91707
Delson	CA	\N	7462
Lundazi	ZM	\N	11635
Martha Lake	US	\N	19954
Watertown Town	US	\N	35939
Labytnangi	RU	\N	26281
Pigeon Forge	US	\N	6266
Springfield	CA	\N	15342
Prestwick	GB	\N	14750
Magog	CA	\N	25358
Iriga City	PH	\N	111757
Cut Off	US	\N	5897
Schifferstadt	DE	\N	20193
Palpa	NP	\N	29095
Ulkan	RU	\N	10
Sangolqui	EC	\N	75080
Novi	US	\N	60896
Shelbyville	US	\N	24351
Burriana	ES	\N	34683
Longview	US	\N	100330
Bad Berleburg	DE	\N	19446
Barton upon Humber	GB	\N	11066
Montreuil	FR	\N	109897
Carnarvon	ZA	\N	5785
Happy Valley	CA	\N	8109
Oktyabrsk	RU	\N	26438
Billingshurst	GB	\N	8232
La Grande	US	\N	15515
Jammalamadugu	IN	\N	46069
Khorgo	RU	\N	10
North Lebanon	US	\N	11863
Grevenbroich	DE	\N	63620
Collingdale	US	\N	8794
Katherine	AU	\N	1488
Mutriku	ES	\N	5333
Aldo Bonzi	AR	\N	18175
Linz am Rhein	DE	\N	6200
Fraser	US	\N	14480
Harlington	GB	\N	8276
Nea Peramos	GR	\N	8333
Lewisville	US	\N	109212
Texarkana	US	\N	77964
Wassertrudingen	DE	\N	6041
Cloquet	US	\N	12813
Phillipsburg	US	\N	14212
Cobourg	CA	\N	19440
Wegberg	DE	\N	28175
Kumano	JP	\N	16140
Nikolayevsk-na-Amure	RU	\N	19135
Great Yarmouth	GB	\N	38693
Weipa	AU	\N	3899
Parry Sound	CA	\N	6408
Timberlake	US	\N	12973
Thongwa	MM	\N	52496
Sipalay	PH	\N	70070
Gudivada	IN	\N	118167
Lawrence Township	US	\N	7562
Pearland	US	\N	122460
Newman	AU	\N	4567
Glenpool	US	\N	13936
Piketberg	ZA	\N	12075
Riverdale Park	US	\N	7200
Weybridge	GB	\N	15449
Pembury	GB	\N	6128
Chudovo	RU	\N	14394
Chester-le-Street	GB	\N	24227
Dubna	RU	\N	75144
Mukocho	JP	\N	56415
Bukittinggi	ID	\N	113326
Lawrenceburg	US	\N	13666
Bordertown	AU	\N	2953
Rathdrum	US	\N	8764
Kabo	CF	\N	16279
Karabogaz	TM	\N	6895
Orsett	GB	\N	6115
Loves Park	US	\N	23371
Mtsensk	RU	\N	38350
Yakage	JP	\N	13549
St. John	US	\N	18796
Uhrichsville	US	\N	5314
Sanatoga	US	\N	8564
Khajuraho	IN	\N	24481
Carterton	GB	\N	15769
Yerres	FR	\N	29029
Avai	BR	\N	5275
Newton Grange	GB	\N	5341
Blagodarnyy	RU	\N	30530
Morden	GB	\N	48233
Hassan	IN	\N	133436
Monona	US	\N	8175
Camocim	BR	\N	44481
Opava	CZ	\N	56450
Orange	FR	\N	28919
Wettingen	CH	\N	20721
Kuroishi	JP	\N	32376
Perry	US	\N	17894
Champlain	US	\N	5643
Georgian Bluffs	CA	\N	10479
Polysayevo	RU	\N	26212
Vodnany	CZ	\N	7028
Dubak	IN	\N	12349
Succasunna	US	\N	8681
Yelnya	RU	\N	8993
Pacific Grove	US	\N	15413
Baxter	US	\N	8364
Hassan Abdal	PK	\N	50044
Lennox Head	AU	\N	6407
Jaltocan	MX	\N	10265
K'ajaran	AM	\N	7163
Universal City	US	\N	20890
Kennebunk	US	\N	11343
Vacaria	BR	\N	56765
Bodaybo	RU	\N	12316
Mitchell	US	\N	15372
Vadul lui Voda	MD	\N	5295
Lower Oxford	US	\N	5058
Usolye	RU	\N	6368
Jericho	US	\N	13827
Prestonsburg	US	\N	6473
Black Forest	US	\N	14274
Mountsorrel	GB	\N	8223
Challapata	BO	\N	9114
Pulivendla	IN	\N	65706
Morden	CA	\N	8668
Gladeview	US	\N	13296
Kegalle	LK	\N	17962
Kimba	AU	\N	629
German Flatts	US	\N	12704
South Hill	US	\N	58164
Schonebeck	DE	\N	30720
Ames	US	\N	67910
Magor	GB	\N	6140
Clarkston Heights-Vineland	US	\N	6403
Three Springs	AU	\N	381
Hickam Housing	US	\N	9258
Sept-Iles	CA	\N	28534
Bickenhill	GB	\N	12456
Campo Mourao	BR	\N	75401
Guichon	UY	\N	5025
Okha	RU	\N	20715
Chillan Viejo	CL	\N	27359
Douglass	US	\N	10490
Calistoga	US	\N	5247
Haddon	US	\N	14521
Gillespie	US	\N	5002
Grapevine	US	\N	55281
Clay Township	US	\N	6831
Agria	GR	\N	5191
Vineyard	US	\N	28315
White Meadow Lake	US	\N	9383
Zhigulevsk	RU	\N	53407
Lisle	US	\N	23270
Irapuru	BR	\N	8187
Springe	DE	\N	28951
Elliot Lake	CA	\N	10741
Stranraer	GB	\N	10851
Penzance	GB	\N	21200
Jales	BR	\N	48922
Meriden	US	\N	59395
Malangawa	NP	\N	25102
Ofunato	JP	\N	35535
Oak Ridge	US	\N	29156
Blandford Forum	GB	\N	10610
Chichibu	JP	\N	60303
Allen	AR	\N	22859
Kilosa	TZ	\N	91889
Rye	AU	\N	8416
Ocean Springs	US	\N	17862
Pocahontas	US	\N	5887
Effretikon	CH	\N	16928
Old Jefferson	US	\N	8065
Sinaia	RO	\N	10410
Carshalton	GB	\N	29917
Irvington	US	\N	54035
The Woodlands	US	\N	109843
Anatoli	GR	\N	9798
Godalming	GB	\N	21804
Simeria	RO	\N	12556
Comox	CA	\N	14828
Anoka	US	\N	17549
Volklingen	DE	\N	39374
Wilde	AR	\N	65881
Binfield	GB	\N	7880
Richterswil	CH	\N	13407
Discovery Bay	US	\N	15981
Waikoloa Village	US	\N	6412
Tolten	CL	\N	2293
Brakel	DE	\N	16270
Cortlandville	US	\N	8234
Millstone	US	\N	10460
Ishim	RU	\N	65142
Crystal City	US	\N	7255
Rio Tercero	AR	\N	46421
Sooke	CA	\N	13001
Thompson's Station	US	\N	6567
Valuyki	RU	\N	34193
Hopkins	US	\N	18468
Coventry	US	\N	34575
Kinderhook	US	\N	8357
Ilsenburg	DE	\N	9526
Salaberry-de-Valleyfield	CA	\N	42410
Narasaraopet	IN	\N	116250
Ladson	US	\N	15383
Casa de Oro-Mount Helix	US	\N	19635
Hayesville	US	\N	22272
Banora Point	AU	\N	16167
El Aioun	MA	\N	41832
Alagoinhas	BR	\N	124070
Eastwood	US	\N	5858
Nova Zagora	BG	\N	26660
Mattighofen	AT	\N	6524
Saint-Herblain	FR	\N	46268
Walldurn	DE	\N	11518
Manghit	UZ	\N	22949
Acu	BR	\N	36125
Nyimba	ZM	\N	1336
Fareham	GB	\N	42210
Connersville	US	\N	14566
Lindenfels	DE	\N	5124
Barreiros	BR	\N	35565
St. James	US	\N	13155
Qualicum Beach	CA	\N	8943
Nango	JP	\N	23315
Aguadilla	PR	\N	11170
Belsh	AL	\N	8781
Lewisburg	US	\N	11658
Barrington	US	\N	16178
Malgobek	RU	\N	37442
Cottage Grove	US	\N	37604
Dannenberg	DE	\N	8200
Trofaiach	AT	\N	11125
Saint-Etienne-du-Rouvray	FR	\N	28641
Nailsea	GB	\N	15630
Higashikyoshin	JP	\N	6226
Ozgon	KG	\N	49410
Pinellas Park	US	\N	53637
Salon-de-Provence	FR	\N	45528
Obidos	BR	\N	27587
Schluchtern	DE	\N	15914
Massy	FR	\N	50833
Pedra Bela	BR	\N	6044
Mukhomornoye	RU	\N	100
Zelenodol'sk	RU	\N	99491
Glen Allen	US	\N	16454
Melksham	GB	\N	14677
Zirndorf	DE	\N	25596
Valley City	US	\N	6423
Herouville-Saint-Clair	FR	\N	22954
Willow Street	US	\N	8360
Wahlstedt	DE	\N	9596
Tura	HU	\N	7761
Novyy Urengoy	RU	\N	113254
Port Lavaca	US	\N	11436
Santa Maria da Serra	BR	\N	5902
Wittstock	DE	\N	14198
Ecublens	CH	\N	12854
Kanel	SN	\N	12975
Jeumont	FR	\N	10159
Ickenham	GB	\N	10387
Achinsk	RU	\N	105264
Laage	DE	\N	6396
Buinsk	RU	\N	20854
Gataia	RO	\N	5861
Ashoro	JP	\N	6822
Chilliwack	CA	\N	83788
Ide	JP	\N	7553
Port Lincoln	AU	\N	16326
Vestavia Hills	US	\N	34413
Kulachi	PK	\N	24738
Chilly-Mazarin	FR	\N	20181
Schodack	US	\N	13146
Vorsma	RU	\N	10491
Citrus Hills	US	\N	7492
Kalyazin	RU	\N	12770
Kullorsuaq	GL	\N	450
Melnik	CZ	\N	19559
Mechanicstown	US	\N	6957
San Gabriel	EC	\N	16066
Nova Granada	BR	\N	20717
Fort Myers Beach	US	\N	7094
Olonets	RU	\N	8091
Waynesville	US	\N	10141
Chicxulub Puerto	MX	\N	5052
Hampshire	US	\N	5190
Hartwell	US	\N	5841
Carnegie	US	\N	7806
Stanford	US	\N	15668
Murakami	JP	\N	58096
Jauja	PE	\N	16424
Shimotsuke	JP	\N	59370
Navahrudak	BY	\N	30800
Catano	PR	\N	24888
Likhoslavl	RU	\N	11594
Peterhead	GB	\N	18537
Tara Hills	US	\N	5405
Arkadelphia	US	\N	10503
San Adrian	ES	\N	6292
Simi Valley	US	\N	126589
Tatsunocho-tominaga	JP	\N	74892
Charagua	BO	\N	6780
Mukaiengaru	JP	\N	19751
Woonsocket	US	\N	41751
Delhi	US	\N	11735
Cosham	GB	\N	13830
Shizukuishi	JP	\N	15998
Los Blancos	AR	\N	1145
Dalton in Furness	GB	\N	8125
Warminster	US	\N	32454
Clare	AU	\N	3160
Finneytown	US	\N	12689
Emba	KZ	\N	18760
Ad Dilam	SA	\N	40114
Rockville	US	\N	68079
Kriens	CH	\N	26997
Tamiami	US	\N	57514
Shasta Lake	US	\N	10413
Vacha	DE	\N	5173
Carl Junction	US	\N	8274
Nazareth	US	\N	5702
Lugano	CH	\N	63185
Bridgewater	US	\N	44726
Herrenberg	DE	\N	31545
Qulan	KZ	\N	13128
Maffra	AU	\N	5280
Shibecha	JP	\N	7542
Bernsbach	DE	\N	8678
Holmen	US	\N	10034
Chatham	GB	\N	76792
Malaya Vishera	RU	\N	10602
Eaton Socon	GB	\N	9042
Douro-Dummer	CA	\N	6709
Weener	DE	\N	15842
Maxixe	MZ	\N	108824
Pompton Lakes	US	\N	10986
Kennett Square	US	\N	6202
Powell	US	\N	13375
Baures	BO	\N	2422
Engen	DE	\N	10796
Winslow	US	\N	38923
Goba	ET	\N	34369
Georgina	CA	\N	45418
Bergkamen	DE	\N	48725
Grovetown	US	\N	15152
Kabuga	RW	\N	40202
Abdul Hakim	PK	\N	51494
General Zaragoza	MX	\N	5942
Friedrichsthal	DE	\N	10133
Suwa	JP	\N	48695
Farmersville	US	\N	10703
Janauba	BR	\N	56572
Itatiba	BR	\N	113284
New Norfolk	AU	\N	5432
Shimogamo	JP	\N	21015
Leuna	DE	\N	13969
Kozelsk	RU	\N	16443
Bernardsville	US	\N	7594
Nelsonville	US	\N	6050
Upper Hutt	NZ	\N	41000
Sayreville	US	\N	44173
Beloeil	CA	\N	50796
Welling	GB	\N	41000
Wake Village	US	\N	5327
Winsford	GB	\N	32610
Pirapora	BR	\N	60164
Winchester	US	\N	74417
Uniondale	US	\N	31828
Kidderminster	GB	\N	55530
Emmaus	US	\N	11467
Cochrane	CA	\N	25853
Clinton	US	\N	40027
Murashi	RU	\N	6218
Igarapava	BR	\N	29727
Killarney	IE	\N	11902
Woodbridge	GB	\N	7749
Brugg	CH	\N	11129
Fort Campbell North	US	\N	13882
Abergavenny	GB	\N	12515
Loja	ES	\N	20342
Richmond West	US	\N	37965
Bage	BR	\N	106098
Levelland	US	\N	13755
Wertheim	DE	\N	22780
Bolintin Vale	RO	\N	12929
Aubagne	FR	\N	46268
Sete Barras	BR	\N	13144
Streator	US	\N	17021
Massillon	US	\N	32584
Nova Alianca	BR	\N	6555
Mihailesti	RO	\N	7923
Baunatal	DE	\N	27750
Leonding	AT	\N	28698
Rothwell	GB	\N	20354
Thornton Heath	GB	\N	65812
Greendale	US	\N	14143
Clare	US	\N	5522
South Charleston	US	\N	12047
Bals	RO	\N	18164
Arecibo	PR	\N	40108
Tommot	RU	\N	6935
Kaoma	ZM	\N	14212
Ventnor City	US	\N	9895
Tillmans Corner	US	\N	17814
Ibbenburen	DE	\N	51904
West Earl	US	\N	8272
Elizabethtown-Kitley	CA	\N	9854
Shuya	RU	\N	58114
Romsey	GB	\N	19441
Valparaiso	US	\N	33897
Nueva Italia de Ruiz	MX	\N	32467
Nuevitas	CU	\N	38995
Wakefield	GB	\N	99251
Fairbanks	US	\N	63245
Yacimiento Rio Turbio	AR	\N	8814
Beclean	RO	\N	10628
Ilion	US	\N	23608
Naganohara	JP	\N	5190
Grangetown	GB	\N	5088
Glenshaw	US	\N	8714
Chester	CA	\N	10310
Exeter	US	\N	14921
Mossel Bay	ZA	\N	59031
Houston	GB	\N	6470
Tumen	CN	\N	128212
Iacanga	BR	\N	11066
Kampong Thum	KH	\N	19951
Standerton	ZA	\N	74021
Bad Konig	DE	\N	9762
Commerce City	US	\N	60336
Marchtrenk	AT	\N	13603
Nove Mesto nad Metuji	CZ	\N	9398
Santa Rosa Jauregui	MX	\N	86376
Bowdon	GB	\N	9228
Selm	DE	\N	26011
Blean	GB	\N	5589
Kaltennordheim	DE	\N	5853
Hanamaki Onsen	JP	\N	94007
Eirunepe	BR	\N	21750
Bati	ET	\N	20536
Saddle Brook	US	\N	13918
Tea	US	\N	5995
Oak Creek	US	\N	36325
White Horse	US	\N	8512
Zuyevka	RU	\N	10447
Watton	GB	\N	7202
Corte Madera	US	\N	9751
Nova Paka	CZ	\N	9072
Saint-Louis	FR	\N	21177
Bonner Springs	US	\N	7906
Ross Township	US	\N	30728
Daitocho	JP	\N	119986
Muskego	US	\N	25127
Neulengbach	AT	\N	8281
Palatka	RU	\N	21452
Carolina Beach	US	\N	6399
North Petherton	GB	\N	6730
Herrnhut	DE	\N	5922
Chililabombwe	ZM	\N	90530
Rhuthun	GB	\N	5461
Tsuruga	JP	\N	64474
Brantford	CA	\N	97496
Tourcoing	FR	\N	97368
Plant City	US	\N	39744
San Matias	BO	\N	6352
Toton	GB	\N	8238
Ronneburg	DE	\N	5026
Joanopolis	BR	\N	12725
Farnham	CA	\N	8330
Eschweiler	DE	\N	56385
Wilkau-Hasslau	DE	\N	9784
Tokoname	JP	\N	57814
Kolin	CZ	\N	31973
Grayslake	US	\N	20725
Bad Liebenstein	DE	\N	7786
Totma	RU	\N	9805
Bad Langensalza	DE	\N	17441
Hohen Neuendorf	DE	\N	26159
Palau	MX	\N	16133
Dietikon	CH	\N	26936
Miami Gardens	US	\N	110001
Independence	US	\N	116672
Icem	BR	\N	7997
Harvard	US	\N	9533
Kidbrooke	GB	\N	14300
San Ramon	BO	\N	6490
Ocsa	HU	\N	9325
Andoany	MG	\N	22680
Ashton	NZ	\N	17700
New Paltz	US	\N	14214
Agapa	RU	\N	10
Lynden	US	\N	18512
West Lincoln	CA	\N	14500
Porth	GB	\N	5970
Storm Lake	US	\N	11066
Waltham	GB	\N	6413
Brixworth	GB	\N	5162
Kreuztal	DE	\N	31187
Shoyna	RU	\N	300
Racine	US	\N	130142
Port Alfred	ZA	\N	17959
G`uzor	UZ	\N	17253
Asbest	RU	\N	64091
Aledo	US	\N	8909
Tyrone	US	\N	7506
Stanford le Hope	GB	\N	28765
Dabuleni	RO	\N	12175
Volkmarsen	DE	\N	6804
Wetaskiwin	CA	\N	12655
Neuotting	DE	\N	8932
Gunzenhausen	DE	\N	16614
Gawler	AU	\N	26472
Bad Liebenzell	DE	\N	9573
Cleator Moor	GB	\N	6936
Kings Langley	GB	\N	5072
Olney	US	\N	35280
Normandy Park	US	\N	6604
El Maiten	AR	\N	4269
Rifu	JP	\N	35597
Hicksville	US	\N	42649
Steinbach	CA	\N	15829
Oakleaf Plantation	US	\N	27252
Guayama	PR	\N	22063
Hope	CA	\N	6181
Ellesmere Port	GB	\N	55715
Fair Oaks Ranch	US	\N	10042
Avigliano	IT	\N	11350
Torrington	US	\N	40003
Esashi	JP	\N	7525
North Olmsted	US	\N	31341
Saint Peters	GB	\N	7042
Granger	US	\N	30815
Dumfries	US	\N	5922
New Hyde Park	US	\N	9807
Mweka	CD	\N	50675
Jilove	CZ	\N	5162
Ralston	US	\N	7273
Thalwil	CH	\N	17784
Mendota	US	\N	11716
Huningue	FR	\N	7238
North Hanover	US	\N	7540
Lavumisa	SZ	\N	3695
Oak Park	US	\N	52381
East Palo Alto	US	\N	29314
Carnoustie	GB	\N	11394
Weirton	US	\N	65578
Salesopolis	BR	\N	16688
Birch Bay	US	\N	9037
Burglengenfeld	DE	\N	13554
Shiloh	US	\N	13586
Limeil-Brevannes	FR	\N	27228
Susice	CZ	\N	11032
The Nation / La Nation	CA	\N	12808
Halesowen	GB	\N	58135
Hinesville	US	\N	51206
Vacaville	US	\N	101444
Centennial	US	\N	110937
Pagham	GB	\N	5941
Street	GB	\N	11805
Ludlow	GB	\N	10266
Satellite Beach	US	\N	11130
Nevinnomyssk	RU	\N	117446
Eustis	US	\N	21303
Stony Brook	US	\N	12641
Narsarsuaq	GL	\N	145
Soledade	BR	\N	30044
Nyrany	CZ	\N	6996
Vrable	SK	\N	8656
Ariquemes	BR	\N	58096
Kosai	JP	\N	58423
Bulach	CH	\N	20046
Ugol'nyye Kopi	RU	\N	3367
Brightlingsea	GB	\N	8076
Centerton	US	\N	16244
Osmanabad	IN	\N	112085
Corabia	RO	\N	16441
Silver City	US	\N	11561
Raunheim	DE	\N	16284
Tosagua	EC	\N	10751
Buenaventura Lakes	US	\N	34085
Shibukawa	JP	\N	74425
Muroto-misakicho	JP	\N	11996
San Juan Capistrano	US	\N	35911
Largs	GB	\N	11241
Westbury	US	\N	15351
Orangeburg	US	\N	30365
Gadwal	IN	\N	63177
Bourg-la-Reine	FR	\N	20667
Parque del Plata	UY	\N	7896
Vermilion	US	\N	10394
Rainworth	GB	\N	7821
Surovikino	RU	\N	18685
Ain Sefra	DZ	\N	63420
Fukagawa	JP	\N	20526
Galleywood	GB	\N	5738
Dimitrovgrad	BG	\N	45098
Drexel Heights	US	\N	29514
Brooks	CA	\N	14451
Harrisville	US	\N	6872
Nerang	AU	\N	16864
Bear	US	\N	21362
Star	US	\N	10454
Ginsheim-Gustavsburg	DE	\N	16807
Tettnang	DE	\N	19198
Wolfforth	US	\N	5486
Solnechnogorsk	RU	\N	51612
Murrhardt	DE	\N	14033
Ongjang	KP	\N	69195
Skegness	GB	\N	19579
East Huntingdon	US	\N	7771
Susanville	US	\N	8602
Algonquin	US	\N	30897
Hajdusamson	HU	\N	12961
Fort Thomas	US	\N	16263
De Aar	ZA	\N	32318
Rahat	IL	\N	64462
Sukhodilsk	UA	\N	21324
Breese	US	\N	5853
Quesada	CR	\N	31106
Wonthaggi	AU	\N	4965
Uchiko	JP	\N	15565
Manali	IN	\N	8096
Shepherdsville	US	\N	12442
Wilmot	CA	\N	20545
Uvinza	TZ	\N	80350
Sault Ste. Marie	US	\N	12442
Dacice	CZ	\N	7288
Suwanee	US	\N	20907
Caribou	US	\N	7593
West Springfield	US	\N	28517
Schuyler	US	\N	6348
Merrill	US	\N	9630
Neviges	DE	\N	18937
Ain El Aouda	MA	\N	49816
Al Balyana	EG	\N	46997
Velikiye Luki	RU	\N	91435
Qaha	EG	\N	26694
Chatan	JP	\N	28270
Millcreek Township	US	\N	53722
Aramina	BR	\N	5486
Roseburg	US	\N	46228
Heringen	DE	\N	7187
Hersham	GB	\N	12414
Alpine	US	\N	15233
Ribnita	MD	\N	56988
Pedro Celestino Negrete	MX	\N	43447
Amherst	CA	\N	9550
Little Elm	US	\N	53126
Bavly	RU	\N	22145
Singleton	AU	\N	16346
Forfar	GB	\N	14048
Blainville	CA	\N	56363
Altena	DE	\N	16922
New Hempstead	US	\N	5410
Hartsville	US	\N	14693
Royse City	US	\N	14702
Chiryu	JP	\N	72166
Monmouth	GB	\N	10508
Panda	MZ	\N	602
Tismana	RO	\N	7035
Skutec	CZ	\N	5047
Airdrie	CA	\N	61581
Wallingford	US	\N	44771
Hammelburg	DE	\N	11037
Sawahlunto	ID	\N	61427
Timber Pines	US	\N	5303
Erlensee	DE	\N	14899
Grass Valley	US	\N	34196
Tula de Allende	MX	\N	103919
Marlin	US	\N	5454
Cookshire	CA	\N	5393
Zubri	CZ	\N	5547
Bakal	RU	\N	19264
Sendenhorst	DE	\N	13157
Robinwood	US	\N	8123
Sirvan	AZ	\N	58253
Garden City	US	\N	29659
Severo-Kuril'sk	RU	\N	2507
Kem	RU	\N	11604
San Bruno	US	\N	42807
Holly Springs	US	\N	37812
Saint-Sauveur	CA	\N	9881
Most	CZ	\N	66034
Noboribetsu	JP	\N	47795
Pukekohe East	NZ	\N	26300
Birsk	RU	\N	43572
Leinfelden-Echterdingen	DE	\N	40092
Oviedo	US	\N	41860
Verkhnyaya Teberda	RU	\N	8670
Alexander City	US	\N	9046
Hitachiomiya	JP	\N	39904
Ramsey	GB	\N	8479
Raceland	US	\N	10686
Cottleville	US	\N	5608
Limbourg	BE	\N	5939
North Augusta	US	\N	23845
Venice	US	\N	23985
South Amboy	US	\N	9176
Mason City	US	\N	26005
Gaffney	US	\N	21169
Jeannette	US	\N	9074
Kamyshin	RU	\N	111100
Wyndmoor	US	\N	5795
Arealva	BR	\N	8351
New Westminster	CA	\N	70996
Blue Ash	US	\N	12372
Spring Creek	US	\N	13805
Burton	CA	\N	5119
Lyndhurst	US	\N	22030
Bellmawr	US	\N	11359
Asahi	JP	\N	64302
Gedling	GB	\N	6817
Satsuma	US	\N	6190
Village St. George	US	\N	6900
La Vista	US	\N	17170
Baia de Arama	RO	\N	5349
Penticton	CA	\N	33761
Isna	EG	\N	68656
Frankenmuth	US	\N	5560
Rahden	DE	\N	15441
Verkhnyaya Tura	RU	\N	9039
Irpin'	UA	\N	56806
Watertown	US	\N	53163
Winterberg	DE	\N	12611
Samborondon	EC	\N	42637
Isny im Allgau	DE	\N	14018
Karabulak	RU	\N	41469
Carnot-Moon	US	\N	11982
La Marque	US	\N	17319
Penig	DE	\N	8780
Mmabatho	ZA	\N	104428
Chojnow	PL	\N	13904
Oberviechtach	DE	\N	5030
Iernut	RO	\N	8705
Rockenhausen	DE	\N	5322
Wetumpka	US	\N	8538
Kingstowne	US	\N	17172
Gowanda	US	\N	5945
Turner	US	\N	5772
Jose Batlle y Ordonez	UY	\N	2438
Fircrest	US	\N	6835
Vitim	RU	\N	3843
Popovo	BG	\N	17703
Lemon Hill	US	\N	14096
Komsa	RU	\N	10
Orange Lake	US	\N	6348
Carmel Hamlet	US	\N	6345
Krasnokamsk	RU	\N	53631
Nogent-sur-Oise	FR	\N	20033
Monett	US	\N	8710
Alausi	EC	\N	14294
Mibu	JP	\N	39454
Kotel	BG	\N	6021
Kusa	RU	\N	17136
Marvin	US	\N	6792
Cedartown	US	\N	12819
Lustenau	AT	\N	22821
Hanwell	GB	\N	28768
Stone Ridge	US	\N	12990
Illogan	GB	\N	5404
Kefar Sava	IL	\N	100800
Delran	US	\N	16631
Vandoeuvre-les-Nancy	FR	\N	30002
Vanderbijlpark	ZA	\N	95840
Osawa	JP	\N	33072
Congers	US	\N	8406
St. Johns	US	\N	8510
Tanagura	JP	\N	13551
Easley	US	\N	21364
Baran'	BY	\N	10200
Chalco	US	\N	11456
Guider	CM	\N	84647
Sakamoto	JP	\N	11890
Macetown	NZ	\N	16600
Allestree	GB	\N	13622
Burley	US	\N	16342
Tanjay	PH	\N	80532
Bee Cave	US	\N	6841
White City	US	\N	8953
Hulin	CZ	\N	6762
Bad Iburg	DE	\N	10661
Oros	BR	\N	21389
Rodalben	DE	\N	6749
Le Bouscat	FR	\N	23824
Whitman	US	\N	14961
Iskitim	RU	\N	56602
Elderslie	GB	\N	5634
Long Eaton	GB	\N	37760
Perryton	US	\N	8510
South Lyon	US	\N	124694
Binghamton University	US	\N	6149
Jeonghae	KR	\N	110194
Sutton on Hull	GB	\N	12649
Beaudesert	AU	\N	6395
Penrith	GB	\N	15200
Maple Heights	US	\N	22078
Southport	US	\N	10293
Oak Hills Place	US	\N	9015
Kotake	JP	\N	7232
Burnham-on-Sea	GB	\N	19576
Ellwood City	US	\N	11962
Elmhurst	US	\N	46746
Radcliffe on Trent	GB	\N	8205
Castilho	BR	\N	19873
Seven Hills	US	\N	11590
Chilwell	GB	\N	12864
Olivette	US	\N	7822
Dainyor	PK	\N	25000
Ipero	BR	\N	33367
Pokrovsk	RU	\N	9256
Echuca	AU	\N	14934
Maple Glen	US	\N	6614
Corrales	US	\N	8696
Carlisle	US	\N	19198
Oebisfelde	DE	\N	7341
Alfena	PT	\N	20000
Americo Brasiliense	BR	\N	38202
Llantwit Major	GB	\N	9486
Gniew	PL	\N	6844
Stuarts Draft	US	\N	9716
Ottumwa	US	\N	24121
Andoas	PE	\N	10
Edwardsburgh/Cardinal	CA	\N	6959
Great Dunmow	GB	\N	8830
Warsop	GB	\N	11999
Gosforth	GB	\N	23620
Covina	US	\N	47450
Hunters Quay	GB	\N	5198
Tynec nad Sazavou	CZ	\N	5739
Sassenberg	DE	\N	14260
Goring by Sea	GB	\N	7990
Beni Ounif	DZ	\N	5628
Matsushima	JP	\N	13468
Obuse	JP	\N	10454
Gengenbach	DE	\N	11023
Katsuragi	JP	\N	37004
Jandira	BR	\N	118832
Saint-Hippolyte	CA	\N	8083
Oelde	DE	\N	29326
Ludwigsfelde	DE	\N	26112
Jerada	MA	\N	43506
Upper St. Clair	US	\N	19592
Town 'n' Country	US	\N	85620
Markfield	GB	\N	5681
Echapora	BR	\N	6316
Olching	DE	\N	27741
Samalut	EG	\N	91475
Aizawa	JP	\N	39381
Ruskin	US	\N	23477
Uren	RU	\N	12309
Triangle	US	\N	9116
Pantelimon	RO	\N	25596
Wallsend	GB	\N	43826
Sotteville-les-Rouen	FR	\N	28965
Sigatoka	FJ	\N	9622
Shelburne	CA	\N	8126
South St. Paul	US	\N	20060
Takae	JP	\N	5513
Klingenberg am Main	DE	\N	6160
Vytegra	RU	\N	10324
Fostoria	US	\N	14458
Cranbrook	CA	\N	19259
Tiptree	GB	\N	9182
Kropotkin	RU	\N	78149
Waupun	US	\N	11232
Kahului	US	\N	32312
Warrnambool	AU	\N	35214
Darlaston	GB	\N	27821
Holly Hill	US	\N	12357
Vero Beach South	US	\N	24082
Shintoku	JP	\N	5992
Al `Alamayn	EG	\N	2413
Moorbad Lobenstein	DE	\N	5931
Newbiggin-by-the-Sea	GB	\N	6308
Winter Gardens	US	\N	23088
Goonellabah	AU	\N	12900
Repentigny	CA	\N	84965
Arden Hills	US	\N	10281
Port Augusta	AU	\N	13799
Ham Lake	US	\N	16783
Keflavik	IS	\N	16463
Tynda	RU	\N	33061
Gulf Breeze	US	\N	6900
Drouin	AU	\N	11887
Toppenish	US	\N	14284
Yongju	KR	\N	109266
Morshyn	UA	\N	5850
Meilen	CH	\N	13999
Landstuhl	DE	\N	8348
Boxborough	US	\N	5794
Avra Valley	US	\N	5966
Canovanas	PR	\N	7351
Queensbury	GB	\N	16273
Koja	JP	\N	58658
Muzaffarabad	PK	\N	96000
Cromwell	NZ	\N	5440
Taunton	US	\N	57464
Gommern	DE	\N	10543
Weyburn	CA	\N	10870
Maryland Heights	US	\N	26956
Bellshill	GB	\N	20650
Bridgewater	CA	\N	8532
Hopkinton	US	\N	17178
Osoyoos	CA	\N	5085
Morro Bay	US	\N	10543
Deschutes River Woods	US	\N	5775
Leonardtown	US	\N	6182
Sileby	GB	\N	7835
Halfmoon Bay	NZ	\N	310
Bad Konigshofen im Grabfeld	DE	\N	5984
Honmachi	JP	\N	123758
Winter Park	US	\N	30825
Blaby	GB	\N	6194
Mandeville	US	\N	95968
Broussard	US	\N	12700
Porto Uniao	BR	\N	71578
Manistee	US	\N	9433
Hawick	GB	\N	14294
Arrecife	ES	\N	62988
Valparai	IN	\N	114308
Avarua	CK	\N	5445
Hofgeismar	DE	\N	15294
Anoixi	GR	\N	6510
Bootle	GB	\N	51394
La Mision	MX	\N	10096
Viana	BR	\N	26689
Darlington	US	\N	5940
Byelaazyorsk	BY	\N	11400
Chalfont Saint Peter	GB	\N	12766
Jambeiro	BR	\N	6092
Schriesheim	DE	\N	15081
Sukumo	JP	\N	19532
Portel	BR	\N	21315
New Whiteland	US	\N	6241
Margaret River	AU	\N	6392
Reginopolis	BR	\N	8640
Destrehan	US	\N	10933
Kudamatsu	JP	\N	56634
Gramsh	AL	\N	8440
Wadenswil	CH	\N	21716
Land O' Lakes	US	\N	37007
Dubendorf	CH	\N	28002
Messancy	BE	\N	8185
Opfikon	CH	\N	19864
Porter	US	\N	6599
Buenos Aires	CR	\N	45000
Hofu	JP	\N	114256
Lubbenau	DE	\N	16021
Korf	RU	\N	400
Adliswil	CH	\N	18731
District Heights	US	\N	5984
Kendale Lakes	US	\N	58395
Qazaly	KZ	\N	6582
Elverta	US	\N	5821
Neosho	US	\N	12176
Kalabo	ZM	\N	7731
Homewood	US	\N	25377
Sisian	AM	\N	14894
Boppard	DE	\N	15325
Bargara	AU	\N	7485
Spring Lake	US	\N	12005
Friendship Heights Village	US	\N	5225
Willowick	US	\N	14105
Tittmoning	DE	\N	5798
Irvine	GB	\N	34010
Columbia Heights	US	\N	20427
Helotes	US	\N	9961
Herne Bay	GB	\N	38563
Wick	GB	\N	7333
Coolbaugh	US	\N	20327
Cayambe	EC	\N	39028
Veszto	HU	\N	6855
Wum	CM	\N	68836
Havelberg	DE	\N	6537
West Deptford	US	\N	21214
Holywood	GB	\N	11257
Romulus	US	\N	23573
Terrell Hills	US	\N	5447
Louveira	BR	\N	43862
Vigneux-sur-Seine	FR	\N	31574
Palm River-Clair Mel	US	\N	23627
Marshfield	GB	\N	6270
Nyuzen	JP	\N	24160
Princetown	GY	\N	12000
Jumla	NP	\N	9073
Fort Riley	US	\N	7116
Center Line	US	\N	8171
Santa Ana	CR	\N	11320
Lower Providence	US	\N	26418
Garca	BR	\N	44532
Ballina	AU	\N	26381
Dikson	RU	\N	1113
Kakonko	TZ	\N	24688
Upper Saucon	US	\N	16429
Canteras	ES	\N	10178
Jordan	US	\N	6094
Wauseon	US	\N	7269
Collegeville	US	\N	5174
Boaz	US	\N	9704
Neves Paulista	BR	\N	9008
Rockhampton	AU	\N	78592
Ronkonkoma	US	\N	18302
Uran	IN	\N	30439
Nova Dubnica	SK	\N	11134
Cachoeira Paulista	BR	\N	32294
Ceres	BR	\N	18759
Zschopau	DE	\N	9214
Troisdorf	DE	\N	74903
Manteca	US	\N	103420
Goole	GB	\N	19518
Guzolandia	BR	\N	5103
Old Greenwich	US	\N	6819
Camana	PE	\N	20956
Mutsu	JP	\N	54721
Baley	RU	\N	11151
Willow Grove	US	\N	14800
Dumont	BR	\N	9178
Horn-Bad Meinberg	DE	\N	17178
Malahide	CA	\N	9292
Ban Nong Sam Rong	TH	\N	27354
Wake Forest	US	\N	45629
Cuito Cuanavale	AO	\N	149
Five Forks	US	\N	18004
Strasburg	US	\N	7320
Wood River	US	\N	10051
Los Lunas	US	\N	69020
Qasr al Farafirah	EG	\N	5000
South Park Township	US	\N	13363
Volgorechensk	RU	\N	16539
Morinville	CA	\N	9848
Wildeshausen	DE	\N	19932
Isaccea	RO	\N	5026
Bandarbeyla	SO	\N	13753
Channahon	US	\N	13239
Banning	US	\N	31221
Horizon West	US	\N	32530
Sudbury	CA	\N	88054
Heber Springs	US	\N	6136
Markneukirchen	DE	\N	7583
Hurley	US	\N	6126
El Golea	DZ	\N	32049
Acatlan de Osorio	MX	\N	18879
West Haven	US	\N	54620
Belampalli	IN	\N	55841
Ayer	US	\N	8055
Okhotsk	RU	\N	5570
Sierre	CH	\N	16860
Cannock	GB	\N	29018
Bad Schmiedeberg	DE	\N	8222
Lehighton	US	\N	5313
Dieburg	DE	\N	15679
Verl	DE	\N	25498
Pontypridd	GB	\N	32694
Kirovgrad	RU	\N	19277
Wildau	DE	\N	10303
Frohnleiten	AT	\N	6655
Westgate	US	\N	10026
Egg Harbor	US	\N	43002
Anenecuilco	MX	\N	10773
Idaho Falls	US	\N	100442
Chino Hills	US	\N	83853
Gonzalez	US	\N	13962
Negapatam	IN	\N	102905
Cotgrave	GB	\N	7203
Lovosice	CZ	\N	8840
Bilina	CZ	\N	17200
Tierra Amarilla	CL	\N	12888
South Abington	US	\N	8977
Tabapua	BR	\N	12103
Halfmoon	US	\N	23962
Ocher	RU	\N	14226
Jaszapati	HU	\N	8313
Orono	US	\N	10729
Goleta	US	\N	30911
Kenton	GB	\N	35600
Macherla	IN	\N	57290
San Francisco Solano	AR	\N	91322
Beacon	US	\N	13968
Villa Rumipal	AR	\N	1269
Rouyn-Noranda	CA	\N	42334
Rrogozhine	AL	\N	7049
Forbes	AU	\N	8432
East Peoria	US	\N	22546
Tallulah	US	\N	8346
Uitenhage	ZA	\N	103639
Tayabas	PH	\N	99779
Giugliano in Campania	IT	\N	124361
Bou Ahmed	MA	\N	33105
East Wenatchee	US	\N	14219
Marion	US	\N	45181
Lacombe	US	\N	8503
San Isidro Buen Suceso	MX	\N	7688
Mangai	CD	\N	37188
Bellview	US	\N	21269
Spencer	US	\N	11913
Hohenstein-Ernstthal	DE	\N	14607
Bothell	US	\N	47415
Cold Spring Harbor	US	\N	5164
Galion	US	\N	15161
Lakeway	US	\N	15981
Weymouth	US	\N	57746
Arba Minch'	ET	\N	69622
Rheda-Wiedenbruck	DE	\N	48505
Bethany	US	\N	24396
Bracebridge	CA	\N	16010
Coroata	BR	\N	34129
Pritzwalk	DE	\N	11924
Waihi	NZ	\N	5310
Darjeeling	IN	\N	118805
Khatanga	RU	\N	3205
Dudley	US	\N	11682
Brattleboro	US	\N	11608
Szigethalom	HU	\N	17596
University of California-Davis	US	\N	7379
Pariquera-Acu	BR	\N	19391
Amoneburg	DE	\N	5096
Bietigheim-Bissingen	DE	\N	43093
Clifton Springs	US	\N	6072
Hiroo	JP	\N	6694
Alma	US	\N	16035
Plattekill	US	\N	10251
Kafr Sa`d	EG	\N	22500
Carmichael	US	\N	64785
San Isidro	PR	\N	6915
Tokar	SD	\N	73202
Evesham	GB	\N	23428
Miyajima	JP	\N	36214
Bajram Curri	AL	\N	5340
Konigstein im Taunus	DE	\N	16648
Bryn Mawr-Skyway	US	\N	18347
Yafran	LY	\N	72662
Kirkland	US	\N	93010
Franklin Park	US	\N	17627
Rochedale	AU	\N	15317
Turtle Creek	US	\N	5138
Tornal'a	SK	\N	7252
Joshua Tree	US	\N	6980
Guasavito	MX	\N	71196
Wellsville	US	\N	7070
Placentia	US	\N	51233
East Moline	US	\N	20645
Warsash	GB	\N	7183
Kaniama	CD	\N	36481
Fujisaki	JP	\N	14742
Weikersheim	DE	\N	7333
Buhusi	RO	\N	14562
Tombua	AO	\N	90000
Mugeln	DE	\N	5913
Florida City	US	\N	11771
Ponca City	US	\N	24274
Dalcahue	CL	\N	7120
Herzliyya	IL	\N	93989
Mopipi	BW	\N	3301
Murston	GB	\N	5300
Volney	US	\N	5750
Pecan Acres	US	\N	5670
East Highland Park	US	\N	15592
Tomisato	JP	\N	49868
South Bruce Peninsula	CA	\N	8416
Chegem Vtoroy	RU	\N	18264
Quartier Militaire	MU	\N	22745
Moberly	US	\N	13574
Cameron	US	\N	9501
Vincennes	US	\N	19498
Skelton	GB	\N	9526
Esquimalt	CA	\N	17655
Bella Vista	US	\N	28872
Mission Bend	US	\N	39291
Armadale	GB	\N	9063
Lakeport	US	\N	17466
Santa Clara	US	\N	130365
Marbletown	US	\N	5509
North Caldwell	US	\N	6621
Dulles Town Center	US	\N	5023
Tetbury	GB	\N	5472
Erwitte	DE	\N	16045
Bacabal	BR	\N	72372
Lock Haven	US	\N	16490
Baldwin	US	\N	25134
Ouezzane	MA	\N	59606
Citrusdal	ZA	\N	7177
Quievrechain	FR	\N	6366
Hollidaysburg	US	\N	5674
Santa Rosa de Viterbo	BR	\N	25666
Sannois	FR	\N	26662
Igarka	RU	\N	4975
Traismauer	AT	\N	6224
West Vero Corridor	US	\N	8661
Raunds	GB	\N	8641
Bury	GB	\N	78723
Asbury Park	US	\N	15408
Kentwood	US	\N	51898
Mena	US	\N	5261
Warrensburg	US	\N	22410
Burtonwood	GB	\N	11265
Groton	US	\N	39105
Sawtry	GB	\N	6536
Lauta	DE	\N	8411
Amble	GB	\N	6025
Yonabaru	JP	\N	19494
Bavaro	DO	\N	795
Versmold	DE	\N	21468
Aschersleben	DE	\N	27220
Thames Centre	CA	\N	13191
Rees	DE	\N	20972
Lewisboro	US	\N	12613
Crowley	US	\N	16460
Mercer Island	US	\N	25894
Lake Station	US	\N	11845
Palermo	US	\N	5544
Northgate	US	\N	7099
Chibuto	MZ	\N	58012
Povorino	RU	\N	17025
Southborough	GB	\N	11124
Chebarkul	RU	\N	40378
Castro Valley	US	\N	63288
Handsworth	GB	\N	9957
Littleborough	GB	\N	7467
Kings Point	US	\N	5292
Clearfield	US	\N	32118
Jonesborough	US	\N	5611
Moravske Budejovice	CZ	\N	7300
Powdersville	US	\N	8991
Raymond Terrace	AU	\N	12820
Hanover	CA	\N	15733
Cheltenham	US	\N	37149
Guaracai	BR	\N	8525
Logan	US	\N	101616
Warman	CA	\N	11020
La Calera	AR	\N	32227
La Habra	US	\N	60513
Brewer	US	\N	9035
Quilpie	AU	\N	595
Hamlet	US	\N	6328
Sowerby Bridge	GB	\N	11703
Ob	RU	\N	29194
Clover	US	\N	8335
Fderik	MR	\N	5760
Bridlington	GB	\N	35369
Idabel	US	\N	5798
Reisterstown	US	\N	26933
Bedlington	GB	\N	18470
La Tuque	CA	\N	11001
Breisach am Rhein	DE	\N	15606
Kinmel	GB	\N	7864
Port Colborne	CA	\N	18306
Cacapava	BR	\N	91162
Naugatuck	US	\N	31108
Dyce	GB	\N	5811
Exmouth	AU	\N	2486
Maputsoe	LS	\N	32117
Piney Green	US	\N	14061
Great Wyrley	GB	\N	11060
Hohenmolsen	DE	\N	9565
Czeladz	PL	\N	34402
Huedin	RO	\N	9346
Weddington	US	\N	11182
Stuttgart	US	\N	8404
Selma	US	\N	44703
Vila Bela da Santissima Trindade	BR	\N	1612
Chibougamau	CA	\N	7504
Camborne	GB	\N	21600
Risca	GB	\N	11693
Rhos-on-Sea	GB	\N	7593
Ardmore	US	\N	21245
Severance	US	\N	5478
Wolkersdorf im Weinviertel	AT	\N	7201
Wimbledon	GB	\N	68187
Croxley Green	GB	\N	12562
Dinslaken	DE	\N	67525
Domodedovo	RU	\N	127850
Parkes	AU	\N	11408
Bay Village	US	\N	15194
Four Corners	US	\N	16045
Ashwaubenon	US	\N	17161
Washingtonville	US	\N	5770
Bertioga	BR	\N	56555
Weinsberg	DE	\N	12336
Manteo	US	\N	5482
Burke	US	\N	42722
Isla Vista	US	\N	27690
Workington	GB	\N	25207
Hillsboro	US	\N	109128
Laconia	US	\N	19371
Tiburon	US	\N	9084
Connahs Quay	GB	\N	16774
Aleksin	RU	\N	57892
Abira	JP	\N	7825
Heubach	DE	\N	9774
Lajosmizse	HU	\N	11334
Wolfhagen	DE	\N	13059
Balch Springs	US	\N	25007
Euxton	GB	\N	9993
Swarthmore	US	\N	6346
Short Hills	US	\N	13134
Krupka	CZ	\N	12633
Katori	JP	\N	73110
International Falls	US	\N	6382
Maple Shade	US	\N	18729
Itambe	BR	\N	23558
Gordonvale	AU	\N	6671
Los Altos	US	\N	30089
Sasovo	RU	\N	25177
Rafha	SA	\N	64755
Na`jan	SA	\N	5125
Mandan	US	\N	22752
Gingoog	PH	\N	124648
Southlake	US	\N	32376
Alamo	US	\N	19910
Dzidzantun	MX	\N	8119
Uzyn	UA	\N	12147
Novokuybyshevsk	RU	\N	102075
San Lorenzo	HN	\N	43042
Jennings	US	\N	14575
Topsfield	US	\N	6551
Abilene	US	\N	116412
Stroitel	RU	\N	24392
Otavalo	EC	\N	39354
Wymondham	GB	\N	14405
Lincoln	NZ	\N	6030
Cesky Tesin	CZ	\N	24297
Plainview	US	\N	25902
East Orange	US	\N	64367
Lindenwold	US	\N	17263
Colina	BR	\N	18245
Little Chute	US	\N	12081
Harrison	US	\N	28943
Meyzieu	FR	\N	33477
Webster	US	\N	44247
La Peche	CA	\N	7863
Brodosqui	BR	\N	23460
Tamalpais-Homestead Valley	US	\N	11261
Mixquiahuala de Juarez	MX	\N	37747
Pleasant View	US	\N	10839
Bostonia	US	\N	17530
Mount Arlington	US	\N	5852
Croix	FR	\N	21041
Centerport	US	\N	5251
Aberdare	GB	\N	39550
Brus Laguna	HN	\N	4067
Higashiomi	JP	\N	113165
Hiranai	JP	\N	10337
Ammanford	GB	\N	5411
South Miami	US	\N	11911
Pen-y-Bont ar Ogwr	GB	\N	49404
Bolotnoye	RU	\N	15629
Datteln	DE	\N	34614
Ingham	AU	\N	4357
Freckleton	GB	\N	6019
Calverley	GB	\N	22594
Otonabee-South Monaghan	CA	\N	6670
Nikaho	JP	\N	23602
Irati	BR	\N	45830
Aconibe	GQ	\N	13382
Chincha Alta	PE	\N	63671
Novalukoml'	BY	\N	12600
Paulinia	BR	\N	97702
Nuneaton	GB	\N	86552
Wappinger	US	\N	26699
Sedeh Lanjan	IR	\N	17335
Decorah	US	\N	8051
East Rochester	US	\N	6490
Goshen	US	\N	34217
Vallauris	FR	\N	26672
Mereeg	SO	\N	548
Eaton	US	\N	7858
Dillon	US	\N	9089
Slapanice	CZ	\N	7599
Berber	SD	\N	49556
Herborn	DE	\N	20603
Dingelstadt	DE	\N	6893
St. Thomas	US	\N	5992
Santa Cruz do Sul	BR	\N	118374
Zillah	LY	\N	10
Rovenky	UA	\N	46734
Elsterwerda	DE	\N	7856
De Witt	US	\N	25363
Bicheno	AU	\N	943
El Castillo de La Concepcion	NI	\N	19864
Bad Lippspringe	DE	\N	16089
Waldkirch	DE	\N	21809
Charlton Kings	GB	\N	10396
Bariri	BR	\N	34048
Thornhill	GB	\N	6875
Beach Park	US	\N	13701
Wetter (Ruhr)	DE	\N	27441
Bocaina	BR	\N	11810
Kasumigaura	JP	\N	40833
Omihachiman	JP	\N	81322
Pirangi	BR	\N	11220
Strathmore	US	\N	7742
Valley Township	US	\N	7661
Sussex	US	\N	10981
Kamata	JP	\N	35929
Sarstedt	DE	\N	19359
Timperley	GB	\N	11061
Warburg	DE	\N	23079
Catonsville	US	\N	41515
Corinda	AU	\N	11019
Buckeye	US	\N	79620
Pembroke Park	US	\N	6749
Santa Isabel	MX	\N	33604
Caballococha	PE	\N	3195
Nakai	JP	\N	46951
Rochester Hills	US	\N	74516
North Hills	US	\N	5969
Stewartville	US	\N	6054
Ruislip	GB	\N	58217
Bluewater	CA	\N	7136
Millburn	US	\N	20179
Cormeilles-en-Parisis	FR	\N	24161
North Highlands	US	\N	48968
Redan	US	\N	32357
Grand Forks	US	\N	64748
Penicuik	GB	\N	15926
Osterburken	DE	\N	6507
Ilfracombe	GB	\N	11184
Schrobenhausen	DE	\N	17106
Caledon	CA	\N	66502
Massapequa	US	\N	21861
Laguna Woods	US	\N	15850
El Salvador	PH	\N	50204
West Tamworth	AU	\N	5342
Puerto Ayora	EC	\N	11822
Strazhitsa	BG	\N	5589
Johnsburg	US	\N	6368
Venus	US	\N	5252
Serpukhov	RU	\N	125817
Linthicum	US	\N	10895
Turkeve	HU	\N	8462
Bugrino	RU	\N	300
Littlemore	GB	\N	5646
Chichimila	MX	\N	5528
Willow Park	US	\N	5842
Diamond Springs	US	\N	11989
Molango	MX	\N	10385
Potomac Mills	US	\N	6468
Middlewich	GB	\N	13595
Brainerd	US	\N	19583
Blansko	CZ	\N	20484
Bessemer	US	\N	26472
Kamen	DE	\N	42971
Pativilca	PE	\N	31905
Austintown	US	\N	28386
Amersham	GB	\N	14384
Vorkuta	RU	\N	56088
Mundelein	US	\N	31051
Turzovka	SK	\N	7559
Nicolet	CA	\N	7828
Konakovo	RU	\N	38486
Zion	US	\N	23487
Springboro	US	\N	18931
Uxbridge	GB	\N	70560
Bordentown	US	\N	11917
Lencois Paulista	BR	\N	66131
Ocean City	US	\N	10971
Scituate	US	\N	18591
L'Ange-Gardien	CA	\N	5464
Pella	US	\N	9636
Bullskin	US	\N	6751
Rolleston	NZ	\N	16350
Parkway	US	\N	15885
Belen	US	\N	7416
Strood	GB	\N	33182
Holytown	GB	\N	5180
Oktyabr'sk	KZ	\N	28196
Bezhetsk	RU	\N	9450
Hampton Bays	US	\N	14280
Tualatin	US	\N	27837
Morrilton	US	\N	6159
Sturbridge	US	\N	9537
Shumikha	RU	\N	17336
Sasaguri	JP	\N	30886
Bend	US	\N	109802
Dobsina	SK	\N	5696
Barnhart	US	\N	6318
Pushchino	RU	\N	21281
Hustopece	CZ	\N	5975
Maloyaroslavets	RU	\N	27791
Lodi	US	\N	74773
Shobara	JP	\N	34432
Quedgeley	GB	\N	17519
Riviersonderend	ZA	\N	5245
Fujioka	JP	\N	63556
San Carlos Park	US	\N	17778
North Springfield	US	\N	7644
Davlekanovo	RU	\N	23499
Glenside	US	\N	7558
Lovejoy	US	\N	6840
Dimona	IL	\N	33258
Bondurant	US	\N	6958
Maulbronn	DE	\N	6588
Pederneiras	BR	\N	44910
Monte Alegre do Sul	BR	\N	7736
Radeberg	DE	\N	18463
Crestview	US	\N	39072
Brooklyn Park	US	\N	80389
Motul	MX	\N	21508
Edenkoben	DE	\N	6690
Hallandale Beach	US	\N	39847
Laufenburg (Baden)	DE	\N	9029
Doctor Petru Groza	RO	\N	6529
Keshan	CN	\N	72403
Nerekhta	RU	\N	21262
Matamata	NZ	\N	7910
Ansfelden	AT	\N	16194
High Wycombe	GB	\N	125257
North Shields	GB	\N	34423
Brookings	US	\N	24887
Annaburg	DE	\N	6731
Merriam	US	\N	11081
Chamberlayne	US	\N	6186
Kasongo-Lunda	CD	\N	20060
Wesley Chapel	US	\N	55046
Canonsburg	US	\N	8760
Whitefish	US	\N	8221
Moncks Corner	US	\N	11986
Vaudreuil-Dorion	CA	\N	38117
Manvel	US	\N	12671
Venev	RU	\N	14211
Bothell East	US	\N	10682
Hirnyk	UA	\N	11378
Brandis	DE	\N	9613
Perushtitsa	BG	\N	5162
Rehoboth	US	\N	12082
Sterling	US	\N	30403
Zavolzhsk	RU	\N	10121
San Agustin Tlaxiaca	MX	\N	27118
Wappingers Falls	US	\N	5544
Yacuiba	BO	\N	97296
Nakanojomachi	JP	\N	15585
Bret Harte	US	\N	5319
Briarcliff Manor	US	\N	8094
Nairn	GB	\N	9773
Furstenau	DE	\N	9439
Greding	DE	\N	7126
Beitbridge	ZW	\N	41767
Cheddleton	GB	\N	6311
Orinda	US	\N	19926
Sartell	US	\N	18926
Tigard	US	\N	55514
Buellton	US	\N	5102
Crateus	BR	\N	52933
Ponta do Sol	PT	\N	8862
Hoyerswerda	DE	\N	32123
Vryburg	ZA	\N	49588
Ubaitaba	BR	\N	28375
Chalastra	GR	\N	7270
Skovorodino	RU	\N	8943
Ingelfingen	DE	\N	5480
Pardes Hanna Karkur	IL	\N	17800
Kelso	AU	\N	8968
Dunellen	US	\N	7202
Ventimiglia	IT	\N	24065
Krasno nad Kysucou	SK	\N	6783
Hiji	JP	\N	27947
Ubombo	ZA	\N	564
Innsbrook	US	\N	8549
Fokino	RU	\N	23077
Kastel Stari	HR	\N	43349
Farnworth	GB	\N	30271
Zhovti Vody	UA	\N	44766
Treuchtlingen	DE	\N	12942
Brumado	BR	\N	41989
Georgetown	US	\N	79604
Kochkor-Ata	KG	\N	14814
Maibara	JP	\N	37850
Betanzos	BO	\N	4847
Bonnybridge	GB	\N	6870
Nettetal	DE	\N	42493
Belaya Kholunitsa	RU	\N	10406
East Bradford	US	\N	9959
Akureyri	IS	\N	18925
Arnold	GB	\N	37768
`Afula	IL	\N	44930
Cupcini	MD	\N	7190
Kirtland	US	\N	6812
Menominee	US	\N	8029
Chadan	RU	\N	9139
Martinez	US	\N	38297
Cuevo	BO	\N	1637
Mittenwalde	DE	\N	9140
Englewood	US	\N	34917
Lubutu	CD	\N	1313
Kutztown	US	\N	10137
Tsukawaki	JP	\N	14673
North Haledon	US	\N	8395
River Rouge	US	\N	7419
Lauenburg	DE	\N	11444
Carthage	US	\N	15892
Shillington	US	\N	5319
Sun Valley	US	\N	20683
De Queen	US	\N	6153
Udhampur	IN	\N	35507
Lake Grove	US	\N	11056
Petershagen	DE	\N	25168
Prachatice	CZ	\N	10840
Kazo	JP	\N	110921
Arvin	US	\N	22155
Calimanesti	RO	\N	7622
Cliftonville	GB	\N	12900
Idar-Oberstein	DE	\N	28323
Fern Down	GB	\N	26559
North Mackay	AU	\N	5933
Tiksi	RU	\N	5700
Snyder	US	\N	11371
Fort Ann	US	\N	6069
Velke Mezirici	CZ	\N	11498
Urbandale	US	\N	44379
Belozersk	RU	\N	8786
Vlotho	DE	\N	18429
Zherdevka	RU	\N	14214
Polna	CZ	\N	5150
Ascension	BO	\N	14429
Carluke	GB	\N	13300
Greenfield	US	\N	37221
Sturgis	US	\N	12881
Willow Oak	US	\N	6930
Tuttle	US	\N	7593
Jorhat	IN	\N	69033
Rheine	DE	\N	76107
Mount Prospect	US	\N	53719
Fort Stewart	US	\N	9326
Green Brook	US	\N	7158
Wellington North	CA	\N	11914
Gescher	DE	\N	17205
Cheektowaga	US	\N	86813
Huntingburg	US	\N	5603
Oerlinghausen	DE	\N	17286
Rio Vista	US	\N	9369
Apollo Beach	US	\N	19457
Hempfield	US	\N	41154
Descalvado	BR	\N	32980
Tautii Magherus	RO	\N	7136
Uzlovaya	RU	\N	51358
Jim Thorpe	US	\N	5449
Oneonta	US	\N	17236
El Monte	US	\N	115487
Butler	US	\N	37796
Auburn	US	\N	92777
Banatski Karlovac	RS	\N	5820
Billingham	GB	\N	35165
Temperance	US	\N	8798
Yuzhnouralsk	RU	\N	37728
Forest City	US	\N	25311
Callaway	US	\N	14060
Modrice	CZ	\N	5329
Chinle	US	\N	5378
Narutocho-mitsuishi	JP	\N	56007
Antelope	US	\N	47326
Xiangkhoang	LA	\N	5189
Abersychan	GB	\N	7064
East Farmingdale	US	\N	6143
Marcy	US	\N	9424
Munderkingen	DE	\N	5292
Lake Mohegan	US	\N	6013
Albany	AU	\N	34205
Cheddar	GB	\N	5755
Villiers-sur-Marne	FR	\N	28456
Golitsyno	RU	\N	17651
Wadsworth	US	\N	24046
Ibate	BR	\N	33535
Chkalov	TJ	\N	29800
Champs-Sur-Marne	FR	\N	25041
Treuenbrietzen	DE	\N	7405
Ohrdruf	DE	\N	9784
South Glengarry	CA	\N	13150
Cleveland Heights	US	\N	43992
Shevington	GB	\N	10000
Kosciusko	US	\N	6340
Badvel	IN	\N	70626
Kirriemuir	GB	\N	6061
Neftekumsk	RU	\N	24472
Drahichyn	BY	\N	14900
Ferry Pass	US	\N	34416
Gorokhovets	RU	\N	12799
Marianske Lazne	CZ	\N	12795
Perris	US	\N	79291
Gilbertsville	US	\N	5408
Bursledon	GB	\N	6188
Gabcikovo	SK	\N	5391
East Finchley	GB	\N	15989
Sprockhovel	DE	\N	24747
Jelcz-Laskowice	PL	\N	15340
Keystone Heights	US	\N	7449
Langenselbold	DE	\N	13979
Hastings-on-Hudson	US	\N	7853
Joplin	US	\N	84048
Waldorf	US	\N	74587
Valenca	BR	\N	63231
Otsuki	JP	\N	23128
Altinopolis	BR	\N	16179
Golden	US	\N	20767
East Chicago	US	\N	27817
Laurium	US	\N	7032
Delafield	US	\N	7536
Savage	US	\N	32362
Bannockburn	AU	\N	5283
Naples Park	US	\N	6181
Mount Vernon	US	\N	71422
Suisun City	US	\N	29663
Palakollu	IN	\N	129717
Thames Ditton	GB	\N	6307
Ukhta	RU	\N	97087
Horsham	AU	\N	16514
Chernogorsk	RU	\N	75419
Spring	US	\N	58756
Ponce	PR	\N	116796
Joue-les-Tours	FR	\N	37893
Rowlett	US	\N	67339
Stanley	FK	\N	2213
Vicovu de Sus	RO	\N	13308
Corocoro	BO	\N	1884
Chertsey	GB	\N	15967
Brock	CA	\N	11642
Missoula	US	\N	92895
Lavinia	BR	\N	10590
Straldzha	BG	\N	6635
Westborough	US	\N	18982
Sedona	US	\N	6969
Nadudvar	HU	\N	8636
Corvallis	US	\N	67467
Dubuque	US	\N	68109
Queenstown	ZA	\N	105309
East Coventry	US	\N	6770
Bredstedt	DE	\N	5429
Stone Mills	CA	\N	7702
Landecy	CH	\N	31942
Funato	JP	\N	53566
Angmering	GB	\N	7614
Mahon	ES	\N	29040
Vlahita	RO	\N	7649
Namtu	MM	\N	48591
Kurim	CZ	\N	10993
Sa'in Qal`eh	IR	\N	11083
Tashir	AM	\N	10090
Yurihonjo	JP	\N	75417
Mehlville	US	\N	28376
Apple Valley	US	\N	73453
Colney Heath	GB	\N	5962
Inverness	US	\N	7414
Bystrice pod Hostynem	CZ	\N	8144
Ramstein-Miesenbach	DE	\N	7876
Moringen	DE	\N	6956
Horgen	CH	\N	22662
Obu	JP	\N	92101
South Laurel	US	\N	28048
Kaspiysk	RU	\N	116340
Boucherville	CA	\N	40753
Midland	CA	\N	16864
Maumee	US	\N	13669
Suffield	US	\N	15662
Gotsucho	JP	\N	23372
Chateauguay	CA	\N	70812
Sete	FR	\N	43229
Wivenhoe	GB	\N	7637
West Mifflin	US	\N	19699
Bensenville	US	\N	18044
Remagen	DE	\N	17032
University City	US	\N	34165
Aleksandrov	RU	\N	59328
Bensville	US	\N	13247
Chapelhall	GB	\N	6560
Fairland	US	\N	24831
Pedana	IN	\N	30721
Greenock	GB	\N	41990
Loughborough	GB	\N	66611
Tura	RU	\N	5444
Philipsburg	US	\N	9754
Eastlake	US	\N	18042
Griesheim	DE	\N	27435
Aransas Pass	US	\N	8388
Wiesloch	DE	\N	26758
Charles Town	US	\N	24094
Krasavino	RU	\N	6021
Ore	GB	\N	5195
Breckerfeld	DE	\N	8938
Cooma	AU	\N	6681
Lutzen	DE	\N	8546
Elmira	US	\N	62989
Libenge	CD	\N	27053
St. Albert	CA	\N	65589
Sedalia	US	\N	26473
Hardegsen	DE	\N	7587
Tonosho	JP	\N	13078
Ts'nori	GE	\N	6066
Bettendorf	US	\N	36543
Formby	GB	\N	22419
Trelew	AR	\N	93442
Bo`ka	UZ	\N	28000
Jatani	IN	\N	63697
Grayson Valley	US	\N	5986
El Cerrito	US	\N	25508
Herkimer	US	\N	9806
Getulina	BR	\N	11287
Tangub	PH	\N	63011
Lower Heidelberg	US	\N	5836
Allouez	US	\N	13894
Coxhoe	GB	\N	7020
Perkiomen	US	\N	9186
Three Points	US	\N	5161
Agnita	RO	\N	8732
Bryan	US	\N	86276
Montezuma	US	\N	5887
Tupper Lake	US	\N	5826
Saint-Jerome	CA	\N	69598
Cedar Grove	US	\N	12531
Ennepetal	DE	\N	30075
Usinsk	RU	\N	38376
East Patchogue	US	\N	22637
Pregarten	AT	\N	5293
Kaplice	CZ	\N	7282
Belen	PY	\N	11359
Spring Hill	US	\N	107855
Neuenkirchen	DE	\N	8621
Penn Wynne	US	\N	5758
Selinsgrove	US	\N	5902
Zyryanovsk	KZ	\N	49658
Fulwood	GB	\N	18233
Shiroi	JP	\N	61931
Pacatu	BR	\N	20754
Klamath Falls	US	\N	43246
Broadmoor	US	\N	5286
Saint-Cesaire	CA	\N	5686
Ramapo	US	\N	134571
Helena Valley Southeast	US	\N	8067
Serdobsk	RU	\N	32087
Fort Myers	US	\N	87103
Crown Point	US	\N	30488
Cheremoshna	UA	\N	0
Stocksbridge	GB	\N	9869
Brandermill	US	\N	14421
Travilah	US	\N	11633
Pilis	HU	\N	11678
Agde	FR	\N	28609
Ostfildern	DE	\N	39321
Selden	US	\N	19770
Westampton	US	\N	8703
Comines	FR	\N	12358
Bad Mergentheim	DE	\N	23704
Sawmills	US	\N	5189
Balozi	LV	\N	6240
Ludus	RO	\N	15328
Novi Pazar	BG	\N	14931
Farnborough	GB	\N	65034
Small Heath	GB	\N	36898
Nursling	GB	\N	5137
Sunset	US	\N	15770
Los Gatos	US	\N	30222
Sao Sebastiao	BR	\N	83020
Palm Springs	US	\N	48518
Willow Springs	US	\N	5621
Delvine	AL	\N	5754
Nek'emte	ET	\N	73018
Oettingen in Bayern	DE	\N	5142
Drezna	RU	\N	11480
Rajmahal	IN	\N	17974
Azusa	US	\N	49974
Whitinsville	US	\N	6941
Hasbrouck Heights	US	\N	11992
Itapecuru Mirim	BR	\N	34943
Glen Carbon	US	\N	12850
Grey Highlands	CA	\N	9804
Lukovit	BG	\N	10316
North College Hill	US	\N	9283
Wendlingen am Neckar	DE	\N	16268
Izu	JP	\N	29262
Lionville	US	\N	6323
The Pas	CA	\N	5689
Beaufort	US	\N	53051
Kittery	US	\N	9726
Maghaghah	EG	\N	75657
San Luis Obispo	US	\N	62290
Obluchye	RU	\N	8540
Kara-Kol	KG	\N	18843
Balyqshy	KZ	\N	31624
Sidcup	GB	\N	43109
Corcoran	US	\N	22581
Ouyen	AU	\N	1191
Kings Grant	US	\N	9051
Oakbrook	US	\N	9301
Vaulx-en-Velin	FR	\N	49658
Upper Macungie	US	\N	23597
Bacliff	US	\N	10649
Blackrod	GB	\N	5001
Colinas	BR	\N	25158
Salem Lakes	US	\N	14852
Frome	GB	\N	26203
El Campo	US	\N	11655
Harsova	RO	\N	9642
Boskovice	CZ	\N	11681
Otopeni	RO	\N	13861
Melenki	RU	\N	13789
Ye	MM	\N	50798
Bella Vista	PY	\N	16852
Henrietta	US	\N	43327
Ra`ananna	IL	\N	74000
Moss Bluff	US	\N	12034
Island Lake	US	\N	8020
Whitehorse	CA	\N	25085
Deta	RO	\N	6260
Greencastle	US	\N	10567
Franconia	US	\N	19725
Felpham	GB	\N	9746
Margate City	US	\N	5865
Guanica	PR	\N	6781
Gurabo	PR	\N	7515
Saks	US	\N	10763
El Dorado Hills	US	\N	45599
Ribeirao Pires	BR	\N	120396
Katav-Ivanovsk	RU	\N	15872
Pueblo West	US	\N	31860
Mokena	US	\N	20159
Middleton	GB	\N	42972
Stokesdale	US	\N	5489
Lugde	DE	\N	9448
Simitli	BG	\N	7372
Oschatz	DE	\N	14349
Newfield	US	\N	5218
Clermont	US	\N	38654
Antoing	BE	\N	7760
Kingscliff	AU	\N	7464
Ewing	US	\N	36057
Edgemere	US	\N	8633
Mizunami	JP	\N	37164
Altlandsberg	DE	\N	9490
Itigi	TZ	\N	19711
Budesti	RO	\N	7725
Otrokovice	CZ	\N	17879
Melvindale	US	\N	10248
Ust'-Ilimsk	RU	\N	81976
Chipurupalle	IN	\N	14847
Peterborough	US	\N	6524
Saint-Amable	CA	\N	10870
Standish	US	\N	10073
Hessisch Oldendorf	DE	\N	18130
Murrells Inlet	US	\N	9396
North Amityville	US	\N	18817
Viacha	BO	\N	29108
Arvada	US	\N	121272
Rio Rico	US	\N	19601
Clifton	GB	\N	26835
Masindi Port	UG	\N	8319
Mar''ina Horka	BY	\N	20800
Petersfield	GB	\N	14974
Zadonsk	RU	\N	9614
Red Deer	CA	\N	100418
Lautoka	FJ	\N	52220
Volksrust	ZA	\N	43378
Les Mureaux	FR	\N	32792
Coal	US	\N	10362
Bessemer City	US	\N	5577
Chernyshevskiy	RU	\N	5137
Dungarvan	IE	\N	7991
Orting	US	\N	8610
Vinings	US	\N	13086
Olekminsk	RU	\N	9213
Dornstetten	DE	\N	8061
Sacueni	RO	\N	11526
Fontenay-aux-Roses	FR	\N	24564
East Norriton	US	\N	14034
Maquoketa	US	\N	6007
Estoril	PT	\N	26399
Rosendale	US	\N	5907
Koratla	IN	\N	66504
Annemasse	FR	\N	35712
Sylvester	US	\N	6240
Konigsee	DE	\N	7448
Karachev	RU	\N	17466
Baie-Saint-Paul	CA	\N	7146
Mount Hope	US	\N	6781
Rheinfelden (Baden)	DE	\N	33074
Neryungri	RU	\N	57009
Leominster	US	\N	119690
North Bergen	US	\N	61970
West Pennsboro	US	\N	5603
Cisnadie	RO	\N	14282
East Honolulu	US	\N	47770
Rossmoor	US	\N	11160
Lighthouse Point	US	\N	11270
Ritchot	CA	\N	6679
Porirua	NZ	\N	55500
Houzhuang	CN	\N	102400
Bo'ness	GB	\N	14490
Ecclesall	GB	\N	19211
Science City of Munoz	PH	\N	81483
Laakirchen	AT	\N	9861
North Tonawanda	US	\N	30245
La Courneuve	FR	\N	43054
Pryvillya	UA	\N	6970
Tarpon Springs	US	\N	25577
Pincourt	CA	\N	14558
Georgsmarienhutte	DE	\N	31827
Mineiros	BR	\N	38951
Shaler	US	\N	28324
Salisbury	US	\N	106447
Shikhany	RU	\N	5560
Hockley	GB	\N	9616
Vandalia	US	\N	14997
Owasso	US	\N	36957
Calenga	AO	\N	531
Plainedge	US	\N	9206
Nagasu	JP	\N	15487
Trstena	SK	\N	7368
Osterwieck	DE	\N	11103
Denton	GB	\N	36591
Blauvelt	US	\N	5620
Santana de Parnaiba	BR	\N	126574
Novy Bydzov	CZ	\N	6935
Orland	US	\N	9964
Oxapampa	PE	\N	12826
Haag	AT	\N	5548
Colts Neck	US	\N	9948
Kirensk	RU	\N	11139
Suzdal	RU	\N	9749
Cedar Hills	US	\N	10083
Maltby	US	\N	12350
Utley	GB	\N	5500
Elko	US	\N	21179
Chanhassen	US	\N	26389
Shafter	US	\N	21734
Akhtubinsk	RU	\N	37883
Lorca	ES	\N	94404
Tondabayashicho	JP	\N	110132
Felixstowe	GB	\N	23689
Western Springs	US	\N	13359
Al `Uqaylah	LY	\N	100
Oudenburg	BE	\N	9300
Ertis	KZ	\N	7772
Ouda-yamaguchi	JP	\N	28568
Ban Pak Phun	TH	\N	33407
Lincolnton	US	\N	24229
Fukata	JP	\N	96886
Shepparton	AU	\N	51631
Minami-Soma	JP	\N	53643
Fruitridge Pocket	US	\N	6215
Kingswood	GB	\N	40734
Abaetetuba	BR	\N	79420
Ullo	HU	\N	11949
Coral Terrace	US	\N	25234
Fishtoft	GB	\N	6835
Dawmat al Jandal	SA	\N	22583
Yoichi	JP	\N	18637
Clarkstown	US	\N	86511
Borgarnes	IS	\N	1962
Cloverdale	US	\N	9205
Guthrie	US	\N	9373
La Sarre	CA	\N	7719
Hungen	DE	\N	12538
Whittlesea	AU	\N	5611
Panama City	US	\N	136133
East Riverdale	US	\N	15467
Qiryat Ata	IL	\N	55464
Lampasas	US	\N	7263
Tutayev	RU	\N	40154
Torton	GB	\N	11841
Rifle	US	\N	11089
Vyskov	CZ	\N	20807
Eastham	GB	\N	13882
Palmares Paulista	BR	\N	12336
Draveil	FR	\N	28833
Nazarovo	RU	\N	50397
Kremmen	DE	\N	7657
Patrocinio Paulista	BR	\N	14093
Peterborough	AU	\N	1416
Gladenbach	DE	\N	12262
Tlaxcoapan	MX	\N	26758
Petaluma	US	\N	66929
Center Township	US	\N	11551
Grafing bei Munchen	DE	\N	13660
Lysa nad Labem	CZ	\N	9795
Carneys Point	US	\N	7787
Neabsco	US	\N	16947
Attendorn	DE	\N	24367
Lanskroun	CZ	\N	9906
Neptune	US	\N	27591
Rafard	BR	\N	9004
Kafr Qasim	IL	\N	22743
Immenstadt im Allgau	DE	\N	14271
Colorado City	US	\N	8258
Kirzhach	RU	\N	26676
Santa Maria da Vitoria	BR	\N	23488
Pike Creek	US	\N	8312
Senboku	JP	\N	25305
Athol	US	\N	11691
Oundle	GB	\N	5735
Lutjenburg	DE	\N	5322
Kaser	US	\N	5368
Simleu Silvaniei	RO	\N	14436
Aydarken	KG	\N	10331
Hajdudorog	HU	\N	8677
Imperial	US	\N	18120
Rogers	US	\N	68669
Fajardo	PR	\N	25229
Lynchburg	US	\N	126814
Tupi Paulista	BR	\N	15153
Turangi	NZ	\N	3320
Leavesden Green	GB	\N	5612
Al Ahmadi	KW	\N	68763
Coatetelco	MX	\N	9094
La Moncada	MX	\N	5100
Ustron	PL	\N	16065
Santa Cruz Xoxocotlan	MX	\N	93188
Taciba	BR	\N	6110
Dobrada	BR	\N	8592
Fridley	US	\N	27826
Bobrov	RU	\N	20605
Port Saint John's	ZA	\N	5939
Long Grove	US	\N	7905
Randallstown	US	\N	34897
Puyallup	US	\N	42361
Quarai	BR	\N	23021
Victoria	CL	\N	24555
Soldado Bartra	PE	\N	10
Lorton	US	\N	20691
Kikugawa	JP	\N	47547
Verwood	GB	\N	13969
Hazebrouck	FR	\N	21441
Dormagen	DE	\N	64335
Yulara	AU	\N	1099
Hernando	US	\N	16399
Stoneham	US	\N	22144
Mayfield	US	\N	11121
Amderma	RU	\N	282
Eyl	SO	\N	18904
Heckmondwike	GB	\N	16986
Thorpe	GB	\N	5465
Fort Pierce	US	\N	46103
Parachinar	PK	\N	55685
Glyncorrwg	GB	\N	5283
Anakapalle	IN	\N	86519
Gulf Shores	US	\N	12757
Welland	CA	\N	52293
Blankenhain	DE	\N	6455
Coconut Creek	US	\N	61248
Port Jervis	US	\N	16273
Devavanya	HU	\N	7363
Humboldt	US	\N	8456
Palos Heights	US	\N	12520
Ghafsai	MA	\N	6361
Port Denison	AU	\N	1410
Cabot	US	\N	26352
Ichikawadaimon	JP	\N	14770
Mechanicsburg	US	\N	8990
Chapeltown	GB	\N	10043
Neunburg vorm Wald	DE	\N	8338
Kolarovo	SK	\N	10546
Burscough	GB	\N	9182
Balan	RO	\N	6115
Lake Morton-Berrydale	US	\N	11295
Taungoo	MM	\N	106945
Crewe	GB	\N	71722
Baboua	CF	\N	6812
Falls Church	US	\N	14617
Monroe Township	US	\N	6081
Pfullendorf	DE	\N	13437
Serdar	TM	\N	89582
San Sebastian	PR	\N	8490
Wallaroo	AU	\N	3988
Topki	RU	\N	27860
Williamson	US	\N	6772
Chester	GB	\N	79645
Bedburg	DE	\N	23531
Boscombe	GB	\N	20719
Maroantsetra	MG	\N	38046
Ishioka	JP	\N	73110
Ras Kebdana	MA	\N	7580
Juterbog	DE	\N	12311
Woolwich	CA	\N	25006
Hachenburg	DE	\N	6059
Soeda	JP	\N	9049
Tache	CA	\N	11568
Palm Harbor	US	\N	61995
Cordele	US	\N	11719
Rosice	CZ	\N	6291
Taoudenni	ML	\N	3019
Lida	BY	\N	102700
Shiojiri	JP	\N	66737
Florsheim	DE	\N	21572
Aughton	GB	\N	8342
Voiron	FR	\N	20108
Bagamoyo	TZ	\N	35000
Vadnais Heights	US	\N	13607
Halstead	GB	\N	11906
Big Stone Gap	US	\N	7533
Ocean Pines	US	\N	12246
Monte Chingolo	AR	\N	85060
Umi	JP	\N	37609
Marrupa	MZ	\N	8762
Bad Liebenwerda	DE	\N	9188
Williamsport	US	\N	53861
Salzkotten	DE	\N	25062
Carteret	US	\N	23408
Glen Rock	US	\N	11707
Eastampton	US	\N	5954
Swatara	US	\N	24685
Takko	JP	\N	5008
Quorndon	GB	\N	5177
Astoria	US	\N	14916
Huntington	GB	\N	12108
Mill Creek East	US	\N	21523
Tepehuacan de Guerrero	MX	\N	27240
Deptford	US	\N	30454
Country Club Estates	US	\N	8160
Bukama	CD	\N	38770
Gornalwood	GB	\N	12992
Guisborough	GB	\N	17777
Pleasure Point	US	\N	6277
Avare	BR	\N	81285
Abingdon	US	\N	7867
Dolgoprudnyy	RU	\N	108861
Lake Mary	US	\N	17479
Mamurras	AL	\N	8282
Kartaly	RU	\N	28607
Kaysville	US	\N	32390
Cave Spring	US	\N	25793
Ogose	JP	\N	11098
Al Mijlad	SD	\N	19997
Laramie	US	\N	33929
Tmassah	LY	\N	500
Otuzco	PE	\N	25134
Saulgau	DE	\N	17509
Voluntari	RO	\N	42944
Heimsheim	DE	\N	5035
Zarumilla	PE	\N	16971
Huron-Kinloss	CA	\N	7069
Woodhaven	US	\N	12469
Kamigori	JP	\N	14146
L'Assomption	CA	\N	20065
Furtwangen im Schwarzwald	DE	\N	9091
Ararat	AU	\N	8300
Cortland	US	\N	26729
Mattydale	US	\N	6102
Mendon	US	\N	9197
Divjake	AL	\N	8445
Zossen	DE	\N	19403
Klasterec nad Ohri	CZ	\N	14526
Great Harwood	GB	\N	10800
An Nuhud	SD	\N	108008
Ust'-Kuyga	RU	\N	1517
Russells Point	US	\N	6517
Williston	US	\N	29844
Leon Valley	US	\N	12306
Covington	US	\N	40341
Lee's Summit	US	\N	92522
Barretos	BR	\N	119243
The Pinery	US	\N	11754
Holyoke	US	\N	40117
Ostringen	DE	\N	13015
Tavistock	GB	\N	11018
Sinsheim	DE	\N	35442
West Loch Estate	US	\N	5177
Timbauba	BR	\N	57534
Ekenas	FI	\N	14784
Benicia	US	\N	28240
Hawera	NZ	\N	9810
Steyning	GB	\N	5812
Muhlacker	DE	\N	26076
Gavrilov Posad	RU	\N	5657
Woodley	GB	\N	35470
Blairsville	US	\N	6654
Cayce	US	\N	14009
Serhetabat	TM	\N	14940
Onondaga	US	\N	22797
Schriever	US	\N	6407
Horb am Neckar	DE	\N	25135
Tecax	MX	\N	51
Kucove	AL	\N	12654
Vergara	UY	\N	3810
Pereshchepyne	UA	\N	9931
Qazyan	AZ	\N	42288
Lyons	US	\N	10372
Wyoming	US	\N	75667
Albertson	US	\N	5254
Lincolnia	US	\N	24808
Roundway	GB	\N	5290
Weilheim an der Teck	DE	\N	10275
Miastko	PL	\N	11123
Littlefield	US	\N	5423
Le Ray	US	\N	21665
Marcq-en-Baroeul	FR	\N	38617
Chisineu Cris	RO	\N	7987
Pokrov	RU	\N	17025
Carcar	PH	\N	119664
Dunavarsany	HU	\N	8141
Dalton	US	\N	86628
Kingsland	US	\N	17949
Goldenrod	US	\N	13162
Coachella	US	\N	45743
Kampene	CD	\N	37034
Altamira	BR	\N	70888
Al Wasitah	EG	\N	37916
Klotze	DE	\N	10077
Lindoia	BR	\N	7485
Fleet	GB	\N	37000
Amau	PG	\N	230
Sokolov	CZ	\N	23033
Yakhroma	RU	\N	14275
Kwekwe	ZW	\N	93072
Gateway	US	\N	10513
Laa an der Thaya	AT	\N	6280
Nueva Rosita	MX	\N	36642
Southport	GB	\N	90381
Bartonville	US	\N	6113
Temescal Valley	US	\N	26709
Leagrave	GB	\N	12910
Houffalize	BE	\N	5222
Lubz	DE	\N	6342
Hemel Hempstead	GB	\N	97500
Scott	US	\N	8675
Gorna Oryahovitsa	BG	\N	35031
South Valley	US	\N	41011
Horishni Plavni	UA	\N	52167
Homestead	US	\N	69523
Evanston	US	\N	73473
Baia-Sprie	RO	\N	15476
South Highpoint	US	\N	5335
Shepton Mallet	GB	\N	10369
Northampton	US	\N	28451
Sahuarita	US	\N	50616
Elsa	US	\N	7174
Migdal Ha`Emeq	IL	\N	25600
Deerfield Beach	US	\N	81066
Mimon	CZ	\N	6443
Greenbelt	US	\N	23224
Nidda	DE	\N	17285
Kamez	AL	\N	126777
Moravska Trebova	CZ	\N	9948
Preussisch Oldendorf	DE	\N	12289
Bonndorf im Schwarzwald	DE	\N	6922
Halver	DE	\N	16106
Kula	US	\N	7541
Yuki	JP	\N	50817
Nova Kakhovka	UA	\N	69280
Dzerzhinskiy	RU	\N	55669
T'aebaek	KR	\N	46715
Big Bear Lake	US	\N	5279
Asakawa	JP	\N	6146
Guiseley	GB	\N	22347
Colonial Heights	US	\N	17370
Chino Valley	US	\N	12335
Kamyshlov	RU	\N	26444
Bryn	GB	\N	11662
Wyndham	AU	\N	780
Gaspe	CA	\N	15163
Pleasanton	US	\N	81777
Innisfail	AU	\N	7236
Brauna	BR	\N	5454
Citrus Springs	US	\N	8421
Kavali	IN	\N	90099
Country Walk	US	\N	17114
Battonya	HU	\N	5516
Crawford	US	\N	9185
Hawaiian Paradise Park	US	\N	11479
La Palma	US	\N	15428
Snezhnogorsk	RU	\N	12642
Boulder City	US	\N	14959
Exmouth	GB	\N	34432
Comarapa	BO	\N	15919
Reinach	CH	\N	19144
Letovice	CZ	\N	6745
Costa Mesa	US	\N	113003
Guarei	BR	\N	16867
Saint-Calixte	CA	\N	5934
Murphysboro	US	\N	8976
Sherlovaya Gora	RU	\N	411
Westview	US	\N	11068
Midway City	US	\N	8374
McNab/Braeside	CA	\N	7178
Detroit Lakes	US	\N	8642
Ust'-Kamchatsk	RU	\N	4939
Iguatu	BR	\N	70380
University at Buffalo	US	\N	6173
Palmaner	IN	\N	54035
Crystal Lake	US	\N	39829
Mililani Town	US	\N	27926
Junqueiropolis	BR	\N	20066
Ibirarema	BR	\N	7376
Librazhd	AL	\N	6937
Waterlooville	GB	\N	64350
Agualva	PT	\N	35824
Storrs	US	\N	16516
Salina Cruz	MX	\N	81063
Waunakee	US	\N	14052
Bellaire	US	\N	18971
Sumner	US	\N	10427
San Benito	US	\N	24243
Mount Gambier	AU	\N	29639
Stollberg	DE	\N	11303
Londonderry Township	US	\N	5211
Puquio	PE	\N	15870
Toconao	CL	\N	378
Radlett	GB	\N	8024
Winooski	US	\N	7333
Traverse City	US	\N	50522
Guilford	US	\N	22285
Neustadt an der Donau	DE	\N	14409
Bli Bli	AU	\N	7801
Aberbargoed	GB	\N	9184
Handa	JP	\N	118145
Karumba	AU	\N	531
Sainte-Julienne	CA	\N	9331
Dock Junction	US	\N	8478
Moab	US	\N	7278
Cocoa West	US	\N	6152
Perl	DE	\N	8566
Hagere Hiywet	ET	\N	43920
Basoko	CD	\N	43709
Wolfeboro	US	\N	6278
Koprivnice	CZ	\N	21851
Hihya	EG	\N	66702
Paradise	CA	\N	21389
Cernavoda	RO	\N	17022
Del Aire	US	\N	10065
Villa Union	MX	\N	13404
Lysychansk	UA	\N	103459
Eagar	US	\N	6164
Rio del Mar	US	\N	9775
South Hadley	US	\N	17763
River Falls	US	\N	16402
Sayville	US	\N	16007
Netherton	GB	\N	15017
Kotlas	RU	\N	61805
Kobayashi	JP	\N	44034
Cheb	CZ	\N	31977
Radstock	GB	\N	5620
Litomysl	CZ	\N	10378
Viera East	US	\N	11183
Eckington	GB	\N	11152
Westport	NZ	\N	4660
Meldorf	DE	\N	7204
St. Augustine Beach	US	\N	7004
Middleport	US	\N	8145
Goiana	BR	\N	71549
Kozarmisleny	HU	\N	6215
Dzuunharaa	MN	\N	18002
Worland	US	\N	5003
Schuylkill Haven	US	\N	5106
Plainfield	US	\N	50317
Cold Springs	US	\N	9168
Mareeba	AU	\N	11079
Winterville	US	\N	9931
Sodo	ET	\N	65737
Morganfield	US	\N	5337
Westwego	US	\N	8326
Vau i Dejes	AL	\N	8117
Nordenham	DE	\N	26193
Bracknell	GB	\N	84469
Shipley	GB	\N	15483
Kirkintilloch	GB	\N	19700
Asheboro	US	\N	39192
Benalmadena	ES	\N	68128
Wanparti	IN	\N	60949
Konan	JP	\N	97893
Palmital	BR	\N	22094
Garanhuns	BR	\N	110085
Shiraoi	JP	\N	16694
Borborema	BR	\N	15569
Nikolayevsk	RU	\N	13660
Barnegat	US	\N	22410
Brevard	US	\N	13666
Media	US	\N	5682
Artern	DE	\N	6799
St. Clair	US	\N	5955
Waddington	GB	\N	6122
Gourock	GB	\N	11511
Atherton	AU	\N	7331
Trutnov	CZ	\N	30234
Pont-y-pwl	GB	\N	35447
Scappoose	US	\N	7564
Friedberg	DE	\N	29810
Chagda	RU	\N	10
Camp Pendleton South	US	\N	11459
Wading River	US	\N	8034
Mayfair	US	\N	5091
Bretigny-sur-Orge	FR	\N	26528
Novoyavorovskoye	UA	\N	30723
Requena	ES	\N	20254
Adel	GB	\N	19430
Kojetin	CZ	\N	6078
Murree	PK	\N	20869
Letchworth	GB	\N	33249
Gapan	PH	\N	110303
Dargaville	NZ	\N	5170
Plainsboro	US	\N	23120
Wantagh	US	\N	18078
Fort Dodge	US	\N	23807
Orillia	CA	\N	31166
Nopala de Villagran	MX	\N	15099
South Jordan	US	\N	76598
Putnam Valley	US	\N	11654
Dania Beach	US	\N	32271
Lototla	MX	\N	9541
Bossembele	CF	\N	7287
Omura	JP	\N	95062
Gros Islet	LC	\N	21660
Center Moriches	US	\N	8395
Mont-Laurier	CA	\N	13779
Pinhal	BR	\N	43897
Dehaq	IR	\N	7828
Porto Cristo	ES	\N	7355
Khomam	IR	\N	12901
Bandar-e Rig	IR	\N	5257
Hateg	RO	\N	9685
Ozimek	PL	\N	10000
Woods Creek	US	\N	5907
Oak Brook	US	\N	8016
Myrtle Grove	US	\N	16886
Jupiter Farms	US	\N	12032
Shaw Heights	US	\N	5459
Kingston	US	\N	54791
Meningie	AU	\N	1118
El Dorado	US	\N	17706
Beccles	GB	\N	10123
Cedral	BR	\N	8767
Nyahanga	TZ	\N	16092
Katagami	JP	\N	31923
Borsa	RO	\N	27611
Moldova Noua	RO	\N	12350
New Baltimore	US	\N	12347
Haltom City	US	\N	43874
Novoaleksandrovsk	RU	\N	26761
Edison	US	\N	100809
Penkridge	GB	\N	8526
Vertou	FR	\N	24219
Depew	US	\N	15011
Harlingen	US	\N	136037
Askern	GB	\N	5570
Camano	US	\N	16427
Dharmavaram	IN	\N	121874
Estancia	BR	\N	55654
Proserpine	AU	\N	3562
Usman	RU	\N	19956
Pinhoe	GB	\N	6454
Beelitz	DE	\N	12448
Sao Lourenco da Serra	BR	\N	15177
Vaihingen an der Enz	DE	\N	29467
Huckelhoven	DE	\N	39931
La Junta	MX	\N	8930
Briton Ferry	GB	\N	5911
Feuchtwangen	DE	\N	12452
Kaltan	RU	\N	20841
Sohano	PG	\N	2338
Quievrain	BE	\N	6759
Evans	US	\N	34379
Cranbrook	GB	\N	6717
Nordvik	RU	\N	0
Darnestown	US	\N	6424
Artondale	US	\N	13172
Beauharnois	CA	\N	12011
Sankt Valentin	AT	\N	9340
Anacortes	US	\N	18563
Budaors	HU	\N	28844
West Bridgford	GB	\N	47109
Ravena	US	\N	5202
Connell	US	\N	5370
Ivangorod	RU	\N	10453
Buena Park	US	\N	81788
Tsubame	JP	\N	77307
Lazaro Cardenas	MX	\N	8704
Madera	US	\N	84086
Sainte-Julie	CA	\N	30104
Upper Southampton	US	\N	15042
Linslade	GB	\N	21590
Aloha	US	\N	55492
Lerma	MX	\N	105578
Blomberg	DE	\N	15154
Nahariyya	IL	\N	60000
South Riding	US	\N	31071
New Braunfels	US	\N	90209
Wiehl	DE	\N	25135
Neustadt	DE	\N	53148
Progress	RU	\N	146
Lake Murray of Richland	US	\N	6427
Camarillo	US	\N	76931
Brookfield	US	\N	39115
La Presa	US	\N	37437
Pontoise	FR	\N	30767
Caluire-et-Cuire	FR	\N	43187
Orland Hills	US	\N	7023
Krasnozavodsk	RU	\N	13076
Stefanesti	RO	\N	14541
Neustadt in Holstein	DE	\N	15093
Aulnay-sous-Bois	FR	\N	85740
Verkhoyansk	RU	\N	1122
Flamanzi	RO	\N	10136
Alushta	UA	\N	29668
Opelousas	US	\N	24423
Parkville	US	\N	31633
Petrich	BG	\N	40728
Webster City	US	\N	7377
Mangur	IN	\N	32091
Yamakita	JP	\N	9702
Fulham	GB	\N	87161
Petrila	RO	\N	22692
Cotati	US	\N	7410
Neuenhaus	DE	\N	10025
Ban Thung Tam Sao	TH	\N	16344
Cupar	GB	\N	9200
Chestertown	US	\N	6878
Conyers	US	\N	16256
Saint-Maur-des-Fosses	FR	\N	74859
Schwarzenbek	DE	\N	16447
Bolokhovo	RU	\N	9043
Grossschirma	DE	\N	5665
Meltham	GB	\N	8534
Mount Airy	US	\N	19119
Homun	MX	\N	6146
Carpentersville	US	\N	37254
Pine Bluff	US	\N	45204
Kennett	US	\N	10379
Morsang-sur-Orge	FR	\N	20909
Curvelo	BR	\N	63954
Jewett City	US	\N	9749
Salford	GB	\N	103886
Pemberton	GB	\N	13982
Wind Lake	US	\N	5266
Montfermeil	FR	\N	26783
Swallownest	GB	\N	15022
Elsmere	US	\N	8595
North Fort Myers	US	\N	41690
Burghfield	GB	\N	5955
Kirkland	CA	\N	20151
Vila do Porto	PT	\N	5552
Oreland	US	\N	5827
Northampton Township	US	\N	39312
Newmarket	CA	\N	84224
Kot Addu	PK	\N	120479
Aptos	US	\N	5797
Garden Home-Whitford	US	\N	6666
Itoigawa	JP	\N	41325
Chrastava	CZ	\N	6298
Dryden	US	\N	14644
Edgerton	US	\N	7431
Gypsum	US	\N	6790
Haverhill	US	\N	64014
Ermezinde	PT	\N	38798
Topolobampo	MX	\N	6361
North Tustin	US	\N	24736
Spirit Lake	US	\N	11530
Villejuif	FR	\N	54753
Bluffdale	US	\N	16358
Mbini	GQ	\N	14034
Highland Heights	US	\N	8373
Lake Shore	US	\N	20260
Lakeville	US	\N	67317
Oficina Maria Elena	CL	\N	2370
Teignmouth	GB	\N	15129
Agudos	BR	\N	36524
Geraardsbergen	BE	\N	33403
Beaver Dam	US	\N	18041
Curchorem	IN	\N	22730
De Motte	US	\N	5073
Aubervilliers	FR	\N	86375
Vatutine	UA	\N	16888
Port Shepstone	ZA	\N	52793
Shenandoah	US	\N	20192
Pavlikeni	BG	\N	11921
Scarborough	GB	\N	61749
Glenolden	US	\N	7164
Sevsk	RU	\N	6663
Kirksville	US	\N	16002
Port Hueneme	US	\N	21926
Oakdale	US	\N	27933
Gadebusch	DE	\N	5530
Aksay	KZ	\N	34799
Burleson	US	\N	48225
Sue	JP	\N	28377
Patterson	US	\N	22930
West Grey	CA	\N	12518
Savissivik	GL	\N	66
Republic	US	\N	16938
Burntwood	GB	\N	26049
Dyer	US	\N	15976
Deva	RO	\N	61123
Treuen	DE	\N	7894
Spalt	DE	\N	5023
West Little River	US	\N	33396
Busto Arsizio	IT	\N	83314
West Modesto	US	\N	5911
Rio Linda	US	\N	15460
Natchitoches	US	\N	18859
Calabasas	US	\N	23853
Birtley	GB	\N	8367
Kununurra	AU	\N	5308
Atami	JP	\N	36089
Lichfield	GB	\N	33816
Esher	GB	\N	6743
Marl	DE	\N	83941
Changxing	CN	\N	87458
Krzeszowice	PL	\N	10281
West Goshen	US	\N	23021
Beerfelden	DE	\N	6399
Bitam	GA	\N	17637
'Araba	IL	\N	27000
Gananoque	CA	\N	5159
West Caln	US	\N	9080
Lennestadt	DE	\N	25503
Seekonk	US	\N	15210
Kiama	AU	\N	7700
Griswold	US	\N	11693
Troon	GB	\N	14680
Boujad	MA	\N	46893
Nisekoan	JP	\N	5049
Colesville	US	\N	13894
Rialto	US	\N	103526
Ostrov	RO	\N	5069
Liphook	GB	\N	8491
Ashqelon	IL	\N	134454
Bastos	BR	\N	21067
Bethesda	US	\N	62448
Newport East	US	\N	11561
East Buffalo	US	\N	6806
Grafton	AU	\N	19078
Ronda	ES	\N	33877
Caimanera	CU	\N	8790
Bikin	RU	\N	15928
Freiberg am Neckar	DE	\N	15968
Camiri	BO	\N	27961
Halfway	US	\N	10784
Szazhalombatta	HU	\N	18241
Crofton	US	\N	28379
Kingstree	US	\N	5610
Camacupa	AO	\N	19828
Ruddington	GB	\N	7216
North Windham	US	\N	5820
Castellammare di Stabia	IT	\N	66164
Uyar	RU	\N	13167
Kahemba	CD	\N	50000
Pivdenne	UA	\N	7705
Peabody	US	\N	53070
Svirsk	RU	\N	12945
Aspen	US	\N	8569
Piste	MX	\N	5528
Akhmim	EG	\N	101509
Stayton	US	\N	11166
Sa-ch'on	KR	\N	113335
Westlock	CA	\N	5101
Issy-les-Moulineaux	FR	\N	68451
Warrington	US	\N	24088
Batatais	BR	\N	60589
Caldicot	GB	\N	12230
Omsukchan	RU	\N	4201
Stafford	GB	\N	68472
Keizer	US	\N	39713
Libertyville	US	\N	20205
Kipushi	CD	\N	113347
Edgewater Park	US	\N	8731
Hockinson	US	\N	5001
Port Wentworth	US	\N	9641
Lengefeld	DE	\N	7634
La Linea de la Concepcion	ES	\N	63147
Asela	ET	\N	110088
Flagler Beach	US	\N	5123
Kadoma	ZW	\N	79174
Treffurt	DE	\N	6084
Belinskiy	RU	\N	7694
Kalifornsky	US	\N	8134
Sorata	BO	\N	2217
New Romney	GB	\N	6996
Newcastle	US	\N	12292
Manitou Springs	US	\N	5390
Dawlish	GB	\N	15954
Ngorongoro	TZ	\N	10836
Stupino	RU	\N	66341
Cherry Hinton	GB	\N	8780
Orekhovo-Zuyevo	RU	\N	118822
Ayagoz	KZ	\N	41593
Villa del Rosario	PY	\N	5123
X-Can	MX	\N	5191
Ocean Pointe	US	\N	14037
Pedreiras	BR	\N	13638
Padilla	BO	\N	2920
Plaistow	US	\N	7677
Appleton	GB	\N	10265
The Hammocks	US	\N	60473
Dowagiac	US	\N	5864
Mnisek pod Brdy	CZ	\N	5933
Campo Limpo	BR	\N	80847
Hockessin	US	\N	13472
Valadares	PT	\N	10678
Tazeh Shahr	IR	\N	8216
San Vicente de Canete	PE	\N	25829
West Boldon	GB	\N	13271
Helena Valley West Central	US	\N	8277
Dewsbury	GB	\N	62945
North Versailles	US	\N	10081
Kaltenkirchen	DE	\N	21813
Springettsbury	US	\N	26815
Brigg	GB	\N	5626
Lower Gwynedd	US	\N	11508
Sotik	KE	\N	71285
Dalry	GB	\N	5398
Wurzen	DE	\N	16154
Aigle	CH	\N	10131
Glen Burnie	US	\N	69813
Terrell	US	\N	17696
Mount Washington	US	\N	14817
Viernheim	DE	\N	34175
La Teste-de-Buch	FR	\N	26078
Brownfields	US	\N	5092
Fischamend	AT	\N	5583
West Sacramento	US	\N	53519
Harriman	US	\N	22708
Wescosville	US	\N	6213
Bad Schussenried	DE	\N	8734
Yarmouth	CA	\N	6518
Patacamaya	BO	\N	22858
Ferlach	AT	\N	7141
Andradina	BR	\N	57250
Nephi	US	\N	6212
Guanhaes	BR	\N	23727
Vanves	FR	\N	27729
Nandod	IN	\N	54923
Uxbridge	CA	\N	21176
Suntar	RU	\N	8639
Rossville	US	\N	15392
Dover	GB	\N	31022
Warwick	GB	\N	31345
Caconde	BR	\N	18976
San Felipe Orizatlan	MX	\N	38472
Ferguson	US	\N	20525
Heusenstamm	DE	\N	18973
Glendale Heights	US	\N	33617
Olenek	RU	\N	10
Bowie	US	\N	58643
Ambriz	AO	\N	17000
St. Louis Park	US	\N	48662
Klintsy	RU	\N	62936
Parma Heights	US	\N	19790
Hesperia	US	\N	95750
Coto de Caza	US	\N	14931
Gaildorf	DE	\N	12080
Surfside	US	\N	5651
Bowling	GB	\N	5500
Neuhausen am Rheinfall	CH	\N	10510
Cofradia	HN	\N	18100
Lovington	US	\N	12097
Newburgh	US	\N	30702
Temozon	MX	\N	6553
East Providence	US	\N	47618
Leadville	US	\N	5554
Dandenong	AU	\N	29906
Shotley Bridge	GB	\N	27394
San Francisco	MX	\N	5167
Braidwood	US	\N	22670
West Falls Church	US	\N	29154
Maili	US	\N	10792
Paoli	US	\N	5864
Hawkesbury	CA	\N	10263
Bibai	JP	\N	21168
Camenca	MD	\N	8871
Firebaugh	US	\N	8000
Artemivsk	UA	\N	7506
Langley	CA	\N	117285
Palana	RU	\N	3671
Acushnet	US	\N	10483
Alloa	GB	\N	20730
Berching	DE	\N	8702
San Pedro	BZ	\N	11767
Ladysmith	ZA	\N	47375
Rudesheim am Rhein	DE	\N	9922
Balerno	GB	\N	5486
Herdorf	DE	\N	6498
Menifee	US	\N	94756
Yeppoon	AU	\N	19003
Santa Catarina Otzolotepec	MX	\N	67611
Darcheh	IR	\N	43183
Farnham	GB	\N	39488
Rancho Cordova	US	\N	75087
Hobe Sound	US	\N	13953
Chauk	MM	\N	90870
Monkseaton	GB	\N	19044
South Ogden	US	\N	17199
Walnut	US	\N	29685
Naples	US	\N	22088
Salto de Pirapora	BR	\N	43574
Brayton	GB	\N	5299
Cherry Valley	US	\N	7755
Rain	DE	\N	8836
Joacaba	BR	\N	38876
Eraclea	IT	\N	90000
Brusque	BR	\N	88284
Bixby	US	\N	27944
Oradell	US	\N	8131
Hammond	US	\N	75522
Ward	US	\N	5358
Penistone	GB	\N	22909
West Dundee	US	\N	8113
Frankfort Square	US	\N	8638
Dunstable	GB	\N	35000
Kotamobagu	ID	\N	120597
In Guezzam	DZ	\N	7045
Sankt Augustin	DE	\N	55767
Stepney	GB	\N	16238
Hood River	US	\N	15949
Greetland	GB	\N	11389
Delhi Hills	US	\N	5308
Purkersdorf	AT	\N	9701
Farnham Royal	GB	\N	5972
Morton Grove	US	\N	22796
Thornton	GB	\N	17276
Rothschild	US	\N	5267
Arapongas	BR	\N	97512
Olovyannaya	RU	\N	8247
Pottsville	AU	\N	6704
Tirat Karmel	IL	\N	22200
Goffs Oak	GB	\N	8172
Norridge	US	\N	14152
Blackwood	GB	\N	8496
Shimotsucho-kominami	JP	\N	48846
Pannal	GB	\N	5562
Upper Moreland	US	\N	24148
Abenberg	DE	\N	5511
Oak Park Heights	US	\N	5003
West Donegal	US	\N	8732
Huasco	CL	\N	2558
Pershore	GB	\N	7125
Stary Sacz	PL	\N	9056
Otelu Rosu	RO	\N	10510
Hilton Head Island	US	\N	74139
Wailea	US	\N	5656
Murrysville	US	\N	19590
Rotterdam	US	\N	29448
Kingsbridge	GB	\N	6116
Rayne	US	\N	9431
Glastonbury	GB	\N	8932
Khed	IN	\N	16892
Harrison Township	US	\N	10394
Buton	ID	\N	140
Stonewood	GB	\N	6100
Mikhaylovsk	RU	\N	93658
Central City	US	\N	9531
Dunboyne	IE	\N	5713
Asino	RU	\N	24354
Slavicin	CZ	\N	6386
Lemay	US	\N	16814
Oyabe	JP	\N	29081
Shakhunya	RU	\N	20049
Khambhat	IN	\N	98700
Santo Angelo	BR	\N	65420
Krumbach	DE	\N	13293
Margate	GB	\N	61223
Devnya	BG	\N	9036
Paarl	ZA	\N	112045
Stratford	US	\N	52279
Teluk Intan	MY	\N	101659
Worsley	GB	\N	10090
Lichtenstein	DE	\N	11285
Wissen	DE	\N	8354
Pinner	GB	\N	31130
Donegal	IE	\N	2513
Ellrich	DE	\N	5543
East York	US	\N	8459
Pleasant Grove	US	\N	38258
Petrolia	CA	\N	5742
Wiesmoor	DE	\N	13141
New Brunswick	US	\N	55676
Lihue	US	\N	7381
Wheaton	US	\N	52745
Sen`afe	ER	\N	6831
Rajgir	IN	\N	41587
Stamford	US	\N	129638
Cruz Alta	BR	\N	62821
Sackville	CA	\N	5331
Tassin-la-Demi-Lune	FR	\N	22297
Byureghavan	AM	\N	8500
Okmulgee	US	\N	13357
Bad Salzuflen	DE	\N	54127
Sidi Slimane	MA	\N	92989
Swaffham	GB	\N	7258
Rokycany	CZ	\N	14383
Khvalynsk	RU	\N	12391
Portchester	GB	\N	17789
Rodniki	RU	\N	24335
Ise	JP	\N	123783
Morganton	US	\N	16577
East Cleveland	US	\N	16964
Popesti-Leordeni	RO	\N	21895
El Mirage	US	\N	35753
Rochdale	GB	\N	107926
Epanomi	GR	\N	8979
Prattville	US	\N	35957
Divinolandia	BR	\N	11492
Dunn Loring	US	\N	9155
Sundon	GB	\N	7585
Challans	FR	\N	20662
Sanctuary Point	AU	\N	7225
Ino	JP	\N	21223
Crafton	US	\N	5770
Davie	US	\N	106306
Shenstone	GB	\N	7359
Braunlingen	DE	\N	5828
Headley	GB	\N	5613
Avdiivka	UA	\N	34938
Kirton	GB	\N	5371
Al Wajh	SA	\N	43237
Stettler	CA	\N	5952
Desborough	GB	\N	10697
Makarov	RU	\N	6567
Ishikida	JP	\N	16189
Ocatlan	MX	\N	22082
Emmett	US	\N	9889
Rowley	US	\N	6298
Casteloes de Cepeda	PT	\N	7299
Othello	US	\N	12761
Tokoroa	NZ	\N	13650
Kirkwood	US	\N	27807
Las Lomitas	AR	\N	7683
South Bruce	CA	\N	5639
West Hills	US	\N	5338
Aviles	ES	\N	78182
Withamsville	US	\N	7788
Rhoose	GB	\N	6160
Arzamas	RU	\N	104547
Gewane	ET	\N	8408
Banak	IR	\N	8753
Payakumbuh	ID	\N	125608
Manor	US	\N	14642
Lake Wylie	US	\N	12569
Lambton Shores	CA	\N	10631
Burkburnett	US	\N	10427
Big Bear City	US	\N	13312
Berekum	GH	\N	46287
San Carlos	PH	\N	132536
Prosser	US	\N	6380
Zhezqazghan	KZ	\N	86227
Sawston	GB	\N	7145
East Rockaway	US	\N	9814
Blacklick Estates	US	\N	9596
Lipany	SK	\N	6484
Fort Knox	US	\N	8965
Ban Sai Ma Tai	TH	\N	30750
Shimizu	JP	\N	9375
Pecan Plantation	US	\N	5987
Ashby de la Zouch	GB	\N	12370
Sosenskiy	RU	\N	10628
Cos Cob	US	\N	6959
Harmanli	BG	\N	23932
Claiborne	US	\N	11435
North Platte	US	\N	24098
Mit Ghamr	EG	\N	121039
Ban Bang Khu Lat	TH	\N	38758
Yartsevo	RU	\N	44097
Grigoriopol	MD	\N	9381
Bogen	DE	\N	10263
Healdsburg	US	\N	11845
Sturovo	SK	\N	10524
Beltsville	US	\N	17589
West Covina	US	\N	105101
Milwaukie	US	\N	20990
Los Chaves	US	\N	5890
Harpenden	GB	\N	30240
Sinton	US	\N	5738
Terrytown	US	\N	24244
Boerne	US	\N	18225
Nasir	SS	\N	1741
Bidur	NP	\N	26750
Sakurai	JP	\N	55005
Hotton	BE	\N	5531
Berchtesgaden	DE	\N	7780
Sulphur Springs	US	\N	14916
Vanino	RU	\N	18618
Thorold	CA	\N	18801
Manville	US	\N	10121
Melville	US	\N	17872
Mattoon	US	\N	18016
Schwarzheide	DE	\N	5652
Az Zubaydiyah	IQ	\N	70000
Longbridge	GB	\N	25410
Prairie du Sac	US	\N	8627
Chop	UA	\N	8897
Oak Forest	US	\N	27173
Altamonte Springs	US	\N	44143
Cuddington	GB	\N	5333
Radomir	BG	\N	14880
Deer Park	US	\N	33474
Greene Township	US	\N	17588
Kounoupidiana	GR	\N	6334
Kan'onjicho	JP	\N	57333
New Boston	US	\N	5616
Senov	CZ	\N	6393
Herbolzheim	DE	\N	11065
Boa Esperanca do Sul	BR	\N	14546
Hoover	US	\N	85768
Baicoi	RO	\N	17981
Kawanishicho	JP	\N	8442
Freshwater	GB	\N	5369
Benton Harbor	US	\N	59216
Allstedt	DE	\N	7745
Draper	US	\N	48587
Leighton Buzzard	GB	\N	37000
Apatity	RU	\N	55713
Fallston	US	\N	8836
Calumet Park	US	\N	7602
Hillandale	US	\N	6223
Mount Kisco	US	\N	10795
Vrontados	GR	\N	5323
Lebach	DE	\N	19006
Crumlin	GB	\N	5947
Pittsfield	US	\N	55697
Jasmine Estates	US	\N	21772
Dalhart	US	\N	8086
Uglich	RU	\N	32146
Yangambi	CD	\N	35531
Shawnee	US	\N	65807
Needham	US	\N	30735
Einbeck	DE	\N	30826
Kamigoto	JP	\N	18008
Rupea	RO	\N	5269
Ribeirao Branco	BR	\N	17646
Daventry	GB	\N	25026
Alderwood Manor	US	\N	9257
Rothenburg ob der Tauber	DE	\N	11243
Eastmont	US	\N	21686
Thiells	US	\N	5186
Saranac Lake	US	\N	7404
Helmshore	GB	\N	5805
Hermsdorf	DE	\N	7893
Frankfort	US	\N	38852
Jaleshwar	NP	\N	23533
Nagato	JP	\N	32817
Rock Ferry	GB	\N	14298
Andamooka	AU	\N	316
Ripley	GB	\N	20807
Rowley Regis	GB	\N	50257
Keystone	US	\N	24632
Alafaya	US	\N	88542
Breaza	RO	\N	15928
Dunbar	US	\N	7093
Alliance	US	\N	31255
Athi River	KE	\N	81302
Basingstoke	GB	\N	113776
Pytalovo	RU	\N	5354
Tateyama	JP	\N	45300
Lake City	US	\N	26271
Chicago Heights	US	\N	29322
Porthcawl	GB	\N	16005
Villiers-le-Bel	FR	\N	27676
Kushk	IR	\N	11264
Mount Pocono	US	\N	23820
Gautier	US	\N	18490
Metpalli	IN	\N	50902
Peters	US	\N	21954
Brenham	US	\N	17823
Hwlffordd	GB	\N	12042
Moline	US	\N	41356
Wilton Manors	US	\N	12756
Rugby	GB	\N	70628
Itapipoca	BR	\N	55784
Tinton Falls	US	\N	17451
Vuktyl	RU	\N	10017
Povoacao	PT	\N	6327
Overland	US	\N	15551
Highwood	US	\N	5224
Burton Latimer	GB	\N	7449
Busti	US	\N	7277
Philomath	US	\N	5666
Tsuruta	JP	\N	12569
Shakopee	US	\N	41570
Zephyrhills	US	\N	82476
Furmanov	RU	\N	33905
Pidhorodne	UA	\N	19524
Hackensack	US	\N	44188
Centre Wellington	CA	\N	28191
Hayes	GB	\N	83564
Bethal	ZA	\N	101919
Rancho San Diego	US	\N	21289
Lambertville	US	\N	9394
Caister-on-Sea	GB	\N	8901
Vitry-sur-Seine	FR	\N	93557
Natori-shi	JP	\N	78796
Brook Highland	US	\N	7116
Rosemont	US	\N	23617
Konosu	JP	\N	117373
Lingen	DE	\N	54422
Merrow	GB	\N	8036
Miyanaga	JP	\N	27182
Abai	PY	\N	3024
Dorchester	GB	\N	19060
Frankston	AU	\N	36097
Lenoir City	US	\N	9324
Aiken	US	\N	30869
Ilave	PE	\N	16033
Mansfield	GB	\N	106556
Matsuda-soryo	JP	\N	10884
South Boston	US	\N	7740
Rigby	US	\N	9496
Stainforth	GB	\N	6282
Tefe	BR	\N	51437
Mulheim-Karlich	DE	\N	11177
Dunafoldvar	HU	\N	8593
Brunoy	FR	\N	25669
Toccoa	US	\N	10647
Sayansk	RU	\N	38968
Bo`ston	UZ	\N	8488
Capitao Poco	BR	\N	32704
Kitakami	JP	\N	92447
As Sallum	EG	\N	8445
Fanwood	US	\N	7697
Woodhouse	GB	\N	17450
Shirakawa	JP	\N	59730
Wervik	BE	\N	18643
Negele	ET	\N	11772
Wolfratshausen	DE	\N	18836
Taylor	US	\N	60922
Mun'gyong	KR	\N	71863
Okeechobee	US	\N	26256
Alpharetta	US	\N	67213
Aurora	CA	\N	55445
Issaquah	US	\N	39509
Berwick-Upon-Tweed	GB	\N	12043
Zavodoukovsk	RU	\N	26048
Ejea de los Caballeros	ES	\N	16783
Burgdorf	CH	\N	16280
North Valley Stream	US	\N	19202
Candon	PH	\N	60623
Hughenden	AU	\N	1136
Holic	SK	\N	11171
Neuilly-sur-Marne	FR	\N	34993
Cave Creek	US	\N	5838
Doral	US	\N	65741
World Golf Village	US	\N	16538
Yorkville	US	\N	20613
Yucaipa	US	\N	53921
Sarina	AU	\N	5522
Debre Zeyit	ET	\N	99928
Yauco	PR	\N	16802
Bananal	BR	\N	10775
Mandurah	AU	\N	7837
Pudsey	GB	\N	22408
Corovode	AL	\N	4051
Kirkby in Ashfield	GB	\N	20672
Mbe	CM	\N	3950
Bolton	US	\N	5236
Seltso	RU	\N	16554
Wellesley	US	\N	29201
Key Largo	US	\N	9954
Ulundi	ZA	\N	29132
Port Coquitlam	CA	\N	58612
Itirapina	BR	\N	17160
East Cowes	GB	\N	7010
Benslimane	MA	\N	57101
Endwell	US	\N	11641
Temax	MX	\N	6239
Rodeo	US	\N	10411
Birigui	BR	\N	118352
Darhan	MN	\N	74738
Maina	GU	\N	122411
Herzogenrath	DE	\N	46402
Fukuchiyama	JP	\N	76677
Portage Lakes	US	\N	7139
West Windsor	US	\N	28007
Ulladulla	AU	\N	15278
Antrim	GB	\N	19986
Yelets	RU	\N	104349
Upper Freehold	US	\N	6906
Great Falls	US	\N	65131
Kahama	TZ	\N	36014
Diego de Almagro	CL	\N	18137
Grinnell	US	\N	8980
Huskvarna	SE	\N	22000
Cradock	ZA	\N	32898
Baytown	US	\N	77192
Teaneck	US	\N	40543
Reynoldsburg	US	\N	38327
Odry	CZ	\N	7285
Kirsanov	RU	\N	16409
Clearwater	US	\N	116946
Mansoa	GW	\N	7376
Villanueva y Geltru	ES	\N	67086
Santa Adelia	BR	\N	15178
Barysh	RU	\N	15974
Barnesville	US	\N	7064
Rio Colorado	AR	\N	11733
Rio Pinar	US	\N	5354
Coronel Bogado	PY	\N	14297
Tottington	GB	\N	9783
Bradford-on-Avon	GB	\N	9402
Bromont	CA	\N	7649
Stratford-upon-Avon	GB	\N	27445
Niihama	JP	\N	116392
Valdosta	US	\N	79820
Wanaque	US	\N	11762
Giddings	US	\N	5254
Sugar Grove	US	\N	9888
Hurdiyo	SO	\N	176
Orwigsburg	US	\N	5376
Accrington	GB	\N	35456
Willich	DE	\N	50592
Mikomeseng	GQ	\N	5813
Golden Glades	US	\N	34836
Luza	RU	\N	10232
Santa Barbara do Rio Pardo	BR	\N	5944
Waverly	US	\N	24546
McMinnville	US	\N	42062
Ridgecrest	US	\N	32684
Black River Falls	US	\N	5430
Malvern	US	\N	11851
Bethel Park	US	\N	32345
Cheviot	US	\N	8209
Kral'ovsky Chlmec	SK	\N	7505
Sedgley	GB	\N	12087
Qift	EG	\N	22063
St. Martinville	US	\N	6872
Maisons-Laffitte	FR	\N	23669
Ulmeni	RO	\N	7270
Kishi	JP	\N	18010
Igrim	RU	\N	9545
Collegedale	US	\N	11378
Semiluki	RU	\N	26732
Tuni	IN	\N	53425
Logashkino	RU	\N	0
Weare	US	\N	9011
Alsfeld	DE	\N	15989
Isehara	JP	\N	102137
Ronse	BE	\N	26337
North Dansville	US	\N	5337
Schesslitz	DE	\N	7259
Fort Bragg	US	\N	10374
Streaky Bay	AU	\N	1378
Meadow Lakes	US	\N	7656
Chikhli	IN	\N	6953
Tell City	US	\N	9529
Chene-Bougeries	CH	\N	12215
Puerto Escondido	MX	\N	45000
Puerto Acosta	BO	\N	1123
Superior	US	\N	25977
Takahata	JP	\N	22709
Gresham Park	US	\N	8694
Little Egg Harbor	US	\N	20848
Lunenburg	US	\N	11271
Yasugicho	JP	\N	37581
Solebury	US	\N	8593
Langenthal	CH	\N	15639
Gif-sur-Yvette	FR	\N	21379
Wenham	US	\N	5208
Guaira	BR	\N	36426
Dodworth	GB	\N	9777
Eibar	ES	\N	27522
Bear Valley Springs	US	\N	5442
Canton Township	US	\N	8180
Thale	DE	\N	17442
Church Gresley	GB	\N	6881
Maysville	US	\N	11093
Belmar	US	\N	5545
Central Point	US	\N	18848
Sainte-Catherine	CA	\N	16762
Chelmsford	GB	\N	111511
Westernport	US	\N	5330
Hekinan	JP	\N	72875
Litovel	CZ	\N	9738
Sucy-en-Brie	FR	\N	26472
Atlantic Beach	US	\N	13872
Puerto Villarroel	BO	\N	1778
Courtenay	CA	\N	25599
Nordlingen	DE	\N	20379
Twin Falls	US	\N	55556
Mill Hill	GB	\N	18451
Delaware Township	US	\N	7066
Cudahy	US	\N	23569
Madras	US	\N	9340
Apiai	BR	\N	25211
Freudenberg	DE	\N	17739
Sao Manuel	BR	\N	40367
Whitpain	US	\N	19194
Lexden	GB	\N	5549
O'Fallon	US	\N	88673
Syasstroy	RU	\N	12824
Dingwall	GB	\N	6545
Tolleson	US	\N	7372
Hamilton Township	CA	\N	10942
Auburndale	US	\N	16650
San Ignacio Cohuirimpo	MX	\N	10606
Mohlin	CH	\N	11042
Caterham	GB	\N	21030
Farmers Loop	US	\N	5535
Markapur	IN	\N	71092
Upper Merion	US	\N	29400
Great Driffield	GB	\N	13080
Emsdetten	DE	\N	36012
Crystal	US	\N	22899
Worcester	ZA	\N	97098
South Milwaukee	US	\N	20696
Vicente Guerrero	MX	\N	15982
Old Harbour	JM	\N	28665
Chabana	JP	\N	5032
Talayuela	ES	\N	7371
Applewood	US	\N	8308
Upper Dublin	US	\N	26269
Annaka	JP	\N	55578
Tiffin	US	\N	19130
Neu Bleckede	DE	\N	9457
North Ridgeville	US	\N	34392
North Hobbs	US	\N	6068
Jacareacanga	BR	\N	31661
Chiramba	MZ	\N	556
Redland	US	\N	16978
Lakewood Park	US	\N	12635
Comallo	AR	\N	741
Alta Floresta	BR	\N	40466
Murom	RU	\N	109072
Cannington	AU	\N	5929
Frankenberg	DE	\N	17808
Januaria	BR	\N	34811
Aubrey	US	\N	7806
Denny	GB	\N	7934
Talara	PE	\N	103200
Steinhaus	CH	\N	10025
Miyatoko	JP	\N	18934
Somersworth	US	\N	11968
Balykchy	KG	\N	42380
Timberlane	US	\N	10192
Velikiy Ustyug	RU	\N	31806
Portales	US	\N	11921
Louth	GB	\N	16419
Al Qunfudhah	SA	\N	157
Prabuty	PL	\N	8215
Kapuskasing	CA	\N	8292
Capilla del Monte	AR	\N	11181
Butzbach	DE	\N	26197
Sudbury	GB	\N	14950
Clemson	US	\N	17501
Agoura Hills	US	\N	20222
St. George	US	\N	120899
Palmeira dos Indios	BR	\N	41095
Bayou Cane	US	\N	20829
West Hempstead	US	\N	20116
Makawao	US	\N	7570
Caledon	ZA	\N	13020
Millersville	US	\N	8359
Saint-Felix-de-Valois	CA	\N	6029
Melekeok	PW	\N	7026
Kurihara	JP	\N	65313
Sonoma	US	\N	33831
Sena Madureira	BR	\N	26192
Whetstone	GB	\N	6556
Martensville	CA	\N	9645
Stochov	CZ	\N	5392
Inwood	US	\N	9804
Amherstburg	CA	\N	21936
Bederkesa	DE	\N	5227
Becal	MX	\N	6511
Orchard Homes	US	\N	5859
Yahualica	MX	\N	22228
McLean	US	\N	47075
Loomis	US	\N	6866
Alnwick	GB	\N	8116
Morgantown	US	\N	72458
Berlin	US	\N	20519
Siloam Springs	US	\N	21975
Ban Krathum Lom	TH	\N	24237
Cowley	GB	\N	16500
Tarabai	BR	\N	7168
Hueytown	US	\N	15322
Highland	US	\N	55417
Mayluu-Suu	KG	\N	20200
Kemp Mill	US	\N	13838
Nova Vicosa	BR	\N	55980
Hoskins	PG	\N	871
Pacaembu	BR	\N	13961
Muconda	AO	\N	2324
Sherwood	US	\N	31436
Roberval	CA	\N	10227
Le Mee-sur-Seine	FR	\N	20816
Rincon Valley	US	\N	5469
Geiselhoring	DE	\N	6860
Svitavy	CZ	\N	16758
Gosport	GB	\N	71529
Notre-Dame-des-Prairies	CA	\N	8868
Corman Park No. 344	CA	\N	8568
Kamihonbetsu	JP	\N	6948
Marlborough	GB	\N	8395
Torrinha	BR	\N	9846
Burley in Wharfedale	GB	\N	7041
Windorah	AU	\N	115
Clyde	US	\N	5886
Molln	DE	\N	19031
Sunland Park	US	\N	17978
Tarui	JP	\N	26896
Lydney	GB	\N	8766
Shoreline	US	\N	57027
Lower Southampton	US	\N	19101
Lewes	US	\N	29187
Raleigh Hills	US	\N	5892
Smithfield Heights	AU	\N	5303
Rumburk	CZ	\N	11036
Carahue	CL	\N	11875
Creswell	US	\N	6959
Werneuchen	DE	\N	8994
Zharkent	KZ	\N	43430
Ceska Skalice	CZ	\N	5047
Perryville	US	\N	8696
Larkhall	GB	\N	14951
Ishpeming	US	\N	12198
Chesterfield	US	\N	47538
South Lake Tahoe	US	\N	30188
Golyshmanovo	RU	\N	13424
Lesosibirsk	RU	\N	59525
Tachov	CZ	\N	13038
Paulsboro	US	\N	5854
Tenterden	GB	\N	7735
Buctzotz	MX	\N	7515
Squamish	CA	\N	19512
Itoman	JP	\N	60546
St. Charles	US	\N	71028
Temple City	US	\N	35811
Sagae	JP	\N	40185
Loffingen	DE	\N	7676
Kearney	US	\N	34418
Hilton	US	\N	5777
Dembi Dolo	ET	\N	27780
Kumertau	RU	\N	60164
Alpena	US	\N	13541
Tekeli	KZ	\N	30707
Drebkau	DE	\N	5538
Marilla	US	\N	5373
Porterville	ZA	\N	7057
Readington	US	\N	15880
Shirayamamachi	JP	\N	110188
Shebekino	RU	\N	42465
Yao	TD	\N	91507
Hawthorn Woods	US	\N	8666
Mascouche	CA	\N	42491
Nea Artaki	GR	\N	9489
Rockport	US	\N	19743
Santa Fe Springs	US	\N	17630
Tobolsk	RU	\N	98886
East Hanover	US	\N	11116
Bechyne	CZ	\N	5016
Shibayama	JP	\N	7082
Toba	JP	\N	17907
Itaberaba	BR	\N	47301
Kelty	GB	\N	6529
Oster	UA	\N	10245
Waki	JP	\N	6238
Fussen	DE	\N	15608
Sechura	PE	\N	32144
Oakham	GB	\N	10922
Saint-Lambert	CA	\N	21861
Shiyeli	KZ	\N	29832
Snizhne	UA	\N	47259
Cherry Hill Mall	US	\N	13752
Greentree	US	\N	11453
Kasongo	CD	\N	63000
Balkany	HU	\N	6238
Basford	GB	\N	16207
Ramtown	US	\N	6076
Jefferson Hills	US	\N	11101
Bersted	GB	\N	8496
Saint-Gratien	FR	\N	20682
Tilehurst	GB	\N	14683
Cerrik	AL	\N	6695
Wilnecote	GB	\N	9358
Wyandotte	US	\N	24859
Glassboro	US	\N	20288
Aldershot	GB	\N	36322
Miercurea Nirajului	RO	\N	5554
Hamajo	JP	\N	12762
Munzenberg	DE	\N	5769
Tapirai	BR	\N	8047
Lubao	CD	\N	43068
Ingeniero Jacobacci	AR	\N	6261
Englefield Green	GB	\N	10607
Wilkins	US	\N	6247
Pearl River	US	\N	16495
Tzucacab	MX	\N	9967
Santa Ana de Yacuma	BO	\N	12783
Cavaillon	FR	\N	26641
Faringdon	GB	\N	7121
Pudozh	RU	\N	8897
Ellon	GB	\N	9860
Mar de Ajo	AR	\N	13610
Cullowhee	US	\N	6139
Green Valley	US	\N	21723
East Hartford	US	\N	50453
Muscatine	US	\N	26168
Argyle	CA	\N	7899
Hochelheim	DE	\N	18143
Vikhorevka	RU	\N	21118
Hausach	DE	\N	5768
Ivybridge	GB	\N	11851
La Mana	EC	\N	23775
Omiyacho	JP	\N	128501
Piso Firme	BO	\N	72
Weida	DE	\N	8472
Farafenni	GM	\N	36000
Allendale	US	\N	20776
Rolim de Moura	BR	\N	24516
Guben	DE	\N	16933
Leominster	GB	\N	11691
Reston	US	\N	60335
Adelanto	US	\N	34049
Hazelwood	US	\N	25117
Carroll	US	\N	9717
Tobetsu	JP	\N	15895
Registro	BR	\N	56280
Bad Sooden-Allendorf	DE	\N	8675
Varnsdorf	CZ	\N	15193
Shima	JP	\N	46937
Viera West	US	\N	11116
Colebrookdale	US	\N	5075
Atasu	KZ	\N	19616
Chillum	US	\N	35798
New Milton	GB	\N	25717
Millsboro	US	\N	10985
Macedonia	US	\N	12000
Munuf	EG	\N	117240
Blytheville	US	\N	15693
Saint-Basile-le-Grand	CA	\N	16736
Round Rock	US	\N	133372
Meerbusch	DE	\N	56189
Olney	GB	\N	6477
Kotovsk	RU	\N	29999
Miyoshidai	JP	\N	38393
High River	CA	\N	13584
Stourbridge	GB	\N	63298
Magnolia	US	\N	10339
Sand Lake	US	\N	8444
East Greenbush	US	\N	16411
Mendeleyevsk	RU	\N	22336
West Wendover	US	\N	5197
Otterberg	DE	\N	5389
Lysander	US	\N	22661
Lambersart	FR	\N	27649
Aguas da Prata	BR	\N	8025
Hughenden	GB	\N	8506
Ciudad Cortes	CR	\N	3850
Pike Creek Valley	US	\N	10664
Walden	US	\N	11085
Tandarei	RO	\N	13219
Villarrica	CL	\N	31602
Mooresville	US	\N	39132
Yemanzhelinsk	RU	\N	28742
Newberg	US	\N	29225
South River	US	\N	15779
Kyritz	DE	\N	9303
Belgrade	US	\N	17743
Monte Azul Paulista	BR	\N	19304
Long Hill	US	\N	8659
South Salt Lake	US	\N	25582
Black Jack	US	\N	6918
Buzias	RO	\N	7023
Nittenau	DE	\N	9019
Urlati	RO	\N	10541
Schleiden	DE	\N	13053
Fort Mill	US	\N	22284
Shingu	JP	\N	32691
Kadogawa	JP	\N	17526
Montecastrilli	IT	\N	5037
Paracho de Verduzco	MX	\N	37464
Piggs Peak	SZ	\N	5750
Ijui	BR	\N	71202
Meadville	US	\N	22580
Mint Hill	US	\N	27617
Scenic Oaks	US	\N	6106
Bad Orb	DE	\N	10020
East Foothills	US	\N	6278
Oga	JP	\N	25634
Odenton	US	\N	41846
Colleyville	US	\N	27091
Guyancourt	FR	\N	28633
Coraopolis	US	\N	5424
Sound Beach	US	\N	8093
Bath	US	\N	12064
Katy	US	\N	21729
Baymak	RU	\N	17254
Dolhasca	RO	\N	10298
Petrovsk-Zabaykal'skiy	RU	\N	16213
Cherryland	US	\N	16387
Votkinsk	RU	\N	97550
Glen Cove	US	\N	27166
Jalalpur Jattan	PK	\N	90130
Musashimurayama	JP	\N	71579
Valladolid	MX	\N	48973
Sainte-Brigitte-de-Laval	CA	\N	5696
Seymour	US	\N	23598
Bay Harbor Islands	US	\N	5793
Central Islip	US	\N	31846
Stouffville	CA	\N	45837
Gravenhurst	CA	\N	12311
Riverview	US	\N	91190
Sredets	BG	\N	9237
Mortsel	BE	\N	26157
Redhill	GB	\N	18163
Gorodishche	RU	\N	7885
Comstock Northwest	US	\N	6144
Grosse Pointe Woods	US	\N	15332
Qiryat Yam	IL	\N	40700
Gustine	US	\N	5882
Oldbury	GB	\N	25488
Sao Francisco do Sul	BR	\N	36224
Taga	JP	\N	7291
Kozlovka	RU	\N	8866
Tulun	RU	\N	41640
Hermeskeil	DE	\N	6492
Cherskiy	RU	\N	3707
Earlestown	GB	\N	10830
Great Baddow	GB	\N	14650
Asslar	DE	\N	13656
Poulsbo	US	\N	11168
Bermejo	BO	\N	28285
Bad Nauheim	DE	\N	32163
Dothan	US	\N	72396
Pace	US	\N	23749
Ibiuna	BR	\N	76432
Coldwater	US	\N	18832
Ringwood	US	\N	12198
Lalibela	ET	\N	14668
Miller Place	US	\N	11755
Lemon Grove	US	\N	26811
Papeete	PF	\N	131695
East Porterville	US	\N	6679
El Talar de Pacheco	AR	\N	50426
Takagi	JP	\N	88795
Candor	US	\N	5089
Westminster	US	\N	113166
Strezhevoy	RU	\N	41541
Jestetten	DE	\N	5276
Cairo	US	\N	9181
South Elgin	US	\N	24755
Lochgelly	GB	\N	6834
Pleasant Hill	US	\N	34839
Hitchcock	US	\N	7914
Simsbury	US	\N	24519
Pasewalk	DE	\N	10213
Farmingville	US	\N	15495
Yosemite Lakes	US	\N	5647
Port Hedland	AU	\N	14320
Bretten	DE	\N	29412
Stockbridge	US	\N	29904
Herzogenburg	AT	\N	7771
East Stroudsburg	US	\N	57577
Aguelhok	ML	\N	9000
`Arad	IL	\N	24436
Motherwell	GB	\N	32480
Stow	US	\N	34785
Saugeen Shores	CA	\N	13715
Lehututu	BW	\N	1942
Utkholok	RU	\N	10
Waldmunchen	DE	\N	6728
Hlatikulu	SZ	\N	2748
Feilding	NZ	\N	16450
Booneville	US	\N	5880
Agawam	US	\N	28613
Breckenridge	US	\N	7818
Milford Haven	GB	\N	13907
Piedmont	US	\N	11135
Champlin	US	\N	25268
Ban Khlong Ton Madua	TH	\N	22265
Mountain Top	US	\N	11319
Nzeto	AO	\N	21059
Makaha	US	\N	8740
Sergach	RU	\N	20269
Singera	MD	\N	9966
Salto Grande	BR	\N	9223
Santa Ines	BR	\N	67424
North Little Rock	US	\N	65903
Armthorpe	GB	\N	14457
Rudnya	RU	\N	9484
Aripuana	BR	\N	26983
Munford	US	\N	6109
Bad Bramstedt	DE	\N	14420
Herrieden	DE	\N	7999
Hellesdon	GB	\N	10957
Great Barrington	US	\N	6894
El Manteco	VE	\N	2215
Oxted	GB	\N	11314
Massanetta Springs	US	\N	5517
Borjomi	GE	\N	14445
Sixaola	CR	\N	10234
Linglestown	US	\N	5742
Wajimazakimachi	JP	\N	24851
Lindenberg im Allgau	DE	\N	11546
Marchwood	GB	\N	5586
Elin Pelin	BG	\N	7189
Chubbuck	US	\N	15588
Pitt Meadows	CA	\N	18573
Towamencin	US	\N	18273
Kyabram	AU	\N	7321
Newnan	US	\N	41581
East Ballina	AU	\N	5571
Lollar	DE	\N	10395
Tiete	BR	\N	40194
Kathleen	US	\N	6546
West Wickham	GB	\N	14276
Fulton	US	\N	12012
Quakertown	US	\N	8784
Sim	RU	\N	12893
Gradignan	FR	\N	25552
Copsa Mica	RO	\N	5404
Sandanski	BG	\N	30695
Rapho	US	\N	11839
Soio	AO	\N	67491
Temperley	AR	\N	121451
Sea Cliff	US	\N	5020
Teaoraereke	KI	\N	5105
Negru Voda	RO	\N	5088
Corby	GB	\N	54927
Valley Cottage	US	\N	9637
Bad Pyrmont	DE	\N	19090
Nova Odessa	BR	\N	56764
Prilly	CH	\N	12399
Wirges	DE	\N	5341
Brazil	US	\N	7993
Jaguariuna	BR	\N	51907
Ashiya	JP	\N	13547
Orlova	CZ	\N	28735
Ceadir-Lunga	MD	\N	16605
Solok	ID	\N	68602
Kommunar	RU	\N	22055
Sobotka	PL	\N	6965
Beekman	US	\N	14473
Kokomo	US	\N	79351
Naunhof	DE	\N	8735
Saint-Genis-Laval	FR	\N	21217
Dawson Creek	CA	\N	12978
Jisr ez Zarqa	IL	\N	13962
Bannockburn	GB	\N	7352
South Holland	US	\N	21296
Sakuragawa	JP	\N	39692
Suffolk	US	\N	92108
Tonyrefail	GB	\N	12301
Bondo	CD	\N	23517
Hewlett	US	\N	6484
Toretsk	UA	\N	34378
Skipton	GB	\N	14623
Wilton	US	\N	18542
Kamareddipet	IN	\N	80315
Northallerton	GB	\N	16832
Henley on Thames	GB	\N	11619
Kodiak	US	\N	8851
Tianguistengo	MX	\N	13478
Southbourne	GB	\N	18960
Rillieux-la-Pape	FR	\N	30012
Dalnegorsk	RU	\N	37519
Ogdensburg	US	\N	10638
Blitar	ID	\N	132018
Northfield	GB	\N	25707
Levallois-Perret	FR	\N	64379
Ar Rommani	MA	\N	12297
Peterlee	GB	\N	20164
Sicuani	PE	\N	57551
La Habra Heights	US	\N	6492
La Mesa	US	\N	59249
Gluszyca	PL	\N	6855
Dippoldiswalde	DE	\N	14293
Falkensee	DE	\N	43838
Evergreen Park	US	\N	19147
Epping	GB	\N	11047
Hot Springs	US	\N	60767
Ypejhu	PY	\N	600
Choctaw	US	\N	12674
Basirhat	IN	\N	125254
Azalea Park	US	\N	14817
Tiberias	IL	\N	44200
Hamilton	US	\N	87799
Fair Haven	US	\N	5736
Brunswick	US	\N	53914
Salto	BR	\N	114171
Rotonda	US	\N	8921
Barstow	US	\N	30605
Sarande	AL	\N	41000
Prescot	GB	\N	11184
Anthem	US	\N	22570
Huber Heights	US	\N	38154
Fujiidera	JP	\N	63814
Zulpich	DE	\N	20174
Old Jamestown	US	\N	19439
Binh Long	VN	\N	40279
Burlington	US	\N	131043
Cumming	US	\N	6547
Cedar Lake	US	\N	13183
Gyomro	HU	\N	18301
Grigny	FR	\N	28737
Adlington	GB	\N	6010
Bunbury	AU	\N	74363
Covedale	US	\N	6209
Goondiwindi	AU	\N	6355
Wasco	US	\N	28647
Bay Hill	US	\N	5066
Metuchen	US	\N	14543
Akrehamn	NO	\N	7873
Vohenstrauss	DE	\N	7398
Manorhaven	US	\N	6627
Wareham	GB	\N	5496
Paamiut	GL	\N	1429
Ungheni	RO	\N	6945
Exeter Township	US	\N	25788
Milan	US	\N	7778
Tunduru	TZ	\N	600
Bennettsville	US	\N	11086
Birchington	GB	\N	9961
Granbury	US	\N	37996
Ouadda	CF	\N	5434
Tanglewilde	US	\N	6581
Pataskala	US	\N	15883
Northbridge	US	\N	16522
Hamptonburgh	US	\N	5502
Alpirsbach	DE	\N	6304
Otradnyy	RU	\N	47180
Pasaje	EC	\N	52673
South Hanover	US	\N	6766
Swift Current	CA	\N	16604
Manjimup	AU	\N	4349
Ainsdale	GB	\N	12723
North Oaks	US	\N	5351
Schlusselfeld	DE	\N	5941
Ridgewood	US	\N	25056
Meekatharra	AU	\N	708
Douglas	US	\N	16467
Homer Glen	US	\N	24472
Hutchinson Island South	US	\N	5214
Williamston	US	\N	6498
Nyazepetrovsk	RU	\N	11687
La Cruz	CR	\N	9195
Lavrentiya	RU	\N	1242
Kameno	BG	\N	5788
Verkhniy Ufaley	RU	\N	27498
Wasungen	DE	\N	5541
North Canton	US	\N	17176
Tajura'	LY	\N	48836
South Frontenac	CA	\N	18646
Puerto Quijarro	BO	\N	10392
Horstel	DE	\N	20141
Doncaster	GB	\N	109805
Revere	US	\N	53073
Glastonbury Center	US	\N	7742
Danbury	GB	\N	6500
Michurinsk	RU	\N	93330
Yelizovo	RU	\N	39216
Hailey	US	\N	11409
Violet	US	\N	5424
Sheriff Hill	GB	\N	5051
Kyzyl-Kyya	KG	\N	31727
Stassfurt	DE	\N	25385
Kalgoorlie	AU	\N	29849
Schrems	AT	\N	5404
Bridgeview	US	\N	16096
Rainhill	GB	\N	10853
West Boylston	US	\N	7941
Werlte	DE	\N	10260
The Blue Mountains	CA	\N	7025
Ban Piang Luang	TH	\N	22215
Mont-Tremblant	CA	\N	9646
Sales	BR	\N	6002
Hanno	JP	\N	79891
Doylestown	US	\N	17464
Lanham	US	\N	10301
Miguelopolis	BR	\N	21728
East Lake-Orient Park	US	\N	28602
Rylsk	RU	\N	16147
Yucca Valley	US	\N	25042
Cedar Park	US	\N	79462
Flowery Branch	US	\N	8325
Birdsboro	US	\N	5143
Fukaura	JP	\N	7529
Blythe	US	\N	12260
Pinardville	US	\N	5390
Calheta	PT	\N	11521
Shagonar	RU	\N	10995
Druzhkivka	UA	\N	59400
Jardim	BR	\N	23780
Coalinga	US	\N	16307
Shady Side	US	\N	5839
Barrow upon Soar	GB	\N	5856
Campo Belo	BR	\N	47491
Orsova	RO	\N	10441
Miracatu	BR	\N	20533
Ruzayevka	RU	\N	45248
Dagestanskiye Ogni	RU	\N	29401
Wilmslow	GB	\N	24497
Kawaminami	JP	\N	15372
Gimbi	ET	\N	31809
Ryde	GB	\N	32072
Libertad	AR	\N	100324
Mejillones	CL	\N	2041
Owings Mills	US	\N	34477
Yadrin	RU	\N	8387
Templeton	US	\N	8127
Lokeren	BE	\N	41057
Brixton	GB	\N	78536
Vienna	US	\N	16485
Montigny-les-Metz	FR	\N	21819
Durango	US	\N	20203
Ossining	US	\N	37741
Sunnyside	US	\N	18352
Toki	JP	\N	56133
Rainsville	US	\N	5123
Gargalianoi	GR	\N	5007
Utuado	PR	\N	7160
Kontcha	CM	\N	8018
Yuryevets	RU	\N	8378
Guaraci	BR	\N	10778
Zentsujicho	JP	\N	32073
Bisbee	US	\N	5193
Sachse	US	\N	26046
Goodlettsville	US	\N	16798
Kengtung	MM	\N	75865
Villa Adelina	AR	\N	35307
Beech Grove	US	\N	14937
Dodge City	US	\N	27080
Ji-Parana	BR	\N	65016
Vakhrusheve	UA	\N	12197
Cubal	AO	\N	4837
Hooper	US	\N	9152
Mannedorf	CH	\N	10957
Camargo	BO	\N	4502
Brackley	GB	\N	13018
Cirali	TR	\N	6000
Geneva	US	\N	28563
Volsk	RU	\N	63212
Lambayeque	PE	\N	58276
Ivanhoe	AU	\N	327
Shannon	CA	\N	5086
Sergiyev Posad	RU	\N	104579
Kentfield	US	\N	6930
Saanich	CA	\N	114148
Novaya Lyalya	RU	\N	11879
West Auckland	GB	\N	8509
Pegnitz	DE	\N	13244
Fazakerley	GB	\N	16786
Felsberg	DE	\N	10627
Tepelene	AL	\N	4342
Taylorsville	US	\N	59805
Cyangugu	RW	\N	27416
Market Weighton	GB	\N	6429
Youssoufia	MA	\N	67628
Versoix	CH	\N	13422
Ambarchik	RU	\N	0
Colwyn Bay	GB	\N	34284
Roscoe	US	\N	10510
Bad Harzburg	DE	\N	21945
River Ridge	US	\N	13241
Nove Mesto na Morave	CZ	\N	10049
Swanscombe	GB	\N	6300
Argoncilhe	PT	\N	8420
Ipua	BR	\N	15567
Front of Yonge	CA	\N	5710
Villa Carlos Paz	AR	\N	62423
Juazeiro	BR	\N	95132
Sansom Park	US	\N	5748
Mamakating	US	\N	11513
Carver	US	\N	11661
Summit	US	\N	21897
Havelock North	NZ	\N	13950
Varzea Paulista	BR	\N	116601
Bekily	MG	\N	4286
Haslach im Kinzigtal	DE	\N	7114
Stony Stratford	GB	\N	7736
Mont-Saint-Martin	FR	\N	8807
Oberasbach	DE	\N	17672
Primera	US	\N	5130
Samalkot	IN	\N	56864
Freeport City	BS	\N	25383
Ban Aranyik	TH	\N	29825
Woolwich	US	\N	12381
Toyoake	JP	\N	69448
The Acreage	US	\N	39656
Lake Forest	US	\N	85531
Glendive	US	\N	6460
Flushing	US	\N	7880
Leyton	GB	\N	14184
Mansfield	US	\N	73326
Hutto	US	\N	27947
Wagga Wagga	AU	\N	56442
Gurupi	BR	\N	64789
New Glasgow	CA	\N	20609
Dickson City	US	\N	5761
Fort Meade	US	\N	10297
Arizona City	US	\N	11761
Baraolt	RO	\N	8672
Rigaud	CA	\N	7566
Kalachinsk	RU	\N	22737
Yate	GB	\N	27603
Holladay	US	\N	30325
Rotorua	NZ	\N	54500
Telgte	DE	\N	19925
Allauch	FR	\N	21187
Heysham	GB	\N	17016
Oak Hills	US	\N	11962
Molodohvardiisk	UA	\N	22937
Abony	HU	\N	14392
Zephyrhills West	US	\N	5281
Clifton Park	US	\N	36728
Kemnath	DE	\N	5508
Highland Lakes	US	\N	5500
Peterborough	CA	\N	82094
Lubsko	PL	\N	14182
Nagaya	JP	\N	6886
Hartha	DE	\N	7034
Osorio	BR	\N	34628
Nabburg	DE	\N	6117
As	CZ	\N	13182
Muynoq	UZ	\N	18196
Nizhniye Sergi	RU	\N	9243
Sysert	RU	\N	21029
Wervicq-Sud	FR	\N	5413
Olimpia	BR	\N	53360
Ban Patong	TH	\N	20363
Uruguaiana	BR	\N	125435
Otar	KZ	\N	11238
Uspallata	AR	\N	2390
Cookeville	US	\N	50408
Pardinho	BR	\N	6122
Corry	US	\N	6175
Topsham	US	\N	8763
Mapai	MZ	\N	19932
Monroe	US	\N	112891
Romford	GB	\N	122854
Conisbrough	GB	\N	14333
Eisenberg	DE	\N	10885
Tice	US	\N	5142
Russellville	US	\N	34205
St. Gabriel	US	\N	7460
Cazenovia	US	\N	7007
Renningen	DE	\N	18206
Collier	US	\N	8027
Landen	BE	\N	15961
New Gloucester	US	\N	5723
Saint-Felicien	CA	\N	10278
Bradley Gardens	US	\N	14417
Round Lake Park	US	\N	7747
Crosby	GB	\N	50044
Calstock	GB	\N	6253
St. Ann	US	\N	12629
Upper Leacock	US	\N	8873
Wollaston	GB	\N	13092
Haydock	GB	\N	11416
Colonia Venustiano Carranza	MX	\N	6098
Leesville	US	\N	8132
Lower Makefield	US	\N	32622
Contrecoeur	CA	\N	6252
Streamwood	US	\N	39228
Estero	US	\N	33871
Koencho	JP	\N	116848
Bishops Waltham	GB	\N	6723
Tuymazy	RU	\N	68256
Green Knoll	US	\N	6720
Sevres	FR	\N	23507
Pikalevo	RU	\N	20183
Caceres	BR	\N	85274
Benesov	CZ	\N	16758
Islamorada, Village of Islands	US	\N	6317
Runcorn	GB	\N	61789
Wallan	AU	\N	8520
Windsor	US	\N	30477
Manyoni	TZ	\N	310
Renfrew	CA	\N	8223
Herculandia	BR	\N	9278
Makaryev	RU	\N	6579
Werther	DE	\N	11274
South Williamsport	US	\N	6068
Culcheth	GB	\N	11454
Saikaicho-kobago	JP	\N	26777
Bude	GB	\N	9222
Karachayevsk	RU	\N	21067
Punta Gorda	US	\N	20369
Carroll Township	US	\N	6350
Pecel	HU	\N	15987
Lake Dallas	US	\N	8063
Bangaon	IN	\N	108864
Arandu	BR	\N	6351
Plattsmouth	US	\N	6534
North Manchester	US	\N	5671
Bramsche	DE	\N	30952
Devizes	GB	\N	11715
Hillcrest Heights	US	\N	16185
La Ciotat	FR	\N	35174
Bolkhov	RU	\N	26570
St. Marys	CA	\N	7265
Bernards	US	\N	27114
Cocoa Beach	US	\N	11705
Canby	US	\N	19393
Croton-on-Hudson	US	\N	8095
Great Neck	US	\N	10209
Blunsdon Saint Andrew	GB	\N	12414
Aleysk	RU	\N	28528
Didsbury	CA	\N	5268
Bernal	AR	\N	109914
Yorito	HN	\N	15774
Berd	AM	\N	9864
Bolton	GB	\N	128139
Laurinburg	US	\N	19889
Maisons-Alfort	FR	\N	55655
Shinshiro	JP	\N	44713
Fresnes	FR	\N	27802
Kelsterbach	DE	\N	16936
Noumea	NC	\N	93060
Katoomba	AU	\N	7964
St. Johnsbury	US	\N	7299
Wilhelmsburg	AT	\N	6557
Cranleigh	GB	\N	11241
Haddam	US	\N	8267
Forest Lake	US	\N	24853
White Oak	US	\N	19900
Sluknov	CZ	\N	5653
Blackfoot	US	\N	15526
Bohumin	CZ	\N	20518
Candiac	CA	\N	21047
Bir Mogrein	MR	\N	10
Mollendo	PE	\N	28305
Kettering	US	\N	54855
Kaikoura	NZ	\N	2210
Methuen Town	US	\N	50706
Yukhnov	RU	\N	5985
North Plainfield	US	\N	21289
Emmiganur	IN	\N	95149
Fuchucho	JP	\N	37874
Valencia	EC	\N	16983
Ryugasaki	JP	\N	76741
Salcea	RO	\N	9015
Wattrelos	FR	\N	40958
Seaton Carew	GB	\N	6018
Village of Oak Creek	US	\N	6057
Takoma Park	US	\N	17725
Scotia	US	\N	7642
Ipaucu	BR	\N	14579
Kyle	US	\N	48393
Myrnohrad	UA	\N	50360
Adelaide River	AU	\N	353
Camas	US	\N	24418
Mililani Mauka	US	\N	19955
Midwest City	US	\N	57407
Coswig	DE	\N	20817
Novo-Voznesenovka	UA	\N	15659
Lensk	RU	\N	23479
Yefremov	RU	\N	35168
Zolote	UA	\N	14376
Haselunne	DE	\N	12914
Elk River	US	\N	25213
Elkhorn	US	\N	12404
Zhetisay	KZ	\N	36494
Yanchep	AU	\N	8868
Burgdorf	DE	\N	30699
East Longmeadow	US	\N	16200
Kamo	JP	\N	25855
Zeitz	DE	\N	27955
Seymour	AU	\N	6327
Cap Malheureux	MU	\N	5070
Syston	GB	\N	12804
Pirapozinho	BR	\N	26594
Groitzsch	DE	\N	7550
Chamgardan	IR	\N	16086
Bangor	US	\N	59772
Port Macquarie	AU	\N	47973
Ballsh	AL	\N	7657
Redmond	US	\N	71929
Santa Rosa	BR	\N	59281
Arlesheim	CH	\N	9202
Menomonie	US	\N	18159
Roudnice nad Labem	CZ	\N	12847
Linwood	US	\N	6658
Itayanagi	JP	\N	13064
Salmon Arm	CA	\N	17706
Viru	PE	\N	36029
Ledec nad Sazavou	CZ	\N	5043
Butzow	DE	\N	7799
Mansfeld	DE	\N	8765
Indian Harbour Beach	US	\N	8557
Alsdorf	DE	\N	47018
Wallingford Center	US	\N	18322
Avocado Heights	US	\N	15903
Warka	PL	\N	11035
Ak'ordat	ER	\N	8857
Batticaloa	LK	\N	129222
Yangiyer	UZ	\N	28593
Kremasti	GR	\N	5363
Forbe Oroya	PE	\N	33000
Cypress Gardens	US	\N	10358
Cowra	AU	\N	10063
Granite Falls	US	\N	7713
Zhaltyr	KZ	\N	694
Pertuis	FR	\N	20380
Lansdale	US	\N	17083
Rhyl	GB	\N	25149
Anzhero-Sudzhensk	RU	\N	70476
Lanester	FR	\N	22728
Dornhan	DE	\N	6006
Ichinohe	JP	\N	11708
Sidmouth	GB	\N	12569
Camp Pendleton North	US	\N	7903
West Hattiesburg	US	\N	5933
Texas City	US	\N	118169
Turukhansk	RU	\N	4774
Pereiras	BR	\N	8213
New Smyrna Beach	US	\N	27843
Kimberly	US	\N	6802
Dunedin	US	\N	36537
Inniswold	US	\N	6777
Wantage	US	\N	10986
Paraparaumu	NZ	\N	28900
Roselle Park	US	\N	13588
Sapulpa	US	\N	21278
Umaria	IN	\N	33114
Coldstream	CA	\N	10314
Pantin	FR	\N	57482
Clarence-Rockland	CA	\N	24512
Bragadiru	RO	\N	15329
Chesapeake Beach	US	\N	24845
Sennwald	CH	\N	5592
King	US	\N	6861
Biskupiec	PL	\N	10539
Gloucester City	US	\N	11219
Redbourn	GB	\N	5344
Bellwood	US	\N	18672
Dieppe	CA	\N	107068
Puerto Casado	PY	\N	5000
Zarnesti	RO	\N	23476
Paraguacu Paulista	BR	\N	44794
Pelham Manor	US	\N	5534
Panauti	NP	\N	27358
Banchory	GB	\N	7560
Madisonville	US	\N	23580
Rexburg	US	\N	30979
Shaoshanzhan	CN	\N	86036
Gernsheim	DE	\N	10423
Polyarnyy	RU	\N	17605
Tharandt	DE	\N	5400
Nakano	JP	\N	42390
Songo	AO	\N	10579
Downingtown	US	\N	7897
Bideford	GB	\N	17107
Stonehouse	GB	\N	7725
Cintruenigo	ES	\N	7903
Alvechurch	GB	\N	6564
Mablethorpe	GB	\N	12531
Barrhead	GB	\N	19813
Devine	US	\N	6436
Cannonvale	AU	\N	5716
Caerphilly	GB	\N	41402
Homeland	US	\N	7326
University Park	US	\N	26317
Marktredwitz	DE	\N	17217
Chatou	FR	\N	30253
Herne	GB	\N	7325
Beaumont	CA	\N	17396
Muskoka Falls	CA	\N	6588
Gryazovets	RU	\N	14916
Shipston on Stour	GB	\N	5038
San Juan Zitlaltepec	MX	\N	19600
Tipton	US	\N	6348
South Kensington	US	\N	8769
Ochtrup	DE	\N	19636
Nueva Palmira	UY	\N	9857
Culver City	US	\N	39185
Hjarup	SE	\N	5607
Schuyler Falls	US	\N	5121
Goderich	CA	\N	7628
East Flat Rock	US	\N	5036
Kolbermoor	DE	\N	18505
Sakaki	JP	\N	14310
Itumbiara	BR	\N	79582
Higashi-Matsuyama	JP	\N	92302
West Fargo	US	\N	37058
West Park	US	\N	15089
Koko	NG	\N	25792
Talmaciu	RO	\N	6905
Lysterfield	AU	\N	6663
Vetovo	BG	\N	5707
Kurovskoye	RU	\N	20844
Buena Vista	US	\N	7366
Tae-dong	KP	\N	1884
Taneytown	US	\N	6685
Belzig	DE	\N	11144
Teuchern	DE	\N	8077
Mead	US	\N	6870
Carencro	US	\N	9449
Lutherville	US	\N	6773
Clichy-sous-Bois	FR	\N	29348
Banbridge	GB	\N	14744
Walton	US	\N	5229
Ballston	US	\N	10763
Conwy	GB	\N	14723
Oceanport	US	\N	5722
Lunel	FR	\N	26239
Floral Park	US	\N	15844
Rickmansworth	GB	\N	23973
Bhimunipatnam	IN	\N	55082
Nea Anchialos	GR	\N	5132
Bensalem	US	\N	60370
Bowling Green	US	\N	95135
Old Colwyn	GB	\N	8113
Milton	GB	\N	17250
New Berlin	US	\N	39691
Alice Springs	AU	\N	23726
Pinon Hills	US	\N	7592
Port Clinton	US	\N	13614
Merrimack	US	\N	25815
Itacoatiara	BR	\N	51509
Ivancice	CZ	\N	9760
Leatherhead	GB	\N	11316
Celebration	US	\N	9329
Lengerich	DE	\N	22641
Dursley	GB	\N	6697
Zuni Pueblo	US	\N	7590
Tehachapi	US	\N	14928
Minamishiro	JP	\N	34133
Scarborough	US	\N	19844
Toging am Inn	DE	\N	9291
Harvest	US	\N	5700
Lenexa	US	\N	55625
Sainte-Marie	CA	\N	12889
Pavlovo	RU	\N	57630
Lesmurdie	AU	\N	8437
Camara de Lobos	PT	\N	35666
North Wilkesboro	US	\N	18066
Sakai	JP	\N	24098
Kwinana	AU	\N	20086
Kurchatov	RU	\N	38344
Harahan	US	\N	9250
Papenburg	DE	\N	37579
Goulds	US	\N	11453
Ruwa	ZW	\N	22038
Stawell	AU	\N	6032
Delray Beach	US	\N	69451
Sewickley	US	\N	5808
Half Moon Bay	US	\N	23653
Pallasovka	RU	\N	14940
Devonport	AU	\N	23046
Fontaine	FR	\N	22523
Lone Tree	US	\N	13082
Victoriaville	CA	\N	45309
Barling	US	\N	5036
Laguna Hills	US	\N	31207
Seaford	GB	\N	23463
Meghraj	IN	\N	11363
Paulo Afonso	BR	\N	85350
Windsbach	DE	\N	6018
Crimmitschau	DE	\N	18536
Kilwinning	GB	\N	21693
Severobaykalsk	RU	\N	23365
Erbach	DE	\N	13666
Janossomorja	HU	\N	6052
Narasapur	IN	\N	58770
Staffelstein	DE	\N	10389
Webb City	US	\N	12134
Dinkelsbuhl	DE	\N	11825
Hurst	US	\N	38655
Grafton	US	\N	18624
Olmaliq	UZ	\N	112078
Nasaud	RO	\N	9587
Starodub	RU	\N	18615
Bussy-Saint-Georges	FR	\N	27379
Yarm	GB	\N	8384
Worsborough	GB	\N	9516
Nazca	PE	\N	22859
Newport	GB	\N	128060
Veneta	US	\N	6628
Tenafly	US	\N	14453
Bethpage	US	\N	17215
Vikarabad	IN	\N	53143
Corfe Mullen	GB	\N	10133
Zhangaozen	KZ	\N	8895
Clevedon	GB	\N	21281
Fredericton	CA	\N	58220
Glashutte	DE	\N	6698
Forestdale	US	\N	9273
Barwell	GB	\N	9022
East Hemet	US	\N	20679
Aldenham	GB	\N	9942
Kornwestheim	DE	\N	33803
Tadworth	GB	\N	9522
Dilolo	CD	\N	7854
Kerikeri	NZ	\N	6960
Alma	CA	\N	30904
Tilbury	GB	\N	12450
Port Townsend	US	\N	9062
Latchford	GB	\N	7856
Carazinho	BR	\N	59417
Church Hill	US	\N	6664
Liberal	US	\N	18990
Basalt	US	\N	9193
Willimantic	US	\N	17184
Lake Ridge	US	\N	44430
Ciudad Insurgentes	MX	\N	11503
Kidsgrove	GB	\N	23756
Avon Lake	US	\N	24504
Bani Mazar	EG	\N	79553
Longbenton	GB	\N	10617
Piqua	US	\N	21936
Ventanas	EC	\N	38168
Pervomaysk	RU	\N	13496
Taquarituba	BR	\N	23163
Bradford	GB	\N	67
Tinchlik	UZ	\N	10644
Radevormwald	DE	\N	22107
Milisauti	RO	\N	5005
Carson	US	\N	91394
Wharton	US	\N	8765
Grand Island	US	\N	53296
Lochearn	US	\N	26271
Zella-Mehlis	DE	\N	12863
Saline	US	\N	9343
Enfield	US	\N	44455
Puerto Morelos	MX	\N	9188
Market Harborough	GB	\N	22911
Union Beach	US	\N	5305
Montecito	US	\N	8611
De Pere	US	\N	24970
Bloemhof	ZA	\N	17122
Bhairahawa	NP	\N	63483
Oneida	US	\N	20828
Cicero	US	\N	80796
Hoffman Estates	US	\N	50932
Brandon	US	\N	113279
Brownsburg	US	\N	27001
Rosrath	DE	\N	28693
Orangevale	US	\N	34757
Uzhur	RU	\N	19212
Molfetta	IT	\N	59470
Brandys nad Labem-Stara Boleslav	CZ	\N	19255
Aliwal North	ZA	\N	44436
Owen Sound	CA	\N	31820
Pullman	US	\N	34425
Paracatu	BR	\N	70753
Maradah	LY	\N	2500
East Barnet	GB	\N	16137
Sulzbach	DE	\N	16468
Prince Rupert	CA	\N	12220
Clausthal-Zellerfeld	DE	\N	15888
Konstancin-Jeziorna	PL	\N	23694
Ban Mae Cho	TH	\N	23140
Volketswil	CH	\N	18615
Clover Creek	US	\N	6902
Fort Lewis	US	\N	12933
Aldine	US	\N	15822
Sikonge	TZ	\N	27113
La Porte	US	\N	34976
Melut	SS	\N	6407
Aibonito	PR	\N	8352
Massama	PT	\N	28112
Measham	GB	\N	5209
Eagleton Village	US	\N	5250
Guadix	ES	\N	18422
Cochran	US	\N	6131
Upper Allen	US	\N	19606
Falls	US	\N	33826
Egham	GB	\N	6384
Mount Horeb	US	\N	7520
Bethel Township	US	\N	9150
Walnut Creek	US	\N	70166
Ada	US	\N	17840
Nyurba	RU	\N	9786
Shoreham-by-Sea	GB	\N	20547
Caguas	PR	\N	74980
Thetford Mines	CA	\N	25709
East Rockhill	US	\N	5734
South El Monte	US	\N	20574
Worth	GB	\N	9888
Hollington	GB	\N	6099
Washougal	US	\N	16107
Tombos	BR	\N	9537
Les Cedres	CA	\N	6079
Pimenta Bueno	BR	\N	25762
Bamber Bridge	GB	\N	12126
Arkadak	RU	\N	11895
Canandaigua	US	\N	10922
Narborough	GB	\N	8448
Bridgwater	GB	\N	41276
Schwabisch Gmund	DE	\N	61186
West Greenwich	US	\N	6179
Tadley	GB	\N	11473
Fernandopolis	BR	\N	68120
Biatorbagy	HU	\N	13889
Genadendal	ZA	\N	5663
Yur'yev-Pol'skiy	RU	\N	18433
Kurobeshin	JP	\N	40231
Stolpen	DE	\N	5576
Pagosa Springs	US	\N	5927
Sahy	SK	\N	7321
Maitland	US	\N	17652
Kraluv Dvur	CZ	\N	9690
Pohorelice	CZ	\N	5133
Aruja	BR	\N	83939
Riverview	CA	\N	19667
Mongagua	BR	\N	52492
Tiszafoldvar	HU	\N	10672
Mahwah	US	\N	26325
Phatthaya	TH	\N	115840
Jalor	IN	\N	54081
Lorsch	DE	\N	13643
Inverloch	AU	\N	5437
Takeocho-takeo	JP	\N	48011
Broomall	US	\N	11154
Campbell River	CA	\N	35138
Shakargarh	PK	\N	73160
Onega	RU	\N	19030
Qiryat Shemona	IL	\N	23076
Marlborough	US	\N	39597
Hemer	DE	\N	34080
West Norriton	US	\N	15703
Great Burstead	GB	\N	5968
Haines City	US	\N	26009
Osceola	US	\N	7085
Castleton	GB	\N	10159
Valle Alto	MX	\N	75000
Talladega	US	\N	13304
Oldenburg in Holstein	DE	\N	9833
Qaratau	KZ	\N	28804
Cacador	BR	\N	63726
Edmonton	GB	\N	82472
Exhall	GB	\N	8006
Ojus	US	\N	17462
Roma	AU	\N	6848
San Antonio	PR	\N	8144
Kishkenekol	KZ	\N	6779
Tome	CL	\N	42312
Aldridge	GB	\N	39348
Faribault	US	\N	24250
North Sewickley	US	\N	5444
Gilmer	US	\N	5220
Truskavets'	UA	\N	28867
Garges-les-Gonesse	FR	\N	42728
Cherepanovo	RU	\N	19610
Liberty Lake	US	\N	10956
Bad Wildungen	DE	\N	17137
South Grafton	AU	\N	6068
Naro-Fominsk	RU	\N	62002
Yamanobe	JP	\N	13840
Stanthorpe	AU	\N	5406
Dastgerd	IR	\N	15524
Montigny-le-Bretonneux	FR	\N	32929
Upper Mount Bethel	US	\N	6843
Lasserre	GP	\N	307
Red Wing	US	\N	14245
Omak	US	\N	8114
Daisen	JP	\N	77886
Wirksworth	GB	\N	5038
Kuji	JP	\N	33556
Scotchtown	US	\N	9174
Pine Hill	US	\N	10417
Tingo Maria	PE	\N	46191
Eagle	US	\N	29796
Standish	GB	\N	13278
Glenfield	GB	\N	9643
Marbach am Neckar	DE	\N	16008
Horndean	GB	\N	12639
Grants Pass	US	\N	55837
Parma	RU	\N	45000
Dholka	IN	\N	53792
Pitkyaranta	RU	\N	10479
Beausoleil	FR	\N	13607
Velddrif	ZA	\N	11017
Damme	DE	\N	17127
Pindorama	BR	\N	16342
Rosetta	EG	\N	68947
Dharan	NP	\N	116181
Sandefjord	NO	\N	44368
New Inn	GB	\N	5986
Folkestone	GB	\N	46698
Dearborn Heights	US	\N	55353
Tvardita	MD	\N	5420
Bad Nenndorf	DE	\N	11144
Uenohara	JP	\N	23052
Kilindoni	TZ	\N	12409
Beaconsfield	CA	\N	19115
Collingwood	CA	\N	21793
Woomera	AU	\N	450
Figuig	MA	\N	10872
Hamburg	US	\N	58105
Jaffrey	US	\N	5307
Masuda	JP	\N	45291
Berthoud	US	\N	9094
Idfu	EG	\N	133772
Woodinville	US	\N	13263
San Pedro de Lloc	PE	\N	16198
Tupa	BR	\N	65651
Meaford	CA	\N	10991
River Forest	US	\N	10816
Baie-Comeau	CA	\N	21536
Carmi	US	\N	5111
Langenau	DE	\N	15247
Canoinhas	BR	\N	41498
Babanusah	SD	\N	19700
Nuevo Mexico	MX	\N	42246
Coram	US	\N	39977
Mantua	US	\N	14992
Mittagong	AU	\N	8999
Oiso	JP	\N	31284
Martigny	CH	\N	17998
Taragi	JP	\N	9055
Daraj	LY	\N	931
Zemlya Bunge	RU	\N	10
Peregrebnoye	RU	\N	10
Greenwich Township	US	\N	5523
Altomunster	DE	\N	7925
Ince-in-Makerfield	GB	\N	15664
Hochstadt an der Donau	DE	\N	6756
North Laurel	US	\N	24621
Perkasie	US	\N	8738
Itirapua	BR	\N	6321
Cheval	US	\N	10603
Shibetsu	JP	\N	5259
Minot AFB	US	\N	5384
Tuba City	US	\N	8662
Ilchester	US	\N	26647
Skelmersdale	GB	\N	38813
Belton	US	\N	23642
Nixa	US	\N	22515
Ladue	US	\N	8616
Pearl	US	\N	26510
Simonton Lake	US	\N	5121
Novaya Balakhna	RU	\N	63083
Van Wert	US	\N	10579
Elberton	US	\N	5512
Economy	US	\N	9098
Pfullingen	DE	\N	18654
Sebring	US	\N	62250
Xudat	AZ	\N	10894
Martigues	FR	\N	48188
Sao Martinho	PT	\N	6226
Riverhead	US	\N	33625
Makoua	CG	\N	11355
La Garenne-Colombes	FR	\N	29169
Hessle	GB	\N	15000
Breves	BR	\N	47164
La Canada Flintridge	US	\N	20009
Fishkill	US	\N	23370
Hafendorf	AT	\N	7177
Yotsukaido	JP	\N	92668
Tisnov	CZ	\N	9258
Gering	US	\N	8128
Lermontov	RU	\N	22601
Yass	AU	\N	6506
Bulle	CH	\N	22709
Borna	DE	\N	19229
Northport	US	\N	26115
Painesville	US	\N	19886
Nuuk	GL	\N	18326
Varzaneh	IR	\N	11506
Bredasdorp	ZA	\N	14936
Wylie	US	\N	53067
Apatzingan de la Constitucion	MX	\N	128250
Leek	GB	\N	20768
Chatteris	GB	\N	10453
Aksum	ET	\N	66800
North Vernon	US	\N	11310
Ustyuzhna	RU	\N	8622
Bagshot	GB	\N	5592
Kirkleatham	GB	\N	7045
Zima	RU	\N	30988
Merrimac	US	\N	6839
Kutchan	JP	\N	15132
Yabuki	JP	\N	16969
Yashima	JP	\N	9371
Jeffersontown	US	\N	27715
Coxsackie	US	\N	8540
Bad Munder am Deister	DE	\N	17465
Burgau	DE	\N	9923
Tres Fronteiras	BR	\N	5719
Sherman	US	\N	70704
Vidalia	US	\N	13350
Altenerding	DE	\N	8196
Corella	ES	\N	7971
Hattiesburg	US	\N	80138
Stanley	CA	\N	9038
Beaufort West	ZA	\N	44737
Taounate	MA	\N	37616
Conshohocken	US	\N	8047
Techirghiol	RO	\N	7292
East Grinstead	GB	\N	26383
Blaydon	GB	\N	15155
Payson	US	\N	20303
Itauna	BR	\N	77400
Longmont	US	\N	102474
Dinnington	GB	\N	9077
Stribro	CZ	\N	7738
Havelock	US	\N	20677
Ostrogozhsk	RU	\N	32601
Florham Park	US	\N	11496
Al Aaroui	MA	\N	47599
Sales Oliveira	BR	\N	11438
Altadena	US	\N	45146
Hofheim in Unterfranken	DE	\N	5109
Salton City	US	\N	5611
Poysdorf	AT	\N	5527
New Martinsville	US	\N	5853
Slobodskoy	RU	\N	32793
Jasdan	IN	\N	48483
Schwalmstadt	DE	\N	18122
Burgstadt	DE	\N	10672
Shorewood	US	\N	17509
Tomball	US	\N	11778
Tiflet	MA	\N	86709
Illkirch-Graffenstaden	FR	\N	26780
Tryavna	BG	\N	9634
Yeadon	US	\N	11496
Lyubimets	BG	\N	7892
Koror	PW	\N	8744
Senanga	ZM	\N	10005
Nolensville	US	\N	10062
Catskill	US	\N	11399
Stirling	GB	\N	37810
Kizel	RU	\N	14883
Eppstein	DE	\N	13655
South Run	US	\N	6308
Clichy	FR	\N	61070
Ambler	US	\N	6491
Mountlake Terrace	US	\N	21338
Caboolture	AU	\N	26433
Olmos	PE	\N	9800
Rumford	US	\N	5705
Williamstown	US	\N	14962
Tewkesbury	GB	\N	19778
Oromocto	CA	\N	9223
Oak Island	US	\N	13878
Ezpeleta	AR	\N	79557
Wachtersbach	DE	\N	12542
Middletown	US	\N	97730
Bellmore	US	\N	15730
Pilibhit	IN	\N	131008
Sharypovo	RU	\N	37136
Holliston	US	\N	14634
Burrel	AL	\N	10862
Osinniki	RU	\N	42454
Schofield Barracks	US	\N	19796
Hartland	US	\N	9320
Sao Miguel Arcanjo	BR	\N	32769
Esteban Echeverria	AR	\N	109644
Fellsmere	US	\N	5800
Budakalasz	HU	\N	10924
Eden Prairie	US	\N	64893
Kirk of Shotts	GB	\N	8840
Mohelnice	CZ	\N	9234
Shenley Brook End	GB	\N	25828
Novovolynsk	UA	\N	52188
Kairana	IN	\N	73046
Mila Doce	US	\N	6394
Neuenstein	DE	\N	6531
Te Awamutu	NZ	\N	12400
Budingen	DE	\N	21959
Ashbourne	GB	\N	7112
Graham	US	\N	28194
Dschang	CM	\N	76524
Yulee	US	\N	12616
Araxa	BR	\N	103287
Mashpee	US	\N	14101
De-Kastri	RU	\N	3615
Kimpese	CD	\N	10578
Capanema	BR	\N	47766
Maldon	GB	\N	14220
Kingoonya	AU	\N	13
Tournavista	PE	\N	511
Edinburg	US	\N	101170
Hot Springs Village	US	\N	14466
Mbalmayo	CM	\N	80206
Puerto Real	PR	\N	6892
Vevey	CH	\N	19891
Barrow in Furness	GB	\N	56745
Pine Hills	US	\N	75575
Volokolamsk	RU	\N	19824
Stickney	US	\N	6566
Gardnerville	US	\N	6148
Klimovsk	RU	\N	56239
Westbury	GB	\N	16989
Lac-Megantic	CA	\N	5932
Taft	US	\N	14898
Barbacena	BR	\N	126284
Ogawa	JP	\N	29137
Ypacarai	PY	\N	30150
Pocatello	US	\N	72878
Waibstadt	DE	\N	5682
Glendora	US	\N	51544
Nyunzu	CD	\N	15397
Bani Walid	LY	\N	50824
Upper Pottsgrove	US	\N	5584
Puchheim	DE	\N	21531
Worgl	AT	\N	13811
Nuporanga	BR	\N	7255
Mack	US	\N	11422
Hutchinson	US	\N	42531
Kemberg	DE	\N	9737
Huamachuco	PE	\N	30835
Kalach	RU	\N	18834
Olten	CH	\N	17133
Bernkastel-Kues	DE	\N	7134
South Normanton	GB	\N	9445
Santa Teresa	US	\N	5696
Munhall	US	\N	11006
Fussa	JP	\N	57527
Upton	GB	\N	16130
Apache Junction	US	\N	42571
Tsukumiura	JP	\N	16291
Paddock Wood	GB	\N	8263
New Castle	US	\N	38930
Niederkassel	DE	\N	38218
Schenefeld	DE	\N	19271
Uglegorsk	RU	\N	8687
Unity	US	\N	22156
Kirby	US	\N	8723
Front Royal	US	\N	19719
Pyapon	MM	\N	76741
Sonora	US	\N	28035
Beeville	US	\N	18068
Pauls Valley	US	\N	5761
Wittichenau	DE	\N	5715
Busteni	RO	\N	8894
Norwood	US	\N	29201
Svetla nad Sazavou	CZ	\N	6490
Bocaiuva	BR	\N	32114
Novomoskovsk	RU	\N	125647
Mifune	JP	\N	16417
Catalina	US	\N	7635
Schrozberg	DE	\N	5741
Duvall	US	\N	8107
Nefteyugansk	RU	\N	126157
Manp'o	KP	\N	116760
Duncan	CA	\N	44451
Dumfries	GB	\N	33320
Port Orchard	US	\N	14597
Sun Prairie	US	\N	34661
Zvenigovo	RU	\N	11504
Vetschau	DE	\N	8103
Zholymbet	KZ	\N	6876
Quakers Hill	AU	\N	27080
Montgomery Village	US	\N	33798
Sunagawa	JP	\N	16878
La Celle-Saint-Cloud	FR	\N	20966
Cutlerville	US	\N	16623
Varadero	CU	\N	21170
Kelly	US	\N	5219
Daraw	EG	\N	38400
Semily	CZ	\N	8353
Byron Bay	AU	\N	5521
Kami-furano	JP	\N	10709
Boralday	KZ	\N	20996
Starkville	US	\N	32546
Malchow	DE	\N	6627
Paracuru	BR	\N	21196
Citrus Park	US	\N	26473
Kasama	JP	\N	74334
Satbaev	KZ	\N	61883
East Alton	US	\N	5954
Chotebor	CZ	\N	9178
Lake Los Angeles	US	\N	11469
Abaza	RU	\N	15335
Egg Buckland	GB	\N	13351
Antalaha	MG	\N	47224
Roslyn Heights	US	\N	6591
Carpinteria	US	\N	13385
Chilca	PE	\N	12884
Scarsdale	US	\N	17871
Sicasica	BO	\N	3831
Kunovice	CZ	\N	5579
Lowton	GB	\N	14605
Nicholasville	US	\N	30912
Mihara	JP	\N	91604
Novyy Port	RU	\N	1790
Bainbridge	US	\N	11529
Lombard	US	\N	44303
Clydebank	GB	\N	25970
Welzheim	DE	\N	11176
Llantwit Fardre	GB	\N	6099
Bor	RU	\N	78063
Pocono	US	\N	10846
Novyy Oskol	RU	\N	18763
Podporozhye	RU	\N	17270
Three Lakes	US	\N	16043
Carregal do Sal	PT	\N	9835
Junction City	US	\N	35677
Tacurong	PH	\N	98316
Meuselwitz	DE	\N	10065
Northern Cambria	US	\N	5981
Pepper Pike	US	\N	6330
Galia	BR	\N	6894
Lakeland North	US	\N	12820
Traunreut	DE	\N	20977
Ensley	US	\N	22844
Exton	US	\N	5332
Melissa	US	\N	12117
Nizhneyansk	RU	\N	400
Besalampy	MG	\N	1022
Morfelden-Walldorf	DE	\N	34828
Uryupinsk	RU	\N	37620
Lamas	PE	\N	13693
Osvaldo Cruz	BR	\N	32475
Fort Irwin	US	\N	9086
Ocoee	US	\N	48263
Siler City	US	\N	9464
Beauceville	CA	\N	6354
Qazmalar	AZ	\N	11867
Ewa Beach	US	\N	14717
Nevelsk	RU	\N	10421
Dorsten	DE	\N	74736
Niquelandia	BR	\N	27541
Coeymans	US	\N	7363
Antigo	US	\N	7695
Hull	US	\N	10424
Leeton	AU	\N	8623
Bickley	GB	\N	13904
South Weber	US	\N	7836
Paramus	US	\N	26264
Algona	US	\N	5182
Unicov	CZ	\N	11335
Cugir	RO	\N	21376
Neugersdorf	DE	\N	6260
Spielberg bei Knittelfeld	AT	\N	5383
Ottawa	US	\N	19839
California City	US	\N	10968
Romeoville	US	\N	39746
Risalpur Cantonment	PK	\N	36653
Cranberry	US	\N	30552
Tega Cay	US	\N	11335
Grays	GB	\N	36601
Sabaya	BO	\N	573
Musina	ZA	\N	42678
Prairieville	US	\N	31721
Roubaix	FR	\N	100000
Lackland AFB	US	\N	6454
Weil am Rhein	DE	\N	30175
Tunguskhaya	RU	\N	10
Sarapul	RU	\N	97910
Miyato	JP	\N	10909
Uacu Cungo	AO	\N	12069
Uberlingen	DE	\N	22554
Holt	US	\N	25536
Rimouski	CA	\N	48664
Sudden Valley	US	\N	7999
Midway	US	\N	17704
Littleport	GB	\N	8738
Adilabad	IN	\N	117167
Iwamizawa	JP	\N	80753
Waikanae	NZ	\N	12100
Natchez	US	\N	26095
Tonisvorst	DE	\N	29306
Monessen	US	\N	61960
Pochep	RU	\N	16687
Ostrov	RU	\N	20427
Unecha	RU	\N	23550
Limbach-Oberfrohna	DE	\N	24029
Dalby	AU	\N	12719
Schleusingen	DE	\N	10960
Mindszent	HU	\N	6560
Caerfyrddin	GB	\N	14185
Gramercy	US	\N	13873
Rio Hondo	US	\N	5082
Erkrath	DE	\N	44384
Kaufman	US	\N	7281
Ulster	US	\N	12388
Douglasville	US	\N	33992
Wadomari	JP	\N	6364
Uvalde	US	\N	18406
Upper Arlington	US	\N	35366
Barberton	US	\N	25953
Seagoville	US	\N	16861
Miami Beach	US	\N	88885
Laryak	RU	\N	10
Alondra Park	US	\N	8097
Waipio	US	\N	11508
Dek'emhare	ER	\N	10959
Saranpaul	RU	\N	2985
Hatboro	US	\N	7501
Snellville	US	\N	20077
Coatbridge	GB	\N	43920
Ealing	GB	\N	85014
Abadan	TM	\N	40813
Westerburg	DE	\N	5666
Dorado	PR	\N	12330
Flowing Wells	US	\N	15290
Clarksburg	US	\N	40403
Elizabeth	US	\N	129216
Tolland	US	\N	14766
Pisaflores	MX	\N	17214
Inver Grove Heights	US	\N	35672
Nor Hachn	AM	\N	10198
Northborough	US	\N	14985
Williamsburg	US	\N	80441
Muhembo	BW	\N	757
Ribnitz-Damgarten	DE	\N	15167
Great Bookham	GB	\N	5596
Sunninghill	GB	\N	11603
Wittenberge	DE	\N	17015
Andover	US	\N	35609
Grove City	US	\N	41820
Oroville East	US	\N	7368
Naranjito	EC	\N	28546
North Stonington	US	\N	5242
Claverack	US	\N	5771
Horden	GB	\N	8087
Grabow	DE	\N	5633
Allanmyo	MM	\N	57897
Latimer	US	\N	6861
Entebbe	UG	\N	69958
Targu Frumos	RO	\N	10475
Marieville	CA	\N	10094
Urbino	IT	\N	14558
North Druid Hills	US	\N	17287
Cottica	SR	\N	29210
Buchloe	DE	\N	13132
Waldheim	DE	\N	8964
Richlands	US	\N	8618
Kitsuki	JP	\N	28476
Bristol	US	\N	70243
Te Anau	NZ	\N	2250
Orlovista	US	\N	6574
Chowchilla	US	\N	11583
Wanaka	NZ	\N	8900
Jesenik	CZ	\N	11081
Rzhev	RU	\N	59422
Sudzha	RU	\N	5759
Magelang	ID	\N	124912
Krichim	BG	\N	9188
Mglin	RU	\N	7578
New Freedom	US	\N	14882
Maricopa	US	\N	50752
Bay Shore	US	\N	30685
Maihar	IN	\N	40192
Mezobereny	HU	\N	9809
Livada	RO	\N	6773
Kronenwetter	US	\N	8079
Kariba	ZW	\N	24210
Tonami	JP	\N	48116
Tessenderlo	BE	\N	18514
Ilha Solteira	BR	\N	26344
Roeland Park	US	\N	6688
Brianka	UA	\N	47512
Farmingdale	US	\N	9002
Canyon Lake	US	\N	25104
Dollard-des-Ormeaux	CA	\N	49637
Eden Isle	US	\N	7554
Gardere	US	\N	10841
Silsden	GB	\N	8268
Caernarfon	GB	\N	9852
Utica	US	\N	112650
Sechelt	CA	\N	10200
Kenmore	US	\N	23097
Indiana	US	\N	27142
Uzwil	CH	\N	12885
Saint-Benoit	RE	\N	35310
Ipswich	US	\N	13901
Puerto Suarez	BO	\N	22000
League City	US	\N	107536
Watsa	CD	\N	24516
Caico	BR	\N	54934
Pegau	DE	\N	6288
Itapira	BR	\N	72967
Elancourt	FR	\N	25400
Sekigahara	JP	\N	6848
Pennsville	US	\N	12643
Pine Ridge	US	\N	10279
Arnold	US	\N	23518
New Mills	GB	\N	12291
Jersey Village	US	\N	7890
Prospect	US	\N	9736
Ch'osan-up	KP	\N	7786
Jardinopolis	BR	\N	41799
Catamayo	EC	\N	22697
Zbaszyn	PL	\N	7264
Rodach	DE	\N	6394
Kamen'-na-Obi	RU	\N	44564
North Wantagh	US	\N	11802
Rava-Rus'ka	UA	\N	8647
Boiling Spring Lakes	US	\N	5146
Starorybnoye	RU	\N	10
Bansko	BG	\N	9497
Malta	US	\N	15620
Moree	AU	\N	9311
Richfield	US	\N	36354
Queensbury	US	\N	27525
Fuquay-Varina	US	\N	30324
Eastwood	GB	\N	18612
Angier	US	\N	5415
Ewell	GB	\N	34872
East Franklin	US	\N	7170
Slavkov u Brna	CZ	\N	6916
Massena	US	\N	12329
Broomfield	US	\N	70465
Tumut	AU	\N	6230
Villa Yapacani	BO	\N	14589
Pirapora do Bom Jesus	BR	\N	17646
Laguna de Duero	ES	\N	22725
Derby	US	\N	24943
Berkeley Heights	US	\N	13417
Begles	FR	\N	28601
Likino-Dulevo	RU	\N	29376
Umatilla	US	\N	7321
Kennedy	US	\N	8105
Tumwater	US	\N	24024
Petrov Val	RU	\N	12544
Sao Borja	BR	\N	59613
Grahamstown	ZA	\N	91548
Urmston	GB	\N	41825
Ad Dir`iyah	SA	\N	43269
Lake Mathews	US	\N	6848
Hope Mills	US	\N	15849
Puerto Pimentel	PE	\N	15552
Zeulenroda	DE	\N	16487
Tahmoor	AU	\N	5067
Grande-Synthe	FR	\N	22966
Colombes	FR	\N	85177
Huntsville	CA	\N	19816
Pointe-Calumet	CA	\N	6396
Lampa	CL	\N	37599
Alton	GB	\N	17816
Santana	BR	\N	83927
Tekit	MX	\N	9834
Naj` Hammadi	EG	\N	45038
Herzberg am Harz	DE	\N	12889
Weigelstown	US	\N	12879
Mount Dora	US	\N	14516
Comandante Luis Piedra Buena	AR	\N	410
Maracaju	BR	\N	22690
San Dorligo della Valle	IT	\N	5754
Falkenberg	DE	\N	6368
Sayre	US	\N	17281
Lely Resort	US	\N	6340
Anavyssos	GR	\N	6202
Ilshofen	DE	\N	6584
Houghton	US	\N	15543
Alchevsk	UA	\N	105398
Aveley	GB	\N	8381
Southern Pines	US	\N	14657
Duntocher	GB	\N	6850
Niedenstein	DE	\N	5299
Moss Vale	AU	\N	8579
Steffisburg	CH	\N	15816
Dayr Mawas	EG	\N	40640
Lapeer	US	\N	12959
Bad Munstereifel	DE	\N	17299
Wimborne Minster	GB	\N	15552
Galesburg	US	\N	33767
Rye	GB	\N	9041
Alfeld	DE	\N	18626
Bexleyheath	GB	\N	31929
Newton Aycliffe	GB	\N	26633
Bleicherode	DE	\N	10419
Urubamba	PE	\N	2700
Portsmouth	US	\N	94398
Otley	GB	\N	13668
Los Osos	US	\N	16292
Juli	PE	\N	21462
Dickinson	US	\N	22872
Smyrna	US	\N	56666
Loreto	IT	\N	12810
Lithgow	AU	\N	12973
Uetersen	DE	\N	18496
Edgewater	US	\N	23918
Coroico	BO	\N	2319
La Prairie	CA	\N	23357
Bifoun	GA	\N	134
Honesdale	US	\N	5589
Campina do Monte Alegre	BR	\N	5901
Yoju	KR	\N	109937
Hapeville	US	\N	6534
Handforth	GB	\N	6266
Ashtead	GB	\N	14169
Onrus	ZA	\N	5151
Peculiar	US	\N	5478
Sallisaw	US	\N	7825
Davyhulme	GB	\N	19634
Aqsu	KZ	\N	69354
Bolingbrook	US	\N	74545
Cambuslang	GB	\N	29690
Skokie	US	\N	62700
Haworth	GB	\N	6379
Sunbury	US	\N	27921
Egilsstadhir	IS	\N	2332
Halen	BE	\N	9461
Palghat	IN	\N	130955
Deal	GB	\N	30085
Wasaga Beach	CA	\N	20675
Paloma Creek South	US	\N	6624
Kanmaki	JP	\N	21318
Broughton	GB	\N	5974
Mocimboa	MZ	\N	27909
Parker	US	\N	57706
Oshu	JP	\N	114246
Brighton	CA	\N	11844
El Palqui	CL	\N	6175
Walton upon Thames	GB	\N	22834
East Fishkill	US	\N	29227
Iizuka	JP	\N	126715
Coeur d'Alene	US	\N	116834
Fairmount	US	\N	9997
Shahr-e Jadid-e Hashtgerd	IR	\N	15619
Karuizawa	JP	\N	19234
Prestwich	GB	\N	31693
Menomonee Falls	US	\N	38014
Barntrup	DE	\N	8587
Tayshet	RU	\N	33364
Sabana Seca	PR	\N	7731
Naliya	IN	\N	11415
Woking	GB	\N	62796
Niebull	DE	\N	9882
Omolon	RU	\N	1050
Benalla	AU	\N	9298
Willits	US	\N	8055
Blacksburg	US	\N	91888
Piastow	PL	\N	23332
Slany	CZ	\N	15864
Honeoye Falls	US	\N	5428
Plettenberg	DE	\N	25318
Kingswinford	GB	\N	25191
Sobinka	RU	\N	17799
Lievin	FR	\N	30785
Dennis	US	\N	13962
Samch'ok	KR	\N	69509
San Mateo	US	\N	104430
Lake Arbor	US	\N	10456
Kanegasaki	JP	\N	15410
Brook Park	US	\N	18382
Bolekhiv	UA	\N	10476
Rehovot	IL	\N	132671
Witley	GB	\N	8130
Knittlingen	DE	\N	8048
Bartlett	US	\N	59440
Monee	US	\N	5061
Amarkantak	IN	\N	7074
Portage	US	\N	49445
Hebron	US	\N	9522
Hoboken	US	\N	52677
De Soto	US	\N	7141
Geislingen an der Steige	DE	\N	28122
New Britain	US	\N	72495
Shenfield	GB	\N	5432
Bredbury	GB	\N	13593
Naranjal	EC	\N	28487
West Warwick	US	\N	28955
Durham	GB	\N	48069
Ohio	US	\N	6308
Bergenfield	US	\N	27327
Kalaheo	US	\N	5224
Pottenstein	DE	\N	5226
Masasi	TZ	\N	36032
Xavantes	BR	\N	12484
Kirkwall	GB	\N	9293
Dubnica nad Vahom	SK	\N	24068
Altus	US	\N	18418
Middleton	US	\N	20034
Grebenstein	DE	\N	5745
Tettenhall	GB	\N	5225
Otaru	JP	\N	114947
Hopefield	ZA	\N	6460
Thompson	US	\N	14946
Seelze	DE	\N	34442
Karpinsk	RU	\N	26957
Chitado	AO	\N	500
Wells	GB	\N	12000
North Adams	US	\N	17153
Mosbrough	GB	\N	17097
Coweta	US	\N	10032
Baldwin Harbor	US	\N	7690
San Ramon	UY	\N	7133
Lake Zurich	US	\N	19877
East Vincent	US	\N	7062
Salmourao	BR	\N	5152
Todos Santos	MX	\N	6485
Home Gardens	US	\N	11442
Langenzenn	DE	\N	10665
Puteaux	FR	\N	44645
Prestatyn	GB	\N	18849
Nazran	RU	\N	117936
Belleville	CA	\N	50716
Socorro	US	\N	34370
Santo Anastacio	BR	\N	21044
Yashiki	JP	\N	32218
Kahoku	JP	\N	34792
Yakoruda	BG	\N	5813
Rumoi	JP	\N	20841
Geisingen	DE	\N	6202
Blackstone	US	\N	9246
Soquel	US	\N	10862
Corumba	BR	\N	109294
Carol Stream	US	\N	39203
Pequannock	US	\N	15286
West Richland	US	\N	15075
Rantoul	US	\N	13584
Ionia	US	\N	14122
Henfield	GB	\N	5012
Soham	GB	\N	10860
Tazovskiy	RU	\N	5981
Haverford	US	\N	49162
Carouge	CH	\N	22336
Syanno	BY	\N	7300
Bensheim	DE	\N	40456
Al Bahnasa	EG	\N	15948
Ste. Anne	CA	\N	5003
Hainesport	US	\N	6048
Sweet Home	US	\N	10697
Navodari	RO	\N	32981
Candido Mota	BR	\N	31131
Silver Firs	US	\N	22052
Port Charlotte	US	\N	61204
Mims	US	\N	6171
Korablino	RU	\N	11220
Sandown	GB	\N	11868
Tyngsborough	US	\N	12272
DeSoto	US	\N	52988
Radolfzell am Bodensee	DE	\N	31203
Country Homes	US	\N	6054
Barre	US	\N	20421
Eastvale	US	\N	64157
Fairport	US	\N	5305
Novovoronezh	RU	\N	31503
Presidente Dutra	BR	\N	30330
Southwick	US	\N	9727
Leawood	US	\N	34727
Tamarac	US	\N	66721
Montgomery Township	US	\N	25984
North Grenville	CA	\N	16451
Fayid	EG	\N	21808
Forrest City	US	\N	12309
Grafenwohr	DE	\N	6363
Bruntal	CZ	\N	16138
North Attleborough	US	\N	29116
Dehiba	TN	\N	4295
Rockwall	US	\N	45888
Capivari	BR	\N	53152
Harris Hill	US	\N	5737
Diez	DE	\N	11074
Wayland	US	\N	13720
Acton	GB	\N	62480
Muldrow	US	\N	5478
Inhumas	BR	\N	44058
Keene	US	\N	21911
Haywards Heath	GB	\N	22800
Barrinha	BR	\N	31230
Seabrook	US	\N	18345
Biedenkopf	DE	\N	13614
Kanuma	JP	\N	95812
Lenox	US	\N	8933
East Nottingham	US	\N	8929
Enfield Lock	GB	\N	16469
Actopan	MX	\N	56429
Pakhachi	RU	\N	10
Mounds View	US	\N	13324
Millom	GB	\N	7829
Ober-Ramstadt	DE	\N	15130
Schloss Holte-Stukenbrock	DE	\N	26776
Ubach-Palenberg	DE	\N	24081
East Fallowfield	US	\N	7567
Cocorit	MX	\N	7953
Trubchevsk	RU	\N	14001
Dawwah	OM	\N	2000
Gusinoozersk	RU	\N	23082
Ban Mae Kha Tai	TH	\N	18564
Warrenville	US	\N	13174
Wolf Trap	US	\N	16911
Tomigusuku	JP	\N	63700
Kozaki	JP	\N	5827
Halisahar	IN	\N	124939
Susquehanna Township	US	\N	24857
Brand-Erbisdorf	DE	\N	9452
Godhavn	GL	\N	847
Wood Dale	US	\N	13607
Montevideo	US	\N	5001
Cambridge	US	\N	118927
Xonobod	UZ	\N	35181
Plainville	US	\N	17720
Novy Bor	CZ	\N	11616
Bournville	GB	\N	25938
Beacon Square	US	\N	6873
South Windsor	US	\N	25823
Angleton	US	\N	19431
Eupen	BE	\N	19526
Gatchina	RU	\N	94447
Muncheberg	DE	\N	6870
Waianae	US	\N	14054
Privolzhsk	RU	\N	15530
San Francisco del Mar	MX	\N	7650
Canlaon	PH	\N	54509
Bingley	GB	\N	15925
Medyn	RU	\N	8109
Partizansk	RU	\N	37059
Yungay	PE	\N	8000
Bargoed	GB	\N	11900
Palisades Park	US	\N	20715
Brentwood	US	\N	64474
Mableton	US	\N	40464
Kraulshavn	GL	\N	204
Alexandria	GB	\N	13444
Kandern	DE	\N	8249
Walmer	GB	\N	8178
Yanaul	RU	\N	25511
Porto Nacional	BR	\N	9129
Canford Cliffs	GB	\N	8620
Pyt'-Yakh	RU	\N	41005
Shrewsbury	US	\N	37037
Kittanning	US	\N	12950
Margaret	US	\N	5137
Sao Gabriel	BR	\N	55434
Pell City	US	\N	12275
Overlea	US	\N	12384
Achacachi	BO	\N	8857
Burnley	GB	\N	73021
Southbury	US	\N	19754
Lexington Park	US	\N	11848
Owada	JP	\N	61058
Pittston	US	\N	7802
Lossnitz	DE	\N	8267
Togane	JP	\N	58686
Erlanger	US	\N	19246
Paragould	US	\N	27328
Huarmey	PE	\N	16172
Nuevo	US	\N	7033
Charlestown	US	\N	7780
Seria	BN	\N	21082
Constitucion	CL	\N	37917
Ridgefield	US	\N	25070
Sebnitz	DE	\N	9432
Lambeth	GB	\N	9675
Tom Price	AU	\N	3005
Lakinsk	RU	\N	14330
Sterling Heights	US	\N	132438
Celakovice	CZ	\N	12273
North Arlington	US	\N	15683
Nambour	AU	\N	11187
Spaichingen	DE	\N	13084
Godmanchester	GB	\N	6711
South Patrick Shores	US	\N	6802
Bainbridge Island	US	\N	25298
Sheffield	US	\N	8901
Motomachi	JP	\N	19300
Rideau Lakes	CA	\N	10207
Iowa City	US	\N	118041
Pawcatuck	US	\N	5249
New Sewickley	US	\N	7323
Kolpashevo	RU	\N	23209
Wauwatosa	US	\N	48118
Effingham	US	\N	14005
Los Ranchos de Albuquerque	US	\N	6108
Oregon	US	\N	20055
Trumann	US	\N	6826
Gatumba	BI	\N	11700
West Frankfort	US	\N	8561
Brixham	GB	\N	16693
Maesteg	GB	\N	21000
Independent Hill	US	\N	9499
Red Oak	US	\N	13464
Vinukonda	IN	\N	59725
Elizabethtown	US	\N	78002
Calderitas	MX	\N	5326
Virginia	US	\N	12381
Henryetta	US	\N	6162
Clay Cross	GB	\N	9222
Modra	SK	\N	8976
Longreach	AU	\N	2970
Kitimat	CA	\N	8131
Sutton in Ashfield	GB	\N	49023
Chesham	GB	\N	21483
Banstead	GB	\N	16666
Tsurugashima	JP	\N	70076
Saltcoats	GB	\N	11260
Al Karnak	EG	\N	26488
Marina del Rey	US	\N	9771
Murfatlar	RO	\N	10216
Leongatha	AU	\N	5119
Ozery	RU	\N	25359
Mittersill	AT	\N	5380
Jamul	US	\N	5384
Ellicott	US	\N	8443
Sevenoaks	GB	\N	29506
Woodcrest	US	\N	17310
Chemax	MX	\N	14885
Tiznit	MA	\N	57705
Saint-Paul	CA	\N	5122
Wellington	GB	\N	25554
Saint-Jean-sur-Richelieu	CA	\N	92394
Rasskazovo	RU	\N	43758
Acarau	BR	\N	28389
Merredin	AU	\N	2850
Itabera	BR	\N	18015
Edwinstowe	GB	\N	5188
Glenvar Heights	US	\N	17802
Leinefelde	DE	\N	20124
Cuevas del Almanzora	ES	\N	14081
Quixada	BR	\N	49328
Cobham	GB	\N	9739
Saidia	MA	\N	8780
Kapaa	US	\N	10544
Hereford	US	\N	15164
Algodones	MX	\N	5474
Vrutky	SK	\N	7760
Axminster	GB	\N	5761
Trinidad	US	\N	8276
Matlock	GB	\N	9543
Rogerstone	GB	\N	10158
Yasnyy	RU	\N	15573
Claremore	US	\N	25384
Larkfield-Wikiup	US	\N	8926
Minnetrista	US	\N	8130
Wallasey	GB	\N	60284
Waseca	US	\N	8984
Zheleznovodsk	RU	\N	24768
Nikolsk	RU	\N	20572
Castro	BR	\N	42091
Mithi	PK	\N	20079
Ormesby	GB	\N	5942
Hardyston	US	\N	7886
Wetherby	GB	\N	19979
Brezoi	RO	\N	6022
Kovvur	IN	\N	39667
Commack	US	\N	36936
Tavares	US	\N	17749
Hebburn	GB	\N	16492
East Pasadena	US	\N	5971
Elmwood	US	\N	5525
Navapolatsk	BY	\N	98800
Kani	JP	\N	100031
Ban Suan	TH	\N	66092
Braganca	BR	\N	57163
Speedway	US	\N	12193
Chekhov	RU	\N	70548
Friedland	DE	\N	6472
Liss	GB	\N	6291
La Vergne	US	\N	35716
Walworth	US	\N	9237
Ettlingen	DE	\N	39339
Minano	JP	\N	9569
Floha	DE	\N	10762
Lake Butler	US	\N	18917
Binningen	CH	\N	15580
West Haven-Sylvan	US	\N	8434
Flawil	CH	\N	10520
Khilok	RU	\N	10607
Nago	JP	\N	62725
Moldava nad Bodvou	SK	\N	11260
Laventille	TT	\N	21454
Nesconset	US	\N	13893
Droitwich	GB	\N	23504
Eastleigh	GB	\N	24011
Kovdor	RU	\N	16623
Garrettsville	US	\N	6123
Little Canada	US	\N	10501
South Londonderry	US	\N	7958
Harwood Heights	US	\N	8333
Westmont	US	\N	33723
Riviere-du-Loup	CA	\N	19447
Magugpo Poblacion	PH	\N	6726
Kings Park	US	\N	16707
Holbeach	GB	\N	10458
Teshikaga	JP	\N	7145
Bolton upon Dearne	GB	\N	6744
Arlington Heights	US	\N	74760
Puerto Varas	CL	\N	26172
Anderlecht	BE	\N	120887
Mobetsu	JP	\N	21709
Liberty	US	\N	32100
Enoch	US	\N	7180
Warr Acres	US	\N	10118
Wheelersburg	US	\N	5996
Shelton	US	\N	41129
Vysokovsk	RU	\N	10586
Bad Aibling	DE	\N	19100
San Pablo	US	\N	30990
Burton	US	\N	28574
Mekambo	GA	\N	3170
Memuro-minami	JP	\N	18497
Zapadnaya Dvina	RU	\N	8089
Homeland Park	US	\N	6157
Acomb	GB	\N	22215
Trumbull	US	\N	36174
Robertsville	US	\N	11840
Gloucester Point	US	\N	9294
Inglewood	US	\N	108151
Trappes	FR	\N	32584
Chernushka	RU	\N	32952
Timonium	US	\N	10140
Bad Bruckenau	DE	\N	6449
Cehu Silvaniei	RO	\N	7214
Guglingen	DE	\N	6353
Bedford	US	\N	49049
Ciudad General Belgrano	AR	\N	92957
Rothenbach an der Pegnitz	DE	\N	12203
Wyke Regis	GB	\N	5458
Saint-Sebastien-sur-Loire	FR	\N	26838
Ozark	US	\N	20482
Yuzawa	JP	\N	42887
La Tour-de-Peilz	CH	\N	11829
Carlinville	US	\N	5514
Tadcaster	GB	\N	6003
Patchogue	US	\N	12321
Steilacoom	US	\N	6390
Sylvania	US	\N	19311
Alamo Heights	US	\N	8614
Queluz	PT	\N	78273
Mount Evelyn	AU	\N	9702
Bol'shoy Kamen'	RU	\N	38042
Colton	US	\N	54824
Linton	US	\N	5596
Bruchkobel	DE	\N	20427
Asha	RU	\N	29692
Lawrence	US	\N	98648
Mirnyy	RU	\N	35223
Pontal	BR	\N	45978
Merrifield	US	\N	17789
Karlovo	BG	\N	25919
Bury Saint Edmunds	GB	\N	40664
Pevely	US	\N	5978
Atlantic	US	\N	5937
Niceville	US	\N	15972
West Derby	GB	\N	14382
Podebrady	CZ	\N	14377
Beacon Falls	US	\N	6115
Giffnock	GB	\N	16178
Castelnau-le-Lez	FR	\N	20480
Eston	GB	\N	7005
Giannouli	GR	\N	7847
Traben-Trarbach	DE	\N	5567
Lafrayta	MA	\N	11298
Palestina	BR	\N	12231
Horta	PT	\N	14994
Ardrossan	GB	\N	10952
Garner	US	\N	31407
New Providence	US	\N	13595
Mill Valley	US	\N	14259
Butner	US	\N	17575
Kattagan	UZ	\N	86745
Ocean View	US	\N	14360
Ban Map Ta Phut	TH	\N	60928
New Cumberland	US	\N	7288
Kilbirnie	GB	\N	18829
Sabratah	LY	\N	102038
South Apopka	US	\N	6081
Selwyn	CA	\N	17060
Paranapanema	BR	\N	19357
Princes Risborough	GB	\N	7978
Hormigueros	PR	\N	11009
Illingen	DE	\N	16262
Glenwood Springs	US	\N	11962
West Monroe	US	\N	12227
Sulzbach-Rosenberg	DE	\N	19414
Parigi	IN	\N	12614
Chelmza	PL	\N	14808
North Potomac	US	\N	24148
Wekiwa Springs	US	\N	23329
Toropets	RU	\N	12048
Emerald	AU	\N	14119
Bopfingen	DE	\N	11727
Tornesch	DE	\N	13779
Burnie	AU	\N	19385
Fountain	US	\N	30735
Gobernador Galvez	AR	\N	80769
Dracut	US	\N	31266
Prineville	US	\N	12650
Bolivar	US	\N	10389
North Fair Oaks	US	\N	14547
Lamitan	PH	\N	74782
Cumnor	GB	\N	5755
Llallagua	BO	\N	28069
Rincao	BR	\N	10796
Crossett	US	\N	6820
Dohna	DE	\N	6146
Westwood	US	\N	15863
Frasin	RO	\N	5876
East Greenwich	US	\N	13073
Chantilly	US	\N	24559
Beaumont	BE	\N	7137
Pecos	US	\N	14040
Xankandi	AZ	\N	49848
Naivasha	KE	\N	14563
Duncanville	US	\N	38751
Plumsted	US	\N	8514
Palm Tree	US	\N	23744
South Lockport	US	\N	7315
Salida	US	\N	14658
Hikone	JP	\N	113818
Blackhawk	US	\N	9860
Seesen	DE	\N	19340
Sanger	US	\N	27777
Quirihue	CL	\N	6529
Granville	AU	\N	5500
Cottingham	GB	\N	17164
Ellington	US	\N	16041
Batavia	US	\N	26420
Des Plaines	US	\N	58899
Burslem	GB	\N	11314
Yuryuzan	RU	\N	11415
North Patchogue	US	\N	7561
East Islip	US	\N	13563
Nuevo Progreso	MX	\N	10178
Chuy	UY	\N	9675
Turceni	RO	\N	7269
Gevelsberg	DE	\N	30695
Somerset	US	\N	30053
Roxbury	US	\N	23136
Rapid Valley	US	\N	9475
Scartho	GB	\N	10408
Sainte-Therese	CA	\N	26025
Santa Fe	US	\N	111269
Aberaman	GB	\N	9964
Hluboka nad Vltavou	CZ	\N	5419
North Bend	US	\N	9768
Ebreichsdorf	AT	\N	10942
Pirdop	BG	\N	7353
San Jose de Chiquitos	BO	\N	16942
Philippsburg	DE	\N	13615
Naples Manor	US	\N	6735
Bellflower	US	\N	76435
La Malbaie	CA	\N	8271
White House	US	\N	12638
Guaranta	BR	\N	6651
Dripping Springs	US	\N	5708
Zarghun Shahr	AF	\N	13737
Kingsville	US	\N	25120
West Long Branch	US	\N	7881
Richelieu	CA	\N	5467
Dhangadhi	NP	\N	101970
Chorleywood	GB	\N	11286
Tatarsk	RU	\N	23729
Kelo	TD	\N	96224
Catalao	BR	\N	86647
Red Bank	US	\N	11966
Oswego	US	\N	37420
Sulingen	DE	\N	12842
Stallings	US	\N	16145
Volzhsk	RU	\N	54519
Coudekerque-Branche	FR	\N	21134
Woods Cross	US	\N	11431
Santaquin	US	\N	14004
Essen	BE	\N	19162
Iiyama	JP	\N	19800
Bhimphedi	NP	\N	15000
Kalispell	US	\N	39182
Hammonton	US	\N	12389
Hirayama	JP	\N	8902
Ellenville	US	\N	6384
Harvey	US	\N	24408
Olfen	DE	\N	12846
Neutraubling	DE	\N	13796
Whitefield	GB	\N	23283
Chandlers Ford	GB	\N	21436
Mecca	US	\N	7174
West Brandywine	US	\N	7482
Chalford	GB	\N	6215
Bni Drar	MA	\N	10934
Pea Ridge	US	\N	6215
Stratford	GB	\N	51387
Halls Creek	AU	\N	1546
Roztoky	CZ	\N	8645
Batesville	US	\N	12220
Dyurtyuli	RU	\N	30969
Soddy-Daisy	US	\N	13619
Senhor do Bonfim	BR	\N	48471
Carrieres-sur-Seine	FR	\N	85191
Bottesford	GB	\N	11038
Tapiales	AR	\N	23586
Yunoshima	JP	\N	31316
Bicaz	RO	\N	8626
Aue	DE	\N	16012
Raritan	US	\N	22063
Winneba	GH	\N	44254
Kosmonosy	CZ	\N	5233
Kingsville	CA	\N	21552
Paw Paw	US	\N	8270
Ennigerloh	DE	\N	19829
Schieder-Schwalenberg	DE	\N	8475
Dracena	BR	\N	45847
Twin Rivers	US	\N	7067
Ash Vale	GB	\N	5686
Conneaut	US	\N	13767
Warsaw	US	\N	33708
Midsomer Norton	GB	\N	13000
Topoloveni	RO	\N	10219
Schmallenberg	DE	\N	24869
Cubatao	BR	\N	127006
Tabatinga	BR	\N	15881
Uckfield	GB	\N	14493
Dinuba	US	\N	24461
Artem	RU	\N	106692
Talitsa	RU	\N	15941
Lower Nazareth	US	\N	6125
Klingenthal	DE	\N	8365
Qarazhal	KZ	\N	22170
Guttenberg	US	\N	11121
Fordingbridge	GB	\N	5998
Kaneohe Station	US	\N	11075
Tudela	ES	\N	36258
Cambridge	CA	\N	129920
Bonnyville	CA	\N	5975
Fishers	US	\N	95310
North New Hyde Park	US	\N	15726
Zell am Harmersbach	DE	\N	8112
Severn	US	\N	50052
Simeonovgrad	BG	\N	8539
Ashtabula	US	\N	27645
Pilawa Gorna	PL	\N	6673
Thorigny-sur-Marne	FR	\N	21356
Pakokku	MM	\N	126938
Atitalaquia	MX	\N	26904
Marystown	CA	\N	5316
Petrvald	CZ	\N	7237
North Auburn	US	\N	13707
Wichita Falls	US	\N	99557
Waldkraiburg	DE	\N	23442
Weingarten	DE	\N	24943
Shrirangapattana	IN	\N	34135
Colchester	GB	\N	111921
Mooroopna	AU	\N	7942
Highfields	AU	\N	8131
Balsamo	BR	\N	8773
Honjo	JP	\N	77045
Maidencreek	US	\N	9402
Anniston	US	\N	73501
Bourke	AU	\N	1909
Dartmouth	GB	\N	5064
City of Orange	US	\N	30466
Morombe	MG	\N	16727
Cabo San Lucas	MX	\N	81111
Setana	JP	\N	7792
Mbala	ZM	\N	20570
Wigston Magna	GB	\N	32321
Antis	US	\N	6291
Itapeva	BR	\N	62957
Belokurikha	RU	\N	15160
Yaxley	GB	\N	9174
Derry	GB	\N	83652
Fellbach	DE	\N	45671
Altoona	US	\N	74829
Broadlands	US	\N	13704
Kamagaya	JP	\N	109525
Oudtshoorn	ZA	\N	61507
Emeryville	US	\N	12086
Ruhango	RW	\N	17051
Vinnichki	UA	\N	15723
Pochinok	RU	\N	8545
Bella Union	UY	\N	19100
Pebble Creek	US	\N	8284
Kirchberg	DE	\N	8242
Denville	US	\N	16667
Freeport	US	\N	42956
Cote-Saint-Luc	CA	\N	32448
Targu Ocna	RO	\N	11300
Biei	JP	\N	9948
Wilsdruff	DE	\N	14297
Okemos	US	\N	23912
Villa Sarmiento	AR	\N	17481
Shannon	IE	\N	8781
Wombourn	GB	\N	14157
Uettligen	CH	\N	11335
Oftringen	CH	\N	13791
Le Perreux-Sur-Marne	FR	\N	33879
Fontenay-sous-Bois	FR	\N	52939
Lake Placid	US	\N	18227
Winfield	US	\N	11679
Mahalapye	BW	\N	50744
St. Augustine South	US	\N	5750
Krompachy	SK	\N	8828
Nantwich	GB	\N	17424
Commercial	US	\N	5026
Acheres	FR	\N	21017
Ruti	CH	\N	12098
Mastic	US	\N	14678
Le Blanc-Mesnil	FR	\N	56783
Zollikon	CH	\N	13008
Dongducheon	KR	\N	97424
Woodside	US	\N	5458
Padiham	GB	\N	10098
Wangen im Allgau	DE	\N	26905
Oued Laou	MA	\N	9665
Ban Om Noi	TH	\N	52457
Cheraw	US	\N	7757
Pelham	CA	\N	17110
Tanque Verde	US	\N	15860
Marktheidenfeld	DE	\N	11194
Gojo	JP	\N	28519
Muban Phimon Rat	TH	\N	41498
Lymm	GB	\N	12350
Ituni	GY	\N	100
Potirendaba	BR	\N	16709
Aberdeen	US	\N	29609
Carlsbad	US	\N	115382
Crowsnest Pass	CA	\N	5589
Wahneta	US	\N	5484
Ust'-Maya	RU	\N	3062
Hingham	US	\N	23298
Upton	US	\N	7835
Earlswood	GB	\N	5049
Selkirk	GB	\N	5784
Ashburnham	US	\N	6253
Ivdel	RU	\N	15888
Havirov	CZ	\N	71200
Hook	GB	\N	7770
Insar	RU	\N	8010
Grunstadt	DE	\N	13422
Champigny-sur-Marne	FR	\N	77630
Salisbury Township	US	\N	13843
Swadlincote	GB	\N	32219
Villazon	BO	\N	28045
Walled Lake	US	\N	7134
Lower Macungie	US	\N	31972
Northern Rockies	CA	\N	5393
Premnitz	DE	\N	8453
Wuyuan	CN	\N	30057
Whitney	US	\N	43072
Volkach	DE	\N	8857
Renfrew	GB	\N	21854
Concord	AU	\N	5914
Bishop Auckland	GB	\N	25455
Tanfield	GB	\N	8270
Estiva Gerbi	BR	\N	10873
Dolo Bay	ET	\N	11810
Colonial Park	US	\N	12886
Regedor Quissico	MZ	\N	1210
Saskylakh	RU	\N	1920
St. Simons	US	\N	14302
Gladstone	AU	\N	33418
Mariinskiy Posad	RU	\N	8755
Monschau	DE	\N	11726
Barnis	EG	\N	10
Paulton	GB	\N	5303
Glucksburg	DE	\N	6124
Lich	DE	\N	13650
Sierra Vista	US	\N	51731
Coffs Harbour	AU	\N	71822
Taroudannt	MA	\N	80149
Forney	US	\N	50251
Noyemberyan	AM	\N	5310
Hornsby Bend	US	\N	7194
Livingston	GB	\N	57030
Tiszalok	HU	\N	5234
Stavelot	BE	\N	7145
Melton	AU	\N	8069
Ulverston	GB	\N	11678
Vinhedo	BR	\N	72550
Thief River Falls	US	\N	9147
Buturlinovka	RU	\N	24319
Teykovo	RU	\N	32511
Mamonovo	RU	\N	7953
Roxboro	US	\N	9599
Clarkston	US	\N	12637
Filyro	GR	\N	5495
Horbury	GB	\N	10002
Lincroft	US	\N	6348
San Diego Country Estates	US	\N	10381
North Cornwall	US	\N	7815
Abong Mbang	CM	\N	14661
Apucarana	BR	\N	107085
Carnarvon	AU	\N	4426
Southam	GB	\N	6567
Velka Bites	CZ	\N	5243
Bellair-Meadowbrook Terrace	US	\N	15117
Lambert's Bay	ZA	\N	6120
Bronxville	US	\N	6408
Armyans'k	UA	\N	21956
Birsfelden	CH	\N	10299
Moreau	US	\N	15273
Tonbridge	GB	\N	40356
Megion	RU	\N	48691
Antigonish	CA	\N	5002
Binche	BE	\N	33598
Nailsworth	GB	\N	5794
Opa-locka	US	\N	15887
Nyagatare	RW	\N	14320
Colorado	BR	\N	22345
Eltmann	DE	\N	5299
Qiryat Mozqin	IL	\N	40160
Essa	CA	\N	21083
Anahuac	MX	\N	9952
Princeton Meadows	US	\N	13438
Chilakalurupet	IN	\N	101398
Monsey	US	\N	22073
Sturgeon Bay	US	\N	8419
Chrudim	CZ	\N	23168
Bow	US	\N	7816
Wallisellen	CH	\N	15855
Venado Tuerto	AR	\N	76432
Rome	US	\N	61537
Truro	CA	\N	12826
Aylesbury	GB	\N	58740
Hafnarfjordhur	IS	\N	28703
Vrindavan	IN	\N	56618
Camberley	GB	\N	38038
Murillo	US	\N	6236
Shinfield	GB	\N	8136
Gargzdai	LT	\N	13877
Breaux Bridge	US	\N	18484
Dorogobuzh	RU	\N	9793
Thika	KE	\N	99322
Chipping Ongar	GB	\N	6093
Commerce	US	\N	12661
Kapoeta	SS	\N	7042
Yirga `Alem	ET	\N	36292
Zaslawye	BY	\N	17600
Upper Buchanan	LR	\N	48315
Bonney Lake	US	\N	21148
Kincardine	CA	\N	11389
Khandyga	RU	\N	6796
Munro	AR	\N	35844
As Sulayyil	SA	\N	24097
Withernsea	GB	\N	6159
Baxley	US	\N	5515
San Lorenzo	US	\N	25388
Heath	US	\N	10942
Kaitaia	NZ	\N	5870
Cresskill	US	\N	8668
San Leon	US	\N	5106
Frydlant	CZ	\N	7476
Oakwood	US	\N	8936
Guapiara	BR	\N	17879
Pompano Beach	US	\N	112118
Devon	CA	\N	6578
Warkworth	NZ	\N	5320
Hudson Falls	US	\N	7056
Brewood	GB	\N	7329
Marshall	US	\N	21331
Vyshniy Volochek	RU	\N	46908
Capenda Camulemba	AO	\N	80000
Hilchenbach	DE	\N	14906
Bad Vilbel	DE	\N	33990
Hagi	JP	\N	45435
Lukoyanov	RU	\N	14104
Brent	US	\N	22056
Veseli nad Moravou	CZ	\N	10889
Laughlin	US	\N	7502
Sakaidecho	JP	\N	51196
Ostseebad Kuhlungsborn	DE	\N	7896
Caninde	BR	\N	42720
South Stormont	CA	\N	13110
Phoenixville	US	\N	16968
Dimitrovgrad	RU	\N	116055
Barsinghausen	DE	\N	34234
Labrador City	CA	\N	7220
Prestice	CZ	\N	7131
Wigan	GB	\N	103608
Kensington	GB	\N	64681
Key West	US	\N	31401
Nazare Paulista	BR	\N	17794
Myers Corner	US	\N	6620
Pine Creek	AU	\N	328
Whyalla	AU	\N	21742
Brecksville	US	\N	13604
Beroun	CZ	\N	19641
Griffin	US	\N	22813
Zavitinsk	RU	\N	10721
Woodbury	US	\N	72828
Royal Wootton Bassett	GB	\N	11385
Ortenberg	DE	\N	9001
Bayonet Point	US	\N	26740
Julich	DE	\N	32632
Northglenn	US	\N	38819
Lake Bluff	US	\N	5562
Schlitz	DE	\N	9764
Wendover	GB	\N	7399
Estevan	CA	\N	11258
Lanett	US	\N	6151
Waterbeach	GB	\N	5166
Crest Hill	US	\N	20376
Dore	GB	\N	5496
Zehdenick	DE	\N	13437
Vilyuysk	RU	\N	11095
Halle	BE	\N	39096
Sarapui	BR	\N	9836
Siglan	RU	\N	10
Neilston	GB	\N	5320
Ayaviri	PE	\N	19310
Sanibel	US	\N	7401
L'Ancienne-Lorette	CA	\N	16745
Heage	GB	\N	5013
Ayr	AU	\N	8738
Wildomar	US	\N	37229
North Londonderry	US	\N	8419
Delaware	US	\N	41283
Zebulon	US	\N	5917
Cottage Lake	US	\N	23955
Bucksburn	GB	\N	8131
Kaukauna	US	\N	16270
Sky Lake	US	\N	6119
Bataysk	RU	\N	126769
Fitchburg	US	\N	40638
Noblesville	US	\N	64668
Cliza	BO	\N	6534
Naumburg	DE	\N	32402
Tichigan	US	\N	5208
Volo	US	\N	5813
Lebowakgomo	ZA	\N	33308
Calera	US	\N	14717
Zimapan	MX	\N	34476
East Leake	GB	\N	6337
Taiuva	BR	\N	5605
La Valette-du-Var	FR	\N	23884
Hollister	US	\N	48992
Summerside	CA	\N	14829
McMinns Lagoon	AU	\N	5025
North Strabane	US	\N	14388
Vesyegonsk	RU	\N	6219
Apopka	US	\N	53447
Misawa	JP	\N	38877
Farmington	US	\N	51309
Mechanicville	US	\N	5037
Canal Fulton	US	\N	5408
Cristuru Secuiesc	RO	\N	10796
Ticul	MX	\N	32796
Zelenogorsk	RU	\N	62245
Kuznetsk	RU	\N	82276
Bayville	US	\N	6732
Lakes of the Four Seasons	US	\N	7243
Cachoeira do Sul	BR	\N	74694
Preesall	GB	\N	5694
Woodmoor	US	\N	9117
Holmes Chapel	GB	\N	5605
Sandridge	GB	\N	11451
Bellefontaine Neighbors	US	\N	10397
Vega Baja	PR	\N	22815
Tweed	CA	\N	6044
Prince Albert	CA	\N	35926
Novotroitsk	RU	\N	86474
O'Hara	US	\N	8768
Tucson Estates	US	\N	11758
Eucalyptus Hills	US	\N	6017
Burwell	GB	\N	6309
Rychnov nad Kneznou	CZ	\N	10999
Great Wakering	GB	\N	5587
Erbendorf	DE	\N	5085
Fairborn	US	\N	33876
Maxhutte-Haidhof	DE	\N	11575
Tagaytay	PH	\N	71181
South Brunswick	US	\N	45255
Clay	US	\N	59423
Aver-o-Mar	PT	\N	8961
Cachan	FR	\N	31069
Turpin Hills	US	\N	5351
Hopewell	US	\N	22529
Chiroqchi	UZ	\N	13220
Chonchi	CL	\N	5632
Short Pump	US	\N	27526
Wakema	MM	\N	48405
Woodridge	US	\N	33432
Sudak	UA	\N	16756
Lowes Island	US	\N	11111
Santa Albertina	BR	\N	5971
Borisoglebsk	RU	\N	62669
Olean	US	\N	20755
Araguari	BR	\N	116871
Furstenberg	DE	\N	5838
North Dumfries	CA	\N	10215
Villa Regina	AR	\N	30028
Wixom	US	\N	14049
Haxby	GB	\N	8428
Whitstable	GB	\N	32100
Northam	AU	\N	6548
Priozersk	RU	\N	18552
Adelphi	US	\N	15751
Merthyr Tudful	GB	\N	43820
Surgidero de Batabano	CU	\N	25664
Gahanna	US	\N	35483
Alnwick/Haldimand	CA	\N	6869
Dardenne Prairie	US	\N	13348
Seven Corners	US	\N	8576
Unterseen	CH	\N	5750
Requena	PE	\N	18000
Pittsgrove	US	\N	8940
Traralgon	AU	\N	25485
Matawan	US	\N	8640
Bloxwich	GB	\N	25401
Cornelia	US	\N	20913
Guihulngan	PH	\N	95969
Leninsk	RU	\N	15064
Rocky River	US	\N	19986
Channarayapatna	IN	\N	40400
Gore	ET	\N	9352
Galashiels	GB	\N	12600
Wawayanda	US	\N	7276
Kangaroo Flat	AU	\N	10394
Roding	DE	\N	12081
Minami-Boso	JP	\N	36412
Ojai	US	\N	7470
Kashiwara	JP	\N	122003
Mitzic	GA	\N	4111
Saint-Lazare	CA	\N	19889
Rosenfeld	DE	\N	6347
Pontardawe	GB	\N	6832
Earls Barton	GB	\N	5387
Parsippany-Troy Hills	US	\N	52768
Kashima	JP	\N	67448
Boiling Springs	US	\N	9282
Leven	GB	\N	8850
Bacup	GB	\N	13323
Warwick Township	US	\N	18731
Metropolis	US	\N	6008
Caloundra	AU	\N	41293
Beckenham	GB	\N	46844
L'Ile-Perrot	CA	\N	10756
Ladysmith	CA	\N	8537
Barcelos	BR	\N	12584
Jatai	BR	\N	76547
Wesley Hills	US	\N	5919
Zlynka	RU	\N	5369
Stone Mountain	US	\N	6281
North Castle	US	\N	12223
Nirasaki	JP	\N	29576
North Syracuse	US	\N	6628
Schwechat	AT	\N	18026
Worthington	US	\N	14692
Freehold	US	\N	35116
Ono	JP	\N	31264
Atherton	GB	\N	22000
Kannan	JP	\N	36908
Glen Ellyn	US	\N	27714
Michelstadt	DE	\N	16151
Almondbury	GB	\N	18346
Kambarka	RU	\N	10276
Subulussalam	ID	\N	78801
Bad Lausick	DE	\N	8005
Kellinghusen	DE	\N	8142
Scott City	US	\N	5104
Puerto Quito	EC	\N	20445
Lachute	CA	\N	12551
Baker City	US	\N	9499
North Kensington	US	\N	9347
Gardelegen	DE	\N	22402
Eggertsville	US	\N	15546
Tallmadge	US	\N	17519
Oyonnax	FR	\N	22427
Grosse Pointe Park	US	\N	11050
Stadtilm	DE	\N	8420
Ridder	KZ	\N	49695
Brigantine	US	\N	8650
Addis	US	\N	6221
Suoyarvi	RU	\N	8920
Yessey	RU	\N	10
Bewdley	GB	\N	9470
Rocafuerte	PE	\N	40
Rowlands Gill	GB	\N	6096
Frostburg	US	\N	8505
Appley Bridge	GB	\N	18500
Konigswinter	DE	\N	41243
Seven Pagodas	IN	\N	15172
Saudharkrokur	IS	\N	2574
Traun	AT	\N	24477
Miamisburg	US	\N	20143
Catanduva	BR	\N	109612
Horgos	RS	\N	6325
Hamden	US	\N	61206
Homeacre-Lyndora	US	\N	6714
Oshkosh	US	\N	75536
Cinco Saltos	AR	\N	22790
Perinton	US	\N	46573
Burubaytal	KZ	\N	100
Old Lyme	US	\N	7431
Bourbonnais	US	\N	19462
Minehead	GB	\N	11981
Astley	GB	\N	11270
Collins	US	\N	6511
Uchoa	BR	\N	9968
Buda	US	\N	16906
Noyabrsk	RU	\N	106879
Wolverton	GB	\N	12492
Havlickuv Brod	CZ	\N	23442
Ban Nong Prue	TH	\N	70594
Holmfirth	GB	\N	5173
New Scotland	US	\N	8739
Gaz	IR	\N	20432
Lackawanna	US	\N	17720
Calatrava	GQ	\N	628
Scriba	US	\N	6616
Verde Village	US	\N	12473
Corozal	PR	\N	8871
Maidstone	GB	\N	113137
Deeping Saint James	GB	\N	6923
Reinbek	DE	\N	27649
Alambari	BR	\N	5560
Decatur	US	\N	87236
Al Burayqah	LY	\N	13000
Grossraschen	DE	\N	8572
Bonham	US	\N	10250
Coleshill	GB	\N	6481
Codru	MD	\N	15934
Pine Manor	US	\N	5248
Dmitrovsk-Orlovskiy	RU	\N	5105
Forest Acres	US	\N	10298
East Earl	US	\N	6825
Hudsonville	US	\N	7348
Karamken	RU	\N	10
Tooele	US	\N	35392
Viry-Chatillon	FR	\N	31093
Larbert	GB	\N	9143
Warminster	GB	\N	17490
Santa Gertrudes	BR	\N	24737
Lins	BR	\N	76092
Wilcannia	AU	\N	745
Kremnica	SK	\N	5358
Svaty Jur	SK	\N	5655
Cohoes	US	\N	16687
Loningen	DE	\N	13441
Nartkala	RU	\N	30832
Ranchettes	US	\N	6097
Pemberton	US	\N	27327
Osa	RU	\N	20899
Scugog	CA	\N	21617
Yaphank	US	\N	6390
Lake Barcroft	US	\N	9823
Park Ridge	US	\N	36950
Port Alberni	CA	\N	17678
Oued Zem	MA	\N	95267
Armur	IN	\N	64023
Westlake	US	\N	32032
West Rancho Dominguez	US	\N	22932
Aiea	US	\N	9439
Kaneohe	US	\N	33739
Bath	GB	\N	88859
Pine Castle	US	\N	11643
Stopsley	GB	\N	7760
Zmeinogorsk	RU	\N	10533
Bongandanga	CD	\N	4105
Bolgar	RU	\N	8476
Harrislee	DE	\N	11531
Kostomuksha	RU	\N	29381
Beni Enzar	MA	\N	56582
Grand Turk	TC	\N	5801
Gander	CA	\N	11688
Guerrero Negro	MX	\N	14316
Oberlungwitz	DE	\N	5881
Tympaki	GR	\N	5285
North Fort Lewis	US	\N	5701
Ottweiler	DE	\N	14358
Amriswil	CH	\N	13534
North Lynnwood	US	\N	21608
Esperance	AU	\N	12145
Millbrook	US	\N	15896
Monmouth	US	\N	20172
Riverdale	US	\N	15594
Coronel	CL	\N	92940
Fall River	US	\N	89541
Rockcreek	US	\N	9898
Braunfels	DE	\N	10976
North Mankato	US	\N	13948
Ellsworth	US	\N	8180
Parapua	BR	\N	11098
Klatovy	CZ	\N	22257
Manor Township	US	\N	20687
Flatwoods	US	\N	7079
Paulo de Faria	BR	\N	8924
Divnogorsk	RU	\N	29246
Miami Springs	US	\N	13917
Aksakovo	BG	\N	8164
Skopin	RU	\N	9511
Horsham	GB	\N	50934
Masterton	NZ	\N	20100
Geseke	DE	\N	21343
Geisenfeld	DE	\N	11363
Kirchen	DE	\N	8498
Alaverdi	AM	\N	13000
Wassenberg	DE	\N	18292
Kiunga	PG	\N	8265
Charmahin	IR	\N	12292
Campbellsville	US	\N	14772
Ina	JP	\N	66641
Montmorency	FR	\N	21461
Nadlac	RO	\N	7398
Channelview	US	\N	41930
Chajari	AR	\N	60000
Demba	CD	\N	22263
Brechin	GB	\N	7199
Neresheim	DE	\N	7945
River Vale	US	\N	9976
Thatcher	US	\N	5200
Gode	ET	\N	75000
Kings Park West	US	\N	14077
Heilsbronn	DE	\N	9670
Samford	AU	\N	10931
Miyako	JP	\N	52471
Iola	US	\N	5288
Musselburgh	GB	\N	21900
Piraju	BR	\N	29664
Wallingford	GB	\N	11600
Linares	ES	\N	59761
Nakashunbetsu	JP	\N	23353
Ukiah	US	\N	29561
Kameshkovo	RU	\N	12496
Dumbarton	GB	\N	20527
Joshua	US	\N	8101
General Levalle	AR	\N	5697
Swoyersville	US	\N	5009
Motomiya	JP	\N	30546
Lennox	US	\N	21329
Peto	MX	\N	19821
Whitchurch	GB	\N	11061
Fife	US	\N	10184
Cricova	MD	\N	10669
Angatuba	BR	\N	24161
Santana do Livramento	BR	\N	83324
Morristown	US	\N	61171
Lagunas	CL	\N	10
Cananeia	BR	\N	12604
Ashibetsu	JP	\N	13291
Treforest	GB	\N	5050
Dorval	CA	\N	18980
Shildon	GB	\N	9976
Stockton-on-Tees	GB	\N	85000
Southaven	US	\N	55780
Eldama Ravine	KE	\N	17581
Bel Air South	US	\N	48269
Quellon	CL	\N	7029
Iturama	BR	\N	29805
Ilebo	CD	\N	107093
Makakilo	US	\N	20920
Onomichi	JP	\N	132675
Whitmore Lake	US	\N	6771
Beaubassin East / Beaubassin-est	CA	\N	6376
Cleburne	US	\N	37468
Castlemaine	AU	\N	6757
Fyfield	GB	\N	104234
Saltash	GB	\N	16184
San Juan	US	\N	37008
Slyudyanka	RU	\N	18287
Marinette	US	\N	18671
Tibati	CM	\N	72081
Ilo	PE	\N	66118
Kuvandyk	RU	\N	23763
Capitan Pablo Lagerenza	PY	\N	1200
Ryazhsk	RU	\N	21457
Panguipulli	CL	\N	11091
Barbourville	US	\N	6036
Prairie du Chien	US	\N	6477
Furth im Wald	DE	\N	9093
Haverhill	GB	\N	27041
Saint-Honore	CA	\N	5257
Hilmar-Irwin	US	\N	5846
Saijo	JP	\N	105020
Suamico	US	\N	13052
South Whittier	US	\N	60096
Zheleznogorsk-Ilimskiy	RU	\N	23643
Petrovsk	RU	\N	28893
Val-David	CA	\N	5209
Kinross	GB	\N	5120
Polgar	HU	\N	7889
Sequim	US	\N	22304
Waukegan	US	\N	86075
Nueva Helvecia	UY	\N	10630
Samsula-Spruce Creek	US	\N	5272
La Reja	AR	\N	47839
Trostberg an der Alz	DE	\N	11222
Chigwell	GB	\N	12449
Burbage	GB	\N	14568
Bestobe	KZ	\N	7189
Unkel	DE	\N	5021
Delavan	US	\N	11871
Meleuz	RU	\N	58004
Uchaly	RU	\N	37710
Alsager	GB	\N	11775
Boulder	US	\N	124345
Horovice	CZ	\N	6901
East Renton Highlands	US	\N	11745
Lakhdenpokhya	RU	\N	7294
Kasulu	TZ	\N	33452
Suitland	US	\N	24444
South Molton	GB	\N	5108
Mount Plymouth	US	\N	5610
Endicott	US	\N	12532
Ibiza	ES	\N	49783
Dobryanka	RU	\N	32676
Fords	US	\N	14948
Cantley	CA	\N	10699
Elwood	US	\N	11439
Hedon	GB	\N	7100
Elyria	US	\N	53757
Lakehills	US	\N	5288
Coaldale	CA	\N	8215
Whitewater	US	\N	14725
Wrecsam	GB	\N	65692
Cloverly	US	\N	15062
Grossalmerode	DE	\N	6402
Moriyama	JP	\N	82526
Sharon Hill	US	\N	5689
Segarcea	RO	\N	7019
Doberlug-Kirchhain	DE	\N	9062
Nogales	US	\N	30917
Grantham	GB	\N	44580
Tremonton	US	\N	11905
Nagyecsed	HU	\N	6327
Alcester	GB	\N	6273
Yoshinoyama	JP	\N	6412
Mackworth	GB	\N	14180
Lower Burrell	US	\N	11078
Duluth	US	\N	119476
Saint Blazey	GB	\N	6799
Eysines	FR	\N	23462
Kondopoga	RU	\N	30299
Collierville	US	\N	51040
Sabae	JP	\N	68533
El Rio	US	\N	6505
East Kelowna	CA	\N	32655
Conning Towers Nautilus Park	US	\N	9749
Thatto Heath	GB	\N	12280
Minobu	JP	\N	10956
Mariinsk	RU	\N	38637
Hochheim am Main	DE	\N	17743
Lavaltrie	CA	\N	13657
Roslavl	RU	\N	50112
Rosyth	GB	\N	13440
Mount Carmel	US	\N	7016
West Vancouver	CA	\N	42473
Yakima	US	\N	133191
Barby	DE	\N	8394
Indiga	RU	\N	10
Bazargan	IR	\N	6686
Jefferson City	US	\N	58025
Beardstown	US	\N	5807
West Caldwell	US	\N	10843
Kilkunda	IN	\N	10150
Ladera Ranch	US	\N	30288
Forest	US	\N	10298
Sarandi	AR	\N	60752
Totteridge	GB	\N	15159
Ramechhap	NP	\N	15000
Umm Qasr	IQ	\N	107620
Samaipata	BO	\N	2926
Totkomlos	HU	\N	5995
Weilburg	DE	\N	12990
Taketoyo	JP	\N	43113
Humble	US	\N	15824
Eppingen	DE	\N	21819
Abuzeydabad	IR	\N	5160
Kandhkot	PK	\N	105011
Wynne	US	\N	7152
Shawano	US	\N	10107
Templin	DE	\N	15798
Ust'-Dzheguta	RU	\N	30369
Douglass Hills	US	\N	5707
Inzai	JP	\N	100907
Jarrow	GB	\N	27526
Rheinsberg	DE	\N	8015
Jalpaiguri	IN	\N	107341
Fruit Cove	US	\N	32994
Tsiolkovskiy	RU	\N	6535
Guatapara	BR	\N	7446
Sunchales	AR	\N	20537
Clacton-on-Sea	GB	\N	56874
Bartow	US	\N	20147
Sheffield Lake	US	\N	8916
Ershui	TW	\N	15240
Bebedouro	BR	\N	77627
Wissembourg	FR	\N	7537
Severna Park	US	\N	38576
Letavertes	HU	\N	7061
Elena	BG	\N	5742
Tamana	JP	\N	64966
Hollfeld	DE	\N	5043
South Lebanon	US	\N	9815
Kenneth City	US	\N	5121
Snaresbrook	GB	\N	11868
Sauk Rapids	US	\N	14146
Plains	US	\N	9748
Larkspur	US	\N	12254
Mocimboa da Praia	MZ	\N	30950
Cedarhurst	US	\N	6633
Fergus Falls	US	\N	12683
Qapshaghay	KZ	\N	42167
Dickson	US	\N	17157
Hastings	GB	\N	92855
Affoltern am Albis	CH	\N	12080
Wallington	GB	\N	20850
San Francisco de Mostazal	CL	\N	12719
Manhica	MZ	\N	60031
Bendigo	AU	\N	99122
Kharovsk	RU	\N	9099
Missouri City	US	\N	75457
Ormskirk	GB	\N	27343
Budleigh Salterton	GB	\N	6575
Sedro-Woolley	US	\N	12072
Waipio Acres	US	\N	5443
Glauchau	DE	\N	22440
Dakota Ridge	US	\N	34250
Bedford	GB	\N	106940
Rolesville	US	\N	8501
Huautla	MX	\N	22521
Nisshin	JP	\N	91514
Treharris	GB	\N	6356
Ust'-Kut	RU	\N	41689
Krum	US	\N	5036
New Alresford	GB	\N	5431
Wetzikon	CH	\N	24452
Slavutych	UA	\N	25030
Cody	US	\N	9601
Malindi	KE	\N	94016
Cacalchen	MX	\N	6787
Meraux	US	\N	7296
Kinvere	GB	\N	7225
Ross on Wye	GB	\N	10700
Francisville	US	\N	9401
Guararema	BR	\N	28344
Guadalupe Yancuictlalpan	MX	\N	6385
Mossley	GB	\N	10921
George Mason	US	\N	9711
Price	US	\N	13564
Witzenhausen	DE	\N	15167
Prior Lake	US	\N	27241
Colider	BR	\N	27139
Kamyzyak	RU	\N	15984
Grandview	US	\N	24856
Rushall	GB	\N	11871
Zhanibek	KZ	\N	8212
Baksan	RU	\N	38192
Polson	US	\N	5370
Reyes Acozac	MX	\N	20478
Doctor Phillips	US	\N	11347
Owariasahi	JP	\N	81914
Smithton	AU	\N	3881
Velten	DE	\N	11965
Olmsted Falls	US	\N	8828
Kubinka	RU	\N	20157
Broxbourne	GB	\N	15303
DeBary	US	\N	21305
Gun Barrel City	US	\N	16292
Glinde	DE	\N	18443
Cirencester	GB	\N	19076
Vidor	US	\N	10403
Fairfax Station	US	\N	11934
Van Buren	US	\N	23683
Kiyosu	JP	\N	69680
Sharonville	US	\N	13684
Pinson	US	\N	7106
Holtville	US	\N	7664
Nes Ziyyona	IL	\N	50200
Clarenville	CA	\N	6291
Penfield	US	\N	37180
Sakata	JP	\N	100916
Braunsbedra	DE	\N	10678
Fort Walton Beach	US	\N	22521
Bethel	US	\N	19551
Northumberland	US	\N	5135
Vyazemskiy	RU	\N	12889
Terre Haute	US	\N	92490
Stein bei Nurnberg	DE	\N	13996
Niimi	JP	\N	28327
Crete	US	\N	8023
Broken Arrow	US	\N	110198
Winthrop Harbor	US	\N	6618
Dundee	US	\N	5044
McGuire AFB	US	\N	5246
Humberston	GB	\N	5634
Ludwigslust	DE	\N	12233
Ridge	US	\N	13511
Sajoszentpeter	HU	\N	11679
Nueva Imperial	CL	\N	18777
Temple Terrace	US	\N	26639
Blieskastel	DE	\N	20656
Carmel	US	\N	101068
Tan-Tan	MA	\N	73209
Kamenz	DE	\N	16975
Marina	US	\N	22781
Babeni	RO	\N	8451
Port Huron	US	\N	82970
Perry Hall	US	\N	28129
Cacolo	AO	\N	984
Heidenau	DE	\N	16593
Springbok	ZA	\N	10438
Ricany	CZ	\N	15908
Winter Garden	US	\N	46051
Agua Blanca Iturbide	MX	\N	8443
Priverno	IT	\N	14365
Andernach	DE	\N	29966
Hillview	US	\N	9225
Shar	KZ	\N	9087
Fleury-les-Aubrais	FR	\N	21026
Eastchester	US	\N	32964
Cusseta	US	\N	10907
Rockmart	US	\N	8071
Elias Fausto	BR	\N	17085
North Merrick	US	\N	12232
Barking	GB	\N	59068
Yaupi	EC	\N	293
Elmont	US	\N	36028
Mauldin	US	\N	133872
Hathras	IN	\N	126882
Kendall Park	US	\N	9346
Esperanza	MX	\N	3836
Barra Bonita	BR	\N	36321
Taree	AU	\N	26381
Punxsutawney	US	\N	6117
San Luis de La Loma	MX	\N	11090
Greenbriar	US	\N	8575
Zionsville	US	\N	28357
Fort Frances	CA	\N	7739
Shirley	US	\N	28698
Woodbridge	US	\N	100187
Ampthill	GB	\N	13307
Nishiowa	JP	\N	6731
Chichester	GB	\N	26795
Neubulach	DE	\N	5624
Buzovna	AZ	\N	31500
Defiance	US	\N	18460
Durant	US	\N	19315
Lino Lakes	US	\N	22119
Jaynagar-Majilpur	IN	\N	25922
Erkner	DE	\N	11815
Elmwood Park	US	\N	24098
Magdalena	BO	\N	3445
North Sarasota	US	\N	8997
Sosnovka	RU	\N	11027
Linhares	BR	\N	105075
Aventura	US	\N	36987
Mellrichstadt	DE	\N	5525
Kutna Hora	CZ	\N	20653
Vail	US	\N	12044
Niskayuna	US	\N	22225
Florstadt	DE	\N	8753
Jabuticabal	BR	\N	75820
Santa Lucia Monte Verde	MX	\N	6398
Nokaneng	BW	\N	1763
Ghent	US	\N	5184
Lincoln City	US	\N	12172
Nakama	JP	\N	40003
Ciudad Lazaro Cardenas	MX	\N	79200
Mankato	US	\N	62889
Nehoiu	RO	\N	10211
Lloydminster	CA	\N	31410
Dunkirk	US	\N	23874
Herrin	US	\N	12687
Arcoverde	BR	\N	57163
Noble	US	\N	7053
Taos	US	\N	14196
Lerwick	GB	\N	6958
Maitland	AU	\N	78015
Eggenfelden	DE	\N	13736
Madalena	PT	\N	6049
Shenango	US	\N	7299
Vyksa	RU	\N	53219
Forest Glen	US	\N	6589
Ukrainsk	UA	\N	11824
Grenchen	CH	\N	17140
Sitka	US	\N	6720
Kearsley	GB	\N	14212
Aliso Viejo	US	\N	50887
Newberry	US	\N	15588
East Falmouth	US	\N	5782
Dentsville	US	\N	14887
Scunthorpe	GB	\N	82334
Ebermannstadt	DE	\N	6971
Miajadas	ES	\N	9607
Oregon City	US	\N	37339
Bellefontaine	US	\N	13114
St. Michael	US	\N	18204
Windsor Locks	US	\N	12613
Medfield	US	\N	12748
Woodcreek	US	\N	5925
Oliver Paipoonge	CA	\N	5922
Greven	DE	\N	37692
Ware	US	\N	9838
Steinau an der Strasse	DE	\N	10275
San Marcos	US	\N	96664
Fairhope	US	\N	22677
Nieder-Olm	DE	\N	10150
Zimmerman	US	\N	9300
Absecon	US	\N	8818
Crescent City	US	\N	16849
Roseburg North	US	\N	5207
Xenia	US	\N	26947
Eufaula	US	\N	8484
Bowral	AU	\N	12949
Irece	BR	\N	63626
Saltburn-by-the-Sea	GB	\N	5958
Bussy	CH	\N	8736
Lakeland Village	US	\N	13170
Sainte-Genevieve-des-Bois	FR	\N	36207
Boca Raton	US	\N	99805
Gardner	US	\N	22031
Azpeitia	ES	\N	14936
Mpwapwa	TZ	\N	19806
Salinas	UY	\N	8626
Mason	US	\N	33870
Ringwood	GB	\N	13943
Winkfield	GB	\N	14998
Crockett	US	\N	5780
Victoria	RO	\N	7386
Suvorov	RU	\N	17450
Nideggen	DE	\N	9945
Tipp City	US	\N	10115
Kenilworth	US	\N	8191
Inkerman	UA	\N	10196
Bardmoor	US	\N	9514
Merstham	GB	\N	8123
Leyland	GB	\N	35578
Vilseck	DE	\N	6093
Chisago City	US	\N	5224
Borovichi	RU	\N	50144
Waipahu	US	\N	40427
West Jordan	US	\N	116480
Ramenskoye	RU	\N	116077
Durrington	GB	\N	7379
Mount Olive	US	\N	28869
Narni	IT	\N	19543
Matane	CA	\N	14462
Morpeth	GB	\N	14017
Tainai	JP	\N	28610
Gossau	CH	\N	18171
Kangersuatsiaq	GL	\N	200
Mulvane	US	\N	6489
Ware	GB	\N	18799
Richland	US	\N	58225
Iyo	JP	\N	35508
Denham	GB	\N	7139
Tillamook	US	\N	8328
Delitzsch	DE	\N	24868
Douglas	CA	\N	6154
Malmesbury	ZA	\N	35897
Fukuroi	JP	\N	87064
Atherstone	GB	\N	8670
Kurchaloy	RU	\N	25672
Dulmen	DE	\N	46590
Campbellton	CA	\N	10411
Sulz am Neckar	DE	\N	12336
Bad Voslau	AT	\N	11844
Steger	US	\N	9221
Middleborough	US	\N	24505
Vysoke Myto	CZ	\N	12288
Wisla	PL	\N	11048
Beilngries	DE	\N	9768
Harzgerode	DE	\N	7745
Roma	US	\N	11490
Songnim	KP	\N	128831
Jacala	MX	\N	12057
Raychikhinsk	RU	\N	17372
Northridge	US	\N	7343
Macin	RO	\N	8245
Lake Park	US	\N	8556
Gladbeck	DE	\N	75687
Tumby Bay	AU	\N	1474
Houlton	US	\N	5871
Junnar	IN	\N	40000
Murphy	US	\N	20500
Shrewsbury	GB	\N	71715
Bridge of Allan	GB	\N	6762
Noya	ES	\N	14263
Newbury	US	\N	7031
Guara	BR	\N	20911
Beavercreek	US	\N	47741
Baybay	PH	\N	109432
Canavieiras	BR	\N	33268
Siesta Key	US	\N	5667
Freital	DE	\N	39709
Korsakov	RU	\N	33645
Troy	US	\N	84092
Barra do Bugres	BR	\N	31311
Arnsberg	DE	\N	73628
Merignac	FR	\N	70105
Napa	US	\N	85239
Laurence Harbor	US	\N	6904
West Mead	US	\N	5097
Cobleskill	US	\N	6357
Knowsley	GB	\N	11343
Comanesti	RO	\N	19568
Taldom	RU	\N	12777
Fort Stockton	US	\N	9495
Itai	BR	\N	26042
Ashland	US	\N	23635
Middle	US	\N	18492
Atbasar	KZ	\N	35819
Hellertown	US	\N	5831
Lacey	US	\N	52592
Clemmons	US	\N	20867
Grover Beach	US	\N	13459
Podkamennaya Tunguska	RU	\N	10
Cullompton	GB	\N	8499
Unterzollikofen	CH	\N	10314
Mount Juliet	US	\N	37029
Ravensthorpe	AU	\N	498
Imperial Beach	US	\N	27440
Old Orchard Beach	US	\N	8809
Itahari	NP	\N	74501
Korocha	RU	\N	5853
West Manchester	US	\N	18819
Pfungstadt	DE	\N	25151
Quesnel	CA	\N	9879
Olds	CA	\N	9184
Breclav	CZ	\N	24743
Draganesti-Olt	RO	\N	10894
Stains	FR	\N	38720
Lincoln	GB	\N	97541
Polevskoy	RU	\N	61853
The Village of Indian Hill	US	\N	5786
Tuiuti	BR	\N	6533
Greenhill	GB	\N	7339
Bentley	AU	\N	8782
Grossenhain	DE	\N	18218
Findlay	US	\N	48469
Barras	BR	\N	21597
Narrabri	AU	\N	7606
Hamminkeln	DE	\N	26739
Wayne Township	US	\N	5058
Rockaway	US	\N	24792
Stevenston	GB	\N	9129
Kirn	DE	\N	8193
Bad Lauchstadt	DE	\N	8783
Tadaoka-higashi	JP	\N	16840
Solan	IN	\N	39256
Beebe	US	\N	7497
Wahpeton	US	\N	11067
Moravsky Krumlov	CZ	\N	5715
Uhingen	DE	\N	14422
General Eugenio A. Garay	PY	\N	972
Hacienda Heights	US	\N	54970
Zofingen	CH	\N	11655
Renwick	NZ	\N	2928
Mount Ivy	US	\N	6925
Manzariyeh	IR	\N	5617
Leander	US	\N	62608
Munch'on	KP	\N	122934
Obetz	US	\N	5196
West Carson	US	\N	22537
Woodcliff Lake	US	\N	5839
Werdau	DE	\N	20793
El Roble	CR	\N	15759
Nasrabad	IR	\N	5751
Johnson City	US	\N	127571
Partington	GB	\N	7327
Weldon Spring	US	\N	5533
Galich	RU	\N	16911
Koilkuntla	IN	\N	23859
Berwyn	US	\N	54391
Uddingston	GB	\N	6710
Steinheim am der Murr	DE	\N	12220
San Ignacio de Velasco	BO	\N	23569
Borkum	DE	\N	5125
Mercerville	US	\N	12574
Hindley	GB	\N	25001
Landore	GB	\N	6168
Saint-Constant	CA	\N	27359
Pozzallo	IT	\N	19466
Bladensburg	US	\N	9408
Palmer	US	\N	21272
Mariscal Jose Felix Estigarribia	PY	\N	2500
Wailua Homesteads	US	\N	5900
Vanrhynsdorp	ZA	\N	6272
Huckeswagen	DE	\N	15060
Pervomaisk	UA	\N	38801
Gatesville	US	\N	12053
Lauderdale Lakes	US	\N	36194
Wohlen	CH	\N	16078
Digora	RU	\N	10075
Derry	US	\N	33515
Three Rivers	US	\N	10560
Miandasht	IR	\N	9933
Hakone	JP	\N	11169
Rhondda	GB	\N	62545
King's Lynn	GB	\N	42800
Viola	US	\N	6917
Creston	CA	\N	5351
Woodward	US	\N	11410
Troitsk	RU	\N	73911
Broumov	CZ	\N	7370
Werdohl	DE	\N	17737
Horni Slavkov	CZ	\N	5403
Chamblee	US	\N	30307
D'Iberville	US	\N	14012
Schaumburg	US	\N	72887
Penedo	BR	\N	42097
Murzzuschlag	AT	\N	8654
Revda	RU	\N	62687
Tamanredjo	SR	\N	6601
Silver Lake	US	\N	6330
Targu Lapus	RO	\N	11744
Whittier	US	\N	85098
Varnek	RU	\N	10
Horn Lake	US	\N	27272
Sweden	US	\N	14115
Sotouboua	TG	\N	21054
Coral Gables	US	\N	49700
Teseney	ER	\N	3753
Rocky Mount	US	\N	64018
Warnemunde	DE	\N	5937
Gilberts	US	\N	8076
Darley	AU	\N	8372
Saint Ives	GB	\N	16384
Imaricho-ko	JP	\N	53483
Pinewood	US	\N	17027
Milton Township	US	\N	19179
Willingboro	US	\N	31545
Riberalta	BO	\N	74014
Trindade	BR	\N	97521
Sierra Madre	US	\N	10793
Oatfield	US	\N	13531
Rajec	SK	\N	5816
Robinson Township	US	\N	13650
Hockenheim	DE	\N	21779
Trinec	CZ	\N	35002
James City	US	\N	5684
Hamilton Township	US	\N	11084
Brwinow	PL	\N	11743
Staplehurst	GB	\N	6003
Castle Bromwich	GB	\N	11217
Brockton	CA	\N	9461
Balatonlelle	HU	\N	5223
Plan-les-Ouates	CH	\N	10656
Santa Barbara	CL	\N	3494
Nurota	UZ	\N	21001
Beppu	JP	\N	118499
Red Hook	US	\N	11178
Chicureo Abajo	CL	\N	10975
Langenfeld	DE	\N	58927
Ayden	US	\N	5141
Zapolyarnyy	RU	\N	15037
Rocklin	US	\N	68823
Boguchar	RU	\N	11270
Neshannock	US	\N	9278
Fairfield Glade	US	\N	8564
Dalnerechensk	RU	\N	26378
Hindon Hill	CA	\N	6088
Sainte-Adele	CA	\N	12137
Duffield	GB	\N	5046
Chosica	PE	\N	88606
Piracaia	BR	\N	26688
Scotts Valley	US	\N	11757
Vista	US	\N	101638
Gulf Park Estates	US	\N	6308
Sun City Center	US	\N	23480
Koryazhma	RU	\N	36607
Seini	RO	\N	8987
East Bethel	US	\N	12038
Kinchil	MX	\N	6307
Titisee-Neustadt	DE	\N	12269
Kotzting	DE	\N	7498
Neukirchen	DE	\N	6986
Dinklage	DE	\N	13150
Obita	JP	\N	41630
Novodvinsk	RU	\N	38434
Osterhofen	DE	\N	11798
DeForest	US	\N	10691
Lewes	GB	\N	17297
Pratania	BR	\N	5021
Suluktu	KG	\N	13378
Pecan Grove	US	\N	16651
Goulburn	AU	\N	23835
Mikhaylov	RU	\N	10174
Cloverleaf	US	\N	24953
Waukee	US	\N	24089
Farington	GB	\N	6674
Garrison	US	\N	8388
Chambersburg	US	\N	53083
Viseu de Sus	RO	\N	15037
Saint-Joseph-du-Lac	CA	\N	6195
Scone	AU	\N	5624
Smithfield Township	US	\N	7373
Levittown	PR	\N	25225
Sandston	US	\N	7056
Leninogorsk	RU	\N	62531
Ponteland	GB	\N	10921
Sekimachi	JP	\N	86698
Mandamari	IN	\N	52352
Ewa Gentry	US	\N	25752
North East	US	\N	6322
Hamtramck	US	\N	21599
Ponchatoula	US	\N	7369
Ilkley	GB	\N	14809
At Turrah	JO	\N	34948
Burgkunstadt	DE	\N	6451
Nishi	JP	\N	10155
Belgrave	GB	\N	11558
Alzenau in Unterfranken	DE	\N	18469
Timmiarmiut	GL	\N	10
Buckie	GB	\N	8273
Malvern Link	GB	\N	6155
South Sioux City	US	\N	12809
East Lampeter	US	\N	16960
Zephyrhills South	US	\N	5163
Salonta	RO	\N	17735
New Brighton	US	\N	22753
Step'anavan	AM	\N	23782
Firestone	US	\N	34230
Hitachi-ota	JP	\N	48758
Ban Talat Rangsit	TH	\N	79319
Sladkovicovo	SK	\N	5281
Bogorodsk	RU	\N	34240
Alum Rock	US	\N	11791
Seversk	RU	\N	107922
Witney	GB	\N	27522
Woolwich	GB	\N	84959
Roaring Spring	US	\N	6718
Wincanton	GB	\N	5272
Shimonita	JP	\N	6611
Charlemagne	CA	\N	5853
Warfield	GB	\N	10088
Woodfin	US	\N	6717
Cumnock	GB	\N	13000
Pooler	US	\N	25694
Sumperk	CZ	\N	25836
Saint Helena Bay	ZA	\N	11529
Severn	CA	\N	13477
Lecanto	US	\N	6264
Zacualtipan	MX	\N	25987
Wendell	US	\N	19382
Andenne	BE	\N	27017
Horsovsky Tyn	CZ	\N	5034
Sartrouville	FR	\N	51967
Takaharu	JP	\N	8709
Rahway	US	\N	29895
Studley	GB	\N	5879
Uncia	BO	\N	5709
Samal	PH	\N	104123
Stockach	DE	\N	17114
Grimma	DE	\N	28180
Shepperton	GB	\N	9753
Stony Plain	CA	\N	17189
Fowler	US	\N	6790
Tring	GB	\N	11730
Port Pirie	AU	\N	14188
Leona Vicario	MX	\N	6517
Hollis	US	\N	7880
Waxahachie	US	\N	37988
Echelon	US	\N	11586
Ushtobe	KZ	\N	20492
Norton Shores	US	\N	24664
North Stormont	CA	\N	6873
Dettelbach	DE	\N	7240
Thornbury	US	\N	7719
Kushima	JP	\N	17363
Hartford	GB	\N	5515
Ianca	RO	\N	10343
Edmundston	CA	\N	16580
Conchas	BR	\N	17406
Oban	GB	\N	8575
Mildura	AU	\N	32738
Maple Ridge	CA	\N	82256
Rudnyy	KZ	\N	124000
Vega Alta	PR	\N	9394
Port Angeles	US	\N	24293
Ixtapa Zihuatanejo	MX	\N	8992
Glenmont	US	\N	16389
Ternivka	UA	\N	28298
Ruskington	GB	\N	5169
Yubari	JP	\N	7908
Zabaykalsk	RU	\N	13154
Sammamish	US	\N	65892
Ettenheim	DE	\N	13316
Ahfir	MA	\N	19630
Redditch	GB	\N	81919
Rensselaer	US	\N	9171
Llandudno Junction	GB	\N	6722
Shchigry	RU	\N	15292
Idstein	DE	\N	24897
Town and Country	US	\N	11109
Southgate	GB	\N	14454
Sergeant Bluff	US	\N	5127
Stadtoldendorf	DE	\N	5757
Yarumal	CO	\N	35315
Paso de los Toros	UY	\N	12985
Shippensburg	US	\N	17234
Haiger	DE	\N	19378
Sered'	SK	\N	15726
Adrian	US	\N	43689
Maryland City	US	\N	17736
Whitley Bay	GB	\N	36623
Portage La Prairie	CA	\N	13304
Norwich	CA	\N	11001
Grimes	US	\N	14804
Summit Township	US	\N	6976
Stary Plzenec	CZ	\N	5151
Martlesham	GB	\N	5478
Cangamba	AO	\N	1307
Leipheim	DE	\N	7209
Lehigh Acres	US	\N	119205
Donskoy	RU	\N	63631
Dronfield	GB	\N	21261
Gross-Enzersdorf	AT	\N	11206
Katanning	AU	\N	3687
Reszel	PL	\N	7721
Val-Shefford	CA	\N	6711
Bundaberg	AU	\N	70921
Ormond-by-the-Sea	US	\N	7322
South Union	US	\N	10481
Jasper	US	\N	16477
Sinop	BR	\N	8961
Itajobi	BR	\N	15177
Joliette	CA	\N	19621
Greenwood	US	\N	59458
Cwmbach	GB	\N	5117
Alice	US	\N	20510
South San Jose Hills	US	\N	20593
Yenangyaung	MM	\N	110553
Bright	US	\N	5649
Numto	RU	\N	10
Nord	GL	\N	10
Federal Way	US	\N	96289
Iepe	BR	\N	8036
Geddes	US	\N	16610
University of Virginia	US	\N	8487
Schkeuditz	DE	\N	18066
Jipijapa	EC	\N	40232
Evesham	US	\N	45193
Debre Mark'os	ET	\N	70758
Kandel	DE	\N	9061
Powell River	CA	\N	13157
Buritama	BR	\N	16583
Semenov	RU	\N	24400
St. Cloud	US	\N	115028
Kilinochchi	LK	\N	103717
Wentzville	US	\N	41784
Shijak	AL	\N	7568
Schmalkalden	DE	\N	19732
Morgan Hill	US	\N	45952
Presidente Venceslau	BR	\N	39407
Gretna	US	\N	17647
Bogota	US	\N	8335
Kent	US	\N	132319
Creston	US	\N	7499
Mino	JP	\N	19610
Verkhnyaya Pyshma	RU	\N	71241
Cullman	US	\N	19920
Novaci-Straini	RO	\N	5431
Chobham	GB	\N	7456
Cayey	PR	\N	14610
Groveton	US	\N	16843
Liubotyn	UA	\N	20887
Paignton	GB	\N	49021
Plumas Lake	US	\N	7367
Jesup	US	\N	12198
Fraserburgh	GB	\N	13100
Ternitz	AT	\N	14632
Cromer	GB	\N	7683
West Lafayette	US	\N	50996
Fulshear	US	\N	13914
Groves	US	\N	15480
Battenberg	DE	\N	5323
Puttalam	LK	\N	45661
Sirsilla	IN	\N	83186
Bushey	GB	\N	25763
Yishui	CN	\N	94115
Saint-Laurent-du-Var	FR	\N	28453
Sealy	US	\N	5957
Kizuki	JP	\N	28002
Socorro	BR	\N	39565
North Providence	US	\N	32459
Fredonia	US	\N	10303
Kadan	CZ	\N	18246
Huaquillas	EC	\N	47706
Uman	MX	\N	39611
Caversham	GB	\N	23885
Vinces	EC	\N	30241
East Point	US	\N	34875
Itanhaem	BR	\N	90385
Modi`in Makkabbim Re`ut	IL	\N	90013
Pontoon Beach	US	\N	5641
St. Francis	US	\N	9699
Progress	US	\N	9750
Taylors	US	\N	21923
Southwood Acres	US	\N	7715
Ramsbottom	GB	\N	17872
Richmond	AU	\N	5482
Macaubal	BR	\N	8033
Nocatee	US	\N	13266
Highlands	US	\N	12292
Killingly	US	\N	17170
Bad Windsheim	DE	\N	12382
Washington Court House	US	\N	15059
Holmdel	US	\N	16582
Larchmont	US	\N	6087
Tiyerbes	RU	\N	10
Rosemere	CA	\N	14294
Khotkovo	RU	\N	21349
Kulgam	IN	\N	23584
Schwerte	DE	\N	46340
Middle Valley	US	\N	12097
Kasempa	ZM	\N	5622
Varennes	CA	\N	20994
Wesseling	DE	\N	36146
Gujo	JP	\N	39582
Poa	BR	\N	113793
Midway North	US	\N	5074
East Zorra-Tavistock	CA	\N	7129
Vimperk	CZ	\N	7440
Knowle	GB	\N	10678
Gardhabaer	IS	\N	16299
Germering	DE	\N	40389
Marple	US	\N	23709
Robertsdale	US	\N	9817
Olive Branch	US	\N	38924
Kornik	PL	\N	6807
Bad Wurzach	DE	\N	14651
Nurlat	RU	\N	32703
Puttur	IN	\N	54092
Victor Harbor	AU	\N	4233
Baleyara	NE	\N	16063
Todmorden	GB	\N	15481
Wauchula	US	\N	13992
South Burlington	US	\N	19509
Idiofa	CD	\N	61056
Mikashevichy	BY	\N	12600
Kineshma	RU	\N	83871
Bad Sackingen	DE	\N	17144
San Pedro de Atacama	CL	\N	5347
Prelouc	CZ	\N	9880
Ban Na Kham	TH	\N	15465
Spitalfields	GB	\N	10286
Meckenheim	DE	\N	24684
East Grand Forks	US	\N	8535
Statesboro	US	\N	42102
Hatsukaichi	JP	\N	114975
Hampton	US	\N	134510
Maqat	KZ	\N	14756
Atotonilco de Tula	MX	\N	31078
Medvezhyegorsk	RU	\N	14340
St. Stephens	US	\N	9254
Neuenburg	DE	\N	8206
Bobingen	DE	\N	17199
Businga	CD	\N	34247
Jedlicze	PL	\N	5766
Schorndorf	DE	\N	39634
Tanabe	JP	\N	70410
Torihama	JP	\N	9230
Brigham City	US	\N	19601
North Brunswick	US	\N	41948
Bidford-on-Avon	GB	\N	5350
Bay Minette	US	\N	8704
Ecorse	US	\N	9570
Hnust'a	SK	\N	7490
Qasigiannguit	GL	\N	1803
Duchcov	CZ	\N	8564
Ramblewood	US	\N	5765
Red Cliffs	AU	\N	5060
North Walsham	GB	\N	12634
Lockwood	US	\N	7479
Gazojak	TM	\N	24251
Hinton	CA	\N	9882
Backnang	DE	\N	37253
Yevpatoriya	UA	\N	106158
New Bern	US	\N	51308
Holly	US	\N	8313
Zarafshon Shahri	UZ	\N	54300
Wertingen	DE	\N	9294
Inverell	AU	\N	11660
Pisek	CZ	\N	30415
Ellettsville	US	\N	6747
Waxhaw	US	\N	17147
Itapetinga	BR	\N	59721
Grambling	US	\N	5150
Plumtree	ZW	\N	2148
Murwillumbah	AU	\N	7032
East Grand Rapids	US	\N	11956
Milnrow	GB	\N	13061
Mount Pearl Park	CA	\N	22957
Hendaye	FR	\N	16484
Gimli	CA	\N	6181
Bad Soden-Salmunster	DE	\N	13370
Norseman	AU	\N	581
Crigglestone	GB	\N	9271
Glastonbury	US	\N	34578
Zhukovskiy	RU	\N	107994
Osterburg	DE	\N	9782
McGregor	US	\N	8032
Serov	RU	\N	97762
West Allis	US	\N	59890
Upholland	GB	\N	7376
Galt	US	\N	27954
Kentville	CA	\N	12088
Inashiki	JP	\N	39854
Ayabe	JP	\N	32164
Claymont	US	\N	8676
Niagara Falls	US	\N	47720
Hobart	US	\N	27939
God	HU	\N	18218
Yuzha	RU	\N	12595
Wagin	AU	\N	1824
Brokenhead	CA	\N	5122
Fot	HU	\N	19674
Araouane	ML	\N	4026
Spring Valley Lake	US	\N	7744
Punta Prieta	MX	\N	112
Archdale	US	\N	11513
Griffith	US	\N	16060
Abovyan	AM	\N	44400
Yehud	IL	\N	11100
Amherst	US	\N	124952
Woodlesford	GB	\N	21010
Shediac	CA	\N	6664
Radebeul	DE	\N	34008
Goodmayes	GB	\N	13069
Sainte-Martine	CA	\N	5461
Bridgetown	US	\N	13824
Wellesbourne Hastings	GB	\N	5849
Higashi-asahikawa	JP	\N	8310
Acs	HU	\N	6771
Altentreptow	DE	\N	5307
Schelklingen	DE	\N	6883
Itapui	BR	\N	13328
Llandudno	GB	\N	20701
Stratmoor	US	\N	5883
Gosen	JP	\N	48360
Waldwick	US	\N	10108
Cerritos	US	\N	49859
Rittman	US	\N	6506
Ngaruawahia	NZ	\N	6580
Maridi	SS	\N	14224
Shimizucho	JP	\N	31974
Madinat Hamad	BH	\N	52700
Lake Stickney	US	\N	10584
Lake Montezuma	US	\N	5212
Taverny	FR	\N	26441
Nesher	IL	\N	23700
Cedar City	US	\N	39995
Daigo	JP	\N	16142
Mirfield	GB	\N	19563
Jesenice	CZ	\N	9682
Rosenberg	US	\N	38307
East Goshen	US	\N	18199
San Martin	US	\N	7010
Camillus	US	\N	24270
Gransee	DE	\N	5871
Mhlume	SZ	\N	7761
Mebane	US	\N	16262
Lipnik nad Becvou	CZ	\N	7982
Griesbach	DE	\N	9055
Hachirougata	JP	\N	5636
Chepelare	BG	\N	5262
Santa Cruz Zenzontepec	MX	\N	18512
New Iberia	US	\N	28454
McNair	US	\N	20771
Vitrolles	FR	\N	33310
Lake Township	US	\N	5150
Baar	CH	\N	24322
Leingarten	DE	\N	11633
Laatzen	DE	\N	41422
Vilyuchinsk	RU	\N	21973
Cordeiropolis	BR	\N	23234
Meadow Lake	CA	\N	5344
Georges	US	\N	6378
Romanshorn	CH	\N	11167
Aytos	BG	\N	24750
Salamanca	CL	\N	20214
Owosso	US	\N	21315
Newport-On-Tay	GB	\N	7922
Tredegar	GB	\N	15103
Regensdorf	CH	\N	18253
Cajuru	BR	\N	25230
Charles City	US	\N	7359
Kippax	GB	\N	9785
Filiasi	RO	\N	16900
Kandalaksha	RU	\N	31329
Apodi	BR	\N	16757
Bad Hall	AT	\N	5043
Sainte-Sophie	CA	\N	13375
Peterculter	GB	\N	7220
Waiuku	NZ	\N	9660
Centreville	US	\N	75452
West Concord	US	\N	7402
Wotton-under-Edge	GB	\N	5627
Castle Rock	US	\N	68484
Elkin	US	\N	6536
Wahrenbruck	DE	\N	5245
Qal`ah-ye Zal	AF	\N	18000
St. Andrews	US	\N	21494
Bronnitsy	RU	\N	22567
Penn Township	US	\N	16222
Ben Lomond	US	\N	7071
Clanwilliam	ZA	\N	7674
Pattensen	DE	\N	14636
Shively	US	\N	15689
Montelimar	FR	\N	61861
Interlaken	US	\N	7191
Alapayevsk	RU	\N	37526
Sakhnin	IL	\N	31100
Volodarsk	RU	\N	9972
Felsozsolca	HU	\N	6521
Glenarden	US	\N	6143
Nantucket	US	\N	11101
The Mumbles	GB	\N	16600
Spenge	DE	\N	14487
Stonegate	US	\N	9511
Hattingen	DE	\N	54562
Muxton	GB	\N	6557
Lake Wales	US	\N	16759
New Ulm	US	\N	13060
Broadwater	GB	\N	9373
Rodewisch	DE	\N	6359
Neenah	US	\N	26300
Cave Springs	US	\N	5276
Nacozari Viejo	MX	\N	11872
Rotenburg an der Fulda	DE	\N	14676
Moers	DE	\N	103725
Gravesend	GB	\N	74000
Kirkcaldy	GB	\N	50180
Novato	US	\N	55516
Fort Shawnee	US	\N	5960
Altensteig	DE	\N	10799
Hatfield	US	\N	17595
American Canyon	US	\N	20475
Santa Cruz das Palmeiras	BR	\N	32749
Kelso	US	\N	12417
Sukhinichi	RU	\N	14901
Beilstein	DE	\N	6195
La Junta	US	\N	7963
Lorraine	CA	\N	9352
Walkden	GB	\N	35616
Chusovoy	RU	\N	44779
Folkston	US	\N	12001
Botevgrad	BG	\N	22742
Central	US	\N	29357
Oleksandrivsk	UA	\N	6709
Kunisakimachi-tsurugawa	JP	\N	26549
`Akko	IL	\N	47675
Salair	RU	\N	7452
Hessisch Lichtenau	DE	\N	12359
Colwood	CA	\N	16859
Live Oak	US	\N	17390
Konnern	DE	\N	8261
Middle Smithfield	US	\N	15753
Seaton	GB	\N	8413
Burghausen	DE	\N	18701
Tobe	JP	\N	20653
Las Cruces	US	\N	136254
Garrett	US	\N	6413
Dalmatovo	RU	\N	12631
Saint-Philippe	CA	\N	5495
Auburn Hills	US	\N	24748
Gardendale	US	\N	14177
Conewago Township	US	\N	8124
Wisbech	GB	\N	33933
Chambly	CA	\N	29120
Knyaginino	RU	\N	6804
Khakhar	RU	\N	10
Momignies	BE	\N	5309
Vestal	US	\N	28162
Bidston	GB	\N	15216
Silver Spring	US	\N	79750
Radcliff	US	\N	22914
Las Piedras	UY	\N	71268
Malden	US	\N	60470
Iserlohn	DE	\N	92666
Palm Desert	US	\N	53275
North Bay Village	US	\N	8057
Dobeln	DE	\N	23829
Brooksville	US	\N	8564
Rio Grande da Serra	BR	\N	48302
San Ramon	PE	\N	14708
Casper	US	\N	67598
Lymington	GB	\N	15726
Pickering	CA	\N	91771
Antibes	FR	\N	72999
Frauenfeld	CH	\N	25442
Boischatel	CA	\N	6465
Karratha	AU	\N	16708
Nata	BW	\N	4794
Hamworthy	GB	\N	13141
South Bradenton	US	\N	25646
Welby	US	\N	16352
Schneverdingen	DE	\N	18662
Solana Beach	US	\N	13296
Ashburn	US	\N	50290
Florida Ridge	US	\N	21371
Safety Harbor	US	\N	18016
Melton Mowbray	GB	\N	27158
Blakely	US	\N	6210
Fatezh	RU	\N	5951
Sandorfalva	HU	\N	7756
Lakeland South	US	\N	13849
Gujan-Mestras	FR	\N	21152
South Valley Stream	US	\N	6930
Yaita	JP	\N	31617
Livingston	US	\N	29698
Put' Lenina	RU	\N	298
Forks	US	\N	15336
Tecumseh	CA	\N	23229
Kalyani	IN	\N	100575
Brits	ZA	\N	122497
Domburg	SR	\N	5500
Moosic	US	\N	5832
Balboa	PA	\N	62882
Lanark	GB	\N	8253
Droylsden	GB	\N	22689
Baldwin Park	US	\N	75251
Granollers	ES	\N	61275
Calan	RO	\N	11279
Twinsburg	US	\N	18856
Khartsyzk	UA	\N	59763
Guercif	MA	\N	90880
Charqueada	BR	\N	16440
Solikamsk	RU	\N	94628
Jacksonville Beach	US	\N	23628
Olivet	FR	\N	21951
Byron Center	US	\N	6710
Sertolovo	RU	\N	54497
Pancota	RO	\N	6946
East Lake	US	\N	32315
Ewa Villages	US	\N	7118
Gorebridge	GB	\N	5777
Tasnad	RO	\N	8631
Akabira	JP	\N	9971
Wadi Halfa'	SD	\N	17121
Hipperholme	GB	\N	11308
Campton Hills	US	\N	11091
Hradek nad Nisou	CZ	\N	7735
Novopavlovsk	RU	\N	26106
Tobati	PY	\N	23295
Joso	JP	\N	59647
Hosa'ina	ET	\N	89300
Bridgton	US	\N	5369
Pennsauken	US	\N	35638
Nagari	IN	\N	62253
Gluckstadt	DE	\N	11069
Laguna	BR	\N	39711
Danvers	US	\N	27631
Kitakoriyamacho	JP	\N	84820
Skidaway Island	US	\N	8783
Canfield	US	\N	7176
Helmbrechts	DE	\N	8413
Pound Ridge	US	\N	5185
French Valley	US	\N	33818
Montclair	US	\N	40083
Kawasaki	JP	\N	15370
Lutz	US	\N	21456
Tunkhannock Township	US	\N	6703
North Berwick	GB	\N	6605
Conover	US	\N	8540
Usol'ye-Sibirskoye	RU	\N	77407
Watervliet	US	\N	9900
Weslaco	US	\N	41629
Ypsilanti	US	\N	20171
Post Falls	US	\N	36250
Piquete	BR	\N	14123
Colditz	DE	\N	8472
Buguruslan	RU	\N	49737
Uyuni	BO	\N	26958
Aylestone	GB	\N	11151
Nierstein	DE	\N	8443
Zaio	MA	\N	35806
Hertford	GB	\N	26783
Caerleon	GB	\N	8061
Salem Township	US	\N	6533
Artesia	US	\N	16601
Diamondhead	US	\N	7504
Marquette	US	\N	26491
Lake Country	CA	\N	12922
Waconia	US	\N	12428
Pine Township	US	\N	12881
Festus	US	\N	12036
Maynard	US	\N	10600
Rock Island	US	\N	37176
Hambantota	LK	\N	11213
Haverstraw	US	\N	37165
Butare	RW	\N	50220
Oatlands	AU	\N	1157
Kermit	US	\N	6613
Tashtagol	RU	\N	23107
Cove	GB	\N	6548
Mount Lebanon	US	\N	32540
Lander	US	\N	7197
Hagenow	DE	\N	12137
Aylsham	GB	\N	5504
Denham Springs	US	\N	9753
Khenifra	MA	\N	117510
Georgetown	AU	\N	348
Upper Nazareth	US	\N	6764
Alhambra	US	\N	83750
Drayton Valley	CA	\N	7235
Westerly	US	\N	22624
Palmetto Estates	US	\N	15970
Futtsu	JP	\N	43213
Minokamo	JP	\N	56804
Dyersburg	US	\N	20839
St. Thomas	CA	\N	61707
Marignane	FR	\N	32920
Mineral Wells	US	\N	14597
Natick	US	\N	36083
Talence	FR	\N	42606
Frodsham	GB	\N	9077
Socuellamos	ES	\N	12139
Fernie	CA	\N	5249
Mentor	US	\N	47262
Talanga	HN	\N	13533
Grimmen	DE	\N	9572
Redstone	US	\N	5392
Yamba	AU	\N	6076
Moguer	ES	\N	22088
Carletonville	ZA	\N	23000
Grimsby	CA	\N	27314
Mpika	ZM	\N	28445
Anisoc	GQ	\N	16626
Knik-Fairview	US	\N	17513
Pessac	FR	\N	63808
Guapua	BR	\N	8260
Rychvald	CZ	\N	7536
Prunedale	US	\N	19584
West Vincent	US	\N	5257
Velsk	RU	\N	22776
Warwick	US	\N	81004
Weisswasser	DE	\N	16130
Nagahama	JP	\N	115069
Chaville	FR	\N	20520
Mickleover	GB	\N	18000
Varel	DE	\N	24001
Charter Oak	US	\N	9760
Karvina	CZ	\N	52128
Orangetown	US	\N	50046
Australind	AU	\N	14539
Gerbstedt	DE	\N	7110
Rreshen	AL	\N	8803
Happy Valley	US	\N	22553
Taguai	BR	\N	12586
Pitman	US	\N	8741
Pofadder	ZA	\N	4220
Nymburk	CZ	\N	15154
Signal Hill	US	\N	11421
Venice Gardens	US	\N	8370
Sertaozinho	BR	\N	120152
Barmstedt	DE	\N	10368
Padangpanjang	ID	\N	52422
Dilijan	AM	\N	16600
Whitemarsh	US	\N	17811
Stamford	GB	\N	19701
Lititz	US	\N	9465
Cruzeiro do Sul	BR	\N	56862
Stakhanov	UA	\N	75745
Las Delicias	MX	\N	114783
Watford City	US	\N	7835
La Madeleine	FR	\N	21173
Cortlandt	US	\N	42446
Broughton Astley	GB	\N	11940
Neuffen	DE	\N	6299
Tarabuco	BO	\N	2428
Reggane	DZ	\N	32974
Landover	US	\N	22041
Manfalut	EG	\N	82585
Nizhneudinsk	RU	\N	33918
Tarma	PE	\N	54078
Fehring	AT	\N	7284
Otaki	JP	\N	9049
Cinnaminson	US	\N	16493
Fountainebleau	US	\N	59833
Ambanja	MG	\N	30621
Amalapuram	IN	\N	53231
Whitby	CA	\N	128377
Sunset Hills	US	\N	8447
Luckau	DE	\N	9582
Belousovo	RU	\N	9288
White Center	US	\N	15852
Gikongoro	RW	\N	16695
Paloncha	IN	\N	80199
Lage	DE	\N	35047
Kafue	ZM	\N	47554
Canal Winchester	US	\N	8818
Santa Branca	BR	\N	14534
Fond du Lac	US	\N	55209
Chislehurst	GB	\N	14831
South Strabane	US	\N	9479
Homer	US	\N	6261
Fallsburg	US	\N	12882
Tamworth	AU	\N	42872
Canutillo	US	\N	5061
Slanic	RO	\N	6034
Fieni	RO	\N	7587
Pike Road	US	\N	10159
Santee	US	\N	58081
Olival	PT	\N	5812
Sao Jose do Rio Pardo	BR	\N	54388
Waltershausen	DE	\N	12973
Nadym	RU	\N	44940
Spanish Fork	US	\N	40913
Ettersburg	DE	\N	7097
Suvorovo	BG	\N	5214
Great Billing	GB	\N	8457
Porto Rafti	GR	\N	9686
Amqui	CA	\N	6322
Terrebonne	CA	\N	111575
Alenquer	BR	\N	26290
Vanju-Mare	RO	\N	5311
Cottenham	GB	\N	6095
Amara	RO	\N	7345
Marienberg	DE	\N	17097
Hadishahr	IR	\N	27842
Slave Lake	CA	\N	6651
Forchtenberg	DE	\N	5057
Bartlesville	US	\N	39301
Taunton	GB	\N	60479
Enola	US	\N	6574
Bangor Base	US	\N	6336
Hurricane	US	\N	22666
Auriflama	BR	\N	14961
Williams Lake	CA	\N	10753
Qarqaraly	KZ	\N	8195
Fort Wright	US	\N	5745
Khed Brahma	IN	\N	25001
Union Gap	US	\N	6200
Combarbala	CL	\N	5134
The Colony	US	\N	44438
Tomiya	JP	\N	51889
Ciudad de Ceuta	ES	\N	84777
East Rutherford	US	\N	9687
Flossmoor	US	\N	9155
Plochingen	DE	\N	14433
Littlestown	US	\N	6409
Trochtelfingen	DE	\N	6366
Pevek	RU	\N	4053
Morris Plains	US	\N	6255
Vinton	US	\N	8104
Katsuura	JP	\N	17324
Atacames	EC	\N	15463
Madeley	GB	\N	17935
Senden	DE	\N	22336
Ferney-Voltaire	FR	\N	9766
Rasnov	RO	\N	15022
Severinia	BR	\N	16806
Rajaori	IN	\N	41552
West Hartford	US	\N	63127
Brecon	GB	\N	8250
Znojmo	CZ	\N	33765
Millbrae	US	\N	22394
Ibikon	CH	\N	13610
Pinecrest	US	\N	19155
Lilan	CN	\N	114496
Bailey's Crossroads	US	\N	24570
Edenbridge	GB	\N	7808
Kingaroy	AU	\N	10398
Ochsenhausen	DE	\N	8856
North Bellmore	US	\N	20269
Gubkin	RU	\N	86780
Old Fig Garden	US	\N	5529
Alsip	US	\N	18709
Dobrany	CZ	\N	6145
Kumbo	CM	\N	125486
Kavaje	AL	\N	29354
La Riviera	US	\N	10851
Brockport	US	\N	19764
Chena Ridge	US	\N	5903
Wulfrath	DE	\N	21035
Victoria Falls	ZW	\N	33060
Parkwood	US	\N	6700
Arolsen	DE	\N	15470
Drexel Hill	US	\N	28188
Shirley	GB	\N	14296
Sullivan City	US	\N	5932
Rogersville	US	\N	6380
Walterboro	US	\N	9550
Montrose	GB	\N	11955
Strelka	RU	\N	10
Maracai	BR	\N	13913
Dollis Hill	GB	\N	14425
Bom Jesus da Lapa	BR	\N	40691
Penzberg	DE	\N	16586
Bad Lauterberg	DE	\N	10269
Leamington	CA	\N	32991
Jagtial	IN	\N	53213
Vine Grove	US	\N	6439
Delta	CA	\N	102238
Pico Truncado	AR	\N	20889
Ghadamis	LY	\N	6623
Polmont	GB	\N	5321
Maple Valley	US	\N	27202
Blackwell	US	\N	6399
Selkirk	CA	\N	10278
Bay St. Louis	US	\N	14034
Rancho Calaveras	US	\N	7035
Lyss	CH	\N	15279
Prieska	ZA	\N	11236
Puerto San Jose	GT	\N	23887
Greer	US	\N	33373
Angren	UZ	\N	126962
Rocky Hill	US	\N	20137
Maumelle	US	\N	18199
Kami-kawabe	JP	\N	9902
Velas	PT	\N	5398
Razlog	BG	\N	13158
Malverne	US	\N	8485
Kaupanger	NO	\N	1965
Bilton	GB	\N	6175
Silverton	US	\N	11068
Caratinga	BR	\N	60066
Morrinhos	BR	\N	34143
Kahla	DE	\N	6822
Strathroy-Caradoc	CA	\N	20867
Fushe-Kruje	AL	\N	18477
Bad Camberg	DE	\N	14263
Wildberg	DE	\N	10069
Komarno	SK	\N	36596
Boultham	GB	\N	7465
Ban Phru	TH	\N	23518
Casma	PE	\N	30000
Kireyevsk	RU	\N	25741
Kilmore	AU	\N	7958
Dolni Chiflik	BG	\N	7557
Plumstead	GB	\N	16736
McMasterville	CA	\N	5615
Elma	US	\N	11718
Newport Beach	US	\N	84534
Mockmuhl	DE	\N	8078
Ajacuba	MX	\N	17055
Kirkstall	GB	\N	20673
Roshal	RU	\N	20418
Moston	GB	\N	14518
Baden	CH	\N	19122
Santa Cruz do Rio Pardo	BR	\N	46633
Preetz	DE	\N	15958
Berkley	US	\N	15366
Adigrat	ET	\N	76400
Byfleet	GB	\N	7724
Nakayama	JP	\N	10800
Guntersville	US	\N	8571
New Philadelphia	US	\N	46698
Felling	GB	\N	8908
Ujfeherto	HU	\N	12736
Central Huron	CA	\N	7576
Seligenstadt	DE	\N	21293
Ogoshi	JP	\N	61531
Crestwood Village	US	\N	8164
Conception Bay South	CA	\N	26199
Soltau	DE	\N	21317
Frenstat pod Radhostem	CZ	\N	10837
Dartmouth	US	\N	34286
San Marino	US	\N	13048
Bad Wimpfen	DE	\N	7359
Zhizdra	RU	\N	5461
Terrace Heights	US	\N	8273
Perth	CA	\N	5930
McCandless	US	\N	28582
Wawarsing	US	\N	12900
Inabe	JP	\N	45454
Suhr	CH	\N	10424
Amora	PT	\N	48629
Dagenham	GB	\N	106247
Warrenton	US	\N	10027
Minamishibetsucho	JP	\N	18652
Hunfeld	DE	\N	16512
Tahlequah	US	\N	19773
Montigny-les-Cormeilles	FR	\N	21601
Kirkham	GB	\N	7194
Lacy-Lakeview	US	\N	6721
Silverdale	US	\N	21071
Venissieux	FR	\N	65894
Armant	EG	\N	76457
Eumseong	KR	\N	10077
Motosu	JP	\N	33054
Broadview Heights	US	\N	19102
North Weeki Wachee	US	\N	7853
West Athens	US	\N	8574
San Leandro	US	\N	88815
West Carrollton	US	\N	12864
Spisska Bela	SK	\N	6657
Marasesti	RO	\N	10671
Kodaikanal	IN	\N	36501
Zierenberg	DE	\N	6592
Coteau-du-Lac	CA	\N	7044
King City	US	\N	15887
Lehrte	DE	\N	43999
Lgov	RU	\N	18774
Guryevsk	RU	\N	22872
Anklam	DE	\N	12385
Diss	GB	\N	7572
La Louviere	BE	\N	80986
Coamo	PR	\N	11148
Same	TZ	\N	17455
Cobh	IE	\N	12347
Ephraim	US	\N	6886
Grossrohrsdorf	DE	\N	9666
Al Qasr	EG	\N	1716
Ferriday	US	\N	5412
Val-des-Monts	CA	\N	11582
Oranjestad	AW	\N	34980
San German	PR	\N	11117
North Liberty	US	\N	19501
New Carrollton	US	\N	12928
Mlada Boleslav	CZ	\N	44740
Denison	US	\N	25529
Himamaylan	PH	\N	106880
Arcozelo	PT	\N	12393
Iharana	MG	\N	15000
Lugoff	US	\N	8360
Litchfield Park	US	\N	6436
Villars-sur-Glane	CH	\N	12092
Irapua	BR	\N	7774
Essex Junction	US	\N	10852
Flat Rock	US	\N	10004
Plasencia	ES	\N	39913
Cooranbong	AU	\N	5449
Itasca	US	\N	9805
Burrillville	US	\N	16453
Tabuse	JP	\N	14753
Hnivan'	UA	\N	12433
Skhirate	MA	\N	59775
Lengenfeld	DE	\N	7118
Biharamulo	TZ	\N	34038
Cerqueira Cesar	BR	\N	19109
Puerto Villamil	EC	\N	2200
Doney Park	US	\N	5352
Gloversville	US	\N	27512
Eloy	US	\N	19625
Countryside	US	\N	10042
Kukmor	RU	\N	17815
Daytona Beach	US	\N	69186
Sidley	GB	\N	5718
Barton upon Irwell	GB	\N	12462
Lobnya	RU	\N	88220
Carleton Place	CA	\N	11901
Onteniente	ES	\N	35347
Lyaskovets	BG	\N	8728
Pomaz	HU	\N	17139
Rayachoti	IN	\N	91234
Higashiyamato	JP	\N	84223
Attalla	US	\N	5771
Kodinsk	RU	\N	16116
Middle Island	US	\N	10216
Wheatfield	US	\N	18179
Kimitsu	JP	\N	82548
Laishevo	RU	\N	8604
Gryfow Slaski	PL	\N	6943
Mundra	IN	\N	20338
Cathedral City	US	\N	55007
Thalheim	DE	\N	6051
Diamantina	BR	\N	37343
LaBelle	US	\N	13563
Roby	GB	\N	7254
Cesky Brod	CZ	\N	7049
Busselton	AU	\N	25329
Sakaiminato	JP	\N	32837
Valrico	US	\N	38169
Kasaishi	JP	\N	12266
Knightdale	US	\N	17843
Wellingborough	GB	\N	49128
Brushy Creek	US	\N	20024
Fort Plain	US	\N	5488
Pingree Grove	US	\N	9874
Torrelavega	ES	\N	51494
Winnemucca	US	\N	10764
Tangermunde	DE	\N	10310
Vellmar	DE	\N	18134
Keyser	US	\N	6361
Studenka	CZ	\N	9477
Naqadah	EG	\N	21530
Skiatook	US	\N	7367
Lake Oswego	US	\N	39822
Secaucus	US	\N	21893
Teofilo Otoni	BR	\N	101170
Villarrobledo	ES	\N	25184
Ballenstedt	DE	\N	8940
Leopold	AU	\N	12814
Abohar	IN	\N	130603
Everett	US	\N	111475
Parole	US	\N	16232
Wittenburg	DE	\N	6313
Forestville	US	\N	11719
Kovda	RU	\N	20
Ajax	CA	\N	119677
Faget	RO	\N	6761
Bingen am Rhein	DE	\N	25659
Stratford	CA	\N	31465
San Ramon	US	\N	75995
Eldersburg	US	\N	31454
Lala Musa	PK	\N	67283
Caluula	SO	\N	513
Devarkonda	IN	\N	29731
Elektrougli	RU	\N	20823
North Lindenhurst	US	\N	10584
Colby	US	\N	5445
Rossford	US	\N	6562
Rhede	DE	\N	19328
Komsomolsk	RU	\N	8189
Goodyear	US	\N	86840
Wilkinsburg	US	\N	15292
Ahaus	DE	\N	39223
Rye	US	\N	46636
Lara	AU	\N	16355
Roth	DE	\N	25593
Stoughton	US	\N	28534
Messstetten	DE	\N	10653
Fruit Heights	US	\N	6221
Watford	GB	\N	96800
Miryang	KR	\N	103069
Radnevo	BG	\N	13554
Edgewood	US	\N	26219
Plattling	DE	\N	13043
Hybla Valley	US	\N	16325
Garching bei Munchen	DE	\N	17711
Amity	US	\N	12924
Clute	US	\N	11690
Longwood	US	\N	15561
Fonte Boa	BR	\N	16060
Yeniseysk	RU	\N	19920
Bady Bassitt	BR	\N	16359
Debre Birhan	ET	\N	65231
Neusass	DE	\N	22058
Rio Mayo	AR	\N	1825
Luanza	CD	\N	861
Morris	US	\N	22302
Yaremche	UA	\N	8094
Rockwood	CA	\N	7823
Rumia	PL	\N	47148
Tangerhutte	DE	\N	10718
Sedgefield	GB	\N	5211
Federal Heights	US	\N	12827
Mexia	US	\N	6792
Santa Cruz	PT	\N	43005
Chumikan	RU	\N	1305
Val-d'Or	CA	\N	31862
Bocholt	DE	\N	71099
Creve Coeur	US	\N	18622
East Haven	US	\N	28860
Halluin	FR	\N	20800
Calimesa	US	\N	9160
Wemding	DE	\N	5802
Bay City	US	\N	66107
Daly City	US	\N	106280
Cessnock	AU	\N	21725
Zaozernyy	RU	\N	10286
Yakossi	CF	\N	500
Kuna	US	\N	22292
Cinderford	GB	\N	8494
Wombwell	GB	\N	15316
Luisiania	BR	\N	5511
Kingston Estates	US	\N	6346
Belchertown	US	\N	14967
East Ham	GB	\N	76186
Saddlebrooke	US	\N	10530
Bluefield	US	\N	40640
Carnot	CF	\N	45421
Zambezi	ZM	\N	7074
Northwest Harborcreek	US	\N	9034
Ardino	BG	\N	10336
Affton	US	\N	20187
Podborany	CZ	\N	6386
Salamanca	US	\N	5330
St. Peters	US	\N	58212
Bezons	FR	\N	29383
Mapleton	US	\N	10731
Streetly	GB	\N	13934
Stratham	US	\N	7418
Bassersdorf	CH	\N	11593
Bountiful	US	\N	43981
Wittingen	DE	\N	11503
Point Pleasant	US	\N	18772
Dock Sur	AR	\N	35897
Canico	PT	\N	23361
Manorville	US	\N	14405
Grenada	US	\N	9782
Pedro Vicente Maldonado	EC	\N	5561
Mossingen	DE	\N	20480
Frontignan	FR	\N	22762
Minnehaha	US	\N	12092
Owani	JP	\N	8832
Hampstead	CA	\N	7153
Scott Township	US	\N	16720
Monaca	US	\N	5421
Noshiromachi	JP	\N	50842
Cannes	FR	\N	73868
Quartz Hill	US	\N	10164
Runkel	DE	\N	9303
Saint-Bruno-de-Montarville	CA	\N	26107
Longboat Key	US	\N	7296
Khoni	GE	\N	8987
Buffalo Township	US	\N	7280
Tsuiki	JP	\N	17356
Gotenba	JP	\N	87078
Perth	GB	\N	46960
Horsham	US	\N	26495
Cinco Ranch	US	\N	16977
Bliss Corner	US	\N	5137
Crediton	GB	\N	7835
Shuangcheng	CN	\N	130710
Sumter	US	\N	71518
Bujor	RO	\N	6299
Bergen	DE	\N	13556
Bastia	FR	\N	45715
Hednesford	GB	\N	17343
Chefchaouene	MA	\N	42786
Sandersville	US	\N	6655
Waynesboro	US	\N	26694
Beringovskiy	RU	\N	1861
Blaine	US	\N	65607
Cherry Hills Village	US	\N	6647
Ardon	RU	\N	19412
Petal	US	\N	10632
Rio Rancho	US	\N	99178
Bohlen	DE	\N	6687
Cenon	FR	\N	24729
Ch'arents'avan	AM	\N	25039
Et Tira	IL	\N	10200
Rio Tinto	PT	\N	50713
Howland Center	US	\N	6400
Holice	CZ	\N	6581
Chipping Norton	GB	\N	6337
North Salem	US	\N	5172
Olenegorsk	RU	\N	20847
Whitefish Bay	US	\N	13783
Corner Brook	CA	\N	19806
Pervouralsk	RU	\N	124447
Itupeva	BR	\N	54128
Enfield	GB	\N	132640
Union Township	US	\N	5735
Combs-la-Ville	FR	\N	22383
Celina	US	\N	16299
Hampden	US	\N	29642
Haslingden	GB	\N	16849
South Hooksett	US	\N	5811
Ureshinomachi-shimojuku	JP	\N	26349
Kouango	CF	\N	6984
Penryn	GB	\N	6812
Billinge	GB	\N	6554
Calabayan	PH	\N	129523
Liski	RU	\N	53897
Nea Kallikrateia	GR	\N	7238
Fishersville	US	\N	8252
Milton-Freewater	US	\N	7074
Spring Lake Park	US	\N	6919
San Tan Valley	US	\N	93230
Rheinau	DE	\N	11395
Coal City	US	\N	5409
Draksharama	IN	\N	9299
Bloomingdale	US	\N	23758
Santa Lucia	BR	\N	8687
Wilsonville	US	\N	24918
Huanta	PE	\N	30234
Fatehpur Sikri	IN	\N	32905
Clausthal	DE	\N	7741
North Union	US	\N	12342
Corinth	US	\N	22099
Mons-en-Baroeul	FR	\N	20782
Zhukovka	RU	\N	16878
Hainburg an der Donau	AT	\N	6570
Martinsburg	US	\N	17454
Monterey Park	US	\N	59669
Perrysburg	US	\N	21626
Blackburn	GB	\N	117963
Novozybkov	RU	\N	39725
Lorch	DE	\N	10885
Mount Eliza	AU	\N	17888
Valea lui Mihai	RO	\N	9902
Sankt Andra	AT	\N	9957
Manja	MG	\N	1536
Vegreville	CA	\N	5708
Udomlya	RU	\N	28119
Big Rapids	US	\N	13921
Darton	GB	\N	21345
Monfort Heights	US	\N	13064
Wentworth Falls	AU	\N	6076
Palo Alto	US	\N	65364
Chittaurgarh	IN	\N	116406
Port Washington	US	\N	15600
Krasnotur'insk	RU	\N	57514
Jaisalmer	IN	\N	65471
Wright	US	\N	22991
Chomutov	CZ	\N	48635
Milford city	US	\N	53195
Holbrook	US	\N	26286
Belovo	RU	\N	72519
Asbestos	CA	\N	7096
Whitehall	US	\N	27404
Alameda	US	\N	77624
Argun	RU	\N	37373
Lawndale	US	\N	32389
Adwick le Street	GB	\N	15911
Centereach	US	\N	32028
Brossard	CA	\N	85721
Mapiri	BO	\N	16520
Mamaroneck	US	\N	29721
Leisure World	US	\N	9321
Harburg	DE	\N	5535
Dexter	US	\N	8996
Temecula	US	\N	114761
Middlesex	US	\N	13679
Bagneux	FR	\N	40918
Lincolnwood	US	\N	12245
Moengo	SR	\N	8252
Anaconda	US	\N	6065
Kinnelon	US	\N	9896
Ceska Trebova	CZ	\N	15384
Hengoed	GB	\N	5548
Blanchard	US	\N	8907
Woodstock	CA	\N	40902
Ferrenafe	PE	\N	31777
Bull Run	US	\N	15683
P'ungsan	KP	\N	3839
Binga	CD	\N	64639
Tendo	JP	\N	62032
Hoddesdon	GB	\N	20250
Sharbaqty	KZ	\N	107
Kothapet	IN	\N	57583
Kurayoshi	JP	\N	46943
Nagaoka	JP	\N	80514
Saugus	US	\N	28158
Balzar	EC	\N	28794
Estacada	US	\N	5368
Vyborg	RU	\N	78457
Olivehurst	US	\N	13309
Banos	EC	\N	12995
Takahagi	JP	\N	27863
Kanzakimachi-kanzaki	JP	\N	31365
Penola	AU	\N	1312
Hazle	US	\N	9520
Chepstow	GB	\N	12350
Fianga	TD	\N	42606
Zifta	EG	\N	93740
Souderton	US	\N	7082
Lipova	RO	\N	10313
Wood Buffalo	CA	\N	71589
Brownville	US	\N	6213
Narre Warren North	AU	\N	7674
Saiki	JP	\N	67931
Hohr-Grenzhausen	DE	\N	9260
Ruston	US	\N	27717
Fairview Shores	US	\N	11254
Escanaba	US	\N	20094
Cardonal	MX	\N	15876
Kew Green	GB	\N	14915
Urdaneta	PH	\N	132940
Asbury Lake	US	\N	9510
Wingham	AU	\N	5374
Payette	US	\N	7727
Pitangueiras	BR	\N	38211
Jangaon	IN	\N	52394
Phelan	US	\N	15532
Lago Vista	US	\N	6604
Lower Swatara	US	\N	8788
Aqadyr	KZ	\N	9710
Rainham	GB	\N	25000
Vicuna	CL	\N	13496
Friedrichshafen	DE	\N	60865
Urdorf	CH	\N	9768
Florissant	US	\N	50952
Rhinebeck	US	\N	7768
Clayton	GB	\N	16982
Sandwich	US	\N	20342
Holland	US	\N	100432
Rock Falls	US	\N	8740
Meudon	FR	\N	45352
Gas City	US	\N	5772
Toyooka	JP	\N	78299
Irymple	AU	\N	5325
Aich	DE	\N	9901
Chambarak	AM	\N	5850
Monahans	US	\N	8639
Oakton	US	\N	37185
Bacchus Marsh	AU	\N	22223
Tulbagh	ZA	\N	8969
Ratingen	DE	\N	87297
Hofn	IS	\N	2389
Victor	US	\N	14790
Bon Air	US	\N	17764
Palestine	US	\N	18243
Dubasari	MD	\N	28500
Prum	DE	\N	5438
Malone	US	\N	14354
Oiapoque	BR	\N	24263
Zelezny Brod	CZ	\N	6051
Shinkai	JP	\N	75265
Nossen	DE	\N	10598
Orchards	US	\N	23020
Church	GB	\N	5186
Plopeni	RO	\N	7718
Lockport	US	\N	34561
Kitanagoya	JP	\N	85899
Ghinda'e	ER	\N	11560
El Paso de Robles	US	\N	70248
Polch	DE	\N	6821
Kroonstad	ZA	\N	103992
Marsberg	DE	\N	19640
Hopatcong	US	\N	14186
Plymouth	US	\N	79768
Novoaltaysk	RU	\N	73439
Mayfield Heights	US	\N	18487
Makinohara	JP	\N	44111
Annweiler am Trifels	DE	\N	7081
Le Locle	CH	\N	10433
San Anselmo	US	\N	12476
Windlesham	GB	\N	16775
Nagyhalasz	HU	\N	5676
Brasileia	BR	\N	24765
Barton on Sea	GB	\N	5454
Mahopac	US	\N	8426
Pedro de Toledo	BR	\N	10967
Pribor	CZ	\N	8476
Zaysan	KZ	\N	17600
DeFuniak Springs	US	\N	7823
Otake	JP	\N	26796
Myski	RU	\N	41379
Kimberley	CA	\N	7425
Jaszarokszallas	HU	\N	7691
Kirchheim unter Teck	DE	\N	40523
Shemonaikha	KZ	\N	19127
Brunsbuttel	DE	\N	12554
Bishopbriggs	GB	\N	23820
Herriman	US	\N	51348
Chapel en le Frith	GB	\N	8635
Trent Lakes	CA	\N	5397
Kulpsville	US	\N	8208
Pinhalzinho	BR	\N	14423
Erdington	GB	\N	22828
Roissy-en-Brie	FR	\N	22994
Mukilteo	US	\N	21441
Silvis	US	\N	7475
Poway	US	\N	49323
Adrogue	AR	\N	28265
Kulsheim	DE	\N	5122
Kafr Shukr	EG	\N	23390
Kushva	RU	\N	28060
Blue Island	US	\N	22899
St. Martin	US	\N	8203
Ventnor	GB	\N	5976
Gifford	US	\N	9679
Jeffrey's Bay	ZA	\N	27107
Drobak	NO	\N	13393
Cwmbran	GB	\N	48535
Ephrata	US	\N	13862
Deming	US	\N	13924
Port Talbot	GB	\N	37276
Moores Mill	US	\N	6815
Bowleys Quarters	US	\N	6519
Topolovgrad	BG	\N	5659
Brislington	GB	\N	11511
Erseke	AL	\N	3746
Garliava	LT	\N	10324
South Fayette	US	\N	15503
Slantsy	RU	\N	32508
Tuncurry	AU	\N	6186
Naie	JP	\N	5362
Gunnison	US	\N	7195
Gitarama	RW	\N	87613
Lauingen	DE	\N	11000
Ris-Orangis	FR	\N	29225
Santa Rosa	EC	\N	48929
Stratton Saint Margaret	GB	\N	22698
Feres	GR	\N	5457
Staines-upon-Thames	GB	\N	18484
Grayson	US	\N	5277
Urbana	US	\N	42214
Seacombe	GB	\N	15387
Quedlinburg	DE	\N	23989
Belle Plaine	US	\N	6660
Zwingenberg	DE	\N	7171
Calne	GB	\N	17274
Wellesley	CA	\N	11260
Burton upon Trent	GB	\N	72299
Boonton	US	\N	8919
Vrbove	SK	\N	5969
East Massapequa	US	\N	18331
Felton	GB	\N	10607
Sumiyama	JP	\N	15399
Schiltigheim	FR	\N	31894
Stansted Mountfitchet	GB	\N	6011
Banff	CA	\N	7847
Obanazawa	JP	\N	15332
Hosan	KR	\N	124246
Campbell	US	\N	41793
Covasna	RO	\N	10114
Kalmiuske	UA	\N	11603
Hilltown	US	\N	15321
Maidenhead	GB	\N	69309
Inverness	GB	\N	70000
Wernigerode	DE	\N	32733
Heiligenhafen	DE	\N	9211
Richmond Hill	US	\N	13839
Baldock	GB	\N	9900
Finsterwalde	DE	\N	16220
Almenara	BR	\N	29333
Scottsburg	US	\N	11408
Bento Goncalves	BR	\N	94271
Panama City Beach	US	\N	12583
Wildwood	US	\N	35432
Tajimi	JP	\N	107535
Moses Lake	US	\N	39002
Wollert	AU	\N	9060
Jimbolia	RO	\N	13597
Arran-Elderslie	CA	\N	6803
Zachary	US	\N	17949
Abuna	BR	\N	1929
Linstead	JM	\N	22757
St. Robert	US	\N	6275
Westwood Lakes	US	\N	12121
Granite Shoals	US	\N	5774
Milagro	EC	\N	133508
Grand Haven	US	\N	11047
Kaizu	JP	\N	33178
Talent	US	\N	6608
Fox Chapel	US	\N	5076
New Kensington	US	\N	12292
Lake Carmel	US	\N	8114
Tiny	CA	\N	11787
Iwakuni	JP	\N	130372
Vereya	RU	\N	5123
Rib Mountain	US	\N	6033
Meerane	DE	\N	14208
Brierley Hill	GB	\N	13935
Bischofswerda	DE	\N	10883
Whiston	GB	\N	5042
Willard	US	\N	6086
Sychevka	RU	\N	8220
Ramos Mejia	AR	\N	120346
Kapolei	US	\N	21474
Ladera Heights	US	\N	7090
Crawfordsville	US	\N	18242
Shichinohe	JP	\N	14681
Puslinch	CA	\N	7336
Pirajui	BR	\N	24546
Filderstadt	DE	\N	45813
Daule	EC	\N	65145
Glen Ridge	US	\N	7574
Conceicao do Araguaia	BR	\N	27115
Kalaoa	US	\N	11604
Lucerne Valley	US	\N	5423
Uvaly	CZ	\N	6884
Bungay	GB	\N	5127
Murray	US	\N	48917
Boxberg	DE	\N	6664
Hayden	US	\N	15434
Tsuno	JP	\N	10028
Nyaungdon	MM	\N	36172
Hazleton	US	\N	55604
Strehaia	RO	\N	10506
Safonovo	RU	\N	42147
Bicester	GB	\N	32642
Holiday City-Berkeley	US	\N	12360
Zeghanghane	MA	\N	34025
Bruhl	DE	\N	44397
Gronau	DE	\N	48072
Carlton Colville	GB	\N	8505
Emsworth	GB	\N	9492
Carrboro	US	\N	21190
Muncy	US	\N	9245
South San Francisco	US	\N	67789
Niala Kondapalle	IN	\N	7767
Quarryville	US	\N	7741
Champdani	IN	\N	111251
Crowthorne	GB	\N	6711
Groditz	DE	\N	7125
King of Prussia	US	\N	20428
Picture Rocks	US	\N	9452
Kihei	US	\N	21879
Ridley	US	\N	31117
Azandarian	IR	\N	8685
Waterboro	US	\N	7803
Velburg	DE	\N	5312
Biritiba-Mirim	BR	\N	31158
Gettysburg	US	\N	7724
Murten	CH	\N	8222
Peachland	CA	\N	5428
Gardnerville Ranchos	US	\N	11274
LaGrange	US	\N	35721
Warragul	AU	\N	14276
American Fork	US	\N	33161
Roselle	US	\N	22463
Cowell	AU	\N	1109
Guaxupe	BR	\N	47889
Vicente Lopez	AR	\N	22419
Consett	GB	\N	24828
Annandale	US	\N	43729
Cortez	US	\N	8630
Trotwood	US	\N	24403
Claygate	GB	\N	7168
Rhymney	GB	\N	8845
Braunlage	DE	\N	5854
Coleford	GB	\N	8359
Tabaco	PH	\N	133868
South Gate	US	\N	93444
Richland Hills	US	\N	7953
Fort Lee	US	\N	38605
Creel	MX	\N	5026
Holzgerlingen	DE	\N	13103
Bodupal	IN	\N	43692
Burnet	US	\N	5808
Zavodske	UA	\N	8180
Aya	JP	\N	7023
Ertil	RU	\N	10265
Linda	US	\N	19314
Rosedale	US	\N	19336
Waghausel	DE	\N	20935
Sharg`un	UZ	\N	10716
Amarapura	MM	\N	23200
Valley Center	US	\N	9059
Leichlingen	DE	\N	28031
Seal Beach	US	\N	23896
Quickborn	DE	\N	21296
Kelishad va Sudarjan	IR	\N	23203
Taylorville	US	\N	12659
Levittown	US	\N	51726
Devils Lake	US	\N	7631
Hyeres	FR	\N	55588
Sturtevant	US	\N	6652
Portugalete	ES	\N	45766
South Fulton	US	\N	99155
Chimay	BE	\N	9841
Bedworth	GB	\N	30648
Drolshagen	DE	\N	11779
Tono	JP	\N	25974
Wardle	GB	\N	7092
Franklin Farm	US	\N	18727
Sao Luis Gonzaga	BR	\N	31798
Rosa Zarate	EC	\N	28928
Ramsgate	GB	\N	40408
Rio Bravo	US	\N	7797
Bound Brook	US	\N	10180
Awjilah	LY	\N	6610
Qardho	SO	\N	1341
Orange Beach	US	\N	6235
Hochstadt an der Aisch	DE	\N	13422
Aiquile	BO	\N	7381
Wells	US	\N	10235
Rose Hill	US	\N	22011
Cape Girardeau	US	\N	56551
Cacem	PT	\N	21289
Brock Hall	US	\N	11664
Hudson	US	\N	25185
Saint-Raymond	CA	\N	9615
Krasnyy Kut	RU	\N	14483
Milford Township	US	\N	10046
Himi	JP	\N	44874
Borgentreich	DE	\N	8523
Lodja	CD	\N	68244
Wilkes-Barre	US	\N	40766
Sevelen	CH	\N	5103
Gurnee	US	\N	30378
Fortuna	US	\N	13449
L'Epiphanie	CA	\N	5353
Melrose	US	\N	28016
Spearfish	US	\N	12836
Gagny	FR	\N	39358
Northfleet	GB	\N	29474
Usuki	JP	\N	36536
Clearview	CA	\N	14151
Komadi	HU	\N	5421
Charlottetown	CA	\N	42602
Kadiri	IN	\N	89429
Sederot	IL	\N	23090
Al Jaghbub	LY	\N	1744
Sidi Qacem	MA	\N	75672
River Oaks	US	\N	7630
Eagle Mountain	US	\N	38391
Hilo	US	\N	46284
Tecoh	MX	\N	9134
Woodchurch	GB	\N	8400
Coronado	US	\N	23731
Dillenburg	DE	\N	23365
Inta	RU	\N	25444
Akiruno	JP	\N	80074
Kralupy nad Vltavou	CZ	\N	18388
Karungu	KE	\N	2376
Parsons	US	\N	9294
Savoy	US	\N	8401
Tejen	TM	\N	67294
Delphos	US	\N	7267
Novosokolniki	RU	\N	7105
Soran	KZ	\N	42058
Abington	US	\N	55573
Swinton	GB	\N	22931
Willis	US	\N	7028
Security-Widefield	US	\N	38134
Ikeda	JP	\N	104169
Nyagan	RU	\N	58335
Camp Swift	US	\N	6553
Uwchlan	US	\N	18869
Talghar	KZ	\N	47301
Keansburg	US	\N	9632
Tambau	BR	\N	23214
Makushino	RU	\N	7811
Umba	RU	\N	6128
Midland Park	US	\N	7216
Palatine	US	\N	67482
Long Ditton	GB	\N	6343
Muna	MX	\N	11469
Byron	US	\N	6896
Cesario Lange	BR	\N	17163
Thames	NZ	\N	7680
Hoyland Nether	GB	\N	11852
Tlapanaloya	MX	\N	6466
Glenview	US	\N	47308
Kataysk	RU	\N	12565
Elizabeth City	US	\N	22711
Horezu	RO	\N	6263
Hadamar	DE	\N	12480
Bayonne	US	\N	64897
Nogliki	RU	\N	10098
Stevensville	US	\N	6973
Vermillion	US	\N	10844
Tsuyama	JP	\N	100387
Manazuru	JP	\N	6843
Mirandopolis	BR	\N	29043
Ninomiya	JP	\N	27744
Liversedge	GB	\N	19420
Walker	US	\N	24869
Seward	US	\N	6876
Pozo Colorado	PY	\N	2135
Nappanee	US	\N	7139
Gateshead	GB	\N	120046
Americus	US	\N	16939
Curtici	RO	\N	7453
Cheney	US	\N	12497
Lake Delton	US	\N	5609
Waldsassen	DE	\N	6694
Targu Carbunesti	RO	\N	8034
Northolt	GB	\N	30304
Mirassol	BR	\N	57857
Markranstadt	DE	\N	15619
Kimovsk	RU	\N	25951
Leisnig	DE	\N	8257
Atuntaqui	EC	\N	21286
Coppell	US	\N	41421
Egremont	GB	\N	8194
Northam	GB	\N	7489
Norderney	DE	\N	6089
Green	US	\N	25752
Clearlake	US	\N	15961
Greenwood Village	US	\N	15735
Laurel Hill	US	\N	8194
Branchburg	US	\N	14504
Glencoe	NZ	\N	9750
Luquillo	PR	\N	7841
Kin	JP	\N	11270
Motegi	JP	\N	12046
Traiskirchen	AT	\N	18858
Civitavecchia	IT	\N	61316
St. Clair Shores	US	\N	58984
Fox Lake	US	\N	10451
Kronberg	DE	\N	18311
Stonecrest	US	\N	54903
Heswall	GB	\N	13401
Fanipal'	BY	\N	17500
Leonberg	DE	\N	48733
Adet	ET	\N	21117
Jaguarao	BR	\N	27931
Melfort	CA	\N	5992
Glocester	US	\N	10062
Gresford	GB	\N	5010
Letohrad	CZ	\N	6406
Walsall	GB	\N	67594
Tipton	GB	\N	38777
Mockern	DE	\N	12874
Belomorsk	RU	\N	9861
Brownfield	US	\N	9234
Romainville	FR	\N	27567
Mistassini	CA	\N	14250
Zvishavane	ZW	\N	35896
Lompoc	US	\N	52020
Horice	CZ	\N	8533
South Cleveland	US	\N	8069
East Gwillimbury	CA	\N	23991
Lake Stevens	US	\N	33911
Partick	GB	\N	8884
Petushki	RU	\N	13112
North Smithfield	US	\N	12349
Benidorm	ES	\N	68721
Levin	NZ	\N	17700
Hornsea	GB	\N	8432
Jefferson Valley-Yorktown	US	\N	14441
Celeken	TM	\N	1206
Ingleside	US	\N	17940
New Windsor	US	\N	27012
Ketchikan	US	\N	10652
Forest Hill	US	\N	12988
Flower Mound	US	\N	79135
Cheshire	US	\N	29208
Willesborough	GB	\N	7800
Nelson Bay	AU	\N	11820
Westbrook	US	\N	19074
Pedernales	EC	\N	21910
La Crescenta-Montrose	US	\N	19500
El Centro	US	\N	111425
Laurens	US	\N	10008
Uummannaq	GL	\N	1497
Bombo	UG	\N	75000
Indian River Estates	US	\N	6902
Redruth	GB	\N	14018
Cumbernauld	GB	\N	50430
Cabo Rojo	PR	\N	8862
Broxburn	GB	\N	12000
Oakley	GB	\N	5086
Middlebury	US	\N	8600
Tash-Komur	KG	\N	19310
Secovce	SK	\N	8441
Lockhart	US	\N	14775
San Patricio	MX	\N	7569
Dadeldhura	NP	\N	19014
Morganville	US	\N	5041
Oberkirch	DE	\N	20066
Kent	CA	\N	6067
Wytheville	US	\N	6956
Costessey	GB	\N	12463
Gaylord	US	\N	8388
Kladno	CZ	\N	69337
Sanderstead	GB	\N	12777
Pinehurst	US	\N	45935
Villeneuve-la-Garenne	FR	\N	23771
Roy	US	\N	39613
Habikino	JP	\N	109553
Woodstock	US	\N	33039
Haren	DE	\N	23829
Satka	RU	\N	41798
West Mersea	GB	\N	7183
Parsberg	DE	\N	7213
Al Jawf	LY	\N	24132
Belur	IN	\N	20225
Mumbwa	ZM	\N	19086
Maizuru	JP	\N	79886
Abu	IN	\N	22943
Kharian	PK	\N	85765
LaFayette	US	\N	7589
Bandundu	CD	\N	118211
Red Chute	US	\N	6468
Herten	DE	\N	61791
Sasagawa	JP	\N	75822
Grafenau	DE	\N	8256
Darwen	GB	\N	31570
Bullsbrook	AU	\N	5448
Starke	US	\N	5647
Norwell	US	\N	10987
Olyphant	US	\N	5023
Lake Ronkonkoma	US	\N	20780
Weatherford	US	\N	46268
Red Lion	US	\N	6330
Nolanville	US	\N	5879
Newstead	US	\N	8674
Stowe	US	\N	6260
Suifenhe	CN	\N	60000
Kensington	US	\N	8190
River Park	US	\N	6818
South Heidelberg	US	\N	7382
Brotas	BR	\N	23419
Yurga	RU	\N	81759
Dyatkovo	RU	\N	26775
Yorkton	CA	\N	16343
Presidente Epitacio	BR	\N	43535
Hodonin	CZ	\N	24512
West Seneca	US	\N	45332
Morawa	AU	\N	532
West Hollywood	US	\N	36475
Somerville	AU	\N	11336
Cocoa	US	\N	18603
Camden	US	\N	73562
Hudson	CA	\N	5165
Bowen	AU	\N	10377
Summit Park	US	\N	8273
Torquay	AU	\N	13258
Castleford	GB	\N	40210
Kokhma	RU	\N	30500
Kotelnikovo	RU	\N	20172
Wimauma	US	\N	7621
Ermont	FR	\N	29108
Cheadle	GB	\N	12165
Mead Valley	US	\N	19925
Moncton	CA	\N	108620
New Port Richey East	US	\N	10161
Bad Salzdetfurth	DE	\N	13145
Wentworthville	AU	\N	6197
Bethlehem	ZA	\N	16236
Wagoner	US	\N	8875
Saint-Ouen	FR	\N	51108
Bridge City	US	\N	7862
Fort William	GB	\N	10459
Westville	US	\N	5943
Clarinda	US	\N	5215
Georgiyevsk	RU	\N	67054
Patton	US	\N	15905
Echirolles	FR	\N	36840
Safford	US	\N	19987
San Carlos	BO	\N	6353
Okehampton	GB	\N	5922
Newport Pagnell	GB	\N	15118
Ihnasya al Madinah	EG	\N	40001
Mystic Island	US	\N	8717
Zhukovo	RU	\N	13576
Elkridge	US	\N	20519
Stamboliyski	BG	\N	12346
Fort Saskatchewan	CA	\N	24149
Tajarhi	LY	\N	1500
Hannoversch Munden	DE	\N	24467
Glenn Dale	US	\N	14191
Harrisonville	US	\N	9412
Costesti	RO	\N	10375
Mayen	DE	\N	19144
Netishyn	UA	\N	36921
Socastee	US	\N	24056
Fort Lupton	US	\N	10208
Ibira	BR	\N	11861
Krasnoznamensk	RU	\N	41769
Matias Romero	MX	\N	39828
Dombarovskiy	RU	\N	9556
Worragee	AU	\N	5068
Verkhnyaya Salda	RU	\N	41484
Guararapes	BR	\N	32346
Piacatu	BR	\N	5739
Schoppenstedt	DE	\N	5474
Koniz	CH	\N	41507
Ripley	US	\N	8045
Marengo	US	\N	7517
Chiny	BE	\N	5175
Falagueira	PT	\N	14530
Kribi	CM	\N	60000
Maraba Paulista	BR	\N	5435
Illertissen	DE	\N	17473
Xochiatipan de Castillo	MX	\N	18157
Mitcham	GB	\N	63393
Onslow	AU	\N	857
Komono	JP	\N	40487
The Village	US	\N	9564
Kaneyama	JP	\N	82335
Cwmafan	GB	\N	6538
Severomorsk	RU	\N	51209
East Meadow	US	\N	37358
Keokuk	US	\N	12635
Bad Gandersheim	DE	\N	9823
Casablanca	CL	\N	21874
Rancho Palos Verdes	US	\N	41530
Siwah	EG	\N	23080
Tsuruno	JP	\N	31089
Kostrzyn nad Odra	PL	\N	18125
Vossevangen	NO	\N	5571
Huron	US	\N	13427
Villena	ES	\N	33964
Palmwoods	AU	\N	5676
Immokalee	US	\N	26773
Mentor-on-the-Lake	US	\N	7390
Achern	DE	\N	25630
Kankakee	US	\N	77429
Eastbourne	GB	\N	103745
Zeltweg	AT	\N	7212
Kuzumaki	JP	\N	5671
Santa Lucia	UY	\N	16742
Irondequoit	US	\N	50427
Mandali	IQ	\N	29785
Bromsgrove	GB	\N	29237
Maxatawny	US	\N	7227
Sioux Lookout	CA	\N	5272
Havre	US	\N	10155
North Reading	US	\N	15642
Salyan	NP	\N	15000
Onex	CH	\N	18977
Nachod	CZ	\N	19897
Slinger	US	\N	5565
Lower Pottsgrove	US	\N	12140
Baltimore Highlands	US	\N	7959
Courbevoic	FR	\N	81719
Tawaramoto	JP	\N	31028
Whanganui	NZ	\N	39400
Battle Creek	US	\N	76514
Byala Slatina	BG	\N	12935
Stevens Point	US	\N	42837
Pelhrimov	CZ	\N	16048
Filiatra	GR	\N	5969
Putina	PE	\N	8118
Goldasht	IR	\N	22693
Two Rivers	US	\N	11041
Reddish	GB	\N	28052
Sao Jose de Ribamar	BR	\N	55265
Mavinga	AO	\N	30000
Olympia Heights	US	\N	14536
Zermatt	CH	\N	5643
Tshela	CD	\N	38845
Irmo	US	\N	12483
Rinteln	DE	\N	25484
Shalaurova	RU	\N	10
Fernando Prestes	BR	\N	5760
Saraland	US	\N	14649
Green Hill	US	\N	6695
Lemgo	DE	\N	40696
Springhill	US	\N	5444
Reichelsheim	DE	\N	6769
Pomfret	US	\N	14257
Ruza	RU	\N	13403
Zorra	CA	\N	8138
Bairnsdale	AU	\N	7580
Moba	CD	\N	10006
Karoi	ZW	\N	25030
Elon	US	\N	12232
Bonnigheim	DE	\N	8015
Adjala-Tosorontio	CA	\N	10975
Taylor Mill	US	\N	6802
Conselheiro Lafaiete	BR	\N	111596
Waterford	US	\N	19052
Ishinari	JP	\N	16328
Quarteira	PT	\N	16131
Moorpark	US	\N	36375
Hazlet	US	\N	19908
Council Bluffs	US	\N	62166
Veresegyhaz	HU	\N	18654
Center	US	\N	5215
Stone	GB	\N	16385
Knottingley	GB	\N	13710
Schweich	DE	\N	7827
Newbridge	GB	\N	6509
Clanton	US	\N	5901
Rybnoye	RU	\N	19700
Ochi	JP	\N	5324
Wanstead	GB	\N	11543
Atascadero	US	\N	30075
Eden	US	\N	16477
Quantico Base	US	\N	5213
Zaraysk	RU	\N	5918
Ybbs an der Donau	AT	\N	5653
Pittstown	US	\N	5674
Keyes	US	\N	6185
Molesey	GB	\N	19088
Darabani	RO	\N	9893
Yorktown	US	\N	36618
Walkertown	US	\N	5242
Lincolnshire	US	\N	7893
Herisau	CH	\N	15780
Cape Breton	CA	\N	94285
Rainbow City	US	\N	9611
Frantiskovy Lazne	CZ	\N	5461
Saint-Charles-Borromee	CA	\N	13321
Calhoun	US	\N	34754
Neston	GB	\N	15221
Hassi Messaoud	DZ	\N	18124
Pemangkat	ID	\N	44783
Winter Springs	US	\N	37312
Newcastle under Lyme	GB	\N	75082
Aghbal	MA	\N	14908
Seguin	US	\N	28735
Essaouira	MA	\N	77966
Stowmarket	GB	\N	19280
Santo Tomas	PE	\N	25087
Guapiacu	BR	\N	20037
Athis-Mons	FR	\N	34347
Medebach	DE	\N	8055
Raymond	US	\N	10389
Falmouth	US	\N	31177
Belogorsk	RU	\N	66183
Quarrington	GB	\N	7046
Smithfield	US	\N	32156
Madison Park	US	\N	6941
Knutsford	GB	\N	13191
Boston	GB	\N	35124
Leers	FR	\N	9473
Iida	JP	\N	98129
Tablada	AR	\N	102542
Plympton-Wyoming	CA	\N	7576
Gantt	US	\N	15178
Sion	CH	\N	34708
Longjumeau	FR	\N	21221
Sagastyr	RU	\N	10
Crozet	US	\N	6526
Andover	GB	\N	38290
Ollerton	GB	\N	9840
Telc	CZ	\N	5273
Hawaiian Gardens	US	\N	14159
Furstenfeld	AT	\N	8549
Alipur Duar	IN	\N	127342
Rishton	GB	\N	6625
Zubtsov	RU	\N	6300
Joane	PT	\N	7528
Schlieren	CH	\N	18666
Velizy-Villacoublay	FR	\N	22036
North Star	US	\N	7441
Hennigsdorf	DE	\N	26272
Bolobo	CD	\N	27862
Oakville	US	\N	36827
Yoqne`am `Illit	IL	\N	21383
Viechtach	DE	\N	8364
Munchenstein	CH	\N	12096
Tranqueras	UY	\N	7235
Bad Sachsa	DE	\N	7346
Senatobia	US	\N	6086
LaSalle	CA	\N	30180
Arnstein	DE	\N	8125
Statesville	US	\N	27528
Royton	GB	\N	21284
Kislovodsk	RU	\N	129593
Saint-Hyacinthe	CA	\N	59614
Norderstedt	DE	\N	79159
Lod	IL	\N	75700
Logansport	US	\N	20608
Harrietstown	US	\N	5576
Nyirtelek	HU	\N	6555
Atascocita	US	\N	79019
Ogano	JP	\N	11078
Cameta	BR	\N	45200
Torrisholme	GB	\N	6755
High Blantyre	GB	\N	16900
Franklin Square	US	\N	32329
Plympton	GB	\N	29899
Midvale	US	\N	34124
Ceska Kamenice	CZ	\N	5235
Half Moon	US	\N	7669
August	US	\N	8774
Bishops Cleeve	GB	\N	10612
Hecklingen	DE	\N	6970
Vereshchagino	RU	\N	21969
Nacogdoches	US	\N	34420
Vernon	FR	\N	23872
Tamagawa	JP	\N	46611
Broughty Ferry	GB	\N	13155
Temsia	MA	\N	40780
Fuzesgyarmat	HU	\N	5774
Lake Magdalene	US	\N	29794
Mayo	US	\N	8171
Oberlin	US	\N	7882
Dunfermline	GB	\N	54050
Ryhope	GB	\N	10484
Imbituba	BR	\N	43450
West Thurrock	GB	\N	7795
Lisburn	GB	\N	71465
Signal Mountain	US	\N	8606
Humacao	PR	\N	18487
Chiredzi	ZW	\N	28205
Gallneukirchen	AT	\N	6492
Guaimbe	BR	\N	5696
White Township	US	\N	15875
Grafenhainichen	DE	\N	11654
Mahmudabad Nemuneh	IR	\N	19669
Meridianville	US	\N	6609
Townsend	US	\N	9455
Tiverton	US	\N	15816
Belle Chasse	US	\N	13490
Mozhaysk	RU	\N	30190
Hobbs	US	\N	42095
China	JP	\N	5791
Stanmore	GB	\N	23700
Rossington	GB	\N	13557
Towcester	GB	\N	9252
Gardiner	US	\N	5653
Goianesia	BR	\N	47883
Burtonsville	US	\N	10604
Chenango	US	\N	10806
Launceston	AU	\N	87328
Magurele	RO	\N	11041
Kambove	CD	\N	36702
Langenhagen	DE	\N	54631
Platteville	US	\N	12100
Ferrol	ES	\N	66065
Remedios de Escalada	AR	\N	81465
Clark	US	\N	15614
Geretsried	DE	\N	25275
Albert Lea	US	\N	17511
Munchberg	DE	\N	10215
Saint John	CA	\N	67575
Saint Helens	GB	\N	102629
Chokurdakh	RU	\N	2506
Golborne	GB	\N	24169
Brynmawr	GB	\N	5530
Foothill Farms	US	\N	33749
Telemaco Borba	BR	\N	58880
Annapolis Neck	US	\N	11590
University Heights	US	\N	12797
Deniliquin	AU	\N	7862
Whitwick	GB	\N	8612
Yorkshire	US	\N	9582
Clarion	US	\N	10138
Strausberg	DE	\N	26587
Pahrump	US	\N	36174
Coralville	US	\N	22290
Royal Palm Beach	US	\N	40396
Santiago Teyahualco	MX	\N	47547
Surbiton	GB	\N	45132
Kuruman	ZA	\N	10006
Uelen	RU	\N	776
DuBois	US	\N	11241
Uffenheim	DE	\N	6518
Franklin Lakes	US	\N	11119
Santiago Amoltepec	MX	\N	12683
Rzhyshchiv	UA	\N	7359
North Charleston	US	\N	115382
Buchs	CH	\N	12612
Heybridge	GB	\N	8175
Pogradec	AL	\N	20848
Olanchito	HN	\N	22500
Raub	MY	\N	40024
Muriae	BR	\N	91173
South Middleton	US	\N	15264
Cleethorpes	GB	\N	38996
Floris	US	\N	8305
Steinbach am Taunus	DE	\N	10682
Park Hills	US	\N	8529
Eastman	US	\N	6180
Falcon Heights	US	\N	5528
Ariranha	BR	\N	9277
Roznov pod Radhostem	CZ	\N	16398
Lavras	BR	\N	81472
Bodmin	GB	\N	14736
Abrud	RO	\N	5072
Frondenberg	DE	\N	20766
Sattenapalle	IN	\N	56721
Palm City	US	\N	25225
Kuklen	BG	\N	7331
North Middleton	US	\N	11499
Titu	RO	\N	9658
Johns Creek	US	\N	84579
Glenrothes	GB	\N	38240
Motril	ES	\N	58020
Swansea	US	\N	16462
Great Cornard	GB	\N	8908
Mitake	JP	\N	17608
Prairie Ridge	US	\N	12550
Vratimov	CZ	\N	7293
Moosburg	DE	\N	18510
Bulwell	GB	\N	29771
Belleville	US	\N	40897
North Elba	US	\N	8275
Morges	CH	\N	15838
Passos	BR	\N	98752
Vicksburg	US	\N	26340
Vernon	CA	\N	44600
Montmagny	CA	\N	11491
Birak	LY	\N	45421
Uhersky Brod	CZ	\N	16441
Garden Acres	US	\N	10701
Gorham	US	\N	17307
Mountain Park	US	\N	13877
Upminster	GB	\N	25361
Fruitvale	US	\N	8021
Sherborne	GB	\N	9523
Highland Springs	US	\N	15855
Plattsburgh	US	\N	28740
Waterville	US	\N	27054
Yaotsu	JP	\N	10321
Gandia	ES	\N	74562
Lanark Highlands	CA	\N	5338
Park Forest Village	US	\N	10610
Warstein	DE	\N	24842
Thunder Bay	CA	\N	107909
Lemington	GB	\N	10228
Naga	PH	\N	115750
Kasli	RU	\N	16013
Pearsall	US	\N	10973
Bassum	DE	\N	15955
Lushnje	AL	\N	31105
Nerchinsk	RU	\N	14919
Nishinoomote	JP	\N	14980
Sainte-Anne-des-Monts	CA	\N	6933
Frechen	DE	\N	52473
Chuquicamata	CL	\N	11941
Orange City	US	\N	12335
Kapfenberg	AT	\N	22798
Ad Diwem	SD	\N	87068
Yasu	JP	\N	50432
Sopur	IN	\N	118608
Serrinha	BR	\N	56829
Rochester	GB	\N	62982
Carlton	GB	\N	6881
Aracuai	BR	\N	22005
Rheinbach	DE	\N	27063
Tala	UY	\N	5089
Marton	NZ	\N	5200
Bovingdon	GB	\N	9000
Novouralsk	RU	\N	81202
Whitworth	GB	\N	7500
Anadarko	US	\N	5703
Toride	JP	\N	104667
Princess Anne	US	\N	11101
Redcliff	ZW	\N	32346
Turlock	US	\N	107317
Vladimirescu	RO	\N	10710
St. Peter	US	\N	12421
Yuza	JP	\N	13250
Sao Bento do Sapucai	BR	\N	10864
Tlacolula	MX	\N	23865
Hungerford	GB	\N	5767
Oxon Hill	US	\N	17720
Guildford	GB	\N	77057
Huntertown	US	\N	6824
Igaracu do Tiete	BR	\N	24451
Ligao	PH	\N	111399
Gerasdorf bei Wien	AT	\N	11155
Tatui	BR	\N	116682
Bethalto	US	\N	9210
Lindale	US	\N	13442
Kyakhta	RU	\N	20031
Waitara	NZ	\N	7040
Kingsbury	GB	\N	7652
Palmerton	US	\N	5336
Osthofen	DE	\N	9402
Kerpen	DE	\N	66206
Novokhopersk	RU	\N	6108
Mineral del Chico	MX	\N	7980
Stotfold	GB	\N	6190
Oelwein	US	\N	6433
Southold	US	\N	22147
Wakuya	JP	\N	15677
Vizela	PT	\N	23736
New Hartford	US	\N	21880
Degtyarsk	RU	\N	16001
Lake of the Woods	US	\N	7649
Zorbig	DE	\N	9216
Eberbach	DE	\N	14460
Pyrford	GB	\N	5022
Arth	CH	\N	11983
Krume	AL	\N	6006
Indian Wells	US	\N	5470
Conley	US	\N	6002
Jamestown	US	\N	40493
Napoleon	US	\N	8183
Lopatcong	US	\N	8288
Mendham	US	\N	5792
Duanesburg	US	\N	6501
Edmonds	US	\N	42605
Merrimac	AU	\N	7071
Chitila	RO	\N	14184
Arroyo	PR	\N	6134
Northbrook	US	\N	32958
Shimabara	JP	\N	43553
DeLand	US	\N	34851
Nazyvayevsk	RU	\N	11101
Seminole	US	\N	18838
Barth	DE	\N	8658
El Qaa	LB	\N	12000
Malmesbury	GB	\N	5380
Moorestown-Lenola	US	\N	13800
Tanabi	BR	\N	25467
Albury	AU	\N	47974
Toms River	US	\N	91706
Temiskaming Shores	CA	\N	9920
Willebadessen	DE	\N	8142
Dulovo	BG	\N	8493
White Settlement	US	\N	17851
Kingsburg	US	\N	12108
Mount Sinai	US	\N	11529
Kawachicho	JP	\N	17216
Yoshinaga	JP	\N	28899
Middle Paxton	US	\N	5067
West Melbourne	US	\N	24259
Littleton	US	\N	48065
Chita	JP	\N	83946
Union Park	US	\N	13254
Oil City	US	\N	13935
Hermosa Beach	US	\N	19320
Winona	US	\N	29601
Saku	JP	\N	98609
Yiewsley	GB	\N	12979
Germantown	US	\N	90844
Whitemarsh Island	US	\N	7058
Couvin	BE	\N	13782
Meadowbrook	US	\N	19532
Moultrie	US	\N	18602
Macomb	US	\N	18006
Boothwyn	US	\N	5596
Luga	RU	\N	35262
Addlestone	GB	\N	15883
Orange Park	US	\N	8824
Lake Jackson	US	\N	75860
Hardeeville	US	\N	7290
Bayugan	PH	\N	103202
Somers Point	US	\N	10174
Tako	JP	\N	14021
New Cassel	US	\N	14648
Stadtlohn	DE	\N	20322
La Feria	US	\N	7230
Werl	DE	\N	30772
Guymon	US	\N	10895
Pucioasa	RO	\N	14254
Eastpointe	US	\N	32081
Bad Schwartau	DE	\N	20036
La Ronge	CA	\N	5671
Vardenis	AM	\N	12363
New Garden	US	\N	12111
Drancy	FR	\N	71318
Clarington	CA	\N	92013
Canyon	US	\N	16109
Lithia Springs	US	\N	17216
Abercarn	GB	\N	5352
Terra Roxa	BR	\N	9101
Kadoma	JP	\N	119692
Highworth	GB	\N	8151
Hannibal	US	\N	17884
Forest Grove	US	\N	25553
Pflugerville	US	\N	65380
Willoughby Hills	US	\N	9553
McCook	US	\N	7426
Westmere	US	\N	7001
Blair	US	\N	7748
Lucapa	AO	\N	31041
Trooper	US	\N	5936
Svoge	BG	\N	8003
Dorridge	GB	\N	11140
Corowa	AU	\N	5482
Sassnitz	DE	\N	9320
Wauconda	US	\N	13504
Union City	US	\N	74107
Bayham	CA	\N	7396
Kamsar	GN	\N	34973
Lytkarino	RU	\N	58606
Neudenau	DE	\N	5266
Ponta Pora	BR	\N	94331
Fate	US	\N	15603
Pushkar	IN	\N	21626
Sellersburg	US	\N	8908
Spennymoor	GB	\N	19816
Bluffton	US	\N	25557
Acton	US	\N	23561
Colonia del Sol	MX	\N	64055
Trail	CA	\N	7709
Flint	GB	\N	12953
West Orange	US	\N	47210
Posen	US	\N	5865
Talkhvoncheh	IR	\N	9307
Matochkin Shar	RU	\N	10
Woodland Park	US	\N	12581
North Coventry	US	\N	7996
Frontera Corozal	MX	\N	5184
Edgemoor	US	\N	6471
Yashio	JP	\N	92672
Rudolstadt	DE	\N	25115
Seneca Falls	US	\N	8774
Pokhvistnevo	RU	\N	28177
Omitama	JP	\N	49200
Gilford	US	\N	7139
Westgate on Sea	GB	\N	6996
Kaminokawa	JP	\N	30964
West Salem	US	\N	5015
Passaic	US	\N	69703
Oxford	US	\N	38310
Melbourne	US	\N	83029
Mahadipur	IN	\N	8638
St. Matthews	US	\N	18105
Cowes	GB	\N	10405
Dade City	US	\N	7338
Bogoroditsk	RU	\N	31139
Balve	DE	\N	11361
Omurtag	BG	\N	10825
Alatyr	RU	\N	11086
Desaguadero	PE	\N	5329
Combee Settlement	US	\N	6323
Becancour	CA	\N	12438
Easttown	US	\N	10603
Harker Heights	US	\N	32421
Poronaysk	RU	\N	15311
Queanbeyan	AU	\N	36348
Bondy	FR	\N	53353
Allison Park	US	\N	22855
Weehawken	US	\N	14327
Schotten	DE	\N	10059
Hamilton	BM	\N	52320
Abensberg	DE	\N	13946
St. Paul	CA	\N	5827
Hellam	US	\N	5965
Leicester	US	\N	11286
Saveni	RO	\N	6999
West Milford	US	\N	26409
Corsham	GB	\N	13000
Kahriz Sang	IR	\N	8267
Sandacho	JP	\N	110820
Ronnenberg	DE	\N	24347
Loganville	US	\N	12880
Hadfield	GB	\N	6305
Solotvyno	UA	\N	8632
Southend	GB	\N	93
Zhushan	TW	\N	54870
Rustington	GB	\N	13883
Leutershausen	DE	\N	5615
Homestead Meadows South	US	\N	6559
Kopavogur	IS	\N	34140
Del Rio	US	\N	44121
Nagold	DE	\N	22294
Pakenham	AU	\N	46421
Mirbat	OM	\N	1120
Weidenberg	DE	\N	5772
Champasak	LA	\N	13400
Lichtenburg	ZA	\N	26338
Rtishchevo	RU	\N	39005
Elland	GB	\N	11676
Alcoa	US	\N	9980
Lake Tapps	US	\N	12771
Mairipora	BR	\N	100179
Klin	RU	\N	79387
Villeneuve-Saint-Georges	FR	\N	33545
Narrogin	AU	\N	4274
Svetogorsk	RU	\N	15546
Blundellsands	GB	\N	11514
Newbold	GB	\N	7962
Kaita	JP	\N	29431
Culpeper	US	\N	20485
Kola	RU	\N	9691
Loyalist	CA	\N	16971
Piracununga	BR	\N	74587
East Lansing	US	\N	48145
West Plains	US	\N	11540
Pelsall	GB	\N	11505
Santiago	CR	\N	11512
Minto	CA	\N	8671
East Whiteland	US	\N	11415
Warm Mineral Springs	US	\N	5149
Ransbach-Baumbach	DE	\N	7715
Bad Bergzabern	DE	\N	8124
Isilkul	RU	\N	22903
Norman	US	\N	116973
Salgueiro	BR	\N	42152
Dolton	US	\N	22348
Suncook	US	\N	5111
Shengjin	AL	\N	8091
Shamva	ZW	\N	10317
Chippewa Falls	US	\N	14366
Bremen	US	\N	6945
Ladenburg	DE	\N	11537
Batouri	CM	\N	43821
Blandford-Blenheim	CA	\N	7399
Garswood	GB	\N	6183
Penn Hills	US	\N	41519
Tarrytown	US	\N	11370
Guaicara	BR	\N	11633
Richmond	GB	\N	21469
Kamenka	RU	\N	35929
Bagnolet	FR	\N	35674
Manlius	US	\N	32002
Forestbrook	US	\N	5682
New Holland	US	\N	5464
Pureparo de Echaiz	MX	\N	15255
Bengonbeyene	GQ	\N	15644
Schwabmunchen	DE	\N	14075
Rancho Murieta	US	\N	5603
Logan Township	US	\N	12414
Emporia	US	\N	24513
Bull Mountain	US	\N	9591
Waldenbuch	DE	\N	8717
Brookline	US	\N	59234
Lake Villa	US	\N	8573
Cresaptown	US	\N	5977
Nambucca Heads	AU	\N	6327
Villa Rica	US	\N	16058
Manuel Tames	CU	\N	21237
Cazombo	AO	\N	298
Pyay	MM	\N	135308
Hearst	CA	\N	5070
Milovice	CZ	\N	12098
Lahnstein	DE	\N	18067
Schenectady	US	\N	65273
Centerville	US	\N	23703
Luling	US	\N	13614
Lawton	US	\N	90712
Cheshire Village	US	\N	6484
Palatka	US	\N	23738
Clifton Heights	US	\N	6697
Penn Estates	US	\N	5708
Wyckoff	US	\N	17047
Qiryat Mal'akhi	IL	\N	23100
Lac	AL	\N	17086
Greensburg	US	\N	14113
Buckhannon	US	\N	8351
Nobeji	JP	\N	12728
Takasagocho-takasemachi	JP	\N	88223
Westford	US	\N	24194
Pilar do Sul	BR	\N	28309
Primorsk	RU	\N	5682
Gonesse	FR	\N	25999
Furukawa	JP	\N	23030
Lake Norman of Catawba	US	\N	8241
Kasagi	JP	\N	15961
Warren	US	\N	133943
Indianola	US	\N	15471
Normal	US	\N	54469
Eau Claire	US	\N	107404
Burbank	US	\N	102511
Jackson Township	US	\N	8760
Thousand Palms	US	\N	7814
Minusinsk	RU	\N	68007
Vercheres	CA	\N	5692
Deutsch-Wagram	AT	\N	8651
Mays Chapel	US	\N	12303
Granby	CA	\N	63433
Lorinci	HU	\N	5557
Kingsport	US	\N	119666
Fairview Heights	US	\N	16303
St. Augustine	US	\N	82180
Pontardulais	GB	\N	6281
Sunbury	GB	\N	18041
Amagi	JP	\N	5608
Bruchsal	DE	\N	44644
Grosse Pointe	US	\N	5154
Hornell	US	\N	10661
P'yongsan	KP	\N	66260
Mont-Saint-Hilaire	CA	\N	18200
Kargopol	RU	\N	10055
Phenix City	US	\N	36487
Zoutleeuw	BE	\N	8498
Volkhov	RU	\N	44868
Tarko-Sale	RU	\N	21448
Keynsham	GB	\N	16641
Erquelinnes	BE	\N	9940
Gladewater	US	\N	6341
Emu Plains	AU	\N	8421
Junin	PE	\N	15320
Tsubata	JP	\N	36774
Gremyachinsk	RU	\N	8732
Okondja	GA	\N	7155
Altrincham	GB	\N	52419
Plessisville	CA	\N	6688
Dacula	US	\N	6350
Deer Lake	CA	\N	5249
Poynton	GB	\N	14260
Hashimoto	JP	\N	60885
Roosevelt	US	\N	16229
Paxtonia	US	\N	5670
Spassk-Ryazanskiy	RU	\N	6553
Ceduna	AU	\N	2157
Oum Hadjer	TD	\N	26136
Bogue	MR	\N	10415
South Yarmouth	US	\N	11624
South Miami Heights	US	\N	37861
Brooklyn Center	US	\N	30690
Kosterevo	RU	\N	8216
Assis	BR	\N	101597
Cutler	US	\N	5774
Trumpington	GB	\N	8034
Cahokia	US	\N	13880
Luiana	AO	\N	150
Oberstdorf	DE	\N	9707
Manturovo	RU	\N	15452
Bilisht	AL	\N	7114
Asenovgrad	BG	\N	59793
East Pennsboro	US	\N	21398
Union Hill-Novelty Hill	US	\N	22034
Torgelow	DE	\N	9153
North Huntingdon	US	\N	30502
Somers	US	\N	21408
Fishhook	US	\N	6203
Gornyak	RU	\N	12972
Davidson	US	\N	13054
Caraguatatuba	BR	\N	113317
Tiverton	GB	\N	19544
West Linn	US	\N	26736
Naini Tal	IN	\N	41377
Bogdanovich	RU	\N	29241
Rafael Calzada	AR	\N	57351
Aguas de Lindoia	BR	\N	18313
Mountain House	US	\N	15645
Bourem Guindou	ML	\N	30000
Veintiocho de Noviembre	AR	\N	5300
Esil	KZ	\N	13504
Darien	US	\N	21759
Southfield	US	\N	72689
Kirovo-Chepetsk	RU	\N	72071
Menen	BE	\N	33190
Bingham	GB	\N	9131
Colonie	US	\N	82882
Fort Hood	US	\N	25365
Kenosha	US	\N	124972
Saint-Jean-de-Braye	FR	\N	20751
Honley	GB	\N	5897
Thonotosassa	US	\N	13966
Coppull	GB	\N	7959
Indian Trail	US	\N	40252
Chibemba	AO	\N	1502
Lobau	DE	\N	14643
Sannar	SD	\N	130122
Sherrelwood	US	\N	19243
Waveland	US	\N	6302
Marana	US	\N	49030
Charleville	AU	\N	3335
Piscataway	US	\N	56931
West Bridgewater	US	\N	7165
Ujszasz	HU	\N	6043
Sacavem	PT	\N	18469
Lower Allen	US	\N	19085
Anstey	GB	\N	6528
Clayton	US	\N	24887
Gorodovikovsk	RU	\N	8798
Glen Parva	GB	\N	17189
San Juan	TT	\N	13797
Shikama	JP	\N	6745
Shepherdstown	US	\N	5351
Alabaster	US	\N	33487
Anthony	US	\N	9239
Manassas	US	\N	41085
Yuni	JP	\N	5087
West Pensacola	US	\N	21243
Duarte	US	\N	21271
Kildare	IE	\N	7538
Cromwell	US	\N	13973
Valencia West	US	\N	11919
Rottingdean	GB	\N	13651
Semmes	US	\N	5594
Barnstaple	GB	\N	24033
Chardon	US	\N	8044
New Richmond	US	\N	9302
Tadepallegudem	IN	\N	104032
Pelileo	EC	\N	66836
Nagaoki	JP	\N	9347
Paradise Township	US	\N	5598
Fox Point	US	\N	6543
Great Meols	GB	\N	5110
Pfreimd	DE	\N	5349
Serra Azul	BR	\N	13216
Sao Joaquim da Barra	BR	\N	50110
Malakoff	FR	\N	30286
Bogo	PH	\N	78120
Passi	PH	\N	80544
Turkmenbasy	TM	\N	68292
Nanuque	BR	\N	37824
Kimberley	GB	\N	6659
Biloela	AU	\N	5758
Tynemouth	GB	\N	67519
Gyda	RU	\N	10
Bennington	US	\N	15179
Nauen	DE	\N	17967
Guntakal	IN	\N	126270
Bradford West Gwillimbury	CA	\N	35325
Muisne	EC	\N	13393
Gay	RU	\N	41619
Calverton	GB	\N	7076
Bron	FR	\N	41543
West Islip	US	\N	27149
Dryden	CA	\N	7749
Palm Beach Gardens	US	\N	57704
Selston	GB	\N	12596
Tucano	BR	\N	31203
Windsor	GB	\N	32608
Waterloo	US	\N	111631
Corona de Tucson	US	\N	8326
Villamontes	BO	\N	39800
Samaxi	AZ	\N	24681
Miramar Beach	US	\N	8758
Comarnic	RO	\N	11970
Hauppauge	US	\N	19580
Sarnia	CA	\N	71594
Baikonur	KZ	\N	39161
Ercsi	HU	\N	8065
Bislig	PH	\N	94535
Matao	BR	\N	81439
Pedro Luro	AR	\N	9494
Chivhu	ZW	\N	10263
Neuilly-sur-Seine	FR	\N	60361
Mudgee	AU	\N	10923
Idylwood	US	\N	18431
Bourne	US	\N	19839
Bad Honnef am Rhein	DE	\N	25816
Bad Bentheim	DE	\N	15486
Cabreuva	BR	\N	46528
Daphne	US	\N	71484
Anina	RO	\N	7485
Le Mars	US	\N	9477
Kamisu	JP	\N	95370
Kecel	HU	\N	8406
Esopus	US	\N	8831
Bay Point	US	\N	25165
Bramhall	GB	\N	17436
Nizhniy Lomov	RU	\N	20943
Milford Mill	US	\N	29974
Emerson	US	\N	7596
Zsambek	HU	\N	5569
Thonex	CH	\N	14122
Rosario	UY	\N	9311
Escalon	US	\N	7601
Boynton Beach	US	\N	78679
Thornaby on Tees	GB	\N	24741
Marlboro	US	\N	40133
Wakabadai	JP	\N	33689
East Los Angeles	US	\N	119827
Thomasville	US	\N	26649
Bukachacha	RU	\N	3372
Steubenville	US	\N	17753
Epinay-sur-Seine	FR	\N	55084
Malaut	IN	\N	70958
Molalla	US	\N	10001
Woolgoolga	AU	\N	5290
Zhirnovsk	RU	\N	15680
Bloomington	US	\N	133846
Fitzgerald	US	\N	11135
Atmore	US	\N	5864
Holdenville	US	\N	5497
Khodoriv	UA	\N	9605
Cagnes-sur-Mer	FR	\N	50928
Benner	US	\N	9242
Battlefield	US	\N	6622
Yorba Linda	US	\N	67644
Alekseyevka	RU	\N	38329
Pereira Barreto	BR	\N	25767
Kashira	RU	\N	48016
Forest Hills	US	\N	27947
Mustang	US	\N	22959
Nishi-kagura	JP	\N	10276
Hialeah Gardens	US	\N	23474
Nhandeara	BR	\N	11303
Midfield	US	\N	5002
North Fond du Lac	US	\N	5081
Clarksdale	US	\N	14745
Bawku	GH	\N	73594
Little Falls	US	\N	14459
Mukwonago	US	\N	22185
Terrace	CA	\N	15723
McFarland	US	\N	15651
Waycross	US	\N	23671
Swanton	US	\N	6530
Radcliffe	GB	\N	29950
Arroyos y Esteros	PY	\N	3055
Iron Mountain	US	\N	18432
Plum	US	\N	27087
New Carlisle	US	\N	5568
Manduri	BR	\N	9592
Golfito	CR	\N	6777
Farragut	US	\N	23778
Valinhos	BR	\N	120258
South Huntington	US	\N	10000
Amherst Center	US	\N	20253
Purcell	US	\N	7502
Upper Gwynedd	US	\N	15826
Boksitogorsk	RU	\N	15249
Upernavik	GL	\N	1218
Yreka	US	\N	7356
Ammon	US	\N	17115
Kimry	RU	\N	44743
Panciu	RO	\N	7664
New Port Richey	US	\N	16737
Bremervorde	DE	\N	18528
Fairview Township	US	\N	17293
Fish Hawk	US	\N	20054
Oytal	KZ	\N	22673
Kazanlak	BG	\N	56047
Hawthorne	US	\N	86068
Lake Wildwood	US	\N	5208
Porta Westfalica	DE	\N	35671
West Clarkston-Highland	US	\N	6081
Riesa	DE	\N	30054
Baiersdorf	DE	\N	7794
Malmyzh	RU	\N	7422
Selouane	MA	\N	21570
Carmelo	UY	\N	18041
Lengir	KZ	\N	23058
West Whiteland	US	\N	18403
Waltrop	DE	\N	29345
Catalina Foothills	US	\N	50426
Foster City	US	\N	33901
Amesbury	GB	\N	10724
Wellington	US	\N	65398
Ishigaki	JP	\N	48132
Tamra	IL	\N	34000
Omachi	JP	\N	26435
Churchdown	GB	\N	10990
Araras	BR	\N	128895
Kannapolis	US	\N	50841
Redwood City	US	\N	85925
Stephenville	CA	\N	6623
Satte	JP	\N	50767
Hersbruck	DE	\N	12512
Lenzburg	CH	\N	10569
Yaguaron	PY	\N	32000
Tixkokob	MX	\N	10968
Shchekino	RU	\N	86088
Dundalk	US	\N	62768
Mathis	US	\N	5662
Balatonboglar	HU	\N	5798
Campos do Jordao	BR	\N	50852
West Nipissing / Nipissing Ouest	CA	\N	14364
Orangeville	CA	\N	30734
Roznov	RO	\N	8593
Ifield	GB	\N	8882
Geisenheim	DE	\N	11704
Anna Regina	GY	\N	12448
Cynthiana	US	\N	6356
Monthey	CH	\N	17563
Enurmino	RU	\N	297
Southwest Ranches	US	\N	7957
Hrinova	SK	\N	7535
Wednesfield	GB	\N	22646
Brandywine	US	\N	9761
Komatipoort	ZA	\N	20508
Andrews	US	\N	15708
Hurbanovo	SK	\N	8041
Ciacova	RO	\N	5348
Sandersdorf	DE	\N	14398
Keyport	US	\N	6977
Stainland	GB	\N	11389
North Middlesex	CA	\N	6352
Shu	KZ	\N	42439
Kenedy	US	\N	6223
Teays Valley	US	\N	13816
Mascoutah	US	\N	7870
Albemarle	US	\N	17185
Bebington	GB	\N	15768
Milpitas	US	\N	84196
Zaouiet Sousse	TN	\N	10740
East Kilbride	GB	\N	75390
Konigs Wusterhausen	DE	\N	37190
Nichinan	JP	\N	51106
Clarendon Hills	US	\N	8752
Franklin Township	US	\N	65452
San Luis	US	\N	32850
Richboro	US	\N	6364
Cameron Park	US	\N	19902
Arzberg	DE	\N	5152
Mitterteich	DE	\N	6596
Steinheim	DE	\N	12657
Luis Antonio	BR	\N	13378
Lakeland Highlands	US	\N	12376
Magna	US	\N	26949
Tayga	RU	\N	23565
Spas-Klepiki	RU	\N	5331
Louiseville	CA	\N	7517
Vernal	US	\N	19893
Abu Qir	EG	\N	37997
Horstmar	DE	\N	6551
Pismo Beach	US	\N	8168
Ebbw Vale	GB	\N	18558
Fenton	GB	\N	12070
Mineola	US	\N	19207
Ceres	AR	\N	14499
Neptune Beach	US	\N	7259
Svilengrad	BG	\N	20390
Baykalsk	RU	\N	12629
Newman	US	\N	11783
Monticello	US	\N	27665
Pabrade	LT	\N	5528
Gennevilliers	FR	\N	46907
Puerto de la Cruz	ES	\N	30468
Oelsnitz	DE	\N	10285
Montecristi	EC	\N	46312
Riverbank	US	\N	24881
Castlegar	CA	\N	8039
Kirs	RU	\N	9453
Zwiesel	DE	\N	9421
Cherry Creek	US	\N	12601
Ipora	BR	\N	28254
Guanambi	BR	\N	58877
Solon	US	\N	22779
San Miguel de Papasquiaro	MX	\N	22750
East St. Louis	US	\N	26047
Shimotoba	JP	\N	30797
Smethwick	GB	\N	14146
Concordia	BR	\N	55367
Downside	GB	\N	6564
Hendon	GB	\N	52972
Elburn	US	\N	5997
Babadag	RO	\N	8940
South Huron	CA	\N	10096
Riverton	US	\N	44440
Baguley	GB	\N	14794
Fartura	BR	\N	15960
Littleover	GB	\N	23958
Tappan	US	\N	6996
Long Ashton	GB	\N	6044
Sevierville	US	\N	25557
Kuriyama	JP	\N	11687
Newhaven	GB	\N	12232
Saint Austell	GB	\N	19958
Arsenyev	RU	\N	52471
Lyubim	RU	\N	5076
Rutherglen	GB	\N	31120
Eibenstock	DE	\N	7370
Fenton	US	\N	11403
Bet Shemesh	IL	\N	114371
West Bromwich	GB	\N	77997
Waynesburg	US	\N	8227
Hitchin	GB	\N	33352
Globe	US	\N	13182
Winchendon	US	\N	10798
Neumarkt am Wallersee	AT	\N	6297
Pratteln	CH	\N	16621
Rio Branco	UY	\N	14604
Frutillar	CL	\N	12876
Oak Harbor	US	\N	35228
Atlantida	UY	\N	5562
Shchelkovo	RU	\N	125634
Kasaji	CD	\N	11969
Shaker Heights	US	\N	27027
Villa de Etla	MX	\N	10737
Spring Garden	US	\N	12971
Svencioneliai	LT	\N	5160
Yeghvard	AM	\N	10656
Holubivske	UA	\N	36388
Fort Drum	US	\N	13109
Otawara	JP	\N	73508
Denver City	US	\N	5413
Rosario do Sul	BR	\N	36721
Limerick	US	\N	18874
Dzyatlava	BY	\N	8100
Oppenheim	DE	\N	7562
Lippstadt	DE	\N	67901
Fujimino	JP	\N	112689
Velence	HU	\N	5552
Sault Ste. Marie	CA	\N	73368
Komatsushimacho	JP	\N	36689
Meadow Woods	US	\N	36190
Kidlington	GB	\N	13723
Cold Lake	CA	\N	14961
Shchuchye	RU	\N	9711
Dix Hills	US	\N	26819
Dois Corregos	BR	\N	26517
West St. Paul	CA	\N	5368
Budennovsk	RU	\N	62495
Pechora	RU	\N	40653
Ootacamund	IN	\N	88430
Mold	GB	\N	10058
Lomita	US	\N	20320
Baraboo	US	\N	13893
Monte Aguila	CL	\N	6574
Turnu Magurele	RO	\N	24772
Yamaga	JP	\N	49783
James Island	US	\N	12109
Montreux	CH	\N	25984
Bois-Colombes	FR	\N	28239
Mikhaylovka	RU	\N	57829
Yessentuki	RU	\N	108679
Zatec	CZ	\N	19047
Buftea	RO	\N	22178
Tahara	JP	\N	60378
Ome	JP	\N	133824
Grosse Pointe Farms	US	\N	9114
Shlisselburg	RU	\N	14763
Cramlington	GB	\N	29405
McRae-Helena	US	\N	8277
Bayghanin	KZ	\N	7657
McPherson	US	\N	12989
Teziutlan	MX	\N	92170
Iowa Park	US	\N	6268
Bichena	ET	\N	19916
Suresnes	FR	\N	49145
Weston	GB	\N	14263
Vichuga	RU	\N	34394
Westtown	US	\N	10916
Cliffside Park	US	\N	26133
Te Puke	NZ	\N	8230
Guadalupe	US	\N	7783
South Ockendon	GB	\N	19460
Rainford	GB	\N	7779
Westphalia	US	\N	9040
Bahia de Caraquez	EC	\N	20921
Tikapur	NP	\N	56127
Tomioka	JP	\N	47648
Penuelas	PR	\N	5253
Kill Devil Hills	US	\N	20951
Lake Worth	US	\N	38526
Merimbula	AU	\N	3544
Muggia	IT	\N	13111
Oakengates	GB	\N	8517
Kiama Downs	AU	\N	5004
Leitchfield	US	\N	6962
Clarence	US	\N	32137
North Bethesda	US	\N	50262
Pathanamthitta	IN	\N	37802
Accokeek	US	\N	11895
DeRidder	US	\N	13354
Lahaina	US	\N	13103
Ardud	RO	\N	6231
Richland Township	US	\N	13260
Hyrum	US	\N	8619
Eidson Road	US	\N	9531
Oakley	US	\N	42543
Lamar	US	\N	7646
Granville Township	US	\N	5017
Wingerworth	GB	\N	6533
Newarthill	GB	\N	6280
Chonan	JP	\N	7563
Winthrop	US	\N	18544
Elgin	GB	\N	24320
Mbulu	TZ	\N	13430
Acworth	US	\N	22818
Neoi Epivates	GR	\N	5984
Bielawa	PL	\N	30207
Hucknall under Huthwaite	GB	\N	7500
Oro-Medonte	CA	\N	21036
Church Point	CA	\N	8018
Ledbury	GB	\N	9290
Foley	US	\N	36921
Dierdorf	DE	\N	5700
Lakemoor	US	\N	5967
Weiser	US	\N	5524
Mount Barker	AU	\N	16629
Jose Marmol	AR	\N	41109
Milledgeville	US	\N	31471
Umm el Fahm	IL	\N	55300
Mufulira	ZM	\N	122336
Bulqize	AL	\N	8177
Faraskur	EG	\N	36850
Kirtipur	NP	\N	65602
Elstree	GB	\N	5110
East Retford	GB	\N	22013
Poplar Grove	US	\N	5104
Dukinfield	GB	\N	19306
Paintsville	US	\N	6952
London Colney	GB	\N	9507
Wollochet	US	\N	6390
General Salgado	BR	\N	10961
Wishaw	GB	\N	30250
Lindon	US	\N	11100
Shahrisabz	UZ	\N	100300
Alden	US	\N	10032
Ayorou	NE	\N	26290
Dzyarzhynsk	BY	\N	29000
Bridport	GB	\N	13569
Rochlitz	DE	\N	5711
Didcot	GB	\N	26920
Urzhum	RU	\N	9919
Buffalo Grove	US	\N	40494
Gardnertown	US	\N	5200
Al Majma`ah	SA	\N	47743
Lewistown	US	\N	21614
Pelican Bay	US	\N	5844
Inami	JP	\N	7626
Erwin	US	\N	9500
Ithaca	US	\N	55137
Kaka	TM	\N	38381
Hinsdale	US	\N	17637
Sedlcany	CZ	\N	7029
Kendal	GB	\N	28586
Redcar	GB	\N	35692
Allegan	US	\N	6350
Les Pennes-Mirabeau	FR	\N	21046
Chaddesden	GB	\N	13413
Brookville	US	\N	5874
Desert Hot Springs	US	\N	43914
East Milton	US	\N	13054
Looe	GB	\N	5112
Novaya Ladoga	RU	\N	8203
Estaimpuis	BE	\N	10424
Earlimart	US	\N	8790
Welshpool	GB	\N	5948
Seville	US	\N	7812
Mijas	ES	\N	82742
Villa Martin Colchak	BO	\N	10
Sheldon	GB	\N	21817
Brighton	GB	\N	134293
Kappeln	DE	\N	8619
Tracyton	US	\N	5933
Aberystwyth	GB	\N	18093
Elm Grove	US	\N	6136
Yonashiro-teruma	JP	\N	121294
Lauderdale-by-the-Sea	US	\N	6664
Votuporanga	BR	\N	91278
Valley Park	US	\N	6796
Witham	GB	\N	25353
Yukon	US	\N	28084
Witten	DE	\N	96563
Chicago Ridge	US	\N	13928
Bad Bevensen	DE	\N	9122
Manteno	US	\N	9002
Bad Ischl	AT	\N	14133
Gold Canyon	US	\N	11038
Newmarket	US	\N	9038
Basankusu	CD	\N	52216
Farr West	US	\N	7385
Wilmington Manor	US	\N	7902
Providence Village	US	\N	7377
Voi	KE	\N	36487
Winsted	US	\N	7367
Southeast Arcadia	US	\N	7813
Akishima	JP	\N	112005
Lower Paxton	US	\N	48739
Dno	RU	\N	7525
Oboyan	RU	\N	13413
Sheerness	GB	\N	11938
Khardah	IN	\N	108496
Juanjui	PE	\N	37715
Johnston	US	\N	29235
Vyazniki	RU	\N	35865
Cowansville	CA	\N	12489
Chapel Hill	US	\N	64051
Schongau	DE	\N	12396
Penn Yan	US	\N	6469
Islip Terrace	US	\N	5529
Ambridge	US	\N	6601
Dnestrovsc	MD	\N	10436
Bofete	BR	\N	10879
Leacock	US	\N	5525
Fegyvernek	HU	\N	6246
Burntisland	GB	\N	6269
West Columbia	US	\N	17998
Odate	JP	\N	70085
Grand Falls	CA	\N	14171
Tarusa	RU	\N	9101
Colonia	US	\N	17734
Dubbo	AU	\N	38392
Ciudad de la Costa	UY	\N	112449
Kings Mountain	US	\N	10982
Saint Neots	GB	\N	30811
Kuala Lipis	MY	\N	15448
Suzaka	JP	\N	49734
Shepshed	GB	\N	13505
Androka	MG	\N	174
Ushiku	JP	\N	84637
Gold River	US	\N	7523
Old Forge	US	\N	7894
Hubbard	US	\N	7419
Sursk	RU	\N	6254
Harlescott	GB	\N	5060
Frydek-Mistek	CZ	\N	55557
Sierra Vista Southeast	US	\N	16021
Hranice	CZ	\N	17999
Trekhgornyy	RU	\N	32715
Reinheim	DE	\N	16346
Pedro Carbo	EC	\N	20220
Bellbrook	US	\N	7344
Waupaca	US	\N	7627
Lamesa	US	\N	11241
Springfield Township	US	\N	24232
Monument	US	\N	8097
Burpengary	AU	\N	6433
Doksy	CZ	\N	5186
Dietenheim	DE	\N	6715
Klawer	ZA	\N	6234
Lemoore	US	\N	26725
Wheeling	US	\N	75392
East Liverpool	US	\N	29898
Balashov	RU	\N	76776
Mazoe	ZW	\N	9966
Cedar Mill	US	\N	17897
Willows	US	\N	7234
Manacapuru	BR	\N	59102
Ostermundigen	CH	\N	17546
Demopolis	US	\N	5701
Biddulph	GB	\N	19892
Newmains	GB	\N	5329
Gisborne	AU	\N	13963
Bardstown	US	\N	21184
Skaneateles	US	\N	7198
Kernersville	US	\N	24660
Mount Zion	US	\N	5795
Wolmirstedt	DE	\N	11536
West Rockhill	US	\N	5263
Hopewell Township	US	\N	12497
Nidderau	DE	\N	20333
St. John's	CA	\N	108860
Zouar	TD	\N	6432
Hermon	US	\N	5867
Munster	US	\N	22476
Tuckahoe	US	\N	48282
Gamagori	JP	\N	80091
Abbots Langley	GB	\N	19574
Larvik	NO	\N	24647
Rancharia	BR	\N	29778
Welwyn Garden City	GB	\N	46619
Shimeo	JP	\N	45918
La Grange	US	\N	15572
Lindstrom	US	\N	9023
Chimakurti	IN	\N	30279
Finley	US	\N	5984
Mnichovo Hradiste	CZ	\N	8846
Villenave-d'Ornon	FR	\N	34090
Feodosiya	UA	\N	67993
Browns Mills	US	\N	10719
Tuskegee	US	\N	7870
Converse	US	\N	28171
Ponnuru	IN	\N	59913
Konigsbrunn	DE	\N	28076
Aintree	GB	\N	6689
Miami Lakes	US	\N	31367
Huejutla de Reyes	MX	\N	115786
Gukovo	RU	\N	64869
Montgeron	FR	\N	23775
Gura Humorului	RO	\N	13667
Burlingame	US	\N	30889
Rakovski	BG	\N	16731
Chegdomyn	RU	\N	14855
Kusnacht	CH	\N	14250
SeaTac	US	\N	29044
Permet	AL	\N	5945
Neuenrade	DE	\N	11982
Neu-Anspach	DE	\N	14618
Targu Neamt	RO	\N	18695
Eliot	US	\N	6484
Garbsen	DE	\N	60754
Overath	DE	\N	27040
Poissy	FR	\N	37388
Greenford	GB	\N	46787
Neu Isenburg	DE	\N	37668
Polk Township	US	\N	7666
Elmshorn	DE	\N	49883
Skewen	GB	\N	8500
Knaresborough	GB	\N	15441
Bad Rappenau	DE	\N	21398
Hyde	GB	\N	34003
White Plains	US	\N	58109
Gornozavodsk	RU	\N	11375
Newtown	GB	\N	11357
Geraldton	AU	\N	37648
Coundon	GB	\N	7139
Pelham	US	\N	23911
Algeciras	ES	\N	111027
Philipstown	US	\N	9724
Isen	JP	\N	6476
Manasquan	US	\N	5806
Dumbarton	US	\N	9036
Heber	US	\N	25877
Yamada	JP	\N	14691
Chancay	PE	\N	32312
Ivanteyevka	RU	\N	79346
Newton Mearns	GB	\N	27660
Ebersbach an der Fils	DE	\N	15535
Mairinque	BR	\N	46015
Svetlograd	RU	\N	35745
Strongsville	US	\N	44660
Hoegaarden	BE	\N	6942
Calau	DE	\N	7769
Closter	US	\N	8511
Oestrich-Winkel	DE	\N	11869
Silsbee	US	\N	9540
Pass Christian	US	\N	6307
Teltow	DE	\N	25825
Repalle	IN	\N	50866
Audubon	US	\N	9195
Bromley	GB	\N	87889
Aquidauana	BR	\N	40803
Kabalo	CD	\N	29833
Grande Prairie	CA	\N	63166
Dunblane	GB	\N	9000
Sinzig	DE	\N	17614
Llanelli	GB	\N	49591
Knittelfeld	AT	\N	12626
Chaska	US	\N	26989
Wilmington	GB	\N	7178
Chiasso	CH	\N	7975
Karben	DE	\N	22127
Steinheim am Main	DE	\N	28403
Tela	HN	\N	78537
Kanyato	TZ	\N	232
Herndon	US	\N	24601
Billerbeck	DE	\N	11566
Attica	US	\N	7239
Presque Isle	US	\N	5651
Hamura	JP	\N	54874
New Ipswich	US	\N	5284
Dowlais	GB	\N	6926
Chatham	CA	\N	101647
Belpre	US	\N	6386
Lebedyan	RU	\N	19288
Awara	JP	\N	27577
Chegga	MR	\N	10
Beverley	GB	\N	29110
Kleinmond	ZA	\N	6634
Kharabali	RU	\N	17968
Des Peres	US	\N	8697
Mangbwalu	CD	\N	2819
Robore	BO	\N	10036
Smithers	CA	\N	5351
Yarmouth	US	\N	23381
Uniontown	US	\N	48137
Abdulino	RU	\N	19222
Melle	DE	\N	46493
Kasamatsucho	JP	\N	22513
Bad Herrenalb	DE	\N	7948
Sukth	AL	\N	15966
Brevnov	CZ	\N	26275
Vilsbiburg	DE	\N	12074
Shiraoka	JP	\N	52094
Linganore	US	\N	8978
Oldeani	TZ	\N	8000
Bradford	US	\N	11311
Uslar	DE	\N	14236
Maple Grove	US	\N	72622
Camilla	US	\N	6488
Ipatovo	RU	\N	23579
Colne	GB	\N	17855
Temiscouata-sur-le-Lac	CA	\N	5096
Fil'akovo	SK	\N	10654
Warlingham	GB	\N	8036
Whistler	CA	\N	11854
Versailles	US	\N	17298
Pisco	PE	\N	109965
Crosspointe	US	\N	5879
Pyu	MM	\N	40386
Naganuma	JP	\N	10709
Metzingen	DE	\N	22046
San Javier	CL	\N	29017
Monroeville	US	\N	27380
Hilpoltstein	DE	\N	13624
Higham Ferrers	GB	\N	7145
Osako	JP	\N	12299
West Hempfield	US	\N	16454
Blairstown	US	\N	5764
Gundelsheim	DE	\N	7254
Burien	US	\N	51500
Itupiranga	BR	\N	21301
Loos	FR	\N	22233
Bellefonte	US	\N	12998
Grigiskes	LT	\N	10580
Novi Iskar	BG	\N	13768
Litomerice	CZ	\N	23849
Pickerington	US	\N	22158
Branson	US	\N	25033
Shumerlya	RU	\N	29553
Pando	UY	\N	25949
Port Hope	CA	\N	16753
Tecklenburg	DE	\N	9145
Ouro Verde	BR	\N	8330
Fair Lakes	US	\N	8314
Walnut Park	US	\N	16034
Chornomors'k	UA	\N	59800
Clewiston	US	\N	14383
Pugachev	RU	\N	14908
Hanson	US	\N	10668
Allington	GB	\N	7100
East Granby	US	\N	5256
Bodhan	IN	\N	77573
Groveport	US	\N	5621
Minster	GB	\N	14789
Caln	US	\N	14198
Zainsk	RU	\N	40366
Jose Bonifacio	BR	\N	35538
Dahlonega	US	\N	6696
Novyy Rozdil	UA	\N	28745
Poquoson	US	\N	12271
Bad Blankenburg	DE	\N	6407
Braselton	US	\N	12961
Neckargemund	DE	\N	13290
Chelsea	US	\N	39690
East Aurora	US	\N	9720
Somerville	US	\N	81360
March	GB	\N	22298
Lake Mills	US	\N	6897
Bloomfield	US	\N	48810
Yasnogorsk	RU	\N	15706
Galveston	US	\N	46514
Dolores	UY	\N	15753
Ponoka	CA	\N	7229
Loma Linda	US	\N	24482
Aioi	JP	\N	28971
Bletchley	GB	\N	37114
San Lorenzo de Esmeraldas	EC	\N	23265
Puchezh	RU	\N	6813
Izobil'nyy	RU	\N	38100
Rincon	US	\N	14201
Box Elder	US	\N	10228
Komagane	JP	\N	32197
Stoke Gifford	GB	\N	15494
Waltham Abbey	GB	\N	21149
Dmitriyev-L'govskiy	RU	\N	6430
Balsadero Rio Verde	CL	\N	358
Shongzhy	KZ	\N	3902
Makhambet	KZ	\N	8905
Ereymentau	KZ	\N	25141
Stannington	GB	\N	10747
Wakefield-Peacedale	US	\N	9092
Anasco	PR	\N	5526
Shimomura	JP	\N	19224
Birkenhead	GB	\N	88818
Pierrefitte-sur-Seine	FR	\N	30306
Sontra	DE	\N	7839
Kehl	DE	\N	36089
Renchen	DE	\N	7361
Shenley Church End	GB	\N	12961
Mishawaka	US	\N	50363
Otis Orchards-East Farms	US	\N	6514
Galena Park	US	\N	10757
Thundersley	GB	\N	15600
Mobara	JP	\N	87450
Kloten	CH	\N	19362
Neftegorsk	RU	\N	17990
Eccles	GB	\N	38756
Buckley	GB	\N	15665
Bulkington	GB	\N	6146
Sehnde	DE	\N	23389
Bogalusa	US	\N	11486
Bando	JP	\N	51903
Dietzenbach	DE	\N	34019
Laurel	US	\N	25844
Ettrick	US	\N	5159
Mount Holly	US	\N	16257
Gaesti	RO	\N	13317
Waimanalo	US	\N	6135
Saint-Henri	CA	\N	5023
Zell im Wiesental	DE	\N	6325
Tapiratiba	BR	\N	13076
North Royalton	US	\N	30068
Abadla	DZ	\N	14364
Entre Rios	BO	\N	2685
Tokamachi	JP	\N	50754
Ogimachi	JP	\N	43617
Ararangua	BR	\N	43444
Strensall	GB	\N	6047
Old Bethpage	US	\N	5522
Crailsheim	DE	\N	34400
Brookside	US	\N	13191
Zyryanka	RU	\N	3627
Soasio	ID	\N	60611
Rosswein	DE	\N	7564
Lismore	AU	\N	28720
Crayford	GB	\N	11226
Roswell	US	\N	94763
Kostinbrod	BG	\N	11430
Duncan	US	\N	20312
Lamont	US	\N	15222
Les Pavillons-sous-Bois	FR	\N	23962
Dionysos	GR	\N	5651
Omaezaki	JP	\N	31262
Owego	US	\N	18985
Larose	US	\N	7529
Oak Lawn	US	\N	55022
Perth East	CA	\N	12261
Hassocks	GB	\N	7667
Las Piedras	PR	\N	6402
White Marsh	US	\N	9455
Felida	US	\N	8311
Robinson	US	\N	11926
Santiago Ixtayutla	MX	\N	13041
Ballston Spa	US	\N	5226
Rikuzen-Takata	JP	\N	18500
Beverungen	DE	\N	13115
Morohongo	JP	\N	35877
Sturry	GB	\N	6820
Norwalk	US	\N	103949
Lapa	BR	\N	25621
Sindelfingen	DE	\N	64858
Lauda-Konigshofen	DE	\N	14542
Juquia	BR	\N	19359
Chanute	US	\N	8983
College	US	\N	13709
Halewood	GB	\N	20116
Steele Creek	US	\N	7380
Al Qurayyat	SA	\N	10000
Burladingen	DE	\N	12146
Agidel	RU	\N	14601
Berezan'	UA	\N	16506
Gardena	US	\N	59329
Encinitas	US	\N	62709
Mizil	RO	\N	14312
Leith	GB	\N	50030
Saint-Remi	CA	\N	7265
Farmville	US	\N	8594
Biesenthal	DE	\N	5791
Catacamas	HN	\N	44198
Shefar`am	IL	\N	41600
Old Tappan	US	\N	5894
McKeesport	US	\N	19009
Rendon	US	\N	13616
Fort Atkinson	US	\N	21196
Kotah-ye `Ashro	AF	\N	35008
Stockport	GB	\N	105878
Bocsa	RO	\N	15842
Tsarevo	BG	\N	6196
Bensley	US	\N	6327
Charlton	US	\N	13482
Mount Shasta	US	\N	7472
Hoylake	GB	\N	5710
Birdsville	AU	\N	140
Poloni	BR	\N	5833
Cross Lanes	US	\N	9619
Sugito	JP	\N	44202
Catford	GB	\N	44905
Fort Myers Shores	US	\N	7010
Titchfield	GB	\N	7280
Phelps	US	\N	6907
North Fayette	US	\N	14617
Baragua	CU	\N	32909
Branford Center	US	\N	6413
Harborcreek	US	\N	17466
Bandipura	IN	\N	27482
Santana	RO	\N	11428
Truckee	US	\N	12554
Llangefni	GB	\N	5116
Lone Grove	US	\N	5121
Boonville	US	\N	9362
Castroville	US	\N	6686
Netivot	IL	\N	31314
Spanish Springs	US	\N	16241
Grangemouth	GB	\N	17906
Armentieres	FR	\N	24882
Rio Grande City	US	\N	48610
Milevsko	CZ	\N	8280
Pires do Rio	BR	\N	24822
Ban Bang Kaeo	TH	\N	56949
Chestnut Ridge	US	\N	8020
Harleysville	US	\N	9553
Kerepestarcsa	HU	\N	12212
Gernsbach	DE	\N	14296
Belvidere	US	\N	25143
Heiligenhaus	DE	\N	26335
Groesbeck	US	\N	6656
Manati	PR	\N	12899
Aquia Harbour	US	\N	6805
Hidden Valley	US	\N	5449
Seydi	TM	\N	20491
Artemovsk	RU	\N	1688
Kawartha Lakes	CA	\N	75423
St. Joseph	US	\N	79161
Callington	GB	\N	5786
Newfane	US	\N	9400
North Dundas	CA	\N	11278
Enumclaw	US	\N	12190
Bouskoura	MA	\N	103026
Upper Chichester	US	\N	16898
Cournon-d'Auvergne	FR	\N	20043
Brookdale	US	\N	9539
Le Cannet	FR	\N	41471
Mildenhall	GB	\N	10315
Longridge	GB	\N	7724
Cowdenbeath	GB	\N	14081
Mineshita	JP	\N	108118
Taishi	JP	\N	13213
Pittsburg	US	\N	72588
I-n-Amguel	DZ	\N	3030
Woodfield	US	\N	9730
Iwai	JP	\N	10919
Hanumannagar	NP	\N	37738
Broadalbin	US	\N	5153
Nipomo	US	\N	17445
Krasnoufimsk	RU	\N	38395
Port Royal	US	\N	13235
Mount Cotton	AU	\N	6835
Waller	US	\N	7894
Ojo Caliente	MX	\N	6914
View Royal	CA	\N	10408
Upper Providence	US	\N	23589
Hod HaSharon	IL	\N	56659
Radeburg	DE	\N	7325
Nebraska City	US	\N	7069
Mentone	US	\N	9847
Fairless Hills	US	\N	8376
Falciu	RO	\N	5103
Incline Village	US	\N	8491
Pinkafeld	AT	\N	5779
Old Chelsea	CA	\N	6909
Verkhivtseve	UA	\N	16364
Atchison	US	\N	10613
Jacarezinho	BR	\N	35090
Villemomble	FR	\N	29964
Delle	FR	\N	5690
Sokolo	ML	\N	4374
Sullivan	US	\N	15237
Rodgau	DE	\N	45202
Highland Park	US	\N	29515
Columbia City	US	\N	9735
Ashford	GB	\N	74204
Hoosick	US	\N	6816
Cascades	US	\N	11670
Layla	SA	\N	30906
Handlova	SK	\N	17119
Kyaukpyu	MM	\N	4261
Westerland	DE	\N	9032
Ineu	RO	\N	9260
Rolla	US	\N	21059
Kushimoto	JP	\N	15093
North Salt Lake	US	\N	20948
Picnic Point	US	\N	8976
Worksop	GB	\N	41820
Cuamba	MZ	\N	73268
Rodenberg	DE	\N	6505
Bilac	BR	\N	7682
Eatontown	US	\N	12157
Neiafu	TO	\N	7391
Spring Ridge	US	\N	5859
Meredith	US	\N	6369
Hidden Valley Lake	US	\N	6044
Hondo	US	\N	6889
Northwich	GB	\N	19924
Gallatin	US	\N	42918
Bangor	GB	\N	61011
Lossiemouth	GB	\N	6803
Manily	RU	\N	10
Langelsheim	DE	\N	11361
Saint-Priest	FR	\N	46207
Maues	BR	\N	32561
Horseheads	US	\N	19293
Kitatajima	JP	\N	19758
Capitola	US	\N	10010
Audley	GB	\N	8437
Reichenbach/Vogtland	DE	\N	20625
Jarinu	BR	\N	27473
Krasnovishersk	RU	\N	15359
Carlisle	GB	\N	75306
Rostraver	US	\N	11127
Millington	US	\N	10641
Lisbon	US	\N	8896
Isperih	BG	\N	11797
East Calder	GB	\N	5790
Earl	US	\N	7169
Zeven	DE	\N	13809
Lydd	GB	\N	6567
Niesky	DE	\N	9402
Hornchurch	GB	\N	63583
Laranjal Paulista	BR	\N	27384
Aylmer	CA	\N	7492
Hoi An	VN	\N	121716
Merrillville	US	\N	34792
Hove	GB	\N	91900
Ilmenau	DE	\N	39017
Sandiacre	GB	\N	8889
Polaniec	PL	\N	8419
Jupiter	US	\N	65791
Mahomet	US	\N	13094
Saint Agnes	GB	\N	7565
Struthers	US	\N	10111
Guilderland	US	\N	35655
Valley Falls	US	\N	11828
Brackenheim	DE	\N	16106
Vore	AL	\N	10901
Normanton	GB	\N	20872
Pithapuram	IN	\N	54859
Mascotte	US	\N	6315
Somcuta Mare	RO	\N	7565
Ocna Mures	RO	\N	13036
River Grove	US	\N	9883
Kenner	US	\N	66340
Juchen	DE	\N	23337
Gryazi	RU	\N	46492
Beckwith	CA	\N	7644
Qorasuv	UZ	\N	19454
Borzya	RU	\N	28888
Erechim	BR	\N	96087
Lancaster	GB	\N	52234
Maghull	GB	\N	20444
Beslan	RU	\N	37029
Pradopolis	BR	\N	19814
Victorias	PH	\N	87933
Venkatagiri	IN	\N	52688
Destin	US	\N	14247
Visselhovede	DE	\N	9629
Bollington	GB	\N	7885
Pushkino	RU	\N	105479
Wade Hampton	US	\N	20925
Togitsu	JP	\N	29375
Rosh Ha`Ayin	IL	\N	56300
Ena	JP	\N	48777
Vallegrande	BO	\N	16837
Demmin	DE	\N	10657
Cockeysville	US	\N	22071
Union	US	\N	58158
Conchal	BR	\N	27132
Cape Canaveral	US	\N	10470
Trzemeszno	PL	\N	7792
Batemans Bay	AU	\N	11294
Qaracuxur	AZ	\N	85900
Konza	KE	\N	2004
Port Morant	JM	\N	11536
Sodus	US	\N	8116
Anamosa	US	\N	5500
Brosteni	RO	\N	5506
Neuenburg am Rhein	DE	\N	12437
Whitehouse	US	\N	8905
Granville	US	\N	6503
Fairlawn	US	\N	7514
Newton	US	\N	88414
Hanover Park	US	\N	37426
Ba	FJ	\N	18526
Noisy-le-Grand	FR	\N	68183
Cheltenham	GB	\N	116447
Perivale	GB	\N	15339
Perry Barr	GB	\N	23652
Prevost	CA	\N	12171
Pryor Creek	US	\N	9169
Mezen	RU	\N	3267
Ra's Gharib	EG	\N	32318
Daleville	US	\N	5102
Plymouth Township	US	\N	17421
Antonio Enes	MZ	\N	57835
Krasnogvardeyskoye	RU	\N	7205
Swainsboro	US	\N	7757
Kakuda	JP	\N	28623
Sultan	US	\N	9246
Demidov	RU	\N	6213
Arlesey	GB	\N	5584
Labasa	FJ	\N	27949
Colesberg	ZA	\N	12423
Solvang	US	\N	16540
Nieheim	DE	\N	6093
Gloggnitz	AT	\N	5916
Milanowek	PL	\N	16419
Nottingham	US	\N	5004
Connellsville	US	\N	7290
Prien	US	\N	7976
Ocean	US	\N	26821
Berea	US	\N	18609
Nanbei	JP	\N	41814
Heanor	GB	\N	17251
Cornelius	US	\N	30257
Wokingham	GB	\N	46745
Plaquemine	US	\N	6539
Pressbaum	AT	\N	7559
Le Grand-Quevilly	FR	\N	25698
Kamitakeshi	JP	\N	6847
Charikot	NP	\N	7349
Paisley	GB	\N	77310
McComb	US	\N	16672
Hufingen	DE	\N	7799
Chickasaw	US	\N	5702
Plaisir	FR	\N	31419
Mount Healthy	US	\N	6736
Korkino	RU	\N	34672
Watauga	US	\N	24481
Weaverham	GB	\N	6391
Nakatsu	JP	\N	82875
Nishihara	JP	\N	34741
Toma	JP	\N	6441
Nova Bana	SK	\N	7364
Santa Cruz	EC	\N	11262
Gaithersburg	US	\N	67985
Frolovo	RU	\N	36951
Cibolo	US	\N	31281
Tavda	RU	\N	33356
New Milford	US	\N	27196
Selfoss	IS	\N	6878
Picos	BR	\N	57495
Camp Verde	US	\N	11187
Blandon	US	\N	7837
Ogunimachi	JP	\N	7142
Rosamond	US	\N	20028
Epping	US	\N	6945
Souda	GR	\N	6358
Pasadena Hills	US	\N	10216
Radford	US	\N	18249
Uonuma	JP	\N	34895
Rochford	GB	\N	8471
Clementina	BR	\N	7992
Braintree	US	\N	37190
Grantsville	US	\N	9052
Longmeadow	US	\N	15830
Whittlesey	GB	\N	16058
Iacri	BR	\N	6481
Lac-Brome	CA	\N	58889
Ashfield-Colborne-Wawanosh	CA	\N	5422
Stadtroda	DE	\N	6692
Bumbesti-Jiu	RO	\N	8932
Ecclesfield	GB	\N	32073
Smithville	US	\N	10795
Amory	US	\N	6098
Bilston	GB	\N	25576
Bloomsburg	US	\N	49840
Kerrville	US	\N	30623
Greeneville	US	\N	23683
Beruniy	UZ	\N	50700
Tres Lagoas	BR	\N	78712
Pendleton	US	\N	17398
Tepetitlan	MX	\N	8893
Blaubeuren	DE	\N	12521
Avrig	RO	\N	12815
Epsom	GB	\N	31489
Gray	US	\N	8085
Santa Elena	AR	\N	17791
La Crescent	US	\N	5029
Thomaston	US	\N	13759
Mitai	JP	\N	11959
Airdrie	GB	\N	36620
Alfred	US	\N	5067
Ilam	NP	\N	17491
East Haddam	US	\N	9032
Taucha	DE	\N	15673
Miramar	MX	\N	118614
Granja	BR	\N	25879
Las Heras	AR	\N	66663
Battle	GB	\N	6673
Amblecote	GB	\N	13393
Caras	PE	\N	23841
Southampton	US	\N	57975
Takikawa	JP	\N	39960
Hagenbach	DE	\N	5523
Kingsteignton	GB	\N	10600
South Berwick	US	\N	7420
Rottenburg an der Laaber	DE	\N	8267
Mechanicsville	US	\N	37501
Palmview South	US	\N	5352
Strongoli	IT	\N	6518
Gary	US	\N	74879
Montague	US	\N	8334
Hikawadai	JP	\N	11278
Murgeni	RO	\N	7119
Nyandoma	RU	\N	19783
Lanco	CL	\N	8521
Buckingham	US	\N	20270
Kholmsk	RU	\N	27954
Montville	US	\N	21516
Pleasant Valley	US	\N	9715
Decin	CZ	\N	48594
Elmsford	US	\N	5216
Porto Feliz	BR	\N	51928
Tustin	US	\N	79348
Millville	US	\N	27391
Newport	US	\N	24334
Zlatna	RO	\N	7490
St. Helens	US	\N	27353
Kursenai	LT	\N	11175
Weinheim	DE	\N	45284
Pleasant Prairie	US	\N	21034
Largo	US	\N	84948
Landau an der Isar	DE	\N	13390
Agdam	AZ	\N	3770
Tsuruoka	JP	\N	123437
Mainburg	DE	\N	15241
Golden Valley	US	\N	21886
Neratovice	CZ	\N	16191
Lemont	US	\N	17291
Terrujem	PT	\N	5113
St. Paul Park	US	\N	5362
Sleaford	GB	\N	17671
Brockworth	GB	\N	7387
Glucholazy	PL	\N	15293
Palm Valley	US	\N	21562
Areiopolis	BR	\N	11049
Al Husayniyah	EG	\N	30825
Siraha	NP	\N	28442
El Centenario	MX	\N	6068
Chelmsford	US	\N	35086
Muri	CH	\N	13058
Lynwood	US	\N	69887
Saliste	RO	\N	5421
Orcutt	US	\N	30493
Lota	CL	\N	43272
Worth	US	\N	10466
Murata	JP	\N	10858
Amelia	US	\N	5039
Montereau-faut-Yonne	FR	\N	20206
Sarasota Springs	US	\N	15781
Vernon Hills	US	\N	26521
Ilhabela	BR	\N	32197
Bexley	US	\N	13770
Du Quoin	US	\N	6001
Allen Park	US	\N	26940
Esik	KZ	\N	36715
Raynes Park	GB	\N	9738
Tonantins	BR	\N	4561
Hackettstown	US	\N	9356
Scottsboro	US	\N	9841
Quata	BR	\N	13702
Florence-Graham	US	\N	64162
Gammertingen	DE	\N	6320
Schwetzingen	DE	\N	21433
Horw	CH	\N	14107
Vorozhba	UA	\N	6972
Friendly	US	\N	9793
Bordj Mokhtar	DZ	\N	16437
Tinipuka	ID	\N	26021
Peachtree Corners	US	\N	43905
Downey	US	\N	111126
Valasske Mezirici	CZ	\N	22306
Taltal	CL	\N	10018
Krasnouralsk	RU	\N	22996
Royalton	US	\N	7532
Beckley	US	\N	57942
Hermiston	US	\N	29512
Auerbach	DE	\N	18357
Manhattan Beach	US	\N	35183
Beeston	GB	\N	37000
Bad Freienwalde	DE	\N	12365
Towson	US	\N	58347
Adams Township	US	\N	13467
Chulumani	BO	\N	13204
Aral	KZ	\N	29887
Dumont	US	\N	17516
Brush	US	\N	5769
Westerville	US	\N	41103
Bucyrus	US	\N	11800
Lindfield	GB	\N	5394
Al Madrah Sama'il	OM	\N	47718
Kaspiyskiy	RU	\N	13125
Deysbrook	GB	\N	14490
Verkhoturye	RU	\N	8612
Darlowo	PL	\N	13943
East Whittier	US	\N	10391
Wunnenberg	DE	\N	12177
Straelen	DE	\N	16114
Halifax	GB	\N	88134
Hershey	US	\N	14542
Tukuyu	TZ	\N	127570
Bagua Grande	PE	\N	40947
Ivry-sur-Seine	FR	\N	62052
Unionville	US	\N	7195
Pestovo	RU	\N	15269
Sao Sebastiao da Grama	BR	\N	12355
Jefferson	US	\N	21191
Rutland	US	\N	18131
Ocean Shores	AU	\N	5137
Vredenburg	ZA	\N	38382
Hillsdale	US	\N	11223
Hayashima	JP	\N	12409
Johnstown	US	\N	63141
Porto Seguro	BR	\N	123173
Ishikari	JP	\N	58277
Kargat	RU	\N	9370
Batesburg-Leesville	US	\N	5318
Vashon	US	\N	10036
Honiton	GB	\N	11822
Lincoln Park	US	\N	36321
Potsdam	US	\N	15694
Pully	CH	\N	18313
Croydon	US	\N	9675
Lusanga	CD	\N	177
Wrightsboro	US	\N	5233
Tonawanda	US	\N	14745
Forest Park	US	\N	20020
Sioux City	US	\N	106455
Krnov	CZ	\N	23257
Spring Grove	US	\N	5706
Katwe	UG	\N	1957
Negresti	RO	\N	8380
Prairie View	US	\N	6944
Vel'ky Meder	SK	\N	8828
London	US	\N	37714
Madeira	US	\N	9245
Korgas	CN	\N	85000
Nausori	FJ	\N	47604
Sabang	ID	\N	38077
Formiga	BR	\N	56404
Arbutus	US	\N	20259
Ystrad Mynach	GB	\N	13500
Thum	DE	\N	5146
Stanton	US	\N	38139
Parintins	BR	\N	64428
Ramat HaSharon	IL	\N	46700
Lye	GB	\N	12346
Genappe	BE	\N	15353
Vatican City	VA	\N	825
Kibiti	TZ	\N	30163
St. Clairsville	US	\N	5141
Theodore	AU	\N	438
Floriano	BR	\N	48587
Praia da Vitoria	PT	\N	21035
Rupert	US	\N	6733
Lemoore Station	US	\N	7063
Trophy Club	US	\N	12451
Kirishi	RU	\N	50885
Central Saanich	CA	\N	16814
Chickasha	US	\N	16126
Cafelandia	BR	\N	17499
Nizhnyaya Salda	RU	\N	17373
Hoquiam	US	\N	8655
Batagay	RU	\N	4266
Kok-Janggak	KG	\N	15000
Tremosna	CZ	\N	5082
East Northport	US	\N	20136
Voorhees	US	\N	29217
Veliki Preslav	BG	\N	9196
Derne	DE	\N	29662
Haci Zeynalabdin	AZ	\N	22000
St. Clair	CA	\N	14086
Mount Sterling	US	\N	11363
Ebern	DE	\N	7270
Tredyffrin	US	\N	29481
Geesthacht	DE	\N	30551
Ndende	GA	\N	6200
Maebara	JP	\N	32196
Welwyn	GB	\N	8425
Lowell	US	\N	110997
Waldeck	DE	\N	6761
Sengiley	RU	\N	6405
Notre-Dame-de-l'Ile-Perrot	CA	\N	10756
Moskovskiy	RU	\N	50167
Fairburn	US	\N	16768
New London	US	\N	26858
Zefat	IL	\N	35700
Kachkanar	RU	\N	38996
Westfield	US	\N	43649
Howell	US	\N	51958
Crofton	GB	\N	5781
Frostproof	US	\N	8312
Jacinto City	US	\N	10466
Takashima	JP	\N	47124
Eidaicho	JP	\N	5151
Boardman	US	\N	34557
Westmoreland	US	\N	6072
Bersenbruck	DE	\N	8501
Woodway	US	\N	9024
Kempston	GB	\N	19440
Rio Verde	BR	\N	48318
Swansboro	US	\N	20507
Rio Espera	BR	\N	6070
Kamiyoshida	JP	\N	47211
Hall in Tirol	AT	\N	13897
Halifax	US	\N	7824
Trowbridge	GB	\N	33108
Jesus Nazareno	AR	\N	6875
Kalima	CD	\N	194
Neya	RU	\N	8865
Eltham	GB	\N	48964
Trinity	US	\N	10646
Chalmette	US	\N	23602
Kitagata	JP	\N	18271
Filey	GB	\N	6981
Kozmodemyansk	RU	\N	20505
Salvador	CU	\N	45773
Norden	DE	\N	25060
Dondo	AO	\N	2353
Muttenz	CH	\N	17805
Oak Point	US	\N	5762
Kondrovo	RU	\N	14857
Ust'-Katav	RU	\N	22042
Ancient Oaks	US	\N	7554
Grajau	BR	\N	30217
South Portland	US	\N	25532
Eccleston	GB	\N	10433
Slidell	US	\N	93040
Bozeman	US	\N	57695
Drummond/North Elmsley	CA	\N	7773
Santona	ES	\N	11024
Brewster	US	\N	9868
Sandusky	US	\N	46655
Naval Academy	US	\N	5834
San Lorenzo	PR	\N	7629
Ituiutaba	BR	\N	97171
Tocache Nuevo	PE	\N	29029
Leduc	CA	\N	29993
Willerby	GB	\N	7940
Brighton Township	US	\N	36447
Baturite	BR	\N	22417
Robbinsdale	US	\N	14389
West Chicago	US	\N	26816
Valencia de Alcantara	ES	\N	5397
North St. Paul	US	\N	12506
Golden Gate	US	\N	30104
Helensburgh	GB	\N	15430
Willowbrook	US	\N	22402
Svobodnyy	RU	\N	53678
Camabatela	AO	\N	12837
Santa Catarina Juquila	MX	\N	15987
High Ackworth	GB	\N	7049
Williamsville	US	\N	5220
Nikolskoye	RU	\N	22286
Ust'-Olenek	RU	\N	10
Potomac	US	\N	45824
Matay	EG	\N	46903
Miracema	BR	\N	26684
Polyarnyye Zori	RU	\N	14421
Tabernacle	US	\N	6868
Cupertino	US	\N	59276
La Concordia	EC	\N	29003
Spring Township	US	\N	27463
Krasnoslobodsk	RU	\N	17327
Stuhlingen	DE	\N	5327
Ludington	US	\N	10752
West Haverstraw	US	\N	10189
Iver	GB	\N	11119
Comstock Park	US	\N	10374
Woodlyn	US	\N	9326
Dumbraveni	RO	\N	7388
Orrville	US	\N	8603
Nove Straseci	CZ	\N	5572
Shakhtinsk	KZ	\N	37899
Frejus	FR	\N	52672
North Aurora	US	\N	18057
Le Plessis-Robinson	FR	\N	29100
Warzat	MA	\N	71067
West Miami	US	\N	8767
Cristalina	BR	\N	36531
Susuman	RU	\N	4760
Wodonga	AU	\N	35130
Arbon	CH	\N	14537
Potters Bar	GB	\N	21639
Lesozavodsk	RU	\N	37034
Triunfo	BR	\N	15006
Pechory	RU	\N	9670
New Plymouth	NZ	\N	55300
West St. Paul	US	\N	19961
Collingswood	US	\N	13884
Kasuga	JP	\N	47554
Chesapeake Ranch Estates	US	\N	9732
Nevel	RU	\N	14819
Ban Laem Chabang	TH	\N	77798
Eagle Pass	US	\N	55686
Ahuimanu	US	\N	8239
Willoughby	US	\N	22977
Beloit	US	\N	63762
Bur Fu'ad	EG	\N	70417
Byerazino	BY	\N	11300
Rio Bueno	CL	\N	16909
Bastrop	US	\N	17120
Villa Alemana	CL	\N	125140
Severouralsk	RU	\N	26543
Ellicott City	US	\N	72247
Mwenga	CD	\N	2216
Turinsk	RU	\N	17060
Zheleznogorsk	RU	\N	100740
Louvain-la-Neuve	BE	\N	31551
Clamart	FR	\N	52971
Geoagiu	RO	\N	5294
Lehliu-Gara	RO	\N	6502
Abercynon	GB	\N	6390
Motupe	PE	\N	13681
Trebechovice pod Orebem	CZ	\N	5771
Amsterdam	US	\N	21241
Paola	US	\N	5512
San Buenaventura	US	\N	109106
Conflans-Sainte-Honorine	FR	\N	35846
Krasnyy Kholm	RU	\N	5140
Morwell	AU	\N	14026
Franklin	US	\N	83097
Teplice	CZ	\N	49731
Kobilo	SN	\N	21656
Lincoln Village	US	\N	10071
Provideniya	RU	\N	2536
Buchen in Odenwald	DE	\N	17796
Sobernheim	DE	\N	6573
Kingman	US	\N	46524
Obernkirchen	DE	\N	9246
Orleans	US	\N	5821
Alerce	CL	\N	42267
Kiselevsk	RU	\N	89867
Great Neck Plaza	US	\N	7027
Linguere	SN	\N	15482
Broadstone	GB	\N	10303
Bellows Falls	US	\N	5381
Yemva	RU	\N	12630
Tewksbury	US	\N	31002
Dover	US	\N	117282
New Canaan	US	\N	20273
North Bay Shore	US	\N	21045
Montvale	US	\N	8570
Hamilton Square	US	\N	12542
Minneola	US	\N	12595
Pomichna	UA	\N	8994
Radnor	US	\N	31743
Clydach	GB	\N	7503
Lima	US	\N	68878
Bell	US	\N	35521
Schortens	DE	\N	20329
Sienna Plantation	US	\N	16996
Tole Bi	KZ	\N	19551
Forres	GB	\N	12587
Bansbaria	IN	\N	103920
Aylesford	GB	\N	10660
Freienbach	CH	\N	16269
Charenton-le-Pont	FR	\N	30374
Harlau	RO	\N	10905
National City	US	\N	61394
Lake Lorraine	US	\N	7095
Kolleda	DE	\N	6391
DeKalb	US	\N	66959
Chapayevsk	RU	\N	72778
San Rafael	US	\N	58440
Toya	JP	\N	8742
Saint-Martin-d'Heres	FR	\N	38487
Calulo	AO	\N	795
Tillsonburg	CA	\N	15872
Il'pyrskiy	RU	\N	10
Landen	US	\N	7214
St. Rose	US	\N	7665
Arcadia	US	\N	57939
Ust'-Nera	RU	\N	9148
Navadwip	IN	\N	125543
Dysart et al	CA	\N	6280
Aisai	JP	\N	61234
Shiprock	US	\N	8966
Namanga	KE	\N	13193
Leninsk-Kuznetskiy	RU	\N	96139
Manalapan	US	\N	39853
Kotovo	RU	\N	21990
Palapye	BW	\N	36211
Grunberg	DE	\N	13598
Melsungen	DE	\N	13659
Kierspe	DE	\N	16137
Mucusso	AO	\N	100
Oroville	US	\N	49513
Shopokov	KG	\N	8749
Bossier City	US	\N	68159
Danilov	RU	\N	14746
Fryazino	RU	\N	60437
Uryzhar	KZ	\N	14826
Teglas	HU	\N	6406
Fort Erie	CA	\N	30710
Wrightsville	US	\N	5688
Elk City	US	\N	10746
Narimanov	RU	\N	11079
Koidu-Bulma	SL	\N	87539
Hujra Shah Muqim	PK	\N	70204
Sovetskaya Gavan'	RU	\N	25147
Pershotravens'k	UA	\N	28363
Waterloo	CA	\N	104986
Hazel Dell	US	\N	21066
Harborne	GB	\N	23001
Caiua	BR	\N	5560
Rotherham	GB	\N	109691
Campeni	RO	\N	7629
Raymondville	US	\N	13963
El Sobrante	US	\N	13966
Scoresbysund	GL	\N	539
Al Quway`iyah	SA	\N	8712
Sembe	CG	\N	9679
Golcar	GB	\N	17000
Sawbridgeworth	GB	\N	8458
Yugorsk	RU	\N	37422
Haka	MM	\N	20000
West View	US	\N	6516
Macdonald	CA	\N	7162
Taiynsha	KZ	\N	12418
Zarechnyy	RU	\N	65156
Gouvy	BE	\N	5206
Summerlin South	US	\N	27506
Houghton le Spring	GB	\N	36746
Mahtomedi	US	\N	8294
Palafrugell	ES	\N	21049
Country Club Hills	US	\N	16482
Angermunde	DE	\N	13744
Boituva	BR	\N	55725
Winkler	CA	\N	12660
Kanie	JP	\N	37048
Karabash	RU	\N	10999
South Kingstown	US	\N	30735
Kuppenheim	DE	\N	8330
Mumias	KE	\N	99987
Dwight	US	\N	5005
Kostelec nad Orlici	CZ	\N	6145
Putnam	US	\N	9360
Hazel Crest	US	\N	13565
Fort Hunt	US	\N	16858
Cottonwood	US	\N	12253
Kailua	US	\N	36662
Corning	US	\N	19296
Saint-Ouen-l'Aumone	FR	\N	23741
Fabens	US	\N	5946
Lee Acres	US	\N	6084
Temnikov	RU	\N	6179
Cartersville	US	\N	57873
Villeneuve-le-Roi	FR	\N	21384
Winder	US	\N	48125
Orchard Mesa	US	\N	6601
Mednogorsk	RU	\N	25272
Gamba	GA	\N	9928
Macedon	US	\N	8976
`Alavicheh	IR	\N	5692
Kempsey	AU	\N	15309
Sheringham	GB	\N	7367
Mount Laurel	US	\N	41518
Waukesha	US	\N	72299
Cortes	BR	\N	12452
Le Roy	US	\N	7379
Fort Bliss	US	\N	10602
Takamori	JP	\N	5895
Pimmit Hills	US	\N	6506
Gingin	AU	\N	852
Fruitland Park	US	\N	10730
Kanada	JP	\N	36280
Lentvaris	LT	\N	10286
Augusta	CA	\N	7353
Leola	US	\N	7352
Chota	PE	\N	54611
Almonte	ES	\N	24191
Henin-Beaumont	FR	\N	26022
Wapato	US	\N	7627
Usworth	GB	\N	9100
Carbondale	US	\N	65671
Forster	AU	\N	13740
Chillicothe	US	\N	31999
Jaranwala	PK	\N	127973
Wilson	US	\N	49483
Sherwood Manor	US	\N	5438
Atwater	US	\N	29559
Helena-West Helena	US	\N	9493
Moreton	GB	\N	17670
Lakeview	US	\N	6317
Flagstaff	US	\N	81974
Tauranga	NZ	\N	135000
Thurso	GB	\N	7933
Oswestry	GB	\N	17105
Goris	AM	\N	20591
Nomimachi	JP	\N	49200
Manassas Park	US	\N	17478
Belding	US	\N	5771
Edgware	GB	\N	76506
Petite-Rosselle	FR	\N	6338
White Rock	US	\N	5809
West Slope	US	\N	7498
Worth am Rhein	DE	\N	18123
Gland	CH	\N	13106
Vyshneve	UA	\N	40919
Wolcott	US	\N	16652
Estherville	US	\N	5516
Uray	RU	\N	40559
Natividade da Serra	BR	\N	6786
Boulder Hill	US	\N	9179
Isanti	US	\N	6120
Page	US	\N	6924
Micco	US	\N	8956
Zhosaly	KZ	\N	20065
Gishi	JP	\N	39835
Kieta	PG	\N	6958
Harrisonburg	US	\N	72386
San Fernando	US	\N	24322
Feltham	GB	\N	63368
North Madison	US	\N	8573
Slaton	US	\N	5713
Buckhurst Hill	GB	\N	11380
Kalbarri	AU	\N	1349
Zvenigorod	RU	\N	22513
Kurtamysh	RU	\N	16579
Andergrove	AU	\N	9419
El Arenal	MX	\N	15037
Wasquehal	FR	\N	20479
Kitaibaraki	JP	\N	42122
Marovoay	MG	\N	31253
Southbridge	US	\N	16878
Bobbili	IN	\N	56819
Ipigua	BR	\N	5022
Zwonitz	DE	\N	11993
Khrustalnyi	UA	\N	124000
Marble Falls	US	\N	7099
Taiacu	BR	\N	6205
Iwaizumi	JP	\N	8949
Sunbury	AU	\N	36084
Tawau	MY	\N	113809
Jenison	US	\N	17794
Menasha	US	\N	17873
Lodeynoye Pole	RU	\N	19458
Tracy	US	\N	100049
Cheam	GB	\N	10285
Ocean Acres	US	\N	16803
Enid	US	\N	47907
Eisenhuttenstadt	DE	\N	24633
Longchamps	AR	\N	47622
Killingworth	GB	\N	20079
North Branford	US	\N	14208
Smiths Falls	CA	\N	8780
Mananjary	MG	\N	27686
Cypress Lake	US	\N	13120
Sainte-Anne-des-Plaines	CA	\N	14421
Mishan	CN	\N	87257
Slippery Rock	US	\N	6541
Moscow	US	\N	26145
Velizh	RU	\N	6788
East Preston	GB	\N	5938
Rotha	DE	\N	6141
Bumba	CD	\N	103328
Hemmingen	DE	\N	18998
Delbruck	DE	\N	31949
Kindberg	AT	\N	8047
Hauzenberg	DE	\N	11649
Antrim	US	\N	15528
Montagu	ZA	\N	15176
Helena	US	\N	52936
Loudon	US	\N	5890
Dapitan	PH	\N	82418
Kendall	US	\N	74631
Takanabe	JP	\N	20185
Baltasar Brum	UY	\N	2517
Portland	AU	\N	10900
San Elizario	US	\N	9089
Dharmsala	IN	\N	19034
Ciechocinek	PL	\N	10874
Rancho Mirage	US	\N	18528
Nakatsugawa	JP	\N	76442
Palm Springs North	US	\N	5515
Elze	DE	\N	8939
Silver Lakes	US	\N	5966
Fort Leonard Wood	US	\N	15882
Buckhaven	GB	\N	16391
Hickory Hills	US	\N	13710
Progress Village	US	\N	10136
Qusmuryn	KZ	\N	8049
Pinchbeck	GB	\N	5153
Pawtucket	US	\N	72117
Arcueil	FR	\N	21501
Pinole	US	\N	19250
West New York	US	\N	52723
Fox Crossing	US	\N	19012
Tosno	RU	\N	37509
Anglet	FR	\N	38929
Estes Park	US	\N	7769
Ripponden	GB	\N	7421
Visp	CH	\N	7891
Brotton	GB	\N	5394
Wilmette	US	\N	27089
Huyton	GB	\N	33193
Orindiuva	BR	\N	6493
Little Hulton	GB	\N	13469
Washington Township	US	\N	47809
Bad Oeynhausen	DE	\N	48702
West Bountiful	US	\N	5800
South Farmingdale	US	\N	14953
Saratoga	US	\N	30153
Glencoe	US	\N	8826
Welcome	US	\N	7394
Sebis	RO	\N	5979
Broome	AU	\N	14445
Lower Windsor	US	\N	7514
Los Alamos	US	\N	12373
Chachahuantla	MX	\N	20619
Dearborn	US	\N	93932
Hadleigh	GB	\N	18300
Streetsboro	US	\N	16478
Ozoir-la-Ferriere	FR	\N	20331
South Houston	US	\N	17438
Arsk	RU	\N	20540
Cranford	US	\N	23882
Winton	AU	\N	875
San Vito dei Normanni	IT	\N	19095
Rolling Hills Estates	US	\N	8058
Pendlebury	GB	\N	13069
Livermore	US	\N	90923
Mexico	US	\N	11330
Salinas	EC	\N	34719
Miandrivazo	MG	\N	20631
Buckhall	US	\N	17238
Fort Payne	US	\N	7049
Tyldesley	GB	\N	16142
Mechernich	DE	\N	27598
Luanshya	ZM	\N	117579
Yabu	JP	\N	22358
Lampertheim	DE	\N	32537
Adams	US	\N	8172
Marsh Harbour	BS	\N	6283
Notre Dame	US	\N	6584
Denby Dale	GB	\N	16365
Chulym	RU	\N	11216
Colomiers	FR	\N	38951
Laubach	DE	\N	9583
Stara Tura	SK	\N	8932
Nerokouros	GR	\N	5531
San Javier	BO	\N	4210
Ligonha	MZ	\N	3500
Oak Grove	US	\N	17183
Warwick	AU	\N	15380
Kamaishi	JP	\N	34118
Kundian	PK	\N	35406
Tamchen	MX	\N	6307
Westhoughton	GB	\N	24974
Berrien Springs	US	\N	7060
Naguabo	PR	\N	5220
Darganata	TM	\N	7212
Schwedt (Oder)	DE	\N	29920
Stroudsburg	US	\N	5558
Schramberg	DE	\N	21189
East Hills	US	\N	7233
Skowhegan	US	\N	8281
Mikumi	TZ	\N	16780
Evington	GB	\N	11133
Hanawa	JP	\N	29727
Easthampton	US	\N	15829
Braunton	GB	\N	7353
Highgate	GB	\N	10955
Hailsham	GB	\N	20476
Ipu	BR	\N	26678
Aracoiaba da Serra	BR	\N	31321
Porangaba	BR	\N	9299
Miramas	FR	\N	26470
Wakefield	US	\N	26960
Lathrop	US	\N	24483
Villepinte	FR	\N	36830
Meersburg	DE	\N	5944
South Sarasota	US	\N	5316
Shatsk	RU	\N	5935
Schroeppel	US	\N	8238
Marlboro Village	US	\N	9803
Sesheke	ZM	\N	20149
Sakib	JO	\N	11586
Rakovnik	CZ	\N	15709
Santo Antonio da Alegria	BR	\N	6739
Lilburn	US	\N	12810
Doffing	US	\N	5065
Pleasantville	US	\N	20149
Plavsk	RU	\N	15920
Sittingbourne	GB	\N	62500
Granite Bay	US	\N	22439
Jefferson Township	US	\N	5325
Fort Mohave	US	\N	15228
Casino	AU	\N	10914
Bais	PH	\N	76291
Schopfheim	DE	\N	19645
Mapleton	CA	\N	10527
Prescott	US	\N	44299
Chelles	FR	\N	54917
Novy Jicin	CZ	\N	23260
Fairwood	US	\N	19428
Martins Ferry	US	\N	6517
Saint-Chamond	FR	\N	34967
Cajati	BR	\N	28962
Rotkreuz	CH	\N	10857
Christiansburg	US	\N	22473
Khromtau	KZ	\N	23715
Goose Creek	US	\N	43665
Moyale	KE	\N	24837
Lealman	US	\N	21281
Barwon Heads	AU	\N	14165
Mayaguez	PR	\N	62579
San Buenaventura	MX	\N	48037
Stornoway	GB	\N	8038
Methil	GB	\N	10800
Woodlake	US	\N	7854
Reinfeld	DE	\N	9058
Spruce Grove	CA	\N	34066
Gwacheon	KR	\N	64817
Langley Park	US	\N	19278
Norco	US	\N	26604
Stewarton	GB	\N	6584
Torzhok	RU	\N	45641
Freetown	US	\N	9251
Needles	US	\N	8752
Teteven	BG	\N	10279
Walthamstow	GB	\N	109424
Upland	US	\N	77140
Harwinton	US	\N	5469
Roxborough Park	US	\N	9452
Loudoun Valley Estates	US	\N	7528
Kotelnich	RU	\N	23682
Eislingen	DE	\N	20885
Lomas del Mirador	AR	\N	71479
South Whitehall	US	\N	19686
Eudora	US	\N	6415
Pusztaszabolcs	HU	\N	5845
Bad Marienberg	DE	\N	5961
Sudley	US	\N	17612
Village Green-Green Ridge	US	\N	8187
Reutov	RU	\N	106990
Scotch Plains	US	\N	24183
Johnson Lane	US	\N	6065
Rinopolis	BR	\N	10133
Stolberg	DE	\N	56792
Wyandanch	US	\N	11612
Drayton	GB	\N	5489
Betzdorf	DE	\N	10141
Belev	RU	\N	13180
Bayport	US	\N	8392
South Pasadena	US	\N	25329
Puke	AL	\N	3607
Dassel	DE	\N	9604
Port Orange	US	\N	64842
Tocantinopolis	BR	\N	8750
Fairview	US	\N	14189
Treherbert	GB	\N	5727
Halton Hills	CA	\N	61161
Tzaneen	ZA	\N	67245
Middle River	US	\N	25346
East Dereham	GB	\N	18609
Takehara	JP	\N	24496
Oadby	GB	\N	23849
Burzaco	AR	\N	98859
Nefasit	ER	\N	8600
Espelkamp	DE	\N	24685
Troutdale	US	\N	16183
Wedgefield	US	\N	7701
Doraville	US	\N	10265
Oceano	US	\N	7678
Fritzlar	DE	\N	14744
Capela do Alto	BR	\N	19482
Frutal	BR	\N	40931
Kety	PL	\N	19428
Cerveny Kostelec	CZ	\N	8360
St. Helena	US	\N	7059
Yegoryevsk	RU	\N	73766
Puerto San Carlos	MX	\N	5538
Pharr	US	\N	79112
Humpolec	CZ	\N	10970
Chatsworth	CA	\N	6630
Arao	JP	\N	51325
Hightstown	US	\N	5304
Rosny-sous-Bois	FR	\N	46207
Fort Edward	US	\N	6186
Prosper	US	\N	24579
Mount Pleasant	US	\N	91684
Harrow Weald	GB	\N	11376
Tatsuno	JP	\N	18878
Vincennes	FR	\N	49891
Furano	JP	\N	21630
Nzega	TZ	\N	26584
Burgess Hill	GB	\N	30635
Howard	US	\N	20177
Peebles	GB	\N	8376
Hethersett	GB	\N	5691
Sainte-Agathe-des-Monts	CA	\N	10223
Duderstadt	DE	\N	20466
Pingyi	CN	\N	78254
Yeovil	GB	\N	45000
Vel'ky Saris	SK	\N	5404
Bekobod	UZ	\N	82082
Mikun	RU	\N	9837
Stonington	US	\N	18436
Chippenham	GB	\N	45620
Kostenets	BG	\N	6777
Mirante do Paranapanema	BR	\N	17979
Thiais	FR	\N	29017
Ostrov	CZ	\N	16658
Millcreek	US	\N	61450
Archangelos	GR	\N	5384
Santiago	PE	\N	10449
Yellandu	IN	\N	35056
Lubbecke	DE	\N	25490
El Dorado	VE	\N	2383
North Tamborine	AU	\N	7506
Manhasset	US	\N	8138
Hlinsko	CZ	\N	9642
Uba	BR	\N	113300
Colombia	BR	\N	6211
Nizhnyaya Tura	RU	\N	19883
Simbach am Inn	DE	\N	9923
Qaskeleng	KZ	\N	58418
Sunrise	US	\N	95166
Prescott Valley	US	\N	101539
Dadaab	KE	\N	5723
Old Saybrook	US	\N	10118
Whitby	GB	\N	13213
Juana Diaz	PR	\N	7095
Walsrode	DE	\N	23068
Inverness Highlands South	US	\N	6288
Shadrinsk	RU	\N	75348
Sandown	US	\N	6350
Sakawa	JP	\N	12402
Bexhill	GB	\N	43478
Le Petit-Quevilly	FR	\N	21995
Rodolfo Sanchez Taboada	MX	\N	15038
Dubovka	RU	\N	13988
Zavareh	IR	\N	7806
Lake Hallie	US	\N	6747
Featherstone	GB	\N	15244
Saldanha	ZA	\N	68284
Avon	US	\N	23399
North Kingstown	US	\N	26207
New Rochelle	US	\N	78557
Ebetsu	JP	\N	119509
Medulla	US	\N	9679
Isahaya	JP	\N	134503
Torquay	GB	\N	65245
Brawley	US	\N	26309
Ashton in Makerfield	GB	\N	24000
London Grove	US	\N	8615
Hervey Bay	AU	\N	54674
Hemsworth	GB	\N	15350
Wantage	GB	\N	11327
Kibungo	RW	\N	11537
Hercules	US	\N	26276
Belp	CH	\N	11439
Mundybash	RU	\N	5870
Laupheim	DE	\N	22298
Faversham	GB	\N	19316
Kamalia	PK	\N	121401
Blagnac	FR	\N	24517
Florida	AR	\N	48158
Vel'ke Kapusany	SK	\N	9004
Lake Forest Park	US	\N	13504
Glossop	GB	\N	33000
Glen Innes	AU	\N	6155
Quinte West	CA	\N	43577
Edd	ER	\N	11259
Palmview	US	\N	5774
Walkersville	US	\N	6415
Sycamore	US	\N	18322
Mayflower Village	US	\N	5822
Greenwich	US	\N	62574
Xangongo	AO	\N	447
Livry-Gargan	FR	\N	44437
Cesky Krumlov	CZ	\N	12981
Charters Towers	AU	\N	8120
Hermantown	US	\N	9637
Moss Point	US	\N	13350
Portugal Cove-St. Philip's	CA	\N	8147
Velbert	DE	\N	81984
Pedda Nandipadu	IN	\N	6090
Verona	US	\N	13413
Hugo	US	\N	15267
Vinita	US	\N	5550
Wootton	GB	\N	11180
Bol'sheretsk	RU	\N	10
Inverness	CA	\N	17235
Shimo-tsuma	JP	\N	41964
Bonne Terre	US	\N	7118
Cheshunt	GB	\N	44000
Kaba	HU	\N	5878
Bafia	CM	\N	69270
Maryborough	AU	\N	27282
Soltsy	RU	\N	8803
Govan	GB	\N	5860
Riachos	PT	\N	5420
Lokwabe	BW	\N	1473
Long Branch	US	\N	30241
Vorontsovo	RU	\N	100
Harunabad	PK	\N	77206
Qaminis	LY	\N	5348
Cherryville	US	\N	6682
Tarleton	GB	\N	5652
Hronov	CZ	\N	6098
Thermalito	US	\N	6704
Marlow	GB	\N	14004
Segezha	RU	\N	26666
Toguchin	RU	\N	21064
Great Bend	US	\N	15144
Matteson	US	\N	19448
Kanash	RU	\N	45482
Pampa	US	\N	17230
Mira Monte	US	\N	6912
Maryport	GB	\N	11262
Clarkson	US	\N	7079
Montgomeryville	US	\N	13271
Badger	US	\N	18792
Harworth	GB	\N	7948
Straznice	CZ	\N	5537
Minden	US	\N	12071
Pikesville	US	\N	33387
Jowzdan	IR	\N	6393
Gerlingen	DE	\N	19745
Blue Springs	US	\N	55829
Obninsk	RU	\N	115029
Aston	US	\N	16706
Grove	US	\N	7726
Holden	US	\N	18821
Omutninsk	RU	\N	22009
Noisy-le-Sec	FR	\N	44136
Parksville	CA	\N	12514
Country Club	US	\N	49684
Dammarie-le-Lys	FR	\N	21835
Royal Kunia	US	\N	14449
Port Neches	US	\N	12655
Vineland	US	\N	93239
Rehburg-Loccum	DE	\N	10110
Stanwood	US	\N	7354
Ulchin	KR	\N	14426
Copperas Cove	US	\N	33235
West Chester	US	\N	20029
Konigslutter am Elm	DE	\N	15704
Nelidovo	RU	\N	18883
Metztitlan	MX	\N	20123
Wadebridge	GB	\N	7900
Centre de Flacq	MU	\N	15791
Eckernforde	DE	\N	21902
Mashiko	JP	\N	22116
Congleton	GB	\N	26482
Staunton	US	\N	59433
Rueil-Malmaison	FR	\N	78152
Mozhga	RU	\N	49328
Novo Horizonte	BR	\N	39543
Moore	US	\N	62055
Muroran	JP	\N	83287
Enns	AT	\N	11937
Hoogstraten	BE	\N	21424
Lufkin	US	\N	44867
Nogata	JP	\N	55937
Port Jefferson Station	US	\N	7808
Burj al `Arab	EG	\N	12625
Shawangunk	US	\N	14030
Beloozerskiy	RU	\N	18297
Owatonna	US	\N	25498
Brighouse	GB	\N	32360
Umm al `Abid	LY	\N	300
Leigh	GB	\N	41275
Loncoche	CL	\N	15590
Macia	MZ	\N	23156
Lowestoft	GB	\N	71010
Qahderijan	IR	\N	30002
Moundsville	US	\N	8252
Kulunda	RU	\N	15345
Lower Saucon	US	\N	10746
Sheridan	US	\N	19320
Courcouronnes	FR	\N	67967
Haddonfield	US	\N	11317
Intorsura Buzaului	RO	\N	7528
Mkazi	KM	\N	8438
Chino	JP	\N	55531
Ashton	GB	\N	45198
Kongolo	CD	\N	105202
Villareal	ES	\N	50893
Hartlepool	GB	\N	92000
Soltvadkert	HU	\N	7342
Honey Brook	US	\N	8205
Cheverly	US	\N	6428
Stonehaven	GB	\N	11602
Cooper City	US	\N	35800
Pinas	EC	\N	16981
Blythebridge	GB	\N	5931
Eaubonne	FR	\N	25097
Goulmima	MA	\N	16419
Molochans'k	UA	\N	7040
Irthlingborough	GB	\N	8900
Prudhoe	GB	\N	11675
Windham	US	\N	24688
Glenville	US	\N	29371
San Gabriel	US	\N	39899
Tobyl	KZ	\N	7155
Ustka	PL	\N	16308
Araguaina	BR	\N	50444
Gamboma	CG	\N	20877
Sutherlin	US	\N	9067
Biarritz	FR	\N	25404
Mount Magnet	AU	\N	470
Cavan Monaghan	CA	\N	8829
Gulf Gate Estates	US	\N	11017
Uvarovo	RU	\N	23987
Cypress	US	\N	49006
Fulnek	CZ	\N	5592
Vohringen	DE	\N	13557
Middleburg	US	\N	13431
Bischofshofen	AT	\N	10540
La Falda	AR	\N	16335
Millis	US	\N	8202
Ystradgynlais	GB	\N	8092
New Square	US	\N	8763
Ueckermunde	DE	\N	8591
Marsala	IT	\N	77784
Wath upon Dearne	GB	\N	11816
Ishii	JP	\N	25066
Hunters Creek	US	\N	22770
Orchard Park	US	\N	29463
Whiteville	US	\N	7315
Dudley	GB	\N	79379
Ossett	GB	\N	21231
Rheinberg	DE	\N	31097
Saalfelden am Steinernen Meer	AT	\N	16700
Duquesne	US	\N	5557
Narasannapeta	IN	\N	26280
Novocheboksarsk	RU	\N	126626
Koflach	AT	\N	9888
Pascagoula	US	\N	48869
Bryant	US	\N	20968
San Jose el Viejo	MX	\N	7222
Drensteinfurt	DE	\N	15542
Shancheng	CN	\N	74459
Karema	TZ	\N	16385
Sansanne-Mango	TG	\N	42626
Chone	EC	\N	52810
Blumberg	DE	\N	10127
Martin	US	\N	10415
Goussainville	FR	\N	30637
Mexborough	GB	\N	15244
Thohoyandou	ZA	\N	69453
Tlahuiltepa	MX	\N	9264
Wood-Ridge	US	\N	9294
Izamal	MX	\N	15101
Yaguachi Nuevo	EC	\N	17806
Roseland	US	\N	5835
West Hanover	US	\N	10165
Heywood	GB	\N	28205
Odacho-oda	JP	\N	32848
Saffron Walden	GB	\N	15504
Tarrant	US	\N	6109
Brookshire	US	\N	5548
Port Glasgow	GB	\N	15414
Beatrice	US	\N	12226
St. Andrews	CA	\N	11913
Huron East	CA	\N	9138
Cumberland Hill	US	\N	8142
Sergeevka	KZ	\N	7344
Swissvale	US	\N	8647
Gyoda	JP	\N	79405
Sompting	GB	\N	8561
Calnali	MX	\N	17163
Nakata	JP	\N	7702
Belzyce	PL	\N	7090
Steti	CZ	\N	8695
`Omer	IL	\N	7339
Bodenwerder	DE	\N	5561
Summit View	US	\N	7621
Kennesaw	US	\N	34077
Ludinghausen	DE	\N	24590
Dandridge	US	\N	5647
Hirschau	DE	\N	5629
South Monroe	US	\N	6176
Shawinigan	CA	\N	50060
Grimsby	GB	\N	88243
Lea Town	GB	\N	5962
Sylvan Lake	CA	\N	14816
Notre-Dame-du-Mont-Carmel	CA	\N	5467
Achim	DE	\N	31911
Euclid	US	\N	46550
Deblin	PL	\N	19513
Rhosllanerchrugog	GB	\N	9694
Penapolis	BR	\N	62071
Kewanee	US	\N	12283
Bomaderry	AU	\N	6661
Castle Pines	US	\N	10763
Le Kremlin-Bicetre	FR	\N	25334
Hallstadt	DE	\N	8575
Shiroishi	JP	\N	33380
Tanvald	CZ	\N	6216
Crestwood	US	\N	11834
Amos	CA	\N	12823
Woodend	AU	\N	5806
Bahman	IR	\N	6484
Yalta	UA	\N	79458
Mori	JP	\N	17709
Kunitachi	JP	\N	75156
Norcross	US	\N	16592
Visconde do Rio Branco	BR	\N	37942
Macara	EC	\N	13035
Oishida	JP	\N	6713
Pannawonica	AU	\N	695
Jibou	RO	\N	10407
Bethlehem	US	\N	75815
Vallendar	DE	\N	8680
George Town	KY	\N	27704
Huinan	CN	\N	66315
Nimule	SS	\N	242
Mahlberg	DE	\N	5061
Ostashkov	RU	\N	16318
Tsau	BW	\N	1409
Kalininsk	RU	\N	15821
Gowerton	GB	\N	8183
Mucheln	DE	\N	8681
Ellensburg	US	\N	24377
Ankeny	US	\N	67355
Scottsdale	AU	\N	2373
Pauliceia	BR	\N	6981
Friedrichroda	DE	\N	7275
Hopkinsville	US	\N	31569
Sheboygan	US	\N	69393
Sainte-Catherine-de-la-Jacques-Cartier	CA	\N	6319
Lucelia	BR	\N	21196
Casa Branca	BR	\N	29877
Solt	HU	\N	6125
North Codorus	US	\N	9028
West Bend	US	\N	69504
Hasuda	JP	\N	61507
Pottstown	US	\N	108758
Hradec nad Moravici	CZ	\N	5506
Lake Monticello	US	\N	10210
Lonquimay	CL	\N	10237
Aginskoye	RU	\N	11491
Picayune	US	\N	16832
Citrus Heights	US	\N	87796
Abrisham	IR	\N	19406
Valday	RU	\N	14379
Key Biscayne	US	\N	12846
Holborn	GB	\N	13023
Sidney	CA	\N	11672
Austell	US	\N	7170
Gleisdorf	AT	\N	10763
Central Elgin	CA	\N	12607
Canela	BR	\N	60806
Nkongsamba	CM	\N	117063
Ballarat	AU	\N	105471
Fakenham	GB	\N	7617
Maryville	US	\N	29742
Blackfalds	CA	\N	9328
Columbiana	US	\N	7931
Downham Market	GB	\N	9994
Nanyuki	KE	\N	31577
Gelnhausen	DE	\N	23073
Pineville	US	\N	14122
Zushi	JP	\N	56936
Munroe Falls	US	\N	5063
Sikeston	US	\N	16237
Zawyat an Nwacer	MA	\N	23802
Parma	US	\N	78103
Bakov nad Jizerou	CZ	\N	5175
Peoria Heights	US	\N	5779
Protvino	RU	\N	35807
Xique-Xique	BR	\N	35433
Trebic	CZ	\N	35451
Truro	GB	\N	18766
Berhida	HU	\N	5833
Kamloops	CA	\N	100046
Ponduru	IN	\N	12640
North Branch	US	\N	6856
Alamosa	US	\N	10652
Adi Keyh	ER	\N	13061
Twentynine Palms	US	\N	13423
South-West Oxford	CA	\N	7664
Jerome	US	\N	11996
Hakui	JP	\N	20515
Safaja	EG	\N	28261
Rochelle Park	US	\N	5613
Mandritsara	MG	\N	9705
Ely	GB	\N	20112
Ridgefield Park	US	\N	12901
Horqueta	PY	\N	16171
Shoeburyness	GB	\N	11159
Gadsden	US	\N	60944
Aki	JP	\N	16424
Firuraq	IR	\N	7903
Kingsbury	US	\N	12471
Queensferry	GB	\N	9026
Vandenberg Village	US	\N	7861
Sainte-Foy-les-Lyon	FR	\N	22012
Kamennogorsk	RU	\N	6696
Huntington Park	US	\N	57509
Stewartstown	US	\N	5057
Mwinilunga	ZM	\N	13798
Sharon	US	\N	18400
Arnprior	CA	\N	8795
Yingyangcun	CN	\N	31109
Kulebaki	RU	\N	32518
Villa Park	US	\N	21483
Arbroath	GB	\N	23490
Drighlington	GB	\N	5528
Darmanesti	RO	\N	12247
Ruhengeri	RW	\N	59333
Medway	US	\N	13244
Bernalillo	US	\N	10477
New Fairfield	US	\N	13992
Zvezdnyy	RU	\N	10
Waldbrol	DE	\N	19543
Ribeirao Bonito	BR	\N	12909
Holywell	GB	\N	8886
Leopoldina	BR	\N	46742
Thetford	GB	\N	24340
Sheboygan Falls	US	\N	7926
Geilenkirchen	DE	\N	27214
Dunn	US	\N	15550
Cumru	US	\N	15397
Maine	US	\N	5212
Novoshakhtinsk	RU	\N	108345
Wellston	US	\N	5507
De Panne	BE	\N	11129
Thatcham	GB	\N	26217
La Entrada	HN	\N	13949
Bergneustadt	DE	\N	18865
Gubakha	RU	\N	19831
Hechingen	DE	\N	19324
Albion	US	\N	8990
Lyskovo	RU	\N	21321
Billings	US	\N	120728
Tracadie	CA	\N	16114
Carignan	CA	\N	9462
North Bay	CA	\N	51553
Odolena Voda	CZ	\N	6136
San Clemente	US	\N	64558
Stalybridge	GB	\N	23731
Fremantle	AU	\N	7459
Harefield	GB	\N	7399
Tiquipaya	BO	\N	31264
Olsberg	DE	\N	14489
Grossburgwedel	DE	\N	20369
Zimnicea	RO	\N	14058
Berwick	US	\N	9903
Locarno	CH	\N	16012
Robbins	US	\N	5438
Mont-Joli	CA	\N	6281
Pereslavl'-Zalesskiy	RU	\N	39105
Sulphur	US	\N	20065
Farmers Branch	US	\N	48158
Alta Sierra	US	\N	7207
Richmond Heights	US	\N	11410
Dillingen	DE	\N	20048
Totowa	US	\N	10792
Newtown	US	\N	27853
Mournies	GR	\N	7553
Aketi	CD	\N	58601
Compton	US	\N	95605
Valle Vista	US	\N	16879
Staveley	GB	\N	18247
Hughson	US	\N	7565
Okotoks	CA	\N	28881
Chulucanas	PE	\N	68835
Chamonix-Mont-Blanc	FR	\N	8611
Arcata	US	\N	34616
Nibley	US	\N	7135
Jerichow	DE	\N	6858
Vulcanesti	MD	\N	12185
Aigua	UY	\N	2692
Rockdale	US	\N	5368
Lauchhammer	DE	\N	14622
Santa Ernestina	BR	\N	5681
Winters	US	\N	7820
Hammam al `Alil	IQ	\N	15985
Kentau	KZ	\N	81484
Dabrowa Bialostocka	PL	\N	6226
Tulare	US	\N	65496
Holualoa	US	\N	9136
Cape Elizabeth	US	\N	9279
Stillwater	US	\N	49008
Sans Souci	US	\N	8776
Ikela	CD	\N	291
Sunny Isles Beach	US	\N	21804
Pratt	US	\N	6220
Ridgeland	US	\N	24104
Woburn	US	\N	40228
Glenwood	US	\N	8715
Bad Durrenberg	DE	\N	11643
Lower Moreland	US	\N	13176
Perranzabuloe	GB	\N	5406
Cockermouth	GB	\N	8761
Etropole	BG	\N	11292
Les Lilas	FR	\N	23045
North Decatur	US	\N	17298
Kirkby	GB	\N	40472
Schladming	AT	\N	6660
Domazlice	CZ	\N	11094
Bradenton	US	\N	59439
Adel	US	\N	6989
Chirpan	BG	\N	17522
Fountain Hills	US	\N	25200
Haslett	US	\N	19721
Bramley	GB	\N	8194
Calbuco	CL	\N	15903
Mill Creek	US	\N	20897
Sawakin	SD	\N	43337
Franconville	FR	\N	36762
Fairview Park	US	\N	16161
Collipulli	CL	\N	16392
Ennis	US	\N	20077
Broken Hill	AU	\N	17734
Strathalbyn	AU	\N	6504
Boizenburg	DE	\N	10724
Frankford	US	\N	5361
Harrogate	GB	\N	75070
Fort Oglethorpe	US	\N	9994
Chino	US	\N	94371
Marton	GB	\N	9990
Webster Groves	US	\N	22819
Homestead Meadows North	US	\N	5665
Ihtiman	BG	\N	14656
Essex	CA	\N	20427
Hikari	JP	\N	49686
Waikele	US	\N	7062
Ziebice	PL	\N	9154
Hales Corners	US	\N	7567
Karur	IN	\N	76915
Fairmont	US	\N	32847
Milliken	US	\N	8164
Nova Cruz	BR	\N	23166
Godfrey	US	\N	17400
Five Corners	US	\N	18559
Huaral	PE	\N	79011
East Manchester	US	\N	7545
Obernburg am Main	DE	\N	8712
Kuvshinovo	RU	\N	9068
Gus'-Khrustal'nyy	RU	\N	54533
Zabreh	CZ	\N	13456
Chatenay-Malabry	FR	\N	33286
Weston-super-Mare	GB	\N	76143
Rancho Santa Margarita	US	\N	47896
Lipcani	MD	\N	5500
Trest'	CZ	\N	5714
Angamali	IN	\N	33424
Everman	US	\N	6201
Laguna Beach	US	\N	22827
Ita	PY	\N	41090
Swartz Creek	US	\N	5501
Glenn Heights	US	\N	13377
Oak Hill	US	\N	8098
Fuller Heights	US	\N	10327
Waidhofen an der Ybbs	AT	\N	11333
West Palm Beach	US	\N	111955
Framingham	US	\N	74416
West Glens Falls	US	\N	7005
Yazoo City	US	\N	14817
Green Cove Springs	US	\N	8577
West Puente Valley	US	\N	23629
Fuentes del Valle	MX	\N	74087
Longton	GB	\N	27214
Annan	GB	\N	8389
Ochsenfurt	DE	\N	11319
Seraing	BE	\N	64270
Tabor City	US	\N	6355
Saugerties	US	\N	19109
Waltham Cross	GB	\N	7407
Gracemere	AU	\N	11315
Tweed Heads	AU	\N	8176
Camooweal	AU	\N	208
Gallup	US	\N	22917
South Beloit	US	\N	7624
La Verne	US	\N	31974
Arauco	CL	\N	17597
West Samoset	US	\N	7708
Kalach-na-Donu	RU	\N	23947
Penrith	AU	\N	13295
East Port Orchard	US	\N	5331
Tomah	US	\N	9303
Vernon	US	\N	29157
Perry Heights	US	\N	8581
Al Hibah	EG	\N	16209
Yoakum	US	\N	5744
Pontiac	CA	\N	5850
Carrigtohill	IE	\N	6665
Longswamp	US	\N	5703
Sandy	GB	\N	11657
Weissenfels	DE	\N	40409
Yaransk	RU	\N	15985
La Puente	US	\N	39614
Provadia	BG	\N	15095
Reidsville	US	\N	13551
Shimanovsk	RU	\N	18643
Pontes e Lacerda	BR	\N	29381
Osprey	US	\N	7028
Tucker	US	\N	36395
Fruitland	US	\N	5426
Inza	RU	\N	17630
Pattoki	PK	\N	77210
Nyack	US	\N	7156
Cottonwood Heights	US	\N	33843
Zamberk	CZ	\N	6077
Spallumcheen	CA	\N	5106
Southgate	US	\N	28959
Corydon	US	\N	5645
East Shoreham	US	\N	6484
Dry Run	US	\N	7754
Shoreview	US	\N	27130
Saal	DE	\N	5626
Moorestown	US	\N	20436
Tupelo	US	\N	45466
Pribram	CZ	\N	32503
Zelenokumsk	RU	\N	34690
Choshi	JP	\N	59165
Bellmead	US	\N	10744
Rio Segundo	AR	\N	19713
Ban Lam Sam Kaeo	TH	\N	63271
Trhove Sviny	CZ	\N	5207
Nagatoro	JP	\N	6809
Stroud	GB	\N	32670
Trussville	US	\N	22635
Dolinsk	RU	\N	11765
South Huntingdon	US	\N	5589
Hemsbach	DE	\N	11968
Ibitinga	BR	\N	57649
Windcrest	US	\N	5876
Saint Budeaux	GB	\N	13369
Mittweida	DE	\N	14645
Yatton	GB	\N	7552
Bel Air North	US	\N	31582
Hordle	GB	\N	5654
Los Altos Hills	US	\N	8423
Shatura	RU	\N	33222
Breinigsville	US	\N	5975
Atkinson	US	\N	6897
Sredneuralsk	RU	\N	23353
Baystonhill	GB	\N	5079
Moe	AU	\N	8778
Spanish Fort	US	\N	9214
Bad Wildbad	DE	\N	10130
Eisfeld	DE	\N	7646
Kairaki	NZ	\N	225
Balderton	GB	\N	9757
Walker Mill	US	\N	11780
Brandon	CA	\N	48859
Kerman	US	\N	15218
Otsuchi	JP	\N	11046
Plover	US	\N	13099
Chistopol	RU	\N	62200
Raynham	US	\N	14010
Clifton	US	\N	85052
Owensboro	US	\N	74068
Suriapet	IN	\N	106805
Mount Isa	AU	\N	18588
Lindenhurst	US	\N	26801
Jablunkov	CZ	\N	5474
Baildon	GB	\N	15360
South Orange Village	US	\N	16434
Hetton le Hole	GB	\N	14402
Tidenham	GB	\N	5486
Innisfil	CA	\N	36566
Shcholkine	UA	\N	10593
Sevran	FR	\N	51016
Ribeira Brava	PT	\N	13375
Morecambe	GB	\N	60768
Albertirsa	HU	\N	12532
Nitro	US	\N	6373
Bilovec	CZ	\N	7394
Friedrichsdorf	DE	\N	25194
Sabino	BR	\N	5502
Randolph	US	\N	34362
Barnard Castle	GB	\N	5495
Karmi'el	IL	\N	45300
Messkirch	DE	\N	8418
Camp Springs	US	\N	21602
Wall	US	\N	25836
Pan de Azucar	UY	\N	6597
Bad Driburg	DE	\N	19002
Saryshaghan	KZ	\N	4365
Walla Walla	US	\N	57860
Merritt Island	US	\N	36797
San Borja	BO	\N	24610
Meiganga	CM	\N	80100
Donetsk	RU	\N	47770
Margate	US	\N	58796
San Rafael	BO	\N	1201
Park City	US	\N	15061
Sao Pedro do Turvo	BR	\N	7567
Kaarst	DE	\N	43433
Maurice River	US	\N	7704
Manitowoc	US	\N	44770
McKinleyville	US	\N	16612
Marianna	US	\N	5787
Whitestown	US	\N	18377
Belle Haven	US	\N	6877
Warrensville Heights	US	\N	13108
Sugar Hill	US	\N	24617
Mogi Mirim	BR	\N	91483
Adamantina	BR	\N	35048
Cuyahoga Falls	US	\N	49106
Shady Hills	US	\N	12435
Amapa	BR	\N	1947
North Haven	US	\N	23786
Kawm Umbu	EG	\N	71596
Hazard	US	\N	8118
Minabe	JP	\N	11886
Espera Feliz	BR	\N	22856
Sakado	JP	\N	101531
Saint-Lambert-de-Lauzon	CA	\N	6647
Bathurst	AU	\N	36801
Hopedale	US	\N	5951
Wareham	US	\N	22574
Casselberry	US	\N	28757
Chizu	JP	\N	6520
Sil-li	KP	\N	19463
Burnsville	US	\N	61339
Gridley	US	\N	9237
Spitak	AM	\N	15000
Nicolas Flores	MX	\N	6202
Dunaharaszti	HU	\N	21901
Pogoanele	RO	\N	7275
Zd'ar nad Sazavou	CZ	\N	20717
Omagh	GB	\N	21056
Scottsbluff	US	\N	25114
Sihor	IN	\N	52603
Palos de la Frontera	ES	\N	11289
Stupava	SK	\N	11471
Choisy-le-Roi	FR	\N	45331
Desert Palms	US	\N	6947
Silverthorne	US	\N	19344
Huaura	PE	\N	40400
Prospect Heights	US	\N	15887
Easton	US	\N	27189
Ferryhill	GB	\N	8942
Ceiba	PR	\N	5613
Murray Bridge	AU	\N	18779
Ancud	CL	\N	28162
Trossingen	DE	\N	16829
Big Flats	US	\N	7689
Thurmont	US	\N	7659
Upper Sandusky	US	\N	5911
Broadway	US	\N	6712
Brownhills	GB	\N	12676
Redlands	US	\N	71513
Tsavo	KE	\N	414
Medicine Hat	CA	\N	63260
Martic	US	\N	5217
Upper Deerfield	US	\N	7473
Mossendjo	CG	\N	30936
Taourirt	MA	\N	103398
Glascote	GB	\N	8344
Buhl	DE	\N	28900
Titusville	US	\N	57891
Indian Hills	US	\N	6054
Jenks	US	\N	23767
Zacapoaxtla	MX	\N	8062
Parvomay	BG	\N	15518
Walldorf	DE	\N	15534
Good Hope	US	\N	9173
Garforth	GB	\N	19811
Thorpe Saint Andrew	GB	\N	14556
North Miami	US	\N	62822
Polegate	GB	\N	8586
Bispham	GB	\N	20001
Huntingdon	GB	\N	23732
Weil der Stadt	DE	\N	19205
Chkalovsk	RU	\N	11462
Fort Madison	US	\N	10130
Oura	JP	\N	5321
Aristobulo del Valle	AR	\N	38000
Mizdah	LY	\N	26107
Powder Springs	US	\N	15758
Frohburg	DE	\N	12470
Wealdstone	GB	\N	11394
Fair Plain	US	\N	7138
Beachwood	US	\N	11590
Strzegom	PL	\N	16650
Itamaraju	BR	\N	47628
Rye Brook	US	\N	9521
Dalkeith	GB	\N	12342
Mountain View	US	\N	82739
Vernier	CH	\N	35132
Springdale	US	\N	81125
Killamarsh	GB	\N	9445
Arab	US	\N	8342
Sandbach	GB	\N	17976
Robeson	US	\N	7395
Lugau	DE	\N	8013
Muskogee	US	\N	39789
Bongaree	AU	\N	6947
Sasayama	JP	\N	40708
Eagle Point	US	\N	9554
West Cocalico	US	\N	7403
Negresti-Oas	RO	\N	11867
Sandycroft	GB	\N	6724
Darling	ZA	\N	10420
Mian Channun	PK	\N	82586
Treasure Island	US	\N	6921
Sandy	US	\N	96380
Rockville Centre	US	\N	24550
Higashimatsushima	JP	\N	39138
Lohne	DE	\N	39697
Ferndale	US	\N	20033
Benbrook	US	\N	23502
Ken Caryl	US	\N	33804
Lewiston	US	\N	58802
Borehamwood	GB	\N	31955
Tateishi	JP	\N	7389
Mbamba Bay	TZ	\N	8997
Cuero	US	\N	9749
Miami Shores	US	\N	10365
Somerton	US	\N	19684
Berri	AU	\N	4103
Waterford	AU	\N	6431
Battle Ground	US	\N	21252
Volchansk	RU	\N	8722
Fehmarnsund	DE	\N	12592
Hanahan	US	\N	26917
Tucurui	BR	\N	76337
Floresville	US	\N	7571
Sebastian	US	\N	26118
Eldorado at Santa Fe	US	\N	5999
Yawata-shimizui	JP	\N	70931
Sutton	GB	\N	41483
Spokane Valley	US	\N	101060
Sherburn in Elmet	GB	\N	6657
Stevenson Ranch	US	\N	19364
Samannud	EG	\N	57177
Aesch	CH	\N	10352
Kalfou	CM	\N	26223
Vyatskiye Polyany	RU	\N	32562
Gau-Algesheim	DE	\N	6827
Hartselle	US	\N	14466
Lansdowne	IN	\N	5667
Hokota	JP	\N	46415
Boyes Hot Springs	US	\N	7863
North Massapequa	US	\N	18609
Qal`at Bishah	SA	\N	88291
Xochicoatlan	MX	\N	6954
Davis	US	\N	76997
Shaftesbury	GB	\N	7314
Budd Lake	US	\N	10414
Stanley	GB	\N	15314
Huatan	TW	\N	45907
Santa Paula	US	\N	30233
Genthin	DE	\N	13985
Dranesville	US	\N	11802
Orland Park	US	\N	57857
Williams	US	\N	6061
Resende	BR	\N	125214
Burstadt	DE	\N	16398
Serebryansk	KZ	\N	701
Cedarburg	US	\N	11603
Djado	NE	\N	10
Hythe	GB	\N	20526
Champion Heights	US	\N	6495
Jicin	CZ	\N	16717
West Ham	GB	\N	15551
Morehead City	US	\N	49760
Selydove	UA	\N	23793
Nacunday	PY	\N	1250
Pouso Alegre	BR	\N	115201
Godo	JP	\N	18812
Susaki	JP	\N	21025
Ifakara	TZ	\N	49528
Sarandi del Yi	UY	\N	7176
San Quintin	MX	\N	5433
Spanish Lake	US	\N	18048
Great Sankey	GB	\N	24211
Pottsville	US	\N	40685
Rauenberg	DE	\N	8693
Airmont	US	\N	8786
North Palm Beach	US	\N	13127
Hemmoor	DE	\N	8673
Spondon	GB	\N	12377
Temple Hills	US	\N	7864
Merrydale	US	\N	8808
Upper Montclair	US	\N	11744
Los Lagos	CL	\N	12813
South Tucson	US	\N	5715
Floral City	US	\N	5308
Tulsipur	NP	\N	51537
Drumheller	CA	\N	7982
Downers Grove	US	\N	49057
Brecknock	US	\N	7465
Colchester	US	\N	17357
Pont-Rouge	CA	\N	8723
Rosario	BR	\N	6798
Poshekhonye	RU	\N	5821
Baraawe	SO	\N	32800
Laurel Bay	US	\N	6470
Killingworth	US	\N	6414
Coracora	PE	\N	7420
Cam	GB	\N	8152
Hanna	IR	\N	5358
Timmins	CA	\N	41788
Campanilla	PR	\N	5304
West Bradford	US	\N	12869
Avenal	US	\N	13479
Ban Ang Sila	TH	\N	33053
Puerto Pinasco	PY	\N	500
Chaguarama	VE	\N	15000
Tamaqua	US	\N	14252
Progreso	MX	\N	53958
Bemidji	US	\N	16807
Kearns	US	\N	36330
Kanchrapara	IN	\N	129576
Abram	GB	\N	9855
Paradise Hills	US	\N	5079
Gorleston-on-Sea	GB	\N	5548
Taunusstein	DE	\N	30005
Kamiichi	JP	\N	19805
Palmers Green	GB	\N	15162
Uricani	RO	\N	8972
Guayaramerin	BO	\N	36008
Upper Darby	US	\N	82846
Pontiac	US	\N	59438
Guaratingueta	BR	\N	119073
Gogrial	SS	\N	50065
East Glenville	US	\N	6371
Clear Lake	US	\N	7711
Altamont	US	\N	18987
Genoa	US	\N	6467
Andahuaylas	PE	\N	80000
Haiterbach	DE	\N	5761
Ehingen an der Donau	DE	\N	26259
Ban Bang Mae Nang	TH	\N	45974
San Felipe	MX	\N	106952
Navasota	US	\N	9386
Whickham	GB	\N	16652
Ventanas	CL	\N	8314
Ajdir	MA	\N	5314
Harper Woods	US	\N	13746
Neftekamsk	RU	\N	126805
La Seyne-sur-Mer	FR	\N	63936
Oberkochen	DE	\N	7895
Enger	DE	\N	20461
Market Deeping	GB	\N	6008
Zistersdorf	AT	\N	5391
Bebra	DE	\N	13962
Hokuto	JP	\N	46054
Port Salerno	US	\N	11317
Neuhaus am Rennweg	DE	\N	9076
Pedregulho	BR	\N	16517
Pearl City	US	\N	46129
Parkland	US	\N	37185
Goodrich	US	\N	5935
Tarboro	US	\N	12748
Shumanay	UZ	\N	10513
Winston	US	\N	5511
Graaff-Reinet	ZA	\N	62896
Jimboomba	AU	\N	13201
Dila	ET	\N	47021
Twin Lakes	US	\N	7586
Great Warley Street	GB	\N	5973
Onalaska	US	\N	18943
Hanyu	JP	\N	53870
Cecil	US	\N	12245
Ban Bang Krang	TH	\N	23010
Moritake	JP	\N	15534
Riedenburg	DE	\N	6030
Worrstadt	DE	\N	8027
Szabadszallas	HU	\N	6121
Keller	US	\N	47213
North Riverside	US	\N	6429
Port-Cartier	CA	\N	6651
Lauderhill	US	\N	71868
Bad Krozingen	DE	\N	19644
Leland	US	\N	23544
Tubarao	BR	\N	97235
Caruthersville	US	\N	5017
Hanamaulu	US	\N	5422
New Roads	US	\N	7370
Cuya	CL	\N	20
Lysva	RU	\N	61752
Ridgeway	US	\N	6464
Central Falls	US	\N	19568
Colombier	CH	\N	5547
North Logan	US	\N	11237
Yelm	US	\N	17103
Midlothian	US	\N	33532
Le Grand-Saconnex	CH	\N	12162
Cushing	US	\N	6560
Morehead	US	\N	8044
Port Mathurin	MU	\N	5929
Bayawan	PH	\N	117900
Villa Celina	AR	\N	30000
Ansonia	US	\N	18654
Welench'iti	ET	\N	20984
Teublitz	DE	\N	7418
Neustadt bei Coburg	DE	\N	15257
Giddalur	IN	\N	35150
Spalding	GB	\N	34613
Weissenthurm	DE	\N	9115
Kayes	CG	\N	62521
Ayr	GB	\N	46490
Aniva	RU	\N	9445
South Bay	US	\N	5200
Tlatlauquitepec	MX	\N	9047
Carnforth	GB	\N	5560
Napili-Honokowai	US	\N	7258
Strathaven	GB	\N	7484
Sutton	US	\N	9385
Brockville	CA	\N	21854
Oro Valley	US	\N	46044
Cherlak	RU	\N	12122
Sighetu Marmatiei	RO	\N	37640
Friern Barnet	GB	\N	17250
Funagata	JP	\N	5143
Shiranuka	JP	\N	7751
Kamyanyets	BY	\N	8400
Capao Bonito	BR	\N	47486
Suzukawa	JP	\N	48379
Yuasa	JP	\N	11340
Citrus	US	\N	10771
Mosgiel	NZ	\N	13400
Hostivice	CZ	\N	8788
Akil	MX	\N	10176
Langen	DE	\N	37902
Lehman	US	\N	10178
Cedar Falls	US	\N	40536
Olbernhau	DE	\N	10991
Mountain Brook	US	\N	20297
Alfred and Plantagenet	CA	\N	9680
Whitewater Region	CA	\N	7009
Haddon Heights	US	\N	7529
Tlahuelilpan	MX	\N	17153
Jumilla	ES	\N	25600
Port St. John	US	\N	11729
Raytown	US	\N	28991
Neo Karlovasi	GR	\N	6708
Watchung	US	\N	6006
Cape St. Claire	US	\N	8928
Unterschleissheim	DE	\N	28907
Kingston South East	AU	\N	1648
Rocky Point	US	\N	12902
Greenacres	US	\N	41117
Sarov	RU	\N	95388
Fort Morgan	US	\N	13349
Buckingham	GB	\N	12890
Wadesboro	US	\N	5254
Indiantown	US	\N	7669
Bothell West	US	\N	20307
Rawlins	US	\N	8521
Haedo	AR	\N	37745
Zazeran	IR	\N	7670
Loutolim	IN	\N	6121
Merrick	US	\N	19966
Santa Cruz Cabralia	BR	\N	19545
Grove	GB	\N	7178
Luzerne	US	\N	5905
Darby	US	\N	10702
Oshamambe	JP	\N	5329
Velen	DE	\N	13130
Mullins	US	\N	5010
Horley	GB	\N	22076
Rubizhne	UA	\N	59951
Kenai	US	\N	5411
Hollymead	US	\N	8393
Grain Valley	US	\N	14526
Lichtenau	DE	\N	10632
Shamokin	US	\N	28457
Dacono	US	\N	6034
Cunha	BR	\N	22086
Canterbury	US	\N	5074
Peachtree City	US	\N	36223
Great Linford	GB	\N	19350
Lunen	DE	\N	86449
Vidnoye	RU	\N	66158
Tuscumbia	US	\N	8461
Vlasim	CZ	\N	11550
Konz	DE	\N	18348
Highland City	US	\N	10641
Kyjov	CZ	\N	11185
Aldan	RU	\N	20595
Porto Ferreira	BR	\N	54761
Keighley	GB	\N	70000
Shelekhov	RU	\N	48098
Bagdarin	RU	\N	4676
Tyn nad Vltavou	CZ	\N	7960
Wilbraham	US	\N	14604
Vancleave	US	\N	5048
Wigton	GB	\N	5831
Bel Aire	US	\N	8300
Erith	GB	\N	45345
Chukhloma	RU	\N	5015
Batac	PH	\N	55201
Coffeyville	US	\N	9827
Deuil-la-Barre	FR	\N	22306
Marco Island	US	\N	17947
Skippack	US	\N	14858
Penarth	GB	\N	22083
Surazh	RU	\N	10884
Ban Krot	TH	\N	9471
Kyshtym	RU	\N	36997
Huntington Woods	US	\N	6265
Prerov	CZ	\N	42871
Purcellville	US	\N	15742
Milngavie	GB	\N	13537
Southington	US	\N	43763
Hampstead	US	\N	8625
Strakonice	CZ	\N	22646
Ban Saen Suk	TH	\N	45142
Rufino	AR	\N	18727
Darfield	GB	\N	10685
Brimington	GB	\N	8788
Kingston	AU	\N	10409
Aspen Hill	US	\N	52807
Samokov	BG	\N	29094
Bilibino	RU	\N	5319
Herzogenaurach	DE	\N	23126
Fort Rucker	US	\N	5134
Betma	IN	\N	12529
Serafimovich	RU	\N	8914
Hackney	GB	\N	11734
Winnetka	US	\N	12316
Drummondville	CA	\N	68601
Widnes	GB	\N	61464
Chalfont Saint Giles	GB	\N	5925
Stepps	GB	\N	6730
Yachimata	JP	\N	67522
McAlester	US	\N	18896
Cramond	GB	\N	7502
Thargomindah	AU	\N	270
Rosbach vor der Hohe	DE	\N	12307
El Dorado	MX	\N	17365
Isselburg	DE	\N	10692
Tournefeuille	FR	\N	26962
Hollinwood	GB	\N	10920
Middleton-on-Sea	GB	\N	5077
Grybow	PL	\N	6038
Hemau	DE	\N	9224
Espanola	US	\N	25952
Houilles	FR	\N	32151
Fort Smith	US	\N	125354
Morshansk	RU	\N	39362
Villa Alsina	AR	\N	41155
Twistringen	DE	\N	12449
Ripon	GB	\N	16702
Lochbuie	US	\N	6366
Center Point	US	\N	16110
Nova Lima	BR	\N	87000
McKees Rocks	US	\N	5855
Villa Tunari	BO	\N	71386
Prairie Village	US	\N	22295
Odobesti	RO	\N	9364
Emmitsburg	US	\N	7235
Barros Blancos	UY	\N	31650
Strawberry	US	\N	5759
North Miami Beach	US	\N	43041
Saginaw	US	\N	117958
Trujillo Alto	PR	\N	44689
Aubange	BE	\N	16927
Moorreesburg	ZA	\N	12877
Lyudinovo	RU	\N	38267
Alexander Bay	ZA	\N	1500
Dove Valley	US	\N	5597
Shifnal	GB	\N	7009
Los Alamitos	US	\N	11399
Donna	US	\N	16338
Tepeji del Rio de Ocampo	MX	\N	80612
Kelkheim (Taunus)	DE	\N	29055
Wythenshawe	GB	\N	110000
Jaguaquara	BR	\N	41498
Sidi Ifni	MA	\N	21618
Juquitiba	BR	\N	30642
Taksimo	RU	\N	10359
Falmouth	GB	\N	21797
Karlovac	HR	\N	53134
Timbedgha	MR	\N	245
Gympie	AU	\N	21599
Qiryat Gat	IL	\N	55000
Mooka	JP	\N	79109
Scaggsville	US	\N	9430
Khadbari	NP	\N	26301
Middletown Township	US	\N	45156
Yabucoa	PR	\N	6829
Thannhausen	DE	\N	6277
Louny	CZ	\N	18313
Mezhdurechensk	RU	\N	97060
Ginowan	JP	\N	98093
Oberndorf bei Salzburg	AT	\N	5815
Silay	PH	\N	126930
Zhigansk	RU	\N	3237
Ejmiatsin	AM	\N	57500
Cambria	US	\N	5837
Jacupiranga	BR	\N	17851
Borgholzhausen	DE	\N	8973
Buford	US	\N	15522
Nowra	AU	\N	37420
Snodland	GB	\N	10211
Chartiers	US	\N	7945
El Segundo	US	\N	16610
Ipeuna	BR	\N	6914
Oakmont	US	\N	6541
Pekin	US	\N	32045
Leeds and the Thousand Islands	CA	\N	9465
Reyes	BO	\N	7376
Wasserburg am Inn	DE	\N	12691
Verkhnevilyuysk	RU	\N	6341
Ahrensburg	DE	\N	33472
Iijima	JP	\N	9104
Schmolln	DE	\N	13741
Ormond Beach	US	\N	43759
Jersey Shore	US	\N	9116
Coseley	GB	\N	12357
Eunice	US	\N	11269
Santa Maria Ajoloapan	MX	\N	9185
Dwarka	IN	\N	38873
Guaynabo	PR	\N	69697
Chipping Sodbury	GB	\N	5045
Montepuez	MZ	\N	72279
Gibsonville	US	\N	7339
Sale	AU	\N	15135
Redding	US	\N	121313
Lauffen am Neckar	DE	\N	11640
Santiago de Anaya	MX	\N	14066
Ligonier	US	\N	6466
McKenzie	US	\N	5070
Kadena	JP	\N	13471
Youngtown	US	\N	6859
Hutchins	US	\N	5866
Berdsk	RU	\N	103578
Markgroningen	DE	\N	14785
Balham	GB	\N	14751
Rishra	IN	\N	124577
Quispamsis	CA	\N	18245
Oltenita	RO	\N	24822
Wainfleet	CA	\N	6372
Novoanninskiy	RU	\N	16294
West Whittier-Los Nietos	US	\N	27144
Davyd-Haradok	BY	\N	5800
Voskresensk	RU	\N	93565
Lynn	US	\N	94299
Geldern	DE	\N	33836
Altenberg	DE	\N	7908
West Byfleet	GB	\N	5626
Elsfleth	DE	\N	9105
Gulf Hills	US	\N	8252
Dedovsk	RU	\N	29738
Fort Pierce North	US	\N	7070
Castelar	AR	\N	107786
Dubnany	CZ	\N	6352
North Perth	CA	\N	13130
Monte Aprazivel	BR	\N	23857
Alstonville	AU	\N	5739
Manica	MZ	\N	4000
Countesthorpe	GB	\N	6377
Highlands Ranch	US	\N	105147
Nauta	PE	\N	2500
Nasushiobara	JP	\N	116043
Koronowo	PL	\N	10818
Terryville	US	\N	12340
Lumberton	US	\N	28279
Shibuya	JP	\N	102056
Jaragua do Sul	BR	\N	130130
Ma`alot Tarshiha	IL	\N	36000
Dunwoody	US	\N	49356
Coolidge	US	\N	12124
Dobbs Ferry	US	\N	11027
Dunlap	US	\N	6115
Goch	DE	\N	33825
Hirao	JP	\N	12095
Pontotoc	US	\N	5272
Huntingdon	US	\N	11134
Sibay	RU	\N	61266
Nanticoke	US	\N	10312
Pinxton	GB	\N	5699
Bar Harbor	US	\N	5425
Bitterfeld	DE	\N	38475
Dana Point	US	\N	33577
Laguna Niguel	US	\N	66385
Stanwell	GB	\N	11279
Masaki	JP	\N	29832
Moorhead	US	\N	43652
Snyderville	US	\N	6352
Ico	BR	\N	28323
Trent Hills	CA	\N	12900
Vsetin	CZ	\N	25974
Timaru	NZ	\N	28300
Gerolstein	DE	\N	7676
Leisure City	US	\N	26080
Punata	BO	\N	14742
Columbine	US	\N	25094
San Jacinto	US	\N	49215
Stoke Mandeville	GB	\N	5825
Obertshausen	DE	\N	24943
Newton Abbot	GB	\N	25556
Schuttorf	DE	\N	12839
Kpalime	TG	\N	100479
Isafjordhur	IS	\N	2620
Q'vareli	GE	\N	7739
Mocksville	US	\N	5397
Stockerau	AT	\N	16916
Stansbury Park	US	\N	9173
Plymstock	GB	\N	24103
Highbridge	GB	\N	5986
Kirovsk	RU	\N	26581
Dibaya	CD	\N	603
Los Banos	US	\N	40972
Montreal-Ouest	CA	\N	5085
Martuni	AM	\N	11987
Stony Brook University	US	\N	8938
Kasaoka	JP	\N	47097
Alesd	RO	\N	10066
Sannicolau Mare	RO	\N	12312
Calbe	DE	\N	8609
Trebbin	DE	\N	9541
Immingham	GB	\N	9642
Piatra Olt	RO	\N	6299
Crestline	US	\N	9381
Beverly	US	\N	42174
Hazel Park	US	\N	16347
Wasilla	US	\N	10838
Munsingen	DE	\N	14335
Bozhurishte	BG	\N	5047
Roskovec	AL	\N	6657
La Garde	FR	\N	25126
Camp Hill	US	\N	7905
Lubon	PL	\N	27000
Guged	IR	\N	6686
Ruidoso	US	\N	9442
Innisfail	CA	\N	7847
Baile Herculane	RO	\N	5008
Zittau	DE	\N	25381
Jurupa Valley	US	\N	109527
Napajedla	CZ	\N	7171
Ahlen	DE	\N	52582
Tellico Village	US	\N	5612
Groveland	US	\N	16423
Winchester	GB	\N	45184
Dzitbalche	MX	\N	11686
Schwaan	DE	\N	5022
Lehi	US	\N	69724
Clitheroe	GB	\N	16279
Willington	US	\N	5912
Llica	BO	\N	553
Sudbury	US	\N	18940
Gan Yavne	IL	\N	22453
Princeville	CA	\N	5693
Bolsover	GB	\N	11673
San Lorenzo	BO	\N	3000
Novomichurinsk	RU	\N	16710
Sun City	US	\N	39348
Borovsk	RU	\N	10966
South Daytona	US	\N	13080
Washington Terrace	US	\N	9248
Palos Hills	US	\N	17060
Perth Amboy	US	\N	51390
Marawi	SD	\N	10234
Morrow	US	\N	7192
Kisujszallas	HU	\N	10870
Park Forest	US	\N	21210
Mantes-la-Ville	FR	\N	20452
Englewood Cliffs	US	\N	5354
Mattawa	US	\N	5349
North Andover	US	\N	30589
Elizabethton	US	\N	13509
Biggleswade	GB	\N	16551
Nuriootpa	AU	\N	6314
Gillingham	GB	\N	104157
Koneurgench	TM	\N	36754
Muswellbrook	AU	\N	12364
Oak Bay	CA	\N	18094
Dixon	US	\N	20803
Karnobat	BG	\N	20411
Oldham	GB	\N	96555
Albbruck	DE	\N	7335
Nortorf	DE	\N	6804
Brandfort	ZA	\N	12091
Itaberai	BR	\N	22129
Cheat Lake	US	\N	9337
West Valley City	US	\N	135248
Sarahs	TM	\N	9585
Los Fresnos	US	\N	7837
Westport	US	\N	27840
Fallbrook	US	\N	33021
Petrzalka	SK	\N	103190
Champlain	CA	\N	8706
Shelby	US	\N	26973
Saratoga Springs	US	\N	68028
Chervonohrad	UA	\N	82395
Yuzhno-Sukhokumsk	RU	\N	10641
Barton	US	\N	8550
Barrington	CA	\N	6646
Sevlievo	BG	\N	25372
Laurentian Valley	CA	\N	9387
Shalqar	KZ	\N	26574
Puerto Heath	BO	\N	10
Avenel	US	\N	18831
Southall	GB	\N	69857
Vilankulo	MZ	\N	177
Worplesdon	GB	\N	8529
Springwood	AU	\N	8475
Abbeville	US	\N	19470
Strunino	RU	\N	13094
Bassar	TG	\N	23181
Rockwood	US	\N	7712
Hereford	GB	\N	55955
Belmont	US	\N	26941
Puigcerda	ES	\N	9258
Danville	US	\N	47059
Pico Rivera	US	\N	62027
Aj Jourf	MA	\N	12302
Fort Washington	US	\N	24183
Turriff	GB	\N	5060
South Elmsall	GB	\N	6519
Fultondale	US	\N	9284
Amesbury	US	\N	17532
Carrizo Springs	US	\N	6043
Neumarkt-Sankt Veit	DE	\N	6243
Harrow on the Hill	GB	\N	12270
Pollock Pines	US	\N	6905
Prince George	CA	\N	74003
St. Marys	US	\N	37556
Brilon	DE	\N	25417
Jennings Lodge	US	\N	8138
Zhilinda	RU	\N	10
Krynica	PL	\N	11361
New Tecumseth	CA	\N	41439
Paranaiba	BR	\N	32217
Ridley Park	US	\N	7065
Spotswood	US	\N	8228
Whiskey Creek	US	\N	5030
Newent	GB	\N	5207
Santana	PT	\N	7719
Nelson	GB	\N	29135
Acton Vale	CA	\N	7664
Garfield Heights	US	\N	27448
Novyy Uoyan	RU	\N	4184
Tikhvin	RU	\N	58136
Wembley	GB	\N	102856
Pawling	US	\N	8264
King George	US	\N	5028
Kapchagay	KZ	\N	60100
Ami	JP	\N	47755
Addison	US	\N	36482
Cajvana	RO	\N	6901
Peace River	CA	\N	6842
Poperinge	BE	\N	19718
Sangeorgiu de Padure	RO	\N	5166
Fort Scott	US	\N	7514
Cobram	AU	\N	6014
Steamboat Springs	US	\N	14087
Chestermere	CA	\N	19887
Buxton	GB	\N	22215
Betsukai	JP	\N	15018
Timberwood Park	US	\N	25976
Broadview	US	\N	7618
Norristown	US	\N	34341
Dorog	HU	\N	11883
East Brandywine	US	\N	8416
Strathmore	CA	\N	13756
Kromeriz	CZ	\N	28620
Mountainside	US	\N	6885
Sano	JP	\N	115784
Kulu	IN	\N	18536
Milltown	US	\N	6967
Porterville	US	\N	77318
Hlucin	CZ	\N	13931
Howard Springs	AU	\N	5132
Sezimovo Usti	CZ	\N	7221
Tunduma	TZ	\N	36556
Tanaina	US	\N	10520
Del City	US	\N	21712
Marcellus	US	\N	6117
Kiel	US	\N	7018
State College	US	\N	87723
Ruthen	DE	\N	10957
Kolchugino	RU	\N	43089
South Shields	GB	\N	75337
Pukalani	US	\N	7769
Plumstead	US	\N	13694
Springwater	CA	\N	19059
Horsforth	GB	\N	18895
Chlumec nad Cidlinou	CZ	\N	5501
Harwich	US	\N	12142
Pacasmayo	PE	\N	26125
Mitchellville	US	\N	11215
Chandler	CA	\N	7703
Jamesburg	US	\N	5885
Northfield	US	\N	22325
Bridgnorth	GB	\N	12079
Hawkinge	GB	\N	8002
Ivins	US	\N	9192
Lynn Haven	US	\N	20525
Rayleigh	GB	\N	32150
Narangba	AU	\N	18573
Mengen	DE	\N	9896
Crowborough	GB	\N	20607
Bushkill	US	\N	8421
Gatton	AU	\N	7101
Kleinsachsenheim	DE	\N	18794
Naranja	US	\N	10702
Truth or Consequences	US	\N	7035
Bayou Blue	US	\N	11682
Highbury	GB	\N	26664
Caledonia	US	\N	25277
Summerfield	US	\N	13781
Eagan	US	\N	66372
New Franklin	US	\N	14133
Nikko	JP	\N	78768
Trinidad	UY	\N	21429
Wibsey	GB	\N	14671
Qashyr	KZ	\N	8931
Turnov	CZ	\N	14420
Darregueira	AR	\N	3412
Yavatmal	IN	\N	132000
Santo Antonio de Jesus	BR	\N	101548
Smithtown	US	\N	117031
Ubatuba	BR	\N	86392
Herbrechtingen	DE	\N	13051
Gavrilov-Yam	RU	\N	17057
Podu Iloaiei	RO	\N	9573
Maubeuge	FR	\N	29944
Latrobe	US	\N	7830
Torre del Mar	ES	\N	22168
Westchase	US	\N	23636
Troyan	BG	\N	23520
Chinchilla	AU	\N	6612
Yuba City	US	\N	120456
Radenthein	AT	\N	5831
Tokol	HU	\N	10116
Holdrege	US	\N	5255
Stolin	BY	\N	12900
Trebon	CZ	\N	8217
Regente Feijo	BR	\N	19733
Minot	US	\N	49425
Wehr	DE	\N	13098
Mineral'nyye Vody	RU	\N	74141
San Dionisio del Mar	MX	\N	5127
Menzelinsk	RU	\N	17055
Spassk-Dal'niy	RU	\N	41127
Tyniste nad Orlici	CZ	\N	6055
Tobyhanna	US	\N	8444
Naujoji Akmene	LT	\N	7725
Puca Urco	PE	\N	10
Ironwood	US	\N	6448
Heathrow	US	\N	6364
Selb	DE	\N	15128
Saint-Lin--Laurentides	CA	\N	17463
Kinston	US	\N	26889
Sauk Village	US	\N	10246
Moraine	US	\N	6470
Dorking	GB	\N	11185
Svalyava	UA	\N	17234
Manchester-by-the-Sea	US	\N	5370
Weymouth	GB	\N	53068
Palmetto	US	\N	13748
Wooster	US	\N	30750
Colac	AU	\N	12547
Dumas	US	\N	13963
Alamogordo	US	\N	33513
Iwashita	JP	\N	10152
Marshfield	US	\N	25754
View Park-Windsor Hills	US	\N	11580
Galax	US	\N	6232
South Venice	US	\N	14419
Santa Catarina Ayotzingo	MX	\N	10702
Wailuku	US	\N	17354
Beloretsk	RU	\N	65477
Borgloon	BE	\N	10697
Schweinfurt	DE	\N	54032
Kurri Kurri	AU	\N	6044
Lohmar	DE	\N	30363
Aleksandrovsk-Sakhalinskiy	RU	\N	9504
Lacombe	CA	\N	13057
Earley	GB	\N	32036
Flowood	US	\N	9380
Bacalar	MX	\N	11084
Bellinzona	CH	\N	43220
Wadsley	GB	\N	5631
Victoria	US	\N	68078
Bad Honningen	DE	\N	5920
Corbin	US	\N	7202
Saint-Raphael	FR	\N	35042
Roebourne	AU	\N	981
Branston	GB	\N	6749
Hirakawacho	JP	\N	30822
Kimje	KR	\N	84269
Yershov	RU	\N	19590
Clayton le Moors	GB	\N	8522
Fishguard	GB	\N	5407
Brzeszcze	PL	\N	11921
Westland	US	\N	81511
Morriston	GB	\N	16928
Northwood	GB	\N	22047
Glenbrook	AU	\N	5051
Brewton	US	\N	6615
East Hampton	US	\N	21903
Givet	FR	\N	6749
Gelendzhik	RU	\N	77212
Gilroy	US	\N	118993
Xinqing	CN	\N	55415
Muskegon Heights	US	\N	10736
La Mirada	US	\N	48183
Merritt	CA	\N	7139
Zarinsk	RU	\N	46597
Bell Gardens	US	\N	42012
Tvarditsa	BG	\N	6711
Rothesay	CA	\N	11659
Lawrenceville	US	\N	30834
Walpole	US	\N	25075
Roanoke Rapids	US	\N	22225
Mound	US	\N	9509
Vrchlabi	CZ	\N	12340
Southborough	US	\N	10074
Otterburn Park	CA	\N	8450
Northdale	US	\N	22529
Bermuda Dunes	US	\N	6817
Sharya	RU	\N	23976
West Babylon	US	\N	42918
Shashemene	ET	\N	114350
Wickersley	GB	\N	7392
Cidra	PR	\N	5620
Tatsugo	JP	\N	5728
Delano	US	\N	54917
Plana	CZ	\N	5396
Brzeg Dolny	PL	\N	12816
Saint Andrews	GB	\N	16801
Sayanogorsk	RU	\N	47358
Haslemere	GB	\N	16826
Lebanon	US	\N	78302
Karasuk	RU	\N	26902
Valenii de Munte	RO	\N	11707
Liteni	RO	\N	9596
Catigua	BR	\N	7603
Peterborough	GB	\N	82
Lady Lake	US	\N	16020
Baidyabati	IN	\N	121110
Brady	US	\N	5137
Cajabamba	PE	\N	13486
Engenheiro Coelho	BR	\N	18611
Irlam	GB	\N	19933
Portishead	GB	\N	25000
Tsukubamirai	JP	\N	50870
Kevelaer	DE	\N	28021
Clowne	GB	\N	7447
Mirabel	CA	\N	50513
Benton	US	\N	36820
Schneeberg	DE	\N	13894
Shanor-Northvue	US	\N	5107
Oer-Erkenschwick	DE	\N	31442
Yeadon	GB	\N	22233
Atamyrat	TM	\N	38350
Somerdale	US	\N	5477
Manicore	BR	\N	21549
Southwest Middlesex	CA	\N	5723
Trentham	GB	\N	11836
Santa Monica	US	\N	90401
Meridian	US	\N	114161
Coatesville	US	\N	13069
Shields	US	\N	5993
Kruje	AL	\N	11721
Chodov	CZ	\N	13300
Lake St. Louis	US	\N	16864
Upper Uwchlan	US	\N	11509
Penwortham	GB	\N	23047
Sabana Grande	PR	\N	9357
Little River	US	\N	9523
Luhacovice	CZ	\N	5059
Benatky nad Jizerou	CZ	\N	7459
Harelbeke	BE	\N	27886
Boisbriand	CA	\N	26884
West Manheim	US	\N	8338
Riviera Beach	US	\N	35463
Diu	IN	\N	23779
Ayan	RU	\N	1286
Ranson	US	\N	5239
Bani Bangou	NE	\N	6788
Upington	ZA	\N	121189
Gudensberg	DE	\N	9657
Springs	US	\N	6912
North Vancouver	CA	\N	85935
Waimea	US	\N	11687
Petoskey	US	\N	8334
Mount Vista	US	\N	8703
Verkhneuralsk	RU	\N	9340
Eldorado	BR	\N	15339
Richton Park	US	\N	13292
Brakpan	ZA	\N	73080
Fernandina Beach	US	\N	28931
Botley	GB	\N	5100
Sol'-Iletsk	RU	\N	27085
Wabash	US	\N	9710
Sarqan	KZ	\N	76919
Airway Heights	US	\N	9485
Satipo	PE	\N	10052
Livonia	US	\N	93665
Massangena	MZ	\N	650
Belleview	US	\N	5101
Eureka	US	\N	44236
Selsey	GB	\N	10737
Edinboro	US	\N	6222
Port Moody	CA	\N	33551
Raton	US	\N	5650
Dormont	US	\N	8282
Park Street	GB	\N	6781
Frydlant nad Ostravici	CZ	\N	9922
Bishops Stortford	GB	\N	40089
Trofimovsk	RU	\N	10
Salmon Creek	US	\N	21299
Temascal	MX	\N	6566
Nanuet	US	\N	17775
Tezpur	IN	\N	58851
Arcos de la Frontera	ES	\N	30700
Bellingham	US	\N	130641
Goryachiy Klyuch	RU	\N	37475
Grevesmuhlen	DE	\N	10354
Mammoth Lakes	US	\N	7694
Atlapexco	MX	\N	18769
Osakarovka	KZ	\N	7305
Murayama	JP	\N	22905
Atkarsk	RU	\N	25140
Rousinov	CZ	\N	5694
Oberursel	DE	\N	46248
Greenburgh	US	\N	91355
Batley	GB	\N	49448
Bad Urach	DE	\N	12472
Abashiri	JP	\N	35205
Jindrichuv Hradec	CZ	\N	21419
Bad Worishofen	DE	\N	15963
Tubize	BE	\N	25914
Woodville	GB	\N	5161
Videle	RO	\N	11508
Monson	US	\N	8811
Maglod	HU	\N	12341
Xinguara	BR	\N	4047
Chico	US	\N	117668
Dreieich	DE	\N	42091
Gueppi	PE	\N	10
Hasilpur	PK	\N	99171
Khak-e `Ali	IR	\N	104417
Sun Lakes	US	\N	14582
Edson	CA	\N	8414
Blankenburg	DE	\N	19817
Lincoln	CA	\N	23787
Pacifica	US	\N	38546
Alvorada	BR	\N	10232
Alton	US	\N	78905
Mequon	US	\N	24382
Bhainsa	IN	\N	49764
Fundulea	RO	\N	6851
Donaueschingen	DE	\N	22526
Savigny-le-Temple	FR	\N	29984
Luuq	SO	\N	33820
Soledad	US	\N	26207
El Cajon	US	\N	102708
Miedzyrzec Podlaski	PL	\N	17117
Holiday	US	\N	21481
New Hope	US	\N	20907
Columbia Falls	US	\N	7556
Guariba	BR	\N	38499
Searcy	US	\N	26889
Sanford	US	\N	61448
Hilsea	GB	\N	13552
Oshima	JP	\N	15369
Saarburg	DE	\N	7427
Redondo Beach	US	\N	66749
Vitkov	CZ	\N	5670
Makinsk	KZ	\N	23020
Berkeley	US	\N	121363
Corbeil-Essonnes	FR	\N	51292
Taquarivai	BR	\N	5605
San Angelo	US	\N	100773
Umm Ruwaba	SD	\N	55742
Clifton Springs	AU	\N	7519
Kinel	RU	\N	35675
Machesney Park	US	\N	22677
Leavenworth	US	\N	46192
Jirkov	CZ	\N	19241
Riehen	CH	\N	21448
Neckarsulm	DE	\N	26492
Pembroke	GB	\N	7552
Olton	GB	\N	12167
Donaldsonville	US	\N	16540
Jessup	US	\N	8359
Pulsnitz	DE	\N	7467
Whaley Bridge	GB	\N	6455
Mamadysh	RU	\N	15806
Fountain Inn	US	\N	10441
Summerland	CA	\N	11615
Kastellaun	DE	\N	5410
Artemovskiy	RU	\N	30778
Vyazma	RU	\N	52506
Ben Gardane	TN	\N	19843
Wake	JP	\N	13690
Bad Waldsee	DE	\N	20308
Wynyard	AU	\N	6001
Seneca	US	\N	27439
Menkerya	RU	\N	10
Richardson	US	\N	121323
Sosa	JP	\N	35186
Hartford City	US	\N	5604
Schiller Park	US	\N	11403
Ust'-Ordynskiy	RU	\N	14538
Lqoliaa	MA	\N	83235
Milford	US	\N	54047
Port Douglas	AU	\N	3504
Deux-Montagnes	CA	\N	17553
Schererville	US	\N	28527
La Plata	US	\N	9631
Sosnogorsk	RU	\N	26670
Southwell	GB	\N	7297
Lake Elmo	US	\N	9210
Childwall	GB	\N	14085
Buckeburg	DE	\N	19245
Penn Forest	US	\N	9620
Las Flores	US	\N	5877
Lavrinhas	BR	\N	7052
Sparks	US	\N	105006
Verkhniy Tagil	RU	\N	10962
Et Taiyiba	IL	\N	43100
Avon Park	US	\N	10689
Goldsboro	US	\N	57278
Coon Rapids	US	\N	62998
Villa Luzuriaga	AR	\N	94403
Banbury	GB	\N	46853
Gross-Umstadt	DE	\N	21162
New Prague	US	\N	8859
Homosassa Springs	US	\N	13477
Princeton	US	\N	31187
East Cocalico	US	\N	10481
Beaverton	US	\N	99037
St. Clements	CA	\N	10876
Pasco	US	\N	75432
Ibstock	GB	\N	5760
Macatuba	BR	\N	17013
Greater Napanee	CA	\N	15892
Geithain	DE	\N	6888
Bognor Regis	GB	\N	24064
Watsonville	US	\N	77352
Eichwalde	DE	\N	6468
Ponte Nova	BR	\N	48187
Yamazaki	JP	\N	15704
Mina Clavero	AR	\N	8487
Uxbridge	US	\N	13903
Chackbay	US	\N	5573
Cambridge	NZ	\N	19150
Edina	US	\N	52857
Freren	DE	\N	5023
Bohemia	US	\N	9293
Yorketown	US	\N	6565
Amircan	AZ	\N	29800
Santo Antonio de Posse	BR	\N	22389
Havant	GB	\N	45826
Siret	RO	\N	7976
Jaggayyapeta	IN	\N	53530
Kotelniki	RU	\N	46763
Burr Ridge	US	\N	10758
Bapatla	IN	\N	70777
Aliquippa	US	\N	8844
Hendersonville	US	\N	58113
The Crossings	US	\N	23558
Staraya Russa	RU	\N	29019
Kettering	GB	\N	93475
Fairfax	US	\N	24019
Giengen an der Brenz	DE	\N	19666
Caldera	CL	\N	10259
Witu	KE	\N	5380
Jerseyville	US	\N	8708
West Odessa	US	\N	26278
Moody	US	\N	13065
Harlan	US	\N	6089
Nambu	JP	\N	7341
Quintana	BR	\N	6437
Valley	US	\N	19926
Bonnyrigg	GB	\N	15677
Donzdorf	DE	\N	10682
Villas	US	\N	12036
Burshtyn	UA	\N	15039
Wyomissing	US	\N	10635
Moraleja	ES	\N	6750
Scottdale	US	\N	10698
Moraga	US	\N	17783
Racari	RO	\N	6930
Aztec	US	\N	7963
Kabirwala	PK	\N	70123
Spanaway	US	\N	32150
Seasalter	GB	\N	7967
Boyarka	RU	\N	35968
Xoxocotla	MX	\N	21074
Weston	US	\N	71166
Santa Fe do Sul	BR	\N	31348
Braintree	GB	\N	53477
Sovata	RO	\N	10385
Chatham	US	\N	13008
Hooksett	US	\N	14221
Rohnert Park	US	\N	43291
Niagara	US	\N	8084
Muscoy	US	\N	13726
Arkansas City	US	\N	12242
Luftkurort Arendsee	DE	\N	6750
Matsuzaki	JP	\N	6200
Pocking	DE	\N	15967
Ulverstone	AU	\N	14109
Southgate	CA	\N	7190
Oriximina	BR	\N	35581
Humboldt	CA	\N	5869
El Reno	US	\N	17962
Qunghirot	UZ	\N	57758
Chapaev	KZ	\N	6000
Brandon	GB	\N	9145
Catriel	AR	\N	17584
Vincent	US	\N	17008
Diest	BE	\N	23824
Bornheim	DE	\N	48326
East St. Paul	CA	\N	9372
Oederan	DE	\N	8002
Luau	AO	\N	18465
Hillside	US	\N	21895
Altata	MX	\N	2001
Nikel	RU	\N	15866
Alfortville	FR	\N	43881
Branford	US	\N	28094
Horncastle	GB	\N	6815
Shahhat	LY	\N	45000
Muscle Shoals	US	\N	14575
Brockton	US	\N	95708
Wilmore	US	\N	9616
Bad Durrheim	DE	\N	13260
Sudogda	RU	\N	10442
Bad Laasphe	DE	\N	13565
Saint-Mande	FR	\N	22619
Brownsweg	SR	\N	4582
Swanzey	US	\N	7195
Gildersome	GB	\N	5804
Wool	GB	\N	5310
Mandelieu-la-Napoule	FR	\N	22452
Layton	US	\N	78014
Nicoadala	MZ	\N	6945
Big Lake	US	\N	11226
Dauphin	CA	\N	8457
Aix-les-Bains	FR	\N	29794
Schwarzenbach an der Saale	DE	\N	7042
Neustadt-Glewe	DE	\N	7009
Westchester	US	\N	30210
Alamedin	KG	\N	11773
Karmah an Nuzul	SD	\N	3928
Marshalltown	US	\N	25994
Patos	AL	\N	15397
Allegheny Township	US	\N	8158
Abergele	GB	\N	10577
Polesworth	GB	\N	8423
Dmitrov	RU	\N	68792
Chevy Chase	US	\N	9611
Villiersdorp	ZA	\N	10004
Sternberk	CZ	\N	13440
Puerto Aventuras	MX	\N	5979
Villa Hills	US	\N	7461
Altofts	GB	\N	6198
Jaen	PE	\N	52493
Catasauqua	US	\N	6599
Kendallville	US	\N	10432
Linton Hall	US	\N	41088
Mount Clemens	US	\N	16163
Jirja	EG	\N	102597
Apolo	BO	\N	4189
Minyar	RU	\N	9128
Vil'nohirs'k	UA	\N	23235
St. Albans	US	\N	9918
Essex	US	\N	40480
West Tawakoni	US	\N	9679
Yellowknife	CA	\N	19569
Monchegorsk	RU	\N	42099
Beaver Falls	US	\N	8332
Port Chester	US	\N	29163
Tukchi	RU	\N	10
Bramcote	GB	\N	7270
Rio Grande	PR	\N	12973
Mwingi	KE	\N	11219
Bogotol	RU	\N	23622
Seaham	GB	\N	20172
Tetyushi	RU	\N	11250
Marumori	JP	\N	12823
Schertz	US	\N	42042
Date	JP	\N	59441
Ives Estates	US	\N	22682
Bendorf	DE	\N	16940
Mattapoisett	US	\N	6294
Samorin	SK	\N	13324
Fortuna Foothills	US	\N	29485
Bunde	DE	\N	45521
Garden City Park	US	\N	8081
Nutley	US	\N	28493
Hampton	GB	\N	19372
Espungabera	MZ	\N	393
Placerville	US	\N	31943
Bearsted	GB	\N	8010
Kulusuk	GL	\N	286
Alvaro de Carvalho	BR	\N	5030
Balsas	BR	\N	68056
Cresson	US	\N	10078
Catoosa	US	\N	6953
Siguatepeque	HN	\N	39070
Beresford	CA	\N	6248
Dorfen	DE	\N	14650
Saint-Colomban	CA	\N	13080
Greenlawn	US	\N	13978
Kasumi	JP	\N	16321
Alga	KZ	\N	28267
Lake Fenton	US	\N	5331
Reedley	US	\N	49042
Palmeira d'Oeste	BR	\N	9596
Coral Springs	US	\N	133759
Herk-de-Stad	BE	\N	12661
Kenwood	US	\N	7244
Porkhov	RU	\N	8743
Peru	US	\N	30287
Granby	US	\N	11305
East San Gabriel	US	\N	15932
Kashin	RU	\N	14287
Orly	FR	\N	23801
Hilliard	US	\N	36534
Gloucester	US	\N	63700
Kenton	US	\N	8276
Tecozautla	MX	\N	31609
Lucas Valley-Marinwood	US	\N	6841
Barabinsk	RU	\N	28941
Mohammad Shahr	IR	\N	119418
Newtown Township	US	\N	13039
Villalonga	AR	\N	2838
Aracati	BR	\N	44293
Wanzleben	DE	\N	13903
Nejdek	CZ	\N	7806
Fairhaven	US	\N	16026
West University Place	US	\N	15585
Valldoreix	ES	\N	8401
Mississippi Mills	CA	\N	13163
Hamilton	AU	\N	9974
Karabanovo	RU	\N	14786
Snowflake	US	\N	6733
Albstadt	DE	\N	45327
San Miguel de Salcedo	EC	\N	12488
South Plainfield	US	\N	24052
Le Creusot	FR	\N	21630
Uttoxeter	GB	\N	13089
Armidale	AU	\N	24504
Stapleford	GB	\N	15241
Dighton	US	\N	7571
Aramil	RU	\N	15236
Leonora	AU	\N	781
Barnsley	GB	\N	91297
Sheyban	IR	\N	23211
Tonganoxie	US	\N	5522
Santa Rita do Passa Quatro	BR	\N	27502
Kempen	DE	\N	34597
Dale City	US	\N	73545
Quang Tri	VN	\N	72722
Alvares Machado	BR	\N	24651
Frederickson	US	\N	22935
Mountain Home	US	\N	16945
Castle Donnington	GB	\N	6416
Pulheim	DE	\N	54071
Codo	BR	\N	83288
El Granada	US	\N	5819
Hachimantai	JP	\N	24412
Gonzales	US	\N	10957
Eschborn	DE	\N	21488
Beaconsfield	GB	\N	12081
Guelph/Eramosa	CA	\N	12854
Monrovia	US	\N	36331
Martinsville	US	\N	31871
Campbelltown	AU	\N	12566
Chesterton	US	\N	14088
Harsewinkel	DE	\N	25147
Elhovo	BG	\N	10929
Petawawa	CA	\N	17187
Caracarai	BR	\N	11368
Wandsworth	GB	\N	61594
Byram	US	\N	11428
Fort Salonga	US	\N	9776
Holtsville	US	\N	19365
Staryy Beyneu	KZ	\N	32452
East Brunswick	US	\N	47981
Middleburg Heights	US	\N	15432
Bedourie	AU	\N	122
Bathgate	GB	\N	20363
Atoka	US	\N	21428
Kendu Bay	KE	\N	91248
Chapantongo	MX	\N	11389
Bad Breisig	DE	\N	9460
Yuanchang	TW	\N	25840
Lancing	GB	\N	18810
Antequera	ES	\N	41239
Itako	JP	\N	27807
Mozdok	RU	\N	41728
Willmar	US	\N	20510
Bet She'an	IL	\N	18200
East Pikeland	US	\N	7331
Rocky Mountain House	CA	\N	6635
Glassmanor	US	\N	17628
La Homa	US	\N	12054
Boloso	CG	\N	12244
Robbinsville	US	\N	14245
Tequesta	US	\N	6138
Blyth	GB	\N	37339
North Gates	US	\N	9353
Otsego	US	\N	18113
Chaparral	US	\N	14793
Deinze	BE	\N	31085
San Jacinto	UY	\N	7000
Chester	US	\N	34000
Alexandra	NZ	\N	5510
Juncos	PR	\N	7970
Grand Blanc	US	\N	7870
Saint-Medard-en-Jalles	FR	\N	31145
Griffith	AU	\N	20251
San Felipe Tejalapan	MX	\N	7862
Oarai	JP	\N	15992
Kings Norton	GB	\N	24380
Wermelskirchen	DE	\N	34765
Lakeshore	CA	\N	36611
Lower Hutt	NZ	\N	103400
Red Hill	US	\N	15459
Tanuku	IN	\N	77962
Tsivilsk	RU	\N	14718
New City	US	\N	34652
Saco	US	\N	19964
Newburn	GB	\N	9536
Xanten	DE	\N	21690
Babenhausen	DE	\N	16834
Orem	US	\N	97828
Pillaro	EC	\N	7444
Cheadle Hulme	GB	\N	26479
Erkelenz	DE	\N	43364
Coroados	BR	\N	5753
Bouknadel	MA	\N	25255
Inverurie	GB	\N	10885
Vreden	DE	\N	22641
Al Qa`idah	YE	\N	39254
Belle Isle	US	\N	7240
Northville	US	\N	5958
Oktyabr'skiy	RU	\N	113929
Geneseo	US	\N	10657
Malibu	US	\N	11820
Montrose	US	\N	23478
Meymeh	IR	\N	5733
Abingdon	GB	\N	39809
Naracoorte	AU	\N	5960
Newington Forest	US	\N	12476
Hucclecote	GB	\N	10158
Valinda	US	\N	25296
Teius	RO	\N	6695
Dinas Powys	GB	\N	7490
Southchase	US	\N	15096
Ruhla	DE	\N	5540
As Sidrah	LY	\N	50
Cochituate	US	\N	6942
Brambleton	US	\N	20081
Aiyomojok	CM	\N	5798
Aulendorf	DE	\N	10180
Alvin	US	\N	26723
Snohomish	US	\N	10154
North Myrtle Beach	US	\N	16819
Winnenden	DE	\N	28339
Port Jefferson	US	\N	8145
Egypt Lake-Leto	US	\N	37039
Sao Gabriel da Cachoeira	BR	\N	15231
Brejo do Cruz	BR	\N	13900
Willistown	US	\N	10895
Yarmouth Port	US	\N	5045
Sungai Penuh	ID	\N	101325
Whitnash	GB	\N	9129
Marlow Heights	US	\N	5869
La Lima	HN	\N	53492
Banaruyeh	IR	\N	9318
Estrela d'Oeste	BR	\N	8462
Mono	CA	\N	8609
Lake Havasu City	US	\N	56820
East Windsor	US	\N	27294
Billerica	US	\N	43044
Hermanus	ZA	\N	25153
Wells Branch	US	\N	12227
Neustadt am Rubenberge	DE	\N	44282
Buttstadt	DE	\N	6707
Chard	GB	\N	13074
Lenoir	US	\N	17913
DuPont	US	\N	9516
Chelsfield	GB	\N	14507
Don Bosco	AR	\N	20876
Shirahama	JP	\N	20470
Parlier	US	\N	15613
Iguape	BR	\N	30390
Lomas de Sargentillo	EC	\N	13775
Boryslav	UA	\N	37093
Upper Yoder	US	\N	5195
Biryusinsk	RU	\N	8497
Las Veredas	MX	\N	10478
Monte Mor	BR	\N	55409
Yankton	US	\N	14872
Shwebo	MM	\N	88914
Inuyama	JP	\N	73541
Zeliezovce	SK	\N	6859
Baker	US	\N	13194
Asperg	DE	\N	13480
Bee Ridge	US	\N	10012
Bogo	CM	\N	95230
Eppelheim	DE	\N	15177
Stretford	GB	\N	46910
Diavata	GR	\N	9890
Chippewa	US	\N	7682
Marple	GB	\N	23687
Ocean Bluff-Brant Rock	US	\N	5190
Escalante	PH	\N	94070
Rovinari	RO	\N	11816
Laie	US	\N	6111
Mszczonow	PL	\N	6323
Zaozersk	RU	\N	9915
Waihee-Waiehu	US	\N	8802
Casas Adobes	US	\N	69615
Kandukur	IN	\N	57246
Basehor	US	\N	5419
Kirchhain	DE	\N	16298
Karumai	JP	\N	8536
Laichingen	DE	\N	11731
McCordsville	US	\N	7479
St. Anthony	US	\N	9013
Sausalito	US	\N	7068
Conroe	US	\N	91079
Rietberg	DE	\N	29466
Mancheral	IN	\N	89935
Boxford	US	\N	8270
Iracemapolis	BR	\N	22557
Camrose	CA	\N	18742
Sappington	US	\N	7577
Elkins	US	\N	10899
Mineiros do Tiete	BR	\N	12700
Canmore	CA	\N	13992
Iselin	US	\N	18274
Moose Jaw	CA	\N	33890
Archer Lodge	US	\N	15972
Gresham	US	\N	109381
Southside	US	\N	8905
Bystrice nad Pernstejnem	CZ	\N	8004
Oranienbaum	DE	\N	8344
Klyuchi	RU	\N	1089
Valdez	EC	\N	11441
Gardanne	FR	\N	20794
Colonia Nicolich	UY	\N	14686
San Lorenzo	AR	\N	47626
Hwange	ZW	\N	42581
Barnet	GB	\N	47359
Yerema	RU	\N	745
Eseka	CM	\N	22221
Rugeley	GB	\N	24033
Sun City West	US	\N	25444
Montesano	US	\N	8685
McHenry	US	\N	27061
Belle Glade	US	\N	28665
Wilmington Island	US	\N	15391
Rawdon	CA	\N	10416
Sao Joao da Boa Vista	BR	\N	89027
San Juan	CR	\N	24944
Lykovrysi	GR	\N	9738
Donnacona	CA	\N	7200
Sussen	DE	\N	10192
Quibala	AO	\N	8915
Wernau	DE	\N	12324
Shilka	RU	\N	12663
Anna	US	\N	19541
West Lealman	US	\N	15076
Highland Village	US	\N	16668
Otradnoye	RU	\N	25623
Sukhoy Log	RU	\N	33689
Portlethen	GB	\N	9090
Matsubushi	JP	\N	28953
Severnyy	RU	\N	11562
Shihoro	JP	\N	6078
Mullheim	DE	\N	19127
North Bellport	US	\N	11593
Kansk	RU	\N	89508
Navashino	RU	\N	14830
Canterbury	GB	\N	55240
Selah	US	\N	8087
Contra Costa Centre	US	\N	6497
Narragansett	US	\N	15550
Rutherford	US	\N	18303
Mendrisio	CH	\N	14942
Leme	BR	\N	99388
West Perth	CA	\N	8865
Palm Beach	US	\N	8816
Yurimaguas	PE	\N	62903
Kilgore	US	\N	18265
Northenden	GB	\N	15200
Svit	SK	\N	7624
Guillermo E. Hudson	AR	\N	52697
Buckner	US	\N	5465
Kupino	RU	\N	13777
Ascot	GB	\N	11603
Bulaevo	KZ	\N	8433
Castro-Urdiales	ES	\N	32069
Patarlagele	RO	\N	7304
Rosemount	US	\N	25207
Weiterstadt	DE	\N	25975
Amudalavalasa	IN	\N	39799
Coueron	FR	\N	21372
Pitsea	GB	\N	25000
Zlatitsa	BG	\N	5139
Pompeia	BR	\N	21375
Beckum	DE	\N	36646
Fulin	CN	\N	1049
Beyram	IR	\N	6520
Bromborough	GB	\N	14850
Oullins	FR	\N	26273
Chadron	US	\N	5101
Irbit	RU	\N	36668
Northwood	US	\N	5434
Reedsburg	US	\N	9510
Kilmarnock	GB	\N	46450
Camaqua	BR	\N	53169
Rawmarsh	GB	\N	18498
Orange	AU	\N	40493
Izsak	HU	\N	5567
Ts'khinvali	GE	\N	30432
Leun	DE	\N	5728
Sandpoint	US	\N	13145
Sabattus	US	\N	5016
Madinat `Isa	BH	\N	40000
The Dalles	US	\N	20442
Soldotna	US	\N	7398
Kawerau	NZ	\N	7080
Godstone	GB	\N	5949
Stoneham-et-Tewkesbury	CA	\N	7106
Soja	JP	\N	68172
Platte City	US	\N	9462
Korschenbroich	DE	\N	33066
Pickering	GB	\N	6830
Poteau	US	\N	8104
Hyattsville	US	\N	18230
Addanki	IN	\N	43850
Currie	GB	\N	7494
Black Mountain	US	\N	8162
Elfers	US	\N	12637
Srednekolymsk	RU	\N	3489
Gladstone	US	\N	27489
Annfield Plain	GB	\N	7774
Taruma	BR	\N	14205
Litherland	GB	\N	22242
Sebastopol	US	\N	7674
Obama	JP	\N	28538
Chatillon	FR	\N	37355
Marne	DE	\N	5858
Beylul	ER	\N	14055
Lierre	BE	\N	36646
Paducah	US	\N	48481
Boulia	AU	\N	301
Wickford	GB	\N	33486
Newbury	GB	\N	41075
Gages Lake	US	\N	9862
Kamp-Lintfort	DE	\N	37391
Snoqualmie	US	\N	26289
Newburyport	US	\N	18289
Caleta Olivia	AR	\N	51733
Wistaston	GB	\N	8117
Wayne	US	\N	54190
Seaford	US	\N	15113
Palmyra	US	\N	7646
Toyomamachi-teraike	JP	\N	77795
Colona	US	\N	5120
Nemsova	SK	\N	6368
South Dundas	CA	\N	10833
Madinat Zayid	AE	\N	29095
La Broquerie	CA	\N	6076
Presidente Bernardes	BR	\N	13568
La Herradura	ES	\N	5133
Fair Lawn	US	\N	32896
Milo	US	\N	6879
Punganuru	IN	\N	54746
New Bremen	US	\N	7393
Pyhajarvi	FI	\N	5505
Staufen im Breisgau	DE	\N	8209
Iwakura	JP	\N	47839
Sobeslav	CZ	\N	6907
Chapadinha	BR	\N	40804
New Lenox	US	\N	26926
Buxtehude	DE	\N	40150
North Ogden	US	\N	20582
Hillsborough	US	\N	39397
Sundern	DE	\N	27802
Bucha	UA	\N	35162
Nuwara Eliya	LK	\N	27500
Shchuchinsk	KZ	\N	45004
Rezh	RU	\N	37152
Stroud	US	\N	18952
Robel	DE	\N	5044
Finchley	GB	\N	65812
Spremberg	DE	\N	22175
Orvault	FR	\N	26355
Bay Roberts	CA	\N	6012
Carlstadt	US	\N	6132
Tysons	US	\N	23749
Oravita	RO	\N	11382
Waggaman	US	\N	9866
Shamong	US	\N	6415
Totnes	GB	\N	8076
Narita	JP	\N	132293
Stafa	CH	\N	14389
Jan Phyl Village	US	\N	6467
West Deer	US	\N	11929
Tres Coracoes	BR	\N	72765
Millbury	US	\N	13630
Raymore	US	\N	22194
Bhadreswar	IN	\N	101477
Carterville	US	\N	5847
Cornwall	CA	\N	46589
Vero Beach	US	\N	17503
Piedras Blancas	ES	\N	9533
Canas	CR	\N	20306
Panchgani	IN	\N	13280
Wauchope	AU	\N	6312
Beith	GB	\N	6346
Llantrisant	GB	\N	15313
Frimley	GB	\N	6178
Old Bridge	US	\N	65935
Savigny-sur-Orge	FR	\N	36533
Nankana Sahib	PK	\N	63073
Mission	US	\N	84331
Williston Park	US	\N	7253
South Pittsburg	US	\N	5439
Kasson	US	\N	7715
Shchastia	UA	\N	12629
Brownwood	US	\N	21729
Mendota Heights	US	\N	11343
Upper	US	\N	11909
Houghton Regis	GB	\N	17280
Zhitiqara	KZ	\N	33587
Alfreton	GB	\N	22302
Rutesheim	DE	\N	10916
Changyon	KP	\N	48984
Eilenburg	DE	\N	15583
Twickenham	GB	\N	62148
Worcester Park	GB	\N	16031
Gunnedah	AU	\N	9726
Grand Terrace	US	\N	12584
Navalmoral de la Mata	ES	\N	17129
Hastings	US	\N	24101
College Park	US	\N	32163
Fern Park	US	\N	8340
Stadtallendorf	DE	\N	21456
Balabanovo	RU	\N	25608
Novo Airao	BR	\N	9049
Smigiel	PL	\N	5420
Farnley	GB	\N	24213
Morley	GB	\N	44440
Sparta	US	\N	18841
Salinopolis	BR	\N	40998
Qiryat Bialik	IL	\N	39900
San Dimas	US	\N	33621
Saint-Eustache	CA	\N	44154
Tocoa	HN	\N	46900
Tagta	TM	\N	11501
Caldwell	US	\N	58481
Tranent	GB	\N	12582
Huntley	US	\N	27228
Timimoun	DZ	\N	49237
Ohringen	DE	\N	24374
Wheat Ridge	US	\N	31324
Pantanal	DO	\N	43982
Mastic Beach	US	\N	11953
Usingen	DE	\N	14505
Burke Centre	US	\N	18236
Ocean Shores	US	\N	6085
Qatsrin	IL	\N	6913
Morton	US	\N	16277
Oschersleben	DE	\N	19630
Azumino	JP	\N	94463
Zeya	RU	\N	23270
Monterey	US	\N	28178
Meopham	GB	\N	6722
Markham	US	\N	12314
Labutta	MM	\N	1667
Joppatowne	US	\N	12560
Wahiawa	US	\N	17422
Bishopstoke	GB	\N	9974
Ban Thum	TH	\N	17564
South San Gabriel	US	\N	8643
Ramsey	US	\N	27721
Wausau	US	\N	73593
Russas	BR	\N	39465
Charlottesville	US	\N	100416
Chaman	PK	\N	107660
Burscheid	DE	\N	18172
Belle Fourche	US	\N	5341
Rochelle	US	\N	10723
Coaticook	CA	\N	8698
Loftus	GB	\N	7988
Derzhavinsk	KZ	\N	15848
Copiague	US	\N	23716
Cerquilho Velho	BR	\N	45142
Harleston	GB	\N	5067
Kisanuki	JP	\N	14495
Coshocton	US	\N	11347
Falkenstein	DE	\N	8061
Ochamchire	GE	\N	5280
Durlesti	MD	\N	17210
Sangju	KR	\N	102892
Nederland	US	\N	17371
Uzda	BY	\N	10700
Gouverneur	US	\N	7029
Crissier	CH	\N	7930
Chaplygin	RU	\N	11802
Leimen	DE	\N	26968
Harris	US	\N	5612
Kearny	US	\N	41058
Morungaba	BR	\N	12934
Zeeland	US	\N	5536
Bad Frankenhausen	DE	\N	10230
South Gate Ridge	US	\N	6328
Wem	GB	\N	6100
Marlton	US	\N	9990
Pamidi	IN	\N	26886
Holyhead	GB	\N	11431
Krasnoarmeysk	RU	\N	26519
Grandview Heights	US	\N	8333
Ribeira Grande	PT	\N	32112
Clawson	US	\N	11845
Peasedown Saint John	GB	\N	6446
Chibia	AO	\N	1411
Granite City	US	\N	28158
Gunbarrel	US	\N	9791
Rameswaram	IN	\N	44856
Markkleeberg	DE	\N	24679
Christchurch	GB	\N	48368
Windermere	GB	\N	8359
Sao Lourenco do Sul	BR	\N	25340
Isabela	PR	\N	10708
Exeter	GB	\N	124180
Ritto	JP	\N	69294
Mills River	US	\N	7406
Pakefield	GB	\N	6563
Alva	US	\N	5628
Nkawkaw	GH	\N	62667
North Glengarry	CA	\N	10109
Choppington	GB	\N	9787
Swanwick	GB	\N	5084
Diamond Bar	US	\N	55720
Petersburg	US	\N	31346
Albertville	US	\N	37775
Bankya	BG	\N	11233
Quime	BO	\N	4045
South Haven	US	\N	5719
Pana	US	\N	5463
South Euclid	US	\N	21297
Novouzensk	RU	\N	13261
California	US	\N	14298
Waimalu	US	\N	13384
Tachiarai	JP	\N	15274
Payerne	CH	\N	9943
Golden Hills	US	\N	9407
Cudworth	GB	\N	10977
Alness	GB	\N	5310
Fukuyoshi	JP	\N	21641
Rushden	GB	\N	29272
Niles	US	\N	28938
Al Muharraq	BH	\N	75000
East Rancho Dominguez	US	\N	16734
Qarabalyq	KZ	\N	9838
Surany	SK	\N	9878
Sorum	NO	\N	113659
Nevyansk	RU	\N	23200
Ilminster	GB	\N	5808
Little Ferry	US	\N	10739
Irondale	US	\N	12893
Big Spring	US	\N	28913
La Crucecita	MX	\N	13044
Fletcher	US	\N	8369
Chorley	GB	\N	34667
Ozu	JP	\N	41201
Rock Springs	US	\N	25913
Emmen	CH	\N	29292
Fort Dix	US	\N	7753
Enderby	GB	\N	6314
Piripiri	BR	\N	44864
Teabo	MX	\N	6115
Cedar Hill	US	\N	47930
Konstanz	DE	\N	84760
Crieff	GB	\N	7368
Marathon	US	\N	9271
Peekskill	US	\N	24295
Valatie	US	\N	5400
Lynnwood	US	\N	39141
San Carlos	US	\N	30185
Beecher	US	\N	9128
Geislingen	DE	\N	5881
Arnstedt	DE	\N	6616
Rapid City	US	\N	92664
Higuera de Zaragoza	MX	\N	8976
Crossville	US	\N	17825
Perrenjas	AL	\N	5847
Rumson	US	\N	6714
Fort Polk South	US	\N	9233
Bargersville	US	\N	8076
Willenhall	GB	\N	28480
Travelers Rest	US	\N	5346
Krasnokamensk	RU	\N	52811
Itapolis	BR	\N	42343
Mazabuka	ZM	\N	64006
Avanhandava	BR	\N	12719
Myrtletown	US	\N	5290
Tyukalinsk	RU	\N	10311
Gauripur	IN	\N	23477
Saron	ZA	\N	7843
Prestonpans	GB	\N	10360
Terek	RU	\N	19494
Chickerell	GB	\N	5515
College Place	US	\N	9317
Walsall Wood	GB	\N	13207
Reigate	GB	\N	21820
Laverton	AU	\N	871
Wroughton	GB	\N	8033
Moatize	MZ	\N	42000
Pinckneyville	US	\N	5393
Madera Acres	US	\N	9946
Byarozawka	BY	\N	10400
Kobylka	PL	\N	17586
Rosemead	US	\N	54058
Kenora	CA	\N	15096
Khadyzhensk	RU	\N	22468
Hidalgo	US	\N	14183
Dryanovo	BG	\N	7908
Chernogolovka	RU	\N	21342
North Chicago	US	\N	29615
Poplar Bluff	US	\N	20359
Wood Green	GB	\N	28453
Tara	JP	\N	8119
Satadougou	ML	\N	706
Pala Oua	TD	\N	38975
East Bridgewater	US	\N	14386
Berne	US	\N	5830
Almargem	PT	\N	8983
Reze	FR	\N	41411
Rehau	DE	\N	9424
St. Pete Beach	US	\N	9587
Portachuelo	BO	\N	16408
Andalusia	US	\N	6407
Dent	US	\N	11378
Barra do Corda	BR	\N	48901
Kstovo	RU	\N	67874
Westlake Village	US	\N	8217
Crookston	US	\N	7835
McDonough	US	\N	26768
West Yarmouth	US	\N	5271
Queen Creek	US	\N	50890
Bafang	CM	\N	93145
Barnoldswick	GB	\N	10752
Macclenny	US	\N	11958
Hayle	GB	\N	8939
Pir Bakran	IR	\N	10851
Onagawa	JP	\N	5822
Woodland	US	\N	60598
Martfu	HU	\N	6169
Griffithstown	GB	\N	5450
Abiko	JP	\N	131026
Canon City	US	\N	27676
Elk Grove Village	US	\N	32400
Zychlin	PL	\N	9021
Hibbing	US	\N	11257
Caslav	CZ	\N	10322
Pinheiro	BR	\N	38893
Taupo	NZ	\N	23900
Fulacunda	GW	\N	1311
Streatham	GB	\N	58055
Plantation	US	\N	94580
Brierfield	GB	\N	8193
Candelaria	PR	\N	15846
Rockingham	US	\N	23016
Dobris	CZ	\N	8960
Wangaratta	AU	\N	19318
Orange Cove	US	\N	11059
Dunbar	GB	\N	8486
Collinsville	US	\N	24395
Oldsmar	US	\N	15061
Yokoshiba	JP	\N	22585
Clovis	US	\N	114584
Dunsborough	AU	\N	5320
Montero	BO	\N	112837
Frampton Cotterell	GB	\N	6520
Villa Morelos	MX	\N	7806
Suffern	US	\N	11007
Eldridge	US	\N	6846
Kose	JP	\N	24965
Seaside	US	\N	116720
North Cowichan	CA	\N	29676
Sao Joao del Rei	BR	\N	78592
Concord Township	US	\N	17639
Abreus	CU	\N	23144
Rhinelander	US	\N	8830
Campo Maior	BR	\N	31739
La Quinta	US	\N	41748
Khem Karan	IN	\N	11938
Barehra	IN	\N	19542
Chanaral	CL	\N	13543
Six-Fours-les-Plages	FR	\N	32829
Pontefract	GB	\N	30881
Ust'-Nyukzha	RU	\N	10
Egvekinot	RU	\N	2248
Southport	AU	\N	31908
Hohenems	AT	\N	16317
Seven Oaks	US	\N	15559
Biddeford	US	\N	21504
Nadi	FJ	\N	42284
Moon	US	\N	25464
Ban Plai Bua Phatthana	TH	\N	46274
Linlithgow	GB	\N	19000
Charana	BO	\N	197
Hinckley	GB	\N	45249
Elbridge	US	\N	5761
Buy	RU	\N	23809
Sarandi Grande	UY	\N	6130
Nevada	US	\N	8699
Ozersk	RU	\N	79265
Matara	LK	\N	68244
Berezovskiy	RU	\N	57892
Decines-Charpieu	FR	\N	28602
Ludlow	US	\N	21336
Lyndon	US	\N	11423
El Harhoura	MA	\N	15361
Rawtenstall	GB	\N	22000
Remanso	BR	\N	37945
Hartley	GB	\N	5359
Sao Luis do Paraitinga	BR	\N	10731
Langford Station	CA	\N	35342
Jaszfenyszaru	HU	\N	5757
Ishimbay	RU	\N	65422
Muhlenberg	US	\N	20123
Aflao	GH	\N	66546
Mikhalkino	RU	\N	570
Zerbst	DE	\N	21657
Derry Township	US	\N	25036
Calumet City	US	\N	35913
Chehalis	US	\N	7654
Neath	GB	\N	19258
Oildale	US	\N	34723
Gulariya	NP	\N	55747
Pembroke Dock	GB	\N	9753
Al Qusayr	EG	\N	24344
Amite City	US	\N	6600
Fallon	US	\N	16313
Hornsey	GB	\N	12659
Orosi	US	\N	7441
Malchin	DE	\N	7403
Greene	US	\N	5230
Bayshore Gardens	US	\N	20293
Upper Hanover	US	\N	7483
Hanford	US	\N	94028
Moapa Valley	US	\N	6843
Patos	BR	\N	92575
Norton	US	\N	19634
Wainwright	CA	\N	6270
Glasgow	US	\N	14342
Ban Sam Khwai Phueak	TH	\N	10837
Deerfield	US	\N	18646
Bulungu	CD	\N	48344
Maywood	US	\N	26973
Izberbash	RU	\N	58690
Mountain Ash	GB	\N	7374
Chaykovskiy	RU	\N	83077
Mitsamiouli	KM	\N	7235
Winton	US	\N	11761
Spreitenbach	CH	\N	11788
Qorday	KZ	\N	27443
Erftstadt	DE	\N	49801
Milton	US	\N	39587
Vohburg an der Donau	DE	\N	8312
Calverton	US	\N	18076
Omboue	GA	\N	1667
Chili	US	\N	28568
Giyon	ET	\N	114534
Miles City	US	\N	9436
Plast	RU	\N	17508
Corsicana	US	\N	22728
Markala	ML	\N	53738
Bentonville	US	\N	54909
Calipatria	US	\N	7114
Mango	US	\N	11228
Potcoava	RO	\N	5743
Rutherford	AU	\N	11884
I-n-Amenas	DZ	\N	216
Miyake-naka	JP	\N	6604
Yalutorovsk	RU	\N	39967
Hadley	US	\N	5310
Solihull	GB	\N	123187
Green River	US	\N	11906
Lloyd	US	\N	10515
Casa Grande	US	\N	61966
Valley Stream	US	\N	37431
Budelsdorf	DE	\N	10297
Buckley	US	\N	5058
Morgan City	US	\N	27728
Tullahoma	US	\N	18082
Torpoint	GB	\N	8364
Upper Grand Lagoon	US	\N	17045
Russell	CA	\N	16520
Tickhill	GB	\N	5228
Flin Flon	CA	\N	5185
Weisenberg	US	\N	5140
Aracariguama	BR	\N	20114
Woodlawn	US	\N	38951
Leigh-on-Sea	GB	\N	22509
Conway	US	\N	74951
Gleneagle	US	\N	6936
Oakland Park	US	\N	45202
Bierutow	PL	\N	5065
Marks	RU	\N	31488
Sorsk	RU	\N	11416
Mangalagiri	IN	\N	73613
Mendig	DE	\N	8895
Tifton	US	\N	24466
Sugarmill Woods	US	\N	8851
Neustrelitz	DE	\N	20140
Pahokee	US	\N	8025
Butler Township	US	\N	9668
Herdecke	DE	\N	22733
Gates	US	\N	28476
Angra do Heroismo	PT	\N	35402
Haigerloch	DE	\N	10669
Loyalsock	US	\N	11048
Ar Rahmaniyah	EG	\N	29393
La Carlota	PH	\N	64469
Vicam Pueblo	MX	\N	8578
Pulaski	US	\N	15407
Baesweiler	DE	\N	27033
Paramount	US	\N	53955
Meyrin	CH	\N	24144
Haan	DE	\N	30484
Yenakiieve	UA	\N	79348
Lessines	BE	\N	18552
Launceston	GB	\N	9216
Langenlois	AT	\N	7609
Le Plessis-Trevise	FR	\N	20130
Baywood	US	\N	7389
Gehrden	DE	\N	14864
Weissenhorn	DE	\N	13442
Hounslow	GB	\N	103337
Tadpatri	IN	\N	108171
Iqaluit	CA	\N	7740
Oxkutzkab	MX	\N	23096
Lake Alfred	US	\N	6257
Horwich	GB	\N	20067
Rymarov	CZ	\N	8181
Itaituba	BR	\N	92308
Cambridge	GB	\N	66
Magalia	US	\N	12671
Buluko	CD	\N	1192
Estelle	US	\N	17099
Miyazu	JP	\N	17044
Washington	GB	\N	67085
Crawley	GB	\N	106597
Karatepe	TR	\N	118066
North Greenbush	US	\N	12158
Rayevskiy	RU	\N	20060
Azle	US	\N	13351
Amityville	US	\N	9399
Schuylkill	US	\N	8639
Saint-Cloud	FR	\N	29973
Slavgorod	RU	\N	29916
Thrapston	GB	\N	6239
Medina	US	\N	25956
Ichenhausen	DE	\N	9148
Belper	GB	\N	21822
Iaras	BR	\N	7970
Momchilgrad	BG	\N	19609
Novoulyanovsk	RU	\N	13990
Norton Canes	GB	\N	7479
Dunmore	US	\N	12954
Edna	US	\N	5648
Lindsay	US	\N	16713
Orchha	IN	\N	11511
Ceska Lipa	CZ	\N	37525
Chui	BR	\N	5917
Heitersheim	DE	\N	6257
Opelika	US	\N	30908
Tannum Sands	AU	\N	5145
Sefrou	MA	\N	79887
Ovenden	GB	\N	12351
Korntal-Munchingen	DE	\N	19679
Fort Carson	US	\N	15410
Bremerhaven	DE	\N	113634
Yarrawonga	AU	\N	7930
La Magdalena Chichicaspa	MX	\N	12193
Cosmopolis	BR	\N	66807
Reserve	US	\N	9280
Policka	CZ	\N	8813
Sokol	RU	\N	36924
Takahama	JP	\N	48561
Royston	GB	\N	15781
Tabor	CZ	\N	34277
Zefyri	GR	\N	9454
Evergreen	US	\N	8602
Cavite City	PH	\N	102806
Barra do Chapeu	BR	\N	5585
Taiki	JP	\N	5527
Sarubetsu	JP	\N	26637
Kirillov	RU	\N	7468
Neuilly-Plaisance	FR	\N	21150
Gogolin	PL	\N	6116
Waldkirchen	DE	\N	10534
Southwater	GB	\N	10025
Ulysses	US	\N	5711
Dromana	AU	\N	5803
Landsberg	DE	\N	29132
Buzuluk	RU	\N	86316
Air Force Academy	US	\N	6633
Calafat	RO	\N	17336
Kasangulu	CD	\N	27961
Hatch End	GB	\N	10693
Peqin	AL	\N	6353
Netphen	DE	\N	23130
Pyle	GB	\N	7405
Firthcliffe	US	\N	5178
North Valley	US	\N	12242
Belabo	CM	\N	22553
Villanueva de la Serena	ES	\N	25667
Santo Antonio do Jardim	BR	\N	6053
Riga	US	\N	5615
Ita	JP	\N	8598
Ditzingen	DE	\N	24883
Soligalich	RU	\N	5998
Hewitt	US	\N	14937
Tinley Park	US	\N	55773
Eldikan	RU	\N	1516
Bradley	US	\N	15314
Gedern	DE	\N	7342
Tasquillo	MX	\N	15429
Zverevo	RU	\N	19456
Manono	CD	\N	46111
Queens	CA	\N	10307
Cravinhos	BR	\N	34110
Hexham	GB	\N	11829
Oktyabrskiy	RU	\N	67386
Thomson	US	\N	8225
Hamlin	US	\N	9023
Curanilahue	CL	\N	30611
Tabuk	PH	\N	110642
Ak-Dovurak	RU	\N	13580
Niagara-on-the-Lake	CA	\N	17511
Parkstone	GB	\N	10779
Dondo	MZ	\N	78648
Namegata	JP	\N	32604
Upper Makefield	US	\N	8357
Sanmu	JP	\N	49300
Ballwin	US	\N	30082
Fernley	US	\N	21045
Kilsyth	GB	\N	9860
Salisbury	GB	\N	40302
Duruma	SA	\N	11461
Sao Mateus	BR	\N	77117
Blatna	CZ	\N	6573
Sugar Land	US	\N	118488
Rixensart	BE	\N	22401
Elk Plain	US	\N	14065
Lucas	US	\N	8553
Keswick	GB	\N	5243
Lee	US	\N	6441
Orlov	RU	\N	6607
White Rock	CA	\N	82368
Nanaimo	CA	\N	90504
Rowland Heights	US	\N	50602
Wickliffe	US	\N	12744
Ovidiu	RO	\N	13847
Saint-Apollinaire	CA	\N	6110
Andreapol	RU	\N	7079
Zavolzhye	RU	\N	38230
Bismark	DE	\N	8256
Temple	US	\N	107258
Losino-Petrovskiy	RU	\N	25424
Pacific	US	\N	10661
Sarmasu	RO	\N	6942
Buxton	US	\N	8202
Allen	US	\N	105623
Bonita	US	\N	13324
Fair Oaks	US	\N	33700
Romhild	DE	\N	6869
Tadepalle	IN	\N	64149
Billericay	GB	\N	27998
Helensburgh	AU	\N	6383
Walnut Ridge	US	\N	6568
Staryy Krym	UA	\N	9370
Fleming Island	US	\N	28531
Wallkill	US	\N	28622
Pepperell	US	\N	12083
Nepalganj	NP	\N	72503
Kavalerovo	RU	\N	18657
Brick	US	\N	75072
Wolgast	DE	\N	12028
Hamanaka-sakuraminami	JP	\N	5789
Baglung	NP	\N	23296
Serra Negra	BR	\N	28321
Dublin	US	\N	64826
Braunstone	GB	\N	16850
West Freehold	US	\N	13759
Hanover	US	\N	68165
Milton	CA	\N	110128
Sleepy Hollow	US	\N	10046
Lynnfield	US	\N	12847
Chanceford	US	\N	6166
Wunstorf	DE	\N	41594
Desnogorsk	RU	\N	27771
Arqalyq	KZ	\N	28169
Dvur Kralove nad Labem	CZ	\N	15550
Westmount	CA	\N	19931
Mushie	CD	\N	33062
Bithlo	US	\N	9457
Rudna	CZ	\N	5153
Youngsville	US	\N	14704
Gotse Delchev	BG	\N	21969
Kawaii	JP	\N	14582
Mezdra	BG	\N	11719
Gbely	SK	\N	5155
Springville	US	\N	33310
Sretensk	RU	\N	6581
Uherske Hradiste	CZ	\N	25247
Massapequa Park	US	\N	17143
Grossschonau	DE	\N	5465
Ofaqim	IL	\N	27771
Bednodem'yanovsk	RU	\N	7106
Stafford	US	\N	27073
Broadview Park	US	\N	8068
Crewkerne	GB	\N	7000
Carney	US	\N	29743
Arroyo de la Luz	ES	\N	5811
Lower Merion	US	\N	58735
Mikulov	CZ	\N	7455
Schwarzenberg	DE	\N	16723
Justice	US	\N	12608
Southwick	GB	\N	13195
Or `Aqiva	IL	\N	17759
Alfajayucan	MX	\N	16859
Conklin	US	\N	5232
Dingman	US	\N	11674
Mission	CA	\N	38833
Barri	GB	\N	51502
Sandhurst	GB	\N	20803
Livny	RU	\N	47221
Horsell	GB	\N	9384
Sibolga	ID	\N	94971
Codsall	GB	\N	7582
Cloncurry	AU	\N	2719
Wipperfurth	DE	\N	21003
Leutkirch im Allgau	DE	\N	22803
The Villages	US	\N	77609
East End	US	\N	7019
Minnetonka	US	\N	54064
Brighton	US	\N	41554
Lynbrook	US	\N	19448
Ellisville	US	\N	9862
Vsevolozhsk	RU	\N	72864
Lake Arrowhead	US	\N	9765
Kapiri Mposhi	ZM	\N	37942
Barcaldine	AU	\N	1422
Edwards	US	\N	10071
Pine Lake Park	US	\N	8811
Qaanaaq	GL	\N	678
Edea	CM	\N	122300
Hope	US	\N	9499
Jablonec nad Nisou	CZ	\N	45773
Druid Hills	US	\N	8244
Loveland	US	\N	78877
Tecumseh	US	\N	8398
Stephenville	US	\N	20841
East Moriches	US	\N	5359
Beekmantown	US	\N	5486
Quakenbruck	DE	\N	13500
Fort Mitchell	US	\N	8241
Riedlingen	DE	\N	10528
Parepare	ID	\N	129542
Saltinho	BR	\N	7818
Sudova Vyshnya	UA	\N	6538
Menton	FR	\N	28958
Beerwah	AU	\N	6769
Wyke	GB	\N	14950
Abertillery	GB	\N	11601
Tara	RU	\N	28099
Kipili	TZ	\N	1533
Writtle	GB	\N	5383
Hazel Grove	GB	\N	15265
Embu-Guacu	BR	\N	67296
Bad Duben	DE	\N	7865
Cohasset	US	\N	8449
Cutler Bay	US	\N	43718
Berkhampstead	GB	\N	18500
Konarka	IN	\N	15015
Cherry Hill	US	\N	70859
Jaromer	CZ	\N	12378
Falkirk	GB	\N	35168
Hyde Park	US	\N	21040
Papillion	US	\N	20471
Bishop	US	\N	9597
Dupnitsa	BG	\N	39467
Rhome	US	\N	6387
Yendi	GH	\N	42972
Villa O'Higgins	CL	\N	250
Quipungo	AO	\N	186
Sankt Georgen im Schwarzwald	DE	\N	12958
Higashine	JP	\N	47920
Pencoed	GB	\N	9166
Pewaukee	US	\N	14631
Garnet	US	\N	5057
Salina	US	\N	46340
Bedminster	US	\N	8112
Romans-sur-Isere	FR	\N	33160
Etowah	US	\N	7420
Penetanguishene	CA	\N	8962
Guajara-Mirim	BR	\N	69586
Kdyne	CZ	\N	5183
Naila	DE	\N	7684
Nasukarasuyama	JP	\N	25144
Yelabuga	RU	\N	74031
Mount Joy	US	\N	8278
Bargteheide	DE	\N	16109
Rockland	US	\N	17909
Wethersfield	US	\N	26267
Sorochinsk	RU	\N	27547
Eidsvold	AU	\N	574
Nahiyat al Karmah	IQ	\N	95000
Wooburn	GB	\N	10792
Holesov	CZ	\N	11579
North Richland Hills	US	\N	70670
Ramona	US	\N	20260
Yokotemachi	JP	\N	86499
Swan Hill	AU	\N	11103
Jensen Beach	US	\N	13477
Balqash	KZ	\N	78002
Khoshk Bijar	IR	\N	7478
Vinto	BO	\N	14180
Tuakau	NZ	\N	5090
Ingersoll	CA	\N	12757
Chinnor	GB	\N	5924
Igarata	BR	\N	9349
Edmond	US	\N	94054
Prostejov	CZ	\N	43651
Woolton	GB	\N	12921
Pointe-Claire	CA	\N	31380
Gerolzhofen	DE	\N	6889
Seacroft	GB	\N	14246
Woodmere	US	\N	17467
Muncie	US	\N	87879
Frontera	AR	\N	10520
Chelan	US	\N	6212
Allegany	US	\N	7663
Villa Ygatimi	PY	\N	2809
Ione	US	\N	8462
Munnerstadt	DE	\N	7606
Janesville	US	\N	70755
Syke	DE	\N	24355
Point Vernon	AU	\N	5699
Summerville	US	\N	52549
Quincy	US	\N	94470
Kendall West	US	\N	39491
Blaenavon	GB	\N	6055
Inkster	US	\N	24284
Bradwell	GB	\N	9657
Clive	US	\N	17242
Steelton	US	\N	5962
Liman	AZ	\N	8661
Sayo	JP	\N	15958
Barrowford	GB	\N	6171
Galloway	US	\N	36437
Carei	RO	\N	21112
Matthews	US	\N	33138
Brown Deer	US	\N	11839
Simpsonville	US	\N	24221
Claremont	US	\N	36266
Castrop-Rauxel	DE	\N	73425
Madison Heights	US	\N	29886
Nyergesujfalu	HU	\N	7255
Lansdowne	US	\N	12696
Chocen	CZ	\N	8648
Schwaigern	DE	\N	11425
San Jacinto de Buena Fe	EC	\N	38263
Cheremkhovo	RU	\N	50819
Garfield	US	\N	31802
Holysov	CZ	\N	5173
Kenzingen	DE	\N	10089
Muckendorf an der Donau	AT	\N	16197
La Grange Park	US	\N	13178
Freystadt	DE	\N	9013
Conemaugh Township	US	\N	6977
Staraya Kupavna	RU	\N	22476
Mococa	BR	\N	68797
Erin	CA	\N	11439
Boutilimit	MR	\N	14142
Buur Gaabo	SO	\N	3096
Piratininga	BR	\N	13093
Bern	US	\N	6952
Fruita	US	\N	13478
Miyoshi	JP	\N	51049
Goytapa	AZ	\N	10067
Huntington Station	US	\N	33259
Smiths Station	US	\N	5391
Upper Milford	US	\N	7638
Newmarket	GB	\N	16615
West Perrine	US	\N	10491
Lascano	UY	\N	7645
Newton in Makerfield	GB	\N	22114
Colnbrook	GB	\N	6157
Beverly Hills	US	\N	33792
Maplewood	US	\N	40885
Lake Mohawk	US	\N	9208
Moanda	GA	\N	30151
Ballenger Creek	US	\N	19889
Mocuba	MZ	\N	69045
Montrouge	FR	\N	50260
Fountain Valley	US	\N	55357
Lake Geneva	US	\N	15518
Bas-Warneton	BE	\N	18063
Rabaul	PG	\N	7024
Grossbreitenbach	DE	\N	6352
Nyon	CH	\N	20272
Tay Valley	CA	\N	5665
Promissao	BR	\N	38764
Qiryat Ono	IL	\N	37791
Kennedale	US	\N	8645
Delta	US	\N	7918
Littlehampton	GB	\N	27795
Ledyard	US	\N	14850
Bel Air	US	\N	10119
Rubi	ES	\N	77464
Seffner	US	\N	8786
Coulsdon	GB	\N	25695
Bryans Road	US	\N	7325
Kokawa	JP	\N	59208
Eaton Rapids	US	\N	5439
Silvassa	IN	\N	27359
Haledon	US	\N	8293
Santa Cruz	BR	\N	27775
Cross Gates	GB	\N	7770
Port Isabel	US	\N	18686
Viseu	BR	\N	18958
Thibodaux	US	\N	14425
Upice	CZ	\N	5639
Tubarjal	SA	\N	48525
Sangeorz-Bai	RO	\N	9679
Pompey	US	\N	7294
Sutton Coldfield	GB	\N	95107
Galliano	US	\N	7131
Itobi	BR	\N	7831
Vetluga	RU	\N	8455
Nurtingen	DE	\N	41093
Fort Belvoir	US	\N	8091
Poinciana	US	\N	67169
Palmetto Bay	US	\N	24523
River Edge	US	\N	11435
Ceres	US	\N	48706
Old Town	US	\N	7431
Sand Springs	US	\N	19905
Friesoythe	DE	\N	22456
Sosnovyy Bor	RU	\N	68013
Spangenberg	DE	\N	6183
Skidal'	BY	\N	10300
Goffstown	US	\N	18062
Nobeoka	JP	\N	119309
Kravare	CZ	\N	6717
Pikeville	US	\N	7531
Ripon	US	\N	16386
Insuratei	RO	\N	6528
Hanover Township	US	\N	11451
Prichard	US	\N	21428
Attleboro	US	\N	45237
Atherton	US	\N	7137
Santa Isabel	PR	\N	6196
Gubkinskiy	RU	\N	27238
Nishiwaki	JP	\N	39147
Haddington	GB	\N	9944
Cutral-Co	AR	\N	35465
Gibsonton	US	\N	17873
Mont-Royal	CA	\N	19503
Rio Negro	BR	\N	65597
Inuma	JP	\N	44977
Allschwil	CH	\N	21150
Leiston	GB	\N	5508
I-n-Salah	DZ	\N	49223
West Lampeter	US	\N	15849
Save	BJ	\N	31444
Rindge	US	\N	6106
Pittsford	US	\N	29349
Nelson	CA	\N	10664
Central Coast	AU	\N	3026
Treorchy	GB	\N	7681
North Whitehall	US	\N	16187
Alaminos	PH	\N	89708
Velasco Ibarra	EC	\N	35686
Erlenbach am Main	DE	\N	10227
Offutt AFB	US	\N	5074
Torokbalint	HU	\N	13655
Beloyarskiy	RU	\N	19542
Coari	BR	\N	53305
Ifrane	MA	\N	14659
Sauce	UY	\N	6132
Drogheda	IE	\N	40956
Yardville	US	\N	7148
Bockenem	DE	\N	9795
Glens Falls	US	\N	63499
Boumalne	MA	\N	12328
Arroyo Grande	US	\N	54177
West Livingston	US	\N	8134
Bourne	GB	\N	13961
Cavalero	US	\N	5320
Heathcote	US	\N	6189
Khowrzuq	IR	\N	20301
Fort-Shevchenko	KZ	\N	5213
Basing	GB	\N	7232
Harwich	GB	\N	17684
Folcroft	US	\N	6632
Stuart	US	\N	16237
Robstown	US	\N	11755
Selby	GB	\N	14731
Paris	US	\N	26010
Lomnice nad Popelkou	CZ	\N	5554
Bulverde	US	\N	5300
Whitburn	GB	\N	10527
Worcester	GB	\N	101328
Mikasa	JP	\N	8366
Wapakoneta	US	\N	10500
Creil	FR	\N	35657
Flixton	GB	\N	10786
Bourne End	GB	\N	5320
Attnang-Puchheim	AT	\N	8944
Biloxi	US	\N	46212
Boyarka	UA	\N	35411
Dingle	GB	\N	13246
Sandy Springs	US	\N	109452
Loughton	GB	\N	31106
Aznakayevo	RU	\N	34896
Solvay	US	\N	6234
Gaoua	BF	\N	28023
Sovetsk	RU	\N	40486
Jeffersonville	US	\N	48126
Euless	US	\N	57197
Vilhena	BR	\N	63231
Vamospercs	HU	\N	5362
Mackay	AU	\N	80148
Tual	ID	\N	82955
Arys	KZ	\N	40707
Pozi	TW	\N	50000
Mioveni	RO	\N	31998
Nova Europa	BR	\N	10439
Nichicun	CN	\N	100
Zemio	CF	\N	20000
University	US	\N	46359
Udachnyy	RU	\N	11676
Formosa	BR	\N	81232
New River	US	\N	15808
Shisui	JP	\N	20470
Manosque	FR	\N	22333
Hidaka	JP	\N	55241
Seto	JP	\N	127653
Gig Harbor	US	\N	10717
Parkersburg	US	\N	62566
Liptovsky Hradok	SK	\N	7528
Salaverry	PE	\N	10066
Runnemede	US	\N	8300
Grants	US	\N	11833
Marrero	US	\N	32088
Frankstown	US	\N	7356
Hermitage	US	\N	15471
Ictar Budinti	RO	\N	8336
Newquay	GB	\N	20342
Northlake	US	\N	12161
Cranston	US	\N	81456
La Follette	US	\N	18884
Kiryas Joel	US	\N	26813
Chinde	MZ	\N	16500
Itariri	BR	\N	16759
Kuybyshev	RU	\N	44170
Castillos	UY	\N	7541
Linnich	DE	\N	12593
Evensk	RU	\N	2024
Olivenza	ES	\N	11963
Winterset	US	\N	5231
New Hanover	US	\N	12637
Lehigh Township	US	\N	10432
Ironton	US	\N	10532
Thompsonville	US	\N	8439
Bansang	GM	\N	7615
North Hykeham	GB	\N	13884
Asbury	US	\N	5747
Lo Miranda	CL	\N	9000
Spiez	CH	\N	12810
Principe da Beira	BR	\N	956
Usti nad Orlici	CZ	\N	14280
Furstenwalde	DE	\N	31941
Les Iles-de-la-Madeleine	CA	\N	12010
Cimarron Hills	US	\N	18285
Wilna	US	\N	6156
Rosaryville	US	\N	10705
Fleetwood	GB	\N	25939
North Saanich	CA	\N	11249
Bourgoin-Jallieu	FR	\N	28387
Ngara	TZ	\N	16890
Mercedes	US	\N	16604
Calexico	US	\N	39825
Fillmore	US	\N	15954
Queenstown	AU	\N	1790
Veseli nad Luznici	CZ	\N	6361
Cajobi	BR	\N	10341
Hatfield	GB	\N	39201
Morrisville	US	\N	28846
Brownsburg	CA	\N	7122
Ad Dab`ah	EG	\N	14212
Lakeside	US	\N	30890
Sainte-Marthe-sur-le-Lac	CA	\N	18074
Helston	GB	\N	11178
Rock Hill	US	\N	119105
Ecija	ES	\N	39873
Mont Belvieu	US	\N	6574
Freeland	US	\N	7125
Duartina	BR	\N	12567
Shirebrook	GB	\N	13300
Hiawatha	US	\N	7420
Round Lake	US	\N	18100
Poland	US	\N	5552
Gaggenau	DE	\N	29777
Pajaros	PR	\N	9554
Oskaloosa	US	\N	12592
Florin	US	\N	49132
North Lauderdale	US	\N	44262
Chicopee	US	\N	55126
Taquaritinga	BR	\N	56587
Girard	US	\N	9227
Querfurt	DE	\N	10593
Dobruska	CZ	\N	6723
Currumbin	AU	\N	9121
Macclesfield	GB	\N	51482
Pembroke	CA	\N	13882
Elsdorf	DE	\N	21663
Gorodets	RU	\N	30188
Moranbah	AU	\N	8735
Nanakuli	US	\N	11742
Thompson	CA	\N	13678
Chingford	GB	\N	66211
Dankov	RU	\N	19017
Amursk	RU	\N	40106
Bosobolo	CD	\N	14553
Thornbury	GB	\N	12342
Rodental	DE	\N	13107
Dedham	US	\N	25377
Monheim	DE	\N	5093
Hilden	DE	\N	55764
Wujiaqu	CN	\N	96436
Pocklington	GB	\N	8337
Panthersville	US	\N	10581
Leeds	US	\N	12040
Lormont	FR	\N	23538
Villa Dominico	AR	\N	62315
Navarre	US	\N	35540
Ciudad Sahagun	MX	\N	28609
Hokitika	NZ	\N	3090
Montevallo	US	\N	6738
Zakamensk	RU	\N	11164
Little Lever	GB	\N	12803
Homberg	DE	\N	7400
Magdagachi	RU	\N	11739
Uwajima	JP	\N	71586
Harrodsburg	US	\N	8916
Theodore	US	\N	6483
Belvedere Park	US	\N	15543
Aguai	BR	\N	34863
Sharunah	EG	\N	22221
Lesnoy	RU	\N	49056
Barra do Garcas	BR	\N	52398
Market Drayton	GB	\N	11773
Suolahti	FI	\N	5747
Ban Tha Kham	TH	\N	19939
Marietta	US	\N	60867
Blooming Grove	US	\N	17619
Bullhead City	US	\N	50309
Tokmok	KG	\N	53231
Gobo	JP	\N	23246
Gersfeld	DE	\N	5458
Dubi	CZ	\N	7876
Southeast	US	\N	18218
Swampscott	US	\N	14755
Elzach	DE	\N	7242
Itarare	BR	\N	50105
Edwardsville	US	\N	25233
Jeanerette	US	\N	6303
Swanage	GB	\N	9601
Castaic	US	\N	18921
Cumberland	US	\N	47980
Darlington	GB	\N	105564
Tsushima	JP	\N	61732
Mullica	US	\N	5987
Gersthofen	DE	\N	22473
Otaci	MD	\N	6043
Fruitville	US	\N	13780
Hollins	US	\N	14257
Lemmon Valley	US	\N	5469
Lipki	RU	\N	8541
Schaghticoke	US	\N	7604
Halac	TM	\N	5101
Cornwall	US	\N	12442
Chiromo	MW	\N	25235
Melrose Park	US	\N	24703
Lantana	US	\N	12581
Torbay	CA	\N	7899
Elektrogorsk	RU	\N	22950
Tay	CA	\N	10033
North Babylon	US	\N	16739
Gillette	US	\N	36032
Castle Shannon	US	\N	8216
Kyneton	AU	\N	6951
Burketown	AU	\N	238
Elgin	US	\N	110849
Beauport	CA	\N	7281
Bafwasende	CD	\N	149
Myshkin	RU	\N	5647
Southampton Township	US	\N	8495
Mercier	CA	\N	13115
Kingsnorth	GB	\N	11243
Phalaborwa	ZA	\N	13108
Bugulma	RU	\N	86085
Namaacha	MZ	\N	29272
Palos Verdes Estates	US	\N	13273
Al Qusiyah	EG	\N	69388
Hurth	DE	\N	60189
Menlo Park	US	\N	34698
West Point	US	\N	10957
Aleksandrovsk	RU	\N	12222
Wriezen	DE	\N	7254
Freilassing	DE	\N	16939
Mansfield Center	US	\N	7892
Brier	US	\N	6970
Simsbury Center	US	\N	6091
Oconomowoc	US	\N	16981
Lydiate	GB	\N	6308
Foumban	CM	\N	92673
Ouroeste	BR	\N	9564
Lethbridge	CA	\N	92729
Djanet	DZ	\N	14655
Mandapeta	IN	\N	56063
Sankt Ingbert	DE	\N	35714
Marblehead	US	\N	20488
Teterow	DE	\N	8470
Ban Ton Pao	TH	\N	15175
Oswaldtwistle	GB	\N	11803
Saint-Pie	CA	\N	5438
Qulsary	KZ	\N	37103
Excelsior Springs	US	\N	11581
Wurselen	DE	\N	38712
Laplace	US	\N	29147
West Des Moines	US	\N	67899
Ilkeston	GB	\N	38640
Alberton	ZA	\N	121536
Trois-Rivieres	CA	\N	134413
Glazov	RU	\N	93056
Forsyth	US	\N	7761
Middlesborough	US	\N	13475
Kenilworth	GB	\N	22413
Newington	US	\N	30323
Wenatchee	US	\N	72350
Urraween	AU	\N	6969
Tafalla	ES	\N	10595
Kottagudem	IN	\N	79819
Londonderry	US	\N	25529
Pavlovskiy Posad	RU	\N	65432
Jonesboro	US	\N	76247
East Lyme	US	\N	18766
Knysna	ZA	\N	51078
Sun Village	US	\N	13516
Hamilton	GB	\N	54230
Kitamoto	JP	\N	65478
Paraibuna	BR	\N	18125
Orlandia	BR	\N	42678
Little Silver	US	\N	5782
Thame	GB	\N	11561
Rushville	US	\N	6383
Nether Providence	US	\N	13754
Bois-des-Filion	CA	\N	9485
La Paloma	UY	\N	3230
Yuzhne	UA	\N	32100
Biel/Bienne	CH	\N	54456
Ravenna	US	\N	11361
Mount Rainier	US	\N	8093
Wyndham	US	\N	10151
Guelph	CA	\N	131794
Coral Hills	US	\N	9460
Wallington	US	\N	11495
Gainsborough	GB	\N	22841
Sidney	US	\N	21148
Kelso	GB	\N	5639
Royal Oak	US	\N	59277
Leonia	US	\N	9035
Zanesville	US	\N	41589
Montebello	US	\N	61954
Kasimov	RU	\N	30243
Whitianga	NZ	\N	5130
Haiku-Pauwela	US	\N	8061
Scornicesti	RO	\N	11766
Grandwood Park	US	\N	5261
Ourinhos	BR	\N	110282
Florence	US	\N	93131
New Kingman-Butler	US	\N	13471
Royal Leamington Spa	GB	\N	49662
Kraslice	CZ	\N	6767
Horizon City	US	\N	19642
Halawa	US	\N	14640
Santo Antonio do Pinhal	BR	\N	6767
Maltby	GB	\N	16688
Swellendam	ZA	\N	17537
Brant	CA	\N	36707
Qiziltepa	UZ	\N	9884
Sugarland Run	US	\N	12576
Butte	US	\N	30904
Rice Lake	US	\N	9586
Sylacauga	US	\N	16982
Lake Elsinore	US	\N	69283
Imizucho	JP	\N	90877
Cadillac	US	\N	11850
Woodburn	US	\N	35941
Glens Falls North	US	\N	8807
Luan Chau	VN	\N	7335
Cootamundra	AU	\N	6782
Niepolomice	PL	\N	12000
Red Bluff	US	\N	19039
Coos Bay	US	\N	32159
Arden-Arcade	US	\N	100548
Redcliff	CA	\N	5600
Santa Vitoria do Palmar	BR	\N	27775
North Battleford	CA	\N	13888
Denair	US	\N	5131
Whitehaven	GB	\N	23986
LaSalle	US	\N	8986
Show Low	US	\N	11173
Boxley	GB	\N	9554
Bathurst	CA	\N	18154
Herentals	BE	\N	28272
White Bear Lake	US	\N	25875
Jose Pedro Varela	UY	\N	5118
Cleckheaton	GB	\N	16622
Saint-Zotique	CA	\N	6773
Staufenberg	DE	\N	8423
Yorii	JP	\N	32576
Rockton	US	\N	7441
Immenhausen	DE	\N	7068
Jilemnice	CZ	\N	5401
Rolling Meadows	US	\N	23532
Ville Platte	US	\N	8829
Hays	US	\N	21421
Johnstone	GB	\N	16625
Waite Park	US	\N	7768
Centralia	US	\N	42922
Failsworth	GB	\N	20680
Ashville	US	\N	6658
Possneck	DE	\N	11924
Ramara	CA	\N	9488
Southern Cross	AU	\N	680
Markdorf	DE	\N	14031
Stare Mesto	CZ	\N	6661
Porters Neck	US	\N	7802
Fresia	CL	\N	7328
Tatebayashi	JP	\N	74520
Teeli	RU	\N	3732
La Baneza	ES	\N	10338
Besigheim	DE	\N	12627
Wheathampstead	GB	\N	6410
Upper Saddle River	US	\N	8205
Huntersville	US	\N	58098
North Tidworth	GB	\N	10621
Greenbrier	US	\N	6852
Blaxland	AU	\N	7451
Gagarin	RU	\N	29041
Muhanga	RW	\N	49038
Cold Spring	US	\N	6571
Yermolino	RU	\N	10089
Anderson	US	\N	85992
Zwenkau	DE	\N	9274
Sollom	GB	\N	5350
Bedford Heights	US	\N	10460
Patcham	GB	\N	14277
South Park	US	\N	13363
Sorel-Tracy	CA	\N	41629
Mogocha	RU	\N	13285
East Donegal	US	\N	8257
Murraysville	US	\N	15831
Korogwe	TZ	\N	44000
Navoloki	RU	\N	9374
East Marlborough	US	\N	7326
Puttlingen	DE	\N	18510
Imagane	JP	\N	5218
Hashima	JP	\N	66573
Plain City	US	\N	7669
Nidadavole	IN	\N	43809
Bexbach	DE	\N	17577
East Hempfield	US	\N	24329
Colville	US	\N	5135
Roseira	BR	\N	10344
Haysville	US	\N	11338
Sawley	GB	\N	6629
West Drayton	GB	\N	14370
Poulton le Fylde	GB	\N	18495
Topanga	US	\N	7449
Tupiza	BO	\N	23100
Shanklin	GB	\N	9072
Brentwood	GB	\N	54885
East Ridge	US	\N	21182
Sweetwater	US	\N	20994
Wrentham	US	\N	11734
Laraquete	CL	\N	5014
South Monrovia Island	US	\N	7192
Mayumba	GA	\N	3996
Bucovice	CZ	\N	6493
Folsom	US	\N	81328
Yoshikawa	JP	\N	71763
Otterndorf	DE	\N	7238
Rurrenabaque	BO	\N	11749
Lukulu	ZM	\N	3349
Marksville	US	\N	7036
Batuco	CL	\N	16784
Miramichi	CA	\N	17537
Boldesti-Scaeni	RO	\N	11137
New Albany	US	\N	36843
Chapulhuacan	MX	\N	20577
Bom Jesus dos Perdoes	BR	\N	23025
Hohenau	PY	\N	5306
Snezhinsk	RU	\N	51048
Amelia	IT	\N	11828
Silveiras	BR	\N	6158
Middlesex Centre	CA	\N	17262
Kerekegyhaza	HU	\N	6509
Colusa	US	\N	6891
Dos Palos	US	\N	7494
Kurort Steinbach-Hallenberg	DE	\N	9681
Bedwas	GB	\N	8512
Preston	GB	\N	122719
Healesville	AU	\N	7461
Dudinka	RU	\N	21015
Carrollwood	US	\N	35095
Farmington Hills	US	\N	80612
Ikoma	JP	\N	116816
\.


--
-- Data for Name: connections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.connections (from_code, to_code) FROM stdin;
DOH	PEK
DEN	LGA
SLP	TIJ
OKC	STL
ALC	FCO
EGC	STN
ACE	BHX
MEX	YVR
IST	NIM
OPO	FRA
STR	BIA
JAX	BWI
NTE	NAP
MCO	MDT
CUN	TLC
CAN	SVO
BDL	DEN
FUK	KIX
KTW	FRA
GNV	ATL
OTP	CRL
BOS	MYR
BOM	KHI
MUC	KGS
RAK	AMS
PSA	OTP
ICN	SHE
GDL	PTY
JED	MHD
PVU	OAK
MDW	PHL
PEK	URC
LCE	PEU
IPH	SIN
KJA	OSS
BNE	HIR
SHE	XMN
PEK	DAX
MAN	FAO
BCN	EDI
TSR	BGY
JED	TUN
GYE	CUE
CIA	POZ
SYX	CKG
HLZ	AKL
DUR	CPT
AEP	ASU
CIA	EDI
LGA	MSP
BFL	LAX
EDI	BUD
BCN	BRS
ZAD	PUY
NBO	HRE
DTM	ADB
PTY	GDL
ISB	UET
YHZ	CUN
BUD	LIS
BOG	CDG
TTN	MDW
DXB	ATH
LIM	MIA
NCU	VKO
LIS	EDI
HOU	TPA
FRU	EGO
PHX	PVR
RAO	CWB
WNZ	WUH
ARN	OER
ZRH	AGP
CRL	DUB
LTN	ABZ
CCU	KMG
CLT	FAY
TUF	MRS
JNB	BLZ
FNT	MSP
SSG	CMN
TAS	FCO
DRK	SJO
WUH	BAV
BRI	AMS
PEW	RUH
MEX	CUL
CIF	HET
AEP	FLN
DUB	SVQ
SOU	EDI
ZNZ	MBA
AAL	SVG
GRR	DTW
DCA	CMH
GVA	JFK
ELP	DAL
SIN	VTE
TAS	DXB
DLC	FUK
DEL	IST
AMM	CAI
JAX	CLT
PEK	BRU
MSN	ORD
BVA	TSR
DXB	VOG
STL	LAS
YUL	YYZ
VIE	FNC
DOH	CAN
SYX	TSN
PEK	YNZ
TUL	IAD
PTY	GRU
BGY	ARW
CPH	LIN
VCE	BCN
YIW	CTU
ORD	SJO
MCT	RUH
DTW	AVP
PHL	SAN
CMB	CDG
AMS	PFO
MSP	AUS
ZHA	KMG
ADD	PEK
LCA	SKG
CCJ	BOM
IST	FIH
KRR	DXB
DUB	CDG
LHR	MAN
HKG	YVR
LIT	SFB
DME	FRU
IST	BGW
IKA	BEY
SZX	SHE
KWE	JJN
SYD	CGK
PHL	CLE
SDF	TPA
TYN	TXN
PEK	MWX
DME	ULV
AZA	IDA
SYY	INV
TLM	MRS
ISA	TSV
CGO	NKG
CGH	CWB
LGA	IND
CWB	FLN
NBO	BRU
ACE	EIN
BGM	PHL
KCM	ESB
FCO	CAG
LGW	BOD
BGW	ARN
OPO	LGW
YIW	CAN
OUA	ABJ
IBZ	LBA
CMN	DKR
TRD	TOS
SJU	MIA
BRU	TUN
HLH	SHE
BGF	NSI
DXB	SGN
MSP	SAT
FCO	LOS
MUC	RTM
MSY	CVG
HRB	CIF
HOU	PVD
GRR	TPA
YQK	YWG
MDW	MEM
LGA	ILM
BSB	EZE
CLE	LAS
SAW	GNY
TAO	PUS
BBK	JNB
KSD	ALC
BGO	JFK
PWE	VKO
CDG	HEL
GRU	BEL
SNA	MSP
HET	URC
FLR	BOD
DEN	HOU
BDB	BNE
WUH	TYN
MIA	CCS
SVO	BCN
LUK	MMU
LHR	ATL
OLB	BRN
EWR	YHZ
SEA	MFR
DEN	ASE
SJO	DRK
BGY	BRI
STI	FLL
CPH	GDN
LOS	NBO
BZN	SEA
BZV	NBO
DXB	ROV
YYC	PSP
BOG	MIA
PHX	BUF
ZRH	CPH
DTW	IAH
SYR	CLE
ARN	PRG
SZX	NAO
CUN	YUL
AUH	RUH
ECN	GZT
LAS	XNA
BRU	FAO
AXM	BOG
CRL	BTS
ZRH	LCA
OSL	EDI
AMS	GVA
PVG	SYX
NCE	LHR
HAJ	VCE
TVY	MGZ
EBL	IKA
DME	AGP
DWC	KUF
SYD	WGA
CAI	VIE
IST	ATH
CCS	EZE
LEI	SVQ
TPA	BOS
OGS	ALB
CAN	BFJ
PDL	FNC
SYX	SHA
KSC	BTS
WUH	AQG
FLL	ALB
GZT	ADB
ATL	SEA
VAR	LTN
SHA	CKG
HEL	LHR
URC	GYD
KUL	CMB
CGK	MLG
EVN	RTW
CKG	TNA
STR	ALC
CAN	SIN
CGN	FCO
LLW	JNB
SVO	DXB
XNN	CTU
SKG	ARN
ISB	BCN
KHV	GDX
ZRH	BCN
PEK	TEN
DOH	PEW
ICN	PRG
ALB	BOS
ACE	LGW
HEL	PRG
IKA	AUH
TIJ	SLP
OSS	DME
AZA	PSC
DKR	BRU
SDQ	BOS
WNZ	CTU
DUB	MAD
YWG	YUL
BEG	IST
LFW	COO
SZX	NNY
CDG	PHL
AMM	HBE
LAD	DXB
LAP	GDL
LIS	PRG
ATL	MAN
BOS	MDT
DOH	ORD
FAO	LGW
GRK	ATL
ORD	TVC
CKG	NAY
PGV	CLT
WUX	CTU
YYZ	BRU
DCA	LAN
MOB	IAH
LST	BNE
TSN	XIY
ALF	HFT
KHH	SZX
SFB	MDT
DEN	MCO
ATL	SMF
URC	AAT
BDL	YUL
DME	YKS
KMG	BSD
PGF	ORY
MSP	CMH
NNG	JJN
WEF	PVG
PBL	MAR
LBV	CDG
FOR	PHB
RTM	SPU
SVX	FCO
SYZ	TBZ
PTY	CDG
BRD	INL
PHF	PHL
SXB	FCO
ATL	GDL
CKG	HDG
UYL	KRT
VIE	ARN
OMR	OTP
LBA	PSA
TXL	AMS
AKL	SCL
MPM	BEW
PVG	SHP
LGW	SKG
BEY	LHR
SEA	PSP
GSP	LGA
BOH	MJV
LAS	OAK
MIG	KWE
TXL	AYT
FMM	DUB
SHA	CAN
CCU	BOM
ADB	MAN
MAD	SSG
AGP	HAU
TUS	PHX
ZRH	CGN
LMT	SFO
AMS	TXL
SAW	KYA
ABV	FRA
SGN	NGO
WUX	SZX
HET	HGH
EYW	MIA
ITM	KCZ
ORD	AMM
LIR	SJO
KHI	KUL
CTU	LZH
BEG	DXB
AUS	SEA
LPB	BOG
HAM	HEL
IST	BRE
IAS	FCO
AYT	HAJ
MDW	JAX
PDX	SBA
ARN	EWR
TOL	ORD
BOM	SXR
LGW	ERF
KMG	LHW
AMM	TUN
DME	LCA
CIA	STN
STL	OMA
ATL	PVD
DEB	EIN
SUB	KUL
MJV	MAN
VOG	DYU
HON	PIR
ATL	CCS
KHI	MUX
PHX	SMF
BRE	IST
OPO	BVA
BLQ	VIE
YBP	SYX
PTY	CUN
VIE	AYT
MBJ	JFK
LAX	IAD
TRD	ARN
HEL	MUC
SGN	MNL
PRG	BGY
HKG	CKG
TUL	DEN
MRS	RBA
SJC	SEA
CDG	AJA
NCE	MAD
TUL	SLC
LHR	MRS
ROT	AKL
HKT	USM
DUB	CRL
ADB	ASR
HKG	BWN
SAW	ADB
CDG	RNS
MVD	GRU
VOZ	VKO
MUC	IBZ
JFK	TPA
LIH	DEN
GRU	RAO
IAD	PHL
BLQ	IST
STI	MIA
ZRH	DUB
ZRH	MUC
SCL	AEP
LAX	DEN
JAX	EWR
LOS	MAD
BRE	TMP
IAH	LIM
OSL	AES
TRD	CPH
MEM	ATL
GRX	MAD
WUH	PEK
KMG	CGO
ECN	ADA
KRL	URC
CTS	FUK
TUN	ABJ
ORD	DEN
MKE	RSW
SFO	BOS
PEK	SYX
IND	PHX
NGO	DTW
FRA	PVG
CHC	IVC
CDG	MSP
LIS	SXF
BDJ	SUB
DXB	LIS
CKG	SHE
AMS	TBS
CPH	EWR
PDX	PHX
CGN	DRS
EDI	SOU
TYN	YCU
LAX	OAK
AMS	SVQ
BLQ	EIN
KEF	BGO
TOS	SVG
CWB	CFC
JNB	ATL
LIG	SOU
AMA	MDW
ADA	VAN
ZRH	LHR
BHM	DCA
JED	SAW
ZRH	ORD
MGA	GUA
JKH	MJT
MWA	STL
GJT	SLC
KHV	NGK
BZE	MIA
PLM	KUL
BLR	VTZ
SFO	YYJ
CLT	OMA
VVC	MVP
LHR	IAD
SNN	KRK
MIA	VKO
ZUH	HYN
FCO	ATH
BZG	STN
FRA	YVR
CAN	YBP
EWR	MBJ
BAV	URC
FCO	RTM
SEA	SLC
CAN	LYI
MDW	BOS
LAX	IST
AGP	OVD
SJJ	CGN
YTS	YSB
ANF	SCL
KOV	DME
MUC	ORD
LGA	YHZ
FOR	SSA
GVA	AMM
CWB	XAP
IXE	BOM
ARN	KSD
VTZ	BLR
ECN	ADB
LAX	BWI
NKG	TPE
LGA	SRQ
RAK	LGW
CLE	LGA
LAS	FLL
LGW	FLR
SLZ	THE
NTE	VCE
CPH	CAI
SFB	HTS
DLC	YNJ
BLR	HYD
ADD	DEL
VLN	PMV
CMN	AGA
LYS	IST
CCS	IAH
SMF	LAX
MNL	TPE
TPA	IND
FLR	CDG
MQM	SAW
OSI	DBV
BGO	TRF
CAI	SVO
GVA	ZRH
PTY	EWR
YQX	YHZ
ATH	BRU
ILG	TPA
PEK	NKG
LSE	ORD
SIN	CHC
TPE	JFK
MEL	HKG
SFO	CLT
CVG	LAX
BRU	DOH
PIE	ELM
LIS	WAW
FRU	DXB
YKM	SEA
DYU	DXB
YVR	SFO
PDX	SNA
MAN	YYZ
PQQ	BNE
CUN	IAH
IAH	ATL
ATL	CDG
CAI	PZU
LUG	ZRH
TSF	EIN
AKL	BKK
AOR	SZB
SEN	GVA
KRK	CDG
PGD	FWA
NYO	AGP
CLT	VPS
DAC	LHR
LTN	BUD
CCS	FNC
DEL	DYU
TIJ	OAX
ABV	CDG
SHA	XIY
BKI	SBW
MAN	ATH
SAN	BOI
CDG	POP
FLL	SFO
BVA	AGP
ARN	TMP
JFK	SAL
CMB	SIN
LAS	PTY
ATL	FAR
VIE	BKK
ATL	GRR
MPM	CPT
SAP	ATL
MAD	PRG
MAD	BLQ
PRG	CGN
KGI	PER
UNG	POM
FAO	STN
AGP	SVO
AHB	RUH
PVG	RMQ
EWR	MCI
CMN	ROB
GET	PER
SLC	IDA
FLN	VCP
POM	HKN
EVN	DME
CDG	WRO
ESB	BGW
DBO	SYD
PEK	SHE
AMS	NWI
ZUH	PEK
EBJ	ABZ
IAH	RIC
SAW	FRA
DUB	BOH
MLE	HKG
BOH	ALC
LAX	MFR
HOU	JAX
ZYI	NKG
TSN	URC
MSY	PHL
CDG	EXT
CMB	JED
ESB	MQM
NGO	HEL
KUL	TWU
MRS	YUL
SAH	ADE
TRF	KTW
MSP	EWR
PEK	NDG
AEP	IRJ
MNL	DXB
AQG	PEK
SDF	DEN
KMG	ZAT
IST	OSL
DUB	OSL
SUB	SIN
CDG	TPE
TPA	TLH
LGW	LAS
MSN	DCA
ATL	SAT
RPR	IDR
LYS	CTA
IAH	PHL
TGG	SZB
SYD	DRW
SXF	GLA
CLT	JFK
PMR	WLG
SAW	MLX
EWR	ATL
PHL	ILM
DEN	MCK
CGN	AGP
BHM	DTW
FLN	XAP
RBA	STN
GVA	BIA
UKB	NGS
HAD	BMA
ZRH	LJU
SEA	CLT
DEL	BRU
HGH	HRB
PHL	MAN
SAW	GZT
FRA	CUN
RUH	SHJ
SOF	ATH
LMT	PDX
GDN	FCO
PEW	CJL
MSP	BZN
ACC	NYI
PVG	ADD
YQR	YYZ
AYT	VIE
EVN	AER
GIB	MAN
BEY	DWC
ABQ	MDW
ORD	BOS
HOU	ABQ
PSA	BRS
RJK	STR
KHV	DYR
MSP	MSN
AYT	EIN
NLA	JNB
PER	CBR
BOS	AUG
ATH	HAM
MCI	PDX
JFK	SYR
BCN	PRG
DEL	COK
CHS	HOU
WUH	BKK
DCA	CHS
CGN	KGS
ABJ	BKO
MCO	HOU
VIX	CNF
MGA	MIA
BEY	SAH
SVO	BEY
PVG	WEF
VKO	YKS
SYD	LAX
NAY	BFJ
BUD	ATH
ARN	CDG
MEL	PHE
ICN	YNT
PVG	DDG
ABA	NSK
SVO	AMS
DUB	ACE
TFF	MAO
MDW	SMF
WRO	PIK
MDT	ORD
MUC	MCT
ROC	CLE
PHX	MCO
CMH	ORD
WUH	KHH
GOQ	XIY
SMF	SEA
NBO	DOH
FNA	ROB
CGK	MNL
SYD	OAG
LGA	SDF
LAS	COS
CTU	TXN
CJC	CPO
CLT	CAE
YVR	MAN
SCL	CJC
BLQ	CTA
STL	UIN
RMQ	NNG
CCU	IXA
VNS	DEL
ECP	HOU
BRU	ARN
KIS	EDL
MCZ	REC
MAD	PMO
SVG	KRK
GDL	SLC
DOH	LHR
PHL	ALB
GZP	SAW
DEL	IDR
TSN	CIH
HRL	SAT
PHX	SNA
SHA	FUG
MCI	HOU
SHE	PEK
HOU	PNS
BZV	FIH
TLS	BIA
PBG	PIE
CCJ	AUH
FAO	TXL
TJM	NOJ
SVX	ROV
MKE	SEA
FLR	PMO
KCH	KUL
GYD	IKA
NTE	TUN
MIA	BCN
BJL	OXB
YUL	LAS
CVG	ATL
AUS	MEX
KER	ZAH
YYZ	FLL
TNA	TYN
BHX	OPO
KUN	KGS
PEW	KBL
GOJ	FRA
ETZ	TLS
CMB	BKK
GAO	HAV
LAX	LIM
HKG	PUS
MAD	BOG
GYN	RAO
NCE	TUN
AMM	EBL
BUF	MDW
AZR	OGX
TBS	DME
EIN	TXL
OSL	MAN
BCN	NAP
BGI	LGW
JIU	PEK
PEK	SVX
ASU	AEP
OVB	HKG
BIA	BES
ANC	SEA
KRK	BFS
SYZ	ZAH
FLR	BRU
AMS	AYT
DTW	TUL
SFO	YUL
FKL	CLE
PEK	WEF
ICN	KIJ
KGI	MEL
LAX	ICT
TXL	MIA
DEN	HDN
AUH	LCA
TPE	KWL
CTA	BSL
IST	NAP
PEK	HKT
GVA	SEN
BSG	COO
PVK	MAN
XIY	LHW
AUH	KUL
MIA	MSP
TLS	LIL
TLH	TPA
AAE	ORN
CMN	LFW
BOM	PNQ
DME	MCX
BKK	LHR
SBA	SFO
BKI	LDU
NNG	HGH
MKE	CLT
ABQ	SEA
GPT	ATL
XNN	TSN
KUL	AUH
ILO	PPS
NYM	VKO
BEY	LCA
CLT	ATL
SVO	CAN
HAM	CPH
RZE	LTN
JHB	BDO
SXF	ARN
CMB	MLE
ANC	DEN
YYC	YXH
AMS	BHX
SIN	BKI
ROK	GLT
SYZ	DOH
CDG	FCO
ADD	SSG
SFB	SBN
BOD	BRS
SLC	GTF
DEN	SJC
JED	SLL
MDZ	SLA
NAG	BOM
ADB	TXL
IAD	GSO
TMW	SYD
DXB	CMB
ALC	BVA
YYZ	PEK
DRW	MNL
CDG	DEL
VNO	FCO
BVA	BTS
DUB	AMS
ADB	HAM
MGA	IAH
BFL	SFO
FAO	NCL
ORD	AVL
HGH	SIN
VAI	POM
CMH	FLL
DPS	ICN
EWR	CHS
ORN	FCO
BTU	BKI
PUY	MAN
YYZ	YHZ
LBV	LFW
CMN	SVO
DUB	MCO
DED	DEL
SLC	STL
KUL	PEK
YQQ	YVR
DOH	AUH
SMF	ATL
IBZ	HAJ
SAT	SAN
LOS	ADD
VAA	ARN
DME	IAH
FAY	CLT
TSR	TSF
AGP	TMP
ALW	SEA
ART	PHL
DEN	CEZ
KVG	POM
AMS	JNB
RMQ	FOC
STN	MRS
CCP	ZAL
BOH	AGP
LAX	IAH
ABQ	HOU
LGW	GVA
DAY	DTW
BVA	TSF
MUC	BKK
TIP	CMN
MDW	ICT
NAS	YYZ
LIR	MIA
MAD	BVA
PSA	PRG
LIN	LGW
CAN	NBO
DOH	BOM
PEK	WUX
NCE	CFR
SVG	SZZ
SFO	BUR
BGY	EIN
NNG	TSA
MGA	PTY
MCI	CLE
DME	ATH
HAV	PTY
VKO	AYT
RUH	ADD
BHX	DEL
GRB	ATL
CHQ	BGY
TSF	NYO
MRZ	SYD
HEL	KAO
EBL	ESB
MAN	KEF
ESB	ADB
DEN	LIT
DUB	PUY
SEA	YVR
WNZ	HRB
DEN	TUS
ATL	STL
CGN	ESB
PIE	CID
HAM	EDI
DBV	ZRH
BOS	ATL
CCJ	JED
MRS	SVQ
HOU	DAL
SAN	ATL
KHH	PEK
BLI	HNL
SAN	IAD
GVA	BEY
BAL	IST
LPB	LIM
BUD	DUB
LAS	IAH
SFB	CVG
TRF	AYT
DPS	PER
HKT	AUH
DWC	CEK
MEX	HMO
CTU	TNA
FSD	LAS
DEN	PHX
CTG	CLO
PHL	MIA
VLC	DME
FNC	CCS
ATH	KGS
ABE	SFB
TUN	BKO
BKK	TAO
SDQ	ORY
IAD	CPH
CZX	XMN
NKG	CKG
CAN	BKI
YHZ	YQX
AYT	BRE
SZX	URC
BZR	BRS
TLS	DIJ
AMS	SFO
LAX	GEG
EWR	ITH
BUD	TMP
PEK	HGH
VIE	YYZ
GEL	POA
SHP	DLC
PRG	ROV
SAT	PHX
XIY	ZYI
MSP	SMF
CWB	MGF
LHR	SEA
BEG	FRA
CDG	OSR
BCN	FRA
CNX	BKK
FCO	CPH
PNQ	HYD
CIA	WRO
TXL	ACE
JAN	MCO
UIB	CLO
BGY	CTA
CUE	UIO
CTU	NKG
AZA	DLH
PEE	DME
HRB	HKG
DIE	TNR
BCN	TRF
NTE	CMN
ORK	LIS
TYS	ORD
SMF	PHX
HRB	NKG
MFM	BKK
ATH	PHL
GSO	CLT
IST	TUN
TYN	HGH
CBO	MNL
COK	DOH
MDW	SDF
CGN	ARN
XIY	TXN
ASP	DRW
AZA	EUG
DDG	TAO
HOU	OKC
LGA	BHM
OSL	AYT
NAS	BOS
ALF	OSL
FLL	SJO
TAS	KZN
LIS	AMS
DTM	SAW
MBJ	CLT
DXB	ADL
ARN	EBL
SAN	STL
ORD	HPN
BLQ	MAD
PIT	RSW
ATL	TTN
WUH	YNZ
DTW	ICN
MRS	GVA
ICN	KHV
NAO	SZX
EWR	SAP
CRA	BGY
MAN	ZRH
GLA	LBA
HKT	MEL
PHX	YVR
JED	IAD
IST	GZP
CAN	AKL
WAW	LPL
LEJ	AYT
LIS	PHL
CUN	SCL
NAT	VCP
ARU	VCP
CAN	JJN
ATH	AMS
CCU	BLR
EDL	NBO
ASF	DME
MCO	DCA
TIP	FCO
EWR	TPA
JHB	SUB
GDN	TKU
NGO	MNL
MAB	IMP
LPL	PSA
CPT	DOH
MDL	KMG
AEP	AFA
PEK	MLE
FEZ	MPL
IAD	TUL
MEX	LAX
HLZ	PMR
LAX	ZLO
IMF	IXA
MAN	RIX
JAX	LGA
KRR	TAS
ATW	DTW
CKG	KWE
KMG	TAO
CUN	REX
CBR	PER
VKO	MIA
MAN	BGY
WUH	PVG
MYR	DTW
SHE	PVG
TUN	TLS
AMM	MCT
SUX	ORD
MUC	WRO
LEJ	AGA
ATH	TXL
CTA	HAJ
DLA	ABJ
SLC	CNY
MGW	IAD
IDA	SLC
BRS	HAM
AGP	FMO
KTW	LTN
ICN	BNE
SAV	LGA
GVA	SVQ
OXB	CKY
TYN	URC
DLC	TAO
SPU	ATH
MUC	LEJ
SZX	LZO
DME	LLK
MFM	ICN
ORD	VIE
MAR	AUA
MHD	IST
BVA	BLQ
MAO	VCP
NGO	CTS
HRE	NBO
HAM	MAD
URC	SJW
ZRH	ALC
MAB	AUX
ZAD	MRS
LAS	PHX
STR	ZRH
RGS	BCN
YHM	YEG
BOG	CCS
JED	FRA
INV	MAN
KRK	CAG
CZM	MIA
TLC	LAS
NNG	KUL
PEW	MCT
CRL	CAG
ZRH	MAN
BOM	IDR
FEZ	ORY
IKA	KHI
ZVK	VTE
HRL	MAF
TSF	CTA
ALC	ORN
IAD	OMA
ISA	CNJ
MIA	IAD
AJU	VCP
PHL	CDG
STN	ZAZ
KMG	KUL
CDG	NBO
JED	ASM
EDI	BLQ
YVR	YQQ
KUL	KBV
STL	CLE
HKG	DME
CUN	MID
HGH	YCU
ATL	EWR
AES	CPH
JNB	FIH
LHE	MHD
WUH	HAK
BES	MRS
URC	TSN
URC	TPE
EVN	VIE
ORN	TLS
MUC	SAW
TUS	ATL
QRO	CUN
ARN	KID
CMN	LAD
MDG	TAO
ISB	KBL
XMN	CKG
AGP	VKO
MBJ	YHZ
TPE	SFO
BOS	IAH
XIY	FUG
RIX	BGY
LGA	OMA
ATL	FRA
CGO	KMG
PSA	SKG
INV	KOI
DTW	TTN
LHE	RUH
BLQ	BVA
SJU	CLT
ALB	PHL
PUB	DEN
JFK	AUA
CPH	ZRH
DXB	MHD
MMH	LAX
TIP	BEN
CUL	TIJ
SYX	TNA
SEA	YEG
TNA	KIX
YYZ	ADD
OTP	AMS
AUS	OAK
LAS	YYZ
FAO	OSL
IQQ	LPB
PRG	DXB
SAP	PTY
YVR	MUC
GJT	PHX
PDL	YYZ
UAQ	AEP
KUL	HYD
GRQ	FAO
ORD	ICN
DXB	WAW
SPU	BEG
SBN	LAS
CGH	SSA
BOM	JNB
MEX	REX
TYN	TPE
CKG	BFJ
VXO	ARN
AVP	ATL
BAV	SJW
AZS	JFK
LUN	HRE
JCB	CFC
ILM	PHL
BOS	RKD
KOI	ABZ
CID	DEN
AMS	BOM
ORY	MAD
IST	KAN
MIA	ORD
NTE	MAD
EXT	ALC
AGP	HEL
KIX	SDJ
CMB	BLR
LYI	CAN
NTE	AMS
AMM	OSM
SOU	NCE
CUN	PHX
LPB	AQP
MHQ	TKU
HKT	KUL
EZS	SAW
BWI	CHS
FUK	ITM
OVB	PEK
XIY	DMK
PMO	FRA
BRU	RIX
COK	SHJ
TJM	DME
KHN	HET
AGA	CRL
CMB	DXB
MRS	BLJ
CMN	NSI
ORD	SEA
SIN	ZRH
SEA	SMF
BCN	DRS
NQN	CRD
FCO	RUH
WLG	TIU
BRU	ACE
BNA	HOU
BKO	LFW
SAN	PHL
SXF	ORY
NSN	CHC
YKS	IKS
OVB	KJA
NKG	FOC
BHM	ATL
BNE	DRW
NTL	BNE
JIU	XMN
CTA	CPH
YUL	IAH
YXL	YAG
ALC	FRA
CRL	LJU
SYX	CGO
PIA	PGD
SMF	MDW
PLQ	CPH
PSA	CGN
JFK	LIM
EBL	AUH
VLC	FRA
AKL	ICN
AMS	DTW
AMS	DBV
YNT	SZX
KUL	SGN
HSN	SZX
NAP	LIN
HAN	VDH
FEZ	STN
BTV	SFB
SOF	VAR
AUH	MNL
MAD	TSR
TBZ	MHD
CKG	SWA
CLE	ROC
DXB	AHB
ATL	LOS
MKY	SYD
JED	KRT
EWR	DEL
ORK	AGP
BPS	SSA
TME	BOG
HAJ	IST
SLC	PSP
LAS	OKC
SCL	PUQ
VIE	ATH
AYT	LEJ
FLL	SAP
BOS	YTZ
STN	TLN
MSY	SAN
LOS	IST
HIB	MSP
YUL	DTW
IST	DXB
SKG	MJT
SAW	ARN
PHX	GEG
BGY	AGP
ATL	BOS
GOJ	TAS
FRA	BLR
OIT	ICN
GYD	FCO
STN	PMF
RAK	EIN
WAW	EIN
BKI	PPS
KWL	XMN
ABZ	WIC
CAN	IKA
YYC	YQQ
ERN	TFF
JNB	PZB
PHL	MSP
PEK	CHG
TIJ	GDL
CTU	LHW
RMQ	KIX
BOO	SSJ
SYD	POM
CKG	ZHA
JED	CAN
NYK	WIL
BPL	URC
MID	MEX
MSP	BRD
SYX	TPE
CHC	AKL
BKK	FUK
VNO	CRL
BIA	MRS
REC	AJU
DUB	BOS
YYZ	HKG
KHN	NNG
MHD	BEY
SLC	MEM
FCO	NAP
IKA	DOH
ZRH	IBZ
DCA	LAX
CZM	IAH
PTY	POA
AZA	SGF
SOF	VIE
VTE	KMG
USK	ARH
LAX	PVU
HKG	SVO
TRD	AGP
CPO	LSC
STN	SDR
NNT	CNX
CUN	GDL
KUF	SVO
PTY	BAQ
CDG	LYS
VKO	VCE
FOC	CKG
DXB	BWN
SEA	BOS
BCN	PHL
KIV	SGC
BOM	JDH
NTL	MEL
TGU	SAL
DPS	BKI
MDW	STL
IAD	MDW
OVB	HMA
JAX	PHL
CIA	MRS
CMB	DME
BSL	NCE
OLB	FDH
URC	TNA
DOH	VIE
MSN	MSP
CTS	PUS
DOH	KRT
PTY	UIO
CCU	DAC
SFO	SBP
AUH	IKA
MDW	IAD
VNO	HEL
LAX	SAF
MAD	SAW
HAV	AMS
CLT	BUF
HAM	NCE
KUL	DEL
CTA	TXL
KWL	SJW
IAH	AGU
HAV	MAD
GHT	TIP
BUD	DOH
HKG	WNZ
SHA	TAO
NWI	ABZ
AMS	BGO
AEP	VDM
NYM	TJM
TSN	SIN
JDH	BOM
ABZ	FRA
ICN	SEA
BDL	RSW
LIS	ARN
ABJ	CDG
LHR	OSL
AGP	SEN
DRW	ISA
FRA	BOS
BEW	MPM
SHJ	ATZ
LGW	PSA
CRL	EDI
FRA	KUL
BKK	SIN
FAO	CRL
DEL	AMS
TXN	TYN
SAN	RNO
KWL	ZUH
CDG	NIM
CDG	SIN
SAW	ATH
EBL	DOH
MUC	HAM
DNH	URC
CEC	SFO
IQQ	ANF
BGY	ZAZ
MDW	BWI
ZAG	LGW
BNA	PIT
KWE	CTU
MLE	KUL
LUN	AMS
SJU	ORD
KLX	ARN
PEK	ADD
CHQ	MRS
MCZ	AJU
HEL	AGP
FDH	OLB
SLC	SNA
NVK	BOO
IST	NOP
HLH	NAY
MAD	BOS
AMS	HAV
TYN	TSA
EZE	CDG
SHA	PEK
BOS	AUS
DME	UKS
LZH	SYX
LIR	PTY
LUN	CIP
PGD	ISP
CCF	OPO
DLA	BZV
MDW	MSP
IAH	GPT
ORD	SNA
CGN	OLB
YYZ	SYR
GSO	ATL
IND	LAS
MGA	FLL
PDX	ORD
JFK	LAS
JDZ	SZX
VCP	JTC
YZZ	YVR
GMP	RSU
OMA	DEN
IKT	YKS
SLP	IAH
NYI	ACC
SKG	AMS
LGW	MAD
CGR	CGH
LIL	BCN
JEG	JHS
NER	KHV
EGC	LPL
DWC	OMS
FCO	FLR
NBS	PEK
LHR	LIS
HTS	CLT
BLR	IXG
ISP	PHL
HAN	SVO
BCN	DBV
LYI	SHA
FNI	CRL
GWT	TXL
BCN	LIL
WLG	WSZ
LDB	CGB
ORN	OGX
KHV	HRB
MAO	PTY
PHX	MCI
PIE	PIA
PHL	BDL
XIY	GOQ
HTA	OVB
OAK	ORD
HOU	SAT
SEN	SXF
BEY	MCT
OTP	BGY
KLX	AMS
BEY	DXB
TSF	KIV
AMM	ORD
AUA	BOG
FCO	ORD
HGR	IAD
MAN	MBJ
MOB	ATL
BSL	VIE
DMK	NNT
SUB	JOG
ASW	CAI
JAI	BLR
FCO	MPL
SYD	LSY
ZAD	NYO
MSY	FLL
FRA	TUN
BUF	LAS
SAP	RTB
ULK	YKS
RNS	EXT
SXF	VCE
YIW	SWA
YBR	YYC
MJV	STN
REC	LIS
ATH	DBV
MSP	BMI
TAO	HRB
TBS	CDG
POM	TIZ
BGO	RIX
BKW	IAD
ZRH	BNX
PSA	DUB
SEA	MDW
ZAH	DXB
AGA	CMN
TYN	DLC
BGY	RAK
SDF	BWI
HYD	CJB
SWA	HFE
LSE	MSP
IAD	KEF
PEK	ARN
PSA	TIA
PHX	SDF
VNO	ORK
RIX	FCO
LBV	CMN
FMO	FRA
BEL	MIA
SZX	HAK
BTR	CLT
MUC	DOK
BWI	NAS
YYZ	CUN
MCT	DEL
MOF	DPS
SHJ	DEL
MIA	MAR
CRK	ICN
ROB	LOS
MAO	STM
ICN	LAX
EWR	AMS
JYV	KEM
BUD	STN
VXO	BMA
MUC	BDS
RIC	DTW
GRU	NAT
MEC	UIO
OSL	HEL
HOG	CUN
BOM	HBX
KGL	BZV
PBG	BOS
SWA	ZUH
CZL	CDG
IST	YYZ
AUH	CMB
DRW	PER
AEP	POA
DMK	CNX
AGP	CGN
KRL	CTU
MSO	SLC
CLT	MKE
ESB	AJI
PHL	CLT
CTU	FRA
CWB	CAC
DXB	SAW
BDS	LIN
PIT	CVG
AMA	DEN
SXF	SZG
MCO	ILG
HDY	KUL
RBR	BSB
AUS	BOS
FLN	CWB
ORK	BRS
SVG	KTW
BLQ	CGN
BKK	KBV
ACE	ZAZ
TDD	CBB
DBV	BGO
NAG	IDR
BLQ	DUB
ALC	KEF
BVA	MAN
DUB	ARN
MEM	CVG
CLT	MCI
LOS	CDG
TYN	HRB
SVO	NOZ
OSL	SZZ
ARN	PEK
BEW	TET
OSI	ZAG
CUN	FRA
ADA	ADB
MDW	MBJ
XMN	NKG
MBJ	YUL
WWK	VAI
DPS	JOG
CKG	KWL
CLE	ORD
TSN	HGH
JHB	KCH
MDG	DLC
CLT	BOS
SHJ	AMM
EWR	SYR
GOA	STN
CKG	WNZ
LIS	LPL
ICN	AXT
SNA	LAS
APN	DTW
MUC	GRZ
YUL	LGW
BNE	PHE
LYA	SHE
HAM	RIX
DOH	CKG
GOJ	DME
MAD	CUN
DTW	PBI
SSG	ABV
GVA	LUG
ARN	KEF
STR	STN
YTH	YQD
AUA	LRM
MEL	SGN
LAD	MPM
BCN	BIO
IND	DCA
ADB	VIE
ATL	MYR
SFB	PBG
BGO	ARN
DOH	MAD
NNG	CKG
EWR	BRU
LTN	KSC
LAX	HNL
ASP	MEL
ATL	FSD
LGA	GSP
SVO	SCW
ORN	TUN
CMN	BOD
TCQ	AQP
ATH	DUB
BWI	RSW
FAI	ANC
USM	KUL
SJO	SAL
BHQ	MQL
CHS	BNA
RTB	SAL
TLH	CLT
CTU	HET
SWA	BKK
LAN	DTW
IAH	IST
STN	OVD
DLU	KMG
MYR	ORD
KIX	TPE
YYZ	BNA
DTW	MCI
HGH	KWL
SHJ	JAI
ARN	LCY
RIC	MCO
MDW	LAX
MOL	OSL
LAS	GRR
CLT	MBJ
HUN	TNA
BOM	HYD
YCU	HRB
KMG	SZX
CMN	JED
SRG	CGK
BLQ	BRS
CDG	DTW
KRR	MCX
SJO	EWR
KIX	MNL
VCE	ZRH
SHE	YIW
LAX	DXB
BCN	LGW
FLL	LAX
DEN	SEA
BRU	LAD
PMV	MUN
DUB	LPL
BLQ	TSR
MGA	SAL
JED	CGK
BVA	FAO
ARN	BUD
JNU	SIT
THE	REC
CCU	BKK
DWC	RUH
TPE	PUS
YUL	ATL
ARN	BKK
NOV	LAD
BOM	COK
TSR	CIA
CMH	IAD
HAM	BRS
PBC	IAH
DEN	BZN
ICN	XIY
FSD	AZA
ATL	DUB
GOJ	DYU
YDQ	YVR
MAD	BJZ
MPL	LBA
MPL	LGW
ANM	WMN
SFB	YNG
CIA	CAG
KAN	LOS
IST	BHX
ZRH	FMO
FMO	MUC
NOJ	SVX
BNE	EMD
LOS	CAI
ORD	YYZ
KWE	SZX
BLQ	LYS
FLL	PIT
DBV	DUB
JAU	LIM
FRA	IKA
CHQ	BRU
PHX	GDL
CMB	ICN
BSB	PTY
VSA	MID
PSC	SLC
MRS	IST
CDG	OUA
CDG	CAN
POI	LPB
RUH	PEW
MIA	GYE
RAK	BRS
LAS	SMF
SFO	MEX
NKG	RMQ
BWI	DAY
EWR	RIC
OSM	AMM
TYN	SYX
IAD	AUA
DME	ZRH
PEK	IAD
KHN	KOW
BNA	GSP
BSB	PMW
SFO	MRY
BDS	BVA
TSN	CAN
FLR	BRI
BGW	CAI
PHX	PHL
STR	DUB
RTM	LHR
TAO	DLC
WAW	BCN
SZX	JDZ
PEK	LXA
RBA	CMN
YYZ	HAV
HEL	PEK
YHZ	YYZ
MCZ	GRU
JFK	AUH
MCO	SAT
DXB	SLL
CAN	HAN
PUS	KIX
MSP	LSE
SYD	JNB
JFK	BGO
BWN	MNL
DLC	PEK
JNB	POL
IST	NSI
EWR	DCA
JNB	DUR
BCN	LEJ
PHL	BRU
IAH	JAX
JUH	XMN
CCS	LIM
BNA	MCO
SAN	OGG
CDG	LAD
YXS	YXT
GRZ	STR
TNA	LHW
SDQ	HAV
GDL	ORD
BZV	ADD
HEL	MHQ
TLS	FCO
CGN	LHR
MEX	TPQ
VIE	ZAG
ALC	DME
ROC	TPA
AKL	KUL
YYZ	YVR
SFB	GSO
NBO	BOM
MGF	CGB
LYS	CFR
LRD	IAH
AMM	AMS
MYJ	NGO
SYD	MIM
OVD	CDG
SHJ	AHB
DOH	MLE
MSP	MCO
OPO	PDL
BRU	KGS
KUL	PUS
MCX	KRR
DXB	KRR
MAN	DME
BCN	GLA
MEL	KUL
KUL	FOC
BHX	ZRH
SZG	CGN
ADD	SAH
BGO	SXF
DXB	IAH
IAH	MOB
KCM	SAW
FRA	DUB
KOJ	ITM
SSA	LIS
LYI	DLC
CIA	BOD
BOS	YUL
BOM	RAJ
LYS	CDG
HRB	DLC
BHX	EDI
IXJ	DEL
CHQ	ARN
TIJ	TPQ
IST	GNY
UFA	NSK
ROS	GRU
BOI	SLC
ATW	MSP
KWL	XIY
VIE	FRA
PIK	ALC
GYE	JFK
SVO	ATH
SLC	PHL
MVD	MIA
KUL	KIX
DEN	BHM
CLE	SFO
BRU	HEL
CHC	DUD
MAD	ACE
DTW	ORD
CVG	DTW
CGK	JOG
HIR	BNE
ACE	LPL
SUB	KOE
DCA	PWM
BEG	OTP
MUX	SHJ
SGN	PUS
BLE	ORB
LIS	GVA
OLB	VIE
MSY	BNA
BKK	HEL
SXB	NCE
HHH	DCA
CLO	UIO
SVQ	ORY
CGH	FLN
XNA	LAS
MRS	WMI
AEP	ROS
MDW	FLL
GIB	BHX
STN	OPO
RAK	NTE
SHA	KHN
PHX	SEA
PIK	MJV
MSP	OMA
NAS	PHL
NCE	BRS
ORK	NCL
GUA	TAP
KHN	KMG
SHJ	IXE
DKR	ACC
KMG	HKG
FRA	BEY
SKG	IST
MAN	CUN
NCL	CPH
AJA	CFR
PIH	SLC
RMQ	TAO
DXB	MNL
PPN	BOG
DUB	AGP
TNA	TPE
AKL	TUO
FLL	CVG
SFO	PSP
DEN	IAH
BFF	DEN
DLC	CZX
SNN	BRS
LAS	SNA
ARN	OAK
HEL	MAD
KWL	SYX
HAU	OSL
VIE	TGD
LIM	COR
BWI	TPA
BLQ	KIV
EWR	IAD
NAP	NCE
LGA	ATL
MUC	PEK
MCO	TTN
AMS	EDI
ORY	LCY
OAK	BLI
MCO	SDQ
SNN	NCE
NTE	SVQ
IAD	ADD
BOG	SDQ
IND	LAX
PEK	SVO
PQI	BOS
FTE	USH
YYZ	MUC
SHE	CIF
ALC	KRK
PHL	SAV
MUC	DBV
HGH	HKG
SYD	AUH
JNB	SYD
CID	ATL
CTU	KHN
KIN	PTY
SHE	KIX
MEX	CVM
DBV	BFS
AKL	NSN
SYR	PHL
EWR	HKG
LGW	GOA
DME	KRO
KUL	AOR
AMS	BOS
MUC	DUB
FRU	TAS
PSR	BGY
TAS	NCU
BDO	JHB
DTW	YOW
BKI	ICN
HOG	HAV
MEL	MIM
GSO	ORD
LAX	SLC
KZN	DYU
NSK	DME
MAD	LHR
PVG	HEL
OUA	CDG
ORY	ABJ
PUY	DUB
MIA	MAD
SJO	LAX
CAN	CGD
GLA	IBZ
CPT	MUB
CUU	TIJ
BRS	RAK
BHX	CDG
RUH	GVA
IBZ	RTM
ZRH	GWT
BOD	NCE
CGD	PEK
VCE	LBA
ISA	BNE
DEN	YXE
COS	SEA
HET	PVG
QRO	IAH
DUB	CHQ
DTW	NAS
AMS	FLR
SHP	TAO
LCA	LTN
PHX	ATL
BNN	SSJ
KRR	KJA
AGA	MAN
HNL	IAD
SKG	STR
SWA	HKG
DTW	SAV
PHL	ART
VCE	NTE
IKT	NER
FCO	BOD
HAM	FMM
SEA	MCI
CBB	TDD
COO	DKR
VIE	LCA
STR	BDS
OGG	OAK
SNA	SJC
PTY	KIN
PNZ	BSB
MEX	YYZ
UTN	CPT
HKG	DXB
DEL	VIE
BAQ	CLO
MSP	YEG
DXB	DME
MIA	CVG
AUS	IAH
SDF	MSP
SAW	ERC
AUH	AMS
TXL	KLU
LCY	FLR
AJA	LGG
MCT	DXB
CAN	TAO
LTN	KUN
BGO	ALC
BSB	CGR
GVA	YUL
GLA	CUN
KGD	SVO
BRN	MUC
SCW	SVX
HKG	SHA
JDZ	PEK
BLR	IXE
DEN	SAN
BSL	IBZ
IST	KIV
GRU	VVI
YYZ	YYG
KHI	UET
LJU	STN
EZE	IAH
CHS	ORD
RIX	SVG
SVO	BEG
SXF	PSA
FOC	JDZ
CKG	DMK
SAT	SEA
VCP	UDI
ATL	MIA
UIO	CLO
KTA	PER
STN	ACE
BWI	YYZ
LIM	GRU
KWL	CTU
PUS	FUK
TPA	YYZ
VLC	SVQ
TUS	LAS
CGQ	CAN
HET	TYN
LPL	POZ
JMU	PVG
ORD	GRB
OUA	ACC
ALC	DUB
KIX	CDG
DKR	MAD
LAS	MKE
PVG	AMS
ORD	PEK
NYO	CIA
QSF	MRS
ZRH	BKK
LGA	IAH
BFS	ALC
MAO	CIZ
OAK	HOU
KTA	MEL
CLT	NAS
LGA	BGR
LHR	FNA
PHL	ICT
LYS	AJA
ALC	CRL
BGY	TSR
MGW	CKB
CGO	PEK
AEP	UAQ
ARN	MXX
ARN	GVA
SFO	GDL
UUA	NJC
TUS	MDW
YWG	YOW
CCP	PMC
BTS	BGY
HAM	ALC
IAD	EWR
MUC	MRS
AMM	JED
SIN	COK
LAS	STL
IND	YYZ
ELP	DEN
UDI	VCP
YYZ	YEG
VVI	GRU
JAX	MDW
KJA	SVX
LAS	GEG
WNZ	LYI
ELM	DTW
STN	BCN
PSA	WMI
ABQ	LAS
LEJ	STR
DAY	EWR
HNL	LAS
ADL	CED
PVG	ACX
LXR	LHR
YNT	NKG
KRK	STR
DEN	ICT
TSF	CHQ
GAU	IXS
LZH	XMN
GDL	MID
JFK	SJC
SDY	BIL
MEX	CPE
SLC	ATL
ORK	BRU
CWB	LDB
MNL	BKI
CWB	MVD
LAS	SJC
DME	SIN
KOW	ZUH
KMG	PEK
LAX	DTW
BEG	LJU
IST	ERC
SVG	TRD
KHN	CGQ
SLZ	CNF
BLR	MCT
MCI	SLN
DEN	CVG
TGU	RTB
SIN	FUK
PVR	ORD
IKA	DEL
AGP	LIL
KIM	CPT
PUS	SGN
ZUH	SWA
LAX	MNL
LUN	ADD
ADB	BHX
BCN	BFS
JED	MAD
STL	SEA
CRP	IAH
SVO	MLE
ICN	DLC
KMQ	FUK
TXL	NTE
TXL	BRN
TLS	BRU
CPH	STR
TXN	HFE
EZS	ESB
AZA	BIL
PUS	KWL
KTM	KMG
FSD	MSP
JFK	ORF
PSC	SFO
VAR	SVO
LDE	ORY
REX	CUN
AMS	EWR
PEK	WUA
PNZ	REC
BOH	FAO
ORY	FNC
LIM	PIU
VOZ	MUC
WAW	MAD
BGY	BVA
CFE	OPO
DTW	BUF
CMN	CKY
CTA	PSA
BRI	TXL
BOS	PDX
PHX	YYC
DEL	MEL
LGW	MCO
KIS	NBO
SAH	ASM
TXL	ALC
MLG	CGK
LHW	YCU
PSA	OSL
CGO	DLC
OLB	NCE
HKG	YNT
MCT	IXE
DEN	PVR
LYA	KMG
BSB	MCZ
ASM	KRT
KTW	BHX
GVA	HAM
VAI	MAG
RSW	ILG
LIS	OTP
ORK	MAN
WNZ	SHE
DKR	OUA
CXR	SGN
SGF	LAS
NTE	CDG
PVG	DOH
PLZ	CPT
OGG	LIH
JFK	HOU
YWG	YEG
YVR	SYD
SAN	DCA
LGW	CHQ
KSU	SVG
DPS	DMK
JNB	BEW
ALC	LBA
RAK	LIS
ZAD	STR
TET	VXC
AGU	LAX
DBV	OSI
SIN	TGG
BGR	PHL
MIA	PNS
YWG	MSP
BMI	ORD
ISB	LHR
YWG	YYZ
AUH	HYD
SFO	STL
HET	TPE
CMN	SAW
SVO	IKT
DAC	DEL
AJA	ARN
CVG	DEN
AGP	BTS
MSP	GTF
LTN	BZR
FLL	BOS
RAP	SLC
AJA	LGW
DEN	DTW
NYO	BUD
VIE	FCO
VPE	SPP
XMN	KHH
YFC	YHZ
BGI	FRA
DKR	JNB
MAD	KRK
NAS	CLT
BOD	SXB
DJJ	MKQ
DME	AUH
DTW	CLE
SIN	TPE
HKG	JJN
YTY	XIY
AMS	LIS
LHR	ACC
MKE	MCO
JXA	HRB
CAK	ORD
DXB	GRU
KIJ	FUK
EGC	RTM
GDN	LTN
BKK	PUS
IXM	HYD
YYZ	YYJ
LAX	HKG
CLT	SAN
AMQ	MKW
CAN	DEL
BCN	VNO
PHL	FCO
LYS	MIR
DPS	KUL
CGK	CMB
AGP	AAR
KWL	TNA
MBJ	KIN
SAL	LIM
WAW	LIN
MBJ	STL
TAO	KHH
DWC	DME
ATL	SRQ
LAX	PTY
RMQ	SGN
HKT	DME
TOE	ORY
PIE	SGF
SPU	LGW
MCO	CLT
BLR	DEL
LGW	LIS
BEY	DOH
GRB	DTW
DCA	MSP
BUD	MAN
SHA	HET
SHE	HFE
BRU	IBZ
PZB	JNB
URG	RIA
STN	DND
HKG	KTM
FRA	SOF
BOG	MVP
CTU	KWE
YVR	HNL
ICN	ATL
IDA	LAS
CMN	BRU
OMS	DYU
SOF	DWC
LTN	GVA
ORD	OAK
AGP	RTM
SLU	BGI
GVA	VLC
ORK	NCE
TNA	KWL
SZB	PKU
PIK	CIA
UYN	PEK
DXB	KTM
AUR	ORY
FLL	HPN
CKG	XMN
NCE	LCY
CCS	PYH
BWI	MYR
DRO	PHX
BCN	EZE
GLA	KEF
ICN	PEK
CDG	TIV
PAD	AYT
CVG	CLT
SZZ	SVG
LAS	YQR
BQN	EWR
PUS	SHE
LZH	WUH
SKD	SVX
BFL	DEN
LTN	HAM
ZUH	YIW
BLI	SAN
SVO	GOJ
EDI	LCY
VKO	RIX
CRL	BEG
LGA	DSM
TAO	FOC
YVR	AMS
BEG	SJJ
LSC	CJC
KWE	CGO
CMH	DCA
AUH	LHR
CKY	LFW
DEN	DIK
ARN	PUY
GSP	SFB
BOG	AUA
TUN	CDG
STL	DCA
GLA	LHR
JNB	HKG
TYN	WUH
LBB	LAS
ROT	CHC
VSA	GDL
MAN	YVR
JFK	LHE
XIY	CGQ
YFO	YWG
CUN	AGU
JFK	VKO
SGN	DME
GVA	LTN
LAX	FRA
ISP	MCO
EDI	CPH
MFM	KUL
BOD	NTE
DRW	BNE
SNN	EWR
IAH	DSM
OMS	AER
WAW	YYZ
BHM	MIA
DTW	BDL
LIS	BIO
TUN	SFA
KUL	URT
DOK	KUT
KTW	NAP
PVG	DEL
SVO	DRS
CGK	LOP
SLC	ABQ
ISP	TPA
CPH	VIE
LHR	LOS
BNE	TWB
KRK	FRA
WUX	XMN
MRS	MIR
BEU	BQL
CTA	GVA
ANC	SLC
PVG	CPH
SVQ	PSA
MAD	CMN
DPS	HKG
KOI	INV
KWL	BHY
PEU	TGU
LAS	EUG
IKT	ABA
TRF	SZZ
TUN	TOB
CGQ	FOC
MLM	MEX
MAD	MJV
PER	HKG
HET	NKG
KRT	AUH
IST	AGP
LTN	SXF
MIA	SFO
WUH	DLC
CRK	KLO
WJR	WIL
BUD	LBA
BOM	CAI
MAD	BCN
VCP	XAP
DXB	KBL
BNE	ADL
MDW	HOU
LAS	TLC
MWX	PEK
BCN	POZ
TRD	AMS
UMD	JQA
VLC	BRS
DXB	DOH
PTY	IAD
LGW	KEF
DTW	MBJ
MEL	MKY
YYZ	VKO
FEZ	BGY
KUL	PLM
NBO	SHJ
MFM	CKG
MUC	MAN
IKA	CAN
SKP	SXF
GRJ	DUR
SIN	SWA
PSA	MAD
NTE	GVA
PRG	VNO
XIY	TYN
EBL	CAI
AZA	MLI
BHX	LCA
PLO	ADL
TAS	SVO
BCN	PMO
BEY	IKA
BOM	LHR
ORY	NAP
DTW	PHX
KTA	BNE
STR	ADB
YYC	MSP
EWR	OKC
DAB	CLT
SZX	CGQ
YUL	MUC
LDB	GRU
OPO	DUB
KUL	PKU
LHR	BUD
PEK	EWR
HEL	JYV
YYT	YJT
TPE	JJN
SNN	LPL
MSP	GRB
TLS	TUN
DLC	HIJ
GYD	SVO
LAX	MLM
YYG	YYZ
ICN	SZX
NAP	EDI
FLL	YYZ
MCI	MSY
IMP	BEL
ORD	DUB
BCN	NCE
LIM	IQT
FCO	PVG
MDW	TUS
MCI	SFO
OSL	BUD
LYS	NCE
AAL	AMS
TXL	UME
BVA	ZAD
CRA	LTN
CAC	CWB
POM	CMU
BFS	AMS
XMN	NAY
CTA	LIN
LEB	HPN
CCS	CZE
UIO	ESM
LYS	LEH
SIN	PLM
CAG	MAD
PDX	ANC
DOK	LCA
CRP	HOU
BDS	PSA
DTW	APN
MSP	SAN
CAG	STN
MGF	VCP
HKG	YYZ
HAK	TSN
IAD	SFO
LAX	SJO
CTU	AUH
ARN	ORD
ATH	MRS
BOG	TME
TOY	DLC
LIS	HAM
ICT	AZA
AXM	FLL
DTW	ILG
KGS	STN
SOF	CRL
SVO	NCE
COK	KUL
BEG	VIE
NAY	AVA
GRU	PTY
LOS	KGL
SVX	TAS
PRG	NTE
KFS	IST
BWI	PHX
LIN	CTA
IAD	SAV
BOS	YHZ
BGG	IST
ESB	VIE
BOS	MSY
SYR	MCO
DPS	BNE
HEL	FCO
VFA	BUQ
BHY	KMG
ICN	KHH
DOK	SAW
MSN	LGA
AMS	FAO
LKO	DED
VKG	SGN
XNA	IAH
YYZ	HOG
HAM	KGS
ICN	HFE
PNQ	IDR
BCN	LEN
BCN	SOF
BOS	SAN
PFO	VKO
LIS	STN
PMO	BLQ
SIN	XMN
MEG	VHC
CKG	DLC
BRS	MJV
SAF	DEN
YKS	VKO
VLC	OVD
MBA	ADD
DXB	PRG
BLQ	WRO
SYD	BKK
SVQ	BOD
SCL	CDG
ICN	TAO
AAX	POJ
ECN	HTY
PVG	NGS
GYD	TBS
DUB	PIK
CRL	PUY
YYZ	PVG
SJU	IAD
ORY	BOD
YYJ	YVR
VIE	SKP
BOS	ROC
BWI	IAH
BCN	AAL
DEN	OGG
MIA	ZRH
GOA	CTA
KHN	DLC
BEG	AMS
MAN	SOU
PRG	BSL
KWE	WUH
PRG	MAN
PEK	ORD
TYN	PUS
LZO	KWE
MIA	TLH
WMI	BCN
DGO	MEX
LTN	CDG
SAL	MCO
GVA	SVO
SXB	LGW
SVB	WMN
SFO	OTH
ZAG	MUC
FRA	OPO
YYZ	YTS
PVG	SFO
SFO	CVG
YYZ	MEX
BLR	FRA
FRA	PMO
LAS	FRA
DLC	FOC
BUD	PRG
BCN	VCE
KIX	IST
BWN	HKG
DOH	BRU
SJO	LIR
PEK	TYN
PSO	CLO
BGI	SVD
JJN	SZX
KRK	BVA
DIU	PBD
DAC	SIN
LIM	TCQ
LAX	MZT
ICN	CDG
IST	VCE
AOI	FCO
ABQ	DAL
OGG	HNL
BNA	CHS
SLC	BUR
SZX	PEK
EWR	GSP
CDG	ATH
CIA	KIV
SAT	CLT
DTW	LGA
PRG	VCE
KIX	KUL
LAX	PIT
FAO	SEN
WAW	LJU
FSD	ORD
IAH	HRL
RIX	SVO
IKT	KJA
JFK	BCN
KMQ	CTS
BIR	KTM
MYR	LBE
TPA	PNS
DAX	PVG
CCS	GRU
ORD	MYR
FRA	NCE
BEG	CRL
LIS	AGP
NAP	TXL
HGU	MAG
CHQ	DUB
MRS	CZL
GYN	UDI
EDI	PFO
CEK	OSS
OAX	MTY
BHQ	DBO
CJB	HYD
MIA	SJU
ADL	CBR
CTM	MEX
LHR	BKK
CRD	RGL
CPH	KRS
PSA	CTA
HET	CGO
ZRH	DXB
CRL	CCF
JUB	KGL
LIL	GVA
LPP	BGY
PVG	SIN
BCN	NCL
HKG	KWE
AAL	LGW
BSL	RAK
KHN	ZUH
BOG	VVC
BPN	JOG
LCA	HAJ
LCA	SVO
JQA	UMD
HOU	DCA
VVO	YKS
VVO	ICN
SFO	TUS
AUG	BOS
MAD	FLR
OKC	IAD
AMS	JKH
SAN	SJC
BOM	AMS
BJM	NBO
TXL	DOH
CAN	KIX
GDN	DTM
BQN	MCO
IAH	XNA
POM	WWK
HNL	SJC
KMG	KWE
PFO	EDI
LBA	BHD
JAN	ORD
VVO	PUS
CWB	EZE
DME	GVA
AGP	EDI
CRW	DTW
SDL	LLA
EBB	JNB
PHL	PVD
PEW	DOH
SKP	DXB
IAD	FRA
IRJ	AEP
VRA	DME
PMO	CTA
SEA	KEF
SOU	BHD
ORD	PHL
MCO	DAY
PKU	KUL
NTE	BOD
KHV	YKS
LYI	WNZ
ZYI	WUH
WAW	AMS
PVG	MNL
DLC	MDG
GNY	ESB
TIA	BLQ
LYI	NAY
HLN	SEA
IAD	SAN
DME	GDX
ACX	CKG
UIO	TUA
SJC	LAS
BKK	CCU
DOH	CCJ
CPH	STN
CRL	RBA
KMG	DAC
FOC	CAN
SFO	MNL
MUX	UET
WAW	DUB
EVN	VOZ
BES	CDG
CHC	WLG
MAD	PHL
CGN	LEJ
LAS	SGF
URC	FRU
YYZ	LIM
GVA	PEK
TLS	AMS
WUH	KMG
AHB	SAH
STN	MAD
FRA	VCE
IAH	PIT
DXB	MEL
RGK	DME
CLO	PTY
FOC	HFE
TXL	SKG
DUD	CHC
MCI	MKE
SFO	MUC
TLS	ORN
YXY	YLW
YHZ	YYG
KMG	CTU
CGN	BRN
BUD	ZRH
ATH	YYZ
BKK	ARN
LHR	PHX
AUS	MCO
BCN	LYS
BZR	LTN
AVA	NAY
BRS	DUB
MRS	AMS
VIE	HAJ
RAR	PPT
ICN	NGS
LZH	PEK
MNL	PEK
OKC	HOU
OSL	AJA
BKI	PER
TXL	BIO
RUH	DEL
ZAG	CDG
PHX	CLT
KMG	WNZ
IAH	MSP
ERI	PHL
GDN	TXL
SIN	BCN
CAI	CPH
ISB	SKZ
IST	SJJ
DTW	MSY
LAS	TUS
DMK	KMG
MSP	OKC
LIT	DTW
EXT	GLA
IST	LIS
YIW	XMN
BSG	SSG
MLE	AUH
CDG	FLR
MKE	IAH
CDG	SCL
CAN	RUH
BKK	VIE
MUC	MEX
PSA	PMO
ASU	EZE
SGC	FRU
BNA	BOS
TUN	IST
IST	SOF
STN	FMM
DME	AAQ
HAM	FRA
PEK	DXB
CTU	KMG
AER	IST
HOU	BNA
SMF	SFO
BIA	SXB
WUH	XMN
TTE	CGK
MLI	SFB
FOC	KIX
DTW	CLT
FWA	SFB
ABZ	CPH
LGW	BFS
PVG	LZH
ANM	TMM
DAB	ATL
SUB	DPS
MAD	VGO
PUQ	PMC
ABE	ATL
CNS	WEI
HGH	CTU
LTN	BTS
ISP	BWI
SYX	KMG
DBV	RJK
ELP	LAS
TBS	EBL
JFK	TAB
HGH	HKT
LIG	LYS
SIN	KMG
MAN	BHD
FAO	EXT
FAO	OPO
TTN	ATL
GUA	EWR
LAS	BOI
KHH	FOC
LRH	ORY
BOS	BNA
LIN	BRU
BMI	DEN
CAE	LGA
MLE	BKK
YEG	CUN
HSV	ATL
BRU	MAD
TKU	RIX
POA	RIA
KGL	EBB
PIE	YNG
KWL	SZX
LGW	MRS
EZE	LHR
BDS	TSF
RJK	NYO
VKO	GOJ
HKG	KUL
JFK	STI
IST	ADD
CGK	AMQ
ATL	BUF
KRT	JUB
NNG	XMN
CGN	PSA
LIS	CPH
TYN	KHN
CLT	LGA
BEN	TIP
CKG	YTY
KSY	ESB
BKK	MUC
MAN	IBZ
CRL	GOA
TOL	PGD
FUK	AMS
DOH	BCN
AUH	CGK
BIA	TXL
NBO	AMS
TSN	NBS
CUN	HAV
ATL	SJC
KHN	NKG
BOG	EZE
PVG	CMB
IND	CLE
CIA	DUB
HKG	VVO
RAK	CMN
TBS	VIE
ELS	CPT
MPL	FRA
SVX	KRO
PVD	MDW
PKY	CGK
BKK	AMS
DBV	OSL
LET	BOG
TYN	CIH
WUH	XNN
LAS	RNO
TLC	SAT
ATH	LYS
SVO	KZN
KUL	XMN
SHJ	DEA
MSP	SNA
PIE	HTS
WUS	TAO
SJW	TPE
SGN	CAN
MIA	MEX
MAN	BRU
XNN	PEK
RTM	MAD
CTA	BCN
CDG	EWR
LAS	SFO
HAK	BHY
MAN	ISB
DXB	ADD
OAK	LGB
NCE	LIG
BHX	BFS
JED	CMB
TAS	DME
CPH	TRD
PIT	PHX
GAU	BLR
DXB	LKO
DUB	LBA
SCW	SVO
DDC	DEN
YYZ	SAL
SKG	TXL
CTU	KUL
BRI	LGW
MBJ	IAD
JNB	PHW
DMK	UNN
BDJ	BDO
KWL	TYN
BWI	FLL
CAN	LYA
YYC	YXC
NLA	MNS
POA	MIA
SAW	ZRH
BSD	KMG
HGU	TIZ
ISG	KIX
TYN	PEK
MAN	AUH
MUC	BIO
SAV	IAH
CRL	CHQ
DEC	STL
CAG	PEG
TAS	SIN
YYC	DEN
LBB	HRL
MSP	MSO
BSB	ATL
FMM	OPO
LCY	ZRH
YIW	URC
BCN	ORY
IAH	EZE
SHA	NNG
MNL	KLO
EBB	BRU
BOS	SJU
CDG	LOS
KOO	FMI
LPL	LIG
KBL	IST
BVI	WNR
HAK	CGD
JFK	SNN
PNQ	COK
ALC	WMI
DCA	LIT
SXR	DEL
AUS	MEM
ATL	GNV
LHW	SZX
ORF	MDW
STR	FCO
NNG	PVG
LOP	BMU
CAN	FUK
LIM	CUN
SLU	SVD
SAW	RTM
CHS	BOS
GVA	FAO
PWM	BWI
VHC	MEG
NCE	MIR
TYS	SFB
FRA	NBO
DEN	COS
RTM	SAW
STN	RIX
ESB	IGD
SJI	MNL
HYD	HKG
KHH	KIX
IST	CAI
VAR	BEG
NSI	LBV
ORY	BIA
DUB	POZ
KIX	KOJ
BMA	BRU
RLG	STR
BNA	JFK
NMA	DME
BCN	HAJ
OGG	ORD
SCL	PTY
SSG	BSG
BRE	FNC
TUL	EWR
RAK	LYS
CAN	BNE
IST	KBL
TTN	DTW
XMN	CAN
ILO	GES
HOU	AUS
DEN	EUG
TPA	TTN
VCP	DOU
OPO	AMS
SPU	ZRH
TPE	HET
AMS	AES
BGO	KSU
FLL	CLE
FCO	GYD
IQQ	VVI
AMS	TLS
ASR	IST
AUH	KHI
DKR	TUN
WUH	CGQ
ADB	SXB
URC	YIW
ATL	FLL
MIA	GNV
DEL	EWR
LPB	SRZ
MEX	GDL
CUN	SAL
HKD	TPE
TPA	HOU
FMN	ALS
SHA	JIU
MRS	ATH
NCL	FCO
KRT	ELF
AMM	AUH
CTU	SHE
ABV	SKO
LXA	MIG
NBO	LAD
TNR	NBO
OSL	CPH
AMS	OSL
BRS	BCN
CKG	ENY
PLZ	DUR
AMS	SOU
LTN	CTA
BOS	KEF
CNF	POA
YEG	PVR
YYC	YYJ
CLT	AVL
BLR	CMB
SBN	PIE
MCT	MLE
WAW	WRO
MEX	PTY
FLL	SWF
PMO	LGW
DWC	JED
BOG	FLL
MEX	MAD
YXC	YYC
CGN	IBZ
HEL	VIE
SAW	ADA
YUL	LAX
EBL	ARN
TAS	TJM
TIJ	PVG
SZX	HYN
ISB	BHV
MEX	TRC
BGO	HAM
ERC	ESB
TAY	HEL
LFT	ATL
IAH	BNA
CLE	FNT
CNF	LIS
YUL	YEG
LOS	ABB
CPH	ABZ
EIN	VCE
LYI	XIY
DME	LIS
MFM	RMQ
DXB	LHE
TPE	KLO
NGO	PEK
PEK	CZX
JDZ	CAN
FRA	CPH
SDF	MIA
CGK	BKS
STR	BUD
EDI	BFS
LTN	IBZ
KRT	DXB
SWA	SIN
SOU	AGP
RNO	SLC
MUC	OLB
PEK	CAI
CZX	KWL
SVO	VIE
DEN	PSP
BSB	UDI
SJU	JFK
MCT	LHR
CIZ	MAO
YUL	YWG
ATW	SFB
LIG	LPL
PLW	SUB
TNA	SYX
MNL	CYP
OVB	BTK
HPH	SGN
SFO	PHL
MVD	AEP
MNL	HAN
KWE	KMG
KRS	CPH
ICN	FUK
VNO	CIA
BMA	VBY
FRU	SVX
SOW	FMN
LRH	CRL
IBZ	FMO
ORD	YKF
FNC	MUC
FRA	MLE
SXF	MAD
ORD	MTY
URC	BAV
BDL	YYZ
TLS	BSL
CUC	BOG
SFB	GRR
BKK	CDG
THE	VCP
AGP	FRA
NSK	GOJ
LGW	EDI
RUA	EBB
LBA	BGY
DME	TIV
KMG	ICN
KWE	FOC
DEL	GOP
MUC	JNB
LJU	AMS
BNA	MIA
DTM	BUD
ITM	MSJ
FOR	VCP
OSL	KEF
DEL	DED
TSV	WIN
SZX	HKT
NGO	KMI
PEK	YVR
NAY	SZX
FCO	IAS
BCN	BRU
SVO	ZAG
KUL	MFM
SXF	ATH
VIE	SJJ
BTU	KCH
LRM	FCO
CMB	FCO
MNL	DPS
BNA	CMH
KEF	BRS
SIN	HKG
LAQ	TUN
FMM	CIA
SOU	MAN
HEL	CPH
CEN	TIJ
ZAD	MAN
GOA	CDG
PEK	SGN
CEK	SVO
HAV	SVO
YVR	YUL
AOJ	ITM
DME	BAX
CKG	TSN
BCN	LTN
LAS	FAR
DXB	MUX
LAX	TPA
MAF	HOU
EWR	DAY
BEL	CNF
TRD	TRF
BKI	MYY
HEL	ZRH
JED	ATZ
WWK	POM
SZX	LHW
LGA	CAE
BRU	KGL
XMN	RMQ
DME	SGN
TUU	JED
CDG	NTE
IAH	DEN
IST	SKP
CTU	HKT
CGO	URC
SHA	SWA
EDI	FAO
REN	DYU
GYE	LTX
HRE	BUQ
ZRH	SKP
TUS	SJC
FRU	KJA
LAS	HOU
DEN	PHF
RAK	NCE
ATL	AZO
YHM	YHZ
BOG	CUC
SKG	BEG
EIN	IBZ
LCY	ARN
OVB	SLY
OTP	BCN
MAD	FCO
ATL	DTW
BOM	IXJ
DXB	MLE
DSM	ORD
SFO	FAT
BKG	DAL
FLL	MCI
BOM	IST
CLT	LIT
CGN	PMO
EIN	VNO
ATL	PHL
TBZ	IST
SFO	SBA
PHX	SBP
BEL	CAY
PSC	SEA
IAA	KJA
BNE	BME
BCN	WMI
DME	NOZ
VKO	LHR
AJU	MCZ
ONT	LAS
IST	KHI
PPT	RAR
CRL	MAD
MSN	SLC
FLL	PVD
NAS	ORD
CAI	EBB
IST	BEY
BGO	LGW
PEG	CRL
CFE	CDG
WRO	LPL
KCH	BTU
LHR	LAS
IST	SKG
WAW	GLA
CPH	FRA
BLR	RUH
DTW	SAT
MSR	ESB
AMS	SAW
BCN	WAW
ZRH	VLC
CRL	BOD
JFK	MBJ
TXL	WAW
KSF	AYT
ACC	FCO
BTS	AGP
FOC	TSA
BUD	VIE
MQL	ADL
AGP	SXF
FLL	SJU
KUL	CAN
BGY	SAW
SJW	WNZ
KRS	GDN
TSV	CNS
LIM	HAV
KUL	KTM
WAW	DOH
CDG	ABV
EYW	MCO
GOM	BNC
AZO	ATL
NSI	GOU
SVQ	BRU
DLC	YNT
LEI	STN
NCE	MUC
ZAG	DBV
JFK	GVA
AUA	MAR
CMB	SHJ
LAS	MOT
TXL	KGS
BGY	PSR
XMN	TPE
LHE	LHR
SYZ	MCT
MKE	ATL
BIL	HVR
MDZ	SCL
PSP	MSP
UFA	SGC
LOS	JNB
PIR	HON
DME	SAW
GRU	CGR
CGK	PEK
MSP	MSY
ICN	DOH
NAS	IAH
DXB	CCJ
SIN	CGK
AZA	OAK
ICN	LHR
BRS	CHQ
CTU	BAV
YOW	YUL
ORD	PDX
JOG	CGK
CMN	AGP
ATL	AUS
VLC	MUC
GRQ	MST
POP	EWR
LRH	OPO
LAX	MIA
AEP	CRD
CNX	HKT
ANC	HOM
ADB	DUB
IST	ADA
ADB	GZT
HKG	MEL
NCE	YUL
RNS	NCE
HEL	SVX
VLC	LGW
BLR	HBX
ALC	BCN
SFO	HNL
TSN	SHE
YVR	YCG
DCA	ISP
WNZ	CAN
ORD	RSW
LTN	ACE
DEN	BIS
TRD	KRK
JAX	FLL
EIN	BEG
FAO	CPH
LAX	PWM
LZO	SZX
LPB	ARI
BRS	FRA
SAT	ELP
LBA	LIG
RSW	IAH
NLD	MEX
SVX	NBC
STL	BNA
ORD	PHX
GRU	LFW
ADD	BOM
CGO	WNZ
PEK	HRB
AYT	KZN
ZAG	STR
LGW	HEL
SAW	OTP
BCN	FEZ
LYS	TLM
KUL	SUB
SLC	LGB
DCA	SAV
CTU	DLU
OSL	ZRH
MEX	LAS
TXL	ORD
NKG	MIG
SYD	SFO
RPR	DEL
KOW	HGH
AQG	CKG
LIS	NAT
ADD	LOS
HAM	ZRH
CLT	MDT
PEK	MUC
GOA	LGW
MAD	DKR
GRR	SFB
MKE	BOS
RAK	TLS
JNB	VFA
DEN	YWG
MSP	HIB
DHN	ATL
CYS	WRL
UIO	IAH
SSG	LBV
LAS	BLI
SFO	OKC
MDC	SIN
TXL	BEG
SYD	BNE
SHJ	DOK
BUD	CRL
AGP	BVA
DLC	SZX
BKK	AUH
SJC	HNL
KSU	TRD
LEJ	MUC
AYT	ECN
PVD	BWI
PRG	CDG
PVK	VIE
KHN	CKG
BOI	OAK
YJT	YDF
VTE	KUL
GRU	ARU
TPA	PTY
BGW	IST
PVG	CTS
ELG	OGX
JNB	LHR
DUB	WMI
LGA	CLT
ISP	SNA
SRG	BPN
ERI	DTW
NKG	MFM
MJN	TNR
KMJ	NKM
LNK	ORD
KIX	JFK
LAS	BZN
YQM	YHZ
PUS	BKK
LGW	CUN
BUF	DCA
JED	NBO
GCC	DEN
AMS	SVO
GLA	MCO
YUL	BOD
NYO	SKG
CUE	GYE
RNS	SOU
CMN	TIP
LCA	AMS
LGW	BHD
SDQ	JFK
PER	DPS
URC	LHW
FOC	MFM
FCO	BRU
BES	SOU
SVG	BGO
CPH	LIS
BOM	GWL
ISN	MSP
XMN	TYN
YYJ	YYZ
SJO	MAD
YNT	PEK
YVR	PDX
FLL	IAG
NBO	FIH
BFS	STN
COK	CCJ
LAS	PHL
DME	MUC
NKG	SZX
CCS	MIA
CAK	CLT
BEY	BGW
LHW	CGO
KRK	BSL
FCO	OLB
SJO	SDQ
IAD	BUF
NTE	TXL
RKV	AEY
MSP	OAK
SDQ	MIA
AMM	ATH
BOD	GVA
TRO	SYD
MDT	PIE
BNE	MEL
HFE	FOC
COD	SLC
ASU	MVD
OMA	MCO
EWR	SDF
VCE	DXB
FOC	SIN
MUC	VOZ
IOA	ATH
TLN	STN
KRR	LCA
CTU	CKG
SRG	SUB
BOD	FLR
BUD	AMS
MYY	TGG
HAJ	VIE
AUH	EBL
PHX	GJT
BOS	ORD
VNO	VKO
IAG	FLL
SNN	BVA
FLL	MCO
SMF	GDL
MTY	TAM
UAQ	MDZ
ORN	GHA
ZAG	FRA
BCN	DME
ICN	LAS
BHM	MDW
BRS	BGY
KHN	PEK
NOU	PPT
DTW	SEA
BEY	FCO
BOG	IPI
TAO	WUX
HFE	HAK
CLT	SJU
LHR	DME
TOL	PIE
MUC	TSR
JED	CCJ
MYY	MNL
AHB	DXB
LAX	HMO
DPS	PHE
MDW	YTZ
CUN	FLL
YEG	YOW
GLA	AGP
ASU	MIA
VSA	MTY
GUA	PTY
CLE	BWI
SHA	KOW
SEA	YYJ
SJO	SAP
ICN	IST
BCN	BRN
WAW	LCA
ORD	ABQ
HKG	TPE
HFE	HRB
URC	TBS
THE	SLZ
CDG	OSL
TUN	BRU
DRS	STR
KIN	YYZ
MUC	DRS
JFK	KIN
XIY	YNZ
DAL	SAT
WIL	NYK
BZE	LAX
YKS	NER
HIR	IRA
BSB	THE
BOD	CRL
YUL	ZBF
PSA	CAG
CRL	ACE
TGD	ZRH
SEA	BIL
VCP	LDB
IST	FRA
ELP	PHL
TBS	MUC
PHX	HMO
MSP	GFK
MIG	SYX
ZRH	ADB
KHV	VVO
WLG	GIS
PSA	ARN
YYC	YLL
LHR	EWR
CHQ	VNO
PIA	DTW
NJC	SVO
CAI	AUH
MEX	SAP
MDG	SHE
MNL	KHH
HME	CZL
MNL	LAX
HEL	IST
KMG	BKK
AUS	DEN
KJA	NZH
HMO	MEX
ZRH	AMS
MEL	ABX
SGN	MEL
TLS	SXB
SAN	SEA
CTU	WUX
FNC	LBA
DTW	FRA
ACE	NCL
CEK	DME
HKT	CNX
DUB	MAN
BRS	VLC
DCA	DTW
ZAZ	STN
HEL	NGO
IST	ACC
AGP	DUB
BIO	SVQ
DAY	PHL
DCA	BOS
MCO	GLA
DEN	LBF
BOD	BRU
NAP	MAN
IBZ	BHX
LAS	LGB
DUR	PLZ
MEX	CUU
TUF	STN
PDX	PSC
FCO	TLS
ADD	LLW
ORD	MSY
SVO	PEK
MRS	BOD
HPN	MCO
AKL	MEL
LIH	YVR
JJN	CGO
DUB	LIN
SEA	SBA
ORD	NAS
HAN	CXR
TSN	YCU
MEX	ZLO
HFT	TOS
KJA	NSK
PHL	IND
BHV	ISB
KMG	LXA
DLA	LBV
NBO	EDL
DTW	CAK
YHZ	BOS
WIC	ABZ
LGW	TLS
BAQ	MIA
ZRH	SZG
BRI	TSF
LUZ	STN
SEA	DTW
CRL	SAW
SNA	HOU
DOH	DXB
CGO	CGQ
CDG	VGO
PIT	LAX
ROC	PHL
JOG	SUB
KUL	KUA
TPE	AMS
CIH	XMN
SAH	RUH
CHS	BWI
OSL	WAW
VNO	IST
BFS	DBV
SAN	BLI
TAS	KGD
CIA	RAK
LHR	MIA
BRU	BHX
DUB	NTE
OVB	IKT
ORD	SMF
VCE	IST
MHD	LHE
MAN	ZAD
TYN	HKG
FNT	CLE
AUH	CTU
HFE	KHH
XMN	LZH
CDG	TAS
MIA	SCL
ZRH	TPA
TSN	WUH
BLR	MYQ
LHW	SHA
CCS	ATL
ORN	ALC
BOS	LGA
MUC	ESB
SHJ	PEW
CAN	YNZ
FLL	IAH
BKO	LIS
SLC	FCA
BBK	MUB
AYT	ORY
RIC	FLL
EWR	YYZ
PHL	CAE
SFO	RNO
TMM	ANM
MNL	HNL
TUN	PMO
BKK	LHE
MHD	ACZ
MEX	VSA
KHV	DME
ROC	ATL
DEN	SAT
MAN	AGA
DBV	CDG
SVD	BGI
CUL	LAP
BOD	MUC
KWE	TPE
SVO	HEL
FCO	GRU
MUC	CHQ
ZRH	OTP
DXB	GVA
ATH	LHR
BRS	KUN
DME	ALC
CGO	YIW
YTS	YYU
MSY	ORD
BGY	RIX
PHX	EWR
KWL	ICN
AZA	PVU
LHR	SFO
DUB	CTA
DEN	CAK
MAD	IST
DEA	KHI
AMS	PRG
SXF	LIS
SMF	SAN
LIS	BRS
BWI	PIT
PUY	BVA
UIO	GYE
ICN	SVO
FAO	LHR
JDZ	FOC
AUH	MLE
MEL	HBA
GIL	ISB
ARH	SVO
OGZ	DME
FOC	TYN
PVG	AUH
SVQ	AMS
BOS	AMS
YHZ	YDF
MGZ	TVY
BRS	ZRH
SBY	CLT
IKA	URC
AGP	LGW
DLC	SJW
CUN	TIJ
EWR	MEM
YCU	PVG
KHI	LYP
DWC	BUD
SVX	BKK
AAL	CPH
LOS	KAN
BNE	LAX
KIV	IST
AAR	BMA
HEL	XIY
SFB	BMI
LHR	DAC
JGN	LHW
ORD	ROC
TPA	ACY
EWR	MDW
LGA	GRR
LHR	AMM
THE	FOR
KEF	MUC
KWL	HKG
PTY	PEI
EBB	DOH
NOV	SPP
MUN	PMV
ICN	TAS
MCO	CUN
DXB	BCN
BEN	AMM
AKL	WHK
PDV	STN
SIP	SVO
CGB	BVH
GOQ	XNN
BLR	DOH
KRK	LBA
BIS	SFB
ADE	AUH
BLR	SHJ
KMG	LYA
OAK	SNA
PHB	THE
IAD	GSP
KBV	SIN
MHD	TBZ
SAN	BWI
UIO	PTY
BCN	ZAG
PER	ADL
SDF	LAS
CTS	OKJ
VCP	UBA
DUD	AKL
AYT	HEL
HLH	PEK
SDR	AGP
CDG	LCA
AGP	YUL
PDX	JFK
LAS	CPR
ARN	ALC
CUL	MTY
MEX	OAX
SAW	CDG
SKZ	ISB
LTN	BFS
JFK	FRA
PDL	ARN
FRA	PNQ
SKG	ATH
JED	BOM
ADB	MUC
OPO	LAD
SFO	CLE
YSB	YTZ
CMB	CGK
POZ	MUC
SKG	BSL
MEX	MTT
DBV	TXL
ABJ	CMN
HGH	KMG
KTM	DXB
SVO	CEK
CGH	VIX
JAN	DCA
IAD	YUL
LYI	PVG
SGN	SYD
PVG	MDG
PVR	SAN
DCA	JAN
EWR	KEF
MAN	CIA
YEG	YWG
VIE	DME
DXB	JED
DUB	GVA
HGH	XMN
HKG	FOC
CZL	ORN
BZR	MAN
TXL	FMM
AVP	SFB
WRO	CHQ
ZRH	FLR
XMN	YNZ
HAM	AMS
FRA	IAD
KMG	TYN
PVG	NNG
SVQ	MAD
SLC	BZN
BEN	IST
FWA	ATL
GMP	NGO
YTH	YFO
ATL	BWI
HKG	ZRH
WAW	GVA
IAH	SFO
SYX	XMN
AMS	IAD
GLA	PHL
MSP	TUL
LEI	AMS
ORN	ORY
BWI	LIT
PVR	TIJ
ERM	JCB
DLA	BRU
FRU	OSS
FRA	PRG
XMN	MNL
FRA	POP
JNB	NBO
VCP	GYN
RPR	VTZ
DAY	LGA
TGD	BEG
BMI	MCO
CPH	VCE
VIE	CGN
AEP	COR
DAC	BKK
ESB	VKO
KMG	YCU
LCA	AMM
ORN	LYS
KVA	MUC
XMN	CTU
ROV	SVO
LIM	ATL
LGW	INV
MCO	SLC
LZO	HGH
VIE	OLB
ORY	LHR
PRG	LIS
HRB	TNA
ATL	SNA
PSP	SFO
PRG	EVN
KRK	EIN
CTG	FLL
AOI	CTA
PFB	VCP
TLS	ETZ
VCE	KIV
AYT	LGW
BRU	ADB
DME	NOJ
JFK	BTV
NBO	LVI
OVD	VLC
IXR	BOM
SAW	BCN
VGO	BCN
ORD	MKE
SAN	SAT
FLL	DCA
SVO	CMN
SZX	TNA
TIA	FCO
MAD	CAG
LIS	VIE
KUN	BRS
BGI	GRU
BDJ	BPN
WUH	ZUH
MYR	DCA
SDF	IAH
RAK	BCN
HAV	CMW
CLT	BNA
WAW	LTN
BEG	DTM
RTM	ALC
CVG	RSW
ASF	SVO
LCK	PIE
GRU	BOG
PSA	BDS
AJA	BES
MSP	FCA
SAW	KCM
BLR	PNQ
BOG	YYZ
DSM	DEN
YUL	AMS
DEL	DAC
SAW	ECN
AGP	LYS
RZE	BRS
SOF	SXF
FAO	GVA
BWI	CMH
SJW	XMN
KIV	TSF
SVO	VVO
PDX	BLI
PBI	BOS
CMN	ORN
EDI	GDN
SHJ	MUX
TXN	TPE
SDF	LGA
MIA	FRA
SEA	PEK
MAN	PSA
CCS	BLA
SCL	CCP
BRU	ZRH
KIX	HEL
MUB	VFA
VIX	CAW
ECP	ATL
IST	ORN
ATL	JAX
TOS	MMK
WAW	EVN
SHE	WUX
CEK	KZN
CIX	LIM
AZA	GTF
MCO	PTY
SYD	HBA
HKG	CRK
CIA	NYO
LAD	GRU
ELD	HOT
HRB	CTU
GYE	MIA
PRG	PSA
GVA	LIS
LHR	SVG
PER	BME
PHX	HOU
STR	FRA
WNZ	CGO
PPQ	AKL
YNT	CTU
PSP	PHX
MIA	TPA
KWE	SIN
RIX	CDG
SIN	FOC
KUL	CGK
SEN	VCE
BEG	ATH
SHE	NKG
HAK	HFE
AMS	ABZ
STN	RDZ
UDI	CGH
SYD	SUV
TPE	SZX
LAS	MCO
HAN	VII
LPL	CCF
VCE	BSL
FRA	HAJ
CRL	BLQ
ESC	DTW
CKG	DOH
SGN	PVG
IBZ	BOH
HET	CGQ
AKL	KKE
VKO	KVX
JAN	MDW
MUC	SPU
IAH	TYR
RUH	TUU
NAP	SXF
VIE	WAW
YEG	LHR
BVA	KRK
CUN	MCI
FCO	ADD
SFO	YYC
XNA	DTW
YNJ	ICN
MLU	ATL
SYD	NKG
EBB	RUA
IAD	LAS
KTM	KUL
BHX	WAT
GDN	LUZ
MIA	DCA
LCY	GVA
DUB	WAW
MSP	DLH
NNG	HFE
IAH	ZIH
POM	DPS
ALB	MSS
DTW	ROC
CMB	MCT
TPE	KIX
TAB	BGI
EWR	MAN
MJV	BOH
PMO	VCE
TSN	CTU
TPA	FLL
AYT	LBA
BOD	LIL
ADD	JNB
DOH	YUL
NAO	PVG
ROI	DMK
KIX	TNA
AVL	ORD
MJV	MAD
BNA	ORD
PDX	ONT
CGD	HAK
DWC	PEE
BME	PER
BRU	BIO
WUS	CKG
VKO	AGP
GEO	KIN
KMG	SYX
ICN	KWL
OSL	ARN
STL	TUL
MPL	AJA
DXB	NCL
SIN	KCH
OAK	SEA
GGW	BIL
MEX	NLD
XIY	FOC
SVX	EVN
BUD	FRA
KRR	DME
BOS	LGB
BNC	BUX
KIV	LCA
LAX	SMX
RUH	BLR
LGW	PDL
NAG	PNQ
MSU	JNB
AUH	FCO
HSN	JJN
EZE	VVI
BKK	URT
ADL	MQL
HKG	FUK
GDL	REX
ZAG	AMS
KUF	SVX
NAP	GOA
BNE	MOV
GVA	ALC
VLC	MAD
PFB	GRU
ARN	MAN
KWE	TEN
ATZ	CAI
CAE	IAH
CTU	ZHA
BRS	CDG
FIH	MDK
SEA	LAS
NBO	MBA
TIJ	ZLO
NAY	CIH
TPA	PHL
ORD	BRU
ARN	LAX
YYZ	PHX
TIP	GHT
TYS	DCA
OAK	PDX
REL	AEP
NAP	STN
CKG	NNG
BHM	ORD
AGT	ASU
GUW	AMS
NKG	DLC
VNS	AGR
TPE	TAK
BOD	RNS
ALC	TOS
PVG	KIX
MEL	BME
PFO	NCL
XIY	WUX
HGH	SYX
CNF	FOR
TLH	MCO
FLR	TXL
BRS	WRO
IAH	PVR
CPH	BLQ
LIS	ORY
HEL	BKK
ORY	AGA
DTW	CVG
AMS	BKK
SKG	FCO
DME	SIP
MEL	DRW
SOU	LIG
LAD	JNB
SYD	SIN
MEL	DXB
ZAZ	ACE
WAW	KUT
GOJ	KUF
BKK	DOH
SVG	TRF
HMA	OVB
FRA	BIA
ELD	DAL
YVR	HKG
MSP	TYS
DMK	KOP
MAN	ARN
LTN	LCA
LYS	YUL
PPG	HNL
PUQ	RGL
LIN	BCN
ZRH	KRK
OSL	AMS
SIN	DOH
SXF	EDI
FCO	DME
MWZ	BKZ
MMU	LUK
VIE	VAR
FEZ	CMN
BKK	PEK
CUN	LIM
OSL	VIE
BOM	SAH
SHA	JNG
TRC	CUN
BRI	CDG
YNG	PGD
LCY	NCE
ELG	TMR
HAM	OLB
LAS	GRI
KUL	KLO
ABQ	ORD
IST	DYU
FCO	CGN
YCU	LHW
LAX	BLI
TSF	VLC
PXU	SGN
LST	SYD
LBA	DBV
SLC	LWS
HNL	SMF
KGS	LPL
SZG	TXL
HDG	CTU
HAM	BRN
YOW	YEG
XNN	LXA
MOV	TSV
ALC	ARN
IAH	MTY
CBQ	LOS
LAS	ICN
WJR	MGQ
AMS	ICN
VPE	LAD
BOS	CMH
HGH	BKI
YYC	YYZ
SAT	MTY
MEX	ZCL
DTW	IND
BGY	LPP
ROV	EGO
PEK	KHH
PDL	HOR
FRA	HOG
EDI	BZR
CGO	HFE
TIP	TUN
LXA	CKG
PIU	LIM
SIN	HEL
PVD	TPA
CLE	DEN
CIF	NAY
FRA	KUF
TAO	BKK
GLA	BFS
LGW	NAP
CTS	PEK
KJA	DME
PSA	EIN
MSP	BJI
SHR	DEN
JFK	CTG
VCP	LIS
LAS	ATW
KGL	DXB
EIN	ALC
FRA	GVA
MZT	PHX
SMF	MSP
PHL	LAS
VXO	ALC
CEE	VKO
CPH	SVG
LEI	BRU
GVA	AUH
WLG	IVC
BDO	KUL
YQR	YWG
CPO	CJC
CTS	ITM
CRK	DOH
JED	HYD
UFA	DYU
KUL	JOG
ATH	YUL
TPE	URC
PRG	VLC
LBV	JNB
EWR	GUA
BKK	HAN
NTE	AGP
KHI	PEW
CGK	DMK
RLG	MUC
NTE	BCN
FRA	ARN
YNZ	DLC
CIH	WUH
CFB	VCP
TCQ	LIM
PEK	DQA
LHR	BSL
FRA	KIX
PNQ	SHJ
YIC	PEK
LTN	BEG
FLR	CPH
OSL	TRD
JFK	PTY
LTN	IAS
OMA	MSP
YYC	YHM
BSL	LHR
ZRH	BRU
GLH	TUP
MEM	MIA
PHL	STL
NTE	PRG
IKA	SVO
SPU	TXL
JED	TBZ
SAW	DXB
HAM	SKG
CLT	MSY
ZRH	ARN
BSL	KRK
EWR	PHX
BOG	NVA
KSU	MOL
FNC	BRU
AZO	DTW
MDW	OAK
TUN	BLQ
TXN	TAO
PEK	HYN
CDG	BCN
ZAG	TXL
CLM	BFI
WUA	XIY
FUK	SIN
YHD	YQK
WUH	CTU
YUL	HOG
MCI	IAH
AUS	CLE
AUH	DUB
BHD	INV
CUN	CLT
BOG	CUN
FIH	NBO
ATL	RSW
BTR	ATL
ACE	STN
MUC	AMM
NBO	BZV
CLE	RIC
BJL	FNA
DXB	DYU
LHW	IQN
CPH	HAJ
CTS	AOJ
DME	SHJ
CMN	AUH
BCN	TUN
USN	GMP
DOH	BGW
EIN	NAP
CMB	FRA
POP	SJU
YOW	YQM
DCA	ROC
LHW	URC
DME	IJK
AMS	MUC
BCN	CPH
BHK	TAS
SDF	DTW
STN	KIV
BUD	LTN
PHL	GSP
VIE	SBZ
HHH	CLT
LMM	MEX
FRA	AYT
FCO	LRM
HIJ	ICN
SVG	ABZ
CKG	MFM
WAW	MUC
SYD	KTA
FLL	MSP
KUL	SRG
CGO	HGH
REC	GRU
BHX	GIB
AOJ	ICN
DRS	MUC
FKI	GOM
SFO	PVR
SKG	JKH
STR	SPU
JED	ADE
BMA	AAR
TLS	NCE
ATL	BNA
PUY	ZAG
SZX	LLF
HGH	ICN
TGO	NKG
CMH	PHX
ATH	IST
DTM	LTN
BRN	IBZ
LHR	CTU
BME	PHE
MUX	ISB
CLE	CUN
JFK	PHX
TRU	LIM
BDJ	SRG
ITM	FUK
BUD	STR
AMS	IKA
TNA	FOC
DOH	HBE
KER	IFN
KMG	TPE
NKG	FRA
DCA	HHH
ZCL	MDW
CHA	ATL
CGK	PVG
TXL	IBZ
ALC	LTN
VKO	BTK
EWR	ORD
KDI	CGK
AUS	JFK
MUC	GVA
MCO	BNA
RNO	SFO
PHL	BWI
BWI	IND
FRA	BOM
PHL	DOH
LAD	LHR
PBI	ATL
CGK	KDI
SBA	LAX
NCE	LBA
LOS	ACC
TMS	LIS
POL	NBO
HUI	SGN
LPL	EGC
NKG	TAO
PSA	STN
BLQ	CMN
KMG	KTM
PIT	BNA
CAN	HYN
NCE	FCO
IAD	MIA
HTA	SVO
CIA	SKG
OMA	CLT
LGW	ALC
ADD	JED
TUN	FRA
RAK	PSA
HME	ORN
TGG	SIN
BME	SYD
OSL	GZP
KMI	ICN
ICN	HNL
CRL	IBZ
DTW	DAY
KRT	DOH
STN	BFS
DOH	DAC
LYP	KHI
VLC	BGY
DUB	CCF
AYT	RLG
DWC	KBL
DMK	CKG
ILO	SIN
BUR	SLC
DAX	SZX
AUH	SYD
NTE	DUB
SNA	ATL
SUB	LOP
SHA	BAV
MSP	LAS
CDG	LFW
YUL	AMM
MSY	IAD
HEL	GZP
TUS	SAN
BOM	BHJ
BKO	ORY
HEL	TAY
CZX	XIY
WUH	CKG
OLB	BSL
ATL	IAH
EXT	EDI
PVG	MLE
SZX	NNG
AER	TZX
NAP	LPL
LAN	ORD
IND	EWR
BOO	OSL
HSN	PEK
KMG	CGD
PSP	IAH
MFM	KMG
PBI	ORD
TIP	JED
MEX	ZIH
MAD	LEI
SNN	JFK
JFK	PDX
ADD	NIM
TTN	CVG
DME	HEL
MUB	JNB
DXB	ZRH
ITO	LAX
NZH	HTA
TNR	MJN
NAP	TUN
HFE	TYN
CIH	CAN
JFK	TPE
LDB	VCP
VKO	TBS
SVO	PEE
LGW	IST
EBL	BEY
ROC	MSP
IAH	ORD
EBL	AMS
VXC	TET
CIA	TSR
CDG	SAW
YWG	ORD
DYU	AER
NCL	NCE
DXB	EVN
OTP	PEG
PDX	LGB
PRG	GVA
HNL	YVR
TAO	JXA
BNE	GLT
SVD	SLU
GAU	IMF
LIM	AYP
ALC	MUC
CPH	GVA
DTW	TPA
DTW	YUL
OMS	HMA
YAG	YQT
HRB	YIW
AMS	SVG
CLE	MSP
LHW	NKG
BOM	ATQ
BGO	EDI
FDH	TXL
MNL	PUS
BGY	GDN
LIR	DEN
DUB	SXF
ZHA	CAN
MAN	IST
TIP	SFA
SFO	SAN
HPN	LEB
AKL	HLZ
MYY	BTU
LIN	FRA
ORD	SDF
EWR	MYR
LHR	LAD
CGQ	NKG
CAN	KMG
FUK	KMQ
MEX	HAV
SDF	EWR
LIS	SVQ
TAK	PVG
LCA	DME
SLN	MCI
ZRH	MAD
EDI	EXT
LRD	LAS
TXL	SPU
BLQ	ARN
PVG	SWA
BOD	RAK
EWR	CLT
PVG	IKA
MAD	DUB
SVO	YYZ
OSL	LIS
WAW	POZ
SSA	MIA
BOH	ACE
MDW	MLM
BRU	LIS
BNA	YYZ
OLB	VCE
GZT	IST
SLC	OMA
AEP	EQS
SYX	SWA
MCO	ORD
JUV	JAV
DLC	XIY
JED	ADA
CVG	SFO
CDG	DXB
YIW	XIY
ORN	HME
CGD	KMG
TNA	RMQ
TUN	BEY
LYS	PIS
YYZ	LGA
ZUH	LZH
CHQ	LGW
MUC	BRE
KWE	HKT
MAN	HAJ
DTW	ABE
AKL	HKG
ONT	IAH
KUN	CAG
DYU	SHJ
BZE	CLT
HKG	HKT
DUB	BRE
CNS	TSV
FRA	SIN
PBI	ISP
KTW	KUT
LIS	TUN
DWC	KRT
AJU	REC
SJJ	STR
CAN	TXN
VKO	SVX
GRU	CGB
SJL	TFF
TLC	CUN
MSO	MSP
SAW	BSL
MJV	BHX
LGW	BCN
MLW	ACC
RTB	BZE
FLL	AXM
BNE	POM
IST	MRS
AYT	BRS
YYZ	MDT
XIY	YIW
NCE	RNS
GVA	CTA
CWB	GPB
KUL	NNG
AVL	CLT
NCE	WAW
SYX	NNG
KMJ	ICN
ASP	SYD
ENU	ADD
SAV	BOS
MCO	SEA
NAP	PRG
ZRH	LYS
KGL	LBV
YLW	YYZ
DCA	CLE
CEK	FRU
GDX	KHV
TSN	KMG
SHE	YNT
BUD	BRU
GRU	THE
FLL	STI
RAK	LTN
PNS	ORD
FCO	MIA
OMA	LAS
LEN	BCN
LAX	PHX
JJN	HGH
PTY	SDQ
MAD	NTE
TIV	BRU
TLS	MAD
ORY	ARN
SAP	LCE
MIA	LIR
AMS	CMN
WMN	SVB
HET	XIY
SLC	GCC
LAX	RNO
KRK	SVG
MRS	VLC
SGC	SVO
DBV	LBA
KUA	KUL
STN	CGN
DAY	MCO
KSC	LTN
SJO	BOG
EBB	JUB
CTG	JFK
CJB	BLR
TJM	NJC
MPM	POL
FLL	CLT
BEG	BRU
PVG	MEL
DOH	IAH
MBA	FRA
BCN	ORN
CGN	DME
LGA	GSO
MEX	SAT
SVO	UFA
EDI	PRG
UNG	HGU
SLC	BIL
GRX	LCY
CDG	ABZ
SKG	STN
XIY	NAO
EDI	KRK
SVG	WAW
WUH	TPE
KWE	BFJ
LHR	TLS
TSN	XNN
EWR	SFO
DUB	KTW
YKS	IKT
MRD	CCS
ADA	JED
TUN	SXB
MJV	EIN
KMI	TPE
PFO	NYO
CAG	CIA
MNL	YVR
VKO	NSK
SEA	JFK
YHZ	MCO
MRS	SXB
WAW	GDN
SFO	PEK
DEN	FMN
HAN	FRA
KJA	KRR
SHE	LYA
SIN	CTU
BCN	CTA
LIS	CGN
CAI	ATZ
GRU	LHR
OLB	RIX
SJW	CTU
AGP	BRE
DUB	HAM
RUH	BEY
ICN	PVG
MEM	MSP
ATH	RIX
OTP	SUJ
HRB	WUH
DAC	CAN
FCO	LGW
HPN	HYA
DTM	SOF
KHV	PEK
OLB	ARN
FCO	VCE
BCN	DUB
CAN	URC
FCA	SEA
UYN	TSN
NCE	VCE
AYT	GRZ
ONT	DEN
SKP	BGY
NYO	PFO
NGO	NGS
JED	RAS
HKG	MLE
ARN	TRD
MEL	MGB
NCL	ALC
YDF	YYZ
CCU	GAU
VLC	PSA
BRI	VCE
CPH	HAU
WAW	VIE
BCN	BGO
PEK	YCU
TIJ	AGU
CIA	BTS
VIE	VCE
EXT	AGP
LPL	LCA
CRD	AEP
AGP	SVG
AMS	STR
DOH	ADE
VCE	LTN
MIA	CNF
DUB	HEL
NAY	ACX
ISB	URC
MAN	GIB
YBP	PEK
AEX	IAH
BVA	BCN
SBZ	MUC
WMI	STN
HKG	TNN
ARN	SDL
FDH	AYT
MAN	AMS
ABZ	BHD
TRW	MAJ
IAD	MUC
FLN	CCM
ARI	ANF
SGN	HKG
MPM	DUR
DEN	MAF
LYI	SZX
CGO	MFM
PHX	DSM
AMS	CTA
AQP	LIM
OAK	PHX
MAN	ACE
OTP	OMR
MTR	EOH
ATH	DXB
MDZ	NQN
MFM	SIN
WUX	CKG
TNA	SZX
MAD	RAK
LYS	TLS
GDL	VSA
SAW	VAN
RTM	TLN
ATL	JAN
KHI	DEA
SAW	CGN
ARN	SFT
JFK	RIC
CNJ	ISA
PDX	GEG
HAK	ZHA
LHR	ORY
OGG	SAN
AGP	CRL
IST	BEN
PEK	LGW
PVG	NKG
TXL	ORY
TNA	WUH
NCU	TAS
FUG	XMN
EWR	POP
CLE	IND
MKE	SFO
CAI	LHR
ATL	LIR
SIN	HAN
UFA	KZN
HTY	ECN
AGP	STN
KIX	HKG
MLI	ORD
DCA	IND
ATL	SAP
DXB	LOS
OSL	VCE
DTW	SAN
ORD	ELP
SOQ	MDC
VIE	RIX
CMN	NCE
DBV	HEL
IST	NBC
MLB	CLT
CHS	MDW
VVO	HKG
TUN	NTE
KZN	SKD
MEG	LAD
LTN	MAD
SXF	AGA
ZCO	SCL
GLA	EXT
FAY	IAD
DLC	HFE
CMN	MUC
GRU	MGF
BRS	LIG
DEN	BFL
FRA	KRK
WIL	WJR
PHL	BTV
HAM	GWT
BCN	AMM
BRE	ALC
LIM	FLL
ANR	LCY
URC	SVO
FUK	PUS
AMS	GRU
LGW	HAV
AKL	LAX
LHR	GLA
KTM	LXA
YYC	LAX
GNV	TPA
NYO	CRL
MCO	BUF
VLC	CDG
HKG	HAN
GSP	EWR
FCO	DOH
SOF	PRG
FSD	DEN
CMH	TPA
BRI	TIA
DOH	TUN
PMR	HLZ
FOC	WUH
ZIH	TLC
HYD	AUH
DUB	RIX
LGA	CHS
LHR	BHD
GOP	DEL
JED	ISB
SHE	LYI
KAN	JED
KHI	IKA
FLR	MUC
BOM	AMM
GYS	CAN
CGK	JED
DME	TBS
BNE	SIN
TUN	DKR
LYA	PEK
CUU	MEX
HNL	ORD
LLA	UME
IBZ	BRU
MEX	SLP
TSN	FOC
DXB	ATL
WNZ	TPE
CNF	IPN
HOG	MAN
CDG	BRI
ARN	LLA
VIE	DXB
AUH	JNB
IOS	SSA
CUN	AMS
LIM	ASU
SJW	CKG
JED	MUX
PPT	AKL
VLC	BVA
CMN	DXB
IBZ	AMS
SDD	VPE
YCD	YYC
ACC	TML
IKT	OSS
TMP	HEL
VNO	CHQ
LSC	CPO
HAV	HOG
GDL	MZT
LBA	AMS
EDI	CDG
YXU	ORD
WNR	ULP
JED	LXR
DTW	SBN
OSL	MJV
AMS	DXB
SCL	YYZ
BGY	ATH
BWI	MIA
ATL	BTR
JED	BEN
OTP	TSF
PVK	LGW
SXF	DUB
TLS	LHR
STN	AOI
MSP	ORF
STN	TUF
HAN	CDG
HFE	YNT
CAN	HKT
LXR	RUH
WAW	ZAD
EBB	AMS
FOC	TPE
NAG	DEL
SVO	BRU
PVG	MWX
RUH	LHR
JAX	ATL
MAD	TIP
WNZ	CKG
GOA	TIA
YQU	YEG
SIN	DEL
LAX	PRC
CAN	IST
ATM	STM
CMN	LYS
NNG	SIN
CNF	MIA
TPE	MNL
MIR	ORY
BRI	FLR
PTY	JFK
NBX	AMQ
BNE	ASP
BOM	DXB
DEN	GCC
ATH	SOF
ZRH	IAD
PNK	CGK
CLT	RIC
ZAD	HAU
SDF	DCA
DTW	PVD
FCO	PEK
FCO	VLC
MBJ	AMS
NGO	KUL
LPL	SXF
MCO	PHL
ICN	CRK
DTM	AGP
VIE	LYS
MDW	LGA
LIS	DME
DEN	PHL
DEN	JAX
PSA	ORY
VCP	THE
PHX	DEN
STR	LHR
ATH	EDI
GRR	MSP
HRB	TSN
BKK	KHH
MCO	RIC
ORD	YQR
CNX	MFM
CDG	BGF
CIH	TSN
ARN	AJA
ZRH	DOH
HET	CAN
SEN	DUB
INH	MPM
AUX	BSB
AUS	LAS
BKK	CKG
RMQ	XMN
CLE	ATL
DEN	MCI
MCT	JED
DTW	SJU
MLE	DOH
RXS	MNL
ABQ	BWI
AGP	BUD
BGO	LHR
CNX	CKG
FAT	PDX
OSL	ALF
DEL	IXD
GSO	PIE
SFO	FLL
XIY	KMG
NAY	JUH
MBT	MNL
LJU	TGD
PIK	IBZ
RAK	CIA
SZG	HAM
OTP	LTN
RIC	CLT
NKG	ICN
BSB	JPA
UIO	HAV
LAD	SDD
AGP	BSL
MIA	EZE
GUA	IAD
SFB	BLV
HKG	CNS
OGG	SMF
XIY	SHE
GWT	FRA
GRU	AJU
GWT	ZRH
YNT	TPE
TXL	MAD
TSF	CRL
KMG	KOW
CLE	FLL
ALB	MCO
PNZ	CNF
MSY	CLE
ACC	FRA
DME	NCE
OWB	SFB
HGH	KWE
KJA	IKT
ATL	BMI
YHZ	YYC
AMS	ATH
MBJ	PHL
EDI	IST
FLL	AUA
CUN	PIT
OSS	SGC
BCN	NYO
BIO	ORY
GMP	TSA
AUH	KRT
EXT	MAN
PDX	LMT
KUF	GOJ
URC	KRY
TUN	JED
ATM	BEL
GDL	TIJ
LGW	FNC
SHL	CCU
SNN	WRO
BKK	WUH
CCJ	SHJ
EWR	PVD
SGF	SFB
SVX	HRB
NAP	LGW
SVQ	DUB
MAD	VLC
BRU	ATH
HYD	BOM
HAV	LIM
FAO	AMS
OSL	AAL
MIA	CMH
OSL	BRU
PDX	OKC
GDL	PVR
CGN	HAM
ZRH	SOF
PSA	MUC
BCN	KTW
EVN	CEK
PIT	CDG
DEN	COD
WRO	ORK
CDG	IAD
PUY	ZAD
ATL	DCA
MFM	FOC
BCN	LBA
VCE	MUC
MSN	EWR
DKR	IST
HEL	ORY
GYD	NBC
SVO	ARH
PER	ALH
PTY	TPA
LAX	UPN
GYE	MAD
ZBF	YUL
MTY	CUN
MIA	POP
AAL	BCN
BGO	AYT
MHD	AZD
ORY	VKO
BSL	FRA
PED	DME
KMI	ITM
UEL	BEW
PEK	VKO
JFK	CLE
GRR	IAD
IBZ	VLC
YYZ	ROC
FRA	LIN
SGC	DME
IAH	PTY
MOB	ORD
DUB	SDR
BHY	KWL
ITM	NGS
CHS	IAD
VAS	IST
ADB	STN
ICN	OKJ
XIY	JGN
PIK	FAO
ATH	TIA
TPA	ZRH
KTM	CTU
HAM	BCN
CUN	BWI
ORN	BCN
SFO	LAX
KIV	MUC
LHE	BKK
MCO	DUB
BKO	OUA
OPO	NTE
SXF	FCO
ROV	AYT
LIT	LGA
BSB	MAB
FCO	SXB
NOJ	UFA
AYT	SAW
VLC	IBZ
ATH	KVA
SHE	FRA
PRG	KSC
MBJ	BWI
FEZ	CRL
PEK	TAO
LHR	SAN
NAS	EWR
YEG	EWR
TXL	NAP
TLS	HAM
HOU	SNA
CGO	TSN
ROC	JFK
PER	BKK
DUR	LUN
LJU	BRU
HBE	SHJ
AKJ	NGO
PER	ZNE
DEN	MEM
STM	TMT
TTN	MCO
JFK	NCE
OTP	CTA
HAM	ATH
GRI	LAS
LAS	MIA
STW	SAW
MAO	PMV
EWR	GLA
CCJ	DOH
RAO	GYN
IAH	GDL
TJM	EVN
MNL	RUH
MAN	PHL
PVG	BKI
HAJ	STR
EDI	ALC
YZF	YYC
LAS	YYC
PVD	EWR
PEK	LHW
PSA	NYO
FLR	AMS
ADU	MHD
FMM	NAP
WAW	BVA
CLT	YOW
BLQ	TUN
GMP	USN
BWI	CLT
SYX	ZHA
MFR	LAS
BHX	BCN
BKK	UTH
ABJ	DKR
AMS	ORD
SPU	CDG
ASU	AGT
CTS	SDJ
HYN	SZX
AMS	TRD
OSL	HAM
RUH	RAH
OTP	SOF
TLS	XFW
JNB	FRW
DKR	OXB
TRF	OTP
GDN	OSL
DEN	PSC
NAY	WUA
BOM	CDG
EWR	PHL
ORD	MHK
SAN	IAH
PEK	FOC
NSN	AKL
TYR	IAH
HKG	MUC
DAY	CLT
STL	LGA
BHX	DUB
BEY	KAN
SOF	AGP
IAG	MYR
ZRH	BRE
BSL	CPH
EZE	PTY
NAY	HET
DXB	TUU
PVG	SEA
JAX	BOS
MEL	DPO
WUH	HGH
DCA	BDL
YEG	YHM
JNB	BKK
NNY	HGH
LHE	MCT
CDG	AGP
MFM	TPE
GSO	SFB
JEG	JAV
GDN	MUC
HFE	LHW
PER	BKI
IKA	AMS
XMN	TSA
SAH	CAI
BOM	AUH
KUL	IKA
CMN	BZV
IKA	KBL
CTU	KRL
PVG	FCO
AMS	XMN
WGP	DPS
AXT	ITM
KRK	LPL
ADD	ASO
PDX	PDT
PRG	RTM
SVO	OSL
BVA	WMI
CGO	SHA
GSP	BNA
ORD	DEL
MCT	PEW
SEA	PVG
SYR	BOS
EZE	CCS
MAR	PBL
CRL	VNO
EWR	CUN
ADD	RUH
MSP	ISN
HKG	CDG
FOR	THE
IXJ	BOM
MAB	BSB
HKG	NNG
RBA	BVA
COO	BKO
IND	MIA
CCM	VCP
FDH	HAM
NOU	SYD
LCY	FRA
SIN	PVG
TIP	AMM
CNX	KMG
LYA	CAN
BCN	GRU
CLE	SYR
TXN	DLC
DAX	PEK
KTM	AUH
AUA	AMS
BNE	NTL
RSW	PIT
CTU	HAN
MIA	KIN
YUL	CDG
WRE	WLG
BOS	STI
LGW	BRI
ISP	BOS
GRU	GYN
RIX	IST
VCE	GVA
SYD	TMW
MCO	BWI
ASM	CAI
SHA	JJN
PMF	CAG
GZT	ECN
PLM	SIN
PSM	SFB
SVO	OMS
VCP	PLU
DLC	WUX
VPS	DCA
TIJ	LAP
BOI	DEN
RSW	HPN
HAM	DUB
LBA	BUD
SAW	FRU
YUL	GVA
CPR	SLC
BOI	ORD
SBW	MYY
MUC	ZAD
HAV	CCS
HRB	KIJ
SUB	DMK
NBO	TNR
PEK	MDG
VCE	HAJ
GYS	PEK
SYZ	DXB
JED	LAX
ZRH	PHL
VUP	BOG
DSM	PIE
BRE	EDI
PVG	HIJ
REC	NAT
DWC	KZN
ADA	ECN
DEN	XNA
JED	CAI
STL	SAN
ATQ	DOH
DMK	KBV
AUA	ATL
DNZ	SAW
SLC	PHX
DMK	WUH
CNF	CGH
BCN	MAN
LGA	DTW
MVD	ASU
CTU	TAO
MYD	WIL
NCL	ORK
MRS	TNR
CAI	EBL
YNZ	HKG
RAK	CRL
FDH	CGN
CGQ	TSN
JST	AOO
OSL	CHQ
NAY	KHN
RIX	CPH
MNL	BCD
PVG	KWE
JFK	LHR
ICN	JFK
FNC	BSL
GDN	FRA
AZA	GRR
LHR	KHI
AGP	AMS
YYZ	DCA
PHX	ORD
DUB	ADB
HEL	CEE
HEL	OUL
TWU	JHB
SXF	BRS
JFK	PEK
DCA	ORD
AER	DME
MUC	SFO
DOH	OTP
BFJ	KMG
TSA	GMP
AAR	CPH
EWR	YTZ
BHB	BOS
PMC	PUQ
FRO	KSU
KRK	WAW
BGO	PRG
PEK	MFM
TIA	ATH
SAL	ATL
PFO	SKG
FEZ	PSA
WAW	VNO
BOD	SVQ
EXT	BHD
BKK	DAC
AMS	SXF
FAO	GRQ
DUB	RDZ
MIG	LXA
ORD	BZN
HFE	XMN
ZRH	LAX
SYD	ASP
NKM	KMJ
IND	IAD
JPA	BSB
JED	HTY
FWA	ORD
AES	BGO
NGO	FUK
SNA	DEN
DUR	GRJ
AKL	NOU
ALC	BHX
TYS	PGD
ADD	CDG
BKK	CTU
ZHA	HKG
SZX	WNZ
SAW	TIA
PMO	NTE
CZM	CUN
KUL	BKI
YIC	SHA
CGN	ZAD
YUL	ORD
MEM	MSY
SRG	BDJ
MSY	IAH
IAH	CZM
JFK	AUS
UIO	ETR
TPE	NGO
BKG	HOU
KEF	JFK
WHK	AKL
ALC	BLK
FEZ	EIN
FAT	SLC
SLC	DTW
SRQ	CLT
BCN	BGY
STN	RAK
XFW	TLS
DEN	BKG
BAL	ESB
YQR	LAS
YYZ	ICN
SSA	AJU
DEN	CMH
PNQ	BLR
PHL	BHM
PUF	MRS
KGA	TSH
BKI	SZX
SVO	MAD
BSK	LYS
MAD	LAX
OVB	MUC
KMI	NGO
PHL	EWR
CWB	SSA
FLL	PTY
FLL	SAL
CAN	FOC
MOC	PLU
HAN	SGN
RIX	ABZ
SVX	IST
ICN	DEL
RIX	WAW
YKS	PEK
ENY	CKG
KTW	CHQ
YBP	CAN
HAV	SDQ
MIA	DTW
KRR	VOZ
PIT	BDL
AMM	DWC
HSV	DEN
BRU	FIH
YUS	XNN
UPN	LAX
DLC	HDG
BRU	FRA
NNG	HAK
AGP	CMN
VNO	DME
ORY	TUN
BRS	PFO
UME	BMA
YUL	JFK
VIE	SPU
BIO	TXL
SUB	CGK
CGN	RJK
RSW	MKE
BEY	CAI
CUN	MEX
AKL	PPT
IAD	BDL
BRS	FCO
VIE	KSC
CUN	EZE
MIR	GVA
VNO	CPH
CTU	WUH
IST	JED
RUH	KHI
ACE	ZRH
DTW	SWF
OLB	NAP
MIA	EWR
ORK	GLA
HKG	AUH
SAT	SFO
CTU	KWL
CLT	CHA
DXB	HYD
FCO	LCY
AEP	CWB
MCO	FLL
HRB	IKT
PVR	YEG
SFB	BTV
LYI	PEK
GVA	FLR
LAX	EUG
ALC	BFS
HYD	COK
NSN	PMR
NAS	MIA
CVG	IAD
DLA	CDG
ORD	LAN
OLB	BLQ
PTY	HAV
DEN	HLN
JIU	CAN
HLZ	CHC
FNT	TPA
YNJ	TAO
LGB	AUS
CTA	ORY
BEG	WAW
PUF	CDG
YVR	CUN
DBV	ARN
MAD	EZE
EDI	LIS
DYU	KJA
CAI	LXR
ATQ	SXR
BKK	GAU
PMV	CCS
FOR	JPA
PNQ	CCU
ZHA	PEK
DRW	ADL
PHX	ANC
IDA	AZA
EDI	ARN
SHJ	DME
ICN	VTE
MRS	BIA
GEG	BOI
BLQ	CRL
PEK	NAO
ATL	MCN
SGN	DXB
HAM	BHX
CLE	DTW
PMO	NAP
ARN	MUC
XMN	ICN
MEX	CEN
SAP	JFK
LAD	TMS
MFM	PEK
HNL	ANC
LAX	YYC
MBA	KGL
SUB	BDJ
OSL	PSA
AUH	BEY
EWR	PDX
LAX	LHR
AGU	CUN
YYZ	LHE
ATL	SGF
POA	MVD
PDX	ABQ
TNR	CDG
PSP	YVR
BNE	ROK
YYZ	YQR
CAN	CDG
BOD	CDG
FLN	EZE
ELS	DUR
UCT	VKO
BSL	ALC
LIS	LHR
SAN	FAT
OGL	BGI
PIT	JFK
HVB	SYD
FRW	JNB
NCE	BOD
BNE	AKL
ATL	LAX
LPL	WRO
BCN	TXL
BWI	BHM
SVO	CTA
KWE	CAN
SAL	MGA
RHI	MSP
BOO	TRD
GDN	GLA
SIN	KHH
TUP	ATL
JIB	NBO
KTW	NYO
ABZ	AMS
CAG	TSF
XIY	ICN
FCO	JFK
RAK	ZRH
MAN	CTA
CGB	CNF
BRN	LCY
CHC	SIN
MDW	SJC
MDG	PVG
KTM	DEL
NGO	GMP
HAJ	ADB
HKT	SVX
LAS	MSY
LHR	YOW
FLL	MYR
CDG	GYD
ANS	LIM
INV	AMS
MEM	ELD
STL	FLL
SAV	DTW
CMN	TSF
BSL	MUC
ADD	LFW
HEL	SVO
AEP	RSA
CCF	PIK
SSG	COO
OSS	OVB
FNA	BJL
PIT	HOU
OTP	KIV
MRS	CAG
MAD	DOH
PHX	YYZ
ACC	AMS
SFO	IAH
CPH	SVO
DME	VIE
PSA	BUD
GTF	SLC
OSL	FCO
SXF	STN
SOW	PHX
VIE	AMM
ADE	SHJ
MCP	BEL
BFS	GLA
BKO	CMN
JAX	DEN
HAJ	CTA
AYT	TZX
CUN	PTY
SAW	BEY
BSB	BEL
SCL	CCS
FAO	ORK
YTY	PEK
PHX	SFO
FCO	EZE
LIN	AMS
AGF	ORY
XMN	MFM
BCN	MAD
ORD	CID
BEG	TIV
LIS	BVA
MTY	QRO
TSN	CGQ
MAD	MVD
AYT	FMO
CMN	ARN
NCE	AJA
LAX	ASE
NBO	CAI
BSL	KEF
MLI	AZA
VIE	IAD
BRU	PEK
CLT	LAS
PVG	NDG
CIA	BUD
IKT	VVO
SAW	SJJ
STN	PGF
PMO	TUN
GYD	URC
CAI	JED
UNG	DAU
ATH	DOH
JED	KAN
LGW	CGN
AEP	RGL
TXN	ICN
BSB	SSA
PDS	MEX
BHX	BRU
GYD	ESB
ORN	CZL
LAN	DCA
LAS	DLH
MCO	PSE
NCE	LGW
JDZ	XMN
CMN	TTU
AOO	JST
SWA	SYX
AAE	IST
YFC	YYZ
VKO	BUD
GYD	BUD
TAO	NKG
ARN	MHQ
LSC	ANF
PIE	DSM
PSA	BCN
VOZ	DME
HKG	JFK
LZH	PVG
CLE	IAD
BYC	SRZ
GEO	MIA
DTW	GSP
CIH	TYN
MAD	SVO
SFO	MSP
HPN	ATL
ORD	CUN
DCA	MYR
KIX	HGH
MUC	DXB
MIA	GRU
NCE	LIL
TOY	PVG
KMG	XMN
RFD	PIE
MTY	MEX
BRU	PRG
PRG	TSF
LFT	IAH
CTU	NNY
STN	EGC
LBB	DEN
LIS	NCE
BVA	OPO
GVA	MRS
YXL	YHD
DXB	HBE
LHR	AUS
GYD	OMS
MBA	IST
CDG	AUH
JAX	LAS
PGF	STN
DUB	IBZ
YYZ	YDF
FCO	TIA
CGO	HRB
MJV	LTN
NBS	SHE
AZA	BIS
ESB	HTY
CLO	PSO
BNA	AUS
MAN	NTE
KWL	WNZ
SVO	NBC
NER	VKO
LAX	MMH
FCO	LHR
KKN	ALF
AZA	BLI
HSV	IAH
CMB	DWC
ATL	DSM
GDL	MTY
MSP	YWG
AES	VNO
FAT	PHX
SVX	PEK
LAQ	TIP
LZO	PEK
XNA	LAX
WLG	HLZ
DXB	FRU
CDG	SVX
PEK	MNL
CNS	PER
SDR	ACE
KTM	HKG
URC	PVG
KJA	TGP
VNO	BRE
STN	LDE
HKT	UTH
DUB	BTS
RUH	DAC
DME	DYU
ZUH	CZX
YHZ	FRA
CAI	TUN
SFO	AMS
TPE	VIE
DSM	PHX
RUH	CMN
ADB	STR
HUN	TSA
CGN	VCE
KBL	DYU
SRE	TJA
ICT	LAX
BQL	BEU
SUB	MDC
GAU	BKK
CPH	BSL
NTE	RAK
EVN	KUF
RAO	GRU
BFS	LPL
ICN	HRB
PHX	TPA
MCO	OMA
SJU	SDQ
HMA	SVX
FOC	KHH
SFO	MSY
KAN	KRT
BIO	STR
ATH	CGN
SXB	LYS
EWR	HOU
LGB	SFO
AZA	CID
CLT	GSO
MUC	FRA
URC	CGO
VCE	BHX
DTW	ELM
EDI	SVG
HBE	JED
NTE	FCO
ONT	PDX
HFE	TXN
JFK	DOH
NCE	LTN
DCA	OMA
EIN	RAK
MCI	EWR
NTL	SYD
LAX	YLW
BKI	TWU
KDH	DEL
YNT	TSN
MIA	MAO
DUB	NCL
SSA	CPV
KGS	KRK
FRA	CMN
LTN	WRO
IST	URC
XIY	YNT
BKK	IKA
GRU	SDQ
ACE	BLK
KRK	EDI
TDD	SRZ
CVG	DCA
AQP	LPB
BGY	SKG
ATL	GSO
MDW	OMA
KRS	TRD
ADL	SYD
NQN	MDZ
MZT	LMM
VVI	TJA
WUZ	ZUH
BCN	BRI
NAP	MUC
DYU	URC
YYZ	KHI
FCO	TUN
INV	SYY
NBO	LOS
KOJ	HKG
MBL	MDW
CUN	SLP
MLE	PVG
DWC	BEY
ADB	CPH
LGW	LEI
PDX	SAN
BUD	DTM
CDG	ICN
GDN	EIN
JNB	MPM
MUC	AMS
NJC	OVB
STR	AYT
FRU	SGC
MDW	ONT
ADB	HAJ
AAQ	SVO
KRK	SVO
FLN	BSB
SWF	PIE
WMN	ANM
OSL	DOH
TIP	HBE
LCY	ORY
SYD	SCL
XMN	SZX
KEF	ALC
SBN	AZA
DNH	XIY
RES	AEP
HMO	TIJ
VIE	TUN
EDI	NWI
EVN	DXB
VNO	AES
EJA	BOG
LHW	TPE
EYW	FLL
DEL	BHX
CRL	SVQ
TRD	MQN
MCO	LGA
LCA	BUD
ORD	LAX
TBS	ATH
ARN	FAO
LAX	SBP
NPL	CHC
BOS	MDW
URC	DYU
TET	JNB
ADD	COO
BRA	SSA
PHL	TYS
WAW	SPU
VST	ALC
ADB	ECN
HDG	DLC
PLZ	JNB
CCU	VTZ
HNL	ITO
RAP	AZA
ALC	NCL
YYZ	YXU
RAK	DLE
EWR	ORF
SAP	TGU
KMG	SIN
GIB	LHR
GDL	CUN
UIO	MAD
ISB	CJL
SFO	ORF
JNB	ACC
SAH	KRT
JNU	ANC
SNN	WMI
CDG	BOD
KHN	CTU
SAW	IKA
HFE	SZX
AAT	URC
DUB	PRG
VIE	TBS
NZH	HET
PIS	STN
CPH	LGW
BRU	SAW
JFK	BUR
POM	HKG
MUC	CMN
NAP	BSL
NPL	WLG
LJU	MUC
AMS	STN
MSL	ATL
PMO	MAD
MUC	FLR
PEW	LHE
LFW	OUA
LYS	MUC
LIS	FCO
DLC	CKG
SVO	HKG
MUC	RUH
EIN	VLC
TRD	ALC
LAD	ADD
PCL	TPP
SVO	MUC
XIY	HGH
YQL	YYC
AER	KZN
TLN	ORY
NOJ	SLY
MZT	TIJ
EIN	CCF
SPU	BHX
PNS	BNA
PSP	SLC
CMH	MIA
LIT	MDW
SFB	KEF
MBJ	FRA
BOG	MCO
BIA	NTE
KIV	CIA
VNS	KTM
CVG	MIA
KUL	USM
HAN	HKG
SCW	VKT
JNB	JFK
HMO	MXL
IST	AYT
SHJ	CJB
CZX	NAY
BHD	LBA
KUF	OSS
RSW	CVG
VVI	PTY
JIB	IST
BRS	FNC
SIN	HGH
GIS	WLG
NIM	CDG
SHJ	HYD
OGX	ORN
CGN	BCN
LUQ	AEP
KCH	SBW
AUH	ISB
BJL	CMN
PTY	BLA
SVX	OSS
HAU	CPH
ALC	OSL
TNW	UIO
SHJ	BEY
DLC	TYN
SHP	SJW
ZUH	KMG
TLS	LIS
VOZ	EVN
BCN	DOH
AEY	RKV
MDG	ICN
TNA	KHN
HEL	VNO
MAD	MEX
GRZ	VIE
VCE	OLB
ESB	BGG
NKG	KMG
LAS	OMA
BLQ	IBZ
RSW	PVD
LCA	LPL
BOS	FCO
DAY	ATL
ARN	PSA
NYO	ALC
REL	EZE
OSL	DBV
ANC	BET
STR	BRE
MIA	FCO
ADE	BOM
DME	MAD
YTY	XMN
PEK	TPE
CDG	EDI
PRG	LYS
LHW	PVG
FAO	CDG
SVX	GOJ
DME	BKK
EWR	BOM
GDN	EDI
TRD	BGO
VIE	IST
CNS	AKL
JFK	PSE
OSL	CDG
MAN	ABZ
IAH	DOH
GRZ	MUC
ZHA	CKG
TRD	KEF
ORY	AJA
LCA	WAW
DTW	AMS
VKO	PFO
NAP	OLB
STM	ATM
LAS	ORD
AUA	PHL
SJC	SAN
CDG	CTA
IAH	LIT
CMH	PHL
FRA	BIO
CHS	MIA
BSL	TLS
SXB	AMS
SVO	NJC
EIN	AGP
SPP	VPE
CPT	LAD
HKG	CTS
CIF	TSN
PNS	DCA
YXC	YLW
DEN	BDL
UIO	LIM
MEL	PER
MFM	WUH
YLW	YXS
TXL	BHX
AGP	BOD
MUN	CCS
DTW	RIC
IST	WAW
CAI	ATH
HAM	FAO
DLC	HGH
JJN	HSN
CLO	MAD
MCO	YYC
MRS	BRU
AJA	LYS
MAD	AMM
ILO	DVO
LAX	YUM
ATL	ICT
FRA	LIS
ADD	ENU
LGW	JED
DUB	LIS
LTN	AYT
FCO	CMB
OAK	MDW
CRL	SOF
HAN	PXU
CKG	TSA
KCH	JHB
HOU	CHS
CFR	LYS
LOS	FNA
TNA	ICN
AVL	FLL
MCO	NAS
SVQ	CRL
STN	SVQ
CLT	EWN
TQL	SLY
ATH	BUD
RSW	ATL
DUB	DBV
MSP	BWI
LGW	ACE
PVG	FOC
KHV	HKG
LIS	MIA
LAX	SYD
ORD	CDG
LGW	SAW
DOH	CRK
ABQ	LAM
BGO	TRD
LAS	LBB
OPO	LYS
WAW	PEK
MDW	SAN
DXB	LHR
VNO	SVG
ARN	BLQ
LTN	DUB
KWE	URC
HEL	BUD
BOS	MKE
ZRH	CAI
STL	BWI
PHX	ZIH
LHR	DOH
RMI	KRR
VIE	GRZ
SZX	CGO
LHR	YHZ
BOM	EWR
FRA	SSA
SBN	PGD
NNG	LHW
NAS	KIN
ASU	VVI
TSN	TPE
DME	KGD
ICN	IAH
MAD	CDG
ADB	BSL
SHE	NBS
CIH	HAK
NAO	KMG
FLL	BOG
MAD	GRU
CLE	BFD
LWN	DME
MFM	HGH
YLL	YYC
TNA	KMG
BZR	BRE
NTE	FLR
RAK	MRS
OGG	LAX
MEL	KGI
MCI	DAL
ATL	HSV
YYZ	ATL
UIO	MEX
TIA	PSA
BRI	CAG
PMO	PSA
SKZ	LHE
ABZ	LBA
IBZ	FRA
LBA	ACE
MSY	MCI
CHS	DTW
HJJ	CAN
YYZ	POP
PHL	LGA
ZAD	CRL
PEK	SWA
VNO	SVO
PSA	NCL
IJK	SVX
ISG	TPE
JFK	IAD
MKE	TPA
KLX	LGW
CIF	SHE
ROV	BUD
AMS	NCL
BGO	CHQ
BUR	PHX
LBA	DUB
STN	ATH
HFE	CAN
SOU	DUB
OSL	KRK
IST	AMM
ITM	AXT
CMH	BWI
AYT	TXL
CGK	BWN
DEN	SMF
MIA	SDQ
GWT	HAM
PSA	LHR
CDG	LHE
AHB	CAI
BKI	DPS
NZH	OVB
INN	AMS
PVD	SAN
NER	IKT
PHX	YEG
DRW	ASP
BRS	MUC
MAN	SKG
CZM	CLT
TNR	SVB
ABA	DME
CAI	ADE
FRA	FLR
HAN	CTU
FOR	LIS
TOS	BOO
COS	LAS
YNJ	PVG
IST	OSS
CDG	ABJ
EWR	MSY
LIM	CJA
EWR	OMA
MAN	DOH
JFK	PBI
CMB	DEL
SEA	YYZ
CDG	JFK
BOM	MCT
NBO	ZNZ
LYS	SVQ
REC	PNZ
NCE	CDG
TXL	ZRH
PPQ	CHC
LLA	SDL
DUB	VIE
ORD	GDL
RAK	CGN
BCN	DXB
MDW	CMH
ZYI	PEK
SYR	EWR
IQT	PCL
WUH	KWL
CHQ	BRS
PIN	MAO
JFK	PWM
KRK	DTM
TNN	HKG
KHN	SHE
CCJ	DXB
LOS	CMN
TUL	IAH
RAK	BHX
ORD	CMI
SZX	WUH
LAD	FIH
ACE	BRS
LAX	BOS
DME	VRA
NTE	SOU
JNU	PSG
EBB	ASM
SHA	HKG
GDN	MAN
SKP	IST
IAH	PNS
VCP	IOS
SJW	KWL
IAH	PHX
KGS	CGN
PIE	LCK
MDW	SEA
ZUH	NNG
EDI	BRS
ZVK	BKK
MCT	ISB
TAK	ICN
CLE	RSW
BOG	LPB
PEK	JIU
EDI	WIC
ASR	AMS
TOB	TUN
DUB	RZE
POA	VCP
SHA	ZYI
CKG	PVG
JFK	KEF
BRD	MSP
BEL	STM
NTE	MUC
MCO	MIA
WMI	CHQ
MSP	TUS
CPV	SSA
EWR	PTY
ZRH	LCY
FAO	BSL
NZH	IKT
DKR	CMN
EDI	MUC
OVB	VVO
HRB	ICN
OLB	FCO
BIA	HAM
ACC	OUA
SPU	STR
BGW	BEY
WRO	TRF
AUA	JFK
KEF	FRA
IKT	OVB
CHC	SYD
BTS	LTN
DKR	BKO
PDX	HNL
TGU	SAP
TGO	PEK
MUC	PVK
KTM	IST
RIC	MSP
YVR	PHX
PVG	OKJ
CKG	KHN
EDI	LYS
HBE	TOB
RZE	STN
ICN	HGH
DOH	EBL
PSA	SVQ
TPE	KUL
BCN	JFK
ATH	BGY
RAP	LAS
SEA	STS
DXB	OVB
SGF	DEN
SOU	BES
JFK	BUF
DME	OVB
PUS	TPE
BRU	IAD
BRI	MST
HVB	BNE
IST	FRU
XNA	CLT
ESM	UIO
BSL	MPL
VAR	SOF
CKY	BKO
AAE	ORY
TNA	SHE
SNA	MEX
BIL	PDX
ATL	CUN
YLW	YEG
BLR	KUL
XMN	JDZ
ABJ	CKY
JFK	DEL
VRC	MNL
OPS	BSB
DME	CAI
PIE	IAG
LHR	DTW
WAW	BRU
BCN	HAM
CUU	CUN
YXX	YEG
KTA	PHE
AUH	BGW
KTM	BOM
BSL	SKG
YXE	YYZ
SHV	LAS
SWF	PHL
ABZ	KOI
SYX	KWL
AMS	BRU
WMN	TNR
BWI	SJU
WUH	KWE
ROV	SKG
AKL	PPQ
DXB	SEA
MDW	ORF
MEX	CZM
IAH	SLP
REX	GDL
CLT	YYZ
LLW	LUN
BHM	MCO
HRB	NZH
BNE	CHC
NCE	AMS
DME	RTW
MVP	VVC
EVN	SVX
ANC	FAI
FLL	CPH
YYC	YKF
WSZ	WLG
KGL	BJM
AYT	AMS
ARN	BRU
BNE	NOU
YCU	NKG
SYD	HVB
NAP	LTN
HAK	KWE
WLG	TUO
LHE	OSL
MSY	DEN
WLG	ROT
BUD	CGN
HNL	PHX
SLC	TUS
HEL	DME
VKO	IST
CUN	MDW
BOG	AXM
URT	DMK
CGO	ZUH
AMS	FRA
STN	CHQ
CAI	TIP
IKA	EBL
HAV	MEX
BRS	WMI
XNA	EWR
YVR	SEA
MAN	BFS
IAD	CLE
MAD	LTN
AUS	SFO
GDN	BGY
GYD	CDG
MNL	TAC
CBB	LPB
AUS	SMF
OMS	SVO
HOU	MSY
CTA	FRA
SVG	EDI
PEK	YKS
MEX	MTY
BOG	PEI
LCY	FCO
BOS	RSW
JKL	KGS
DEN	MSO
YYT	LHR
IST	GZT
LAS	BUR
DEL	JDH
CGO	ICN
ATL	CAK
PFB	POA
CGR	CWB
CGO	PVG
NGO	MYJ
EBL	SHJ
SHA	MFM
BOG	HAV
LAS	CMH
SVQ	LYS
KHH	NKG
MIA	SAP
SPD	RJH
TUL	MSP
EDI	BHD
IQQ	ARI
HGH	SJW
BCN	TSF
SHV	DEN
LAS	TUL
FCO	YYZ
KWL	CZX
USM	HKG
EZE	FTE
BKK	CGK
MDW	BNA
CAN	NNG
PLU	VCP
GRU	YYZ
FRA	LEJ
RLG	AYT
TUF	OPO
IAD	DXB
CLT	IND
NSK	SVX
TPE	CDG
BEW	POL
GVA	MUC
FLO	CLT
DEN	MSY
CGB	OPS
JED	PEW
DME	KRR
BNA	DEN
STI	PTY
KMG	HGH
RAS	MHD
CXR	HAN
BAV	NAY
DTW	JFK
JXA	SHE
KIX	HNL
JLR	DEL
IST	BGG
BGI	JFK
NNY	SZX
ALB	OGS
AEP	REL
WLG	NPL
RIA	URG
JNB	CDG
LGA	MKE
LAD	MSZ
MSY	DTW
BGY	OMO
OSL	GDN
MIA	CWB
JFK	CVG
PGD	SPI
YQQ	YEG
TSF	BRU
HAM	BSL
BTV	DTW
HOU	EWR
SVG	TOS
MUC	PRG
CFC	JCB
CRM	MNL
ESB	AYT
PHX	LAX
FRA	FAO
DBV	ATH
HEL	ALC
CDG	OVD
MSP	BDL
TRO	GFN
STW	DME
BOS	HYA
ATH	JKH
JUB	ADD
SAL	GYE
IST	KRT
YQT	YXL
SVO	LHR
SFB	OKC
EDI	KEF
JNB	ADD
PDL	LGW
LIL	AGA
KRK	TXL
CVG	MEM
AUS	FLL
VKO	FRA
EUG	SLC
IST	AUH
XIY	PEK
DEL	MUC
ICT	MSP
SHE	FNJ
ORD	SUX
CAI	SHJ
BUF	PHL
CAI	RUH
HAK	NKG
MUC	BEG
DTW	CDG
RIC	LGA
ATL	SYR
ORY	ALC
BGR	DCA
MAD	ORD
ZAD	WAW
CLO	CTG
FRA	DBV
BIA	NCE
HOU	JAN
FIH	BNB
LAD	SPP
DCA	MCO
SIN	RUH
MKE	FLL
CCS	CDG
NBO	LLW
DXB	ACC
MCO	MDW
MMK	TOS
FAR	ATL
JTC	VCP
SMF	ORD
KKC	BKK
LGW	KLX
TIA	IST
HKG	TYN
TUU	DXB
KTM	CCU
LEJ	FNC
LIT	BWI
CEE	KGD
CLE	MCI
DBV	TRD
SLC	OKC
TAO	HET
VGO	BIO
ICN	TOY
KIX	NKG
KEF	EWR
DWC	SVX
HAJ	CDG
BDO	PKU
MBS	ATL
LAS	PSP
BGO	BCN
STR	SVO
DME	ROV
VTE	SIN
SVB	DIE
JFK	BOG
LHR	WAW
GVA	FRA
RTB	MIA
KUL	TPE
LHR	TXL
DME	OGZ
SKG	KLX
LEJ	CGN
BHX	NCE
CTS	TOY
JXA	TAO
URC	CTU
HAV	SNU
VTE	ZVK
ADL	KGI
LEJ	BCN
LGW	TOS
BMA	HEL
SIN	KUL
PEG	STN
MSY	SFO
PUS	CAN
HFE	CTU
HKG	SHE
PMR	AKL
FCO	KIV
FUG	PEK
FUG	SHA
KSY	SAW
SXF	AMS
PLM	DPS
NAY	NZH
ACX	CAN
JFK	LAX
SCL	ARI
CGN	IST
LHW	NNG
HTA	NZH
HRB	JNG
YCU	TYN
GDN	AMS
MCT	SYZ
BNA	PHX
BTS	BHX
SOF	TXL
BLR	COK
SOQ	AMQ
ORY	BLJ
MVD	CWB
IST	BSL
SAW	AMS
WIN	TSV
YSB	YTS
ATL	ORF
AVA	CKG
STN	LEI
DLC	LYI
OKC	LAS
IST	IFN
RDZ	STN
PEK	TXN
CDG	DKR
DTW	MYR
IAS	OTP
JFK	GUA
BRU	BOD
LTN	PRG
MEX	BOG
PHL	DCA
VIE	IAS
DTW	ATL
CCJ	MCT
SJO	GLF
PHL	ERI
GZP	IST
BUD	TXL
XMN	CGO
MEX	SAN
PEK	JNG
HRB	KHV
OUL	ARN
FAR	SLC
TYN	CTU
SXF	AYT
MCT	CAI
LRT	ORY
DWC	AMM
CLT	DCA
ROK	MKY
AUA	FLL
MAN	VLC
HOU	PIT
SVX	HKT
NTE	MRS
CUN	BZE
GDL	OAK
URC	SHA
VKO	JFK
CTA	VIE
CUN	MAN
KMG	NKG
DYU	IKT
YYC	LHR
MCT	HYD
IAD	MSY
MUC	VCE
BLQ	ALC
CDG	BSL
SIN	MFM
BHV	KHI
SVQ	RAK
ABE	PHL
MUC	BRS
JFK	MUC
CUN	CLE
CMB	DAC
JQA	JAV
FUK	HKG
SYD	HNL
VIE	HAM
BNA	EWR
BIA	ORY
SIN	SZB
WRO	BRS
DXB	KUF
CPH	AYT
PEW	KHI
MEX	MIA
MNL	MBT
KMG	ZUH
RPR	HYD
KGL	LOS
BDL	PIT
YPW	YVR
PVD	ORD
PIT	BWI
GLA	WAW
UTH	CNX
JJN	CTU
IAH	CCS
AVP	ORD
SHA	TYN
YWG	YQK
CCU	IMF
VIE	CHQ
AYT	MAN
ORD	FNT
KHI	BKK
DTW	BWI
ATH	ORY
IAG	SFB
BKK	ADD
NCE	OSL
DAL	SFO
LHR	JNB
CLE	CLT
FOR	SLZ
YXS	YLW
KGD	DME
PHX	HNL
ALC	AES
CZX	TYN
GRR	ATL
SXF	KGS
CGK	MEL
VIE	JFK
EIN	CIA
KRK	VIE
MNL	CAN
ALC	UME
ELP	HOU
SHJ	SVX
SHA	HDG
KHN	CAN
SHJ	UET
HKG	NKG
SVO	DEL
CVG	BDL
SEA	ICN
IST	AAL
DPS	ADL
LAS	ANC
FLL	BQN
BWI	SAT
BFV	DMK
YYC	ORD
PHX	DRO
HRE	LUN
CGQ	CGO
NST	DMK
KRR	SVO
YCU	CKG
DUB	YYZ
ARN	ZRH
GVR	PLU
SNN	STN
KEF	IAD
GDN	BGO
ABE	ORD
COO	CDG
CAN	YCU
TUL	MDW
CMN	RUH
LST	MEL
YYC	YOW
CBR	MEL
BIL	GDV
DTW	BMI
SPU	MUC
LAO	MNL
ISB	YYZ
ATL	OKC
PHX	ABQ
PMO	VIE
PVU	AZA
ZYI	XIY
YYZ	DXB
WAW	HEL
LEJ	VIE
JUZ	XMN
PMO	SXB
KWE	WNZ
ORD	MAD
DPS	MOF
LIN	OLB
AYT	KSF
PHL	CVG
DBV	LIL
LHW	TSN
MEX	LAP
CTG	BOG
NAP	PMO
FRA	BGO
CPT	LHR
KAT	AKL
KRT	SHJ
AGA	LYS
SLC	EKO
VLD	ATL
HAM	AGP
PRG	KUF
CAK	MCO
DLC	HKG
HKG	SGN
AGP	VLC
BWN	DWC
ICN	HEL
STL	EWR
CZX	DLC
BWI	CVG
PMO	STN
YUL	MIA
MIA	YYZ
GRU	AMS
DEL	IKA
CRL	OTP
JFK	PHL
DYU	MHD
CZX	CKG
COK	HYD
STN	ZAD
AYT	BRU
MUC	GWT
MCO	KIN
KUL	DRW
ACE	BOH
BTV	ATL
MLM	MDW
NZH	HRB
AMS	PDL
LXA	XNN
XMN	JIU
FOC	NKG
BVA	MAD
SBY	PHL
DEN	TUL
CAI	IST
STV	DEL
BKK	CEI
YTZ	YQT
SVO	IAD
IRP	FKI
LAX	BFL
SGN	AUH
SYR	LGA
CPH	SFO
BVA	OTP
PEK	IAH
SIN	KUA
SMF	DEN
PEK	ZRH
FOC	PVG
BLQ	WMI
PDP	ROS
BCN	STN
WAW	AGP
FNJ	SHE
KTA	SYD
LOS	ATL
BLQ	AMS
LAD	CAB
TXL	BIA
GEG	PHX
IDR	BLR
IST	OVB
STV	BOM
MPL	FCO
TNR	ANM
CLE	MKE
FCO	GLA
SNN	PIS
BCN	NTE
AHN	BNA
URC	KRL
LYS	BLQ
NYO	WAW
NOV	VPE
SLC	LAX
BGY	SXF
FCO	GOA
AGP	LIS
ATL	MLU
GRJ	JNB
BKK	JNB
CGN	ZAG
HGH	MFM
XIY	URC
DBV	ORY
BGY	BTS
YYZ	FCO
SYX	SJW
DMK	SZX
YVR	YWG
COS	ATL
TSN	ICN
LGW	YYZ
BTK	VKO
ZRH	LAS
TAO	NDG
SJJ	LJU
BZE	SPR
CAI	ASM
TLC	PVR
BSB	BRA
CKY	CDG
CGO	YTY
PRG	WAW
LAS	LIT
SXF	LYS
CGN	AMS
BUD	OTP
RDZ	CRL
LBA	IBZ
ZRH	OLB
RAR	AKL
YYZ	TPE
SIN	CRK
CLT	DSM
TZX	IST
FRA	MCT
ALC	ZRH
SPR	BZE
BGO	HAU
HET	PEK
BUD	NYO
YQM	MCO
WRO	AGP
ORN	LIL
DAU	UNG
YOW	YYC
AAE	CDG
BSL	MAD
OPO	BLQ
NBO	DXB
YHD	YQT
BLQ	LHR
ATH	CPH
ORN	CDG
MOT	MSP
DLC	ICN
ZRH	TXL
KIN	SDQ
SLC	MCI
LPB	SRE
SYZ	RAS
PDX	RNO
KUL	BLR
MIA	JFK
LCE	RTB
SYR	PIE
SZX	NKG
TPE	SIN
PHL	SAT
BFJ	KWE
CSG	ATL
DAL	ELP
FRA	INN
ACE	BCN
STL	LAX
NNG	PEK
ZRH	PVG
SJJ	ARN
XIY	ENY
OPO	SXB
BWN	BKK
SKP	LJU
ACE	SVQ
FRA	JFK
SLY	NYM
EGO	GOJ
BRI	MUC
TUL	ORD
MYT	MDL
GRU	LIM
FNT	ORD
BCN	CMN
XMN	TAO
YQM	EWR
JNB	JED
PGF	CRL
CLT	MEM
BGY	PRG
DLC	KIX
HAM	TLS
PHX	PGA
CNF	PTY
KLO	MNL
CPH	BKK
CAN	HAK
IFN	IST
TXN	SZX
REC	PTY
TPA	CMH
LFW	CDG
GVA	MIR
BEY	JED
KIV	AER
CAI	BEN
KZN	DME
AGP	VST
CGH	GYN
SFB	BIS
YEG	LAS
DTW	CHA
BOS	DCA
CNX	PVG
CGB	CGR
VIE	TIA
GFK	LAS
IXS	GAU
SVO	IKA
SUB	HKG
ALC	HAU
PVR	IAH
GVA	BEG
OSL	BOO
CVG	PHL
TSV	MKY
VIE	BEG
JFK	RSW
FNA	LGW
UET	PZH
PXM	MEX
VCE	CGN
ALC	SEN
NWI	EDI
LHR	RJK
ELM	PHL
CZL	GHA
EWR	GSO
PVG	CGQ
KRK	ARN
URC	NKG
WAW	JFK
BIA	GVA
TPA	PBI
MLE	FRA
HSV	IAD
MUC	GDN
VKO	UCT
ARN	TOS
ROS	COR
BKK	USM
EWR	FRA
OSS	KZN
SHE	JXA
MDT	DEN
DUR	HLA
EIN	BCN
PIT	MIA
STN	DUB
BEG	NYO
AMS	TPE
BRN	VIE
CGB	MGF
AMS	ACC
LHR	OPO
EWR	MCO
TJA	BYC
DLA	LOS
PEK	HAN
KLO	ICN
HSN	NAY
MAD	NCE
CLT	SDF
CAI	ZRH
SFB	OWB
CDG	ORK
LOS	BKO
XNA	SFB
ADB	EZS
LPB	IQQ
CLE	MCO
VPY	MPM
BKI	PVG
SAV	ORD
WEF	SHE
EWR	ROC
IST	IAD
KUN	EDI
CHS	PHL
MAN	DBV
BOM	JAI
CTA	ZRH
DAC	CMB
LIN	CDG
CKG	WUH
BTJ	KUL
ATL	ALB
SSA	MCZ
MSP	LHR
ATL	MAD
AMM	MUC
STR	ESB
BNC	GOM
SFO	SNA
BUQ	JNB
TJM	NYA
TPA	ALB
LAS	AMA
MIA	SSA
MDC	CGK
CYP	MNL
DUB	EIN
UFA	NOJ
NKG	SWA
BHX	IBZ
YUL	YQM
ORY	MIR
NCE	IST
AEP	SLA
WLG	DUD
NAP	AMS
BGO	KEF
TIJ	HMO
AUS	SAN
IST	TBS
KGS	LEJ
TPA	EYW
CGN	ALC
LAX	CUN
MDT	SFB
CPH	BCN
MRS	EIN
HMO	CEN
INV	BHD
ZAG	LHR
BLQ	IAS
GVA	CAI
TAS	LHR
FAO	DUB
BHX	LYS
LAS	FAT
IFN	KER
BEN	JED
HAK	TPE
SJO	MEX
RZE	WAW
OTP	FCO
ZRH	LGW
STN	ADB
CGB	ROO
MCI	BOS
CID	ORD
VCE	PRG
ACC	KMS
BCN	ORK
CUN	YYC
SYZ	IST
ZYI	CTU
KOI	GLA
DEL	TAS
TYN	LHW
KUL	MCT
CLT	TTN
ZRH	STR
CGN	EDI
CLT	AVP
HRB	PVG
GRU	BCN
SXF	TRD
ISG	NGO
DEN	YQR
NKG	KWE
CUL	GDL
HKG	SYX
BRU	LEI
BRE	MAN
MCI	LGA
AZA	ATW
LJU	LTN
GMP	PEK
CDG	PRG
XMN	CZX
BRU	DKR
ACC	DXB
EZE	MEX
BOD	YUL
ORK	AMS
KHH	CAN
TYN	XIY
STS	PDX
YQG	YTZ
TIJ	CUU
SYX	SZX
SSJ	OSL
OKC	EWR
DME	AMM
FRA	SPU
CAN	PVG
OUL	HEL
PVG	CGK
TMP	BGY
YVR	YCD
MUC	SOF
MAN	CAI
LYS	SXF
ORY	DCM
TIJ	PBC
LTN	AGP
ZHY	PEK
GDL	CUU
BEY	SAW
KIN	JFK
CGN	SPU
XMN	TXN
PRG	NAP
XIY	PUS
MAD	SVQ
YYC	AMS
BCN	BSL
SAW	BUD
CTU	JNG
SCL	ASU
BNA	PHL
ATH	LGW
EUG	SFO
SVQ	LIS
SHA	SHE
AGP	FCO
HAK	XMN
JFK	VCE
TNA	CTU
SOF	AMS
MIA	BHM
BEY	CMN
MUC	GOA
ORY	ATH
SGC	UFA
CGO	BHY
LCA	CDG
SHA	SZX
BRU	BLQ
LAS	HNL
YYB	YYZ
AGP	GLA
BOD	DUB
ZUH	WUH
CUN	DTW
PVG	BKK
NYO	BZR
PPT	LAX
LTN	LIS
IBZ	ORY
XMN	HAK
SYZ	MHD
LIS	OPO
SZX	HSN
IAH	PSP
ARN	CHQ
CHQ	ATH
KIX	SGN
SIN	PEK
NCE	STN
GDN	HEL
HAK	SIN
BIO	DUB
DTW	GRB
TUS	SFO
CVG	PIT
PGF	NTE
SEN	BCN
AMS	CTU
LBB	DAL
HKG	KOJ
CAI	GVA
FRA	FNC
HFE	PVG
JOG	PKU
CRL	ZAD
CGQ	ICN
EXT	RNS
YOW	YYZ
VKO	PEK
NWI	AMS
YYZ	CMW
MCI	PHX
YUL	SNU
BRS	MAD
CDG	ADB
TSR	DTM
CIA	BRI
FLL	IAD
CCF	LPL
PEK	TAS
NCE	BSL
IBZ	TXL
PER	SYD
DOH	MNL
SAW	BLQ
HRB	JMU
SLY	SVX
PTY	SJO
YYZ	BCN
FUG	XIY
LIS	DLE
SWA	CAN
CHS	EWR
LAX	CMH
MSY	PHX
LFW	LBV
JFK	ARN
SMF	JFK
IXD	BOM
CLE	LAX
FRA	BUD
PTY	CUC
SHJ	SYZ
URC	SZX
TBS	BUS
TGD	FRA
ZNE	PER
PTY	MEX
ABV	CAI
SKG	DME
KRK	AGP
BCN	LIS
HGH	NNY
DCA	CRW
GYD	PRG
DME	SLY
SHA	TSN
CAN	LHW
IAH	PEK
IQT	LIM
NCE	BFS
ALH	PER
BKK	FCO
CDG	JED
ADB	ZRH
HYD	RJA
CDG	BOG
XMN	HGH
OLB	NTE
BOI	SEA
JFK	OSL
HAN	TBB
DME	KHV
MDW	ATL
FLN	GRU
HNL	KIX
ATL	TLH
EDI	SDR
CTU	FOC
MTY	PBC
PVG	ZHA
UET	SHJ
TYS	DEN
HAM	ACE
HNL	SLC
GLA	STN
HAK	FOC
WWK	MAG
TSN	HAK
MRS	FCO
IDA	DEN
MAN	LAS
KWE	XMN
SYD	MKY
SYX	WUH
HEL	DBV
GRU	AGT
MNL	CRM
SFB	LCK
IAH	BFL
HKD	ITM
YEG	YYC
HNL	MAJ
MNL	PAG
RAK	MAN
BGW	ESB
WUH	LZH
PRG	STN
CLE	TPA
BUF	BWI
ZIH	IAH
SNU	YHZ
EUG	OAK
CGN	SJJ
MTY	MID
FNI	LTN
IAD	CLT
ZHA	SWA
ATL	STR
HAN	MFM
IAD	PTY
CTU	KTM
KHH	SGN
DEN	PDX
TSN	NGO
MSP	IAH
CGK	TPE
ATH	SKG
GRU	MVD
IAH	CLT
STR	ATH
CHQ	TSF
PVG	ZUH
ZAG	OSI
SIN	ADL
SZX	PVG
LHW	SJW
HKG	NGO
DME	STW
NCL	DXB
BNE	MKY
MIA	SDF
CAI	JNB
IAD	BRU
SEA	MSP
ATH	TLS
EWR	YOW
NNG	NKG
PVG	BHY
IAH	STL
KRT	ADD
BOS	PHL
KRK	STN
ZRH	NCE
IBZ	HAM
LTN	MPL
ORN	AAE
PDX	LAS
MUC	SIN
KIX	SFO
KJA	IAA
AJA	GVA
SUB	JED
CHC	NSN
RDZ	DUB
CHG	PEK
NCE	MAN
IAH	ONT
LIS	ACC
XMN	ZYI
MIG	XIY
MFM	NNG
CUN	IND
DEN	OAK
SVO	LJU
VIE	RTM
AGA	SXF
IAD	IST
CDG	HAV
DME	CXR
FRA	SVG
LAD	MEG
SRQ	JFK
CAN	NKG
CPH	GZP
YYC	YXS
BOG	EJA
SAT	CUN
GRU	DOU
SAV	JFK
CDG	CMN
CGQ	WUH
CKG	CGQ
BRS	FAO
YYZ	MKE
GVA	OPO
VII	HAN
IAD	SDF
CPH	SKG
CZM	MEX
MUC	BCN
GRJ	CPT
CLT	JAX
CGK	MDC
SJC	MDW
GVA	EDI
STN	BRI
CPH	PRG
FLL	LGA
PEK	VVO
CNS	ASP
SEA	OAK
HOM	ANC
OSL	PLQ
BOS	SEA
CGN	BLQ
TSV	MEL
BOD	MAD
CTS	BKK
MSP	RSW
RSW	DCA
NKM	AOJ
DOH	MCT
MDW	ZCL
PIA	ATL
OKC	MSP
ORY	TOE
SLC	EUG
PUS	TYN
DEL	AUH
PMO	CDG
SJW	KHN
SPU	ZAG
HYD	DEL
KLO	PUS
PUS	KHH
KHH	MFM
APL	POL
GRU	BPS
PEW	KUL
TSR	OTP
CGH	RAO
LIS	FAO
MEX	CCS
BIA	CDG
NBC	SVO
FNA	ACC
BSL	BCN
BZV	CDG
TXL	FLR
AGP	LPL
PNS	MIA
BCN	AGP
ARN	OSL
DTW	HPN
ORN	MRS
AMS	EBL
LAX	LAS
ORY	BSK
DME	TGK
YYZ	SFO
DWC	SOF
JNB	MUB
ARN	ORY
FOC	CGQ
BLQ	AGP
ORH	MCO
THX	KJA
CHC	ROT
SUB	AMQ
CAI	SXF
DUB	FRA
IAH	JAN
TAS	KUL
LYS	CZL
PEK	YYZ
SXB	MPL
NGO	HKD
ORY	MPL
PRG	ZRH
FRA	BHX
HAM	ADB
BIL	MSP
PHX	IAH
AER	SVX
IXE	DOH
KRR	SKG
SOF	CDG
USM	SIN
XMN	JUH
BSB	AUX
UTN	JNB
HNL	SFO
SBA	PHX
PHL	BCN
CDG	LIN
JFK	DUB
HFE	KWL
ETZ	MRS
FRA	ATH
SJO	IAH
DEL	KTM
NKG	CIF
ADL	DPS
SHE	CGO
FLL	TTN
SVG	AAL
BNE	TSV
DTW	MEM
LVI	LUN
DTW	XNA
WAW	NCE
SEA	EUG
CLT	MOB
KRK	SEN
BOG	EWR
BYC	TJA
CLE	MDW
FRA	SEA
LAS	YUL
DYU	DME
GRU	MCO
LYS	PUF
XMS	TNW
PBI	DCA
GOA	OLB
JED	SYZ
KMG	DLU
KUF	DYU
ARN	LHR
AQG	XMN
CDG	SFA
BLA	MIA
KRK	HEL
SVO	GDZ
SDJ	CTS
BHJ	BOM
YYB	YSB
LGW	RAK
EWR	MUC
LAS	CLT
MAN	MUC
KEF	SXF
SHA	LZH
BSL	CTA
LAX	MRY
EWR	BUF
TNA	XMN
UFA	SHJ
DKR	COO
HLN	SLC
TSA	PVG
BCN	PSA
SIN	TAS
ADD	JUB
MCO	ATL
ORD	LAS
GRU	UDI
ACE	CGN
ORN	MAD
HAM	IBZ
KGD	CEE
YYT	YOW
JFK	YYC
IAD	BGM
MYR	YNG
SMR	BOG
JFK	FLL
OGG	SFO
HPN	ORD
LJU	TIA
LIS	FRA
DXB	HKG
CMW	YYZ
CAI	CMN
KUL	FRA
SBN	DTW
PEM	LIM
ORD	ALB
LZH	ZUH
LRM	YHZ
SHJ	RUH
AGP	IST
DUB	IST
LHR	MAD
LTN	WAW
ORD	LIT
CAI	KRT
BRE	IBZ
NGK	KHV
CHG	DLC
ACE	OVD
BDS	GVA
SHJ	KTM
EBB	ADD
STL	PVR
ZUH	CKG
DXB	AMS
TJA	SRE
IAH	VCT
VCE	YYZ
AMS	BRN
ORY	AGF
KUL	AMS
BTK	IKT
NJC	SVX
NBO	JUB
SNN	ALC
SYX	KHN
DLC	TPE
SHE	YVR
MSP	PDX
GLA	LCY
EWR	PWM
DTW	CUN
ENU	LOS
EWR	LIM
KOW	XMN
RAO	PLU
FAR	PIE
SEA	FCA
BSB	CWB
PQQ	SYD
BDS	EIN
JAX	DCA
VTE	BKK
SNA	PHX
CKY	CMN
CTU	JUH
MVD	LIM
JNG	SHA
KWL	NKG
VVI	EZE
TUN	ORY
CMN	FIH
DLC	YTY
EDI	LHR
BOD	LTN
GRZ	ZRH
CIA	CHQ
CLT	MEX
BLR	JAI
JNB	BOM
SJW	SHA
TYN	SHE
SKG	CPH
BDJ	JOG
BAQ	PTY
TBS	VKO
FRA	YUL
BLQ	BDS
MJT	AMS
KOE	LOP
YYZ	LGW
TNR	ORY
KEF	EDI
BCN	PIK
LIM	PCL
HAJ	MAN
IST	VKO
AMS	NBO
LNJ	KMG
VCE	JFK
SKG	LCA
SRZ	BYC
AMS	BRI
IQT	TPP
ATL	MLI
MID	VSA
IAD	BNA
SVO	KUF
BRS	RZE
NAY	JUZ
CLT	STL
EVN	VKO
IAH	MGA
DOH	JNB
CKG	TXN
CVG	CUN
AMM	BOM
CKG	HYN
CGK	BPN
SHE	CKG
ACC	LFW
AMS	YUL
LGW	AGP
SXF	CAG
SHJ	SAW
YYJ	SFO
ACE	HAM
KEF	GLA
ATL	RTB
MEM	LAS
TIJ	MLM
NAG	SHJ
VLC	OTP
NSI	DLA
DKR	CDG
BSB	CDG
XIY	HAK
LYS	BLJ
PHL	NAS
LBA	KGS
BGY	ACE
LTN	ZRH
BNB	MDK
BRU	ATL
HGH	TYN
ADD	JIJ
GOJ	NSK
BHD	SOU
SOF	BVA
ABQ	LAX
FTE	EZE
TXL	FNC
CGN	RAK
STL	IAH
LHE	JED
MEM	DEN
TRD	KRS
DOH	KHI
BNE	CNJ
SAH	DXB
BGO	AES
IKA	FCO
BOS	SLC
OSL	SSJ
DBV	BRU
FOC	TAO
BGY	ALC
CTU	LXA
MTY	DTW
EWR	PVG
CAN	PEK
FRA	BLQ
SUB	BDO
SHJ	ADE
NNY	CGO
SDF	MDW
IST	DNZ
MPM	TET
AMS	VLC
CPH	HEL
DEN	RKS
NBC	IST
CRL	MRS
KRK	BRS
PLQ	RIX
RUT	BOS
ERZ	SAW
IND	PHL
CAN	CKG
NBC	DME
ALC	STR
ORY	BCN
YUL	PHL
FOE	ORD
ATL	BSB
BOS	STL
LRM	AUA
YYC	PVR
BHX	DXB
JIB	MGQ
RNO	ORD
LIS	HOR
MGF	LDB
KMG	CNX
AMS	AUA
ORD	DEC
BCN	EWR
SJU	IAH
KHI	IST
ORK	MUC
HRB	HFE
YUL	PVR
SYX	CAN
CTS	NGO
UIO	MEC
SDF	CLE
KUL	LHR
DTW	MSP
BDL	MCO
DEL	ZRH
ONT	OAK
COO	LOS
CUN	HMO
SOF	LCA
PEK	CNX
WUS	XMN
KRR	AER
IBZ	LCY
CCS	BRM
PIK	CCF
NYO	POZ
BCN	BJZ
ATH	KSO
EWR	SAV
MEL	LST
BCN	SLM
BRS	EGC
BOS	SJC
NDG	NAY
LYS	LIG
ITM	HKD
TRF	LUZ
FCA	DEN
TUN	LAQ
IST	IKA
BOS	CAK
JFK	DXB
YYC	CUN
HOU	SAN
ARN	LIN
CGN	RLG
MRS	AJA
KHN	LYA
LIT	HOU
INV	LGW
CPT	DUR
FRA	PDL
ACE	LTN
KEF	CDG
LGW	TRF
ORD	RIC
FUG	CAN
DXB	LYS
MSP	MLI
SZX	DMK
LAD	VHC
AKL	BNE
IBZ	BSL
MSY	BOS
BOI	PHX
ABJ	NBO
BEY	MHD
GRU	MAO
TIJ	QRO
BRU	BUD
NBO	NLA
ALC	TXL
PRG	TXL
ATH	GVA
YIW	HRB
MEL	DEL
ESB	MSR
DCA	STL
UTH	DMK
JFK	HNL
CAN	CTU
DJJ	CGK
VLL	BCN
MKE	MSY
FRA	GYD
ALB	ORD
AKL	KAT
IAH	ICN
CPH	BRS
FRA	HKG
UFA	TJM
PEK	LZH
PIT	DEN
CDG	CUN
WUH	LYI
DRS	FRA
BWI	ABQ
SAP	SJO
YAG	YQK
LGW	NTE
KMQ	SDJ
NAP	HAM
GRU	OPO
CMB	IXM
EZE	GRU
DPS	POM
SYD	PER
RKS	SLC
BJI	MSP
CCS	BNS
BVA	DUB
TPA	SJU
SKG	VIE
DXB	BGW
KEF	SEA
TUO	WLG
IBZ	BRN
HOU	MCI
ICT	LAS
HMO	GDL
CLT	AUS
LAS	FCA
ARN	LIS
IAH	MCI
LUZ	LTN
SAL	LIR
BDL	DCA
KIN	MBJ
PBI	IAH
TPP	PCL
BEL	SLZ
HFE	TPE
COO	NBO
IKT	ULK
CFC	CWB
RSW	EYW
JFK	AMS
CAN	WUS
LAX	CDG
MEX	AMS
BLZ	NBO
IND	TTN
CGR	CMG
ABZ	SVG
SIN	BLR
RSW	DEN
MFM	CGO
BSL	DUB
YYZ	OPO
FRA	NKG
COK	AUH
YZY	XIY
YEG	KEF
DEN	YYC
BFS	BCN
BOG	BAQ
BNA	CVG
BGY	TIA
IBZ	BCN
GDX	IKT
NYO	KTW
DME	BUS
FCO	DBV
SAH	BEY
AMM	IST
MEX	CLT
STN	DTM
PIE	RFD
UDR	DEL
KGL	MBA
ORK	FAO
MIA	BWI
PEK	MIG
LIS	MPM
TLS	NTE
RSW	IND
FCO	OPO
CPE	MEX
PEK	SIN
RIX	VNO
ORD	HKG
DOH	ISB
JDZ	CTU
KRS	AMS
PHL	PHF
PRG	OTP
STR	KGS
BNN	BGO
BOS	RIC
YXS	YVR
FRO	OSL
SGN	FRA
KIX	HAN
FRA	KEF
ULP	WNR
MKE	STL
LGB	SLC
CPR	LAS
BEY	IST
GRU	CMN
ICN	HKT
DPS	KOE
TPE	HKG
CZL	NCE
TSA	NNG
LAX	SAL
DUB	VNO
HAN	PVG
WAW	BUD
LAX	FCO
FCO	BEG
ARI	LPB
HPN	DTW
UFA	PRG
SPD	DAC
DXB	CAN
EIN	TSF
DJJ	NBX
FNA	MLW
CJC	LSC
CGN	TUN
SYX	XIY
YUL	BDL
TAO	PEK
DOH	EBB
CMH	CLT
TXL	KRK
HYD	JED
HRO	MCI
ATL	KIN
DBV	WAW
FRA	YHZ
COK	SIN
CUN	YEG
UFA	DME
SHA	NNY
HGH	KHH
TOE	TUN
CBB	SRE
IBZ	CGN
ISA	CNS
LGW	OPO
MAN	LHE
AFA	AEP
SOF	MAN
AGA	ORY
DLC	NKG
IST	CGN
BEG	BUD
GLA	DXB
LGW	ARN
BOM	CCJ
MIG	SHE
NAY	HSN
JBR	STL
KWL	KMG
ADF	ESB
ZQZ	SJW
DXB	ISB
ICN	CAN
MDT	IAD
ASP	PER
BLR	BOM
AKL	DUD
JED	SIN
BSL	CDG
MAN	YYC
STL	PIT
EDI	BOD
SHJ	LHE
BEG	SKG
ITM	MYJ
POZ	STN
CTG	PTY
BWI	BNA
BOM	FRA
YYC	YZF
STR	SJJ
VCP	CGR
BFN	CPT
RIC	ATL
ORY	BKO
SAT	PHL
MCO	FNT
CPH	RAK
CTS	FKS
USH	AEP
VIE	MAD
MSO	LAS
HNL	PPG
PUF	LYS
BTV	PHL
BEG	GVA
TAS	IKT
ORD	FRA
JIB	DIR
PTY	YYZ
JAX	BNA
CAN	AQG
ADB	HTY
RUH	ISB
LHR	LXR
BFD	JHW
YYZ	YUL
FCO	SKG
HAM	FDH
LPL	AMS
AEP	MVD
VKO	AER
KRS	ALC
YVR	LAX
CGO	SZX
MDW	ROC
GLT	BNE
ICN	VIE
OPO	CIA
AMS	HKG
IAD	DKR
ORD	STL
MSP	LAN
PVG	LHW
GYD	FRA
JAI	AUH
IAH	SLW
BFS	BRS
PVG	SVO
SZX	YCU
SEA	SAT
KTM	CAN
KTW	CGN
ESB	SAW
BOD	LYS
JNB	AMS
TUS	SEA
DLC	SHP
DCA	YOW
BOO	NVK
PER	KGI
TIJ	MZT
MEX	SJO
DEN	ABQ
JED	TUU
CMN	ABJ
DCA	DEN
BIO	MAD
BGO	DBV
MFM	PUS
DEL	DOH
FAO	AGP
BLZ	ADD
SJU	BDL
IKS	YKS
FOC	SZX
SZX	XMN
DLA	SSG
MBJ	ORD
BSL	HAM
BEW	JNB
PVG	CDG
RGA	AEP
KUT	KTW
PRG	BEG
NCE	RIX
XMN	AMS
MAN	FCO
ZAG	CPH
MZT	MTY
GUA	FLL
SKP	SAW
SVO	PRG
AMS	NAP
OVB	NSK
DEL	ATQ
VVO	OVB
KWE	NNG
GVA	OLB
ORY	SXF
FRU	IST
BRU	NSI
HGH	FUG
LVI	JNB
MCI	DEN
ZRH	HAV
OVD	SVQ
LEH	LYS
SGN	PXU
GOA	IST
ORY	QSF
ORF	DTW
TRD	OSY
FNA	LHR
AUS	EWR
ZNZ	FRA
TPQ	MEX
DUB	EDI
EWR	SJU
ORF	EWR
ATL	SCL
PRG	EDI
MPL	CRL
NBO	MYD
DMK	UBP
PHL	RSW
JFK	EZE
BIL	AZA
SMF	ONT
BRE	LEJ
HBE	DOH
HET	CIF
HOU	JFK
MIG	SHA
PVR	ATL
DUB	CGN
UFA	GYD
LAX	MEX
LTN	KTW
LKO	BLR
KWL	WUH
EZE	MDZ
FCO	STR
DME	DOH
KMG	CCU
DTW	BGR
SHJ	KHI
DAL	TUL
SHJ	UFA
BLQ	FCO
TRF	LGW
PNS	ATL
TPE	MFM
STN	KRK
LYS	SXB
JFK	JED
UIN	STL
NBO	LHR
LHE	UET
PIA	LAS
DCA	SRQ
UME	LLA
AMS	ARN
GSO	IAD
MSP	MOT
ABQ	SAN
ATL	SBN
DXB	IAD
MAB	TUR
BGY	BCN
OSL	AGP
BNE	CBR
VCE	OSL
SVO	FRA
CIA	BDS
CZX	HRB
CAI	BRU
CDG	DLA
ACC	NBO
SVX	SVO
FNC	BRS
OAK	SLC
YYZ	PHL
DLC	JNG
IXA	GAU
CCJ	BLR
TSF	OTP
SAT	DEN
AMS	UIO
POM	UNG
TGU	LCE
NBO	BJM
AUS	MDW
LIM	VVI
IAD	COS
BKK	OVB
ZUH	CGO
LAS	ICT
CRL	FEZ
DAY	TPA
XIY	HEL
BSL	LIS
ATL	NAS
FAO	LIS
TPA	PDX
JAX	SJU
DLE	RAK
BPS	CNF
LHE	ISB
TSR	BLQ
TYS	ATL
SYD	NTL
AYT	OSL
HOU	TUL
TAC	MNL
IAH	HOB
HKG	YNZ
MAN	EXT
MEL	LAX
PBC	CUN
LAX	SBA
PGD	GSP
GPT	CLT
MAD	CLO
AGP	SOU
IAD	CMH
ACE	DUB
FRA	TIA
ANC	LAS
BRU	YUL
NBO	LOK
FLL	AUS
CPH	LHE
HAH	MBA
ORD	FWA
EBL	TBS
BOM	BLR
NZH	NAY
LIS	LYS
TDX	BKK
MRS	TUN
AGP	OSL
LHR	CMB
TET	BEW
CPH	AAR
DLA	BGF
AMS	LAX
KIV	OTP
TXN	XIY
GRU	LAD
DPS	BPN
LYS	TUN
BLQ	LIS
LAX	COS
OPO	BSL
CBR	BNE
PER	DXB
BWN	CGK
BHX	GDN
ATH	VCE
ELP	ATL
VIE	OSL
YCU	WUH
GSP	PHL
NMA	GOJ
EIN	OPO
IMT	MSP
CCU	PNQ
EWR	EDI
TSN	MWX
RAO	BSB
FNI	LPL
LTN	BCN
MAN	LEI
BCN	OTP
PIK	WRO
CDG	NSI
AMM	YUL
KKE	AKL
JIB	HAH
PHL	ROC
OVB	GYD
CNX	TPE
ARN	AGP
NNG	MFM
YNT	HFE
CAN	ADD
CNS	BNE
CGN	GDN
PWQ	DME
UTH	BKK
RTB	ATL
KTM	DOH
ABZ	RIX
YBL	YVR
IBZ	BIO
SIN	HKT
NNG	SWA
BRM	CCS
TXL	SAW
CAY	BEL
CTU	KOW
PVG	DLC
PER	SIN
HYD	KUL
HGH	DNH
KTM	SHJ
FMM	FAO
MPL	SXB
LYS	BRU
LPB	UYU
GRU	LIS
MOQ	TLE
MUC	PHL
SOF	VLC
MEX	SFO
JAV	JEG
PVK	AMS
EIN	FEZ
CUN	BOS
IQN	NAY
DLC	TXN
YTS	YYZ
TZX	ADA
SSG	ADD
CKG	HKT
VRA	CUN
DME	VVO
GVA	CDG
DXB	VIE
PER	EPR
BRS	GLA
SJU	TPA
CGK	TTE
CNF	CGB
DEL	BLR
SVO	KJA
PVG	TSN
NNG	SZX
TOS	ALC
LCA	ATH
PIT	SFO
BOG	SMR
PVG	MYJ
KHI	RUH
DCA	PVD
LIS	BCN
HKT	SZX
HET	DLC
POA	PET
PVG	AOG
FRA	ICN
KCH	MYY
CGQ	TPE
MIA	SAL
TPA	DTW
YYC	JFK
MRY	SFO
ZAH	GBT
CID	MSP
SJJ	IST
TAO	JMU
ZUH	WNZ
SLC	LAS
GUA	LAX
RIX	KGD
KGS	ATH
SYD	MQL
DJJ	BIK
SHJ	KZN
ORY	MRS
LHR	MNL
VIE	EVN
NJC	OMS
BGY	CRL
BOD	AMS
RUH	CMB
MCT	LHE
CMU	POM
HGH	PUS
DPS	MNL
PUS	NKG
VLC	FCO
LAX	SJC
CPH	PEK
STR	HAM
JFK	SDQ
TPE	NNG
SAN	MRY
PVG	KHN
LBU	KUL
RSW	BOS
SGN	DOH
OTP	BEY
ICN	DPS
LYA	CKG
PPS	BKI
FCO	BOS
KYA	IST
LAX	CPH
GYD	SVX
SLC	RNO
OTP	BRU
SCL	SSA
SAW	CRL
OPO	MST
WAW	ORD
DXB	TBZ
IAD	SAT
SYX	ZYI
DME	OMS
SDJ	KIX
HBE	CAI
BVA	CAG
DUB	HAJ
FCO	OTP
CLE	STL
KUL	DXB
LIM	MVD
YHZ	YQM
SJC	DEN
BWI	BDL
LFW	ACC
MUC	EDI
OTP	IAS
YYZ	MSY
PSG	JNU
VRA	YHZ
STN	PFO
YYZ	GEO
PTY	LAX
SAT	MEM
EWR	ORY
JFK	MSP
CGO	TNA
BTS	BVA
OTP	VIE
ZRH	SFO
EZE	BCN
BLR	CCU
DOH	MEL
CVG	SFB
PTY	BOG
IAH	CLE
CKG	SJW
SHJ	SLL
HNL	ICN
HET	TAO
BIO	VLC
OTP	DUB
XNN	KWE
SLC	MCO
YYZ	ORD
KCK	IKT
MCI	DTW
BGO	BNN
CDG	SVO
DCA	SJU
AMS	LCY
LAS	EWR
IST	DOH
CRW	MYR
RIX	OSL
CAN	DLC
BNA	FLL
TNA	PVG
MAD	BRU
ICN	CKG
PER	AKL
YLW	SEA
SVO	AAQ
RVN	HEL
PUS	KUL
ATL	VLD
GLA	KGS
IAH	CUU
BVA	RBA
DWC	KUL
FKS	ITM
ARI	SCL
SVX	UFA
FRA	EBL
FRA	BOG
GDN	CGN
NCL	PRG
VNO	BCN
TUL	STL
AKL	TRG
RNS	BCN
LZH	CTU
CMN	LIS
TSJ	FUK
TYN	PVG
GVA	SPU
STL	ATL
MDT	ATL
WJR	NBO
HAK	CAN
MCI	SEA
IAH	LBB
XMN	WUX
CDG	MAN
MEL	SIN
AYT	BGW
YYZ	YOW
EIN	RTM
EWR	AUS
CTA	LYS
ORD	MCO
YEG	PHX
TPE	HFE
OSL	BIO
MIA	LRM
VKO	MLE
WUH	YTY
ADD	PVG
PBH	DAC
JFK	TXL
IST	MAD
WLG	AKL
FRA	SKG
IAH	FRA
PIE	MLI
TNA	HRB
SVO	SXF
OSS	SVX
MDW	DSM
TUS	SLC
KMG	TSN
BGY	BUD
DEL	KUL
SZZ	TRF
PVG	SYD
MRS	RAK
HGH	NNG
ORD	MLI
PRG	OSL
TIV	CDG
CTU	URC
BCI	LRE
MBJ	MDW
BEG	SPU
IAH	ABQ
LIG	AVN
YYZ	SNU
PVR	EWR
BFJ	SZX
HAM	VCE
MRS	QSF
VLV	CCS
VAR	BRU
PMO	ORY
ATL	ZRH
BUD	EIN
YCU	SYX
PVR	YYC
GRU	FCO
MTY	MZT
GRU	UIO
JFK	PVG
LIN	ORY
IAD	AOO
CUN	YVR
OGG	DEN
ABA	SVO
KMG	NAO
JNB	TNR
PHL	MDW
MYJ	ITM
PIS	SNN
SFB	HGR
KRR	PFO
BGW	AMM
IST	BUD
EZE	MVD
MOF	KOE
BHO	DEL
JNB	ELS
MDW	AUS
RAJ	BOM
IST	JNB
BRE	AGP
KHN	KWE
OMS	GYD
KHV	KJA
KJA	PEK
AUH	MUC
SAN	LIH
LXA	XIY
ALC	RTM
JFK	CPH
PGD	PIA
IST	BOM
GSP	IAD
PEK	SYD
SDJ	ICN
DXB	HKT
HAK	HGH
PVG	PEK
PVG	TGO
CMN	ORY
IST	MLX
DXB	SVX
BHX	EWR
BCN	CGN
AUA	VLN
MKE	BWI
AYT	IST
CLE	GRR
CRL	VLC
BCN	OSL
BAZ	MAO
OTP	BVA
MIA	TXL
YYZ	MCI
IST	KGL
NQN	AEP
ATH	CDG
KUL	DOH
YYZ	WAW
DOH	PHL
MCT	CMB
ORY	RBA
LIM	JFK
SOQ	MKW
GOJ	SVO
NCE	BHX
REX	MEX
SJW	LHW
SAT	DAL
RAS	SYZ
FIH	CDG
DAC	IST
LTN	LJU
VIE	ADB
KJA	VKO
SVG	MAN
YKS	KJA
NAP	BCN
IST	BCN
SHA	TXN
GLA	BCN
SDR	VLC
DTM	OPO
SJC	AUS
CPH	TKU
BHD	LHR
BRE	OPO
MNL	SYD
DLC	TSN
MCI	BWI
CFB	PLU
ORD	HSV
XMN	CIH
SEA	PDX
ORY	PDL
THE	GRU
KOE	MOF
CDG	HAN
TPE	KMG
SVQ	CIA
BHX	KUN
URC	CKG
GBT	MHD
LIG	LBA
HKG	CCU
MCT	KHI
DTW	ERI
BLQ	STN
AES	OSL
GOJ	EGO
JED	BLR
KMG	MDL
TYS	CLT
MRY	LAX
YOW	LGA
LYS	RNS
TSV	ISA
TPA	AUS
CHC	MEL
NNG	KHH
DOH	NBO
SVO	PSA
FLL	PHL
ALC	NYO
RUH	JED
AQG	HAK
FRU	KZN
SVX	NSK
KUF	DME
SRQ	ATL
HRB	NAY
CPH	CHQ
CDG	ORN
MSY	LAS
ZRH	DME
YYZ	KEF
PIA	ORD
CXR	DME
STR	SKG
RUH	CAI
STR	DBV
VNO	PRG
ZRH	WRO
BNE	HNL
LAX	CLE
NNG	CTU
ZRH	KEF
IAD	SVO
CKB	SFB
CPH	SIN
PMO	FCO
BLR	CCJ
CBR	ADL
TPA	HPN
BUD	GVA
TPA	MKE
DEL	JLR
CIA	MAD
TJM	OVB
CDG	LJU
ALC	BRS
KWL	HGH
FCO	TXL
PEK	CGO
BHM	DAL
LPL	NAP
FAO	BRE
ATH	BEY
LIR	SYQ
IST	TGD
MUC	KRK
PIT	PHL
AMS	SEN
PGD	YNG
DOH	DWC
HRB	HGH
FRA	ESB
SXB	LIL
OSL	PUY
MEX	JFK
JAV	JQA
RTW	DME
ESB	GZP
IST	ASR
BNE	DPS
DEN	KEF
XIY	WUH
LAS	MAN
ACE	LEJ
AGP	SDR
STL	DTW
MIA	LAX
MSY	AUS
BZE	ATL
ORD	ALO
VCE	FRA
KMG	XNN
AMQ	CGK
STN	RBA
CAI	BGW
ACC	DKR
NAP	FRA
WUH	TAO
JIJ	DIR
MVD	POA
PAG	MNL
ORD	SJC
LAD	PEK
CGR	GRU
KIV	VCE
SYD	PKE
LBA	NCE
HYD	SHJ
SFB	AVP
NNG	KHN
BOH	CHQ
CDG	DUB
KUT	TBS
GEG	OAK
SPU	BSL
SVQ	LEI
FNT	ATL
QSF	LYS
CVG	RIC
FCO	TBS
DEN	MSN
TLS	ATH
DEN	PUB
HAM	SZG
KAO	HEL
IST	JFK
GOA	FCO
PZU	CAI
DAL	HRL
SVO	SVX
ACC	LHR
SZX	FOC
COR	SCL
DLA	CMN
CAI	CGK
MCZ	SSA
AMS	BRS
SAW	FCO
BDL	DTW
KUF	VKO
CEI	KMG
BSL	LGW
DMK	SIN
CGN	DBV
UKS	DME
LGW	VLC
TYN	TAO
IAD	VIE
ESB	DOH
BRS	NCL
YOW	YWG
BOS	PTY
BVA	WAW
SCL	AKL
LIM	EWR
CTU	XNN
VKO	CUN
BTJ	CGK
YNT	PVG
CRL	AGA
EZE	FLN
IST	KSY
LEI	CRL
SAW	GYD
PBI	JFK
TLS	ORY
DME	LGW
SIN	KIX
DPS	BDO
LHW	JGN
PIE	ABE
POA	ERM
HFE	CGO
TAO	TYN
NTE	BSL
STN	KTW
LPL	FAO
BGY	BDS
TOB	TIP
YEG	SFO
HAM	AYT
ORD	CHA
HEA	ISB
YVR	YOW
CBR	SYD
TSF	TSR
MSY	DAL
JED	HBE
ATL	LIT
JHB	CGK
WUH	CDG
EWR	BCN
YYZ	SAN
DPS	DRW
ROB	CMN
BLA	CCS
CAN	LZO
FAI	CEM
DBO	BHQ
DMK	HAN
GCC	RKS
KUL	BTU
SVX	HMA
PVG	KHH
BRE	FAO
FCO	JED
IBZ	LTN
SHE	HKG
LAX	VIS
MCO	JFK
EVN	ATH
AJU	SSA
SKG	BRE
KWE	LHW
MAD	SJO
CPH	MAD
MNL	HKG
AMS	OPO
MAD	CRL
LGG	BIA
TAM	CUN
LUN	KAA
ORD	MDT
LIL	SXB
DAL	ELD
BGO	CPH
YQK	YAG
HOU	MCO
SGN	VDH
PEK	CGD
TPA	BDL
CMH	CLE
YVR	YYC
ROB	FNA
MAN	NAP
KHN	SJW
CLT	SAT
NCL	SVG
SAP	FLL
ATL	SAN
JFK	FCO
HGH	CAN
CPT	DXB
IST	LEJ
MBJ	LGW
SAT	TPA
ITH	DTW
BDL	MSP
MFR	SLC
OTP	NAP
SHE	HLH
STI	BOS
MUC	KIV
JFK	CMH
YXY	YVR
PPT	NOU
OAK	BOI
KTM	BIR
ONT	MDW
IDR	RPR
AAL	AAR
LIM	JUL
KHH	CGO
AMM	ADE
BGM	IAD
FCO	TAS
TPE	HNL
BOS	IAD
MCO	MKE
SHA	YIC
LGG	LIL
LGA	MSN
SZB	TGG
PHL	SEA
LZH	CKG
TUN	AMS
POA	AEP
CTU	CGO
MCO	CMH
TXL	PRG
ATL	HPN
HAM	SVO
ELS	JNB
ATL	VPS
SAL	IAD
OSY	TRD
OVB	OSS
LGA	MCO
TPE	YYZ
SAW	HAJ
NKG	YNT
BUR	IPL
WMI	BRS
MAN	RZE
YNT	HKG
STR	GRZ
CGN	BHX
YVR	MNL
AJA	NCE
YUL	LHR
PVG	AKL
PEK	PVG
TNA	TGO
KUL	BKK
KRK	CRL
TPA	PIT
AMM	TXL
NKG	KIX
HBE	DXB
IKA	DXB
BWN	SUB
LIM	AQP
CPH	WRO
ZAG	SKP
TYS	PIE
SAL	BZE
TAO	JNZ
HTY	IST
VKO	KRR
LXR	DOH
ABQ	SLC
TIA	GOA
SFO	EWR
AMS	YVR
LKO	DEL
CLT	TPA
ROS	PDP
DAL	IAH
VAN	ESB
CLO	BOG
MSP	ALB
LBV	BZV
BCN	VIE
DOH	VCE
TLE	TNR
AMS	FCO
OAK	OGG
GWD	KHI
LGW	DXB
BNA	MSY
BTK	OVB
PRG	LHR
BOS	BUF
HDG	CKG
OTP	VLC
PVG	SDJ
DAX	KMG
IAH	YVR
SIN	MYY
MAN	JED
KWE	DLU
TIZ	HGU
ARN	BHX
YHZ	YUL
CRL	SKP
KZN	EGO
MGQ	JIB
MAN	CPH
KGL	JNB
PKU	SIN
MUC	AGP
RAK	BVA
CGD	SZX
FLL	ISP
MRS	TXL
KRT	JED
IND	RSW
BOM	IXD
WAW	BGY
AGP	SOF
CPH	ZAG
ZRH	NAP
CPH	CMN
IKT	VKO
BOO	TOS
BNE	ISA
BCN	EIN
AQP	JUL
KTM	SIN
GVA	CMN
SHE	PUS
CAG	MRS
SZG	LGW
CHC	PPQ
BHY	HGH
LIT	ATL
WNZ	TSA
ALC	BGY
RAK	BRU
YFC	YUL
VNO	BGO
MTT	MEX
EBL	DXB
LPL	KGS
PEG	OTP
AZA	BZN
TPA	FNT
PTY	LIM
BRE	CHQ
MEM	HOT
TAO	YCU
NTE	MIR
PIT	ATL
BLI	LAX
BOS	NAS
YYZ	SJO
TNA	CKG
USM	KBV
MAD	SCL
PVG	HFE
WRO	BRU
BRS	ACE
ULV	DME
AMS	AJA
DCM	ORY
PEK	YTY
KWE	HAK
HEL	FRA
CZX	KMG
CAN	WUX
DAL	SEA
YYZ	YSB
MUC	AGA
IAD	DOH
DOH	HGH
CAN	PUS
AJA	TLS
EIN	BDS
LZO	CAN
TLC	GDL
IOS	VCP
FRA	ADB
ECP	BNA
IAH	BHM
AMS	LAD
ISA	DRW
STN	VLC
FNA	DKR
BSL	LCY
EDI	LTN
SAH	JED
IAD	LNS
STL	MIA
BUD	HAM
SHE	MDG
CKG	HKG
DCA	ORF
MDW	SLC
GRU	CLT
BUS	IST
AJA	NTE
KEF	ARN
ORD	DAY
PVD	PHL
JNB	EBB
LYI	YIW
MTY	PTY
HAJ	DBV
PDX	EUG
KTM	KHI
PDX	MDW
MCO	BQN
MCO	LGW
MIA	BSB
ARN	SPU
HAJ	SKG
YUL	YMT
INV	BRS
WUX	SIN
STL	CLT
GLA	PFO
GDN	STN
HOR	PDL
ZAG	RJK
YVR	YXS
NAP	DUB
LHR	ISB
SEA	MKE
GLA	SOU
BAV	XIY
LGA	EYW
CTU	CZX
SXF	OLB
DTW	AVL
CTU	TPE
KUN	PFO
LCA	DOK
RJA	HYD
AUS	HRL
CDC	SLC
SVO	TAS
BJZ	MAD
OSL	BTS
MDW	TPA
SYD	PQQ
DWC	KTM
TRD	DBV
TGD	DME
LAS	SBN
LFW	LOS
PDX	OAK
SGC	TOF
CDG	CCS
YCU	KMG
DXB	BOM
PBG	SFB
DXB	DEL
KGI	ADL
SHJ	PNQ
SGN	HPH
IJK	DME
HPN	ACK
MAN	ALC
CKG	AQG
PHL	VCE
IAD	LGA
MAN	ORD
JFK	SJO
KAN	CAI
MEX	CDG
HAU	BRE
ICN	YVR
YTZ	IAD
VIE	KRK
LAS	MDW
BGO	SVG
DME	LEJ
MIA	RIC
PHX	BOI
GSP	BWI
FRA	BKK
HAU	PSA
LBU	MYY
NCE	PRG
ARN	FCO
YVR	LAS
FMO	IBZ
CRL	SDR
OVD	AGP
CRL	RAK
NNG	KWL
MRS	CHQ
IBE	BOG
SVO	HTA
PTY	BSB
HAM	OSL
CIF	NKG
CTU	JDZ
LTN	GIB
IST	GYD
GDN	KRK
XIY	KHN
LHR	LCA
TPE	FOC
OSL	VNO
ALB	DTW
MCI	ATL
PVG	DAX
AGA	LIL
AZA	RAP
ABZ	MAN
BOD	LIS
TPA	ISP
GSO	DEN
BKK	SYD
GYD	UFA
REC	BSB
SGF	PGD
FRA	AMM
AZA	ICT
MNL	BKK
DME	HKT
MKE	ORD
CLT	ROC
GYD	KJA
LCH	IAH
TGU	GUA
DUB	FCO
YIC	KMG
NNG	WUH
SPU	FRA
HET	SJW
YMT	YUL
ASM	SAH
DUB	ALC
PNS	CLT
VNS	CCU
ORD	RAP
ORD	YHZ
LYS	ORY
CLT	MIA
STR	TXL
OPO	VLC
BOM	MUC
AEX	ATL
LOP	CGK
VCE	BOD
AKL	RAR
BCN	BUD
GOJ	NMA
UFA	DWC
CNS	KIX
HAD	VXO
ESB	BEG
TYN	SHA
FCO	HAM
ITM	CTS
YIW	SHE
DUB	STN
SDQ	FLL
YYC	PDX
AUA	YYZ
YYC	LGW
FCO	BSL
DME	NSK
PIE	SYR
LBA	ABZ
MMU	CVG
CGK	DXB
NNG	WUZ
LGW	OLB
LAU	MYD
AUH	CMN
MFM	MNL
JHB	TWU
BSL	AMS
MUC	LHR
PEK	IST
IAD	MCI
JED	AMM
LIS	HEL
GDL	LAX
CGQ	YNJ
YYT	YHZ
MSP	PHL
MST	AYT
YEG	YUL
HKG	ILO
PRG	ARN
HAK	WNZ
KUL	CDG
SRA	GEL
AMS	LHR
RMA	BNE
AJA	CDG
TPE	TAO
WUX	FOC
KGS	SXF
NKG	SHE
BWI	GRR
CAN	KHH
ATL	PNS
SHA	AQG
FDH	FRA
IAH	GRR
MIA	LHR
SGN	VKG
OSL	EWR
POM	MDU
CAN	VTE
SZB	USM
KWL	TSN
CVG	MSN
IST	HKG
ORY	GVA
LRH	DUB
DXB	BKK
MAD	HAV
CLT	IAD
AGP	NTE
MUC	PMO
MIA	RTB
DTW	ESC
MLE	CMB
LWS	SLC
SYM	KMG
MSP	BIL
MCI	HRO
DXB	CPH
ORF	CLT
SBA	SEA
WUH	ZYI
MUC	ZRH
IAH	CUN
STI	JFK
JOG	SIN
PGD	CID
ORD	AMS
BRU	FCO
DOH	CMB
DUB	BCN
JNB	LOS
GIS	AKL
CGO	RMQ
IAD	TYS
CLT	XNA
JOE	HEL
PVG	XMN
AMS	LCA
BRS	BLQ
MTY	CUL
HLA	CPT
BAV	CGO
SEA	FRA
FMM	AGP
YLW	YYJ
IAD	LWB
PGD	ABE
GMP	KPO
BRU	STR
SYD	TPE
STI	EWR
NSK	UFA
BOD	STN
ADD	MBA
SEA	KTN
ATL	GUA
ATQ	TAS
TRC	CUU
RKD	BOS
LAX	LIH
LGA	MCI
YVR	JFK
VLC	MRS
ULV	SVX
BIO	CDG
ADD	FRA
SCL	ATL
CNS	POM
SFA	TUN
NBO	MGQ
TXL	ZAG
DMK	UTH
PGD	CVG
CPH	ARN
LYS	VCE
DEN	MOT
ORD	YXU
FRA	ACE
STN	LEJ
MAN	MCO
FAO	PIK
BGY	OPO
PMO	LIN
AKL	GIS
YVR	FRA
AMM	DEL
PHL	PHX
YZY	LHW
LTN	OTP
SAW	MRS
SVX	DME
BSB	REC
BGI	YYZ
CCS	LIS
MEM	IND
BKI	BWN
MUC	ZAG
ICT	IAH
DME	DYR
KTW	ALC
MCO	AUS
BOD	ZRH
BOS	PBG
CKG	CGO
IAG	PGD
TRF	NCE
RMQ	MFM
DXB	COK
EZS	ADB
MSN	CVG
LAX	DCA
PBL	PMV
GVA	CAG
LBV	LOS
SRZ	ORU
DWC	MLE
COR	AEP
TRF	RIX
BOM	ADE
MKL	MEM
JAX	JFK
DAL	HOU
MEL	BWN
STL	DEN
NGO	HKG
NAP	CGN
MEX	SCL
EBB	LHR
PRG	BCN
ACE	MAD
OSS	URC
MKL	BNA
AZO	MSP
ORY	LRT
LAX	ICN
JUB	EBB
BNX	SJJ
BOD	BCN
TAS	KJA
MRS	TLM
TSA	FOC
KIN	ATL
CUL	MEX
DTW	ACY
KER	SYZ
CLT	CZM
MWX	MFM
LIR	CLT
BLQ	SOF
HEL	GVA
TAO	WUS
KRT	CAI
ABV	LHR
FCO	TIP
RAH	RUH
SWA	HGH
VLN	AUA
SIN	BNE
TSN	TAO
RAO	UDI
EWR	YYC
TAO	MDG
ABE	CLT
NCU	DME
ACC	CMN
BRU	PFO
PHL	IPT
DCA	CLT
KOJ	UKB
DBV	AMS
IAH	TGU
VEL	SLC
POA	PTY
YUL	FLL
YXC	YVR
SFB	MIA
ADB	TZX
BEN	TUN
MEX	PXM
XMN	HFE
TJM	HMA
PEK	AQG
CMN	CDG
SVO	TJM
CDG	YYZ
OPO	BRE
ATL	SJO
CGO	KWL
BZV	LBV
ADL	PER
BHX	GLA
SAN	BNA
APL	NBO
HGH	CGQ
ACE	STR
NGS	TSJ
KRT	PZU
HOG	YYZ
FRA	LYS
ICN	YNJ
MFR	PDX
SDF	ATL
GFF	SYD
BEG	LHR
BVB	MAO
NIM	OUA
MFM	TYN
PRG	PEE
KMG	CAN
IAD	STL
NBO	ACC
EWR	YEG
ORD	BNA
HKG	IST
AKJ	TPE
BKK	ICN
SXR	ATQ
DTW	HSV
HAK	ZUH
MSP	DIK
MSP	FNT
PHX	SAT
BZG	DUB
POR	HEL
CLE	ALB
SIN	IPH
FLL	BWI
DEL	PEK
PTY	MAO
NBO	DEL
SVG	CDG
MUB	CPT
TIJ	LMM
KHI	LHR
SNN	ACE
YNG	MYR
BHY	CGO
SUB	BWN
CDG	NCL
BOS	LEB
TYN	KMG
BHX	KRK
SSA	VCP
HRB	PEK
SHE	SZX
BOM	ZRH
SCL	ZOS
ICN	TXN
DEL	HYD
RIC	PHL
MDG	PEK
DUB	LEI
SJO	JFK
MDC	GTO
BIO	IBZ
ORD	ATL
SVO	AGP
ATL	MUC
GVA	DOH
CLD	LAX
AGP	PIK
YUL	MRS
ZRH	BOM
BEG	TRF
BNA	TTN
XAP	POA
LCA	BSL
BKK	KUL
LOS	AMS
DPS	LOP
BWI	ATL
IST	HTY
ATH	KIV
AYT	SVO
BOG	GYE
EWN	CLT
LIS	BSL
KZN	AER
VKO	IKT
ABZ	EBJ
DEL	CDG
BLA	PMV
LIM	POA
RBA	CRL
PEK	FRA
PSP	LAX
MIA	MSY
LFW	BRU
NGO	KIJ
BOS	SFO
ORD	YEG
FCO	BZO
JNB	MSU
BES	LYS
GDX	YKS
DCA	CAK
SPP	NOV
EVN	SVO
SXB	BOD
FLL	BNA
ATH	ZRH
MGQ	NBO
AMM	LCA
BCN	VLL
YKA	YYC
EWR	ZRH
KUN	BHX
GYD	SAW
SLL	CCJ
POL	MPM
YQR	YVR
KKN	TOS
BOM	LKO
GUA	ATL
YYG	YHZ
LHE	IST
ATL	DAL
CDG	WUH
BUR	SJC
FLL	TYS
CTU	HAK
SFO	KIX
MJT	ATH
AMM	BEY
CZX	SZX
SVQ	VLC
PYH	CCS
SYD	RAR
TFF	SJL
SJO	MIA
DUB	LTN
PHX	PDX
IXE	DXB
BRE	AYT
CGN	IKA
DCA	MKE
DCA	CAE
BRU	SVQ
LDE	MAD
WUH	TSN
PBI	SJU
TAO	ICN
KHN	ICN
ORF	LGA
BOM	DOH
MCO	PIT
ICN	TNA
LAX	BZE
PRG	SVO
BLQ	CDG
SVX	LCA
TNA	YNT
SAL	LAX
BOM	JGA
SHJ	DYU
PAD	MUC
ATH	STN
IBZ	FDH
EUG	LAX
ACE	MAN
BSL	SXF
PUY	OSL
ARN	ADB
DEL	DXB
ORD	OGG
AMS	LOS
LGA	PIT
DME	SKX
AGP	TXL
PEK	MAD
POM	SYD
YWG	YQR
YQM	YHM
SUV	FUN
CAN	SYD
TRF	STN
CDG	RAK
DCA	AUS
LUN	NLA
ORD	SJU
ZAG	VIE
EWR	LHR
AGP	GVA
ORY	DBV
PHX	IAD
CAG	BRI
LYS	BOD
MCI	IAD
WIL	KTL
LBA	LHR
ZHA	SZX
HGH	AMS
LAS	JAX
UFA	SVO
LWS	PUW
LHW	KWE
SIN	TAO
ADD	NBO
PTY	MVD
CGN	LGW
BKK	BWN
CWB	BSB
URC	YCU
ZRH	VIE
BKK	PVG
SWF	MCO
DUB	SZZ
ALC	LPL
STN	SOF
MUC	ADB
VCE	CTA
MAO	PVH
FRA	VLC
MHG	TXL
ACY	MCO
STR	BHX
NAP	CDG
XNN	KMG
BSB	RBR
XMN	SHE
SHJ	TAS
IXR	CCU
PGX	EGC
ICN	MNL
SLC	SAN
WAT	BHX
LHR	HAJ
HYN	CKG
WUH	LHW
HAV	GAO
SSA	JPA
YYZ	JFK
TPA	DAY
CLT	TYS
SAN	AUS
FMM	SKP
NJC	HMA
DTM	TSR
STN	PIS
MUC	JFK
FAO	LTN
IAH	RSW
CGO	HET
RAK	BOD
CLE	ERI
TXN	CTU
UIO	CUE
MUC	PSA
STN	PDV
AKU	CTU
TAO	XMN
SAP	EWR
KHI	KTM
LHW	TYN
YVR	LHR
IZA	VCP
GDN	KRS
TAP	MEX
WUX	KIX
TRF	ALC
IKT	FRU
MYR	ACY
SSA	FOR
RIX	ARN
PIA	DEN
MAD	ORN
WRO	CIA
BUR	LAS
OPO	GRU
PRG	AMS
FLL	RIC
ATL	TUL
MUC	ALC
ORD	MBJ
TIJ	MTY
AUH	ADE
SOU	RNS
PVG	DTW
CAN	CGO
ADB	MQM
NCE	BES
YOW	FRA
JAX	IAH
MST	FAO
KUL	CTU
TPE	ISG
STL	YYZ
TOY	ICN
WEF	CAN
NKG	CGO
EVN	GOJ
ICN	ORD
CMN	NTE
SLC	OAK
FRA	SFO
NNY	SHA
XMN	CGD
CLT	ABE
KHN	HKG
EWR	MSP
GAU	IXA
AMS	INN
FIH	DLA
OTP	DWC
APL	VXC
BVA	PSA
KRT	AMM
VVI	LPB
DTW	PWM
PEK	IKT
MEX	AUS
ROV	DME
UEL	TET
LIS	MUC
KEF	SFB
FRA	HAN
SFB	SGF
CHQ	OSL
EIN	GDN
FAR	SFB
GUA	FRS
MYR	HTS
SPU	HAM
ESB	BAL
CUN	CDG
LIS	PDL
USH	FTE
VTZ	CCU
LAX	MAD
HET	HRB
HNL	SYD
CWB	VCP
ALC	AMS
VLC	BRU
HAU	AGP
HMA	TJM
BKZ	MWZ
CHQ	EIN
NCL	SOU
OMA	PHX
WRO	GDN
IND	DTW
KLU	HAM
CTA	BLQ
KTM	PBH
AMS	EZE
DEN	OKC
ZRH	ZAG
SVG	ARN
IST	BRU
BGO	OSL
BUD	ZAG
ORD	GRR
CAI	LCA
BRU	COO
MPL	RTM
CGQ	HGH
TLH	ATL
LIL	MPL
IQN	XIY
MDW	TUL
TAO	PVG
DPS	BKK
EVN	VOG
MCT	IST
SLA	COR
EDI	PSA
LHR	ADD
JNB	DKR
NNG	TPE
DCA	BUF
CDG	PMO
BWI	MDW
LPL	IBZ
HGH	CKG
SDF	MCO
PHL	SBY
CLT	CRW
PRG	GYD
PEK	GVA
DME	SGC
SKP	DTM
MLU	IAH
OSL	SPU
MBJ	YYZ
MEM	EWR
ICN	NBO
ICN	BKI
COK	DEL
BGY	PMO
IAD	MGW
LGW	BIA
WAW	CPH
ADE	CAI
SEA	EWR
MUC	DTM
TLC	ZIH
CGO	CTU
DOK	DME
ATW	ATL
DXB	JNB
SAN	LAS
LGA	IAD
DPS	DIL
FUK	KMI
SEA	PHX
FNC	ORY
SDQ	EWR
DTW	PDX
SVO	BLQ
BHX	MUC
POZ	FRA
IPT	PHL
YUL	BOS
IAH	TYS
BKK	CGO
CTS	KIJ
CKG	URC
ABZ	OSL
EIN	DUB
SIN	BKK
JAX	HOU
BOS	LIS
BTV	IAD
OPO	TUF
AES	TRD
AUH	GVA
PVG	SGN
UET	KHI
MHD	HEA
NAY	NNY
BOG	IAD
BGY	BRE
XMN	PVG
DOK	DWC
PTY	LIR
LTN	SKP
IBZ	BRS
SIN	IST
CDR	DEN
CGK	PER
SZX	YNT
BES	BIA
FCO	SVX
ICN	MYJ
SAN	PDX
LGA	MYR
MEM	MDW
MOC	CNF
VDH	HAN
ALC	STN
TPE	CNX
VNO	CDG
ALC	PIK
DME	KUF
MAO	CNF
LPL	GDN
WUX	TPE
SVO	REN
CPT	HLA
AJA	BSL
PNS	IAH
PHX	LIH
MIA	CLT
YQQ	YYC
LGW	VIE
BRU	VIE
LIH	LAX
OSL	ABZ
LTN	POZ
UBP	BKK
CGN	BUD
STR	EWR
RUH	JFK
HMO	MTY
SHE	TYN
MKQ	DJJ
HKG	DMK
CDG	BZV
VLC	TSF
BWI	BUF
PEE	DWC
VII	SGN
MAN	JFK
RAR	LAX
WAW	RZE
BCN	TSR
JFK	ORD
SSA	SCL
DLC	PVG
HAM	BIA
GUA	SJO
KBL	KDH
MSP	YYZ
CKG	ICN
POP	JFK
YUL	ORY
TAO	TPE
LGA	DEN
MGF	CGR
OPO	BGY
IBE	EOH
CVG	SLC
VVI	CBB
IST	AMS
TGO	PVG
KZN	ASF
NGS	PVG
TJM	SLY
FLR	LCY
PMW	GYN
CCS	CUM
CTU	BOM
KUL	SDK
SEA	MCO
SAT	GDL
DUB	RAK
YHZ	YHM
MCO	ALB
DSM	DCA
CAN	DMK
ADD	FCO
STL	JFK
DAL	SLC
SAT	DTW
PDX	EWR
TXL	LHR
BHX	NCL
BRU	JFK
LGW	ZRH
RTM	BUD
SLC	YVR
HKT	DXB
SOF	OTP
YYC	LAS
MAJ	HNL
DCA	TLH
DME	BCN
LAS	SEA
TPA	LGW
TPA	LGA
NNY	CAN
POR	ARN
JJN	KWE
HAV	LGW
VST	STN
CCS	FRA
PHL	CMH
SVX	NOJ
PGA	DEN
ZRH	AMM
KEF	BSL
HAK	KWL
MUC	KRR
CPH	EDI
OSI	STN
JED	ADD
MBA	DXB
BHY	SJW
ACE	EDI
LOS	LBV
CIA	BVA
BAV	CTU
ATL	GRU
BOS	CHS
PVG	JMU
HKG	WUS
GSO	LGA
DLC	KHN
YYT	YYZ
HPN	RSW
ALB	MDW
HDG	CAN
AMS	YYZ
BNA	LAX
SVO	LAX
MIA	CUN
HNL	OGG
HAM	BGO
BKI	HKG
HEL	ICN
LHR	NCL
CKG	CZX
SVO	HAJ
BSL	AGP
CAI	DOH
PTY	GYE
ORY	PGF
DLH	MSP
LHW	XIY
HAK	TYN
HAV	UIO
AMM	LHR
KUL	PEW
CUN	FCO
ORF	DCA
CYS	DEN
SZX	BKI
ORY	LYS
OTP	IST
CKZ	ESB
ALC	TMP
YYZ	MIA
VCE	TLS
MEX	DGO
PUY	DME
MCO	SAL
TIA	FRA
BCN	ZRH
TIA	BRI
NCE	TRF
LGA	JAX
PNZ	SSA
CMB	KHI
HAH	JIB
TUS	IAH
KUL	TGG
HSG	ICN
DEL	GAU
CLE	DCA
ZRH	DRS
GDX	DME
KHI	DEL
DAU	POM
PHL	MUC
IAD	PDX
FMM	BEG
MLX	ESB
JNB	CAI
KWL	KUL
YTZ	BOS
HOU	IND
LIH	SFO
SZX	KUL
PSP	ORD
FRA	BRE
MDW	JAN
CVG	MKE
TAS	RIX
FRA	TPE
OTP	LHR
BOS	SLK
JTC	CGH
LFW	CKY
CCU	HKG
IAH	ORF
KAN	ABV
NBC	SVX
VLC	CMN
RSW	CLT
JAN	HOU
SMF	SNA
MAR	PMV
BPN	BDJ
TBS	FCO
XMN	SJW
BRU	IST
PSP	SEA
TIP	IST
MUC	NTE
PVG	KOJ
PUS	HGH
PVR	LAX
VCP	CCM
YWL	YVR
HTS	MYR
DEN	MDW
GDL	MDW
MUC	DOH
MUC	BHX
ABZ	DUB
DJG	OGX
YOW	BOS
YNT	TNA
FAT	DEN
LHR	MEX
DOK	IST
OPO	LRH
STL	GRR
SLC	TWF
DME	VKT
FUK	MFM
SFO	AUS
LAD	MAD
DCA	BTV
DCA	HPN
JAX	TPA
KUF	NSK
PIE	PBG
CPH	TXL
MXX	ARN
PSC	LAS
LCA	LHR
LAD	FRA
TXL	NCE
AMS	SKG
HNL	BNE
ADD	EBB
AMS	PDX
ESB	FRA
YNG	SFB
OUA	LFW
FAR	ORD
CPH	BUD
SZX	XIY
HAK	TXN
LBA	CHQ
PFO	AMS
HBX	BOM
STL	CUN
THE	PHB
USH	EZE
CTU	LHR
LGW	SOF
BLQ	LGW
YSB	YQT
XNN	CKG
PRG	UFA
CAG	GVA
DLU	CTU
VIE	SZG
AMM	BKK
IVC	CHC
LAU	WIL
PSA	FCO
TXL	FRA
BRU	GVA
QSF	ORY
CVG	JFK
DRW	BME
LBA	MJV
TLE	MOQ
CTA	EIN
ATL	MOB
KOJ	TPE
IAH	SAV
TUS	ORD
BCN	ATH
OSS	FRU
CHC	PMR
KMJ	NGO
MSP	CLE
EDI	KUN
DTW	GRU
ORD	YYC
SDQ	SJO
HGH	ZUH
ITH	EWR
DOH	SYZ
DUB	SEN
LGB	JFK
GDN	ORK
TAO	XIY
EWR	CPH
CGK	PLW
FIH	KGA
FRA	LCY
FLR	NTE
ALC	MAN
AYT	EBL
PMO	GOA
JJN	NKG
DOH	SLL
BIO	AMS
FAO	HAM
MAD	BIO
AUH	BRU
SKG	PFO
SIN	DXB
ZAH	MHD
IAH	SAN
MDW	PHX
KRK	AMS
LPB	CBB
LBA	AGP
MPM	INH
ICN	SGN
YOW	YVR
FCO	BCN
CLT	LIR
CUN	OAX
AMS	AAL
ARN	SXF
PCR	BOG
HAU	BGO
CGN	KLU
IBZ	PSA
BLR	JED
KOW	SZX
BKK	VTE
PEK	GYD
PGD	SBN
NJC	DME
IST	KZR
ORK	ALC
CNF	UBA
BVA	RAK
IAH	GUA
DCA	CVG
ACE	BGY
PVG	HSN
ACE	FRA
NKG	HAK
EYP	BOG
KUL	SZX
MBJ	MIA
SXF	KEF
CAN	DAC
LCY	GLA
IST	IAH
UET	MHD
EPR	PER
LGW	ABZ
XNN	YUS
BCN	SXF
MDK	FIH
BOG	BUN
BCN	GDN
MID	IAH
CZL	IST
BRU	CMN
KUL	MLE
CDG	LIS
AUX	MAB
ILO	MNL
SAT	TLC
ABJ	TUN
PEW	ISB
PIE	MDT
BZE	SAL
TSR	MUC
MRS	STN
BUD	LCA
LEJ	STN
RSW	BWI
SHJ	NBO
CEE	HEL
MTY	ATL
ZAH	SYZ
NCE	NCL
LYS	LRT
CAE	DTW
ORY	CMN
CDG	BLQ
ADD	CAN
ADD	MCT
HAJ	LCA
MEX	MAM
IND	BOS
ORY	NTE
LAS	MSO
XIY	SHA
PDX	DEN
SLC	SEA
HGH	DMK
CHQ	AMS
LAS	IAD
IAH	ZLO
SYD	HKT
IAD	RIC
PIR	DEN
PRG	BUD
YVR	PVG
BHX	FRA
BZN	DEN
IKA	HAM
LCA	LGW
PSE	MCO
MKE	PHL
TPA	BUF
BUD	VKO
ICN	SYD
CCS	PMV
FRA	MBJ
TNA	HET
YCG	YYC
BRS	INV
HKT	SIN
SLC	PDX
KID	ARN
BOG	UIB
MZT	GDL
LHE	BCN
XIY	CTU
TPA	GNV
YQR	YYC
LEJ	AMS
BOD	EDI
GRU	FLN
YXE	YYC
XNN	XIY
HAN	NNG
DEL	TPE
YXE	YEG
BTV	EWR
CGK	FOC
PNQ	DEL
IAH	SJU
CGQ	HFE
ICN	BKK
LGW	BLQ
GRR	EWR
SEA	GEG
AMS	ZAG
TVC	MSP
PVG	HAK
ORD	MEM
YKS	SVO
NBO	WJR
HKT	CGK
IND	ATL
SIN	MNL
CPH	LJU
SLC	PSC
MSP	BOS
IAH	GJT
ISB	DOH
EUG	PDX
ABV	KAN
YYC	MAN
PUS	GMP
BCN	BVA
CAN	ACX
LIH	SJC
DOH	BLR
HRB	TYN
KIX	CAN
HAM	FCO
ATL	MSP
JED	BWN
VIE	KRR
MDC	TTE
ORN	CMN
HEL	GDN
BOS	PHX
AJA	SXB
KSU	OSL
XMN	NNG
BOM	ADD
DTM	OTP
RIX	AES
BIA	LIL
CTS	TPE
AMS	VRA
PHL	SFO
HDY	BKK
GES	ILO
NOU	BNE
SAW	HTY
IAH	LOS
CUN	LGW
HAN	KUL
TUN	AMM
CPH	RIX
KJA	NMA
IPN	GRU
LGW	PVK
FWA	PGD
BWI	AUA
PDL	BOS
BVA	FEZ
CIA	VNO
EWR	MIA
DEL	PNQ
DOH	CAI
TPE	YNZ
PRG	SPU
VRA	YUL
DME	VOG
POZ	BVA
CLE	BNA
SHA	CTU
BOS	YOW
IAD	CRW
ZAG	ZAD
SJC	ORD
AMM	KRT
EWR	MAD
DUB	EWR
MNL	SJI
JDZ	XIY
DMK	KKC
FRA	DYU
TSN	FUG
BGF	CMN
MAN	BRE
TNA	HKG
SEA	YKM
TRF	TRD
BLQ	ZAG
ANC	ORD
MCE	LAX
AGA	LGW
IAD	RUH
LAX	YVR
CAN	KWE
LYS	ORN
MUC	BSL
BGA	BOG
TWB	SYD
MHD	DXB
ICN	DXB
LGA	RIC
STL	IRK
SDQ	MAD
CLT	GPT
DRW	KUL
NNG	KMG
ATL	ABE
FRA	YOW
BUD	BRI
CAI	LOS
VCP	BSB
KHI	SKZ
LJU	VIE
SHJ	BLR
PGD	AVL
BKK	MLE
OMA	DTW
ORD	OKC
PHL	SYR
ROV	TAS
VCE	LIL
TYS	EWR
CRL	FNI
WAW	PRG
ICN	BOM
SZX	HRB
SKG	BUD
LIL	AJA
WIL	LAU
CMN	BJL
ORD	EWR
SZG	FRA
NBO	CDG
BLQ	ORY
AJU	GRU
ORY	VCE
DXB	TUN
BNA	MSP
SJU	PTY
FOC	PEK
BSB	CNF
FRA	KIV
CZL	AZR
MAD	DXB
MSN	ATL
AGP	BIO
DME	FCO
NDG	PVG
BIL	SEA
PVG	WNZ
WUA	NAY
CNS	ADL
NYA	TJM
RBA	MAD
GAF	GAE
NBO	LUN
FLL	GUA
SVQ	BGY
PRG	BTS
VIE	BUD
TPE	CTU
MYR	PHL
WNZ	SYX
PIT	IAD
HYD	CCU
ESL	DME
KRK	KGS
PVG	CGO
UKB	SDJ
MCO	GRU
LGW	BRU
KRR	RMI
KHI	SHJ
ACE	SNN
JAV	JUV
KRO	SVX
LYS	OPO
PEK	KWL
PRG	BRI
ORY	LIG
HAJ	FRA
PVG	YYZ
MUC	CDG
PLU	POJ
NOJ	DME
DEN	SFO
PDX	ATL
ADD	FIH
CNF	RAO
EWR	XNA
STL	DEC
VKO	ORY
CCF	DUB
POA	GRU
DEN	EWR
EIN	PSA
FRA	ATL
NCE	LYS
HAN	BKK
PDX	MFR
SJU	BWI
SKP	ZAG
SXR	BOM
SGC	TJM
DMK	SGN
IAH	GRU
SEA	IAD
DEL	KHI
STR	RJK
FRA	WRO
DXB	MCT
PFO	KRK
LHR	BLR
CPH	IST
GYD	DME
SRG	DPS
LAS	SHV
SEA	DEN
LHR	LHE
FUK	SDJ
SAW	BRU
XIY	HFE
PTY	MGA
TPE	CGO
YCU	SZX
RIC	BOS
DAC	KHI
MUC	ACE
COS	IAH
ICN	SIN
HOU	FLL
STR	BRI
LIT	DCA
TXL	LIN
DXB	PVG
MSP	JFK
DRW	DIL
ORD	IND
MAO	TFF
LAS	GFK
WUH	SHE
KRK	BGO
MSP	ANC
ONT	SLC
CZX	SHE
FCO	MUC
LGW	BGI
CMN	GRU
BOI	SAN
KVA	STR
CDG	AMM
MIA	DEN
LOS	DOH
YYZ	BDL
RBA	MRS
TAS	CDG
OKC	SFO
ALC	GVA
VLC	CRL
MCO	YQM
DTW	DSM
HMO	CUN
SLC	MSO
KHH	PVG
CDG	TGD
POA	LIS
GRR	MCO
KUL	PER
ORD	TOL
REC	SSA
SVO	SGN
AZA	GRI
VAN	ADA
LBV	SSG
VNO	TRF
GTF	MSP
SKG	LGW
GNV	MIA
NAT	GRU
CKG	LZH
MDW	ABQ
SGN	HUI
BVA	BGY
MZT	LAX
DME	DWC
PSE	JFK
BPS	VCP
VDM	REL
CCJ	CJB
IKT	DYU
BRE	BGY
YVR	YQR
MHD	DOH
MUC	TXL
PSA	LIS
AGP	BRU
LBV	IST
AMS	ZRH
LAX	AKL
FAT	SEA
KJA	GYD
TEN	SZX
YQQ	YBL
ZRH	BRS
PUS	HKG
SYX	DME
SWA	CGO
AGP	WAW
CPH	SAW
XMN	KOW
SVG	KEF
OAK	MCI
PEK	CGQ
CTU	TSN
IKA	SAW
PFO	CHQ
PEU	LCE
PTY	LAS
MDW	PIT
CAN	SHE
IAD	FAY
MEM	DTW
DME	UUA
BRU	LJU
DME	BHK
STN	TGD
TAP	GUA
CTA	MUC
IAD	SJU
SLC	YYC
SEA	BOI
ICN	WUH
NCE	DXB
BOI	LAS
TRF	WAW
TYS	IAD
ZRH	JNB
CDG	BFS
JMU	SHE
AKL	NPL
VIX	GRU
MAN	OSL
UDI	CNF
ALB	MSP
FEZ	BCN
TIP	LAQ
LUZ	GDN
PVG	SJW
BPN	MDC
DOU	CGR
TRF	BGO
KRY	URC
SAL	MAD
YVR	YKA
IKA	BOM
LAP	MZT
MEX	CTM
CTA	OTP
DTW	RSW
FLR	FCO
VIE	SKG
DEL	NAG
DMK	NAW
WAW	RIX
DEL	JED
PFO	GLA
TGU	ATL
SHA	JDZ
SFO	JFK
TZX	AER
BAL	SAW
GVA	IBZ
NAV	IST
NBO	BKK
TPE	DLC
SJO	IAD
AMS	MRS
FMO	AYT
SOF	FRA
AGP	FMM
TPA	BWI
BLQ	VLC
SBW	BKI
KTM	DWC
BGY	TMP
CCS	MEX
BRI	PRG
HAN	PEK
NMA	OVB
TPE	WUH
TPE	BNE
BRU	SXB
BRE	ACE
LHR	BWI
AHB	ADE
ATL	DHN
HRE	LLW
ATH	SAW
PTY	ATL
CGN	FAO
ARN	SAW
EWB	HPN
MGA	ATL
ESB	VAN
DLE	OPO
CDG	VIE
MAR	PTY
TIP	CAI
MDW	RNO
RSW	BDL
XMN	KHN
GYN	CGB
SVX	IJK
JKR	KTM
YUM	PHX
DEN	AUS
CTU	SHA
RSW	TTN
TLS	CDG
SZG	SXF
FNC	LGW
BKK	CRK
AGP	MUC
VCE	FCO
MCI	CUN
CGR	CGB
HYD	BLR
BOS	CDG
CPT	UTN
BSL	STN
CPH	KRK
LBA	ALC
FCO	AUH
GDN	BRS
PHL	BNA
MUC	IAH
LHE	AUH
AMS	JFK
ARN	TXL
SIN	KLO
GVA	BUD
ATL	UIO
LWB	ATL
ROV	VIE
TAS	URC
BRU	AUH
TSF	CAG
JFK	CCS
XIY	TNA
SCL	BOG
GRU	CDG
NBO	IST
BOG	PSO
EIN	CHQ
SVO	KGD
GLF	SJO
IAH	BOS
MIA	LIM
HPN	PHL
AGP	AAL
TSJ	NGS
KCZ	ITM
ORD	WAW
VLN	MAR
URC	PEK
YNT	WUH
KWL	CKG
PVG	YBP
PHX	OGG
JFK	IST
BFI	CLM
UPN	TIJ
AGP	MRS
BWI	LHR
MAN	BVA
FEZ	NTE
DXB	NCE
DXB	KDH
YKS	KHV
FKS	CTS
EZE	FCO
BES	NCE
WUX	SHE
MIA	LAS
KVK	DME
STR	BIO
KZN	FRU
TOS	BGO
CGK	SIN
PEK	WNZ
KOW	CAN
EDI	AGP
CEK	TAS
CIA	SVQ
MIA	CLE
GUA	SAL
YYZ	YZR
LAS	LGW
SYX	YBP
AUH	SIN
YYC	GLA
BCN	OPO
BRS	EDI
BRU	GDN
DWC	MNL
MUX	JED
DVO	SIN
MPM	NBO
KUL	LBU
DOH	GVA
CGB	PVH
TPE	NKG
JFK	CDG
JJN	TPE
CAN	MIG
ZUH	HGH
OVB	DYU
IXD	DEL
HBE	BEN
CZL	HME
AGF	DCM
CUN	TRC
SIT	KTN
OSL	PRG
GLA	ALC
ATL	GSP
SKP	FMM
REC	FRA
TAS	PEK
ORF	JFK
VVO	SVO
HGH	LYI
PDX	PHL
HEL	CHQ
CLT	DEN
AER	SVO
MLX	SAW
EWR	SAT
FCO	CMN
CMI	ORD
MDU	POM
SVO	PVG
HAK	KHN
SJC	PHX
LIM	PTY
KGS	HAJ
TGO	HET
ALC	LGW
CHA	DCA
SHA	LYI
OMA	SLC
MFM	WUX
YYC	YQR
IKA	MCT
PVG	WUH
BKK	MDL
LGA	BTV
KHH	HAN
LAX	PSP
YNT	CGQ
IAH	LHR
CTA	MAD
VIE	BRE
NYO	BCN
WGA	MEL
BKK	HYD
LOS	ABJ
MCT	BKK
CTA	AOI
GVA	BCN
ABV	ABB
VIE	BRU
JED	ASW
LGB	IAD
ZLO	TIJ
TSF	BUD
IKA	GYD
AGA	MUC
KMG	KHN
WAW	IST
CEK	PRG
YYZ	LIS
PDX	SFO
CTU	NAY
DCA	MSN
SAT	MSP
MYR	BOS
SJU	FRA
KMG	SHA
MEX	SNA
WUH	CNX
SVX	DWC
MLX	IST
KRT	NBO
DGO	IAH
AZR	CZL
GWD	MCT
NKG	CGQ
AUH	BOM
MIA	PIT
RTM	IST
BWN	JED
FAO	BLK
DEL	FRA
NBO	KGL
PHL	SLC
PBI	DTW
DLA	ADD
WAW	LHR
SCL	MIA
MSY	SLC
MCO	BOS
RAK	MUC
ORY	YUL
TLC	MTY
FRA	CTU
PFO	SOF
CUU	GDL
HAM	IST
CNY	SLC
NTE	ORY
MNL	VRC
KHS	MCT
KTM	MCT
NBO	BKO
DAL	ATL
UIO	BOG
CAN	KUL
PIT	EWR
DUB	OTP
FLL	GSP
MHQ	HEL
SYD	TWB
TJM	TAS
KHN	WNZ
VKO	FCO
CRL	NYO
EXT	CDG
MIA	AUA
WMI	NYO
TIJ	ZCL
LYS	PRG
DME	TUN
MYJ	KIX
LIS	NTE
LGW	YYC
BSL	BUD
KUL	NGO
ALB	CLT
DXB	IST
SIN	PKU
MSP	YQR
ZRH	CMN
DTW	MDT
MSP	DAY
MSP	DTW
CID	PGD
TAO	WNZ
MAD	PNA
CCU	DOH
LPL	WMI
CAN	TPE
YOW	CLT
CLE	IAH
CTS	HNL
MNL	BWN
PRG	RIX
MLI	LAS
AZA	PIA
YUL	DOH
TUF	RAK
BHX	FLR
FRA	GOJ
RIX	LCA
CUN	BOG
HAV	BOG
SCL	MAD
CGQ	PEK
KGS	BRU
KDH	MHD
BGR	LGA
LHR	ORK
ALC	TKU
MSP	SLC
GRR	LGA
HAV	ORY
HKG	PER
DPS	TPE
STN	VNO
LNK	MSP
LGW	BGO
ALB	IAD
KGS	FRA
PRG	IST
EWR	TYS
GRU	ASU
LIS	FOR
BLR	CDG
BIA	LGW
KLO	TPE
LAS	AUS
DAC	PBH
JFK	SMF
GLA	BRS
SSJ	BOO
LEI	BHX
ORY	CZL
GRU	CNF
LGA	YUL
SHA	CGO
KIX	PVG
CNF	GRU
CIA	MAN
MRS	CTA
CRL	BUD
CGQ	YNT
EWB	ACK
ARN	EDI
SIP	DME
BKK	TAS
ESB	ERC
MFM	OKJ
YUL	YYG
DAC	MCT
MUC	OTP
AMS	NCE
OVB	NMA
ATL	MCO
VIE	LJU
SUB	JHB
PMO	BRI
CDG	NAP
CKG	YCU
LJU	WAW
FOC	SYX
ADB	NTE
YYZ	AMS
CIH	NAY
DTM	SPU
DME	GOJ
RIX	TRD
LNK	DEN
PIT	YYZ
HMO	LMM
LHR	EBB
DOH	MAN
DRS	CGN
HOB	IAH
CPT	ELS
NBO	APL
FRA	BEG
IKT	KYZ
RIC	IAD
KEF	LHR
OTP	LIN
KUL	SIN
WNZ	SJW
MYR	LGA
PUS	MNL
HYD	SIN
ORY	RAK
YUL	LIS
MAD	JED
MIA	CDG
BSB	VCP
CMH	YYZ
IBZ	MRS
CGO	TAO
DUD	WLG
TAO	SHA
LGW	DUB
LYS	AMS
PHL	ABE
BEY	BRU
TEN	PEK
CED	ADL
FRA	OSL
ARN	BCN
PEI	PTY
BEG	TUN
MLE	DXB
SAW	JED
FRA	SDQ
KUL	JHB
EIN	SAW
NNY	CTU
DCA	PNS
VVO	IKT
EDI	SXF
MMK	CEE
CGK	SYD
LBV	FIH
VIE	LHR
ACE	BLQ
YYC	SAN
HAJ	SAW
PEK	KMG
GVA	BDS
BRU	BMA
BMU	LOP
EVN	SHJ
CTU	YNT
SJU	YYZ
DAL	AMA
PEK	SZX
EWR	YUL
FRA	MUC
DME	NMA
LTN	BOD
POM	MNL
KHN	TNA
SAW	BAL
XIY	LXA
FLN	JCB
LGW	BSL
CIA	KRK
BIS	MSP
CAN	TEN
SAW	ASF
HEL	AMS
BRE	CDG
TUN	BCN
RIC	JFK
KUL	COK
YLW	YVR
TGO	TNA
RUH	CGK
KLO	SIN
NYM	DME
LAS	YVR
FLL	ACY
ZRH	BOS
HKG	KHN
AMS	SXB
EDI	BRE
LAS	MAF
STS	SEA
HAM	BRU
ORD	ZRH
FRU	IKT
SJJ	MUC
AEP	BHI
MIG	PVG
CDG	RBA
EDI	DUB
RTB	LCE
CBB	CIJ
LHR	IBZ
GRU	MEX
GOA	CAG
IMP	SLZ
HKG	KWL
YYC	YCD
CUN	STL
ORD	TYS
CGK	XMN
BHX	INV
BRE	ZRH
TPE	SYD
CKG	BHY
ABZ	LGW
LIS	REC
IAD	FCO
ORY	TLM
AGP	HAM
MIA	AMS
ABJ	IST
VIE	BLQ
LIN	PRG
VCP	FOR
FUK	ICN
FLR	LYS
EDI	BSL
BOM	GAU
TUG	MNL
KUL	KMG
CLT	PHL
YNZ	XIY
HGH	LZO
EWR	BNA
TXL	CGN
ITO	HNL
FRA	PHL
ITM	FKS
BOS	DTW
SAL	MEX
MIA	LGA
TFF	ERN
SCL	PMC
KUL	JED
ORY	IKA
BDL	BWI
KIJ	NKM
KZR	IST
AGP	SNN
SEA	ORD
AEP	NQN
YYC	YKA
BLQ	BRU
NKG	SYX
TSA	CTU
SEA	ONT
CGO	HAK
IBZ	LPL
AUS	PHX
SXF	LTN
DOH	CDG
JFK	SDF
PEK	JJN
MHD	XBJ
STR	FLR
HNL	MEL
PFO	LTN
YYF	YVR
NKG	CAN
LGW	YUL
DEN	TPA
BWN	MEL
GRI	AZA
PBH	CCU
FIH	FKI
DRW	CNS
LAS	IDA
CIA	CRL
BZR	EDI
LIM	AMS
YEG	DEN
MAG	HGU
FNC	FRA
HET	TNA
CGR	DOU
TSF	BVA
LIN	OTP
TNA	CGO
ATL	YYZ
ISB	IST
ABQ	SFO
EWR	SLC
BHD	ABZ
SLC	AUS
IAD	FLL
KHH	TNA
MCO	FRA
LHR	AUH
MPL	CMN
SWA	NNG
SXB	MRS
ALS	FMN
BFJ	SHA
BRU	LHR
SIN	KWE
BWI	SFO
HBX	BLR
SPU	OSL
PRG	LIN
PDX	PSP
DCA	PIT
MAG	WWK
PUS	WUH
BOS	MCO
NSI	BRU
SZZ	LPL
MEX	LIM
CNX	DMK
AHB	SHJ
IQQ	SCL
ADD	CAI
BWN	BKI
KUF	PRG
TIA	SAW
NCE	TXL
MRS	OPO
AMS	CGN
CDG	EZE
ORD	SAN
CPT	BFN
STN	RZE
HOU	BHM
CHS	ATL
ARN	CPH
DTW	CHS
LCY	DUB
CDG	MIR
MCO	YHZ
LPL	TRF
TSR	LTN
DPS	CGK
MAD	LCY
RIX	OLB
MSP	CID
LCA	OTP
GDN	SVG
BSL	SAW
JUV	NAQ
PLU	GVR
LCY	ANR
TMT	STM
MCI	LAX
SVG	NCL
SFO	MDW
RTM	EGC
SAL	SJO
PEZ	DME
PBH	GAU
IST	MSR
CHQ	CIA
AMM	RUH
RNO	LAX
LHR	MUC
MDC	SUB
SMF	OGG
ORD	CMH
SEA	LAX
HEL	LIS
LGA	DAY
CTA	CDG
FLL	PHX
XMN	XIY
DTW	SDF
ISG	FUK
HKG	TNA
JFK	SCL
LCA	KRR
OTP	DOH
PVG	JFK
YUL	YYC
ORD	CVG
SHJ	DOH
GVA	VIE
MRY	SAN
SSA	PNZ
ARN	IKA
ACE	SXF
BSL	BOD
SAL	CLO
UDI	PLU
PRG	AGP
AUH	CAI
SVG	CPH
BKK	TNR
SFB	LIT
YYC	YXX
DEN	DAY
MAD	EIN
ZCO	CCP
RUH	KUL
WUX	DLC
DYU	DEL
FMN	SOW
TXL	AUH
PVU	LAX
IST	HAJ
PIK	BCN
SAW	TBS
SYX	NKG
MYY	BKI
TUL	LAS
BRS	BOD
INL	BRD
MEX	YUL
ALC	BOH
DEN	YVR
JED	ORN
PTY	BOS
STL	CMH
GLA	AMS
VKO	EVN
GNY	ADB
KUF	EVN
MSY	YYZ
UIB	EOH
ORD	CPH
CDG	MEX
MCI	MSP
BGY	VLC
ORD	MCI
AMM	SHJ
FMO	AGP
MDW	CUN
POP	YHZ
BHX	LEI
DUB	EXT
ATM	ORX
FCO	VKO
DTW	PIT
GDN	WAW
ORD	CAE
CAG	PSR
NCE	SNN
DTM	FAO
FCO	DUB
SYX	WUX
LTN	CRA
MAD	ZRH
VIE	BCN
MAN	PVK
DEN	SJO
SAT	ORD
ICN	KOJ
HAN	ICN
AMS	LYS
CAY	ORY
CGB	LDB
HNL	JFK
VCE	AMS
OTP	ZRH
RIX	TKU
RIX	VCE
LAD	NBO
LIL	MRS
MEM	LAX
YYZ	YWG
TRD	GDN
BDL	PHL
BNE	BKK
MVR	NSI
LHR	BLQ
COK	MLE
PEK	CPH
KJA	SKD
BNN	OSL
HMA	NJC
FCO	SXF
FLL	KIN
LCE	TGU
SFB	AVL
BOS	PQI
LUO	LAD
HKG	SIN
SHJ	ISB
MHD	KBL
FCO	SKP
PHL	ATL
TAO	KHN
JED	LHR
ICN	UBJ
YBP	XIY
KIV	DME
DAY	DCA
ARN	AAL
EWR	YQM
STL	CVG
SHJ	ROV
SEA	PHL
CTS	HKD
ARN	TKU
NAP	EIN
OPO	STN
AMS	HRE
CNF	GYN
JFK	SAP
BGR	PIE
SLZ	BSB
AMM	BEN
MSY	HOU
DEN	BNA
ESM	CLO
LGW	KRK
PEK	ZHA
MYY	LBU
SDJ	NGO
LGA	CAK
DXB	RUH
DYU	CEK
BCN	RTM
MEX	GRU
ATL	EWN
PMC	CCP
FLR	STR
BRU	LYS
NTE	LGW
ARN	PMO
PDX	YYC
SAW	VAS
CDG	MUC
AMS	BRE
DBV	CGN
POP	YYZ
JNG	HRB
SEN	ALC
TAS	GOJ
GEG	SEA
YWL	YQZ
OVD	STN
GFK	AZA
HKG	DAC
CLT	GNV
KJA	DXB
PDX	IAH
ATL	HNL
DUB	ABZ
BHQ	ADL
ELP	PHX
BOI	SFO
ATL	CHS
PHL	YUL
SAL	HAV
HOU	ISP
SAW	SHJ
TLS	YUL
OSS	IST
HAM	LIS
LZH	KMG
BUF	EWR
WRE	AKL
DME	KZN
VOG	DME
MSP	GEG
POP	MIA
EUG	AZA
TGG	MYY
ZRH	CDG
EBL	AMM
DEL	FCO
LCE	SAP
BUR	SFO
MLE	CAN
SAN	MSP
PFO	BRS
AGP	CDG
TUN	OUA
FRA	MIA
RGL	RGA
IST	MCT
KOE	ENE
HAK	NNG
DME	CGN
VLC	RTM
OSL	MUC
SAL	YYZ
COR	MDZ
STR	CPH
ATL	BHM
RIX	TAS
MAD	MIA
AVL	SFB
DME	PED
CPT	GRJ
KBV	KUL
SJO	DAV
FLL	SEA
FAO	BHD
PEK	XNN
RSW	PHL
DME	DXB
IAH	MBJ
CPH	SPU
MNL	LHR
IAH	ACY
SRG	SIN
STN	POZ
CGH	BPS
KIX	FRA
WNZ	TAO
JCB	ERM
NNG	HKG
RSW	MSP
TIJ	CUL
FLL	CTG
NAY	CKG
GDL	IAH
JNB	LLW
IAH	DGO
CTA	LGW
STL	MBJ
FCO	PHL
ARN	SVO
LZO	KMG
KHI	AUH
PEK	LYI
KWE	PVG
LRT	LYS
COO	ABJ
RSW	CMH
ADE	IST
ATL	AVP
LHR	JED
KTW	TRF
GYN	GRU
MCO	CLE
CAG	BVA
MSY	MDW
RUH	LHE
FRA	ADD
HAV	EZE
FRA	SHE
HEL	TKU
KGA	FIH
RUH	AUH
LGA	CVG
EUG	SEA
PGD	TYS
CIA	EIN
VCP	PFB
ACC	FNA
ATH	ARN
CMH	RNO
BRU	MAN
RDZ	ORY
PKY	SUB
YTY	CAN
AJA	OLB
PVR	YVR
BRU	BSL
BIO	VGO
LAS	YEG
ATH	ADB
KIV	ATH
SMF	IAD
HOT	MEM
YYZ	VIE
MDW	BKG
ADL	DXB
MCZ	BSB
POA	CGH
BRU	DEL
FCO	AGP
BSL	AJA
GRU	IOS
ORD	GRU
ATL	CAE
HRB	YCU
BRE	STN
YKS	GDX
AER	OMS
SWA	HAK
GAU	DEL
EDI	KOI
JFK	BOS
MEL	TSV
HYD	LHR
LHR	RUH
VGO	MAD
CHC	HKK
FLL	LIM
ORD	PTY
QRO	TIJ
DOH	IAD
SXF	GVA
WNZ	XIY
KMG	XIC
DSM	SFB
DKR	BCN
XIC	CTU
BDL	LAX
DME	SYX
NMA	SVX
MSP	FWA
ELM	SFB
SJU	DTW
CAN	YNT
XMN	SYX
IAH	AMA
CVG	MSY
GRU	LAX
EWR	BQN
BCN	YUL
FCO	LTN
SZX	KWL
PNK	KCH
SMF	SLC
TXL	STR
SIN	BWN
REL	BHI
HKT	SYD
IAD	IAH
EIN	BLQ
OKC	DTW
CVG	GRR
ATL	DAY
DEN	CYS
MIA	BZE
ATL	MKE
CAN	LHR
IAH	LCH
CKG	XIC
ACE	SDR
ATL	JFK
BME	MEL
GDL	LAP
KSC	PRG
CCS	MAD
SAN	MDW
LHR	KEF
MSP	DEN
XNN	WUH
DLC	JMU
CPH	ALC
NGO	ICN
CCJ	RUH
SVG	GDN
DMK	KHN
LIS	TMS
ALC	EXT
LGW	NCE
LAS	JFK
IST	ZRH
PEW	SHJ
TSV	BNE
GYE	ESM
CAI	DXB
IAD	YYZ
SLC	GDL
ADE	DXB
MNL	PVG
UDI	GRU
MEX	TAP
BGI	MAN
CUN	MAD
DTW	OKC
SZG	AYT
PHL	TPA
SIN	JNB
VCE	NCL
BOG	FLA
BEG	CPH
FOC	TNA
KHH	ICN
IMF	IXS
GSO	DCA
ZRH	IST
LIM	MAD
CGK	SRG
IAH	ELP
BSL	KGS
RUH	CCJ
PVD	ATL
CLE	FKL
BCN	LEI
FMA	AEP
PHX	MIA
PER	PHE
ADB	ATH
MAD	MRS
FRA	LAS
YYZ	DUB
IST	HEL
HAN	HUI
IAH	TPA
MSY	DCA
AMM	TIP
STN	LUZ
AUA	CCS
WAW	SZZ
GRU	SSA
PDT	PDX
BPN	PLW
APL	BEW
NLA	ADD
IAH	PDX
NAP	FCO
SJJ	ZAG
DME	TJM
GDN	WMI
LAX	SFO
DXB	VCE
KIX	HKD
AGP	NCL
FCO	HAJ
GVA	IAD
EVN	WAW
PHL	MCO
CDG	VCE
CMH	IAH
MRS	NTE
CDG	BUD
BZE	FRS
JNB	KIM
SEN	EDI
ORY	SVQ
AUC	BOG
TOF	DME
FRA	LJU
SVX	KZN
RTB	IAH
ATL	ORD
PSA	CRL
TAO	KIX
CLE	BUF
LIN	PSR
BVA	SVQ
FLL	ARN
LAS	DEN
MEL	WGA
TLS	LYS
DBV	HAM
BSO	MNL
ESB	TZX
MNL	SFO
BPN	KUL
LHR	YEG
ABV	COO
IST	PEK
BRU	NCE
PFO	LBA
IND	LGA
OUA	ADD
TSN	KHN
DTW	IAD
HET	NZH
MCO	MEX
YXS	YYC
TJM	NYM
MUC	HAJ
CGK	CAI
HOU	HRL
CMN	OXB
IRK	STL
BRU	HAM
ATH	LCA
TRC	MEX
AMS	KGL
YYT	YUL
BRS	BRU
MKE	LAS
HKT	CAN
SZX	YTY
HNL	EWR
COS	SLC
JNB	HRE
NBO	KRT
MAD	ARN
LYS	RAK
STN	KUN
KRK	NYO
VCP	VIX
SKP	TSF
NCL	VCE
CPH	PVG
SAW	NAV
HRB	YNZ
XMN	YTY
DEL	ICN
LJU	SKP
HAK	SWA
PRA	AEP
BOD	AJA
BEL	BVS
YXU	YOW
DUB	BLK
BHY	CKG
PEK	LZO
GZP	OSL
ORD	PNS
DXB	ADE
MTY	PVR
CLT	AUA
JNB	BFN
ORY	BLQ
IXC	DEL
IAH	HNL
BMA	SDL
ORD	DSM
LAX	IND
RUH	BOM
JED	CMN
RTM	LCY
IST	CDG
LIS	VLC
CAG	LIN
ASM	ADE
ZYI	SHA
WUH	FOC
NCE	GVA
PTY	MAD
BGW	SHJ
CMN	FEZ
DEL	JFK
NBO	MWZ
CAN	HDG
KRR	EGO
PSA	LPL
BDS	MUC
ADB	SAW
SPU	CPH
SYD	TRO
YYZ	RSW
TAM	MEX
MAN	RAK
DAY	ORD
LIL	TLS
VIE	CTA
PNS	HOU
LHR	SIN
CMB	KUL
CFR	AJA
SXF	LGW
LEJ	ZRH
BHX	HAJ
YIC	SZX
KSE	EBB
HYD	RPR
PEK	CTU
SIN	ILO
ARN	VIE
DUB	VCE
WMI	WRO
YYZ	AZS
YXU	YYC
BAX	SVO
MSP	ICT
GRU	VIX
IAD	CDG
LYS	NTE
AUH	SAH
YUL	YOW
AMS	MAD
BHY	LYA
BKI	KUL
CAI	MAN
NKG	XNN
CLT	SMF
NGS	KIX
DEL	CMB
XIY	BAV
TSA	HFE
MEM	CLT
MLE	SIN
AGP	EIN
YYC	YCG
JFK	BWI
KIX	DPS
IST	MLE
SVO	MRS
MMK	ARH
VLN	PTY
LAS	IND
DRS	AYT
BEG	BNX
GDL	FAT
PDL	ORY
LIT	STL
YWG	YQT
BKK	AKL
ORD	ORF
KSY	IST
MAD	VIE
PVG	TIJ
BOO	BGO
DEN	AIA
SZZ	OSL
BKG	MDW
PFO	STN
KUL	MYY
LHR	PHL
MCO	EYW
IBZ	MUC
DMK	CGK
TNA	KHH
MHK	ORD
MAD	TLS
DXB	CCU
HLA	DUR
ROB	ACC
ROV	IST
SOU	EGC
ORD	IST
MUC	SVO
BKK	MFM
BOH	CCF
NSI	CDG
YYC	VRA
RTW	EVN
LGW	VCE
EXT	FAO
BNA	LAS
PEG	CAG
DME	TAS
ARN	KRK
IAH	MUC
RSW	MDW
CAG	BSL
NBO	SAH
GNM	SSA
MUC	PVG
MUC	CTA
STR	IST
VCE	MAN
SFO	SAL
DCA	ALB
YFC	YOW
GZT	SAW
HJR	VNS
TBB	SGN
NNG	HAN
IAH	LIR
OSL	KKN
FAO	EDI
BOS	LHR
UFA	IST
JNB	BBK
HDY	CNX
PVG	NAO
MUC	STR
SXB	PMO
STN	WMI
DEN	CLT
NAY	HLH
PHL	PWM
FRA	SJU
STN	OTP
CAB	LAD
JAN	CLT
YUM	LAX
ABJ	DLA
STL	MCI
PBI	CLE
LTN	PSA
BDL	MDW
OAK	ABQ
DME	KIV
DUB	BGY
PRG	SVX
BOG	SJU
MEI	ATL
SLC	CPR
GSP	ORD
LYS	LIL
CUN	CZM
TPE	HAN
SEA	AUS
PUS	TAO
AGU	TIJ
CDG	GOA
CKG	TAO
SDJ	UKB
LDB	POA
MFR	SFO
KKC	DMK
YHZ	YOW
LHR	DEL
SHA	SYX
BIO	BCN
JFK	SAV
CGB	BSB
MCX	DME
CNX	PHS
TAS	OVB
IND	DEN
OTP	MAD
IAH	IAD
CDG	OTP
TLC	FLL
POP	FRA
CAK	ATL
PWM	JFK
MAN	CDG
PLU	IPN
PMV	MAO
JJN	MFM
LGW	BUD
URC	DNH
AXT	NGO
ITM	SDJ
BVA	VNO
SHE	WUH
LGW	FNA
BFS	MJV
DIL	SIN
STR	ATL
AOI	TXL
OAK	OKC
DOH	LOS
YUL	DEN
CTU	MEL
MAN	CGN
TMP	STN
MAD	FRA
BVA	PSR
HKG	KHV
VLC	TSR
CEK	EVN
AUH	GRU
CDG	KEF
EIN	INN
CVG	MCO
LCA	BEY
CMN	MPL
ROB	ABJ
BUF	BOS
TPA	IAH
TXN	SHA
HRB	KIX
AMM	CDG
KGD	TXL
MTY	SAT
GUA	TGU
KAN	BEY
SYD	MRZ
ATL	SLC
VVI	MAD
SCL	JFK
LKO	RUH
PDX	BIL
JFK	AZS
ATL	SHV
LHR	STR
AMS	SEA
ZRH	MCT
JOG	KUL
KTW	DUB
DBV	BHX
CGO	LHW
BVA	WRO
AMS	NTE
MSZ	LAD
STN	BZG
CZX	CAN
TIP	MAD
TPE	WUX
CDG	CAI
IAD	HNL
JED	JNB
COK	DXB
BRL	STL
LIT	DAL
DXB	TBS
STN	PEG
MFM	JJN
ADL	WYA
ZAG	BCN
DKR	ORY
ATL	BOG
SZX	KMG
OTP	SVO
TOB	HBE
XIY	WUS
STL	OKC
CGN	SKP
ORD	SAL
CLE	TTN
JFK	GEO
PHL	BGM
HEL	JFK
KOW	KHN
ZAL	SCL
ORD	XNA
ABV	CBQ
ARN	ATH
VCE	LYS
KUL	HGH
MPM	LIS
OLB	LGW
CAN	DPS
HRO	MEM
SIN	VTZ
MAN	VIE
SNA	SMF
MXL	HMO
ATL	MTY
STN	HAJ
XIY	SZX
BHS	PKE
TIP	TOB
ZRH	TGD
SEA	BUR
VTZ	SIN
JNU	SEA
NKG	XIY
CTA	CGN
CKG	CAN
RUH	SAW
SMF	CLT
CVG	JAX
GDL	LMM
HAJ	BRU
VLC	AGP
SZZ	STN
CRL	SKG
MAF	IAH
HPN	TPA
ATQ	BOM
SLL	DXB
KWL	HFE
MAD	TXL
STR	OLB
NGO	SGN
SOF	STN
DYU	KZN
MAD	JFK
ADD	LHR
FWA	MSP
VNO	RIX
SIN	HAK
TSA	CKG
POA	CWB
KUF	DWC
EUG	DEN
HDY	DMK
LIS	LGW
SIN	WUH
VCA	HAN
LAS	LAX
KUL	IST
KRK	BLQ
SGC	KIV
DME	TGD
LHR	YVR
MSP	YXE
NGO	TSN
TRF	LPL
SFO	LAS
CVG	TTN
RSW	LGA
AUH	TXL
MCI	CLT
MEL	CHC
BOI	MSP
CTU	XIC
BOS	EWR
MQM	ADB
BRS	LIS
CDG	TUN
DAC	CCU
STR	AMS
YVR	YEG
DKR	FNA
DLC	LYA
HFE	CGQ
LXA	KTM
ATH	BCN
LKO	DXB
SZX	YBP
DYR	KHV
MPL	FEZ
ABQ	MSP
KHN	XIY
KHH	WUH
NCE	RTM
DME	HKG
HAJ	DUB
YVR	OGG
SVO	SOF
NNG	KWE
KZN	SHJ
CHS	JFK
RAK	RTM
FCO	NTE
DEN	IND
BNX	BEG
AIA	CDR
DXB	ZAH
BUF	ORD
YUL	BCN
LHR	VIE
FUK	TAO
AEP	FTE
PGD	DSM
CUN	YYZ
IST	SYZ
LPL	MAD
SAW	KSY
GOU	NSI
CZM	DEN
SIN	HYD
PMV	HAV
TIA	LJU
LCY	VCE
LHE	DXB
YYC	YLW
CMN	CAI
DCA	CHA
SFN	AEP
LIS	YUL
SJU	MCO
BRU	BEY
BIO	FRA
BOD	BES
ARN	SJJ
MBJ	MCO
ALB	DCA
EBL	IST
ATL	HOU
TLS	MRS
BHX	TXL
BHX	RAK
LJU	SJJ
SMX	LAX
DCA	YYZ
HAK	PVG
DME	CSY
DOH	IST
LAX	ZCL
KUT	VNO
YTY	CTU
SKD	KZN
TUO	AKL
DNH	HGH
BQN	JFK
EYW	TPA
SOF	BEG
EWR	BWI
BOH	PSA
CLT	CUN
BWI	GSP
ALC	BSL
FUK	HNL
MCT	FRA
BRU	LGW
GVA	HEL
TPE	YNT
MSP	PIT
IKA	ESB
GYE	PTY
AUH	BLR
MAN	INV
TLS	MUC
GDL	CEN
CAN	WUH
PIE	FWA
BOM	IKA
VIE	ROV
VIE	LIN
DEN	YUL
MEX	GUA
IKA	ORY
ILG	RSW
SPU	OSI
LTN	MJV
FUK	CAN
POL	BEW
FLL	BDL
MAD	LIN
EDI	CGN
AVN	AJA
YYC	YQU
ATL	FSM
LHR	LIN
ZRH	SIN
CLT	TLH
BOM	DIU
DEL	LHE
DJB	CGK
CGK	AUH
GDN	BVA
JJN	PEK
STR	KRK
CNX	UTH
KUL	SYD
FNJ	PEK
BDL	ATL
BEG	TGD
TGD	STN
OKJ	PVG
ORD	BMI
SYD	DXB
BOM	IXU
LHR	BEG
HRB	SVX
ADB	GNY
CMB	AUH
ROV	PRG
OGX	ELG
PBC	GDL
SFA	CDG
NAP	CTA
YVR	YXY
IAH	BWI
AGP	BFS
TEN	CAN
PFO	KRR
JFK	ROC
DUB	KRK
FRA	MRS
SJO	MGA
HNL	IAH
EDI	HAM
MEL	BKK
MEX	IAH
SAW	DNZ
ICN	TAK
YQT	YAG
CAN	TNA
IBZ	MAN
BRU	WRO
MAD	CIA
LGW	SNN
LAX	AGU
HOT	ELD
BWI	MSP
VSA	IAH
KIJ	PVG
GMA	MDK
OPO	ZRH
HEL	AYT
ATL	FWA
FCO	VNO
ORD	JAN
SZG	STN
SAP	BZE
MUC	IAD
GYE	LIM
AGP	BLK
NCL	ACE
FRA	GWT
CAE	DCA
SVO	URC
TYN	HET
TXL	GDN
YYZ	MAN
MRS	ETZ
KLX	SKG
MGA	SJO
KUF	FRA
SEA	PUW
BRU	OSL
LLW	NBO
DEN	MIA
ADD	OUA
IAD	ZRH
DOH	GRU
ROC	YYZ
SDL	BMA
ATH	HEL
DCA	FLL
BAV	CAN
IST	VAN
NCE	ARN
AYT	GRQ
BKO	NBO
CGK	PNK
CAN	NNY
FCO	SVO
MAD	EDI
OKC	SFB
IAH	GRK
DTM	STN
CHQ	WRO
ATL	AMS
JFK	AMM
RIX	BRU
LHE	MUX
SIN	SUB
NNG	FOC
HOU	GSP
TUR	BEL
TBZ	DXB
KIN	BGI
TXL	DBV
HFE	CKG
STL	SAT
SSG	DLA
TLH	MIA
CHQ	CRL
PEK	JDZ
CRL	AGP
TWF	SLC
KWL	KWE
STL	MKE
TXL	BRI
MEX	EZE
GOA	BRI
CGH	CGR
DEL	VTZ
BEN	HBE
CGO	NNY
DTW	SYR
PEK	CTS
JED	TIP
SEA	PSC
IST	SVX
SPU	DTM
DCA	SEA
AEP	MDZ
HEL	SIN
OAK	AUS
FDH	IST
BEL	MCP
LTN	LUZ
SAW	KRR
BRS	GDN
MDK	GMA
LCA	DOH
FCO	FRA
NYM	UFA
DKR	LOS
CLT	PHX
KTL	WIL
APF	MIA
ARN	VBY
GLA	LGW
SAW	SXF
POZ	BRS
LHR	BEY
ALC	EDI
CNF	BPS
AEP	PSS
FAY	DCA
MAD	BOD
PHX	FAT
AUH	AMM
TUN	GAF
STR	SAW
HBE	TIP
MOB	CLT
GRU	DXB
LGW	CMN
BHX	FAO
RIC	ORD
TPE	BKK
PER	HKT
BRE	VNO
WUH	XIY
BRE	SKG
LBV	NSI
CPH	JFK
BSL	MAN
VLC	BRI
TAS	FRU
JED	KUL
ORY	PUF
OMS	EVN
SJC	ATL
FRA	EDI
DOH	LCA
LBV	COO
LPB	TDD
CHQ	PFO
ATL	TYS
LAS	PIT
SDR	STN
PVD	SLC
CLE	PHX
SLC	MSY
ALC	EIN
DIR	JIJ
TAO	KMG
KDH	DXB
SGN	KHH
DLC	XMN
VLC	PRG
AMM	FCO
TUF	DUB
SGN	KUL
KBL	DEL
AUH	HKG
NKG	URC
BOS	LAX
ZHY	XNN
YQZ	YVR
MCI	FLL
BEG	MUC
AGP	DME
AUH	DEL
SJW	KMG
SOF	LGW
BFS	AGP
MUC	BOM
HEL	MAN
ESB	EBL
CGQ	CTU
FRA	PUY
CLO	UIB
CMN	TUN
BRI	BGY
ACE	LBA
ISB	AUH
KTM	BHR
GMO	ABV
OPO	MRS
SFO	OGG
IKA	VIE
VPE	NOV
BGO	KTW
YEG	YYZ
KWE	SYX
PVH	BSB
DEL	RPR
XNN	GOQ
CRL	BCN
PHX	ELP
RSW	JFK
YUL	EWR
DKR	ZIG
LAD	BZV
FCO	AMM
OPO	MAD
ZRH	DEL
PIT	TPA
YNT	HGH
HRB	SZX
ORD	TUL
HKG	KMG
CCS	BOG
NCE	ETZ
WAW	OTP
LIM	SDQ
HNL	PDX
SSJ	TRD
CPH	EIN
SJC	GDL
SXF	NCE
GZO	HIR
CRL	FAO
URC	OVB
VCE	LHR
BUD	CAI
KHH	MNL
HFE	TAO
MCO	MAN
MUC	ATL
SZB	SIN
FNC	GLA
TAO	FUK
PNQ	NAG
ZRH	BEG
FRA	OTP
CPH	HAM
COS	DEN
LIS	EIN
DXB	JUB
VOG	DXB
FRA	TAB
PSP	SMF
TKU	ALC
LVI	HRE
SSA	NAT
KKN	OSL
LHR	PVG
LGW	AAL
TPE	HGH
PHX	FLG
BGI	KIN
MCI	YYZ
FLL	TLC
FCO	TGD
IAD	AUH
ROS	AEP
TYN	TNA
VIE	BRN
BVH	CGB
LAS	GJT
TUN	DME
DME	TOF
ITM	KOJ
SLC	EWR
HAN	MNL
CRL	PEG
AES	GDN
JHB	MYY
ALB	ATL
LIL	LGG
OKC	MDW
CDG	VLC
PVG	PUS
BZE	RTB
KZN	OSS
DTW	FLL
MEM	TPA
FOC	HKG
BGY	MAD
RSW	MCO
LIS	YYZ
SEA	MIA
EGO	FRU
SHE	TPE
GSO	DTW
NKG	TYN
LHR	DUB
VKO	KUT
AMS	DOH
CCU	IXR
DPS	PLM
HAM	VIE
BUD	CIA
NGO	PUS
SFB	SPI
RBR	PVH
LEB	BOS
ULK	IKT
IAH	DAL
KUL	ADL
NAS	MCO
SJU	ATL
KBV	DMK
ADD	BEY
HKG	ZHA
GRU	ROS
CLT	PIT
HKK	CHC
ATL	OMA
KHN	SHA
LHR	HYD
FUN	SUV
DUB	NAP
IRA	HIR
TPE	HRB
NKG	SIN
KBL	IKA
NCL	MJV
CUN	ORD
DUR	HRE
NOZ	DME
IKT	DME
EIN	ACE
AMS	KRK
PHX	SLC
PSP	DEN
HFE	KWE
KOW	PEK
VPS	CLT
TPE	CGK
KOJ	PVG
AZS	SJU
BLQ	SVO
YVR	SHE
ASF	KZN
BUF	CLE
KTW	EIN
LYS	QSF
LAX	GDL
SJO	MCO
JED	SUB
SDR	EDI
JFK	POP
UME	ARN
SGN	CGK
SFB	TYS
LXR	CDG
UFA	TAS
STN	BGY
EWR	GRU
BGY	STN
DYU	KRR
KHI	JED
KMG	LZH
MAN	BCN
MRS	FRA
RJK	ZAG
LHR	BOS
DEN	HSV
EDI	OSL
MSP	ABQ
ZRH	JFK
ADL	AKL
SKP	EIN
BOG	BGA
LAX	PHL
TIJ	UPN
DEN	RAP
NBO	DLA
LHW	HGH
MYR	ATL
AJA	ORY
YYJ	YYC
HAN	KIX
STN	ALC
PIT	LGA
MAD	OPO
WUH	YNT
HAN	KHH
DME	SVX
DAX	CAN
SEA	BWI
VCE	CPH
DEN	SAF
VCE	VIE
OSL	RIX
SPU	LHR
TGD	FCO
RIX	AMS
YYC	YHZ
JIJ	ADD
KHV	OVB
IAD	MBJ
LAS	GTF
DUB	CPH
SAW	MAD
JFK	DCA
NBX	DJJ
WMI	BLQ
JUH	SHA
BUD	WAW
MKY	ROK
BCN	LIN
AMM	DOH
SXF	SOF
HEL	TMP
PEK	ZUH
PBI	PHL
AKL	SIN
EVN	ROV
SOF	WAW
BWI	ROC
CID	PIE
DAC	DOH
BEW	UEL
IKT	BKK
IAH	DCA
EAU	ORD
TSF	SKP
ELP	AUS
KRR	DYU
DUR	BFN
MJV	DUB
BRS	AYT
MEX	ATL
KHV	JMU
MAO	BVB
BRI	STR
EWR	PBI
SUV	AKL
BUD	BGY
SJO	DEN
ARN	NCE
HKT	HGH
ZRH	RAK
YXU	YWG
PBI	EWR
YIW	ZUH
GDN	WRO
GDN	LBA
ICN	DTW
LIL	LYS
IND	BWI
DUB	BRI
JUZ	SZX
HAN	SIN
CCU	RPR
BSL	FAO
HBA	MEL
RBR	CZS
BWI	JAX
ZUH	KWE
VKO	NCU
DWC	DOK
CCS	MRD
PTY	CTG
PSA	TXL
MNL	XMN
BOD	PMO
IAD	SYR
PEE	PRG
GDL	HMO
DKR	IAD
NCL	BRU
PHX	LIT
WEI	CNS
ISB	CPH
SLC	RKS
SZX	TPE
BEG	LTN
RUH	MNL
CPH	LAX
RTB	SAP
YEG	YXX
SAN	MCO
GEO	YYZ
OXB	DKR
ORD	SYR
XIY	KWE
ORD	PIT
CGQ	HET
LHR	SPU
DMK	PRH
ITO	OGG
BSL	OPO
MST	ALC
FRA	CAI
SDQ	CDG
BCN	MRS
GLA	SYY
VIX	VCP
JIJ	GDE
DEL	UDR
KRR	NMA
FRA	YYZ
IST	ORD
ATL	BQK
BWI	JFK
CCU	JAI
FOC	CTU
ACY	DTW
OSL	ISB
BOG	PCR
MGF	GRU
TPA	CLE
DEL	SVO
HAV	NAS
NKG	SYD
FLL	TPA
DTW	EWR
ORD	CLT
ECN	AYT
IFN	SYZ
GRU	MCZ
PTY	MTY
DSM	EWR
CMH	EWR
SZX	RMQ
AKL	WLG
CKG	HET
ORY	BIO
SVQ	BRI
GZP	HEL
AMS	LEJ
LIM	YYZ
PEK	CAN
RJK	SPU
VLN	BLA
ZUH	WUZ
DOH	FRA
LHR	ABV
FRU	SVO
MLI	DEN
LYS	MAD
HEL	KUO
PVG	TSA
DME	KOV
WUS	PEK
DCA	SYR
SAN	MSY
PRG	BRS
HFE	HKG
YQT	YTS
FNT	MCO
KHH	NNG
LAX	PVR
ABZ	BHX
DME	IKT
DXB	BEY
IAD	LHR
DME	LWN
MCO	ACY
SYD	NOU
PRG	ICN
ICN	MAD
CTU	PEK
YNZ	SHA
BCN	MUC
YYZ	AUA
PVR	GDL
MUC	BLQ
LGA	STL
CGK	DJB
SCL	ANF
TSN	YNT
LEJ	CDG
XMN	HKG
YVR	YXC
MAD	HAM
SLK	BOS
YHZ	EWR
SFO	ONT
DOH	BEY
VIE	AGP
RAP	MSP
STR	KVA
AGP	ZRH
DOH	CTU
HIJ	TPE
HKG	POM
DSM	ATL
UBA	VCP
CGH	UDI
ZAG	BRU
SAT	ATL
PEK	KWE
LIS	VCP
AJI	ESB
HBE	BEY
KJA	OVB
JFK	YVR
FLL	SDQ
CAN	WNZ
ORD	ACY
PHX	SJC
XIY	IQN
AMS	GUW
ORD	HNL
FRA	YYC
YIW	PEK
PRG	LGW
AXT	ICN
PRG	NCE
MCO	BHM
HKT	KWE
LGA	HOU
DOH	PER
IBZ	EIN
SGC	SVX
BWI	CUN
KMG	NNG
BGY	LBA
SKG	HAJ
TPE	TYN
BOS	AUA
FAO	MUC
YVR	ORD
CKG	KRL
CLT	SEA
OSL	FAO
JPA	FOR
NAP	CAG
LOS	ENU
GRU	IAD
IXU	DEL
KRK	MAN
ADL	CNS
BSL	AYT
DEL	LHR
MIG	NKG
ARN	DUB
BES	BCN
ORK	LPL
DXB	BLR
BVA	SOF
FAO	BOH
MYR	ABE
AGA	CDG
NMA	KJA
SCL	GRU
PHL	IAD
SIN	BDO
DXB	CAI
OTP	GVA
NCL	BCN
TOS	LGW
CHA	DTW
PVG	HNL
BOD	LGW
SCL	MDZ
FCO	LYS
ICN	KMJ
DIR	ADD
RST	MSP
BUD	RIX
BZV	KGL
DOH	JFK
FMO	ZRH
CPH	NCE
NCL	ABZ
BNA	AHN
HKT	CKG
HRB	FOC
KWE	XNN
BOM	STV
HAJ	AGP
EWR	SJO
ADD	HKG
JFK	ABQ
OPO	DTM
MUC	AYT
HBA	BNE
BOM	SHJ
JAN	IAH
SFO	TPE
CCP	ZCO
ABQ	IAH
ABJ	LOS
LIM	UIO
AGP	MAD
MNL	FUK
ORD	BRL
ARN	POR
BUF	TPA
OPO	EWR
AYT	FRA
ATL	IND
MAD	MAN
MAD	LIS
CAN	AMS
HGH	SHE
PEK	HSN
KSU	BGO
IAH	OAX
CBB	VVI
PEK	JFK
VBY	ARN
CNF	VCP
ALC	FMM
JFK	CMN
OMS	NJC
IKA	IST
GDL	TRC
DTW	TYS
MUC	LAX
BNE	CAN
NCE	EDI
SFO	CUN
SHA	GMP
BHD	MAN
VVI	ASU
FLR	BCN
CAK	TPA
BRU	MRS
MSP	AZO
DRW	KNX
IVC	WLG
PMO	ARN
FCO	WAW
CUL	HMO
ORD	LSE
RMI	DME
TAS	KUF
LOS	LFW
SDL	ARN
MDW	BHM
TLS	RNS
CEK	DWC
DBV	MUC
DKR	ABJ
JFK	SRQ
TJA	CBB
SKG	DOK
BME	DRW
HKG	SWA
FUK	PVG
HAK	CIH
FNC	BRE
BLK	DUB
NAS	BWI
LAS	SAT
MUC	ARN
LHR	CPH
HOU	LGA
TXL	MUC
BKK	MEL
GDN	DUB
YYZ	ISB
POA	EZE
ATL	BZE
SXB	CMN
FRA	SZG
NSK	KUF
JHB	SZB
SZB	AOR
ORD	IAH
IAD	ORF
NGO	SIN
KMI	FUK
LAX	HOU
MAN	SOF
GVA	MAD
ADF	IST
BGO	ABZ
LSY	SYD
ABQ	JFK
MIA	CHS
SKG	MUC
AUA	LGA
YYZ	FRA
LHR	HEL
MIA	MID
AMS	KYA
BNE	DUD
MSP	AMS
MOT	DEN
BOS	JAX
SAT	MDW
OTP	LGW
TPA	PVD
CDG	NCE
CNX	ICN
ANC	ADQ
LIS	DKR
MSP	LGA
MBA	HAH
BRE	ADB
CPH	DXB
SYQ	LIR
USK	UCT
STN	GLA
DXB	TAS
IAH	MLU
PPT	HNL
FRA	HAV
KIX	SHE
GUA	IAH
HGH	WEF
MNL	DRW
FRU	DYU
CAG	NAP
ZYI	HAK
ZLO	MEX
MAN	SPU
VKO	MAD
IND	MBJ
SXB	TLS
JFK	PIT
CRL	TSF
ZRH	BUD
GVA	WAW
PBC	MTY
HGH	TSN
BSL	EDI
EBB	NBO
ISB	PEK
JNZ	TAO
WUS	TNA
TXL	IST
BRN	OLB
CUU	MTY
BCN	SIN
JFK	GRU
FLL	PBG
MBJ	IND
SAL	IAH
SVX	ULV
ABZ	BGO
STR	HAJ
IKA	SHJ
MSP	MKE
TMS	LAD
PHL	PDX
BCD	DVO
CUN	CVG
IAD	BKW
DME	GBB
OSL	KSU
CZL	ORY
KMG	WUH
AUA	BWI
EWR	TUL
TPE	DPS
CAN	SHA
LUN	LLW
ORD	PVR
KMG	SJW
VCT	IAH
MSP	BIS
SEA	BZN
IAD	BOS
VCP	CGB
YYZ	IAD
IST	DUB
PEK	YBP
BGY	CRA
SDR	CIA
BHI	REL
SIN	KBV
RUH	AHB
RMQ	HKG
YYZ	AUH
YYZ	YLW
DRO	DEN
DEN	IDA
BRS	KEF
PHX	OKC
ATL	CVG
SDR	CRL
SBN	ORD
MUC	VLC
CNF	SSA
VIE	STR
SLA	MDZ
IBZ	CRL
TPE	WNZ
LAN	ATL
BRU	FLR
JNG	XIY
IAH	LAS
BOS	BWI
PRG	NCL
KUN	LGW
MKE	MSP
STN	TMP
EWR	PEK
ZRH	FCO
DTM	KRK
AMS	BSL
BKO	CKY
SAT	BWI
EGC	BRS
KTW	CIA
FUK	MNL
FRA	GDN
EBL	AYT
MIA	SEA
KRK	BGY
BGY	KRK
FLL	MGA
LGW	SXB
IST	ECN
SFB	GSP
SBW	BTU
MEL	PVG
LYS	FCO
KGD	RIX
RAK	BSL
CNX	HGN
WUH	HKG
HKG	DEL
FDH	ZAD
BNA	PNS
SDR	DUB
KLX	VIE
VOG	EVN
SGF	AZA
SLA	AEP
REC	MCZ
NSK	AER
EZE	MAD
ICT	ORD
FLR	GVA
TMR	ELG
GVA	JED
CDG	AMS
TUU	CAI
NDG	PEK
TAS	DEL
COO	LBV
CLE	GSP
BHX	FCO
YTZ	MDW
BSL	FCO
SYD	BME
STR	IBZ
MEM	PIT
BRU	OPO
DLC	NGO
EIN	MRS
OUA	CMN
VSA	CUN
MUC	SJJ
KIV	BVA
MCZ	VCP
CPH	BHX
BCN	CIA
TPA	BHM
BWI	MSY
MUC	KLX
CPR	DEN
ZAD	ZAG
LGW	FCO
CMN	TXL
STL	MWA
ABE	MYR
YNJ	CGQ
CTU	SIN
BGO	TOS
CRL	PSA
HYN	WUH
ZRH	HAJ
VCP	MCZ
CUU	IAH
MCO	MCN
YWG	YXU
POM	SIN
CLQ	MEX
TGD	IST
SYD	SGN
SEA	MSO
CGR	BSB
TPA	ROC
AMS	LTN
URC	AKU
GHA	ORN
CLT	EWR
HAM	LTN
ORD	DTW
RPR	BHO
VKO	HKT
PTY	REC
LIM	TPP
BWI	PWM
STR	NAP
RIX	DUB
SGF	ORD
AVL	PIE
MCT	KHS
YYZ	EWR
ORF	MIA
KIJ	ICN
WAW	LIS
WUA	PEK
KIV	STN
CLT	SRQ
DXB	SAH
SMF	PSP
HET	SHA
TXL	KGD
TSN	HET
LDB	MGF
BRE	TSF
BMA	HAD
YUL	MEX
DWC	LHR
DUB	KIV
SIN	SZX
PEK	AOG
SAH	ADD
ZUH	KHN
ATH	AUH
DTW	GSO
MEX	MID
RSW	STL
MVD	SCL
ACE	CRL
SIN	LHR
SVX	NYA
DUB	DXB
CAN	MEL
ICN	AMS
CVG	IAH
AGT	GRU
PVG	HKG
ROV	SIP
LOS	DLA
SOF	BCN
SJW	TAO
PLW	BPN
SVX	VKO
PRG	CEK
UFA	SVX
IST	MHD
BRS	ORK
DAY	CLE
BKK	MNL
CAI	JFK
JAX	CVG
DCA	IAH
DXB	KMG
KHH	CKG
HDY	SIN
GRX	BCN
SYY	GLA
CTU	ICN
SVO	MIA
LWB	IAD
BRU	NTE
DTW	BOS
LCA	FRA
IAH	AEX
FLL	NAS
SJU	BOS
SHJ	HBE
CAN	FUG
BKK	CPH
ORD	ARN
EVN	BEY
HOU	ATL
JED	PZU
YVR	PVR
LCA	GLA
ZAD	CGN
BGO	MAN
PIR	ATY
FLL	DEN
CCU	IXS
IAH	DTW
EWR	FCO
AUS	DAL
PBI	BDL
LDE	BRU
TXL	BRU
PTY	CCS
KUL	LOP
JNB	FRA
VNO	LTN
RUH	IAD
FLL	MDW
RAK	SVQ
MEL	ADL
IST	CND
BOG	AUC
PHL	LAX
LAD	OPO
PBI	HPN
MAO	BEL
TKU	HEL
BDL	CVG
LHE	YYZ
AOJ	CTS
SSG	MAD
HOU	BWI
SRQ	DCA
RAO	CGH
SOF	FCO
BRU	AGP
ICN	KUL
CTA	FLR
CTU	SWA
GEG	LAS
ORD	DCA
STN	TRF
JNZ	PVG
SNN	BOS
ZRH	EWR
CGK	PKU
CDG	ARN
DEN	CPR
CPH	BEG
MID	MTY
YYG	YUL
ARN	IST
MRS	LHR
CGD	SHA
YXY	YZF
ATL	AVL
IGD	ESB
KZN	SVX
DUB	LYS
DMK	HGH
STN	SXF
YUL	CMN
MDZ	AEP
DEL	KUU
VIE	FLR
ELM	PIE
ATL	CID
CDG	GLA
CKG	LHW
GRU	CWB
FOC	TSN
BIO	LHR
CGN	OSL
AMS	KUL
MUC	AOI
AUH	PVG
OLB	TXL
KUT	WAW
BWI	ECP
CNF	IMP
OAX	TIJ
ACC	ABJ
IAD	JST
AMS	SIN
MEX	CLQ
ORU	SRZ
PVG	URC
LTN	VCE
MSY	MCO
SKG	NYO
KUL	DMK
IST	MQM
JOG	BPN
ACX	NAY
STN	MJV
DTW	DCA
WUA	HET
DPS	KIX
PHL	CAK
CUN	MCO
DEL	KDH
SLC	FAT
SZX	SIN
VCE	SXF
JNG	KMG
BTS	STN
GLA	ACE
BOS	MIA
MTY	TIJ
FLL	MSY
SEA	ANC
ZRH	GRZ
NNG	SYX
PRH	DMK
PDX	BOI
FLL	DTW
SXF	BGY
MRS	FEZ
TNR	TMM
SJU	ONT
OVB	FRA
RNS	BOD
PEK	SHA
CHS	CLE
ATL	BDL
TPA	BNA
CKB	MGW
SYD	PEK
BGY	LDE
TPE	FRA
ADL	SIN
MHD	ZAH
CCU	KTM
CPH	LHR
ALC	AAL
DTW	CMH
DMK	PHS
DEN	STL
LCA	LBA
MLI	DTW
CGO	CKG
BMA	VXO
MAR	CCS
YYZ	LIR
BCN	LPL
VCP	ARU
ZAD	STN
SLC	DCA
TLS	AJA
TXL	JFK
KJA	DYU
FMM	ALC
DMK	ROI
CAC	VCP
ABZ	LCY
GRU	MAD
ASF	SAW
IST	FCO
CIC	SFO
NGO	TAO
CAN	ICN
MTY	CUU
LHE	DOH
LGB	OAK
DOK	MUC
HGH	KUL
SAW	AYT
CTA	SVO
SXF	SAW
JFK	LGB
OAG	SYD
SLC	ONT
SFO	DTW
MIA	EYW
EWR	OSL
LTN	DEB
AGR	HJR
ORD	SLC
DME	CEK
YYD	YXT
BOI	GEG
OUL	ALC
PIT	BOS
HFE	KMG
PEK	CDG
SJC	BUR
HTA	DME
SRE	LPB
DRW	DPS
BCN	DTM
SFO	PVG
NTE	NCE
BUQ	VFA
HKG	JNB
CDG	RIX
DUB	ORD
TXL	RIX
MOQ	TNR
VIE	HEL
LGA	RSW
IAD	MAN
SVX	DYU
MOV	BNE
AUS	SLC
PEK	TXL
BIS	AZA
CNF	IOS
VIE	KLU
BGO	FRA
VCE	NCE
ISP	PBI
BCN	BJL
ATL	AUA
CHQ	SKG
ATH	MJT
DUB	ZAD
SJO	ORD
FCO	ICN
PHL	GLA
BLQ	OPO
IND	MCO
EIN	DEB
SCL	CPO
BMI	ATL
SCL	LIM
LAX	CLT
GLA	KOI
PBC	TIJ
ANC	HNL
GDL	ATL
YDF	YHZ
SFO	HKG
NAY	CZX
AMS	GDN
IAH	SEA
NAV	SAW
VVI	SRE
MUC	SVX
EWR	LAS
DXB	IKA
CGK	BKI
SFO	CIC
FAO	BFS
SEA	YYC
BRU	ALC
BGY	CAG
YZF	YXY
ASP	ADL
FRA	AGP
BHX	KTW
PBI	LGA
DEN	MDT
PDX	MSP
SHA	LYA
OKC	BWI
POL	JNB
YYZ	MSP
CCS	OPO
TPE	SYX
EGC	PGX
BKK	LPT
ARN	JFK
LMM	MZT
MCT	AMM
EWR	ARN
AER	KRR
CAN	SYX
SAW	BGY
SWF	DTW
MIA	CTG
POA	PFB
RZE	FCO
MDW	GDL
LHR	CAN
HKG	BKK
SZX	DLC
AKL	CHC
NCL	BHD
SYR	MSP
COD	DEN
JFK	JNB
DYU	IKA
PHX	BUR
MSP	DCA
HSV	ORD
PGD	SGF
YQT	YYZ
NAS	PBI
GRU	JPA
TYS	DTW
KVA	ATH
AGP	TRD
SBA	PDX
FRA	MCO
TAS	SHJ
YOW	YFB
MNL	WNP
JOG	PLM
BKK	KJA
WUH	HYN
IKT	GDX
DEL	CJB
HAJ	AYT
WAW	CDG
MAG	POM
MUC	DME
PTY	AMS
PHL	YYZ
MQL	BHQ
IST	DLA
THS	BKK
HYN	CAN
STN	KGS
MCI	OAK
YVR	IAH
CIH	SHA
MCT	BOM
SVO	ROV
KIX	DXB
MAN	EDI
GRU	JFK
RMQ	TNA
EDI	LGW
FRA	VNO
TSR	BCN
SJC	LAX
GVA	CPH
ICN	IAD
CKG	HFE
TMM	TNR
LEI	MAD
BDS	BGY
PHL	PBI
NAP	HAJ
HKG	USM
MDZ	EZE
CPT	MPM
SCL	IQQ
MDT	CLT
AMS	SOF
YYZ	YFC
CCJ	COK
AMS	LBA
RNO	SAN
PVG	JJN
KWL	TPE
BCN	YYZ
FRA	ORD
EDI	NCE
ICN	SDJ
WMI	DUB
LGW	LCA
BUD	LHR
LOP	KUL
SIP	ROV
LHR	TIP
STL	PHL
YVR	SNA
SJW	DLC
CGK	BDJ
WAW	CGN
CPH	MUC
DAY	DEN
TAO	YNJ
TUU	AHB
JCB	FLN
SYD	CAN
SKP	FCO
BNN	MQN
PSA	KRK
CAG	KRK
DEN	LAS
UET	MUX
BCN	IBZ
FLL	JFK
VVC	BOG
TXL	EWR
BWI	PBI
BZE	IAH
BZV	CMN
RAK	AGA
JFK	YUL
CIF	DLC
STL	MDW
ORB	BLE
ORD	ICT
FAO	MAN
IAH	YUL
KWE	KHN
LYS	STN
SVX	CDG
TLS	BCN
PIE	BGR
FAT	GDL
SBW	KUL
DCA	LAS
AGP	VIE
HAK	ZYI
KRK	DUB
SHV	ATL
MSP	PHX
HKG	ADD
SJW	SYX
TRC	GDL
ONT	SFO
IST	DAC
AGP	LCY
PMO	TSF
VFA	MUB
ICN	KMG
AGP	BHD
OKC	LAX
LAX	CVG
AKL	SFO
LHR	ZAG
PRG	SXB
SFB	FWA
DNZ	IST
PFO	BRU
BRS	SNN
SZX	KHN
IBZ	MAD
ROC	DTW
OTP	SAW
WYA	ADL
VIE	VLC
BEG	PRG
STL	SLC
ZYI	XMN
DMK	CAN
LIN	BRI
RIC	IAH
XIY	JDZ
FLL	LAS
KOJ	ICN
ISN	DEN
DOH	SAW
AMS	BUD
IDR	HYD
PUS	TXN
GRR	DEN
HKG	LHR
SFO	PIT
AUH	YYZ
SZX	SYX
KIN	FLL
OWB	STL
CUN	SFO
ENY	NAY
DTW	NGO
CPT	KIM
SLC	BOI
TSA	HGH
MAN	BUD
SXB	ADB
CGK	HKT
COS	IAD
XAP	CWB
RUH	DXB
CLO	SAL
EWR	CLE
HNL	LIH
SLC	MDW
KTW	BCN
IMT	RHI
KIX	TAO
YYC	EWR
SZX	DAX
SVQ	OVD
PVG	CTU
TBS	BGW
MDL	BKK
EOH	MTR
FRA	REC
CAN	AVA
DME	SKG
YXE	ORD
SDR	MAD
CGO	FOC
SEA	ALW
BRU	TIV
KHI	CMB
MAN	MAD
KGS	LGW
PER	CNS
CGH	JTC
MUC	ICN
LGW	CTA
PEK	HFE
FRA	TLS
MAN	NCE
SNA	SFO
EAT	SEA
WNZ	SHA
SHE	ICN
NNG	BKK
OPO	FAO
TXL	MHG
PES	DME
ORD	BTV
BRN	TXL
BLQ	BRI
STN	LIG
ATH	PRG
ATY	PIR
STR	GWT
IQN	LHW
MCO	ROC
TUN	BOD
BRU	CDG
FRA	ZRH
SFB	XNA
SEA	LHR
CKG	WUS
ILM	LGA
DXB	KHI
FRA	BSL
LCY	MAD
CDG	ROB
PET	POA
PHF	SFB
ALC	TRF
GVA	DME
PKU	JOG
SLC	DEN
XIY	TSN
TGU	SJO
LAX	CLD
BLK	ACE
TUU	RUH
JAI	HYD
LHR	OTP
MIR	BRU
GVA	AGP
IAH	CDG
IPN	CNF
TAS	NMA
CAN	BKK
ABQ	DEN
DCA	MSY
AGU	MEX
AUH	ORD
IAD	JED
KUL	KWL
VKO	ESB
SAT	LAX
MBA	ZNZ
CFE	NCE
JFK	MAD
ZRH	BOD
MHD	IFN
IST	UFA
SAH	AMM
CDG	PTY
DCA	YHZ
DBV	FRA
ADD	DXB
LBA	FNC
IST	CAN
WGA	SYD
BGI	OGL
WUZ	KWE
JNB	AUH
QUO	LOS
CPH	SXF
UIO	ATL
MCO	RSW
FLL	MKE
LIN	CPH
BLQ	CAG
DEN	BWI
UYN	XIY
DTM	VNO
KHV	IKT
AMS	RAK
WUZ	NNG
BFD	CLE
HKG	ICN
IST	ADB
CIA	BCN
SAW	ESB
SVX	SLY
MDL	MYT
CDG	MRS
BTV	LGA
ONT	PHX
LIS	TLS
MCI	LAS
STR	RLG
WUX	SYX
GVA	BRU
KIV	RIX
DUB	TLS
PDX	IAD
EPR	RVT
NAT	REC
CHC	NPL
EWR	BOS
LYS	LGW
SYR	CLT
GSP	FLL
HKG	MNL
BRS	PSA
TPE	KMQ
PRG	GOJ
CLT	CDG
CGH	BSB
AQG	CAN
TXL	ADB
CAE	IAD
KRR	VOG
LNZ	VIE
ATL	PBI
CDG	COO
MJV	LGW
WUS	XIY
FRA	IBZ
XIC	CKG
YKF	ORD
SHJ	COK
GEG	DEN
ORK	LHR
CDG	BIA
DME	BRU
BHD	NCL
DUB	JFK
BNA	CLT
SMF	HNL
LAD	NOV
BOM	ICN
CAI	CAN
ATH	FCO
MFR	SEA
AMS	HAM
CDG	LBV
DXB	HAM
MID	GDL
LBV	ADD
JFK	HEL
KIV	LIS
ABA	IKT
MSP	MCI
VKO	VOZ
YHZ	LGA
TPE	PVG
STR	AGP
BKK	NGO
VKO	PWE
MRS	ORY
LIN	BDS
PKU	BDO
ATL	ROC
HTS	PIE
BUD	NAP
SIN	CAN
PVG	FUK
RJK	CGN
YVR	LIH
HKD	CTS
XMN	SIN
CZX	FOC
KRO	DME
GUW	VKO
POM	HIR
LBA	GDN
OPO	CCS
BKG	DEN
SKZ	KHI
IAD	ATL
BRI	BVA
MCO	MBJ
TSR	VLC
KHI	DAC
JUH	NAY
CLT	FCO
KMG	KWL
ADD	KGL
SZX	HGH
OSL	BNN
BRS	NCE
HOU	PHX
PEK	BAV
BRS	KRK
SAL	BOG
CAN	HJJ
NYA	SVX
ALC	HAM
ICN	MFM
PZU	KRT
LAX	FLL
BEY	SXF
EOH	UIB
EIN	CPH
KUL	LHE
CCS	JFK
BKK	CNX
NSK	KJA
PFO	DME
MEM	MCI
GDL	SJC
ABE	PGD
LOS	ROB
ADA	IST
SYD	PVG
GVA	MAN
BIO	MAN
VTE	HAN
CCS	SJU
BRI	PSA
WUH	JJN
YYZ	YYB
BDL	TPA
HEA	KBL
DEN	HNL
CUN	YHZ
LTN	RAK
BWI	SDF
IST	VAS
BME	BNE
BWI	ISP
COK	PNQ
DLC	CHG
ZAZ	BVA
MKE	LAX
BLI	PSP
DUB	GDN
MCO	SJO
DOH	CPH
BAV	PEK
ALB	FLL
TXL	GRZ
EBB	BJM
PVR	SFO
HAJ	NAP
LTN	ALC
CAI	ADD
BIL	LAS
ORD	PSP
ZRH	AYT
HFE	SYX
HOU	CRP
JUB	DXB
LRM	SJU
MAO	GRU
HOG	FRA
ACC	ADD
LCA	OSL
INV	BHX
ACC	COO
IND	SLC
TRD	RIX
LGA	YOW
PVR	PHX
DEN	LBL
NER	YKS
EDI	ATH
PVH	CGB
AUH	PEK
CRK	BKK
JED	MAN
BFL	PHX
LLF	SZX
EVN	CDG
RIA	POA
CAC	GRU
CVG	LAS
SOF	EIN
BFS	BHX
TDD	CIJ
BEG	FMM
MAD	EWR
JUL	LIM
IAD	HSV
CVG	PGD
CAN	XIY
SIN	DVO
URC	TYN
TOY	CTS
SAW	BEG
ZUH	FOC
CLT	PBI
RNS	LYS
MYR	BWI
DXB	FRA
RUH	DWC
BGY	WMI
MEL	MNL
VVO	KHV
ORD	LGA
CHQ	FMM
IBZ	PAD
IST	ADF
BKK	SGN
BGY	BRS
KZN	UFA
BAV	TYN
PMO	CGN
BHM	LAS
DTW	TVC
DME	NJC
OSS	CEK
VXC	APL
OTP	BRI
BSB	GYN
SFO	DUB
OMA	DCA
CLE	CHS
DTW	BGM
DME	NYM
EVN	IKA
ZRH	ACE
HEL	HKG
INL	MSP
AZS	YYZ
MIA	SAN
YYZ	SEA
CTU	ZUH
MLB	ATL
IAD	SMF
GVA	RUH
FCO	DAC
YOW	PHL
TMP	BUD
COR	EZE
PVG	DXB
PEK	WUS
AYP	LIM
SCL	CUN
BOG	SAL
PPS	MNL
ABV	IBA
HGH	WUH
TSF	PRG
NPL	AKL
MOL	ALC
XNA	LGA
PSA	EDI
TXL	VIE
ZIH	LAX
ZRH	RIX
BZN	AZA
PEK	WAW
KTM	PKR
VTE	NNG
HSV	CLT
ATH	TBS
MSY	MEM
CMB	RUH
LJU	PRG
ELP	ORD
MUC	DEL
EZE	FRA
PRG	LBA
CLT	MSP
GDN	AES
PVG	CNX
TUN	GVA
DIE	SVB
YWG	YFO
LIS	BOD
SKG	FRA
BKK	TDX
BWI	DTW
NKG	HET
FNC	LIS
LAX	STL
MAD	BSL
DLC	TNA
GFK	TVF
PIK	AGP
PHX	ONT
ESB	GYD
ATW	LAS
GES	MNL
BRS	BUD
VIE	PEK
HAK	CTU
MEX	MLM
STN	BLQ
DAL	BHM
CTA	BRI
SVO	GYD
MHD	HDM
TUL	HOU
DAL	MAF
SEA	SFO
NCE	EIN
JED	DWC
MRS	CRL
FRA	AMS
STN	GOA
KIV	BLQ
PVG	LYI
JFK	CHS
IST	ICN
OUA	NIM
GRR	BWI
IKA	LHR
WAW	DXB
WMI	BGY
ZRH	YYZ
ACE	BIO
KMG	DMK
CLO	MIA
RTB	TGU
ADD	KRT
EIN	LIS
ADE	AMM
SDQ	KIN
KHN	TPE
ZAG	BLQ
CAE	ATL
IOS	CGH
BSB	OPS
FAO	HAJ
COS	SFO
LAD	LIS
AVP	PHL
MCO	MCI
MAO	FOR
DEN	DCA
BDS	BSL
ORK	ACE
MNL	BSO
COK	RUH
MSP	IND
ABQ	PHX
TTN	CLE
DMK	HKG
IST	CMN
BSL	PRG
MBS	MSP
IXE	AUH
BRU	BKK
SLC	MFR
SVO	KRK
GDL	SAT
TAO	SHP
TJM	UFA
YOW	EWR
ROC	MDW
NSK	VKO
YNJ	PEK
REL	CRD
SAN	MEX
TOS	TRD
CTA	VCE
CDG	LBA
SAP	MEX
DEN	PIR
LHR	GYD
CDG	SKG
BRI	SVQ
PVG	IST
ZRH	CTA
CLL	IAH
SAV	DCA
LYS	BES
LPL	SNN
LPL	FNI
TBS	IST
MDW	DTW
IAD	SJO
GDN	ZRH
AMS	VCE
COR	PTY
LHR	BGO
SDK	TWU
FLL	EYW
NAG	BLR
RAP	DEN
HKG	KIX
PBI	BWI
YQD	YWG
OLB	STR
MDT	MCO
HAM	GVA
SKD	DME
KHN	HRB
HKG	CAN
VST	AGP
MSP	CVG
NKG	HKG
SHE	JNG
PVH	MAO
SAT	EWR
ATL	DAB
AGR	BOM
PDX	YVR
BRU	BOM
KIJ	CTS
KUL	DWC
BVA	GDN
GTF	DEN
LAD	HRE
ORD	LNK
XIY	YZY
CNX	KBV
PSA	TRF
EWR	HNL
PEK	XMN
HRB	XIY
DTW	MKE
BGI	MIA
SWA	CKG
IAH	BZE
JNG	SHE
SVB	TNR
FAO	LPL
YVR	DEN
KUL	MNL
AYT	BSL
NAG	CCU
MSP	SJC
DBV	LGW
BOD	BIA
NBO	KIS
FCO	SAW
LAX	BNE
FCO	VIE
PAD	ACE
SPU	RTM
FMM	SNN
LBA	MPL
ACC	CAI
DLC	CAN
ATL	FCO
TPE	CGQ
DME	ABA
STR	ZAD
GVA	LIL
CPH	KEF
ORD	TPA
LIM	LAX
CIF	BAV
SVX	HEL
BKI	JHB
PCR	VVC
MAN	NWI
FCO	SIN
TSN	UYN
GLA	DUB
OVB	NJC
LAS	MTY
BZN	SLC
ORY	AAE
LGW	LYS
SHJ	BGW
ADD	JIB
TLS	SVQ
BNE	HVB
CLE	BOS
CDG	BEG
LHR	KUL
BNE	LRE
REC	FOR
TJM	SGC
YQU	YYC
MEX	FRA
FRA	LOS
SAW	DOK
RIC	MIA
WUH	HET
LJU	SVO
APL	MPM
MDW	LUK
SZB	JHB
GRU	CBB
NCL	IBZ
YYZ	PTY
LYA	DLC
AEP	USH
SAV	CLT
TNA	KWE
ANF	LIM
RAP	ORD
TXL	FCO
ATL	RIC
YXE	DEN
SYX	YTY
HMA	OMS
JNB	SIN
SHE	SJW
CGO	KHH
FNC	ZRH
LTN	EDI
DEN	MKE
FLL	OSL
TRG	AKL
PVD	DCA
LIH	HNL
MEL	AKL
BUF	LGA
CCS	GYE
USM	SZB
BHD	FAO
YYZ	DTW
AAR	AAL
BRS	POZ
DTW	LAN
BRE	NYO
MSW	ASM
ORD	MEX
IXS	CCU
MAD	ICN
LGA	FLL
TXN	CAN
MAD	ACC
HAJ	STN
IAH	NAS
SFB	RFD
LGA	DCA
TPE	DXB
SFO	COS
MEX	MUC
DUB	WRO
PEK	DDG
KOW	SHA
GRU	SCL
BRU	EDI
YHZ	PHL
ZAZ	BGY
CPH	OTP
PIE	CHA
MAD	PSA
DEB	LTN
PVG	MIG
PEK	ZHY
PHL	MSY
PBI	TPA
CLT	BWI
BHX	DBV
EDI	SYY
WRO	BLQ
CUN	ATL
TDD	RIB
YUL	FCO
KHI	DXB
SVO	CDG
TXL	GWT
TRF	BEG
VCP	SSA
BTM	SLC
LJA	FIH
URC	XNN
MGF	CWB
PHL	GSO
YQM	YYZ
KEF	ZRH
LRM	MIA
STL	BOS
WUH	DMK
PHL	YHZ
ATH	WAW
STN	BRQ
YUL	AGP
HGH	TGO
ATL	PHF
SYR	JFK
DEL	HEL
VCE	TIA
ZIH	MEX
ORD	MUC
NCE	CFE
CZM	YUL
MLE	DWC
CLT	LAX
ASM	JUB
EYW	LGA
CKG	TPE
RTM	PRG
LCA	MAN
NAS	ATL
MAD	STN
ALC	BLQ
GYD	VIE
RIX	HAM
ROV	VOG
AYT	ADA
DRW	TSV
OSL	MOL
RUH	ATZ
BOM	UDR
DXB	SYZ
ZHA	HAK
CHS	LGA
BDO	SIN
AMS	IBZ
MDW	BUF
DJG	TMR
BNA	JAX
FUK	SGN
HGH	BHY
ADB	DTM
NOJ	TJM
NTE	PMO
XAP	VCP
CEE	DME
CTA	MAN
KIJ	HRB
DYU	ROV
WUH	MFM
CZL	MRS
FAY	ATL
ASW	JED
ADB	AMS
MSP	APN
KYZ	IKT
KMG	MFM
ORN	AZR
SJU	PHL
AGP	IBZ
YYZ	ATH
KUL	RUH
LGW	MUC
STN	SXB
BOG	CTG
SHA	LHW
BRE	CPH
LAS	BIS
NYO	BVA
VFA	HRE
VNS	BOM
TNA	HUN
MCI	MCO
SZX	KOW
HKD	KIX
SJW	HRB
BKK	TPE
MEX	DEN
SLL	SHJ
BGW	DOH
ECN	IST
BUD	GYD
SXF	MAN
BVA	RZE
MCO	ORH
MIA	BOG
LXA	KMG
CGH	LDB
DLC	KMG
BFS	ACE
MCI	PHL
SFO	LMT
ALO	ORD
EWR	SEA
OVB	YKS
HNL	SDJ
LOS	BEY
PEI	EOH
WUX	WUH
SXF	AGP
SVX	PRG
BQL	ISA
HTY	RUH
CAN	HET
IAH	SHV
BRU	NCL
IAH	QRO
AUH	LOS
ORY	PMO
SVO	WAW
BRS	TLS
PHF	DEN
SIN	DRW
IAH	MCO
VKT	DME
BOM	VTZ
CGH	POA
ASO	ADD
SDQ	MCO
MAD	CCS
ADB	ADA
PHL	MKE
EDI	STN
OLB	LIN
CGB	GRU
BOS	ACK
PEK	YIC
CDG	FRA
MAN	GVA
HYA	BOS
MKE	DTW
BOS	DEN
KHN	TAO
DBV	HAJ
PUS	KLO
CLT	HOU
AUH	MAN
JFK	ZRH
TAS	ATQ
SLC	COD
TNA	CAN
SVL	HEL
JJN	NNG
PUS	VVO
ORD	COU
CBQ	ABV
GDV	BIL
HEL	BCN
CMN	RBA
BLR	LKO
XMN	PEK
PDX	AMS
HAJ	ACE
FCO	YUL
HAU	GDN
VCP	BPS
OGG	YVR
MTY	TLC
STN	AAR
SSA	BSB
HAJ	FAO
HKT	BKK
BKO	CDG
GIB	LGW
IAD	MDT
BRN	BCN
SKP	NYO
VLC	BIO
AVL	ATL
CVG	BWI
CMG	CGR
MTY	GDL
JJN	CAN
LBA	KRK
SLY	OVB
CAI	PEK
DAY	MSP
BVA	POZ
OPO	LPL
FCO	BLQ
FOR	NAT
UYN	CGO
DME	TXL
NNT	DMK
HMO	CUU
BDS	CRL
DMK	TST
STN	LRH
SWA	WUH
ELP	LAX
LAD	CMN
MAD	BRS
PUW	SEA
REC	VCP
ZRH	GVA
MUC	CPH
MAN	BZR
VTZ	BOM
FCO	ORN
BOS	SYR
WAW	TBS
RSU	GMP
UTT	JNB
NGO	PVG
KHN	CGO
SLC	IND
BUD	DWC
DXB	DUR
STN	NAP
SZX	BKK
LYA	SHA
SVX	RTW
SZX	CGD
CTA	HAM
VIE	NAP
VIE	TPE
BAV	WUH
DME	SKD
URC	KWE
DCA	SAN
ISG	MMY
HET	TGO
CLT	GSP
BKK	HKT
LAM	ABQ
KUL	CCU
BIA	LYS
FNC	TXL
MEX	TAM
TIP	MIR
BNE	PER
AGU	IAH
SPP	LAD
DTW	PEK
FNC	CGN
RUH	SIN
YYZ	MBJ
AMS	ADB
BGF	DLA
ATY	MSP
JMU	PEK
AMS	CAI
IAD	PVD
LAS	MSP
MUC	LYS
KMG	FOC
ATL	LGA
DME	RIX
MIA	MVD
HAK	LZO
CDG	MPL
NAP	VCE
YYZ	IST
RBA	ORY
BEY	AUH
LIS	ORK
CMN	AMS
CGO	SHE
GYD	DOH
MSP	SDF
CRL	EGC
HYN	ZUH
CAN	TYN
BWI	SEA
VCE	STR
PHX	MSP
SUB	SRG
ZRH	HAM
RUH	MCT
FOC	BKK
MEL	WLG
EWR	PVR
MDW	MCI
MIR	TIP
HAM	DBV
BLQ	ACE
CAI	ASW
NYO	WMI
KLO	CRK
AMS	GLA
NCE	HAM
BOG	MTR
HEL	ADB
XMN	ZUH
CUN	JFK
CHQ	BGO
IMP	CNF
OPO	BCN
CFE	ORY
SHA	FOC
LGW	RIX
IAH	TUS
KHH	CTU
NNG	ZUH
AGP	CIA
SSA	IOS
DOH	CCU
VSA	MEX
BSB	MAO
UME	ALC
VAS	SAW
MUC	STN
SFB	FSD
SKP	LTN
LTN	DTM
EDI	BHX
MRY	LAS
LPL	CDG
NBO	EBB
ZHA	CTU
PHX	MDW
YLW	YYC
CTU	YCU
ZRH	BHX
NAT	SSA
BEG	OSL
CTU	HRB
BWI	BOS
HEL	KRK
TPE	KMI
LHR	CDG
CTS	ICN
CPH	WAW
LBA	ISB
ADD	DOH
SNN	BHX
LYS	EDI
AZR	ORN
SEA	LGB
CWB	POA
KBL	DXB
MSP	SEA
MUC	NCE
DLC	TOY
JFK	SAN
SVO	HAN
BLQ	SVQ
HAM	WAW
KWE	LZO
MCT	LKO
BEY	SVO
EVN	OMS
SFO	MKE
KLX	MUC
VCE	TUN
FSD	ATL
SVX	KJA
HGH	TAO
CLE	AUS
TSN	CIF
KRK	CPH
ATL	MEI
SAL	TGU
LTN	SOF
DTW	LHR
CLT	LUK
SIN	WUX
ZRH	OSL
BNA	SLC
SDQ	SJU
LPB	TJA
MEM	SAT
ELP	IAH
JFK	DKR
ERZ	IST
ISB	DXB
NAG	RPR
KRK	TRD
KHI	GWD
NAY	ENY
SIN	LOP
BKK	SVX
RIX	JFK
CUN	VSA
VIX	SSA
OKC	ORD
LBA	CPH
PHL	ATH
PVG	TOY
SJW	SHP
TNA	HGH
JNB	CPT
KMG	CMB
LCA	BHX
OTP	FRA
SHE	LHW
NTE	FEZ
PIT	CLT
SAN	ABQ
MSP	FAR
DND	STN
OMS	DWC
SNN	MAN
REC	MIA
AMS	LJU
DCA	GSP
AMS	HAJ
TXL	CPH
GDN	LPL
TAO	SHE
GRU	UBA
CLE	PBI
TTN	CLT
LHR	PEK
LGW	IBZ
VIE	OTP
MAD	RTM
SMX	LAS
DAC	FCO
GRU	REC
ZRH	OPO
GRU	COR
AYT	ZRH
KRS	SVG
MIA	STI
DEN	DRO
IBZ	PIK
BEY	AMM
DBV	ZAG
SNN	LGW
VIE	AMS
DTW	LAS
ATH	SPU
LAD	VPE
TRD	KSU
SAW	TZX
ABZ	LHR
LIS	MAN
FCO	LIN
MEM	ORD
YVR	AKL
MIR	MRS
HRB	OVB
AMS	POP
MEM	LGA
OTP	DXB
AMS	VXO
AMM	DXB
YYC	YXE
IST	TBZ
PEK	HAK
OSL	ATH
YYZ	GRU
IST	GVA
PEK	DEL
MEL	SYD
ACX	PVG
PSA	AMS
BTU	SBW
BPN	DPS
BDL	MIA
NCE	CGN
RUH	HBE
MCO	PVD
BLR	NAG
SAL	UIO
BCN	BOG
MAD	BUD
CSY	DME
CDG	MIA
WRL	CYS
YUL	MSP
SJU	JAX
DXB	FCO
AUA	MIA
DLH	ORD
LEI	DUB
DMK	BFV
DCA	FAY
STN	EIN
BFS	CDG
POJ	PLU
ISB	GIL
NAS	JFK
ABJ	FNA
LHR	HKG
BGR	DTW
LUN	DXB
DUB	BVA
BNA	LGA
TXL	ATH
DOK	SVO
SZZ	DUB
UKB	CTS
VCE	SVO
EZE	GYE
HAU	ALC
KRN	ARN
YUL	IAD
CTU	SJW
WUH	URC
KPO	GMP
PVG	JNZ
INN	VIE
OUA	IST
SJW	HGH
WMI	ALC
MSY	CLT
BOM	CJB
TGG	KUL
LAX	MSY
NYM	SLY
SDQ	BOG
ATW	AZA
MUX	KHI
CTS	KMQ
VII	VTE
OSL	IST
LAS	CID
FRO	BGO
FAT	SFO
PHB	FOR
DOH	ATH
BOM	VNS
LAS	DSM
YEG	ORD
OTP	CPH
BNA	TPA
OAK	LIH
EQS	CRD
DUB	BRS
DUR	DXB
DWC	TJM
BUF	CLT
FNA	LOS
CTA	GOA
WRO	DUB
ORD	FAR
BEG	SVO
SRE	CBB
HAK	AQG
LIS	MRS
YYC	SEA
DUB	BLQ
RIX	BGO
MAN	TLS
CNS	ISA
ICN	AOJ
FCO	EVN
MSP	BUF
CDG	KIX
CDG	BEY
SOF	DTM
VVO	DME
AMS	PTY
LCY	AMS
PVD	FLL
SYD	ICN
GLT	SYD
BHX	ORK
CNX	WUH
BWI	PHL
STL	MSP
CAN	KHN
GVA	NAP
SYX	MIG
DCA	JFK
TXL	VNO
LYS	BSK
LAX	MSP
FCO	MRS
JFK	BGI
ROS	EZE
OAK	GEG
RFD	SFB
KBL	GYD
KRR	PRG
LAX	ZIH
BOS	RUT
STL	ECP
RNS	TLS
LIM	IAH
CPH	NCL
XIY	WUA
DXB	IXE
ANC	PHX
MJV	NCL
LFW	BKO
BMI	DTW
DME	HAN
CLE	EWR
VKO	VIE
YYC	YBR
ICN	TSN
GBB	DME
IST	SZG
CAI	YYZ
MAD	HEL
MNL	CGK
NCE	OLB
IAH	CHS
BIO	OSL
ROV	KUF
KBL	MHD
GWL	BOM
TAS	ROV
CLT	SYR
OSL	ORY
KMG	YIW
SVG	VNO
VOG	KRR
LPL	NCE
IAH	LGA
CWB	CGR
ADE	AHB
EWR	DSM
JFK	SJU
KWL	NNG
PVD	LAS
CGO	UYN
PRG	MUC
MRS	AGA
BKO	TUN
CUN	MKE
YOW	IAD
PBD	BOM
BRU	MIR
VOZ	KRR
TYS	FLL
PSA	SXF
MAD	ALC
POZ	TRF
CAE	ORD
AGP	HAJ
AZA	MOT
BKK	DPS
DEN	GSO
CVG	YYZ
CKG	AVA
CDG	BHX
KMG	HFE
MIA	TGU
AUH	COK
BFS	KRK
PDL	FRA
AQG	WUH
XNN	NKG
VIX	BSB
BUQ	HRE
BOM	SIN
NGO	DLC
BTU	KUL
TPA	SDF
MAN	ATL
DAC	KMG
PRG	LJU
CFE	LYS
ATH	NTE
PVR	STL
KSU	ABZ
BOI	LAX
DME	KGS
MSY	MKE
OSL	LHR
SAN	SMF
BAY	OTP
BFS	EWR
LIL	FAO
MEX	SAL
RTM	RAK
BVI	BEU
MDW	PDX
ORD	ATW
YWG	LAS
OTP	BAY
FRA	PEK
LAX	AUS
NCE	BRU
MUX	DXB
CAN	LAX
ORK	WRO
MNL	KIX
LHR	IST
CPH	DOH
NAO	PEK
PTY	TGU
BPN	SRG
LIG	ORY
CAK	LGA
PRG	RTW
BUR	PDX
KRT	IST
ALC	CGN
TYN	CKG
CAI	BOM
LAX	XNA
GRR	LAS
CUN	PBC
CVG	MSP
CPT	JNB
JFK	BNA
DCA	DAY
LOS	LHR
BHY	CTU
CMH	STL
GDL	PBC
ALC	KUN
SDR	BGY
CDG	KUL
ADB	BRU
MCI	SLC
BAV	SHA
GSP	MDW
ORY	PSA
KNX	BME
EWR	LIR
HKG	FRA
LOS	AMM
HNL	AKL
FRA	MAD
BRU	LDE
PFO	MAN
HEL	KEF
BTK	DME
ABJ	LFW
CZS	RBR
KZN	CEK
CMH	MDW
YQX	YYT
BEL	IMP
LHE	BHV
ORD	GSO
SJO	FLL
AMS	BFS
TPE	OKJ
COO	LFW
GLA	SXF
SOU	ORY
PSR	CRL
SYR	DCA
SCK	LAS
BDL	CLT
GYN	VCP
DUB	FAO
ARN	BEG
VLC	ORY
MSY	LAX
XNN	URC
MPL	LTN
CCM	FLN
BRI	STN
FRA	VRA
HNL	PEK
DTW	LIT
PDX	SMF
PHX	MRY
CMN	TLS
MIA	CLO
SXB	OPO
IPN	PLU
AER	KJA
NSI	CMN
MSP	SYR
FMM	TXL
OAK	BUR
AJA	MPL
BLR	GAU
OKJ	MFM
GWT	MUC
STN	BSL
BOG	JFK
LAD	AMS
LHW	SHE
OAX	CUN
HRE	JNB
OGG	PDX
FCO	PSA
SBP	LAX
LRH	SOU
STL	SFO
KMG	LLF
ATL	CRW
TPA	ILG
LXR	CAI
FRA	EWR
ZRH	PEK
SXF	SKP
PKU	SZB
CCJ	SLL
SAN	HNL
BFN	DUR
RIX	VIE
TXL	MRS
SFT	STN
DEL	SYD
CGN	VIE
TAS	ICN
TAS	FRA
ORD	LHR
SVQ	SDR
HAM	STR
ICN	YYZ
YUL	LYS
CMN	GVA
IST	STR
VKO	YYZ
AGP	BLQ
DEN	BMI
TAO	HKG
OGG	SJC
INH	JNB
EZE	ROS
JNB	NLA
KNQ	GEA
HAN	CAN
BOD	MRS
CPH	ADB
LAX	BOI
OSS	IKT
SVQ	GVA
IAH	SAT
PDX	CLT
HAK	WUH
LAX	MCE
DXB	JFK
SMF	BOI
PVG	XIY
AOG	PEK
MCI	BNA
YYD	YVR
MPL	LIL
CAI	FCO
FEZ	MRS
XIY	HRB
TRD	OSL
SZZ	WAW
ORF	MSP
PGF	DUB
CAN	JNG
GYE	CLO
DEL	BOM
MSP	JAX
ABZ	BRS
IAH	GSP
SHJ	MCT
GDL	SFO
HGH	JNZ
OPS	CGB
MAO	BAZ
HGN	CNX
LCA	RIX
YXT	YVR
IAH	YYC
IBZ	BRE
LOS	KAD
KEF	DEN
SYD	ADL
DMK	KUL
KCM	IST
SVO	AYT
NKM	KIJ
SLC	CDC
LIR	LAX
MRS	LGW
OKC	DEN
EDI	ORK
DME	CEE
ONT	GDL
ACY	MYR
VKO	DWC
PEK	SEA
JED	MNL
ATH	BEG
CKG	CTU
SGF	PIE
SLL	MCT
CGI	STL
YVR	MSP
TUN	NCE
YYJ	SEA
CTU	TSA
MAD	PTY
LEJ	ACE
AGP	BGO
ICN	TPE
CTU	AMS
DED	LKO
WMI	SNN
BWI	MBJ
KMG	LNJ
SAL	MIA
NTE	ADB
CMH	BNA
RZE	DUB
BIS	LAS
SFB	GFK
SRG	KUL
TUN	MAD
ORD	PBI
YNT	SJW
TMP	ALC
ALC	IBZ
MFM	CRK
BLA	PTY
SVQ	BLQ
AGP	ORK
FRA	AGA
FNC	LEJ
FCO	BEY
ATL	EZE
PHL	BUF
FLA	BOG
HAJ	LHR
LGB	LAS
HPN	PBI
CZL	LYS
VCP	MGF
SLL	DOH
OSL	BKK
EOH	BOG
SZX	YIC
OKC	ATL
MSY	ATL
PVG	CAN
SAW	SKP
DEN	FCA
CAI	BCN
PNS	TPA
NTE	OPO
DCA	ILM
AUA	EWR
TRF	AGP
KMG	ZYI
BEY	OTP
ISB	KHI
ESB	GNY
BLR	SIN
BGA	PTY
FOC	NNG
NAO	CAN
EWR	STI
SLC	CDG
PFO	ATH
LIS	EWR
SAN	IPL
SKG	ROV
ATL	PIT
CDG	EVN
BDS	BLQ
MCT	IKA
ALB	EWR
SVG	KSU
ZNZ	NBO
AMS	RIX
LGW	AMS
BRU	NAP
RFD	PGD
FRA	DXB
SEA	ABQ
GRU	ZRH
HKG	FCO
MCT	ZRH
BRU	TLS
TPE	SEA
OVB	KRR
CDG	KRK
MIA	REC
FRA	IAH
MSP	TPA
STL	BRL
IST	KCM
WLG	NSN
LGB	PDX
LAX	MCO
BHX	HAM
URC	TCG
GLT	ROK
FUK	ISG
OIT	ITM
DCA	DSM
DLA	DKR
SHJ	AUH
VLC	GVA
FCO	CCS
HRB	JXA
DRS	LCY
CDG	PUF
JFK	HKG
KHN	HAK
ADA	ESB
STL	MCO
ZRH	VCE
CGN	ADB
CRL	PFO
ARN	VCE
NNG	SGN
DCA	HOU
EGO	KGD
GJT	IAH
DIR	JIB
CJL	PEW
BUD	RTM
TNA	XIY
BRU	CHQ
MEX	LHR
KIX	HRB
XMN	SHA
CUN	CUU
OKJ	CTS
KHH	HUN
STR	CTA
PSA	IBZ
BRS	AMS
ONQ	DTM
MAN	SNN
OUA	DKR
TRD	BNN
MCI	DCA
KVX	VKO
LIN	DUB
AUH	JFK
VIE	DBV
CAN	XMN
DEN	GJT
CCS	HAV
OUA	TUN
BCN	ACE
CTU	HKG
MTY	IAH
MCO	MSP
AGP	LTN
WAW	KRK
PVG	TAO
FCO	BHX
YOW	ORD
GRB	MSP
KEM	HEL
BES	AJA
IAD	DEN
LLW	HRE
IAH	TUL
LJU	HEL
VCE	LCY
YXH	YYC
LGW	ORK
DWC	CMB
MEX	DTW
RTB	GUA
IAH	AUS
KOJ	NGO
CAN	RMQ
LNS	IAD
CPH	LBA
JIU	SHA
CVG	BNA
CLT	LYH
SFB	PSM
WLG	TRG
BDJ	CGK
SMF	IAH
AGP	LBA
AVN	LIG
CEK	NMA
LHE	DEL
SHE	NGO
KIX	CTS
YUL	CMW
PLU	UDI
DME	ESL
PER	KTA
LAS	ABQ
CLT	DAY
PHE	DPS
NYO	TSF
JED	FCO
KMG	DXB
MNL	DWC
LGW	AES
SIN	HDY
BLQ	CPH
TPE	TXN
GUA	SAP
TRG	CHC
NCE	ZRH
VCE	DBV
SIN	BOM
FMM	HAM
CAN	DAX
RIX	HEL
ADB	ARN
LYI	SHE
CHQ	VIE
SJJ	VIE
FRA	EZE
GRU	ATL
GDN	CPH
ADD	ACC
NCE	DUB
AGA	MRS
DLA	NSI
WUS	HKG
TRF	POZ
MAN	PUY
CGN	KTW
JED	GVA
MIA	UIO
SXB	NTE
EZS	IST
POA	FLN
SLC	MSP
BLK	FAO
OTP	LCA
RUH	COK
RMQ	HUN
BDO	DPS
KIN	MCO
UEL	MPM
SPU	VIE
DTW	CAE
DCA	ATL
JED	CDG
MSP	ATL
FCO	DXB
IAD	AMS
MIM	MEL
RVT	PER
DUB	BHX
CUN	DEN
PTY	IQT
AGP	MAN
TSH	FIH
TSV	SYD
LGW	SVQ
FRA	NAP
MIA	BLA
IAH	EWR
SVG	SXF
URC	ISB
TPA	JAX
RMQ	SZX
YVR	MEX
MCO	LAX
MEM	HOU
SDQ	LIM
PIE	FAR
DYU	IST
AZA	OGD
LGA	BOS
RBA	CDG
LIS	LAD
CTU	HGH
JOS	LOS
WMI	GDN
NCE	SXF
WUH	SWA
VAN	IST
ADA	SAW
BUF	IAD
ICT	MDW
KCZ	NKM
CLE	MIA
NKG	LHW
ATL	MBS
KCH	PNK
KWL	CGO
PUY	ARN
IST	OSM
CKB	IAD
SJU	FLL
YYZ	YQM
ADL	PLO
TPA	DCA
CNF	UDI
BLQ	TXL
SFB	MLI
XIY	NNG
HRL	HOU
NAT	LIS
TPE	CTS
JIB	ADD
FNC	AMS
DCA	SLC
DRW	MEL
TXL	OLB
GAJ	NKM
RAK	STN
NSI	NBO
KMG	LZO
BZG	BHX
DTW	AUS
MAN	HAM
BSB	PNZ
AUH	JED
RSW	YYZ
IKT	TAS
ASP	BNE
OVB	IST
MJT	SKG
FLL	ATL
ATH	KZI
MVD	MAD
ACC	JNB
OGG	PHX
SHJ	NAG
HAU	ZAD
IAD	LAX
LIS	OSL
DEL	ORD
EZE	MIA
XIY	HET
PUY	STN
NCE	BCN
ROV	DXB
ALC	OUL
KUL	MEL
YVR	CAN
GYD	IST
AKL	PVG
YEG	YLW
KSC	VIE
GVA	NCE
DPS	SZX
SKG	MAN
CUN	EWR
ORY	LDE
ORY	FAO
DME	VLC
SSA	CGH
SOU	GLA
LCY	AGP
RIX	MAN
CTU	JJN
VLC	IST
BKK	PER
SLC	SJC
CMB	PVG
TET	MPM
GYS	SZX
DOH	TXL
AAL	AGP
DTW	CRW
DYU	FRU
RUH	LKO
SWA	YIW
YVR	PSP
DOH	GYD
KHV	HTA
SFB	CHA
RLG	CGN
FLR	VIE
KJA	TAS
BWI	MCI
ALC	MAD
CPH	FLL
YHD	YXL
TPA	MEM
FNC	BHX
BUD	BRS
LGW	PMO
CRL	TGD
MDW	GSP
WUS	CAN
FNC	MAN
SVO	KRR
BLQ	SAW
APL	TET
SHA	KWL
LTO	LAX
AUS	LBB
DTM	SKP
PHX	LAS
LGW	AYT
ICN	CGO
MEL	KTA
IST	GUW
KLV	SVX
ELF	KRT
MSP	CLT
ZCL	LAX
KBL	HEA
RUH	HTY
AMS	OTP
SFO	SYD
GYD	RIX
DYU	FRA
CAI	AMS
DCA	SFO
MLE	SVO
LAS	BWI
DXB	MAD
PEK	KUL
JNB	DOH
SIN	AMS
SEA	DCA
JED	DXB
GRU	DTW
SJO	LIM
SAN	OAK
TUN	ZRH
PSC	AZA
BRS	IBZ
PMC	SCL
GEO	JFK
CAH	SGN
RKS	DEN
TXL	EIN
BJL	DKR
BRS	BFS
TLS	GVA
EOH	IBE
GDL	TLC
SBW	KCH
IKA	DYU
XMN	AQG
SKD	TAS
HET	SHE
LHW	HFE
CGB	CGH
VVI	MIA
HAN	VCA
ARN	SVG
YYZ	CDG
JAX	IAD
NGO	HNL
ATH	MAN
GRU	PFB
LHR	YYZ
KIX	WUX
BGO	SKE
YOW	YHZ
PSC	DEN
GRU	ORD
DTW	SFO
AZI	DXB
HKT	DMK
ZAD	FRA
TRD	LGW
ATL	MSN
SFB	ELM
HAM	BUD
VIE	DEL
FCO	CDG
ZCL	MEX
BKK	FOC
SEA	LWS
PHL	IAH
DEN	PGA
BVA	ACE
AMS	KEF
DOH	LXR
DCA	JAX
EIN	CTA
CTU	PVG
JHB	BKI
BHM	DEN
NBO	ABJ
FLN	AEP
YEG	PSP
CKG	LYA
BGY	CMN
MLM	TIJ
PIE	GSP
AES	AMS
ADB	FRA
LGW	ADB
DOH	IKA
OSL	FRO
HAM	KLU
LCY	BES
YNJ	DLC
EIN	BUD
SIN	POM
WNZ	TNA
MUC	LCA
JMU	TAO
HOU	BKG
VCE	MAD
MDW	EWR
HYD	BKK
OVB	FRU
SZX	NAY
GVA	DXB
BSB	GRU
GDN	TRF
ZRH	SVO
ORY	IBZ
CVG	ORD
EVN	KRR
CKG	HAK
CNF	REC
CCU	SIN
TRF	CPH
MCT	DOH
PRG	AYT
STN	BUD
CIA	AGP
KIN	MIA
TPA	GRR
SPU	LIL
TBZ	GYD
SFB	TUL
CPH	AMS
DME	AER
MPL	NTE
SAT	MEX
LHR	CAI
VCP	RAO
MAD	CAI
LTN	KEF
LIM	SJO
BUR	SEA
MAN	FRA
KGS	JKL
OSL	BCN
PGA	PHX
CMN	LHR
CAN	YTY
PRG	OSR
RMQ	PVG
ERM	PFB
DTW	YYZ
MAN	CRL
VLC	EIN
ICN	OIT
LAS	LHR
SVX	SHJ
LHR	SOF
ARN	WAW
ACE	BVA
SGN	FOC
SFO	IAD
DEN	ANC
PSA	GDN
VNO	DTM
COR	LIM
GNY	SAW
MUC	TBS
CRL	CIA
PVG	KWL
TBS	WAW
LCA	SOF
MIA	ATL
BOM	DEL
HIR	POM
BGY	SDR
PEK	LYA
DXB	JIB
JXA	PEK
YOW	YZF
AUS	DTW
MNL	MFM
LHR	ICN
OMA	LGA
NAP	ORY
BFS	FAO
LIH	PHX
IAH	MLM
CLT	CMH
SHE	BAV
LHR	LYS
TKU	CPH
CDG	CFE
MAN	HEL
LHE	SKZ
BKI	CAN
CAI	FRA
BIA	BRU
FOC	ZUH
DOH	BUD
IMF	GAU
PTY	COR
GOA	PMO
GPB	CWB
PBG	FLL
IZA	CNF
GSP	CLE
CAN	SWA
STR	CAG
IST	MUC
IXM	CMB
YYZ	YYC
JKH	ATH
JAI	CCU
CNF	VIX
KIX	FOC
BCN	GRX
SXF	BCN
MUC	BRU
VDH	SGN
DME	RGK
CTU	CIH
EWR	LAX
HOU	LAX
MFM	CNX
BGO	ORY
DCA	BGR
HLN	DEN
AGP	NYO
LPL	SZZ
NCE	SXB
BOM	CMB
PMY	AEP
NCE	OTP
NAS	LHR
HKG	LAX
MYY	KUL
LPT	BKK
FUG	DLC
EIN	KRK
KMG	YBP
JFK	SLC
OTH	PDX
SVO	HAV
PIK	DUB
PNQ	BOM
MAD	GRX
LGA	ORF
SNA	IAH
ARN	LGW
BRE	MUC
YCU	PEK
BKK	BRU
NCE	ORK
ADD	LBV
PTY	SAP
DUB	CLT
PHX	BNA
MAD	SOF
BOG	EYP
MUC	FAO
PHX	IND
GVA	BIO
BEL	ATM
YUL	TUN
UFA	NYM
SGN	CAH
STN	PRG
LCY	GRX
EXT	EGC
WMI	CRL
BTS	LPL
JFK	ACC
AZA	MSO
DEN	ALS
HRB	YNT
YFB	YOW
BIO	GVA
ARN	CTA
SHJ	KRT
JFK	SFO
HAM	DXB
CMH	LGA
XIY	NKG
YNT	ICN
COK	CMB
CHQ	HEL
POP	AZS
BOS	CLT
KIX	GMP
CHA	CLT
PLW	CGK
PIE	GSO
KGD	TAS
IKA	EVN
BKS	CGK
CGN	WAW
FRA	BRS
YQM	YUL
PDX	MCI
LCA	KIV
MPM	ADD
PHL	DTW
LHR	AMS
LGW	OTP
ESB	ADF
SIN	CPH
TRG	WLG
CRK	SIN
LGB	BOS
MUC	KVA
PRG	MAD
KHH	HFE
HYD	DXB
DTM	BCN
LAP	TIJ
DPL	MNL
AUS	MSY
CGN	CAG
IST	LGW
LOP	SUB
VIE	VNO
ZNZ	JNB
MAO	BSB
TAO	TSN
BRI	BCN
ROC	CLT
BOS	DUB
DEL	LKO
LOP	KOE
LIS	SSA
IKT	PEK
FKI	FIH
DBV	FCO
NBO	BLZ
SJW	SHE
BOD	AGP
BKK	IKT
ICT	DAL
BFJ	CKG
MEL	CAN
XIY	CKG
FCO	OSL
BWI	AUS
EDL	LOK
GVA	LPL
ARN	VAA
MFM	HFE
OER	ARN
KGS	HAM
HEL	CKG
MHD	UET
XIY	PVG
LEJ	IST
AYT	TRD
CGN	FNC
TET	UEL
SVO	SGC
LHR	CLT
FIH	TSH
BSL	DRS
YXE	MSP
TLS	BRS
CCF	CRL
HAN	TPE
CDG	TNR
ATH	AMM
CIA	PIK
CPH	ORD
MPL	LYS
TAS	OMS
CKG	SYX
HAN	FUK
ORY	EWR
VNO	ARN
PRG	DUB
ADB	HEL
JNB	INH
BOS	MUC
ACC	LOS
SEN	IBZ
CAN	MNL
FRA	SGN
ABZ	SYY
RNO	PDX
IND	FLL
OVB	TAS
PEK	FNJ
JIB	CDG
DAC	HKG
DOH	RUH
ZUH	KWL
DCA	TYS
YYZ	IAH
BLQ	BOD
BEG	FCO
EYW	ATL
SAN	STS
TUN	TIP
DME	HTA
GVA	RAK
CMN	RAK
LIT	LAS
SAW	STN
FRA	SVO
SLC	HLN
IST	OTP
TUL	DTW
LYS	ZRH
BUD	CPH
BUD	ORY
CHQ	STN
AGP	CPH
BGO	AGP
WUH	TSA
PHL	MDT
ZRH	DBV
MYR	YYZ
LGW	MJV
CDG	LTN
LAX	ABQ
MSR	IST
CMW	YUL
LBA	GLA
YTZ	YQG
VPS	ATL
LYS	LHR
MCO	PNS
DAC	AUH
IXS	IMF
BKI	KCH
LIM	ANF
BRU	VLC
PUY	CGN
MBJ	FLL
CLT	FRA
YUL	AZS
UDI	RAO
URT	BKK
MFM	KHH
VLC	BLQ
FNC	HAM
ILM	ATL
GAF	TOE
YUL	NCE
SJU	LRM
PLM	CGK
KWE	KWL
SAW	STW
CGK	SGN
IAH	SAL
RIC	EWR
NCL	BRS
HAM	NAP
CAN	NAY
KIX	BKK
ATL	COS
MAD	DME
SIN	DMK
SDQ	GRU
LAS	CLE
SEA	TPE
CID	AZA
PHL	YOW
OSS	KJA
IND	MSP
CAN	BAV
BNA	SAN
OVB	DME
HEL	ARN
LIN	LCY
FLL	BUF
VCE	YUL
NAW	DMK
CLO	TCO
JED	KHI
OLB	SXF
PSS	AEP
JNG	CTU
LAD	HAV
YTZ	YTS
DTW	ALB
LCA	AUH
NGO	ISG
LIS	ZRH
ORD	ELM
EWR	BTV
GLA	EWR
FCO	BGO
ADB	ESB
NGO	AKJ
MHD	RAS
LAS	BIL
MSR	SAW
AMS	YYC
BRE	FRA
YKS	OVB
FCO	PMO
BET	ANC
CMB	BOM
DCA	EWR
TZX	ADB
CAI	BEY
CMN	FRA
PVG	YNJ
ALC	CPH
MCI	STL
MIA	GSO
SHJ	DAC
ZUH	HAK
FOC	DLC
FRU	URC
DEN	CZM
TIV	DME
CKG	WUX
PHX	PSP
NAT	CNF
BRA	BSB
LHR	ABZ
ABX	MEL
LHW	LXA
TPA	JFK
IST	TLS
JAI	MCT
DEL	NBO
JFK	DTW
KGS	BGY
SXF	BSL
LTN	RZE
CGO	TPE
SXF	RAK
PCL	LIM
LIR	JFK
PHX	TUL
IST	BUS
YNZ	XMN
BHY	SZX
DYR	DME
SJC	IAH
YWG	YQD
TSN	KWL
GTF	SEA
MUC	SBZ
FRA	BRU
LRH	PIS
ORY	AYT
BRU	ZAG
NMA	CEK
ORD	BWI
XIY	CZX
CAN	JED
CMB	LHR
HGH	TNA
MSY	EYW
LCA	BEG
CTU	XMN
ARN	OUL
DXB	TIP
KMQ	ICN
HAM	LGW
KRK	OSL
KMG	CZX
MAD	LAD
DOH	WAW
BCN	STR
SXF	SVG
KHI	CTU
WMI	EIN
PEK	HNL
ORD	MOB
ISB	SHJ
YNZ	WUH
GEG	PDX
MGQ	EBB
DME	VOZ
PEK	DOH
NYO	ZAD
COK	BOM
HAV	SAL
MLI	MSP
SKG	CHQ
YVR	ICN
CLT	PDX
UCT	USK
WAW	FRA
EZE	REL
LYS	DXB
MCO	BDL
MAN	WMI
KHV	NER
TSV	CNJ
STN	BDS
MEL	CTU
FRA	TGD
ASE	DEN
HRL	AUS
TPE	HAK
LGW	SZG
BRE	RIX
BAV	PVG
IST	FDH
EWR	PIT
AGP	BRS
COO	NIM
AMS	IAH
AMS	LGW
SJU	DCA
MLE	MCT
BUD	MUC
STN	WRO
EXT	DUB
ATL	MEM
ATL	GRK
AUH	DOH
YYZ	MCO
LGW	CDG
MAN	AYT
FCO	HKG
YYZ	SCL
EDI	FRA
STL	RSW
IST	GOA
FRA	FDH
WRO	WAW
BHD	GLA
FOR	BEL
CGR	VCP
YUL	VCE
MUC	GRU
SHA	KMG
IAD	HGR
GYS	HGH
AER	EVN
YYZ	DEN
GRU	EWR
CMN	DOH
BOM	NBO
PSA	HAU
PIT	MDW
VKO	GUW
UME	TXL
ORD	PIA
BRU	YYZ
ZIG	DKR
DYU	SGC
LBA	CDG
VHC	LAD
USM	CNX
AYT	CPH
CGQ	XIY
AOI	STN
XMN	TSN
YWG	YVR
ORD	TXL
DEN	LNK
GVA	ARN
MAD	LGW
ORY	BUD
KIV	VIE
REN	DME
YNT	SHA
GUA	JFK
SEA	FAT
CCU	SHL
SBW	JHB
YYZ	TPA
ORY	JFK
DLE	LIS
ARN	VNO
PSO	BOG
BCN	SDR
TPE	LAX
WRO	LTN
IDR	DEL
AES	LGW
VCE	DOH
HSN	PVG
ALC	BGO
COO	ABV
DCA	NAS
AMS	DUB
DTW	LAX
HLZ	WLG
MUC	KEF
BKO	COO
OSL	SVO
PEK	KOW
ADB	CGN
ATH	VIE
WUS	SHA
RIX	ATH
GUA	BOG
TAS	PRG
TBZ	IFN
SHA	LCX
BOM	IXC
ABB	LOS
BGY	FEZ
SAW	RIX
ASM	NBO
ADE	ASM
ATH	DME
EIN	SVQ
MAD	SXF
ZUH	HFE
MAN	SVG
TXL	VCE
KTM	DAC
WMI	CIA
GBT	ZAH
BWI	MCO
SAT	JFK
LOS	DKR
ECN	ESB
BEG	SOF
NZH	KJA
MUC	HEL
KIV	DUB
DVO	ILO
CAN	CGQ
ORD	AUH
LSC	SCL
FCO	DEL
MIA	PHX
BGM	DTW
ABV	ILR
BHD	EXT
IDR	PNQ
BDS	CIA
KEF	BOS
MVD	PTY
YUL	CZM
SVO	FCO
IST	EDI
DOK	SKG
KBV	CNX
MKY	TSV
FCO	EWR
JNB	KGL
CDG	SPU
KUL	AKL
SUJ	OTP
OUA	BRU
AMS	MEX
JHW	BFD
DLA	GOU
DEN	ORD
ATL	MBJ
HRE	ADD
HNL	OAK
HGH	DOH
DYU	OVB
TPE	SGN
ORY	CTA
COO	SSG
DAC	DXB
EWR	CVG
STN	IBZ
MAN	GDN
CPH	PLQ
MCO	IAD
MIA	PTY
ASU	SCL
PEK	CKG
SFO	CPH
TPA	MCI
FNI	FEZ
DTW	DEN
PSP	PDX
YYC	YQL
TOF	SVO
IBZ	BGY
GVA	STR
SVO	BKK
BSB	PVH
CHA	SFB
MNL	SIN
BCN	DKR
MNL	TUG
PVG	NGO
DTM	KTW
SJW	PVG
KHH	XMN
SAT	IAH
CPT	PLZ
TGU	IAH
BLZ	JNB
LRM	JFK
OLB	MUC
DSM	IAH
STL	HOU
MEX	IAD
LHR	TUN
PVG	SHE
WAW	ARN
PGD	RFD
YOW	LHR
LIR	YYZ
PFB	ERM
BLQ	KRK
GRU	AEP
SJW	HET
BGY	KGS
BCN	LHR
NGO	AXT
ATL	MSY
CDG	CPH
ZHA	SYX
BUD	CDG
CRD	NQN
BUD	BCN
DOK	SHJ
LAX	TUS
CZM	ATL
TDD	LPB
SFT	ARN
LIL	BOD
EWR	DEN
DEN	LBB
BRI	CIA
TSN	SHA
CDG	CZL
TUN	GAE
PUY	FRA
MDW	TTN
ATL	LIM
JUH	CAN
GRU	FOR
DPS	SYD
TPE	ICN
LIG	NCE
WNZ	PEK
LHR	BRU
NGS	UKB
JFK	ORY
IAD	CUN
TOS	ARN
XMN	TNA
FAR	AZA
ICN	HAN
FOR	MAO
AUA	PTY
COR	GRU
LHR	IAH
ZYI	CAN
LAX	ARN
LHR	LAX
MIA	BDL
TPE	DEL
ATL	LAS
LAX	YEG
BNE	CNS
CRL	AOI
ALC	SVG
GCC	SLC
MHD	ADU
SIN	SRG
BLI	PDX
MRS	LIS
HEL	KIX
PUY	CRL
HYD	MCT
CGO	CAN
EWR	DUB
BKK	DXB
IND	TPA
SFO	YEG
DEN	SNA
SHV	IAH
SYD	KUL
VAS	ADB
RIX	KIV
BLR	BKK
KRR	OVB
RST	AZA
CDG	FIH
FNJ	VVO
SLP	CUN
TLS	RAK
KRR	SAW
NKG	PEK
IAH	MIA
MYR	EWR
AZA	FAR
LYS	AGA
FRA	ABV
DTW	ITH
MAR	VLN
TGI	LIM
BOG	GUA
SFO	FRA
ZRH	WAW
PER	DRW
BOH	IBZ
SGN	TPE
SCL	UIO
MID	CUN
MSP	ATY
FLR	CAG
BEU	BVI
SFB	ABE
WNZ	SZX
BOM	AGR
DEL	BHO
GRU	FRA
ILR	ABV
OMA	ORD
USM	HKT
BOI	LWS
PVG	KMQ
ORD	MIA
WIN	LRE
DEN	PIT
PHL	MYR
IST	BEG
BOS	IND
ORD	YWG
RNS	CDG
TNR	MRS
BUD	OSL
BOS	ACY
VIE	MAN
CLT	FLO
ACE	GLA
OVB	KHV
DSM	LAS
MBS	ORD
PBH	KTM
BCN	AMS
OPO	CCF
NKG	JJN
TXL	AMM
CGN	PUY
RTM	IBZ
PVG	TNA
STW	SVO
IAD	JFK
STN	BIO
BOS	ZRH
HGH	FOC
KHN	PVG
CTS	UKB
CMH	MSP
MEX	TIJ
BRU	ABJ
DEN	GEG
DXB	KGL
FMM	CHQ
CKG	SZX
LIS	IST
CLT	MUC
PDX	OGG
PHL	SDF
MEL	DPS
MCI	IND
VCP	CNF
SLM	BCN
SJC	RNO
BKI	SDK
DAL	AUS
SEA	SNA
CLT	ORD
BSB	AJU
VLC	SOF
BCN	CAI
ZUH	KOW
DRW	SIN
MUC	BRN
SLC	GJT
KWE	XIY
SFO	MCI
PRC	LAX
HOU	OAK
YZF	YOW
MUC	BOS
SKG	WMI
BWN	SIN
RUH	LXR
BOD	CMN
ONT	SEA
KIX	PEK
LHR	EZE
XMN	KWL
AMM	ZRH
KTW	BGO
OTP	TXL
JNU	KTN
MFR	LAX
DLA	IST
CEN	GDL
AUS	IAD
KHH	HKG
WNZ	KMG
NCL	DBV
PHE	PER
XNA	DEN
LAS	PVD
TSN	PVG
YYC	YQG
LCA	MUC
PVG	FRA
ACC	LIS
MSP	RHI
BCN	BHX
AMS	PVK
MDW	MBL
BNE	HKG
GRU	CCS
MXL	MEX
SZG	ACE
BOS	SDQ
SXB	BRU
MCT	KUL
CDG	DOH
KHI	ISB
MSP	INL
ZUH	SHA
AMS	HOG
CVG	STL
FCA	SLC
EWR	IAH
ERZ	ESB
ZRH	LUG
BNA	MDW
BOG	LIM
CAK	BOS
CAN	GYS
NCE	NAP
IST	RIX
SNA	SLC
FNC	STR
ZRH	HEL
CDG	JNB
KMG	CEI
DKR	DLA
PRG	FRA
GIB	LTN
JED	JFK
BOG	EOH
LIS	DUB
CIF	HRB
PDX	SLC
STN	CAG
VIE	VKO
HEL	DEL
HTY	JED
SVO	STR
BNA	IAH
DUB	TSF
BOS	ALB
ATL	EYW
YXY	YYC
FLR	BHX
ORK	GDN
EIN	FAO
KCA	URC
PEK	AUH
TVF	GFK
TIA	VIE
DCA	YUL
AVP	CLT
TRD	BOO
TAO	CTU
STN	BRE
RUH	FCO
AOJ	NKM
DSM	PGD
MYY	SBW
ORY	AGP
LAX	ATL
HAJ	SVO
NGS	ITM
TSN	HKG
EGO	DME
TXN	PEK
MEX	SLW
MCO	LBE
BOG	LET
NBO	JED
TRF	DBV
CNF	CPV
SJU	AZS
GUA	MGA
NSK	ABA
PEK	UYN
RZE	MAN
BSB	MIA
FAI	SEA
BUX	BNC
HKG	ADL
MFR	DEN
MAD	LDE
PSR	LIN
DXB	EBB
MNS	LUN
NAO	XIY
ZRH	ATL
SDJ	FUK
ROC	BOS
MRS	PRG
OPO	LIL
YUL	TLS
SJC	PDX
ALS	DEN
BVA	ALC
AMS	LIM
CNS	HKG
LIR	SAL
SVX	AER
DDG	PVG
FLL	CMH
RNO	LAS
SWA	CTU
GRU	SLZ
LAS	BUF
ORF	IAD
BMI	MSP
BRU	ORD
CCS	MUN
BGY	DUB
TML	ACC
SDK	BKI
DEN	FRA
SIN	DAC
CDG	BRU
AYT	GVA
DEL	IXJ
DCM	AGF
AER	VKO
CKG	XIY
JFK	WAW
ICN	XMN
YXX	YYC
STN	PSR
MRS	ORN
CGK	DPS
VRA	YYZ
SYR	ATL
MUC	AUH
LIM	TGI
YYZ	YQT
CLO	GPI
BCN	SVQ
CGO	NNG
GNY	IST
LHR	CPT
CNS	DRW
YQG	YYZ
MAQ	DMK
LHR	MSP
HKG	XIY
SEA	JNU
IKT	BTK
TAS	UFA
ATL	BRU
JED	AZD
PLU	AAX
DWC	OVB
LLF	KMG
MCO	IND
SEN	AGP
ILO	HKG
AMS	ALC
SEN	KRK
LGA	MDW
LTN	FAO
LIM	JAU
ZHA	NAY
LYS	LIS
MAN	BGO
LHE	SHJ
RUH	SAH
LHW	CAN
DXB	YYZ
SJU	CCS
HNL	ATL
SJU	PBI
MEX	MCO
ZIH	PHX
IST	EZS
BOM	CTU
IAH	LAX
DTW	ORF
IST	KYA
LOK	EDL
CVG	MMU
ZOS	ZAL
IXZ	DEL
BHS	SYD
BCN	RGS
TGD	VIE
WUX	MFM
SSA	REC
KUN	DUB
NBO	MPM
SAN	LHR
AUH	MCT
EVN	PRG
CNX	SIN
DXB	BNE
CAN	CZX
TRD	SVG
STN	BOD
SAN	PHX
MAD	BKK
GRU	POA
YYZ	CVG
PTY	MBJ
BOI	SMF
XBJ	MHD
COR	SLA
AYT	SZG
LAS	LRD
BTS	KSC
LBL	DDC
FSD	PIE
SFB	CKB
ROC	IAD
MPM	LAD
YQR	YEG
HKG	AMS
LLW	BLZ
ROV	SHJ
NAS	HAV
BVA	VLC
OUA	COO
RSW	DTW
DLU	KWE
YXT	YXS
FCO	LIS
DOH	BKK
UIO	XMS
MAD	LIM
ADB	CDG
CUN	AUS
AEP	PMY
LAD	CDG
SIN	CMB
PVG	HRB
BKK	KHI
VCE	PHL
NCE	CMN
NTE	MAN
BSL	ADB
MRS	MAD
ORY	SAW
RUH	FRA
HNL	PPT
BOM	BKK
LIT	PHX
EGO	ROV
LZH	CAN
SBA	DEN
YHM	YQM
BTS	DUB
ACC	ROB
BEY	TUN
BKK	AMM
TUN	LYS
TSA	WNZ
YYZ	YXE
BOG	GRU
BWI	ALB
OTP	STN
PEK	DLC
SZX	JUZ
FOC	RMQ
TYN	SZX
BOM	BRU
NBO	ZRH
SVO	VAR
TYN	CGQ
CGB	AFL
CLT	LHR
PIK	RIX
AMS	VIE
SZX	WUX
CJB	BOM
EVN	KJA
DXB	GLA
AUS	SJC
WRO	MUC
TSF	PMO
LPL	GVA
OSL	KRS
RZE	BVA
DYU	OMS
AMS	PSA
ATL	YUL
RIX	PRG
ONT	SJC
WMI	SKG
STN	VST
TXL	DME
CHC	HLZ
FUG	HGH
BOM	BHO
LXA	CTU
VRA	SNU
PTY	SJU
CKG	SHA
PSA	MAN
MIA	IAH
BRE	BZR
YZR	YYZ
LPL	ORK
VOG	ROV
JNB	ZNZ
AKL	CAN
ARN	RIX
RNO	PHX
AMQ	SUB
FOC	CZX
SVQ	BSL
LAX	MUC
GRU	AUH
YNZ	HRB
CNX	PEK
YEG	YVR
YYZ	BGI
GJT	LAS
IND	SFO
DYU	KUF
BCN	SAW
LUG	GVA
MLG	DPS
FCA	LAS
WMI	MRS
STN	MUC
KWL	SHE
TIA	MUC
MDW	MSY
SAN	BOS
BMU	DPS
IND	CLT
DEL	CAN
IBZ	LHR
VLC	STN
TSF	CMN
MSP	FLL
ETR	UIO
ASR	ADB
ATL	LFT
MOD	SFO
OPO	GVA
BHX	BHD
FAO	SNN
MEM	MCO
TIU	WLG
ISB	MCT
RIX	ZRH
EVN	FCO
PHE	BNE
YOW	YXU
BHX	ADB
LHR	CMN
ATL	CLE
DAL	ABQ
NAP	GVA
YUL	YYT
KAA	NLA
ORD	RST
BDL	IAD
ORD	GSP
TUN	VIE
OVB	SVO
CMN	JFK
PZU	JED
PHL	HPN
MEL	HKT
FRA	NGO
KJA	TOF
JGA	BOM
ORD	SFO
STI	SJU
CRL	LRH
IAD	CVG
RPR	CCU
LIM	SAL
HIJ	SDJ
ISB	BHX
VCE	EIN
MDW	ALB
DOH	SHJ
MCO	YYT
ZRH	LIS
DOH	OSL
MNL	DVO
YXE	LAS
PER	DOH
FRA	ACC
PIT	DCA
TUN	DOH
MAD	SXB
ILG	DEN
LAX	ANC
BHY	CAN
KUL	KHI
NIM	COO
GTF	HLN
SJO	ATL
CAG	GOA
CPH	FCO
KCH	SIN
NTE	BRU
PEK	AMS
TPA	IAD
BUF	FLL
HRB	SJW
PMO	BRU
TYN	KWE
BRU	BEG
DLA	FIH
LCA	VIE
BKK	SWA
CDG	WAW
TAO	NGO
NWI	MAN
ORD	SGF
GSO	MIA
XMN	CGK
CDG	FAO
VLC	CIA
CRL	PGF
BKI	LBU
TBT	MAO
BNA	ATL
NCL	LGW
LIM	CCS
ZRH	GDN
CYX	YKS
BEG	ZRH
WAW	ATH
YCG	YVR
AMS	KGS
SMF	LGB
DKR	DXB
UCT	SCW
IST	VNO
KHH	HGH
ORY	ORN
GJT	DEN
NAY	IQN
MSP	ABR
SAL	RTB
DEN	LAR
MAN	BSL
BHX	ALC
FRA	AUH
MKG	ORD
SLC	SMF
ALC	VXO
CAI	KAN
PIK	WMI
CHQ	LBA
MUC	OSL
MRY	PHX
JNB	TET
SVQ	PMO
CLT	HHH
HYD	VTZ
BHM	HOU
LAS	ALB
CRL	WMI
ALF	TOS
NSN	WLG
IAS	VIE
SFO	MLM
TUL	MIA
JJN	YIW
BTV	JFK
YVR	YLW
OAK	DEN
SEA	DXB
DOH	AMS
MSO	AZA
EIN	BGY
BEY	LOS
CPH	DUB
PMO	SVQ
PLU	MOC
BWI	HOU
SIN	JOG
MSP	BNA
TUN	MIR
GDL	PHX
SDF	PHX
CKG	SIN
YFO	YQD
BVA	CIA
BVA	NYO
TAO	CGQ
BOD	CIA
SFO	LGB
GDN	NYO
VKO	LAX
PEK	JXA
DTW	EVV
YKS	VVO
FLL	JAX
VNO	STN
MDZ	COR
BGY	KTW
SYD	CKG
CTU	CGQ
RSA	AFA
BZE	MID
RAK	CDG
MSP	PSC
AUH	BKK
CDG	BLR
ICN	NGO
FAR	MSP
BGO	AMS
IXG	BLR
CRL	KRK
YLW	LAX
BHY	PVG
SJJ	BEG
TPA	EWR
BOD	ORY
YLW	YXY
DEN	BOI
OPO	CFE
BRI	LIN
LPL	VNO
DUB	FMM
HEL	SPU
LUN	LAD
LLK	DME
EWR	GVA
DXB	PEW
SAW	CPH
GSP	PGD
OAK	HNL
SFB	IAG
DEL	MCT
BRS	PRG
DOH	ATQ
DTW	STL
AEP	SFN
SFB	FAR
JNB	GRJ
HYD	PNQ
WUH	SIN
PUW	LWS
OUA	BKO
MUC	CAI
MNL	AUH
DEN	FAR
CLT	SJO
DEN	MLI
MAN	LIS
YOW	YYT
YOW	DCA
OVB	CEK
FRA	BCN
SAP	IAH
BEY	ATH
IPL	SAN
ROC	DCA
BEY	RUH
SZX	TSN
MAN	PFO
AFA	LUQ
LHR	BCN
BRI	CGN
ELM	ORD
MSY	BWI
FNC	PRG
TPA	MIA
MKW	SOQ
RTM	FCO
CTU	YIW
ASM	JED
DOH	KUL
BRU	DME
ALC	ORY
SVQ	MRS
FCA	MSP
HAK	XIY
FRA	MBA
LHR	SNN
SYX	ZUH
DMK	NST
AMS	BOD
DAL	BKG
LIN	TXL
LHE	KUL
ORY	PRG
OSW	DME
CIA	SDR
KND	FIH
PDL	OPO
MAD	GYE
HET	CKG
PMR	CHC
SDK	KUL
DAC	KUL
SAW	ORY
NAY	XMN
FCO	ORY
MRS	TUF
DUB	LHR
MCT	COK
TBB	HAN
YYZ	ZRH
KRR	BUD
XIY	YBP
PEK	WUH
ATL	CZM
PRG	BGO
POA	MGF
CTU	KHH
MCO	TLH
MLE	PEK
ICN	FRA
HGU	POM
GSP	DCA
FCO	NCL
PHL	AMS
MAN	BGI
ATL	SAV
VIE	CPH
BOS	BHB
HKG	SUB
BKK	SZX
FOC	SGN
JNG	DLC
ACY	TPA
OTP	NCE
CNX	KUL
BKO	ADD
OTP	CDG
KLO	KUL
NNG	XIY
CDG	ZAG
OTP	PRG
CAI	NBO
CAI	MAD
ATL	ABQ
MLI	ATL
KUL	BOM
XIY	KWL
CIJ	CBB
LHE	MAN
ISB	PEW
DXB	PZU
BRI	GOA
CPT	AMS
ORD	ANC
OVB	HKT
ZUH	XMN
MAN	AGP
GSO	EWR
GVA	PRG
ARN	DOH
AUA	CLT
CNS	MEL
NMA	KRR
FOC	KUL
DEN	LHR
BDO	SUB
VCP	FLN
PHX	DCA
JFK	GYE
FRU	DME
LOP	DPS
SMF	PDX
YYZ	CLE
SOF	LTN
EVV	DTW
GSO	PHL
AMM	SAH
IAG	PIE
MCO	JAN
SLC	GEG
BGO	KRK
LOE	DMK
DDG	PEK
YDF	YYT
ENU	ABV
DMK	URT
HEL	KAJ
AMS	SFB
SYD	HKG
VKO	URS
CDG	OLB
CRP	LBB
CNF	AEP
CLE	CMH
BHY	XIY
HKG	HYD
BFS	LTN
YUL	ZRH
BCN	TLS
PHL	LHR
MCO	STL
DEN	JFK
CLT	MYR
CXH	YWH
BGO	FCO
KHI	BOM
TOS	ALF
CAG	MUC
TLH	DCA
KIM	JNB
HGH	SZX
PNS	MCO
LAS	BHM
MGF	POA
VVI	LIM
AYT	CGN
EBL	FRA
CUN	LAX
SCL	COR
AMQ	SOQ
NTE	ATH
BRU	DUB
ZAG	CGN
ALC	SNN
MFM	FUK
EBL	ADA
FRU	CEK
GDZ	SVO
SVO	VOG
CZX	PEK
YYZ	LHR
TVC	ORD
BOS	DXB
IAD	DTW
BHM	MSP
CDG	AAE
CLT	BDL
PTY	NAS
AMS	KRS
IAH	MSY
TAO	SIN
KIX	PUS
LGW	TIA
TPE	BKI
AYT	HAM
BHM	BWI
SYD	CHC
OLB	FRA
IAH	MEM
MIA	BOS
BLQ	OTP
TRD	SXF
PBI	CLT
AMS	EXT
SIT	JNU
LHR	GVA
BUD	SKG
TYN	XMN
HET	CTU
OSL	GVA
TOS	HFT
ABZ	CDG
RTM	MPL
AGP	KRK
HKG	CGO
GDN	BHX
BOG	MZL
DLC	HRB
HSN	XMN
PIT	IAH
TIJ	DGO
BRS	GVA
XMN	JUZ
WRO	BVA
PMO	BOD
CPH	CTA
TSN	HRB
SGN	VII
YWG	YXE
NGO	SHE
IMF	CCU
TIP	MAN
CAN	MLE
EIN	WAW
LTN	PFO
IAH	UIO
ALB	CLE
YYZ	PIT
FRA	RUH
CJB	DEL
HFE	ZUH
YUL	SFO
VKO	TXL
CNX	NNT
AKL	ADL
SJW	CAN
URC	HTN
EGC	EXT
CLT	MLB
DXB	ICN
MUC	TLS
CGN	SZG
HEL	KEM
YYZ	YQG
BOI	PDX
TSA	TYN
DXB	CGK
MEX	MXL
MAD	AMS
YKF	YYC
EVN	TJM
SPU	GVA
PEK	JNB
GOA	MUC
BOD	VCE
DEN	AMA
NKG	XMN
EBB	KGL
NAP	BRU
MCO	LAS
OAX	MEX
BHX	BZG
CDG	SVG
LEI	MAN
OPO	MUC
ESB	IKA
BEY	ADD
ATL	MCI
SZX	TYN
BVA	BZR
NAS	DTW
ABQ	OAK
VIE	ORD
LGG	AGA
FIH	KND
LHR	ARN
PVG	XNN
IST	TAS
HGH	URC
DTW	PIA
AMS	CAN
CAG	SXF
NCL	AGP
NBO	POL
IAH	VSA
IAD	DAY
TYS	PHL
LBA	VCE
SHJ	IKA
FRA	JED
PVG	KMG
CAG	PSA
ATL	LAN
JNB	UTN
ARN	DXB
IND	CUN
SGN	PEK
FRA	ALC
BEG	ESB
STN	GDN
AYT	LNZ
KWE	TNA
SAP	SAL
MSP	TVC
FNA	ABJ
URC	HGH
OTH	SFO
VCE	NAP
BVA	KTW
KIJ	ITM
PMV	BLA
DRS	ZRH
PVG	HKT
CGQ	TYN
LCA	ZRH
EVV	ORD
CKG	SYD
KWL	PUS
NCL	BFS
CWB	GRU
RIX	LTN
VCE	BRI
CDG	ISB
HAN	PUS
JHS	JEG
TPA	LAS
KRK	NCL
PEK	PUS
ARN	KRN
FRA	LCA
ARW	BGY
LZH	SZX
RNO	SEA
UYN	NAY
MAD	LOS
POZ	LPL
MCT	GWD
DLH	LAS
IXR	DEL
STL	IAD
SZX	BFJ
HBE	ATH
EZE	FOR
KGL	ADD
MTY	VSA
SKP	VIE
LTN	INV
CMN	BKO
MYR	CRW
BHX	MJV
BRS	BZR
ARN	OLB
BKK	BLR
SXB	PRG
TAO	RMQ
PVG	MFM
EIN	KTW
AMS	CPT
BWN	PVG
MCO	HPN
SAN	YYZ
TSA	SHA
NCE	TLS
SYX	CTU
BVA	BDS
IKA	PEK
EDI	BGO
ESB	MUC
MAR	MIA
LAX	PVG
VXO	AMS
EIN	ATH
LZH	SHA
XIY	MIG
TIJ	CUN
ORD	MKG
SXF	BGO
LCA	CAI
BES	ORY
TRF	GDN
LCY	BRN
LOS	FRA
GRU	BGI
CDG	BRS
BRU	KEF
ZUH	CTU
MUC	SKG
EWR	STR
HKG	EWR
SXF	LPL
CMN	LBV
ABJ	COO
LTN	NCE
LAN	MSP
CNF	MAO
KIX	RMQ
PSA	BOH
TOL	SFB
KHN	DMK
OVB	BKK
WLG	SYD
FCO	ZRH
SHJ	CAI
MGF	CGH
OMS	OVB
SHA	JUH
TSN	TYN
DQA	PEK
ABE	PIE
TRD	AYT
BKI	BTU
VIE	GYD
CLT	RSW
ENY	PEK
SLC	ANC
YYC	YVR
HVR	BIL
MZT	LAP
SVO	MMK
CDG	SLC
SHA	WNZ
SWA	NKG
PHX	SBA
IKA	CGN
BRU	AGA
DCA	PBI
CAN	BHY
SFB	DSM
RVD	VCP
PMO	FLR
AMM	MAD
ARN	DBV
IAH	TAM
NAY	CIF
LGW	FAO
STL	MSY
YVR	YYZ
WAW	CRL
CDG	LPL
OMA	STL
PHL	SJU
CHQ	BRE
SAN	SFO
HKG	CNX
ZAD	DUB
KUL	BDO
MRS	LYS
ZHA	PVG
BGY	SKP
OPO	FNC
CTS	AXT
DAL	MSY
LGA	ROC
PTY	CNF
CGN	MUC
YHM	YYC
DCA	LGA
NYM	SVX
AUH	JAI
CDG	LHR
NYO	SKP
TSN	CGO
KRT	SAH
MNL	GES
CAK	DEN
DXB	SIN
PHX	BWI
BRU	VAR
PIE	SWF
IDR	NAG
LIS	BLQ
TYN	FOC
CLE	JFK
CTA	TSF
CTA	BGY
YYZ	KIN
ANF	LSC
LYS	FLR
DEN	GTF
GRZ	TXL
PHL	ORF
GZP	ESB
KRT	RUH
XMN	HSN
KOW	CTU
ISB	JED
JED	YYZ
RIX	PIK
GDL	SNA
CDG	GRU
RAR	SYD
UET	ISB
IST	TXL
RUH	HKG
ORD	PVD
FUK	CTS
PDX	TUS
ACC	MAD
SHA	SJW
EZE	USH
TYN	BAV
RTM	EIN
GYD	KBL
FOC	KWE
SJC	LIH
LUN	DUR
HAN	DMK
DUB	STR
CPH	YYZ
LHW	WUH
MNL	KUL
DEC	ORD
AZO	ORD
HFE	TSA
TUS	MSP
TSF	STN
FLR	MAD
HEL	LJU
KGS	BSL
GSP	HOU
TXL	VKO
LHW	DNH
DEL	CCU
DOH	JED
SZX	ICN
JFK	KIX
DMK	MDL
OPO	CDG
BUF	DTW
BCN	SEN
MAN	KGS
TGD	CRL
AYT	LTN
MIA	LPB
SIN	TSN
SVG	LHR
ORD	CAK
DMK	LOE
YYZ	PDL
KBL	ESB
TPA	MSY
YKS	HRB
DMK	SUB
IAD	YOW
SNU	YYZ
CGN	SKG
HET	TSN
CRL	RDZ
MSP	ORD
SVG	FRA
SJW	URC
CNF	IZA
VTE	ICN
LIM	CIX
MEM	MKL
EZE	BOG
OXB	BJL
AUS	PHL
PVR	TLC
BOS	CLE
CMB	DOH
LEJ	FRA
GVA	TLS
RMQ	CAN
MAN	MJV
BHD	EDI
IAD	JAX
CGH	CNF
LTN	VAR
KTW	WAW
HAV	FRA
XIY	LZO
KNX	DRW
TIA	BGY
KJA	FRU
CAI	DME
ESB	ECN
BRU	FNA
CEK	OVB
TRF	SVG
GOM	FKI
HKG	AKL
JED	MCT
YYD	YXS
BZV	LAD
LCY	NTE
SVX	FRU
SLC	RAP
SAW	MUC
RTM	FAO
HKG	RMQ
JFK	LIR
FRA	SAW
DME	RMI
CTA	NAP
SVO	ICN
FCO	BDS
DCA	HSV
LIN	LHR
BEY	SHJ
KHN	WUH
KTM	JKR
BRI	CRL
TIP	LHR
WUH	NNG
CDG	CVG
PBI	NAS
MAN	ADB
SKG	CIA
ABV	GMO
ORD	ART
CAG	FCO
HNL	SEA
EGC	CRL
LGW	OSL
MIA	GEO
OMA	IAH
NKG	SJW
SZX	TEN
ATL	CHA
FLR	LGW
XIY	YTY
PHX	STL
CLT	HPN
VIE	LEJ
DCA	TPA
PEK	LAX
MUC	OVB
KWE	ACX
LHW	TNA
MRS	AGP
TRC	IAH
LHR	ORD
PHX	SOW
HGH	KIX
JNB	BUQ
CMN	BEY
IKA	PVG
KUL	HAN
LAX	FAT
MLE	COK
KHI	DOH
DOH	DEL
AJA	BOD
AGP	STR
CCS	SCL
MCN	ATL
BUD	SAW
ADL	BNE
DAL	STL
FWA	DTW
KWE	SWA
HEL	VAA
AUH	FRA
PEK	CIH
JHB	KUL
TBZ	SYZ
LAS	BOS
MCI	SAN
TPA	ORD
CAN	HRB
JOG	BDJ
MIR	NCE
KMQ	TPE
HKG	BKI
VIE	SVO
CGO	XNN
SYX	KWE
IAH	CLL
GLA	LTN
MLE	IST
SFO	BOI
JNZ	HGH
CMN	BGY
ABV	ACC
LIL	DBV
YYZ	CAI
CNX	HKG
DBV	STN
ATL	ATW
LAS	GDL
ACE	PAD
LGG	AJA
VCP	AJU
TYN	CAN
AUS	BNA
YYZ	SJU
IST	RTM
SJW	CGQ
LTN	IST
SAT	LAS
SNO	DMK
NAP	STR
HLH	HET
ORY	BES
ATL	MEX
MZL	BOG
XAP	FLN
DYU	UFA
MCO	CVG
SOF	BRU
SNN	LHR
ORY	FEZ
BUD	BEG
CDG	BKO
DCA	MIA
DUB	AUH
CMN	BCN
KIX	FUK
AUA	MCO
MTY	ORD
ATL	SDF
BRU	OTP
ATL	SDQ
SBP	PHX
WLG	BNE
SDD	LAD
WUX	PEK
MEX	UIO
ROV	EVN
TIJ	MEX
KTW	DTM
IAD	ICN
LHR	YYT
TSN	TXN
ADD	BKK
ADL	MEL
FIH	LBV
TUN	LIS
ZAG	ZRH
PEK	NNG
ARN	BGO
RIA	GEL
KLV	SVO
FOC	HGH
CCU	KUL
NKG	HRB
ATL	SAL
AUS	CLT
MAD	AGP
LPL	BCN
SMF	LAS
CIA	KTW
SYR	ORD
AMS	LPL
CLT	HSV
WRO	STN
SPU	FCO
RAK	LIL
VAI	WWK
MSP	IMT
YQZ	YWL
PEK	NZH
SAN	ORD
POZ	CIA
ALB	LAS
FRA	TXL
AUA	IAD
OVD	BCN
COK	BLR
PTY	FLL
ORD	COS
LRH	STN
AUS	BWI
JUB	CAI
PVG	EWR
SGN	BKK
DOH	CMN
BKK	NNG
MTY	AGU
BGO	KRS
BSL	LCA
ADD	LUN
ZLO	IAH
PSA	CPH
MOL	CPH
DEN	ATL
HKG	CTU
CLT	ALB
BOG	ATL
LYA	BHY
MKY	MEL
JAI	BOM
HAM	LHR
BDL	SJU
FCO	RZE
SEA	OGG
RTM	VLC
YQK	YHD
SNA	YVR
BLR	HKG
YEG	YXE
PSR	BVA
XIY	HKG
MWX	TSN
DLA	NBO
CCU	DEL
AYT	VKO
TLN	RTM
SAL	GUA
ADE	RUH
KUL	DPS
PMO	TXL
MCO	PHX
SFA	BEN
DME	HMA
LKO	MCT
FUG	WNZ
CGH	CGB
IST	IGD
ABJ	ORY
GYE	UIO
BNA	MKL
DPS	SUB
OXB	CMN
AVA	CAN
PDX	SJC
LBF	DEN
LYS	DUB
BHM	CLT
STR	GVA
BRI	DUB
PTY	VLN
YNT	HRB
PHL	MAD
CGN	DUB
STL	PHX
LBA	PFO
NAY	CTU
AGP	BOH
LAX	AMS
HKG	BOM
BKK	TNA
TXN	CKG
GYE	CCS
MAN	ORK
SYR	IAD
OPO	YYZ
DME	PEE
FRU	SAW
MTY	LAP
BLJ	ORY
RMQ	NKG
HEL	SVL
DME	KVK
OPO	LHR
SZX	KHH
YVR	YWL
KUN	STN
JNB	DXB
PGX	ORY
NYO	RJK
LIH	OAK
DPS	WGP
FCO	LUZ
VPE	SDD
DXB	BOS
HKT	MNL
SEA	IAH
LAS	PIA
OSL	NCE
FNJ	KUL
ANF	CJC
HGH	HAK
BRU	LIN
PVG	YVR
NCL	PSA
TXL	SVO
YYZ	BOG
ACY	ORD
BLK	ALC
VIE	KLX
PDG	CGK
SYX	FOC
XMN	WUH
MQN	BOO
YTY	CGO
SIN	NKG
FRA	DRS
VCE	ARN
AYT	GLA
CGN	STN
KMG	DLC
NYO	CHQ
LGA	SYR
BNE	LST
SGN	TBB
MCT	AUH
MPM	APL
SAN	DEN
TIV	BEG
OLB	BOD
MAD	UIO
DPL	DVO
ADE	SAH
FEZ	BVA
CVG	CDG
JNB	LVI
CHS	DCA
CAI	TUU
IAH	OMA
SLY	TQL
ABB	ABV
IXE	SHJ
CDG	ZRH
MSY	TPA
XNA	ATL
CAN	CGK
GOJ	DWC
AMM	FRA
SHJ	BOM
AMS	PHL
YEG	YZF
ALC	HEL
SSA	MAD
ARN	HEL
LAX	MEL
OLB	ZRH
JIB	DXB
CGO	KWE
TIA	VCE
JFK	RUH
DUB	LGW
DEL	SXR
OTP	CIA
SFO	SMF
CTU	BKK
MEL	BNE
LAP	MTY
CUN	SAT
XMN	BKK
SJO	CLT
JED	DOH
AYT	BGO
CGK	CAN
SVO	OTP
GLA	FAO
WAT	MAN
BRU	CTA
STN	FEZ
KLU	CGN
TPE	XMN
TAS	BKK
SOF	MUC
BUD	FCO
STN	AMS
NBS	TSN
MIA	LIS
BGY	WAW
SRE	VVI
BHX	BTS
SVX	MUC
BNA	PVD
SYX	YCU
WNZ	KWL
IND	MCI
WUH	SYX
DMK	CJM
ITM	KMI
BZN	ORD
LZO	PVG
PSA	SVO
BDO	BDJ
STL	OWB
HFE	SWA
ORD	FSD
SIN	USM
CMN	NIM
BKI	TPE
SVO	BUD
KIX	MYJ
WEF	PEK
ERF	LGW
BOS	SNN
SKD	KJA
MLM	IAH
CMH	DEN
LUN	JNB
LHR	CGN
CGK	RUH
PRG	ATH
BRN	CGN
CGK	DOH
YSB	YYB
FAR	LAS
OMA	MDW
CJC	SCL
TJA	LPB
SLC	BTM
ADA	TZX
TXL	SJJ
MCI	CVG
ORY	TXL
UDI	GYN
DUB	LCY
MCO	BOG
ECP	BWI
DUB	BUD
IFN	MHD
AGA	AMS
BKK	CMB
XIC	KMG
NIM	ADD
TSN	BAV
SFO	AKL
LTN	RIX
MFM	SHA
MAO	MIA
LCA	SVX
SAT	HOU
DLC	FUG
YIW	LYI
CGN	TXL
LWS	SEA
LAS	ZRH
CPH	BRU
PRG	TAS
BOS	FLL
DEN	OMA
BEG	TXL
TZX	AYT
MMK	SVO
LBA	SOU
MAN	TIP
PHL	AUS
ATH	OSL
JOG	LOP
FAR	DEN
MAD	PEK
YEG	SEA
DEN	SHV
SHE	CZX
WAW	HAM
WRO	WMI
KMG	HKT
SKG	OTP
TPE	KWE
LYS	CMN
STN	SAW
BKK	ISB
LOP	JOG
SYX	PEK
DUR	JNB
SVO	ABA
TIJ	CEN
XIY	XMN
CPH	ATH
LIS	BUD
ORD	DOH
PIS	LYS
BTS	PRG
BEG	EIN
OSL	SVG
ART	ORD
DTM	MUC
MEM	AUS
PDX	STS
SLY	NOJ
EBL	MUC
DXB	BEG
LAX	PDX
DVO	PPS
VIE	BSL
BRE	FMO
SOF	BGY
ACE	AMS
CMH	MCO
HAM	ARN
LIM	TBP
SFO	SLC
LGA	PWM
LIN	ARN
TTN	BNA
IKA	TAS
ORD	IAD
NNY	NAY
GMP	KIX
SHA	CGD
BRS	TSF
ICN	RUH
BIO	MUC
MHD	DYU
AMS	PMO
BOM	JLR
BOM	RUH
LBA	TSF
LMM	GDL
KHH	SIN
POZ	EDI
DUB	SOU
BHI	AEP
SXB	AJA
GDE	JIJ
MSP	ATW
CEN	HMO
CZX	ZUH
AOI	CRL
ESB	KSY
LHW	KWL
TXL	PSA
BNE	PQQ
ABV	ADD
CGQ	PVG
SHA	TNA
URC	BPL
MDL	DMK
CVG	TPA
RTM	MUC
ORK	VNO
DDC	LBL
CGN	FDH
MCI	MEM
LIM	CDG
DOH	ICN
DKR	CKY
KTW	SVG
PDP	AEP
ORD	JFK
LHR	VKO
PFO	LGW
ATL	SJU
BOI	SJC
CMN	LGW
LJU	BEG
BCN	HEL
VCP	POA
KWE	ZUH
IST	AER
CRL	PSR
SVG	AGP
GLA	BHX
BOG	SCL
ICN	KLO
MYQ	BLR
IND	HOU
DME	CMB
DWC	DOH
CKG	ZUH
BOH	DUB
BRU	AMS
DEN	SDF
SZX	ZHA
CIA	VLC
OVB	HTA
CJM	DMK
LGW	PRG
ORD	EAU
ITM	KMJ
POA	BSB
AMM	VIE
STR	FMO
ARU	GRU
PIE	TOL
PHL	CUN
MAD	WAW
CAI	SAH
VCE	HAM
KLU	TXL
CPH	MAN
NTE	LIS
WUX	TAO
SGN	HAN
BHK	DME
CVM	MEX
CUN	PHL
AAR	STN
CAN	YIW
DCM	AJA
DOH	COK
CDG	HKG
KWE	TYN
SIN	FRA
ZAH	KER
ADL	MGB
YQR	ORD
POM	CNS
SFB	ATW
HAK	KMG
LHW	CKG
ZRH	TUN
TGU	PEU
AMM	DME
KEF	HEL
HGU	WWK
TSA	HUN
ATL	TPA
YEG	IAH
MAD	SDR
JED	AHB
TNR	MOQ
HNL	NGO
BWI	ORF
JFK	BQN
IFN	DXB
USM	BKK
SVX	GYD
KJA	SVO
DEN	SLC
BSL	OLB
NKG	BAV
NCE	TRD
ZAG	BUD
DPS	MEL
IAH	CRW
FOR	BSB
WAW	ZRH
NAY	LYI
SCL	ZCO
KMG	BFJ
DXB	KRT
PRG	MRS
GRU	BSB
LIL	NTE
WUH	CAN
CGH	IOS
KGS	DME
CLT	DUB
MAN	DUB
HRE	DUR
BHY	PEK
CDG	BOS
PHL	ZRH
MZT	MEX
OPO	ORY
TXL	SOF
TXL	BCN
MIM	SYD
VCE	BIO
CLE	YYZ
BRU	AYT
LCY	ABZ
HNL	DEN
WUH	SHA
ASR	SAW
HSV	DTW
LGA	MIA
CCU	VNS
PHE	MEL
BZO	FCO
KBL	DWC
JED	GBT
TSR	MAD
YWH	CXH
CGN	ZRH
SLC	FAR
LIT	ORD
LBE	MCO
LEI	BCN
BCN	SVO
UTH	HKT
OSL	BGO
GSP	DTW
BFJ	CAN
MIA	CZM
TSN	ZUH
EWR	ALB
CIA	OTP
PVR	YUL
WMI	BVA
IAH	IND
MNL	MEL
SAW	OMS
ZRH	FRA
LAX	RAR
FAO	BHX
BKK	KTM
ADB	AYT
LDU	BKI
ABZ	NWI
CDG	TLS
TXL	ARN
ALC	KSD
TNA	CGQ
MDW	SAT
HBE	AMM
MAG	VAI
BOS	CVG
TNA	DLC
LYS	MPL
LIM	LPB
PTY	BGA
LOP	SIN
BWI	MKE
SHA	WUS
YYC	MCO
LDE	STN
IST	ARN
SAL	PTY
MSY	EWR
GVA	BOD
YYC	SLC
YUL	BRU
RUH	KRT
YQR	MSP
CDG	YUL
KHV	ICN
IQT	PTY
KRK	MAD
MIG	SZX
AUH	HKT
YYZ	SVO
AMM	JFK
PIE	AVL
CGN	SAW
CNS	SYD
MYY	JHB
IST	BAL
HEL	WAW
NAS	DCA
CLT	JAN
CGN	NAP
LDB	CWB
TJM	SVO
MNL	ILO
OTP	TRF
DEL	SIN
PIT	MCO
YVR	TPE
YXE	YWG
AUS	LAX
ANM	TNR
EWR	FLL
VXO	OSL
SLC	CLT
LAS	RFD
BFL	IAH
PVG	TAK
SIN	NNG
CKG	PEK
ADD	ABV
ONT	SMF
BTS	CRL
YNT	DLC
HNL	LAX
GUW	IST
VNO	EIN
CAN	YVR
DBV	NCL
MEL	CNS
FCO	AMS
YUL	CUN
FAO	ARN
PVR	DEN
SVO	ASF
GVA	EWR
PLQ	OSL
OSL	VXO
UDI	BSB
SVO	ARN
SWA	KWL
IOS	GRU
HDN	DEN
GVA	AJA
SIN	BPN
BZR	NYO
SVG	KRS
AGB	MRS
CTA	STR
OAK	AZA
RAK	CPH
AUS	LHR
AMS	AMM
EWR	AUA
FUK	TPE
TNR	WMN
GRR	CLE
DPS	SRG
VIE	DOH
NNG	VTE
CWB	CNF
SHJ	JED
HEL	TXL
SZX	LZH
VKO	NER
HKG	WUH
SLZ	FOR
LHW	YZY
JFK	LRM
HET	WUH
CJB	CCJ
IND	ORD
DME	NCU
AMS	ORK
SGC	DYU
YQT	YWG
HRB	YTY
BKK	DME
NKG	PVG
YVR	YYJ
NCE	BGO
DIK	DEN
BHX	AYT
LAS	SCK
SIN	CNX
LEJ	KGS
KEF	OSL
SJU	STI
MPM	JNB
HDG	SHA
COO	ACC
DEN	ELP
BGW	TBS
HKT	PER
VRA	FRA
ATZ	JED
JED	RUH
SAH	NBO
GUA	MIA
SAT	BNA
TAS	SVX
HMA	DME
HKT	PVG
FAO	FMM
SEA	LIH
ADA	AYT
IST	CZL
VKO	KJA
FRA	STR
FRA	CLT
PHL	JAX
CRD	REL
HNL	TPE
PEK	ICN
IST	LOS
STN	AGP
CCU	DXB
SDJ	PVG
SSA	BPS
CMH	BOS
TAO	CAN
KUN	LTN
LAS	DCA
DCA	PHX
DTW	MTY
NOU	KIX
ATL	ICN
KUL	PDG
TOF	SGC
SZX	ZYI
KUL	HKG
BCN	ALC
YNT	KIX
ARN	LCA
BEL	MAB
OMO	BGY
PHL	DEN
BCN	GOA
NKG	KHN
IAD	LGB
MIA	BNA
IAH	YYZ
SJW	ZQZ
VIE	PRG
CGN	MAN
CMN	YUL
BJM	EBB
RIX	BRE
MKE	CVG
KRR	MUC
CDG	TBS
MCT	DWC
IBZ	AGP
AMS	TRF
GYN	CNF
MCI	ABQ
LYS	FRA
EXT	AMS
DWC	GOJ
VAN	SAW
CGO	JJN
NCL	PFO
SHA	YNZ
JNB	IST
TPE	LHW
CAG	KUN
CPH	AGP
LPB	VVI
DLC	HET
ATH	CHQ
FRA	RZE
TPE	HKD
MUC	FNC
BLQ	EDI
SLC	IAH
KZN	DWC
ATH	STR
JED	LHE
HKG	DLC
PEK	CIF
BIL	DEN
FTE	AEP
MEL	CBR
IST	KTM
YNT	SHE
PEK	VIE
JIB	JED
NAQ	JUV
BGY	WRO
OPO	BHX
CGK	BKK
LJU	CRL
DLA	LFW
ISP	PGD
EGO	KZN
FWA	AZA
NGO	TPE
ORY	CFR
ORD	CRW
GEA	KNQ
DOH	ADD
SVO	LCA
ORD	MBS
BEL	MAO
ORY	FLR
BRU	BJM
SNA	OAK
LAX	MCI
DKR	BJL
BSL	NTE
ORD	PWM
STN	ORK
HTY	ADB
MNL	CBO
SLW	IAH
MLE	VKO
PEK	JMU
VIE	DUB
SYY	EDI
DTW	BTV
BRI	BUD
ORD	CHS
ZAG	SJJ
YBP	SZX
DCA	MCI
BIA	BOD
SVQ	BCN
HEL	CDG
OAK	PVU
AUS	TPA
DPS	BMU
SYD	DEL
CMH	JFK
SJU	EWR
DEL	IXU
URC	HET
LBA	BCN
FOR	EZE
ATL	BTV
BAV	SHE
CMN	BLQ
CTA	MRS
AUS	DCA
ROV	DYU
TRF	WRO
RUH	HYD
URC	TAS
SIN	CJB
EWR	SAN
BUD	SVO
KWE	HKG
ZYI	SYX
NMA	TAS
NCL	CDG
ATH	MUC
TPE	XIY
DLC	WUH
SGN	SIN
HAM	SAW
CKG	HGH
CPH	MOL
NJC	TJM
BRL	ORD
PDX	BOS
GYD	PEK
CHQ	KTW
KUL	PVG
FLR	FRA
KUL	CNX
DXB	MAN
BEY	GVA
DSM	DTW
MIR	TUN
WRO	CDG
TYS	MSP
CMN	FCO
FOC	CGO
LGA	BUF
HEL	RIX
MCO	SAN
AZA	FSD
AGP	ARN
IAD	PIT
BKK	OSL
SAW	EIN
CGQ	CKG
LAS	SAN
REN	SVO
YCU	HGH
HYD	IXM
MIA	YUL
CGN	ATH
EZE	POA
AGP	TSF
FUK	BKK
WUH	WNZ
ORY	TLN
CPH	AAL
JNB	PLZ
BHR	KTM
BOS	PBI
HFE	DLC
BKK	MAD
WAW	OSL
HAJ	BCN
TAM	MTY
DXB	DAC
CCF	STN
CGN	AYT
SXF	NAP
KOW	KMG
SPU	LYS
SEA	STL
ALC	VST
MSP	MEM
CAN	HKG
ARN	UME
ESB	IST
KTM	ICN
AMS	PEK
YYC	YXU
ALC	MOL
JFK	MAN
SJW	NKG
TPE	FUK
EWR	STL
MXL	GDL
CBB	TJA
BPS	CGH
POP	CDG
RAK	TUF
CUC	PTY
SFO	MOD
ZAG	SVO
CTU	NNG
LIM	ANS
ATL	CMH
FMN	DEN
BEG	CDG
SDJ	KMQ
IST	MAN
BOD	BSL
SJU	POP
PIA	PIE
FRA	MPL
VNO	BGY
TSF	BRI
STL	DAL
AEP	RGA
BEY	CDG
YTZ	YOW
PNA	MAD
OSL	DUB
DXB	NBO
UET	LHE
BWI	PVD
RIX	TRF
CAI	AMM
HEL	NCE
GYN	CGH
VLC	VIE
CCS	VLV
LMM	TIJ
PKE	SYD
VNO	LPL
BLJ	MRS
CAG	FLR
SPU	PRG
VKT	SCW
VFA	JNB
MQL	SYD
NTE	BIA
HKG	TAO
MUC	BRI
KHN	SYX
DLC	YNZ
MAN	LHR
ABQ	PDX
MEX	PHX
BIO	IST
CGK	ICN
CLT	FLL
HFE	NNG
PVG	KUL
KUA	SIN
PMV	MAR
JED	LKO
BAV	TSN
YYC	IAH
BXU	MNL
SVO	DOK
ABQ	CNM
DEN	GRR
JUH	CTU
AUH	DAC
AJA	DCM
CDG	HAJ
EDI	MAD
NCL	DUB
EDI	CIA
PEK	DTW
ANC	PDX
CMN	VLC
LAS	ATL
LTN	FCO
DEN	CID
ICN	HKG
BWI	CLE
ALC	TRD
LIR	EWR
FOR	GRU
CTU	AKU
EWR	MEX
SYD	GLT
IAH	OKC
CTS	HKG
EBB	KSE
CRL	MPL
VIE	LIS
IST	VIE
JMU	HRB
STN	FAO
OPO	FCO
SZG	VIE
POZ	BCN
BKK	SVO
BVA	BRI
HAV	YYZ
RIX	NCE
ATZ	SHJ
DEN	MEX
BGY	CHQ
STN	OSR
KWE	HFE
MIA	PHL
VVO	FNJ
YEG	MSP
IAD	BTV
VCE	ORY
SVQ	NTE
BUD	CTA
GAJ	ITM
IKA	BKK
TZX	SAW
SPU	ARN
DME	GOA
SOF	LHR
MCT	DAC
KGL	IST
BEY	HBE
YWG	YYC
OSM	IST
ATL	EVV
FMO	STR
DEN	BUR
HAH	NBO
FRA	CDG
HAM	MAN
CLT	PWM
ALB	TPA
JFK	SVO
SCL	MVD
KWE	CKG
MAN	WAT
ATL	XNA
RAK	SXB
SHA	NAY
SFO	PHX
LMM	HMO
ETZ	LYS
AGP	PRG
MEX	LMM
LAX	JFK
FIH	IST
CDG	CKY
LIS	BSB
HKG	RUH
MIA	NAS
DEN	FLL
REL	EQS
CDG	PEK
MKE	EWR
WUH	CIH
FCO	CLT
HIJ	PVG
CDG	BOM
CLT	ILM
SXF	SNN
IST	VLC
ORD	YUL
ACY	FLL
FCO	HAV
NTE	MPL
OTP	BUD
HAJ	SPU
KHI	MCT
NAY	CAN
LGW	AGA
FRA	CCS
LAS	YWG
SIN	FCO
ORD	YXE
STR	VCE
HAJ	FCO
KMG	JNG
TSN	XMN
TWU	BKI
PEW	DXB
BCN	RIX
LXA	LHW
IAD	GRU
DYU	NBC
TSN	SYX
JFK	VIE
SVO	KLV
KOI	EDI
YNZ	SHE
CGO	SYX
ACE	BRE
GRR	PIE
STS	LAX
SFO	ZRH
KHH	PUS
SLC	BOS
CKY	OXB
HAM	CTA
GRU	IAH
DIL	DRW
KMG	UYN
LCY	IBZ
YVR	LGW
PIE	TYS
NAY	SHA
HKG	SFO
CGD	CAN
KJA	EVN
POL	APL
MYR	FLL
KRK	GDN
LOS	AUH
TSA	XMN
ESM	GYE
GRU	CAC
TAO	SZX
DUB	ATH
AUH	ICN
HRB	CGO
NYO	STN
ICN	MDG
SXF	BEY
CGN	KVA
DME	BTK
EZE	AMS
OLB	HAM
KWL	SWA
GYE	EZE
MUC	VNO
ATL	PIA
PIE	FSD
MIA	SJO
YEG	LAX
CNX	HGH
AGP	BGY
RIX	TXL
AMS	TUN
PRG	ORY
IBZ	NCL
SGN	FUK
AJA	LIL
BSB	IMP
DTW	BNA
KUL	FNJ
CTU	XIY
SHE	MFM
TZX	ESB
TTN	TPA
HMO	CUL
DXB	KUL
SFO	CEC
TBS	DXB
LCA	ARN
TNR	HAH
MSP	RIC
WAW	NYO
BCN	FCO
VCP	CAC
ICN	CMB
ZAG	SPU
MSP	GRR
LHE	PEW
SGN	RMQ
LHR	PRG
AYT	BHX
TSV	MOV
EIN	RIX
STN	NCE
MSP	PIA
CMN	BEN
LBE	MYR
BHQ	SYD
ORY	AUR
LUZ	TRF
SJJ	TXL
STN	NYO
KIV	FCO
FRA	GRZ
HEK	HRB
KWL	HAK
HIJ	CTS
CVG	FLL
MCO	SJU
CHA	PIE
ORH	FLL
TUN	FCO
YTZ	EWR
LIS	MAD
SFO	DEN
LGA	SAV
DXB	EBL
SZX	HFE
LCK	SFB
TUL	ATL
TRF	AMS
MCO	EWR
BKO	DKR
DMK	SNO
FLL	MBJ
SVG	LGW
NTE	VLC
HAM	FNC
SKP	CGN
VKO	VNO
LIL	BIA
BOS	ISP
SJC	OGG
IDR	BOM
AKL	PMR
WNZ	KWE
BOS	HOU
KRT	UYL
SYX	HGH
RGL	CRD
SYD	GFF
TSV	DRW
NCE	HEL
HAK	HKG
GDL	MXL
DXB	IFN
CPO	SCL
SOU	AMS
BRU	EWR
TSR	BVA
GVA	BRS
SIN	CCU
LEJ	BRE
SIN	AKL
CMN	MAD
IST	BKK
SLC	MSN
BGY	OTP
NNG	SHA
OTP	EIN
ROT	WLG
TSH	KGA
MPL	BSL
PHL	ISP
AEP	CTC
SHE	CAN
AKU	URC
IAD	ROC
AMM	BCN
KUL	SBW
JED	BEY
TPE	CAN
IST	ISE
MYR	FWA
SZX	LYI
EZE	LIM
TYS	LGA
DUB	MUC
CNJ	TSV
HFE	SHE
PEI	BOG
SAW	TXL
STN	DBV
STN	SZG
BOS	YYZ
KWE	HGH
LIS	CNF
CAK	DTW
TAS	IKA
MAJ	TRW
LYS	BIA
FRA	OVB
RIX	BCN
CDG	AGA
TJA	VVI
JNB	APL
AUS	MSP
JAN	ATL
REC	CNF
ICN	KHN
LAP	MEX
ALF	KKN
IKT	KCK
PEK	NBS
OMA	ATL
LFW	ABJ
BZV	DLA
BCN	IST
FCO	HEL
NKM	KCZ
AZA	SBN
FCO	GDN
PFO	KUN
BRU	SOF
CDG	BSB
KHN	XMN
ATL	LHR
AZA	RFD
BOG	BCN
MYD	NBO
YIW	KMG
IKT	HRB
DTW	GRR
HGH	CGO
SVG	FRO
SFO	SEA
LZO	NNG
PTY	ORD
JUB	NBO
AXT	CTS
LHR	VCE
CRL	BGY
CGK	HKG
PDL	AMS
LFW	DLA
MAO	TBT
JFK	MIA
SXB	ORY
FMM	STN
LGW	PFO
ORD	MAN
FLL	CUN
YTY	SZX
YKS	ULK
SLW	MEX
LUN	NBO
KRK	LGW
PHS	CNX
MSY	MSP
LPL	WAW
AQP	TCQ
LAS	CVG
JFK	OAK
BOM	KTM
JNB	LUN
MDC	BPN
STN	PSA
AER	DYU
BUR	SMF
SXB	MAD
HKT	PEK
MCT	MUC
NTE	OLB
PSA	FEZ
KRK	BHX
MHD	SYZ
NOU	AKL
KRR	VIE
PSP	BLI
XIY	BHY
LNZ	AYT
ASU	PTY
BQN	FLL
KMJ	ITM
BOS	MCI
NLA	NBO
BVA	ZAZ
OSL	JFK
BPN	SUB
HKG	HEL
PHL	LIS
CTS	KIX
KUF	EGO
VCE	DUB
SIN	MUC
TPA	LAX
SJO	GUA
SDR	BCN
PBI	LAX
CNF	BEL
YYJ	YLW
SJW	YNT
LPL	KRK
TTN	RSW
ATL	ILM
TRF	VNO
FCO	RIX
GVA	DUB
FWA	PIE
VCP	IZA
TCG	URC
MIG	CGO
OKC	PHX
SBZ	VIE
LBA	FCO
KUF	TAS
ROC	MCO
MUC	ATH
SHE	HGH
PVG	SZX
FIH	JNB
BHX	ISB
IST	AAE
CGN	BRI
DME	GYD
MNL	MYY
HKG	PVG
IXA	IMF
SNA	EWR
GLA	AYT
AGP	TLS
AUH	CCJ
OAK	ONT
DXB	LAD
AMA	LAS
STN	SNN
AGP	TRF
SSJ	BNN
GYD	TAS
ATL	MDW
CHC	BNE
CGK	PKY
SIN	SGN
PER	CAN
LIR	ATL
MCO	ISP
BNA	ECP
WNR	BVI
DXB	PER
DME	PWQ
CJA	LIM
JFK	LOS
FRA	WAW
CWB	AEP
AMS	CPH
MUC	CGN
NBO	ICN
KMG	YIC
LAS	MEM
ADD	BKO
RNO	SJC
BLQ	MAN
VNO	BRU
IAD	SAL
FRA	ABZ
EDI	ACE
ABV	LFW
MKE	PHX
EWR	DTW
MUC	TIA
TPQ	TIJ
KRR	IST
HGH	XIY
PSA	LBA
MRS	ZAD
BDL	LAS
CPH	PSA
CTU	HFE
BFJ	NAY
UBA	CNF
SEA	EAT
LIL	RAK
CVG	LGA
LAX	SEA
BTV	DCA
IAS	BLQ
MHD	KDH
TNA	WNZ
DEN	EGE
MCI	TPA
LHR	HAM
MHC	PMC
TGU	PTY
SEA	HNL
PTY	IAH
CGK	SUB
LEJ	DME
AEP	LUQ
LAS	DTW
YZF	YEG
DOU	GRU
SGC	OSS
BRE	TLS
SAF	LAX
BVA	LIS
AYT	FDH
BUD	BSL
NCE	CZL
VLC	AMS
SEA	GTF
SKP	ZRH
YUL	MCO
GVA	OTP
MNL	PPS
WEF	DLC
SIN	KTM
DUB	ZRH
PVG	TPE
HKG	KHH
ZUH	SYX
BAQ	BOG
VIS	LAX
KWL	BKK
MUC	HKG
PER	JNB
URT	KUL
VIE	INN
TNA	URC
CAN	ZHA
ICN	SFO
RSW	ORD
YXT	YYD
KMG	TNA
BEG	SAW
LGW	GLA
BFN	JNB
KBV	BKK
HAM	RJK
LYS	AGP
ATH	PFO
CIA	OPO
LGW	HME
SEA	YLW
PEK	LHR
NAY	WNZ
BOG	CLO
LRE	WIN
BAX	DME
FOC	KMG
HAK	PEK
ADL	BHQ
DEN	LIR
KWL	FOC
LAX	ZRH
KHH	TSN
ACK	EWB
LUK	CLT
MKE	CUN
RTM	NCE
CMH	ATL
PVR	MEX
BZN	MSP
FCO	BKK
SAL	CUN
BKK	FRA
JFK	SEA
PHL	SWF
AMA	DAL
XNN	CGO
PSP	YEG
MDT	DTW
DSM	MSP
BTS	CIA
DME	VAR
DEN	BFF
BFS	MAN
MJT	JKH
ARN	CMN
STL	CGI
PVD	MCO
CLE	JHW
MCO	GNV
RTM	BCN
TYN	HFE
LNZ	SZG
AAE	MRS
ORY	CAY
CAW	VIX
NAS	PTY
CIF	PEK
TKU	ARN
CDG	MAD
CHQ	CPH
CIH	PEK
LGW	AJA
LAX	JED
BKK	UBP
CWB	RAO
GVA	IST
LCY	RTM
CAE	CLT
GAE	TUN
URC	IST
PVR	SLC
SNN	FAO
TUN	LHR
LTN	FNI
HKG	PEK
BJZ	BCN
LGA	CMH
CAI	BKK
LIM	CLO
KEF	CPH
NCE	ORY
LYS	ADB
DEN	ILG
MST	OPO
SLL	JED
MQM	IST
KRK	MUC
MEM	BWI
JSR	DAC
RUH	CAN
DTW	OMA
BJL	BCN
IST	ZAG
MNL	RXS
FNA	CDG
CLT	SAV
ATQ	DEL
SOF	BLQ
KUL	HDY
SAH	DOH
AMS	ASR
AES	RIX
BLQ	TIA
HLN	GTF
CVG	MCI
ISB	MUX
JED	IFN
HKT	KMG
ADB	VAS
ORY	LIS
OMA	SAN
MTY	OAX
BGY	VNO
CZX	CTU
FIH	BRU
SDF	IAD
MFM	PVG
DUB	BIO
BET	MLL
SEA	BLI
BCN	ARN
SAN	DTW
KTN	SIT
RAK	BGY
EWR	RSW
DTW	MSN
CAN	HFE
BWI	DEN
CLT	DTW
TBS	GYD
EIN	MJV
KGD	EGO
LPL	ALC
GOJ	VKO
BIK	DJJ
MKE	MCI
DOH	LHE
LAS	MLI
ORY	FCO
ACC	IST
MUC	RLG
BUN	BOG
ARK	ZNZ
OTP	TSR
SZG	IST
HEL	HAM
CZE	CCS
YTZ	MYR
OSL	HAU
AUH	MEL
CGN	BIA
TUL	PHX
KWE	MIG
ARH	USK
SAT	IAD
BUD	ROV
KWE	SHA
FRA	MAN
SFO	DXB
LKO	JED
BOG	PPN
PVG	BAV
ABV	LOS
WEF	HGH
HEL	BRU
GRU	IST
BDO	JOG
YYJ	LAS
SFO	SAT
ITM	AOJ
BRQ	STN
LGA	XNA
MCT	ADD
CMN	OUA
LGA	LIT
PTY	VVI
PIT	DTW
KJA	AER
LEI	LGW
YXL	YQT
XIY	SYX
BLI	SEA
BIO	LIS
KWL	SHA
GVA	OSL
ELP	SAT
KMG	BHY
XIY	CAN
PEK	BKK
SHJ	MHD
MSP	YYC
BNA	CLE
PIT	CUN
PER	KUL
YNG	PIE
AUH	BEG
SKO	ABV
SDF	CLT
RIX	FRA
TPA	PHX
CTA	LTN
NCE	RAK
IST	DOK
LAS	SDF
LGW	MPL
VIE	ESB
BIA	FRA
CPH	BGO
EWR	YVR
STN	BTS
IAH	DXB
IAD	PHX
IST	LJU
FNC	VIE
DME	EGO
BLQ	FRA
CAN	JUH
FUK	SHE
CGO	BKK
YTY	HRB
BOG	IBE
JFK	IND
DLA	COO
MAF	DEN
BQK	ATL
ILM	DCA
ACE	PIK
ADB	LGW
DME	PFO
GTF	AZA
CPH	VNO
BLQ	PMO
LAX	TPE
BRS	AGP
THN	BMA
SZX	CTU
FNA	CMN
MEX	CUN
BAV	NKG
CWB	CGH
BWI	LAX
SLC	SFO
BSL	IST
POM	MAG
SIN	MDC
SXB	TUN
EBL	VIE
DEN	MFR
DEL	KBL
MAN	LCA
LGW	KGS
CIP	LUN
VOG	SVO
ORD	AVP
ATL	TGU
SEA	FAI
AGP	DTM
PVG	LZO
UIP	ORY
PSP	YYC
EWR	SDQ
GOA	BCN
YNZ	PEK
JFK	STL
CEN	MEX
BOS	PIT
AYT	PAD
CPH	TRF
MBJ	IAH
PSC	PDX
VGO	CDG
YYZ	BWI
DXB	MUC
LAX	OGG
AYT	RTM
ITB	STM
HKD	NGO
FLL	LBE
MCO	CAK
AMS	BLQ
VCE	EDI
BEN	CAI
LAX	VKO
STN	PMO
RUH	ICN
HTY	ESB
CPH	SJJ
DUB	ATL
MIA	MEM
ATL	DXB
ARN	HAD
TXN	XMN
BIA	TLS
ROC	BWI
KRR	FRU
FNT	BWI
HEL	OSL
DKR	JFK
BIO	AGP
KGS	LBA
IBZ	LGW
DTW	MLI
ABX	SYD
TUS	LAX
SAH	JIB
ATL	PHX
SYD	DBO
ORY	OPO
DYU	VOG
RSW	ACY
CNF	MOC
FOC	HRB
CDG	PIT
BMA	UME
KRK	PSA
MUC	LJU
JED	SHJ
DEL	BKK
POM	KVG
BUF	ATL
SKZ	BHV
ATH	HBE
CPH	IAD
HLN	MSP
DME	OSW
UYU	LPB
CGO	HKG
AMS	WAW
IBZ	STR
HEL	POR
AAE	LYS
BCN	VGO
RUH	CDG
PHL	AVP
ORD	FOE
YUL	YHZ
TYN	NKG
MRS	SAW
NYO	KRK
DMK	CEI
NVA	BOG
JED	LGW
EZE	BSB
YYT	EWR
STN	PUY
BGY	NYO
LYS	SPU
OTP	PSA
PER	GET
CIA	IBZ
ORY	UIP
NAP	FMM
ORD	FCO
MYD	LAU
MFM	HAN
CLO	ESM
AZA	FWA
KRR	EVN
DXB	LGW
BOG	VUP
DMK	HDY
CLT	ORF
SLZ	GRU
PEK	KIX
CDG	LIM
DWC	UFA
FAO	EIN
ROC	ORD
EVN	OVB
PDX	DCA
BRN	HAM
EWR	MKE
STN	CCF
TPA	CVG
DEN	TYS
SBN	ATL
SHE	FUK
DQA	TAO
FRA	POZ
MYJ	PVG
YTY	SYX
MEL	HNL
HET	HLH
MYR	CLT
DEL	HKG
CGO	XMN
ORY	SXB
IAD	OKC
HAD	ARN
SAN	LAX
FOR	REC
NAY	BAV
ALC	BRE
ACE	MUC
HFE	XIY
ORD	SRQ
MCO	YUL
DOH	SIN
DOH	HYD
LBA	LCA
TLS	VCE
MIA	GUA
ICT	ATL
HGH	DLC
YQD	YTH
KRT	DWC
YYC	PHX
LGW	MLE
KUO	HEL
AEP	PRA
IBA	ABV
PGD	IAG
DCA	MEM
AUH	IAD
AMS	INV
SVX	OVB
LOS	QUO
RSW	CLE
IND	IAH
MCO	SDF
RIX	BUD
NGO	HAN
HKG	HGH
SYD	BHS
SFO	YYZ
IAH	CAE
MAD	GUA
SHE	TAO
AJA	OSL
SHE	MIG
SZX	CKG
SIN	MLE
IAH	MEX
PRG	HAM
LHR	NBO
NGS	NGO
TLS	AGP
WLG	PMR
EWR	HAM
CDG	IST
BSL	SVQ
GVA	SXF
ORY	HEL
MAD	BGY
HOU	LIT
BOG	UIO
MRS	MUC
DXB	AZI
SFO	DCA
LTN	AMS
TIP	DXB
ATL	SFO
OLB	GOA
CAN	JDZ
PHX	OAK
TSF	BCN
RKS	GCC
BCN	SVG
SAN	MIA
CHS	IAH
CGR	MGF
CMN	IST
MSP	CDG
MPL	CDG
PMV	BRM
GAU	CCU
PEK	YIW
KRR	SVX
PVG	ICN
SKG	CDG
SFO	ORD
BGY	IBZ
BTR	IAH
LDB	CGH
EIN	GRQ
TYN	KWL
XIY	CGD
KMG	CKG
GRU	MUC
STL	TPA
MSP	BOI
CDG	SOF
SEA	SAN
OPO	EIN
DLC	CGO
ESB	CGN
KEF	MAN
LBA	PRG
CMW	HAV
MUC	BOD
YYT	MCO
YUL	YTZ
LPL	BFS
BGW	AUH
VIE	LGW
BNE	KUL
MUC	RIX
LIN	WAW
LGA	TPA
SKG	HAM
BNX	ZRH
BME	KTA
MAD	LRM
WAW	KTW
CHQ	BOH
FAO	STR
SGN	CDG
SVQ	BIO
BDL	FLL
DYU	GOJ
SAL	JFK
BRU	CAI
UIO	GRU
MSP	YUL
DCA	GSO
SFO	RDD
AYT	DRS
EWR	LIS
RTM	VIE
CPH	OSL
CLT	CLE
GAE	TOE
ZYI	KMG
ABJ	OUA
LGW	LIN
BNE	ICN
BNE	DXB
TLM	ORY
SLC	HNL
IKA	ARN
KOE	DPS
SDQ	ATL
ALC	BIO
MKE	DCA
SFO	ABQ
LIS	BRU
DEN	YEG
EDI	BRU
MHD	GBT
HOU	BOS
SHA	KWE
GLA	GDN
LIS	POA
EWR	BHX
BRU	ORK
JJN	PVG
BRU	WAW
AAL	OSL
UIO	MIA
SDQ	PHL
CVG	EWR
NBC	GYD
PVG	ZRH
DME	PES
FCO	BUD
DUB	IAD
AUS	HOU
SAW	MSR
RNO	MDW
YVR	SLC
BOM	JED
SAN	SDF
LIT	DEN
SYD	CBR
KUF	DXB
EOH	PEI
URC	OSS
BRU	PMO
BGY	MAN
YTY	WUH
BIO	BRU
DUB	PHL
BKO	ABJ
SHP	PVG
SZX	TAO
NKG	NNG
LOS	CBQ
GRR	IAH
VAR	DME
CLE	SDF
MWX	PVG
FRA	MEX
HOU	MDW
OKC	SLC
ESB	STR
ARN	SKG
IXE	BLR
MAN	VCE
KIX	DOH
OPO	FMM
WUH	HRB
CDG	GVA
MIA	STL
MFM	MWX
DLA	MVR
CAI	AHB
YYZ	NAS
HIJ	DLC
AOI	MUC
LIM	TRU
BUX	IRP
DTW	MIA
SDF	PHL
DXB	KJA
CDG	ATL
SVO	HAM
EBB	CAI
BSL	BRU
YUL	YFC
CKY	DKR
DUB	GLA
CTC	AEP
MAD	MUC
TIJ	PVR
KLU	VIE
HRB	HET
STN	CPH
LAS	BNA
TAO	DQA
DVO	DPL
SYD	AKL
PIS	AJA
LCX	SHA
WAW	SVG
MYY	KCH
VLC	SDR
SYD	BHQ
CLT	SBY
FRA	DEN
SGN	SVO
HAM	CGN
FAO	BRS
LBB	AUS
BWI	STL
POM	VAI
GFN	TRO
DEL	STV
AUH	CDG
OSL	TOS
KHI	YYZ
NAP	OTP
CAN	JIU
GLA	YYC
DTM	GDN
IST	LYS
STR	LIS
SDJ	TPE
CMH	LAS
DXB	OTP
NCE	DME
KGL	NBO
BPS	GRU
ANC	ENA
FUK	HAN
PVD	CLT
SNA	GDL
HKN	POM
TUN	BEG
KBL	PEW
CRL	OPO
DAC	JED
MJV	BRS
SFO	YVR
PVG	DPS
BSB	SLZ
MID	BZE
MIR	NTE
ARN	ADD
HAM	CDG
CAI	ACC
PHL	DUB
CJL	ISB
GSP	PIE
PFO	CRL
GRR	CVG
IAH	CMH
ORY	TLS
ORD	TUS
ZRH	GRU
ORK	LGW
DTW	BHM
LHR	FRA
SAW	VIE
IAH	VPS
HEA	MHD
BGW	AYT
SOU	ALC
RUH	IST
EZE	COR
JIB	SAH
HKG	TSN
CMN	COO
BRE	AMS
CMB	KMG
GNV	MCO
CGO	SWA
AYT	ADB
INN	FRA
CDG	ADD
VCE	LIS
DOH	HKG
KRL	CKG
MBJ	DTW
MUB	BBK
LXA	PEK
FLR	ORY
CPV	PNZ
ORK	CDG
SEA	RNO
AMA	IAH
ATL	FNT
CKG	ZAT
IST	ERZ
LFW	ADD
OSL	ALC
YTS	YTZ
TXL	PEK
ZRH	NBO
SVO	EVN
CPH	ORY
LAX	SAT
DYU	SVX
KRT	ASM
WUH	YCU
FAO	FRA
HNL	MNL
OAK	LAX
SFB	CID
ARH	MMK
HAK	CGO
AZS	YUL
SJC	SNA
RIX	EIN
LUZ	FCO
LRE	BNE
HAM	PRG
SMF	BUR
YCD	YVR
ROB	BRU
VCE	RIX
ZAD	BVA
PTY	EZE
CDG	STR
ATL	ELP
CGQ	KHN
CVG	BOS
SRZ	LPB
XMN	WUS
MAD	ORY
ICN	KIX
NGO	FRA
MSP	ROC
ORF	MCO
YOW	DTW
IST	TIA
SNU	YUL
NCL	LHR
TXL	CTA
WUX	CAN
ICN	KMI
BRU	DBV
JAX	DTW
ORF	ATL
VKO	OVB
VTE	CAN
FSM	ATL
XNN	PVG
TPE	KOJ
JOG	BDO
TRD	NCE
DWC	KIV
BKK	KMG
HAJ	BHX
ROC	LGA
MRS	PUF
TUN	NAP
DEN	ORF
YVR	YDQ
ALC	WRO
KJA	KHV
HAJ	ZRH
DGO	LAX
KCH	BKI
NCE	NTE
DAL	MCI
CFR	ORY
KGS	KUN
ESB	KCM
SEA	OMA
PEK	NGO
BHX	CGN
COO	BSG
DEN	LAX
LYS	ETZ
VLC	OPO
NBC	DYU
CGK	PDG
SFB	LAN
ASU	LIM
STL	ORD
DTW	FWA
HEL	RVN
PHX	CMH
SHE	YNZ
GRU	PLU
KNX	PER
LIN	FCO
HYD	DOH
BTU	MYY
TOS	OSL
LJU	ZRH
MCO	SYR
XMN	KUL
FUG	TSN
JFK	SAT
IST	HBE
CGQ	SJW
GYE	BOG
BWT	MEL
HAN	DME
RUH	MUC
NGO	OIT
IAD	CAE
FUK	KIJ
LPL	OPO
LHR	ATH
SXF	OSL
CKG	TYN
TSF	BRS
NCE	SOU
ADE	MGQ
RIC	CVG
LGW	HAM
IAH	HSV
JHW	CLE
CKG	HEL
BKK	KIX
PSA	BVA
AMS	DEL
CUN	SLC
ORD	BOI
DEN	DSM
LUK	MDW
WAW	TXL
WAW	BEG
CHQ	WMI
MDW	CHS
PMW	BSB
IOS	BSB
CGK	KIX
MCT	SHJ
HAK	CKG
MUC	ORK
EIN	SKP
EZE	ATL
ASP	CNS
PHX	BOS
VCP	RVD
INV	LTN
PMO	MUC
IAD	ORD
ARN	MAD
PTY	MIA
VIE	TXL
ZAZ	OTP
BSL	CAG
MFM	CTU
FCO	IKA
YUL	YVR
DUB	BZG
BEN	CMN
LAX	EWR
AJI	IST
CAN	CIH
IBZ	GLA
SHA	XMN
SYD	ABX
ORD	ABE
RHI	IMT
SIN	AUH
FRS	BZE
CCF	EIN
POZ	CPH
DVO	BCD
BOM	KUL
MQL	MEL
FRA	ZAD
LGB	PHX
SJC	BOS
YKA	YVR
DSM	LGA
CEE	MMK
PSA	LTN
GLA	YYZ
GOA	CRL
NAY	HRB
KTN	SEA
TYN	HAK
BSB	NAT
SVQ	STN
ZAZ	CRL
ATL	DEN
TNR	TLE
AYT	ESB
JNG	CAN
OSL	FRA
BOG	MAD
BUD	SXF
IAH	AMS
DOH	FCO
MLE	LGW
HAJ	KGS
TXL	OSL
FCO	BRS
KGL	JUB
AMS	LIN
IST	DEL
TAS	VKO
MVP	BOG
DUB	PGF
LDE	BGY
AGP	EXT
CAI	JUB
GRK	IAH
SFO	IND
ALC	KTW
CCU	IXZ
IST	LAX
VLC	ZRH
ABZ	KSU
HKG	BLR
KTW	BGY
MCO	GRR
GEG	LAX
YIW	JJN
CNX	HDY
ISB	LBA
CDG	TXL
HOU	ECP
STN	SZZ
XNA	CVG
MIA	BAQ
TUP	GLH
STN	LIS
GNV	CLT
BNE	RMA
WNP	MNL
MDC	SOQ
KIX	CNS
ORY	DKR
MAN	BLQ
SAP	GUA
SVX	DXB
CLT	SFO
BLR	AUH
SJW	BAV
LCY	BSL
LHR	RTM
BFS	NCE
IST	NBO
MIA	JAX
JAI	SHJ
ERC	IST
IST	GRU
LAS	TPA
IST	SAH
STN	EDI
CKG	LXA
CCJ	IXE
AMS	MSP
LAX	GUA
VKO	TAS
PDX	OTH
ACC	JFK
PVR	MTY
DUB	MJV
NAP	IST
DXB	ARN
LZO	XIY
SDJ	ITM
FRA	VIE
BOS	FRA
AMS	IST
LIS	DXB
FCO	IST
IBZ	SEN
DXB	GYD
BCN	GVA
CGK	BTJ
ATL	MDT
LCA	DXB
RIX	SAW
GMP	PUS
LPL	BTS
ACZ	MHD
GEG	MSP
IXJ	SXR
SHJ	EVN
KTM	BKK
LHE	KHI
TPA	SAT
YXE	YVR
OLB	CDG
DEL	SHJ
INN	LGW
KAJ	HEL
CCF	BOH
SSA	FRA
IXU	BOM
AMS	BEG
IBZ	DUB
MSO	DEN
ARN	TRF
POA	XAP
CAN	NAO
YYZ	CLT
DME	KJA
FCO	CTA
ORY	OSL
ABV	YOL
TUN	DXB
KWE	WUZ
SUB	BPN
VIE	CAI
RIX	MUC
MJT	MUC
KZN	TAS
ICN	CGK
LAS	PDX
EBB	MGQ
YYZ	CPH
ROK	BNE
ICN	CTU
JFK	LCY
JLR	BOM
ZRH	FNC
ACY	IAH
WNZ	KHN
GAU	PBH
LYS	BHX
KUL	DAC
CMN	MRS
POA	LDB
KOE	SUB
MRS	PMO
NAP	BUD
CMB	PEK
BRU	BCN
BGO	NCE
LIM	SCL
PIE	SBN
JNB	LAD
ADL	DRW
VCP	REC
BOM	HKG
LAX	OKC
KHH	BKK
HAH	TNR
DXB	SKP
HSG	PVG
SVO	FRU
MAF	LAS
NBO	NSI
FCO	MAD
PHL	AUA
PHX	PIT
KYA	SAW
LIL	NCE
LCY	LIN
CLT	GRU
KTW	STN
CLT	PHF
SCL	SYD
FUK	DLC
MAN	GLA
ATH	FRA
SFO	MFR
CAG	CRL
HDM	MHD
FRA	HEL
AGA	BRU
FOC	KWL
TLM	LYS
COO	OUA
MNL	BXU
CLE	DAY
BEY	EBL
JNB	GRU
BKK	BNE
BZV	JNB
VNO	DUB
FLR	CTA
SHJ	CMB
ATL	PVR
CDG	BKK
AUH	SGN
TAO	CKG
FOC	XIY
FLL	STL
BWI	ORD
NYO	BGY
LGW	INN
LIG	STN
LOS	ABV
WNZ	NNG
MRS	VCE
SZX	CZX
FRA	DEL
VIE	GVA
RIX	TBS
AUS	ORD
AMS	AGP
JNB	MUC
JMU	DLC
CGK	JHB
BEL	BSB
PMF	STN
CMN	DLA
BHX	SPU
VLC	DUB
CGO	MIG
CLT	SLC
BPN	SIN
ORY	CPH
BVA	BEG
MJV	LBA
YVR	YPW
YQG	YYC
CPH	BRE
STN	SKG
SVO	AER
LGW	TRD
SVX	NYM
MUC	EWR
DBV	VIE
MDW	PVD
IST	ESB
MKY	BNE
OSL	BEG
MIG	PEK
BRI	FCO
FNC	HAJ
STN	OSI
BNA	DCA
YUL	ATH
MNL	LAO
SYX	WNZ
DRW	SYD
ACC	BEY
UYN	KMG
COO	BZV
BZN	LAS
ADE	JED
SAL	FLL
SVQ	LGW
XIY	JNG
FCO	AOI
LHR	PSA
NTE	TLS
LIT	IAH
LGW	SVG
BEG	ARN
ICN	CNX
DAC	JSR
IBZ	GVA
KIX	NGS
BNS	CCS
OTP	SKG
ZAL	CCP
ISB	MAN
WRO	SNN
MCI	ORD
KOP	DMK
HGH	YNT
HGH	LHW
LPL	DUB
SFO	MIA
IAD	MSP
YYU	YTS
BWI	SLC
PSP	LAS
MFM	DMK
BHM	IAH
MAD	LPL
BIO	ALC
BIL	SDY
LIL	VCE
SYD	LST
ITM	KIJ
PTY	STI
BRU	SVO
SAT	STL
LAS	MEX
EIN	AYT
TXL	ZAD
LAR	DEN
LYS	BCN
SVX	NMA
ANF	IQQ
BRM	PMV
MCI	MDW
DAC	RUH
LJU	FRA
LAX	LTO
MOL	KSU
GVA	TUN
EIN	STN
SOU	LBA
GOJ	SVX
MCT	BEY
LBA	FAO
DAC	SPD
SLC	VEL
JED	DEL
XNN	ZHY
ATH	EVN
HRB	WNZ
IAH	RTB
YHZ	LHR
PTY	SAL
CDG	BES
MIA	ORF
BNA	IAD
CIA	FMM
SHE	WEF
SFB	BGR
SBN	SFB
WRO	ALC
PUS	PEK
PHL	MCI
PDX	LAX
LGW	ZAG
LZO	HAK
AKL	ROT
ATH	EIN
BCN	FLR
AVL	PGD
ABJ	ROB
LAX	LIR
JOG	DPS
MAB	BEL
ATH	OTP
HAJ	FNC
DME	DOK
SHA	YNT
HRB	YKS
BRU	CPH
DUR	ELS
GVA	LCY
KDH	KBL
LAX	ORD
TAO	DDG
ADD	HRE
BIL	SLC
TSA	TSN
BEL	FOR
BIO	VCE
PMO	SVO
CLO	GYE
DME	NBC
CNX	USM
KRR	VKO
MAD	GVA
EDI	SEN
STN	TSF
HAM	MUC
HGH	KOW
BKK	HDY
LCY	EDI
HPN	FLL
ISE	IST
SZX	MIG
POA	CNF
LIS	FNC
GEG	SLC
MYY	SIN
CGN	CTA
TAS	GYD
STR	LEJ
PIT	MSP
ERC	SAW
TKU	MHQ
DEL	JAI
RSW	EWR
SAW	GZP
ISP	FLL
PIA	AZA
TXN	PUS
MSP	IAD
JFK	CUN
JYV	HEL
TPE	HIJ
BNE	HBA
TNA	WUS
SFO	CDG
ANC	JNU
GLA	ORK
LHR	EDI
ZRH	YUL
BGO	GDN
ORD	SAV
STR	CDG
SDF	JFK
YYU	YQT
OVB	EVN
PER	LOP
FLL	ORH
SKG	SXF
PVD	RSW
LXR	JED
PHL	RIC
ALC	MST
BHX	ACE
KHI	LHE
DIK	MSP
FOC	WUX
ABZ	LTN
ZYI	SZX
GPI	CLO
OTP	BLQ
FRA	FMO
TLS	FRA
TGK	DME
OMS	SAW
LAS	YYJ
JAI	DEL
DUB	BSL
HKT	VKO
PSC	MSP
AUH	KTM
CAN	DOH
KWL	CAN
HKG	ORD
VCE	CDG
YOL	ABV
IBZ	BLQ
MIA	APF
CTU	MFM
TXL	PMO
VNO	WAW
MUC	YYZ
LTN	GDN
KRK	PFO
WUH	ICN
OPO	BRU
LHR	GRU
DME	VNO
LAN	SFB
BCN	BOD
BOM	IXE
FCO	KIX
BKK	ZVK
PEK	XIY
MSP	LNK
CTA	BRU
YYZ	IND
ADD	DLA
TOY	TPE
CPH	FLR
LYI	WUH
WRO	ZRH
CGN	NCE
MSN	DTW
PHF	CLT
RIX	DME
TAS	CEK
RUH	AMM
ICN	KMQ
FLL	EWR
SVO	VCE
DMK	DPS
CTA	DUB
KSO	ATH
HMO	LAX
SAW	EZS
TCO	CLO
FOR	CNF
URC	IKA
BUD	AGP
DPS	MLG
VLC	NTE
MSO	SEA
IST	ISB
DLH	AZA
MGB	MEL
LAS	MCI
KZN	SVO
MSY	JFK
CGK	DJJ
SNA	PDX
KWE	NKG
MNL	HKT
YHZ	YYT
NAT	FOR
PEK	GMP
SPU	MAN
SYR	YYZ
LIN	PMO
SVO	CPH
CUU	HMO
CLT	PGV
DOH	AMM
YUL	CLT
PDG	KUL
IKT	NZH
PHX	MSY
GLA	FCO
AMS	FNC
KUL	KCH
TVC	DTW
URS	VKO
HAV	CUN
MUC	YUL
CGB	VCP
JED	SAH
DBV	MAN
PTY	AUA
TAO	HGH
EDI	AMS
MGQ	WJR
CIA	WMI
OAX	IAH
SXF	SEN
FRA	KTW
MSP	PSP
TNR	BKK
FCO	SOF
PCL	IQT
CGK	PLM
EDI	MRS
DXB	SVO
SZX	TXN
BEG	BVA
SBN	MSP
DOH	SGN
HKG	SYD
VIE	ZRH
DME	PUY
NBO	ADD
ICN	HSG
MRS	DUB
ZRH	LEJ
TSA	WUH
JFK	DEN
CAN	PER
SEA	SJC
CKG	CNX
IAS	LTN
TLS	MAN
BDS	STR
NNG	CAN
PUF	ORY
CIH	CTU
STR	VIE
IND	JFK
NYO	BEG
ADE	DOH
SLZ	BEL
CDG	CMB
GYD	OVB
FRA	CTA
LFW	ABV
MRS	CMN
MKE	YYZ
LHR	GIB
MNL	DPL
ECP	STL
PVG	YCU
TPE	AKJ
ORD	JAX
AGP	LHR
ESB	EZS
AYT	ROV
JJN	HKG
UIB	BOG
DOH	ZRH
SKP	BEG
MCO	ORF
ATL	GRB
MDW	MCO
GLA	FNC
VCE	PMO
CMH	RSW
GVA	LHR
HTA	IKT
OSL	TXL
SAN	MCI
MID	MIA
DBV	STR
ROO	CGB
SZX	BHY
CKG	ACX
MEL	BWT
IAD	PWM
YYC	YEG
BWI	EWR
SYD	ARM
AMM	GVA
MSJ	ITM
SXF	SKG
KMQ	PVG
CAN	KWL
VIE	CDG
OTP	WAW
ATH	KRR
ESB	GZT
MCO	SWF
CUN	MSP
TXL	SZG
MCT	KTM
BOS	MAD
ORK	BHX
YVR	YXE
BHX	FNC
YBP	KMG
MIA	ASU
PIT	FLL
BOO	MQN
YYZ	STL
PDX	DTW
YTZ	YSB
YYC	YUL
BOS	JFK
YVR	EWR
FAO	RTM
LHR	IKA
KHH	KMG
NTE	PGF
MIA	IND
DPS	SIN
CPH	CDG
XNA	MSP
LYA	KHN
XIY	LYI
BZR	BVA
MAD	OTP
BKK	MCT
SJC	JFK
KEF	YEG
BCD	MNL
ACK	HPN
SGF	ATL
EDI	EWR
SUB	TPE
PLU	RAO
STR	BCN
OMS	TAS
ZAD	FDH
PHX	TUS
MKE	LGA
GDL	CUL
VCE	LGW
CTA	BUD
SYX	HFE
SKP	CRL
DMK	HKT
APN	MSP
NJC	UUA
HOU	STL
IAD	GRR
PLZ	ELS
DPS	CAN
OTP	AMM
DME	REN
TTN	FLL
BHV	LHE
TUN	BEN
CTU	DOH
SNA	ORD
HVN	PHL
DEN	MRY
LLA	ARN
ORD	RNO
ROC	EWR
ZLO	LAX
FCO	ALC
WMI	LPL
OSL	RAK
SXB	RAK
RGL	AEP
TPP	IQT
ABV	ENU
FCO	CAI
POZ	WAW
DXB	CPT
CFR	NCE
BCN	CDG
IST	LTN
TUN	CGN
AGP	WRO
FRA	GRU
WLG	CHC
NNG	RMQ
STM	MAO
DEN	FAT
CEZ	DEN
AKL	WRE
PVG	HDG
LAX	PBI
CLT	BHM
BHX	ABZ
ORD	SBN
DAL	LIT
ORY	BGO
PVH	RBR
MIA	MBJ
BOD	FCO
BGW	DXB
HKG	HAK
LHW	CTU
OAK	SAN
BGY	SVQ
DEN	RSW
CKG	KMG
AER	TAS
OPO	DLE
CKG	NKG
TSN	KHH
ABY	ATL
HGH	RMQ
PHX	LHR
DEN	PIA
HET	KHN
YVR	YBL
TUS	PDX
MYR	PBG
VLC	MAN
TIA	LGW
DME	PEZ
LOS	JFK
ATL	ECP
KGS	GLA
MEM	SLC
KOJ	KIX
FOC	SHA
LGW	SPU
MIA	BGI
XMN	FUG
PRG	SOF
WAW	DBV
ATL	IAD
SAV	EWR
AGP	BHX
TAO	TXN
BIO	ACE
BNE	BDB
TPA	CAK
ATL	MSL
MAD	SSA
BSL	BDS
CMH	DTW
BUX	GOM
LBV	ABJ
HAU	STN
STR	FNC
BIA	STR
PIA	MSP
IST	AJI
MSN	DEN
HKT	CTU
SVX	NJC
ALB	BWI
EIN	SOF
SAH	AUH
KMG	VTE
MDW	OKC
GVA	LGW
ACY	RSW
HKG	OVB
PRG	LTN
AMS	PVG
HFE	MFM
ICN	HIJ
YTY	DLC
FRA	FCO
JFK	MCO
LAS	MFR
PLM	JOG
CHQ	NYO
LHR	MCT
LHR	NAS
SYD	MEL
TBP	LIM
HGH	HET
OSR	CDG
OAK	EUG
ALC	SOU
PRG	BRU
HAV	LAD
CAN	KOW
SJO	TGU
AUS	LGB
TGO	HRB
RIX	LGW
ADD	IST
FLL	YUL
SFO	LHR
MRY	DEN
ITM	OIT
MSP	FSD
ENA	ANC
MKW	AMQ
JJN	WUH
SAN	JFK
LHR	NCE
YIW	CGO
PMO	BCN
OSR	STN
ABJ	BRU
TLS	BRE
LGW	KUN
WUH	KHN
BSB	POA
KWL	PEK
SIN	CDG
BUF	MSP
KZN	IST
NTE	LCY
SIN	MEL
LYS	AAE
OTP	LIS
JAX	ORD
GYD	LHR
CCS	AUA
BFS	LGW
FCO	MAN
KRK	ZRH
STR	MUC
CTU	KHI
DIJ	TLS
MDW	CLT
IAH	ICT
SVO	PMO
VVI	IQQ
OVB	PRG
HGH	PEK
DLC	CIF
CNM	ABQ
SJC	SLC
SOF	IST
TWU	SDK
TAO	SJW
LAX	DGO
NOP	IST
BHX	CPH
FAO	GLA
ALC	ORK
CAN	CAI
GDN	HAU
GYN	BSB
JKL	ATH
PFO	BHX
HOU	DEN
GDL	SMF
GRU	LDB
TMR	GHA
JFK	YYZ
HTA	KHV
PKU	CGK
SEA	FLL
SZX	SJW
TUL	SFB
BCN	RNS
SVG	AMS
LAS	YXE
VIX	CGH
BZV	COO
DOH	KTM
DUB	SFO
BIA	LGG
CEI	BKK
ABE	DTW
ABJ	LBV
BNA	BWI
BHD	AGP
PSA	BRI
TAO	KWE
FCO	BIO
GYE	AMS
DMK	MFM
ESB	ADA
EWR	CMH
ATL	CLT
MCT	CCJ
LOS	DXB
EWR	OPO
AYT	MUC
PEK	GYS
WWK	HGU
WUX	XIY
YKA	YXS
YKS	CYX
CMN	ZRH
KIX	MFM
WUH	SZX
ANC	MSP
MRS	AAE
YVR	YXT
AMS	BIO
PEK	KHV
AGA	FRA
EDI	DBV
HKG	HFE
BGO	BOO
DCA	PDX
TSN	SZX
DCA	BHM
DEN	BOS
BOG	FRA
AGP	BCN
TPE	SHE
CHA	ORD
HAJ	AMS
BOD	OPO
JMU	KHV
MPM	VPY
FLL	AVL
OIT	NGO
DME	FRA
BKK	DEL
SVG	ALC
BDS	FCO
BLV	SFB
MIG	KMG
AMS	KIX
YUL	LGA
MEX	PVR
VIE	IKA
ERF	AYT
GHA	TMR
YYC	YWG
YXS	YYD
TAO	WUH
HEA	DEL
FRA	DME
HFE	PEK
PHL	SDQ
STR	ZAG
LIS	PSA
KMG	ZHA
LCA	SXF
EWR	CDG
SKE	BGO
CLT	DAB
ADA	EBL
HMO	PHX
GTF	LAS
BGR	SFB
KUL	BNE
CAN	KTM
COO	DLA
LIM	GYE
TSF	LBA
GRU	DOH
HKG	DOH
MMY	ISG
DTW	AZO
BUS	TBS
STR	ACE
LHR	ZRH
JAX	MSP
LAX	SMF
SVG	BCN
BRS	ALC
DBV	TRF
ORF	IAH
TUN	VCE
AYT	TRF
ACC	ABV
ZRH	ICN
ORD	FLL
YVR	YQZ
LHR	FCO
LAX	GRU
CCP	SCL
MSP	LAX
KHN	NAY
LHR	FAO
VVC	PCR
DSM	CLT
OLB	AMS
DME	EVN
DBV	EDI
SFO	ICN
SVX	KLV
DWC	MCT
IAH	DME
IST	RUH
YYT	YQX
MCT	SLL
POM	BNE
MEL	AUH
HGH	TPE
MIA	BEL
WIC	EDI
FAO	BVA
CDG	VNO
GFK	SFB
LTX	GYE
ORY	LRH
OVB	VKO
BHX	AGP
BUF	JFK
AKL	SYD
TMM	WMN
CJB	SHJ
EWR	YYT
SSA	CWB
BRS	SXF
STL	JBR
GRZ	AYT
POZ	LTN
HPN	CLT
BRU	PHL
BRS	ABZ
AUS	ELP
VTZ	DEL
BCN	BLQ
HME	LGW
SIN	JED
BRU	HAJ
TAM	IAH
BOS	MSP
KMS	ACC
EWN	ATL
BZE	CUN
AHB	TUU
OAK	LAS
LBL	DEN
CUM	CCS
ZAD	MUC
IAH	FLL
VCE	SEN
PUS	PVG
IAH	SJC
XIY	DNH
DXB	SYD
WUX	HKG
RTW	SVX
LAS	FNT
ACE	HAJ
PHX	AUS
BRU	TXL
AYT	PRG
LRM	MAD
BUD	PSA
SVQ	ACE
CAN	CNX
BGO	MOL
BCN	ISB
MAD	ATH
NCE	CPH
LIS	BKO
NNG	LZO
ZRH	ATH
MRS	IBZ
IST	NAV
YTH	YWG
DCA	BNA
LGW	GIB
SHE	TNA
FLN	POA
KHN	KHH
BLI	LAS
RAO	CNF
LBB	IAH
RTW	PRG
SCL	EZE
TPE	KHN
SVO	YKS
PHX	CLE
CGQ	TNA
CEK	DYU
HYA	ACK
EWR	NAS
TAS	IST
IAD	YTZ
MSP	RAP
SRZ	TDD
FLL	ORD
MNL	JED
JFK	ICN
LHR	BOM
SGN	ICN
XIY	TAO
OPO	CRL
FRA	LAX
MNL	SGN
OVB	OMS
LIR	IAH
SIN	CKG
AUH	PEW
SLC	BWI
DUB	CIA
BOS	CUN
BHY	HAK
BKO	LOS
COR	ROS
BHX	AMS
SFO	BWI
PEW	AUH
LHR	TAS
BMI	SFB
CTU	SZX
HRE	VFA
WMI	PSA
ORD	BHM
MCT	BLR
LBU	BKI
SGN	CXR
GOJ	EVN
MIR	LYS
ORD	MSN
AHB	JED
HEL	JOE
EBB	DXB
BRU	BIA
DUB	OPO
TST	DMK
HDG	PVG
JFK	ATL
TGP	KJA
SKX	DME
SXR	IXJ
KBV	USM
JFK	RIX
YTZ	YUL
YSB	YYZ
BHD	BHX
BSB	VIX
KGS	MUC
ADD	MPM
SYD	WLG
ISB	HEA
JED	DAC
TGU	MIA
LBE	FLL
QRO	MTY
LAX	MEM
DAC	SHJ
GOJ	PRG
SFO	EUG
CMB	COK
PEK	HKG
CUN	IAD
CAN	TSN
ISP	DCA
SYD	CNS
DEL	IXR
DEN	RNO
OLB	GVA
BLI	AZA
CDG	LXR
BKK	HKG
PER	MEL
BOG	SJO
EGO	KUF
CUN	QRO
FAT	LAS
IST	ROV
FRA	TAS
IAH	SAP
NAY	UYN
FRA	LNZ
LHR	DEN
HAJ	MUC
DAY	IAD
DOU	VCP
BEL	GRU
BOS	PDL
URC	WUH
NLA	LUN
ARN	FLL
SAP	MIA
TXL	HEL
GUC	DEN
UBA	GRU
MJV	BFS
PVG	ORD
VCP	JPA
IAD	MCO
KWL	LHW
RNS	MRS
KMG	MIG
PHS	DMK
SHE	HET
OGG	ITO
DLC	WEF
CCU	HYD
YBP	PVG
PMO	AMS
DTW	CID
ACE	BFS
LGA	PBI
MCT	CDG
DOH	KIX
ATL	ABY
BNE	SYD
ORD	EVV
NCL	KRK
PIT	MEM
HAV	PMV
CAN	SJW
CDG	RUH
SEA	CDG
LYI	HGH
LAS	AZA
MCO	SFO
ZRH	MIA
ASU	GRU
AOG	PVG
AEP	SCL
BSB	FLN
HOU	CLT
MKE	CLE
EIN	NCE
MSP	YVR
AMS	FUK
TIV	LGW
SVO	SIP
AGP	ORY
CAN	DXB
MSO	PDX
RIB	TDD
SCL	GYE
LTN	VNO
MOL	BGO
IST	PRG
KIX	DLC
DGO	TIJ
PHE	BME
SXF	SVO
CCS	FCO
RMQ	CGO
BHM	TPA
PRG	HEL
NAP	KTW
CTU	YTY
CKG	FOC
LST	BWT
EQS	AEP
IND	MEM
CTS	PVG
CGN	LIS
PMW	AUX
DOH	CGK
ATH	SXF
DME	LHR
GTO	MDC
ATL	PDX
ZCL	TIJ
IAD	ALB
YQM	YOW
TYN	MFM
IAH	TRC
APL	JNB
PTY	MCO
SAN	PVR
EUG	LAS
BRU	BRS
YHZ	MBJ
ADB	LYS
MAD	SDQ
XIY	DLC
RIX	PLQ
MDT	YYZ
CTU	UYN
TAB	JFK
BGG	ESB
SOU	NCL
VNO	FRA
BSK	ORY
SDJ	HIJ
MAN	FNC
TBS	URC
WNZ	PVG
CMN	SXB
JUL	AQP
AJA	PIS
COK	MCT
SCW	UCT
UBJ	ICN
BKI	HGH
VIE	NCE
JNB	UTT
URC	KCA
PVK	MUC
EWR	JAX
GMP	SHA
CLT	CVG
MOT	LAS
ACE	ORK
POM	HGU
LBA	AYT
BOG	MEX
LOS	JOS
SWF	FLL
LHR	AGP
DAV	SJO
GOA	NAP
TUN	TOE
STN	SFT
SLC	JFK
TPP	LIM
EGC	SOU
OVB	SVX
LAS	PSC
MUC	BUD
CGD	XIY
SIN	DPS
ICN	NKG
SHJ	EBL
GRR	AZA
ORY	NCE
ATL	PWM
BSB	RAO
MBS	DTW
LIS	LTN
GRR	STL
AMM	LOS
MUC	WAW
LGW	TIV
DEL	VNS
IAH	SDF
GFK	MSP
LGW	PEK
SDQ	FRA
TXL	BLQ
MAD	VKO
HUN	KHH
STM	ITB
OVB	NZH
FCO	NCE
BSL	VCE
CMN	SSG
YVR	PEK
SWA	ZHA
RIX	STN
YYZ	JED
MYR	IAG
UUA	DME
HBE	IST
CTU	BHY
PSA	RAK
DRS	BCN
RAK	ORY
ZRH	HKG
BOS	LAS
IAH	PBC
MBJ	PTY
SIN	NGO
DCA	RSW
FRA	DTW
PRG	KRR
HGR	SFB
PTY	SCL
YCU	CAN
PIT	ORD
DME	UFA
CAG	BLQ
GDL	ONT
BKI	SIN
SPU	DBV
HAV	ZRH
DXB	LAX
KIN	NAS
ISA	BQL
HET	WUA
GLA	CDG
YWG	YTH
DWC	OTP
LAX	STS
NBO	CAN
HBE	RUH
IAD	PEK
TPE	PEK
PEK	YNJ
PTY	ASU
BLR	IDR
CDG	BRE
OAK	JFK
HGH	GYS
LBV	DLA
CGH	MGF
BRU	MUC
OTP	DTM
SGN	DMK
TBS	AMS
AZD	MHD
BUR	OAK
IKT	HTA
FRA	LHR
VVO	PEK
KEF	YYZ
BEY	ACC
MAN	SXF
GDN	PSA
LYS	ATH
ARN	VXO
VNO	BVA
KRK	CIA
MEX	AGU
TAO	HFE
AZA	LAS
MRS	LIL
MDW	BDL
SKG	CGN
FNT	LAS
LAX	PPT
BOG	PTY
SZX	SHA
MQM	ESB
NCE	FRA
SLY	TJM
IST	LHR
TSF	AGP
LNZ	STN
PEK	ZYI
MIA	MCO
TLS	DUB
MUC	OPO
VNO	VIE
SLC	COS
JJN	SHA
BES	LCY
SYD	MNL
BCN	LHE
MAD	OVD
VAA	HEL
HAJ	IBZ
CTU	WNZ
HOR	LIS
ADD	DIR
ORD	CLE
SXF	CPH
FUK	TSJ
SJJ	CPH
ATL	PTY
PVG	LHR
SLC	TUL
CUN	VKO
JHB	SBW
YXS	YKA
BIA	CGN
PKR	KTM
CJB	SIN
YUL	DCA
MRS	TLS
SVO	JFK
AMS	CHQ
TAS	BHK
CDG	BIO
FCO	IAD
LIL	OPO
IAD	CHS
ITH	PHL
XIY	TPE
RPR	BOM
ZRH	BDS
ITM	GAJ
YVR	YYF
SLC	ORD
ZAD	TXL
SAN	CLT
PHX	RNO
IAH	SLC
HRB	TAO
PEK	KJA
RNO	DEN
DWC	VKO
YUL	VRA
CIJ	TDD
LAD	LUO
KWE	PEK
ICN	KTM
ABR	MSP
ORF	PHL
JPA	VCP
PHX	MEX
WUH	PUS
FDH	IBZ
GUA	MEX
UIO	SAL
HKT	HKG
ICN	VVO
SJC	ONT
TPA	ATL
KIX	ICN
SAW	RUH
BUD	KRR
UNN	DMK
MEM	IAH
TGD	CDG
SLY	DME
TOS	KKN
TET	APL
NCL	AMS
AES	ALC
SAV	ATL
LAP	CUL
IKT	SVO
VIE	KIV
ATH	JKL
ORK	EDI
VNO	TXL
PDL	LIS
PTY	GUA
DEN	LIH
MUC	IST
DEN	BIL
EDI	POZ
PKE	BHS
BZE	SAP
DOH	ARN
TTE	MDC
WMI	PIK
CRL	LEI
MUC	LGW
CGO	KHN
DEN	IAD
MSP	SFO
DEN	GUC
RZE	FRA
SHJ	CCJ
FLL	IND
TLS	IST
TGD	LJU
BOD	TUN
TNA	PEK
BRU	TSF
VCE	MRS
PHX	LGB
IAH	SMF
URC	CAN
SYY	ABZ
YEG	YQU
DTW	MCO
DOH	DME
HOU	MAF
PHX	MZT
YCU	TSN
MUC	YVR
GVA	FCO
BCN	BES
YUL	MBJ
AAL	IST
CDG	DBV
KIX	CGK
BHO	BOM
SVO	IST
ECN	SAW
SFO	LIH
VCE	TXL
MDT	PHL
KBL	ISB
DRS	SVO
SFB	TOL
SRQ	ORD
HEL	LGW
OMS	DME
NDG	TAO
HYD	JAI
KUL	HKT
MUX	LHE
BRI	VLC
SIN	SYD
NYO	PSA
FMO	BRE
SXF	LCA
CLT	HTS
EWR	GRR
OAK	ARN
ZAT	CKG
BKK	CAI
KTN	JNU
LAX	YUL
NAY	NDG
TPE	TOY
SJJ	BNX
MFM	SHE
ARN	CGN
LIS	BOS
HRB	CAN
SJU	BOG
MIR	CDG
ILG	MDW
SEN	AMS
PAD	IBZ
OPO	LIS
CDG	SEA
LAS	BDL
EMD	BNE
DME	MAN
AYT	STR
CHC	TRG
DXB	DKR
YQR	DEN
HGH	CNX
MYJ	ICN
STM	ORX
NCE	VIE
SYZ	SHJ
SFO	BFL
KEF	LTN
BDS	STN
PEK	ISB
BSL	NAP
DUB	KUN
ILG	DTW
YYZ	VCE
EIN	WMI
FAO	ORY
BUF	MCO
JNB	LBV
IAD	MEX
MCO	IAH
ATL	MLB
KUL	ICN
ATL	FAY
DUB	TUF
ATW	ORD
LAS	MRY
OKC	IAH
DEA	SHJ
KRK	SNN
MCT	ZNZ
FRA	OLB
KIX	KHH
MQN	TRD
SJW	SZX
SVX	KUF
VKO	NYM
PTY	CLO
MEL	MQL
YWG	DEN
PHL	ELM
IAD	GUA
FRA	LAD
ZAT	KMG
BKK	CTS
GDN	BRU
DXB	LCA
PEK	CMB
KTM	VNS
VIE	LNZ
BLR	CJB
CND	IST
DUB	VLC
LGA	BNA
EIN	OTP
TUN	CMN
IST	TZX
ATZ	RUH
NAP	ZRH
BNA	STL
HRL	IAH
AAR	AGP
TUN	MUC
NBO	JNB
STN	CIA
SAN	SLC
NZH	PEK
NBO	AUH
TWU	KUL
EWR	BZE
DBV	GVA
MTR	BOG
CAK	PHL
MBJ	ATL
VIE	PVK
NIM	ABV
JDH	DEL
LNZ	FRA
PMO	BGY
KTW	BVA
LPB	POI
PSR	CAG
MSP	STL
KGS	AMS
ZUH	TSN
IOS	CNF
KIV	FRA
PUS	MFM
AGU	MTY
PVG	KIJ
DBV	VCE
XMN	KWE
MAD	CPH
LHR	YUL
OSI	SPU
HRB	HEK
SYX	PVG
KMG	PVG
GLA	MAN
NKM	GAJ
HYD	IDR
CPH	AES
BLK	AGP
RJK	LHR
EDI	MAN
FOC	HAK
TPE	TNA
LAX	BNA
SSA	CNF
JFK	MSY
TAS	AER
ZUH	PVG
GAU	BOM
TUS	DEN
LAS	SLC
LAX	ELP
HKG	BNE
CDG	ORD
DEL	AMM
SAW	HAM
PEK	LAD
SYZ	KER
XIY	SJW
AMS	MAN
TPA	MSP
LIS	RAK
FRA	JNB
TPA	DEN
HRB	CZX
PEK	ENY
HAK	SHA
NCL	FAO
BGI	SLU
MAD	CTA
CGK	KUL
BOD	OLB
VLC	LIS
MSP	RST
CKY	ABJ
DYU	REN
SIN	DME
AVL	DTW
ICT	DEN
CGD	XMN
BRI	BLQ
HAK	SZX
BKK	CAN
LOS	COO
SVX	SCW
YKS	DME
NKG	KWL
ABZ	NCL
AAL	ALC
SEN	FAO
GEL	RIA
FAO	LBA
PER	BNE
MSY	MIA
IST	TIP
CAN	WEF
BWI	LAS
AJA	AVN
MAN	KRK
DRS	BSL
INV	EDI
GVA	AYT
ESB	MLX
CFE	AMS
ARN	FRA
PUQ	SCL
HTN	URC
ORD	SAT
BSB	IOS
MEL	NTL
VNO	OSL
AUS	ATL
CKG	KHH
GZP	CPH
BUD	ARN
DEN	DDC
CCS	MAR
EDI	NAP
ICN	AKL
DXB	CDG
RGA	RGL
YYZ	BOS
CTU	CAN
SLC	CVG
SFA	TIP
SVO	BAX
DOH	SAH
IAH	CRP
BEY	EVN
KEF	LGW
OSR	PRG
PHX	OMA
CAE	PHL
FRA	IST
LIL	SPU
LHR	YYC
SOF	SVO
EDI	BCN
KMG	KHH
MSP	DSM
BTS	EDI
MRS	BES
MBJ	EWR
BHM	LGA
SVX	SGC
RJK	HAM
MCO	DTW
NAS	FLL
ATL	JNB
TPA	MDW
JFK	CAI
SAW	CMN
DEN	YYZ
LIS	CCS
ZRH	PRG
AMS	ATL
LGW	NCL
CDG	LGW
CDG	IAH
NAP	NTE
PHL	HVN
SXF	BUD
CAI	MUC
BKK	BOM
FCO	LBA
TAO	CGO
BRS	CPH
SNN	SXF
SNA	SEA
EWR	BOG
HFT	ALF
DTM	BEG
BWI	MEM
BRU	VNO
BOM	RPR
BHX	SNN
BOO	BNN
MTY	HMO
HKT	ICN
AMQ	NBX
KUL	BTJ
PEK	OVB
MPL	ORY
NCE	LPL
ISB	LHE
POM	DAU
SZX	KWE
VCE	VKO
SLC	SAT
PRG	FCO
MUC	PAD
OTP	MUC
TRF	BCN
SGC	OVB
PIE	GRR
SAL	ORD
NSK	OVB
MHD	SHJ
CAN	HGH
LGW	CPH
IAD	AUS
IST	KIX
HAJ	CPH
LAS	ELP
YYZ	LAS
DCA	SDF
MKW	DJJ
IKA	FRA
CPH	POZ
OVD	MAD
LAX	BDL
JAX	MIA
LHR	BIO
SCL	LSC
CRK	HKG
CGN	PRG
URC	XIY
FRA	ZAG
TSN	TSA
SYX	LZH
BUD	LGW
IST	SIN
BGO	FRO
PEK	CGK
PVG	HET
NCE	SVO
FRU	KRR
MEX	EWR
MAN	PRG
ATL	LWB
CGB	GYN
BPN	CGK
BKK	IST
SLC	PVR
CUU	TRC
GVA	VCE
ADL	KUL
SHA	TSA
MHQ	ARN
PUS	CTS
ABQ	MCI
TSF	DUB
SVQ	EIN
LAS	FSD
LGA	CLE
BUR	JFK
TXL	AOI
BSB	FOR
MSS	ALB
LGW	DME
SHE	SHA
CTG	MIA
STN	HAU
BUD	MAD
EVV	ATL
OMA	EWR
ABQ	ATL
CGO	KRL
SZX	GYS
AAL	ARN
KHN	SZX
CTU	TYN
GSP	IAH
MSP	MBS
MCO	YYZ
KMG	XIY
POA	SRA
AUH	ATH
ATL	TUP
CAI	HBE
SAW	ERZ
DXB	AMM
BCN	MIA
XIY	UYN
STN	STR
KIN	GEO
CCU	PBH
BVA	BUD
MNL	DOH
ICN	AUH
LGA	MEM
OVB	HRB
WNZ	ZUH
ALC	GLA
NAT	BSB
PHL	BGR
BHM	PHL
DUB	BRU
YYZ	VRA
PHX	YUM
MCO	MSY
LIH	SAN
LJU	CPH
KHI	BHV
YEG	YQR
EDI	GVA
NKG	KHH
DAL	LBB
TUN	MRS
BRI	PMO
CEI	DMK
LAX	CAN
HEL	DUB
KJA	YKS
EWR	IND
DOH	MUC
BRU	RAK
GWT	STR
JUZ	NAY
DAY	BWI
JPA	GRU
ORY	RDZ
SAV	PHL
EWR	SNN
KGS	TXL
AUA	BOS
EIN	MAD
BSL	FNC
OSS	KUF
SXF	CAI
TYN	CZX
HFE	ICN
SGN	KIX
MRS	AGB
TPA	SEA
EDI	VCE
BDL	ORD
SJU	MAZ
BIL	GGW
DUB	LRH
SWA	KWE
CNF	BSB
MAD	IBZ
SNN	EDI
KUL	BPN
PEK	FCO
ETZ	NCE
SJO	YYZ
ICN	CTS
BUS	DME
IST	BLQ
NTE	SXB
MKE	DEN
KIX	SIN
SSA	GRU
IAH	BRO
TXL	FDH
TRD	SSJ
XNA	ORD
CLT	BTR
MAD	VCE
PEE	SVO
CDG	LEJ
AEP	GRU
BOS	TPA
PDX	MSO
XIY	XNN
DPO	MEL
DAC	BOM
COS	ORD
AEP	FMA
BFS	EDI
SLZ	IMP
LHW	PEK
TNR	DIE
PPS	DVO
BEW	APL
ORF	BWI
DUB	BOD
SHE	KWL
EDI	CRL
ORU	CBB
YEG	YYJ
KSD	ARN
EDI	BTS
CHS	TPA
SHE	WNZ
CTU	HDG
SAN	YYC
BMA	THN
JFK	BRU
CRW	ATL
IXC	SXR
MLI	PIE
KHH	KHN
RAK	MAD
CLT	CHS
PVG	CKG
ENE	KOE
DEN	SBA
WLG	MEL
CAN	LZH
WAW	FCO
BEG	LCA
PHL	CHS
BUD	EDI
ENY	XIY
LPL	AGP
PUS	XIY
HRB	TPE
ORD	BUF
YNZ	TPE
BEG	SKP
SVQ	BVA
OAK	CMH
NNG	CGO
BRU	SXF
SHE	CTU
PVG	MUC
NCL	BHX
PZH	UET
GVA	NTE
HRB	TGO
KIX	AMS
TLS	CMN
KWE	TAO
YVR	YZZ
BIS	DEN
AYT	SXF
BCN	RAK
LIS	STR
IKA	KUL
STR	BEG
NGO	BKK
BCN	OVD
VNO	KUT
YUL	FRA
TRF	PSA
ADB	IST
SXF	BRU
IAH	MKE
AZA	RST
BNE	TPE
NKG	CTU
FCO	ARN
BOM	CCU
SVO	VNO
LCY	DRS
GPT	IAH
HGH	SWA
DME	ASF
CHS	CLT
PRG	OVB
MRS	CIA
VIE	SOF
JFK	CLT
ATH	CAI
SXB	STN
MOT	AZA
BVA	SNN
DEN	ONT
RIX	GYD
DNH	LHW
DJJ	MKW
ORK	STN
PEK	TNA
GYN	PMW
VIE	EBL
PLU	CFB
EWR	MSN
MSP	BHM
FNC	OPO
BEG	STR
NGO	SDJ
PPS	ILO
KRS	OSL
SIN	ICN
RAK	SXF
PRG	VIE
BTS	OSL
AOO	IAD
NOZ	SVO
YEG	YXY
IAH	MAF
IGD	IST
DIL	DPS
DOH	PVG
DXB	CMN
BNE	WLG
PBG	MYR
PRG	CPH
IPI	BOG
IAH	SNA
DSM	MDW
SLC	PIH
ARM	SYD
KRS	BGO
AVP	DTW
ALC	BRU
SBP	SFO
STN	LJU
KGS	MAN
EDI	MJV
IST	LHE
MDT	BOS
LWS	BOI
ARI	IQQ
WAW	SVO
BEY	FRA
LGW	YVR
ATL	CSG
IAH	SJO
INN	EIN
AQG	SHA
DPS	PVG
AMS	ACE
CRL	WAW
LGA	MSY
UDI	UBA
SAW	STR
CCU	NAG
VOG	TAS
SJW	BHY
TPA	CLT
SVO	SKG
DXB	SFO
BNE	KTA
KUL	TAS
DUB	PSA
MAO	PIN
BFS	LCA
CNJ	BNE
CAG	CGN
WNZ	HKG
PHL	FRA
LAX	YYZ
PEK	KHN
PHL	ITH
CLE	MSY
VTE	VII
DUB	NCE
DKR	LIS
XMN	DLC
HYN	PEK
RFD	LAS
SXF	ACE
MEM	DCA
LAX	SAN
GRB	ORD
BES	BOD
VCE	BRU
CRL	BRI
GRR	ORD
SGN	NNG
AGA	LEJ
MUC	MAD
LTN	TSR
LTN	GLA
BRU	DLA
RST	ORD
MSP	MDW
MNL	ICN
MCO	MEM
DEN	FSD
CLO	LIM
JNB	BZV
VNO	MUC
YOW	YFC
BUD	IST
OLB	CGN
LAX	ITO
RAK	DUB
LIM	EZE
WRO	BGY
PMV	PBL
PUS	NGO
ISB	CDG
BKI	CGK
MUC	TUN
YYC	SFO
SYD	TSV
AZA	GFK
SVO	OVB
DTW	MBS
HKG	XMN
PTJ	MEB
WNZ	HAK
PIK	ACE
TXN	TSN
SOU	NTE
LJU	CDG
PLU	GRU
ROV	SVX
IAH	MID
FSD	SFB
KZN	AYT
HSV	DCA
AAR	OSL
TRD	AES
BWN	KUL
BRE	HAU
RIX	VKO
OAK	GDL
GRU	MIA
PMV	VLN
LAX	MDW
AKL	CNS
LGA	PHL
ARN	KLX
GDL	MEX
BRN	AMS
SWA	PEK
SVO	STW
DOH	ESB
SYR	DTW
GOA	DME
LPB	CIJ
PHF	ATL
BSB	CGB
DXB	BHX
LYS	MRS
ZNZ	ADD
STR	BRU
DTW	MDW
HET	NAY
CTU	ZYI
AER	KIV
ADL	HKG
LIS	VCE
LIS	CDG
CAK	DCA
BHX	IST
BNA	DTW
DAC	KTM
BUD	BVA
AUX	PMW
CUN	MTY
LGA	TYS
TNA	SHA
VCP	CFB
FAO	CGN
ICN	MUC
CAN	ZYI
YOW	YTZ
SHA	ZUH
LIS	KIV
HAN	RMQ
CGQ	SZX
CJC	ANF
LIN	VIE
AMM	OTP
ADL	ASP
GHA	CZL
CRK	MFM
PHX	DTW
IAH	BTR
AEP	PDP
HOU	MEM
BEN	SFA
BOM	DAC
BOS	SAV
KJA	THX
STS	SAN
IST	KFS
SJW	XIY
BKK	XMN
PHL	PIT
CPH	FAO
GVA	AMS
MCO	AUA
OKJ	ICN
CDG	OPO
CID	LAS
ANC	LAX
AMS	AUH
MSP	XNA
ATL	TUS
LAS	ONT
KUT	DOK
BIO	STN
LIM	BOG
IXA	CCU
VCP	MAO
MJV	OSL
SJC	BOI
CTU	SYX
FOC	CGK
LTN	NAP
CNF	CWB
LIN	NAP
ATL	MGA
ADQ	ANC
LHR	LBA
LYH	CLT
SOF	ZRH
LIT	CLT
TPA	STL
POZ	DUB
PDX	BUR
CDG	CLT
MUC	RAK
ORD	AUS
JKH	SKG
HTY	SAW
LGW	SXF
MFM	XMN
KMG	DAX
YYZ	YYT
SJO	PTY
MYR	YTZ
BUR	DEN
CNF	SLZ
LIN	CAG
IAH	YEG
LAX	MKE
SFO	MCO
IAH	PBI
EKO	SLC
MFM	KIX
MEX	MZT
LHR	SVO
TWB	BNE
JGN	XIY
CAG	BGY
ATL	GPT
OSL	SXF
XMN	KMG
TOF	KJA
XNN	MIG
PEK	HET
KIX	FCO
BNN	TRD
MAZ	SJU
SZG	ZRH
EYW	MSY
BDL	PBI
TMP	AGP
MAN	BIO
MDW	DEN
MUC	FCO
SZX	DPS
VRA	YYC
LAS	SMX
EZE	CUN
IST	EBL
DEN	SHR
ILM	CLT
LGW	KIN
VPS	IAH
AUS	CUN
LGB	SMF
SVG	OSL
JED	IST
DVO	MNL
DTW	SLC
YQT	YTZ
OSL	LGW
ORD	YOW
CMH	LAX
PHL	DAY
NYO	GDN
ORY	SOU
LAS	RAP
HNL	SAN
BRU	OUA
MLM	LAX
SYD	DPS
CDG	HAM
HAN	VTE
MSY	STL
PEK	BHY
BRO	IAH
ADD	LAD
DEL	PVG
NBS	CGQ
BSB	CGH
PTY	MAR
CLT	YUL
TAS	VOG
HIR	GZO
BWI	SAN
ABV	SSG
TUL	DAL
IST	KZN
DME	OSS
YNT	XIY
KMG	HAK
SAW	LGW
NIM	CMN
OSL	LCA
OSL	CGN
IST	BIO
GRZ	FRA
COU	ORD
BKI	MNL
LHR	JFK
EWR	BFS
JPA	SSA
DAL	OKC
XMN	YIW
KVA	CGN
HOU	LAS
LOP	PER
UYN	CTU
JFK	MEX
BOG	IAH
SYX	TYN
YYZ	CMH
TMP	BRE
RMQ	HGH
SHE	KHN
VAR	VIE
KEF	BRU
AUH	IST
FRA	CHQ
SEA	TUS
SXB	BIA
MUC	CAG
PHL	FLL
YCU	TAO
SVG	RIX
SAT	HRL
NGO	KOJ
EWR	SAL
BWI	OKC
GSP	ATL
SAN	TUS
JFK	JAX
ORD	DLH
STN	LYS
CRL	MAN
NTE	LYS
OVD	ACE
DEN	SGF
ATH	SVO
JST	IAD
ERI	CLE
LPL	ACE
RAK	GVA
HAM	IKA
IST	KUL
FEZ	FNI
GLA	BHD
BRE	DUB
FRA	KGS
ACK	BOS
BRE	VIE
MSP	SBN
MPM	UEL
LHE	DEA
CAG	PMF
IST	CPH
MUC	CLT
HAM	EWR
SHA	WUH
LBV	KGL
IAH	LFT
SBZ	OTP
SYX	HKG
PRG	FNC
MAD	LYS
AMS	HGH
DAL	ICT
DUR	MPM
PHL	BOS
MJV	EDI
NAY	FUO
NKG	ZYI
MNL	NGO
DTM	ONQ
KHN	TYN
POA	LIM
DEL	HEA
NAY	ZHA
TKU	GDN
SVO	CAI
LHW	KMG
CDG	JIB
CDG	LAX
TSN	DLC
RJH	DAC
DXB	LUN
SAT	MCO
BGY	SOF
FAO	MST
CDG	PVG
IAH	COS
GYD	TBZ
XIY	WNZ
BJM	KGL
MAN	DXB
TXL	FAO
PSR	STN
PEK	TGO
CLT	PNS
ATH	IOA
TSF	BRE
MIA	MGA
IST	JIB
SHE	JMU
BNA	MCI
EGE	DEN
YXU	YYZ
MAD	TUN
FRU	OVB
CTA	FCO
SAV	IAD
OSL	AAR
FRA	DOH
DXB	MBA
TSF	BDS
SLP	MEX
MRS	SVO
SFO	ATL
KUL	BWN
SAW	DOH
UBP	DMK
MAD	ATL
PHX	CUN
SHE	XIY
RDD	SFO
ALC	KRS
STM	BEL
LIN	MAD
BLZ	LLW
FNC	PDL
NTE	LIL
AMM	BGW
SOU	LRH
SSA	VIX
MGB	ADL
MRS	EDI
ORY	LIN
MDW	SFO
SAL	EWR
SIN	PER
MUC	MJT
CGN	ACE
SAN	EWR
TXL	BUD
SPU	HAJ
YYT	YDF
LAX	SVO
TGO	HGH
WMN	TMM
WRO	CPH
ORD	BDL
JNG	PEK
LGW	TPA
KUF	ROV
DMK	MAQ
KAD	LOS
SRQ	LGA
ICN	CGQ
YYZ	GLA
MRS	RNS
EWR	TXL
KHN	TSN
SVO	TXL
BLA	VLN
KUL	VTE
GDN	BCN
ACY	BOS
VBY	BMA
PHL	ORD
HKG	CGK
YTY	CKG
EDI	SNN
LGA	YYZ
SVO	KHV
CID	SFB
GVA	ATH
FCO	LAX
PEK	HLH
ACC	MLW
OSL	FLL
AMS	BCN
SVO	RIX
PHX	FLL
KUN	ALC
ATL	AEX
DUB	MRS
SOU	FAO
JED	AUH
ACE	TXL
IAH	CVG
LIG	BRS
TAK	TPE
FLR	ZRH
CLT	MDW
MLW	FNA
NGO	KMJ
ORK	BCN
RGL	USH
SAT	SLC
SZX	JJN
PHX	JFK
ZRH	LTN
BNE	BCI
FRA	HAM
DXB	TPE
YYC	FRA
BNA	SAT
MRS	CDG
DOH	MHD
WUH	TNA
BLQ	BCN
NTE	AJA
HAV	CDG
YLW	YXC
HPN	DCA
CAI	BUD
LPL	LIS
MAF	DAL
YHZ	ORD
ZAG	IST
PHX	SAN
YCU	URC
ESB	CKZ
WNZ	FUG
GYD	DXB
LIS	CMN
SOF	MAD
SAW	ASR
SEA	AMS
ORY	CFE
STR	DRS
KIV	DWC
CMN	FNA
NGS	ICN
HNL	BLI
LGW	MBJ
JNB	ZRH
WAW	SOF
SVO	ZRH
MBA	NBO
SYZ	IFN
SAL	SAP
PER	RVT
TXN	HAK
GYE	SCL
MSP	CUN
NYO	BRE
ILG	MCO
WNZ	NAY
BHD	LGW
MDW	LAS
DEN	CUN
SDR	SVQ
HEL	BMA
MUC	VIE
EZE	JFK
SSA	BRA
OKC	DAL
SFO	PSC
FLN	CGH
ZRH	SPU
PSA	VLC
KIN	LGW
BUF	PHX
SYD	YVR
EYW	RSW
DEN	MSP
MSY	LGA
CCS	PTY
ORD	SPI
BSL	SPU
DTW	ATW
WRO	FRA
PDX	FAT
AFL	CGB
GDL	LAS
MUC	POZ
KMG	SYM
ARN	BGW
RIC	CLE
PMO	MRS
SHA	BFJ
ORD	AZO
TIJ	CLQ
PHL	JFK
IAH	BOG
AMS	CFE
MUC	LIS
TNR	JNB
BHX	STR
BUD	TSF
OTP	ATH
BLR	LHR
ORF	ORD
YYJ	YEG
TBS	SAW
BKK	ZRH
SVO	GVA
ARN	HAM
OKJ	TPE
MWZ	NBO
IBZ	ZRH
GLA	LCA
ORN	IST
ORD	YVR
SJC	MSP
TPE	YVR
PER	KNX
HAN	NGO
MCO	DEN
PHX	BFL
ORD	PVG
CLQ	TIJ
CAI	CDG
IXC	BOM
MNL	POM
KUU	DEL
IPL	BUR
BCN	CRL
SVX	KRR
MEL	CGK
AOR	KUL
NBO	ASM
GZT	ESB
EWR	SNA
FLL	HOU
IST	NCE
HAM	SPU
BHX	PFO
JNB	PER
FUK	NGO
HKG	DPS
MAD	VVI
TXL	AGP
LIH	SEA
VIE	SAW
TPE	CKG
KEF	AMS
HKG	WUX
DTW	MEX
MAM	MEX
CAI	ABV
SHE	TSN
NAP	VIE
BTV	ORD
ORD	OMA
AUH	NBO
PGD	TOL
GVA	DBV
OTP	BEG
MAN	EWR
DBV	BCN
SUV	SYD
BLR	DXB
SLC	CUN
DTW	PHL
DMK	XIY
LGA	ORD
IXZ	CCU
PEK	FUG
HOG	YUL
SAW	DTM
CKG	BKK
REC	THE
IAD	TPA
BKK	KKC
FRA	VKO
BAV	CIF
CVG	XNA
MCK	DEN
RTM	AGP
HTS	SFB
SPU	CGN
YVR	YYD
HOG	MBJ
PIT	LAS
ISB	RUH
ORY	VLC
PIS	LRH
DXB	PEK
FAT	LAX
FAO	BRU
BEG	VAR
YBL	YQQ
CGQ	TAO
FCO	BRI
MIG	XNN
MDW	LIT
MDW	ILG
POP	LRM
ASE	LAX
LIH	OGG
YHZ	DCA
CLT	CAK
LIS	GRU
SNN	AGP
FCO	PRG
PSA	LGW
BRU	FNC
CLT	PVD
AUH	LHE
LYS	VIE
AJA	MRS
HNL	PVG
ACK	HYA
FIH	BZV
TIZ	POM
KHV	SVO
VKO	CEE
BKK	THS
PEK	IKA
LAD	CPT
HGH	TSA
MFM	NKG
YUL	POP
MUC	NAP
BLQ	MUC
SOF	PFO
SPU	HEL
BRI	CTA
NKG	YCU
BWT	LST
CRL	BDS
SPU	WAW
BOD	BLQ
MAD	RBA
HNL	FUK
MLM	SFO
EZE	CWB
MJV	PIK
DTW	PVG
BEG	AUH
GSP	CLT
NBO	JIB
IKT	KHV
RTM	AYT
WLG	WRE
SKG	BGY
TYS	IAH
KIX	NOU
IAD	DUB
CGO	BAV
PDX	SEA
CAG	STR
OGD	AZA
PER	CGK
MIA	TUL
MVD	EZE
BLJ	LYS
AEP	RES
VKO	KUF
AUH	DME
TBS	RIX
EBB	IST
VCP	CWB
TLS	LGW
HEL	ATH
MSP	HLN
ELS	PLZ
FAT	SAN
OVB	DXB
KHH	TAO
LIL	ORN
HYD	RUH
IST	PVG
SKG	SVO
BOM	NAG
PEW	JED
SFB	PHF
PEK	HEL
SFO	PDX
PMC	MHC
SKG	CRL
SHA	URC
ADB	BRE
TNA	BKK
TPE	SJW
IST	HAM
CAI	MCT
MUC	FMO
STN	LNZ
YYZ	MYR
EGO	KRR
VIE	ACE
FRA	RIX
CTA	AMS
ESB	ERZ
IFN	TBZ
HKT	OVB
NCE	LIS
SEA	COS
GRU	IPN
PMR	NSN
BLQ	OLB
OGX	AZR
MEL	ASP
DXB	DUB
ORY	PGX
RUH	DOH
LHR	DXB
RAO	VCP
FRA	CMB
BVA	KIV
IAD	IND
BKK	NBO
OMA	SEA
VCE	ATH
BLI	OAK
IST	SVO
HRB	KHN
YCU	CTU
MDW	CLE
LOS	SSG
LGW	DBV
DCA	PHL
DEL	ADD
RFD	AZA
BWI	FNT
PVG	BWN
TXL	CDG
PEK	YNT
LGW	ATH
OVB	TJM
UKB	KOJ
FRS	GUA
GVA	ORY
TXL	OTP
LKO	BOM
PIT	STL
OTP	ZAZ
BSB	LIS
FWA	MYR
DCA	VPS
ORD	MSP
TUN	CAI
DTW	JAX
BUD	HEL
HUI	HAN
LYS	CFE
MEX	PDS
BVA	PUY
IAD	BOG
GYE	SAL
YYZ	LAX
BME	KNX
POZ	NYO
MCO	BMI
PEK	SFO
WUH	WUX
FCO	GVA
RAK	OSL
OGG	SEA
BFS	NCL
UBA	UDI
WAW	TRF
OVB	URC
DEN	ISN
SJJ	SAW
PVG	YNT
CAN	SGN
CUN	TAM
THE	BSB
PHX	MKE
STR	FAO
PXU	HAN
VCP	NAT
CLT	IAH
BDS	ZRH
NKG	TGO
AJU	BSB
ARN	AMS
KRL	CGO
CID	DTW
SAW	DME
BZE	EWR
IMP	BSB
TYN	TSN
NNG	WNZ
MST	BRI
CRL	ALC
KIX	ISG
AAQ	DME
MIA	SVO
NKG	PUS
CGQ	NBS
MRS	BCN
HGH	JJN
COO	ADD
DEN	CLE
TPE	TSN
CNX	CAN
AMS	HEL
AKL	PER
CDG	SGN
HUN	RMQ
SHA	CIH
PHW	JNB
TAS	KRR
MSP	MIA
BHX	VCE
TMP	ARN
JFK	NAS
IAD	SEA
MCT	JAI
PVG	HAN
LAX	PEK
FUO	NAY
FLG	PHX
DEL	RUH
TSN	CKG
IBZ	STN
LGB	SEA
CTA	ARN
MIG	CAN
VIE	MUC
BHX	ARN
SVQ	TLS
CTS	HIJ
CLE	PHL
KWL	PVG
LUN	LVI
SWA	SHA
MTY	LAS
NCE	BIA
PVG	TYN
BRI	OTP
NCE	JFK
UDR	BOM
ATH	MAD
KIX	YNT
SKG	PSA
IAH	LRD
MCN	MCO
HRL	DAL
PUS	HAN
OPO	BOD
AMS	CDG
MEX	ORD
SAW	MQM
TTN	IND
CLO	BAQ
SUB	PKY
HOU	ELP
PVD	IAD
GRU	EZE
YHZ	YFC
CLT	BZE
YFO	YTH
WMI	MAN
KIJ	NGO
SEA	ATL
TAS	SKD
RMQ	HAN
SLC	BNA
MUC	EBL
EZE	ASU
CDG	SFO
GDN	TRD
LJU	IST
ABV	NIM
SCL	MEX
MDW	RSW
YNT	CAN
EZE	SCL
CKG	XNN
ACX	KWE
HEL	PVG
FCO	ATL
SNN	FMM
SXR	IXC
BGO	VNO
LOS	IAH
CUN	MIA
LUN	BLZ
LGA	AUA
BIO	FCO
VIE	PMO
PHL	MBJ
TEN	KWE
SDQ	PTY
COS	LAX
GRU	JNB
SVO	TOF
BRU	VCE
MEL	DOH
KRK	ALC
BRE	STR
FCO	SPU
FAO	SOU
CRL	ZAZ
SDF	ORD
SAN	HOU
SAL	SFO
YEG	YQQ
PER	ASP
CLT	MCO
KGS	STR
AYT	ERF
PVG	LAX
LIM	PEM
SIN	DIL
MEM	HRO
TUN	ORN
DXB	KIX
ZRH	SAW
LIM	MEX
YQD	YFO
IBZ	ALC
JDZ	SHA
IAD	GVA
IBZ	CIA
TPE	SDJ
DEL	IXC
ABJ	ACC
ISB	BKK
HBA	SYD
CDG	MCT
JUB	KRT
TSN	LHW
VTZ	HYD
TRF	ARN
PVD	DTW
KGL	BRU
OVB	SGC
FAO	DTM
TPE	SUB
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (iso2, name, population, gdp, continent) FROM stdin;
AF	Afghanistan	33332025	64080000000	Asia
AL	Albania	3038594	33900000000	Europe
DZ	Algeria	40263711	609000000000	Africa
AD	Andorra	85660	3330000000	Europe
AO	Angola	25789024	189000000000	Africa
AG	Antigua and Barbuda	93581	2170000000	North America
AR	Argentina	43886748	879000000000	South America
AM	Armenia	3051250	26300000000	Europe
AU	Australia	22992654	1190000000000	Oceania
AT	Austria	8711770	417000000000	Europe
AZ	Azerbaijan	9872765	166000000000	Europe
BS	Bahamas	327316	9070000000	North America
BH	Bahrain	1378904	66370000000	Asia
BD	Bangladesh	156186882	628000000000	Asia
BB	Barbados	291495	4800000000	North America
BY	Belarus	9570376	166000000000	Europe
BE	Belgium	11409077	509000000000	Europe
BZ	Belize	353858	3090000000	North America
BJ	Benin	10741458	24310000000	Africa
BT	Bhutan	750125	6430000000	Asia
BO	Bolivia	10969649	78660000000	South America
BA	Bosnia and Herzegovina	3861912	42530000000	Europe
BW	Botswana	2209208	35900000000	Africa
BR	Brazil	205823665	3080000000000	South America
BN	Brunei	436620	33729999999	Asia
BG	Bulgaria	7144653	143000000000	Europe
BF	Burkina Faso	19512533	32990000000	Africa
BI	Burundi	11099298	7890000000	Africa
KH	Cambodia	15957223	58940000000	Asia
CM	Cameroon	24360803	77240000000	Africa
CA	Canada	35362905	1670000000000	North America
CV	Cape Verde	553432	3580000000	Africa
CF	Central African Republic	5507257	3210000000	Africa
TD	Chad	11852462	30590000000	Africa
CL	Chile	17650114	436000000000	South America
CN	China	1373541278	21100000000000	Asia
CO	Colombia	47220856	688000000000	South America
KM	Comoros	794678	1260000000	Africa
CG	Republic of the Congo	4852412	30270000000	Africa
CR	Costa Rica	4872543	79260000000	North America
CI	Ivory Coast	23740424	87120000000	Africa
HR	Croatia	4313707	94240000000	Europe
CU	Cuba	11179995	133000000000	North America
CY	Cyprus	1205575	29260000000	Europe
CZ	Czech Republic	10644842	351000000000	Europe
CD	Democratic Republic of the Congo	81331050	65040000000	Africa
DK	Denmark	5593785	265000000000	Europe
DJ	Djibouti	846687	3350000000	Africa
DM	Dominica	73757	812000000	North America
DO	Dominican Republic	10606865	162000000000	North America
EC	Ecuador	16080778	182000000000	South America
EG	Egypt	94666993	1110000000000	Africa
SV	El Salvador	6156670	54790000000	North America
GQ	Equatorial Guinea	759451	31770000000	Africa
ER	Eritrea	5869869	9170000000	Africa
EE	Estonia	1258545	38930000000	Europe
SZ	Eswatini	1451428	10940000000	Africa
ET	Ethiopia	102374044	175000000000	Africa
FJ	Fiji	915303	8369999999	Oceania
FI	Finland	5498211	226000000000	Europe
FR	France	66836154	2700000000000	Europe
GA	Gabon	1738541	35980000000	Africa
GM	Gambia	2009648	3390000000	Africa
GE	Georgia	4928052	37270000000	Europe
DE	Germany	80722792	3980000000000	Europe
GH	Ghana	26908262	121000000000	Africa
GR	Greece	10773253	291000000000	Europe
GD	Grenada	111219	1510000000	North America
GT	Guatemala	15189958	132000000000	North America
GN	Guinea	12093349	16079999999	Africa
GW	Guinea-Bissau	1759159	2850000000	Africa
GY	Guyana	735909	6050000000	South America
HT	Haiti	10485800	19340000000	North America
HN	Honduras	8893259	43190000000	North America
HU	Hungary	9874784	268000000000	Europe
IS	Iceland	335878	16149999999	Europe
IN	India	1266883598	8720000000000	Asia
ID	Indonesia	258316051	3030000000000	Asia
IR	Iran	82801633	1460000000000	Asia
IQ	Iraq	38146025	597000000000	Asia
IE	Ireland	4952473	322000000000	Europe
IL	Israel	8174527	297000000000	Asia
IT	Italy	62007540	2220000000000	Europe
JM	Jamaica	2970340	25390000000	North America
JP	Japan	126702133	4930000000000	Asia
JO	Jordan	8185384	86190000000	Asia
KZ	Kazakhstan	18360353	469000000000	Europe
KE	Kenya	46790758	153000000000	Africa
KI	Kiribati	106925	211000000	Oceania
KW	Kuwait	2832776	301000000000	Asia
KG	Kyrgyzstan	5727553	21010000000	Asia
LA	Laos	7019073	40960000000	Asia
LV	Latvia	1965686	50650000000	Europe
LB	Lebanon	6237738	85160000000	Asia
LS	Lesotho	1953070	6020000000	Africa
LR	Liberia	4299944	3790000000	Africa
LY	Libya	6541948	90890000000	Africa
LI	Liechtenstein	37937	4980000000	Europe
LT	Lithuania	2854235	85620000000	Europe
LU	Luxembourg	582291	58740000000	Europe
MK	Macedonia	2100025	29520000000	Europe
MG	Madagascar	24430325	37480000000	Africa
MW	Malawi	18570321	21200000000	Africa
MY	Malaysia	30949962	863000000000	Asia
MV	Maldives	392960	5410000000	Asia
ML	Mali	17467108	38090000000	Africa
MT	Malta	415196	16320000000	Europe
MH	Marshall Islands	73376	180000000	Oceania
MR	Mauritania	3677293	16710000000	Africa
MU	Mauritius	1348242	25850000000	Africa
MX	Mexico	123166749	2310000000000	North America
FM	Micronesia	104719	314000000	Oceania
MD	Moldova	3510485	18540000000	Europe
MC	Monaco	30581	7670000000	Europe
MN	Mongolia	3031330	37000000000	Asia
ME	Montenegro	644578	10610000000	Europe
MA	Morocco	33655786	283000000000	Africa
MZ	Mozambique	25930150	35010000000	Africa
MM	Myanmar	56890418	307000000000	Asia
  	Namibia	2436469	25990000000	Africa
NR	Nauru	9591	150800000	Oceania
NP	Nepal	29033914	71520000000	Asia
NL	Netherlands	17016967	871000000000	Europe
NZ	New Zealand	4474549	175000000000	Oceania
NI	Nicaragua	5966798	33549999999	North America
NE	Niger	18638600	20150000000	Africa
NG	Nigeria	186053386	1090000000000	Africa
KP	North Korea	25115311	40000000000	Asia
NO	Norway	5265158	365000000000	Europe
OM	Oman	3355262	173000000000	Asia
PK	Pakistan	201995540	988000000000	Asia
PW	Palau	21347	283500000	Oceania
PA	Panama	3705246	93120000000	North America
PG	Papua New Guinea	6791317	28020000000	Oceania
PY	Paraguay	6862812	64670000000	South America
PE	Peru	30741062	410000000000	South America
PH	Philippines	102624209	807000000000	Asia
PL	Poland	38523261	1050000000000	Europe
PT	Portugal	10833816	297000000000	Europe
QA	Qatar	2258283	335000000000	Asia
RO	Romania	21599736	441000000000	Europe
RU	Russia	142355415	3750000000000	Europe
RW	Rwanda	12988423	21970000000	Africa
KN	Saint Kitts and Nevis	52329	1430000000	North America
LC	Saint Lucia	164464	2080000000	North America
WS	Samoa	198926	1050000000	Oceania
SM	San Marino	33285	2020000000	Europe
ST	Sao Tome and Principe	197541	694000000	Africa
SA	Saudi Arabia	28160273	1730000000000	Asia
SN	Senegal	14320055	39720000000	Africa
RS	Serbia	7143921	102000000000	Europe
SC	Seychelles	93186	2610000000	Africa
SL	Sierra Leone	6018888	10640000000	Africa
SG	Singapore	5781728	488000000000	Asia
SK	Slovakia	5445802	169000000000	Europe
SI	Slovenia	1978029	68349999999	Europe
SB	Solomon Islands	635027	1200000000	Oceania
SO	Somalia	10817354	4720000000	Africa
ZA	South Africa	54300704	739000000000	Africa
KR	South Korea	50924172	1930000000000	Asia
SS	South Sudan	12530717	20880000000	Africa
ES	Spain	48563476	1690000000000	Europe
LK	Sri Lanka	21203000	237000000000	Asia
VC	Saint Vincent and the Grenadines	102350	1240000000	North America
SD	Sudan	36729501	176000000000	Africa
SR	Suriname	585824	8550000000	South America
SE	Sweden	9880604	498000000000	Europe
CH	Switzerland	8179294	496000000000	Europe
SY	Syria	17185170	50280000000	Asia
TJ	Tajikistan	8330946	25810000000	Asia
TZ	Tanzania	52482726	151000000000	Africa
TH	Thailand	68200824	1160000000000	Asia
TL	East Timor	1261072	4980000000	Asia
TG	Togo	7756937	11610000000	Africa
TO	Tonga	106513	557000000	Oceania
TT	Trinidad and Tobago	1220479	43570000000	North America
TN	Tunisia	11134588	131000000000	Africa
TR	Turkey	80274604	1700000000000	Europe
TM	Turkmenistan	5291317	94720000000	Asia
TV	Tuvalu	10959	39000000	Oceania
UG	Uganda	38319241	84930000000	Africa
UA	Ukraine	44209733	353000000000	Europe
AE	United Arab Emirates	5927482	667000000000	Asia
GB	United Kingdom	64430428	2790000000000	Europe
US	United States	323995528	18600000000000	North America
UY	Uruguay	3351016	73250000000	South America
UZ	Uzbekistan	29473614	202000000000	Asia
VU	Vanuatu	277554	723000000	Oceania
VE	Venezuela	30912302	469000000000	South America
VN	Vietnam	95261021	595000000000	Asia
YE	Yemen	27392779	73450000000	Asia
ZM	Zambia	15510711	65170000000	Africa
ZW	Zimbabwe	14546961	28330000000	Africa
PS	Palestine	4550368	0	Asia
VA	Vatican	1000	0	Europe
AS	American Samoa	54194	711000000	Oceania
AI	Anguilla	16752	175400000	North America
AW	Aruba	113648	2520000000	North America
BM	Bermuda	70537	5200000000	North America
VG	British Virgin Islands	34232	500000000	North America
KY	Cayman Islands	57268	2510000000	North America
CK	Cook Islands	9556	244100000	Oceania
FK	Falkland Islands	2931	0	South America
GF	French Guiana	294071	0	South America
PF	French Polynesia	285321	5490000000	Oceania
GI	Gibraltar	29328	2040000000	Europe
GL	Greenland	57728	2170000000	North America
GP	Guadeloupe	395700	0	North America
GU	Guam	162742	4880000000	Oceania
HK	Hong Kong	7167403	427000000000	Asia
MO	Macao	597425	63220000000	Asia
MS	Montserrat	5267	43780000	North America
NC	New Caledonia	275355	10770000000	Oceania
NU	Niue	1190	10010000	Oceania
NF	Norfolk Island	2210	0	Oceania
MP	Northern Mariana Islands	53467	682000000	Oceania
PN	Pitcairn	54	0	Oceania
PR	Puerto Rico	3578056	131000000000	North America
RE	Reunion	859959	0	Africa
TW	Taiwan	23464787	1130000000000	Asia
TK	Tokelau	1285	1500000	Oceania
TC	Turks and Caicos Islands	51430	632000000	North America
VI	U.S. Virgin Islands	102951	3790000000	North America
WF	Wallis and Futuna	15664	60000000	Oceania
EH	Western Sahara	587020	906500000	Africa
\.


--
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.routes (from_code, to_code, airline_code) FROM stdin;
AER	KZN	2B 
ASF	KZN	2B 
CEK	KZN	2B 
CEK	OVB	2B 
DME	KZN	2B 
DME	NBC	2B 
DME	TGK	2B 
DME	UUA	2B 
EGO	KGD	2B 
EGO	KZN	2B 
GYD	NBC	2B 
KGD	EGO	2B 
KZN	AER	2B 
KZN	ASF	2B 
KZN	CEK	2B 
KZN	DME	2B 
KZN	EGO	2B 
KZN	SVX	2B 
NBC	DME	2B 
NBC	GYD	2B 
NBC	SVX	2B 
NJC	SVX	2B 
NJC	UUA	2B 
OVB	CEK	2B 
OVB	SVX	2B 
SVX	KZN	2B 
SVX	NBC	2B 
SVX	NJC	2B 
SVX	OVB	2B 
TGK	DME	2B 
UUA	DME	2B 
UUA	NJC	2B 
BTK	IKT	2G 
BTK	OVB	2G 
CEK	OVB	2G 
HTA	IKT	2G 
IKT	BTK	2G 
IKT	HTA	2G 
IKT	KCK	2G 
IKT	OVB	2G 
IKT	ULK	2G 
IKT	YKS	2G 
KCK	IKT	2G 
OVB	BTK	2G 
OVB	CEK	2G 
OVB	IKT	2G 
ULK	IKT	2G 
YKS	IKT	2G 
AYP	LIM	2I 
IQT	PCL	2I 
IQT	TPP	2I 
LIM	AYP	2I 
LIM	PCL	2I 
LIM	TPP	2I 
PCL	IQT	2I 
PCL	LIM	2I 
PCL	TPP	2I 
TPP	IQT	2I 
TPP	LIM	2I 
TPP	PCL	2I 
ABJ	OUA	2J 
ACC	OUA	2J 
BKO	ABJ	2J 
BKO	DKR	2J 
BKO	OUA	2J 
COO	LFW	2J 
COO	OUA	2J 
DKR	BKO	2J 
DKR	OUA	2J 
LFW	OUA	2J 
NIM	OUA	2J 
OUA	ABJ	2J 
OUA	ACC	2J 
OUA	BKO	2J 
OUA	COO	2J 
OUA	DKR	2J 
OUA	LFW	2J 
OUA	NIM	2J 
BOG	GYE	2K 
BOG	UIO	2K 
CLO	GYE	2K 
GYE	BOG	2K 
GYE	CLO	2K 
GYE	UIO	2K 
UIO	BOG	2K 
UIO	GYE	2K 
BDS	ZRH	2L 
BOD	ZRH	2L 
BRS	ZRH	2L 
LCA	ZRH	2L 
ZRH	BDS	2L 
ZRH	BOD	2L 
ZRH	BRS	2L 
ZRH	LCA	2L 
ARN	HAD	2N 
ARN	KSD	2N 
ARN	MHQ	2N 
ARN	OER	2N 
ARN	POR	2N 
ARN	TRF	2N 
ARN	VBY	2N 
ARN	VXO	2N 
HAD	ARN	2N 
HAD	VXO	2N 
KSD	ARN	2N 
MHQ	ARN	2N 
MHQ	TKU	2N 
OER	ARN	2N 
OSL	VXO	2N 
POR	ARN	2N 
TKU	MHQ	2N 
TRF	ARN	2N 
VBY	ARN	2N 
VXO	ARN	2N 
VXO	OSL	2N 
BSO	MNL	2P 
BXU	MNL	2P 
CBO	MNL	2P 
CRM	MNL	2P 
DWC	MNL	2P 
GES	MNL	2P 
KLO	MNL	2P 
MNL	BSO	2P 
MNL	BXU	2P 
MNL	CBO	2P 
MNL	CRM	2P 
MNL	DWC	2P 
MNL	GES	2P 
MNL	KLO	2P 
MNL	PPS	2P 
MNL	RXS	2P 
MNL	TUG	2P 
PPS	MNL	2P 
RXS	MNL	2P 
TUG	MNL	2P 
AUX	PMW	2Z 
BRA	BSB	2Z 
BRA	SSA	2Z 
BSB	BRA	2Z 
BSB	OPS	2Z 
BSB	RAO	2Z 
CAC	GRU	2Z 
CGB	GYN	2Z 
CGB	OPS	2Z 
CGR	DOU	2Z 
DOU	CGR	2Z 
DOU	GRU	2Z 
GRU	CAC	2Z 
GRU	DOU	2Z 
GRU	RAO	2Z 
GRU	UBA	2Z 
GRU	UDI	2Z 
GYN	CGB	2Z 
GYN	PMW	2Z 
GYN	RAO	2Z 
GYN	UDI	2Z 
OPS	BSB	2Z 
OPS	CGB	2Z 
PLU	RAO	2Z 
PMW	AUX	2Z 
PMW	GYN	2Z 
RAO	BSB	2Z 
RAO	GRU	2Z 
RAO	GYN	2Z 
RAO	PLU	2Z 
RAO	UDI	2Z 
SSA	BRA	2Z 
UBA	GRU	2Z 
UBA	UDI	2Z 
UDI	GRU	2Z 
UDI	GYN	2Z 
UDI	RAO	2Z 
UDI	UBA	2Z 
BRL	ORD	3E 
BRL	STL	3E 
DEC	ORD	3E 
DEC	STL	3E 
JBR	STL	3E 
ORD	BRL	3E 
ORD	DEC	3E 
STL	BRL	3E 
STL	DEC	3E 
STL	JBR	3E 
ACC	DKR	3G 
ACC	LOS	3G 
ACC	ROB	3G 
BCN	BJL	3G 
BJL	BCN	3G 
BJL	DKR	3G 
BJL	FNA	3G 
CKY	OXB	3G 
DKR	ACC	3G 
DKR	BJL	3G 
DKR	DLA	3G 
DKR	FNA	3G 
DKR	LOS	3G 
DKR	OXB	3G 
DLA	DKR	3G 
DLA	LOS	3G 
FNA	BJL	3G 
FNA	DKR	3G 
FNA	LGW	3G 
FNA	ROB	3G 
LGW	FNA	3G 
LOS	ACC	3G 
LOS	DKR	3G 
LOS	DLA	3G 
LOS	ROB	3G 
OXB	CKY	3G 
OXB	DKR	3G 
ROB	ACC	3G 
ROB	FNA	3G 
ROB	LOS	3G 
JIB	DXB	3J 
JIB	JED	3J 
JIB	MGQ	3J 
MGQ	NBO	3J 
NBO	MGQ	3J 
BKK	SIN	3K 
DRW	SIN	3K 
HAK	SIN	3K 
HGH	SIN	3K 
HKG	SIN	3K 
HKT	SIN	3K 
KIX	MNL	3K 
KIX	TPE	3K 
KUL	SIN	3K 
MNL	KIX	3K 
MNL	SIN	3K 
PER	SIN	3K 
SGN	SIN	3K 
SIN	BKK	3K 
SIN	DRW	3K 
SIN	HAK	3K 
SIN	HGH	3K 
SIN	HKG	3K 
SIN	HKT	3K 
SIN	KUL	3K 
SIN	MNL	3K 
SIN	PER	3K 
SIN	SGN	3K 
SIN	SWA	3K 
SIN	TPE	3K 
SWA	SIN	3K 
TPE	KIX	3K 
TPE	SIN	3K 
DRS	ZRH	3L 
FDH	HAM	3L 
FDH	OLB	3L 
FDH	TXL	3L 
FDH	ZAD	3L 
FMM	NAP	3L 
GRZ	ZRH	3L 
HAM	FDH	3L 
NAP	FMM	3L 
OLB	FDH	3L 
SZG	ZRH	3L 
TXL	FDH	3L 
ZAD	FDH	3L 
ZRH	DRS	3L 
ZRH	GRZ	3L 
ZRH	SZG	3L 
ATL	LWB	3M 
ATL	MCN	3M 
ATL	MEI	3M 
ATL	MSL	3M 
ATL	TUP	3M 
EYW	FLL	3M 
EYW	RSW	3M 
EYW	TPA	3M 
FLL	EYW	3M 
FLL	MCO	3M 
FLL	TPA	3M 
GLH	TUP	3M 
GNV	MCO	3M 
GNV	TPA	3M 
JAX	TPA	3M 
LWB	ATL	3M 
MCN	ATL	3M 
MCN	MCO	3M 
MCO	FLL	3M 
MCO	GNV	3M 
MCO	MCN	3M 
MCO	PNS	3M 
MCO	RSW	3M 
MCO	TLH	3M 
MEI	ATL	3M 
MSL	ATL	3M 
PBI	TPA	3M 
PNS	MCO	3M 
PNS	TPA	3M 
RSW	EYW	3M 
RSW	MCO	3M 
TLH	MCO	3M 
TLH	TPA	3M 
TPA	EYW	3M 
TPA	FLL	3M 
TPA	GNV	3M 
TPA	JAX	3M 
TPA	PBI	3M 
TPA	PNS	3M 
TPA	TLH	3M 
TUP	ATL	3M 
TUP	GLH	3M 
BCN	CMN	3O 
BGY	CMN	3O 
BLQ	CMN	3O 
BRU	CMN	3O 
CMN	BCN	3O 
CMN	BGY	3O 
CMN	BLQ	3O 
CMN	BRU	3O 
CMN	LGW	3O 
CMN	LYS	3O 
CMN	MPL	3O 
CMN	SAW	3O 
CMN	TLS	3O 
CMN	TSF	3O 
FEZ	MPL	3O 
LGW	CMN	3O 
LYS	CMN	3O 
MPL	CMN	3O 
MPL	FEZ	3O 
SAW	CMN	3O 
TLS	CMN	3O 
TSF	CMN	3O 
AUA	MAR	3P 
MAR	AUA	3P 
ASF	DME	3R 
BHK	DME	3R 
DME	ASF	3R 
DME	BHK	3R 
DME	EGO	3R 
DME	NMA	3R 
DME	SKD	3R 
DME	TIV	3R 
EGO	DME	3R 
NMA	DME	3R 
SKD	DME	3R 
TIV	DME	3R 
BHY	XIY	3U 
CAN	CKG	3U 
CAN	CTU	3U 
CGO	CGQ	3U 
CGO	CKG	3U 
CGO	CTU	3U 
CGO	HGH	3U 
CGO	HRB	3U 
CGO	KMG	3U 
CGO	URC	3U 
CGQ	CGO	3U 
CGQ	NKG	3U 
CGQ	TNA	3U 
CGQ	TSN	3U 
CKG	CAN	3U 
CKG	CGO	3U 
CKG	CTU	3U 
CKG	CZX	3U 
CKG	DLC	3U 
CKG	HAK	3U 
CKG	HGH	3U 
CKG	HKT	3U 
CKG	KHN	3U 
CKG	KMG	3U 
CKG	LHW	3U 
CKG	LXA	3U 
CKG	NKG	3U 
CKG	NNG	3U 
CKG	PEK	3U 
CKG	PVG	3U 
CKG	SWA	3U 
CKG	SYD	3U 
CKG	SYX	3U 
CKG	SZX	3U 
CKG	TNA	3U 
CKG	TSA	3U 
CKG	TSN	3U 
CKG	TYN	3U 
CKG	URC	3U 
CKG	WUH	3U 
CKG	WUX	3U 
CKG	XIY	3U 
CKG	XNN	3U 
CKG	ZHA	3U 
CTU	CAN	3U 
CTU	CGO	3U 
CTU	CKG	3U 
CTU	HAK	3U 
CTU	HDG	3U 
CTU	HET	3U 
CTU	HFE	3U 
CTU	HGH	3U 
CTU	HKG	3U 
CTU	HKT	3U 
CTU	ICN	3U 
CTU	KHN	3U 
CTU	KMG	3U 
CTU	KOW	3U 
CTU	KWE	3U 
CTU	LHW	3U 
CTU	LXA	3U 
CTU	MEL	3U 
CTU	NKG	3U 
CTU	NNG	3U 
CTU	PEK	3U 
CTU	PVG	3U 
CTU	SHE	3U 
CTU	SJW	3U 
CTU	SYX	3U 
CTU	SZX	3U 
CTU	TAO	3U 
CTU	TNA	3U 
CTU	TSA	3U 
CTU	TSN	3U 
CTU	TYN	3U 
CTU	URC	3U 
CTU	WNZ	3U 
CTU	WUH	3U 
CTU	WUX	3U 
CTU	XIC	3U 
CTU	XIY	3U 
CTU	XMN	3U 
CTU	XNN	3U 
CTU	YTY	3U 
CZX	CKG	3U 
CZX	HRB	3U 
CZX	XMN	3U 
CZX	ZUH	3U 
DLC	CKG	3U 
DLC	HGH	3U 
DLC	HRB	3U 
DLC	TNA	3U 
DNH	LHW	3U 
FOC	XIY	3U 
HAK	CKG	3U 
HAK	CTU	3U 
HAK	HGH	3U 
HAK	ZUH	3U 
HDG	CTU	3U 
HET	CTU	3U 
HFE	CTU	3U 
HGH	CGO	3U 
HGH	CKG	3U 
HGH	CTU	3U 
HGH	DLC	3U 
HGH	HAK	3U 
HGH	KWE	3U 
HGH	TSN	3U 
HGH	TYN	3U 
HKG	CTU	3U 
HKG	ZHA	3U 
HKT	CKG	3U 
HKT	CTU	3U 
HRB	CGO	3U 
HRB	CZX	3U 
HRB	DLC	3U 
HRB	NKG	3U 
HRB	NZH	3U 
HRB	SJW	3U 
HRB	TNA	3U 
HRB	TSN	3U 
HRB	WNZ	3U 
HRB	WUH	3U 
HRB	XIY	3U 
ICN	CTU	3U 
JGN	LHW	3U 
JJN	KWE	3U 
JJN	WUH	3U 
KHN	CKG	3U 
KHN	CTU	3U 
KHN	KMG	3U 
KMG	CGO	3U 
KMG	CKG	3U 
KMG	CTU	3U 
KMG	KHN	3U 
KMG	KWE	3U 
KMG	NKG	3U 
KMG	TAO	3U 
KMG	TNA	3U 
KMG	TPE	3U 
KMG	XIY	3U 
KMG	XMN	3U 
KOW	CTU	3U 
KOW	XMN	3U 
KWE	CTU	3U 
KWE	HGH	3U 
KWE	JJN	3U 
KWE	KMG	3U 
KWE	LHW	3U 
KWE	SYX	3U 
KWE	WNZ	3U 
KWL	SJW	3U 
KWL	SYX	3U 
LHW	CKG	3U 
LHW	CTU	3U 
LHW	DNH	3U 
LHW	JGN	3U 
LHW	KWE	3U 
LHW	TSN	3U 
LXA	CKG	3U 
LXA	CTU	3U 
LXA	XIY	3U 
LXA	XNN	3U 
LYI	XIY	3U 
MEL	CTU	3U 
MIG	NKG	3U 
MIG	SYX	3U 
MIG	XNN	3U 
NKG	CGQ	3U 
NKG	CKG	3U 
NKG	CTU	3U 
NKG	HRB	3U 
NKG	KMG	3U 
NKG	MIG	3U 
NKG	SYX	3U 
NNG	CKG	3U 
NNG	CTU	3U 
NNG	SGN	3U 
NNG	WUH	3U 
NZH	HRB	3U 
PEK	CKG	3U 
PEK	CTU	3U 
PEK	ZHY	3U 
PVG	CKG	3U 
PVG	CTU	3U 
SGN	NNG	3U 
SHE	CTU	3U 
SHE	TYN	3U 
SHE	YVR	3U 
SJW	CTU	3U 
SJW	HRB	3U 
SJW	KWL	3U 
SWA	CKG	3U 
SYD	CKG	3U 
SYX	CKG	3U 
SYX	CTU	3U 
SYX	KWE	3U 
SYX	KWL	3U 
SYX	MIG	3U 
SYX	NKG	3U 
SYX	TNA	3U 
SYX	WNZ	3U 
SYX	YBP	3U 
SZX	CKG	3U 
SZX	CTU	3U 
TAO	CTU	3U 
TAO	KMG	3U 
TNA	CGQ	3U 
TNA	CKG	3U 
TNA	CTU	3U 
TNA	DLC	3U 
TNA	HRB	3U 
TNA	KMG	3U 
TNA	SYX	3U 
TNA	XIY	3U 
TPE	KMG	3U 
TSA	CKG	3U 
TSA	CTU	3U 
TSN	CGQ	3U 
TSN	CKG	3U 
TSN	CTU	3U 
TSN	HGH	3U 
TSN	HRB	3U 
TSN	LHW	3U 
TYN	CKG	3U 
TYN	CTU	3U 
TYN	HGH	3U 
TYN	SHE	3U 
URC	CGO	3U 
URC	CKG	3U 
URC	CTU	3U 
URC	XIY	3U 
UYN	XIY	3U 
WNZ	CTU	3U 
WNZ	HRB	3U 
WNZ	KWE	3U 
WNZ	SYX	3U 
WUH	CKG	3U 
WUH	CTU	3U 
WUH	HRB	3U 
WUH	JJN	3U 
WUH	NNG	3U 
WUX	CKG	3U 
WUX	CTU	3U 
XIC	CTU	3U 
XIY	BHY	3U 
XIY	CKG	3U 
XIY	CTU	3U 
XIY	FOC	3U 
XIY	HRB	3U 
XIY	KMG	3U 
XIY	LXA	3U 
XIY	LYI	3U 
XIY	TNA	3U 
XIY	URC	3U 
XIY	UYN	3U 
XIY	XMN	3U 
XIY	XNN	3U 
XIY	YBP	3U 
XMN	CTU	3U 
XMN	CZX	3U 
XMN	KMG	3U 
XMN	KOW	3U 
XMN	XIY	3U 
XNN	CKG	3U 
XNN	CTU	3U 
XNN	LXA	3U 
XNN	MIG	3U 
XNN	XIY	3U 
XNN	ZHY	3U 
YBP	SYX	3U 
YBP	XIY	3U 
YTY	CTU	3U 
YVR	SHE	3U 
ZHA	CKG	3U 
ZHA	HKG	3U 
ZHY	PEK	3U 
ZHY	XNN	3U 
ZUH	CZX	3U 
ZUH	HAK	3U 
LAS	LAX	4B 
LAX	LAS	4B 
NCU	VKO	4G 
NYM	VKO	4G 
UCT	VKO	4G 
VKO	NCU	4G 
VKO	NYM	4G 
VKO	UCT	4G 
BKK	DAC	4H 
CCU	DAC	4H 
DAC	BKK	4H 
DAC	CCU	4H 
DAC	DXB	4H 
DAC	JED	4H 
DAC	JSR	4H 
DAC	KTM	4H 
DAC	KUL	4H 
DAC	MCT	4H 
DAC	SPD	4H 
DXB	DAC	4H 
JED	DAC	4H 
JSR	DAC	4H 
KTM	DAC	4H 
KUL	DAC	4H 
MCT	DAC	4H 
RJH	DAC	4H 
SPD	DAC	4H 
SPD	RJH	4H 
EZE	JFK	4M 
EZE	MIA	4M 
JFK	EZE	4M 
MIA	EZE	4M 
YEG	YXY	4N 
YLW	YVR	4N 
YLW	YXY	4N 
YOW	YZF	4N 
YVR	YLW	4N 
YVR	YXY	4N 
YXY	YLW	4N 
YXY	YVR	4N 
YXY	YYC	4N 
YXY	YZF	4N 
YYC	YEG	4N 
YZF	YOW	4N 
YZF	YXY	4N 
AGU	MEX	4O 
BOG	MEX	4O 
CEN	MEX	4O 
CPE	MEX	4O 
CTM	MEX	4O 
CUL	MEX	4O 
CUN	MEX	4O 
CUN	MTY	4O 
CUN	TLC	4O 
CUU	MEX	4O 
CZM	MEX	4O 
GDL	MEX	4O 
GDL	MTY	4O 
GDL	SAT	4O 
GDL	SNA	4O 
GDL	TIJ	4O 
GUA	MEX	4O 
HAV	MEX	4O 
HMO	MEX	4O 
JFK	MEX	4O 
LAP	MEX	4O 
LAS	MTY	4O 
LAS	TLC	4O 
MEX	AGU	4O 
MEX	BOG	4O 
MEX	CEN	4O 
MEX	CPE	4O 
MEX	CTM	4O 
MEX	CUL	4O 
MEX	CUN	4O 
MEX	CUU	4O 
MEX	CZM	4O 
MEX	GDL	4O 
MEX	GUA	4O 
MEX	HAV	4O 
MEX	HMO	4O 
MEX	JFK	4O 
MEX	LAP	4O 
MEX	MIA	4O 
MEX	MID	4O 
MEX	MTT	4O 
MEX	MTY	4O 
MEX	MZT	4O 
MEX	OAX	4O 
MEX	PVR	4O 
MEX	REX	4O 
MEX	SAT	4O 
MEX	SJO	4O 
MEX	SNA	4O 
MEX	TAM	4O 
MEX	TIJ	4O 
MEX	TRC	4O 
MEX	VSA	4O 
MEX	ZCL	4O 
MEX	ZIH	4O 
MEX	ZLO	4O 
MIA	MEX	4O 
MID	MEX	4O 
MTT	MEX	4O 
MTY	CUN	4O 
MTY	GDL	4O 
MTY	LAS	4O 
MTY	MEX	4O 
MTY	SAT	4O 
MTY	TLC	4O 
MZT	MEX	4O 
OAX	MEX	4O 
PVR	MEX	4O 
PVR	TLC	4O 
REX	MEX	4O 
SAT	GDL	4O 
SAT	MEX	4O 
SAT	MTY	4O 
SAT	TLC	4O 
SJO	MEX	4O 
SNA	GDL	4O 
SNA	MEX	4O 
TAM	MEX	4O 
TIJ	GDL	4O 
TIJ	MEX	4O 
TLC	CUN	4O 
TLC	LAS	4O 
TLC	MTY	4O 
TLC	PVR	4O 
TLC	SAT	4O 
TLC	ZIH	4O 
TRC	MEX	4O 
VSA	MEX	4O 
ZCL	MEX	4O 
ZIH	MEX	4O 
ZIH	TLC	4O 
ZLO	MEX	4O 
DEL	HEA	4Q 
DEL	KBL	4Q 
DXB	KBL	4Q 
HEA	DEL	4Q 
HEA	ISB	4Q 
HEA	KBL	4Q 
ISB	HEA	4Q 
ISB	KBL	4Q 
KBL	DEL	4Q 
KBL	DXB	4Q 
KBL	HEA	4Q 
KBL	ISB	4Q 
AYT	ZRH	4T 
SKP	ZRH	4T 
ZRH	AYT	4T 
ZRH	SKP	4T 
AGP	STR	4U 
AGP	TXL	4U 
AMS	HAM	4U 
AOI	TXL	4U 
ARN	CGN	4U 
ARN	HAM	4U 
ATH	CGN	4U 
ATH	STR	4U 
AYT	CGN	4U 
BCN	CGN	4U 
BCN	HAJ	4U 
BCN	HAM	4U 
BCN	STR	4U 
BDS	STR	4U 
BEG	STR	4U 
BGO	HAM	4U 
BHX	HAM	4U 
BHX	TXL	4U 
BIA	CGN	4U 
BIA	HAM	4U 
BIA	STR	4U 
BIA	TXL	4U 
BIO	STR	4U 
BLQ	CGN	4U 
BLQ	TXL	4U 
BRE	STR	4U 
BRI	CGN	4U 
BRI	STR	4U 
BRU	STR	4U 
BUD	CGN	4U 
BUD	HAM	4U 
BUD	STR	4U 
CAG	CGN	4U 
CAG	STR	4U 
CDG	HAM	4U 
CGN	ARN	4U 
CGN	ATH	4U 
CGN	AYT	4U 
CGN	BCN	4U 
CGN	BIA	4U 
CGN	BLQ	4U 
CGN	BRI	4U 
CGN	BUD	4U 
CGN	CAG	4U 
CGN	CTA	4U 
CGN	DBV	4U 
CGN	DRS	4U 
CGN	DUB	4U 
CGN	EDI	4U 
CGN	FAO	4U 
CGN	FCO	4U 
CGN	FDH	4U 
CGN	HAM	4U 
CGN	IBZ	4U 
CGN	KGS	4U 
CGN	KLU	4U 
CGN	KVA	4U 
CGN	LEJ	4U 
CGN	LHR	4U 
CGN	LIS	4U 
CGN	MAN	4U 
CGN	NAP	4U 
CGN	NCE	4U 
CGN	OLB	4U 
CGN	PMO	4U 
CGN	PRG	4U 
CGN	PSA	4U 
CGN	PUY	4U 
CGN	RAK	4U 
CGN	RJK	4U 
CGN	RLG	4U 
CGN	SAW	4U 
CGN	SJJ	4U 
CGN	SKG	4U 
CGN	SPU	4U 
CGN	STN	4U 
CGN	SZG	4U 
CGN	TUN	4U 
CGN	TXL	4U 
CGN	VCE	4U 
CGN	VIE	4U 
CGN	WAW	4U 
CGN	ZAD	4U 
CGN	ZAG	4U 
CGN	ZRH	4U 
CTA	CGN	4U 
CTA	HAJ	4U 
CTA	HAM	4U 
CTA	STR	4U 
CTA	TXL	4U 
DBV	CGN	4U 
DBV	HAJ	4U 
DBV	HAM	4U 
DBV	STR	4U 
DBV	TXL	4U 
DRS	CGN	4U 
DRS	STR	4U 
DTM	MUC	4U 
DTM	SAW	4U 
DTM	SPU	4U 
DUB	CGN	4U 
EDI	CGN	4U 
FAO	CGN	4U 
FAO	HAM	4U 
FAO	STR	4U 
FCO	CGN	4U 
FCO	HAJ	4U 
FCO	HAM	4U 
FCO	STR	4U 
FCO	TXL	4U 
FDH	CGN	4U 
FMM	HAM	4U 
FMM	TXL	4U 
GVA	HAM	4U 
HAJ	BCN	4U 
HAJ	CTA	4U 
HAJ	DBV	4U 
HAJ	FCO	4U 
HAJ	NAP	4U 
HAJ	SAW	4U 
HAJ	SKG	4U 
HAJ	SPU	4U 
HAJ	STN	4U 
HAJ	STR	4U 
HAJ	VCE	4U 
HAJ	VIE	4U 
HAM	AMS	4U 
HAM	ARN	4U 
HAM	BCN	4U 
HAM	BGO	4U 
HAM	BHX	4U 
HAM	BIA	4U 
HAM	BUD	4U 
HAM	CDG	4U 
HAM	CGN	4U 
HAM	CTA	4U 
HAM	DBV	4U 
HAM	FAO	4U 
HAM	FCO	4U 
HAM	FMM	4U 
HAM	GVA	4U 
HAM	KLU	4U 
HAM	LHR	4U 
HAM	MAD	4U 
HAM	MAN	4U 
HAM	NAP	4U 
HAM	NCE	4U 
HAM	OLB	4U 
HAM	OSL	4U 
HAM	PRG	4U 
HAM	RJK	4U 
HAM	SAW	4U 
HAM	SKG	4U 
HAM	SPU	4U 
HAM	STR	4U 
HAM	TLS	4U 
HAM	VCE	4U 
HAM	VIE	4U 
HAM	ZRH	4U 
HEL	TXL	4U 
IBZ	CGN	4U 
IBZ	STR	4U 
IBZ	TXL	4U 
KGS	CGN	4U 
KLU	CGN	4U 
KLU	HAM	4U 
KLU	TXL	4U 
KRK	STR	4U 
KVA	CGN	4U 
KVA	STR	4U 
LEJ	CGN	4U 
LEJ	STR	4U 
LHR	CGN	4U 
LHR	HAM	4U 
LHR	STR	4U 
LHR	TXL	4U 
LIN	TXL	4U 
LIS	CGN	4U 
LIS	STR	4U 
MAD	HAM	4U 
MAN	CGN	4U 
MAN	HAM	4U 
MUC	DTM	4U 
NAP	CGN	4U 
NAP	HAJ	4U 
NAP	HAM	4U 
NAP	STR	4U 
NCE	CGN	4U 
NCE	HAM	4U 
NCE	TXL	4U 
OLB	CGN	4U 
OLB	HAM	4U 
OLB	STR	4U 
OSL	HAM	4U 
PMO	CGN	4U 
PRG	CGN	4U 
PRG	HAM	4U 
PSA	CGN	4U 
PUY	CGN	4U 
RAK	CGN	4U 
RJK	CGN	4U 
RJK	HAM	4U 
RJK	STR	4U 
RLG	CGN	4U 
RLG	STR	4U 
SAW	CGN	4U 
SAW	DTM	4U 
SAW	HAJ	4U 
SAW	HAM	4U 
SAW	STR	4U 
SAW	TXL	4U 
SJJ	CGN	4U 
SJJ	STR	4U 
SJJ	TXL	4U 
SKG	CGN	4U 
SKG	HAJ	4U 
SKG	HAM	4U 
SKG	STR	4U 
SPU	CGN	4U 
SPU	DTM	4U 
SPU	HAJ	4U 
SPU	HAM	4U 
SPU	STR	4U 
SPU	TXL	4U 
STN	CGN	4U 
STN	HAJ	4U 
STN	STR	4U 
STR	AGP	4U 
STR	ATH	4U 
STR	BCN	4U 
STR	BDS	4U 
STR	BEG	4U 
STR	BIA	4U 
STR	BIO	4U 
STR	BRE	4U 
STR	BRI	4U 
STR	BRU	4U 
STR	BUD	4U 
STR	CAG	4U 
STR	CTA	4U 
STR	DBV	4U 
STR	DRS	4U 
STR	FAO	4U 
STR	FCO	4U 
STR	HAJ	4U 
STR	HAM	4U 
STR	IBZ	4U 
STR	KRK	4U 
STR	KVA	4U 
STR	LEJ	4U 
STR	LHR	4U 
STR	LIS	4U 
STR	NAP	4U 
STR	OLB	4U 
STR	RJK	4U 
STR	RLG	4U 
STR	SAW	4U 
STR	SJJ	4U 
STR	SKG	4U 
STR	SPU	4U 
STR	STN	4U 
STR	TXL	4U 
STR	VIE	4U 
STR	ZAD	4U 
STR	ZAG	4U 
SZG	CGN	4U 
TLS	HAM	4U 
TUN	CGN	4U 
TXL	AGP	4U 
TXL	AOI	4U 
TXL	BHX	4U 
TXL	BIA	4U 
TXL	BLQ	4U 
TXL	CGN	4U 
TXL	CTA	4U 
TXL	DBV	4U 
TXL	FCO	4U 
TXL	FMM	4U 
TXL	HEL	4U 
TXL	IBZ	4U 
TXL	KLU	4U 
TXL	LHR	4U 
TXL	LIN	4U 
TXL	NCE	4U 
TXL	SAW	4U 
TXL	SJJ	4U 
TXL	SPU	4U 
TXL	STR	4U 
TXL	VIE	4U 
TXL	ZAD	4U 
VCE	CGN	4U 
VCE	HAJ	4U 
VCE	HAM	4U 
VIE	CGN	4U 
VIE	HAJ	4U 
VIE	HAM	4U 
VIE	STR	4U 
VIE	TXL	4U 
WAW	CGN	4U 
ZAD	CGN	4U 
ZAD	STR	4U 
ZAD	TXL	4U 
ZAG	CGN	4U 
ZAG	STR	4U 
ZRH	CGN	4U 
ZRH	HAM	4U 
FAI	CEM	4W 
BET	MLL	4Y 
DRK	SJO	5C 
LIR	SJO	5C 
LIR	SYQ	5C 
MGA	SJO	5C 
SJO	DRK	5C 
SJO	GLF	5C 
SJO	MGA	5C 
SYQ	LIR	5C 
ACC	KMS	5G 
KMS	ACC	5G 
EDL	LOK	5H 
EDL	NBO	5H 
JUB	NBO	5H 
KIS	EDL	5H 
KIS	NBO	5H 
LAU	MYD	5H 
LOK	EDL	5H 
MBA	NBO	5H 
MBA	ZNZ	5H 
MYD	LAU	5H 
MYD	NBO	5H 
NBO	EDL	5H 
NBO	JUB	5H 
NBO	KIS	5H 
NBO	LOK	5H 
NBO	MBA	5H 
NBO	MYD	5H 
ZNZ	MBA	5H 
BCD	DVO	5J 
BCD	MNL	5J 
BKI	MNL	5J 
BKK	MNL	5J 
BWN	MNL	5J 
BXU	MNL	5J 
CAN	MNL	5J 
CBO	MNL	5J 
CGK	MNL	5J 
CRK	HKG	5J 
CRK	MFM	5J 
CRK	SIN	5J 
DPL	DVO	5J 
DPL	MNL	5J 
DPS	MNL	5J 
DVO	BCD	5J 
DVO	DPL	5J 
DVO	ILO	5J 
DVO	MNL	5J 
DVO	PPS	5J 
DXB	MNL	5J 
GES	ILO	5J 
GES	MNL	5J 
HAN	MNL	5J 
HKG	CRK	5J 
HKG	ILO	5J 
HKG	MNL	5J 
HKT	MNL	5J 
ICN	KLO	5J 
ICN	MNL	5J 
ILO	DVO	5J 
ILO	GES	5J 
ILO	HKG	5J 
ILO	MNL	5J 
ILO	PPS	5J 
ILO	SIN	5J 
KIX	MNL	5J 
KLO	ICN	5J 
KLO	MNL	5J 
KUL	MNL	5J 
LAO	MNL	5J 
MFM	CRK	5J 
MFM	MNL	5J 
MNL	BCD	5J 
MNL	BKI	5J 
MNL	BKK	5J 
MNL	BWN	5J 
MNL	BXU	5J 
MNL	CAN	5J 
MNL	CBO	5J 
MNL	CGK	5J 
MNL	DPL	5J 
MNL	DPS	5J 
MNL	DVO	5J 
MNL	DXB	5J 
MNL	GES	5J 
MNL	HAN	5J 
MNL	HKG	5J 
MNL	HKT	5J 
MNL	ICN	5J 
MNL	ILO	5J 
MNL	KIX	5J 
MNL	KLO	5J 
MNL	KUL	5J 
MNL	LAO	5J 
MNL	MFM	5J 
MNL	NGO	5J 
MNL	PAG	5J 
MNL	PEK	5J 
MNL	PPS	5J 
MNL	PUS	5J 
MNL	PVG	5J 
MNL	RXS	5J 
MNL	SGN	5J 
MNL	SIN	5J 
MNL	SJI	5J 
MNL	TAC	5J 
MNL	TPE	5J 
MNL	TUG	5J 
MNL	VRC	5J 
MNL	WNP	5J 
MNL	XMN	5J 
NGO	MNL	5J 
PAG	MNL	5J 
PEK	MNL	5J 
PPS	DVO	5J 
PPS	ILO	5J 
PPS	MNL	5J 
PUS	MNL	5J 
PVG	MNL	5J 
RXS	MNL	5J 
SGN	MNL	5J 
SIN	CRK	5J 
SIN	ILO	5J 
SIN	MNL	5J 
SJI	MNL	5J 
TAC	MNL	5J 
TPE	MNL	5J 
TUG	MNL	5J 
VRC	MNL	5J 
WNP	MNL	5J 
XMN	MNL	5J 
ARH	MMK	5N 
ARH	SVO	5N 
ARH	USK	5N 
MMK	ARH	5N 
MMK	SVO	5N 
MMK	TOS	5N 
SCW	SVO	5N 
SVO	ARH	5N 
SVO	MMK	5N 
SVO	SCW	5N 
TOS	MMK	5N 
USK	ARH	5N 
ANF	IQQ	5P 
CCP	SCL	5P 
IQQ	SCL	5P 
SCL	ANF	5P 
AEP	MVD	5Q 
AEP	PDP	5Q 
ASU	MVD	5Q 
CWB	MVD	5Q 
EZE	MVD	5Q 
GRU	MVD	5Q 
MVD	AEP	5Q 
MVD	ASU	5Q 
MVD	CWB	5Q 
MVD	EZE	5Q 
MVD	GRU	5Q 
MVD	POA	5Q 
MVD	SCL	5Q 
PDP	AEP	5Q 
POA	MVD	5Q 
SCL	MVD	5Q 
YEG	YZF	5T 
YFB	YOW	5T 
YOW	YFB	5T 
YZF	YEG	5T 
BZE	FRS	5U 
FRS	BZE	5U 
FRS	GUA	5U 
GUA	FRS	5U 
GUA	SAP	5U 
GUA	TGU	5U 
RTB	GUA	5U 
SAP	GUA	5U 
TGU	GUA	5U 
BKK	CCU	6E 
BKK	DEL	6E 
BLR	BOM	6E 
BLR	CCU	6E 
BLR	COK	6E 
BLR	DEL	6E 
BLR	GAU	6E 
BLR	HYD	6E 
BLR	JAI	6E 
BLR	LKO	6E 
BLR	NAG	6E 
BLR	PNQ	6E 
BLR	VTZ	6E 
BOM	BLR	6E 
BOM	CCU	6E 
BOM	CJB	6E 
BOM	COK	6E 
BOM	DEL	6E 
BOM	DXB	6E 
BOM	GAU	6E 
BOM	HYD	6E 
BOM	IDR	6E 
BOM	IXC	6E 
BOM	IXJ	6E 
BOM	JAI	6E 
BOM	LKO	6E 
BOM	MCT	6E 
BOM	NAG	6E 
BOM	SXR	6E 
CCU	BKK	6E 
CCU	BLR	6E 
CCU	BOM	6E 
CCU	DEL	6E 
CCU	GAU	6E 
CCU	HYD	6E 
CCU	IMF	6E 
CCU	IXA	6E 
CCU	IXR	6E 
CCU	JAI	6E 
CCU	NAG	6E 
CCU	PNQ	6E 
CCU	RPR	6E 
CJB	BOM	6E 
CJB	DEL	6E 
COK	BLR	6E 
COK	BOM	6E 
COK	DEL	6E 
COK	DXB	6E 
COK	HYD	6E 
DEL	BKK	6E 
DEL	BLR	6E 
DEL	BOM	6E 
DEL	CCU	6E 
DEL	CJB	6E 
DEL	COK	6E 
DEL	DXB	6E 
DEL	GAU	6E 
DEL	HYD	6E 
DEL	IDR	6E 
DEL	IXJ	6E 
DEL	IXR	6E 
DEL	KTM	6E 
DEL	LKO	6E 
DEL	NAG	6E 
DEL	PNQ	6E 
DEL	RPR	6E 
DEL	SXR	6E 
DEL	VNS	6E 
DXB	BOM	6E 
DXB	COK	6E 
DXB	DEL	6E 
DXB	HYD	6E 
GAU	BLR	6E 
GAU	BOM	6E 
GAU	CCU	6E 
GAU	DEL	6E 
GAU	IMF	6E 
GAU	IXA	6E 
HYD	BLR	6E 
HYD	BOM	6E 
HYD	CCU	6E 
HYD	COK	6E 
HYD	DEL	6E 
HYD	DXB	6E 
HYD	JAI	6E 
HYD	PNQ	6E 
HYD	RPR	6E 
HYD	VTZ	6E 
IDR	BOM	6E 
IDR	DEL	6E 
IDR	NAG	6E 
IDR	RPR	6E 
IMF	CCU	6E 
IMF	GAU	6E 
IMF	IXA	6E 
IXA	CCU	6E 
IXA	GAU	6E 
IXA	IMF	6E 
IXC	BOM	6E 
IXJ	DEL	6E 
IXJ	SXR	6E 
IXR	BOM	6E 
IXR	CCU	6E 
IXR	DEL	6E 
JAI	BLR	6E 
JAI	BOM	6E 
JAI	CCU	6E 
JAI	HYD	6E 
KTM	DEL	6E 
LKO	BLR	6E 
LKO	BOM	6E 
LKO	DEL	6E 
MCT	BOM	6E 
NAG	BLR	6E 
NAG	BOM	6E 
NAG	CCU	6E 
NAG	DEL	6E 
NAG	IDR	6E 
NAG	PNQ	6E 
PNQ	BLR	6E 
PNQ	CCU	6E 
PNQ	DEL	6E 
PNQ	HYD	6E 
PNQ	NAG	6E 
RPR	CCU	6E 
RPR	DEL	6E 
RPR	HYD	6E 
RPR	IDR	6E 
SXR	BOM	6E 
SXR	DEL	6E 
SXR	IXJ	6E 
VNS	DEL	6E 
VTZ	BLR	6E 
VTZ	HYD	6E 
DME	KRR	6R 
IKT	ULK	6R 
KRR	DME	6R 
KRR	OVB	6R 
OVB	KRR	6R 
ULK	IKT	6R 
ULK	YKS	6R 
YKS	ULK	6R 
MGZ	TVY	6T 
TVY	MGZ	6T 
DME	RTW	6W 
EVN	RTW	6W 
PRG	RTW	6W 
RTW	DME	6W 
RTW	EVN	6W 
RTW	PRG	6W 
RTW	SVX	6W 
SVX	RTW	6W 
BKK	ICN	7C 
BKK	PUS	7C 
FUK	ICN	7C 
GMP	KIX	7C 
GMP	NGO	7C 
HKG	ICN	7C 
ICN	BKK	7C 
ICN	FUK	7C 
ICN	HKG	7C 
ICN	KIX	7C 
ICN	MNL	7C 
ICN	NGO	7C 
ICN	TAO	7C 
KIX	GMP	7C 
KIX	ICN	7C 
MNL	ICN	7C 
NGO	GMP	7C 
NGO	ICN	7C 
PUS	BKK	7C 
TAO	ICN	7C 
GWT	HAM	7E 
HAM	GWT	7E 
YEG	YZF	7F 
YFB	YOW	7F 
YOW	YFB	7F 
YZF	YEG	7F 
ADQ	ANC	7H 
ANC	ADQ	7H 
ANC	BET	7H 
ANC	ENA	7H 
ANC	FAI	7H 
ANC	HOM	7H 
BET	ANC	7H 
BET	MLL	7H 
ENA	ANC	7H 
FAI	ANC	7H 
HOM	ANC	7H 
AUA	CCS	7I 
AUA	LRM	7I 
AUA	MIA	7I 
AUA	VLN	7I 
CCS	AUA	7I 
LRM	AUA	7I 
MIA	AUA	7I 
VLN	AUA	7I 
AER	DYU	7J 
DEL	DYU	7J 
DME	DYU	7J 
DYU	AER	7J 
DYU	DEL	7J 
DYU	DME	7J 
DYU	FRU	7J 
DYU	IKA	7J 
DYU	IST	7J 
DYU	OVB	7J 
DYU	SGC	7J 
DYU	SHJ	7J 
DYU	SVX	7J 
DYU	URC	7J 
FRU	DYU	7J 
IKA	DYU	7J 
IST	DYU	7J 
OVB	DYU	7J 
SGC	DYU	7J 
SHJ	DYU	7J 
SVX	DYU	7J 
URC	DYU	7J 
CUN	CZM	7M 
CUN	MID	7M 
CZM	CUN	7M 
MID	CUN	7M 
MID	VSA	7M 
VSA	MID	7M 
DAV	SJO	7P 
SJO	DAV	7P 
CSY	DME	7R 
DME	CSY	7R 
DME	EGO	7R 
DME	ESL	7R 
DME	IJK	7R 
DME	MCX	7R 
DME	PES	7R 
DME	PEZ	7R 
DME	SKX	7R 
DME	ULV	7R 
DME	VKT	7R 
DME	VOZ	7R 
EGO	DME	7R 
EGO	KUF	7R 
EGO	ROV	7R 
ESL	DME	7R 
EVN	VOG	7R 
IJK	DME	7R 
KRO	SVX	7R 
KRR	VOG	7R 
KRR	VOZ	7R 
KUF	EGO	7R 
KUF	SVX	7R 
MCX	DME	7R 
OVB	SVX	7R 
PES	DME	7R 
PEZ	DME	7R 
ROV	EGO	7R 
ROV	VOG	7R 
SCW	SVX	7R 
SKX	DME	7R 
SVX	KRO	7R 
SVX	KUF	7R 
SVX	OVB	7R 
SVX	SCW	7R 
SVX	UFA	7R 
SVX	ULV	7R 
UFA	SVX	7R 
ULV	DME	7R 
ULV	SVX	7R 
VKT	DME	7R 
VOG	EVN	7R 
VOG	KRR	7R 
VOG	ROV	7R 
VOZ	DME	7R 
VOZ	KRR	7R 
BKK	CKG	8B 
BKK	HKT	8B 
BKK	ICN	8B 
CKG	BKK	8B 
CKG	HKT	8B 
CNX	ICN	8B 
HKT	BKK	8B 
HKT	CKG	8B 
HKT	ICN	8B 
ICN	BKK	8B 
ICN	CNX	8B 
ICN	HKT	8B 
AUA	CCS	8I 
AUA	MIA	8I 
AUA	VLN	8I 
CCS	AUA	8I 
MIA	AUA	8I 
VLN	AUA	8I 
BAV	XIY	8L 
CGO	KMG	8L 
CKG	KMG	8L 
CTU	KMG	8L 
CTU	TSN	8L 
DLC	TSN	8L 
DLC	WUH	8L 
DLU	KMG	8L 
FOC	NNG	8L 
HAK	KMG	8L 
HET	TYN	8L 
HFE	KMG	8L 
HFE	PVG	8L 
HGH	KMG	8L 
HGH	KOW	8L 
KMG	CGO	8L 
KMG	CKG	8L 
KMG	CTU	8L 
KMG	DLU	8L 
KMG	HAK	8L 
KMG	HFE	8L 
KMG	HGH	8L 
KMG	KOW	8L 
KMG	KWE	8L 
KMG	KWL	8L 
KMG	LHW	8L 
KMG	NNG	8L 
KMG	PEK	8L 
KMG	PVG	8L 
KMG	SYM	8L 
KMG	SYX	8L 
KMG	TNA	8L 
KMG	TYN	8L 
KMG	WUH	8L 
KMG	XIY	8L 
KMG	XNN	8L 
KMG	YIC	8L 
KOW	HGH	8L 
KOW	KMG	8L 
KWE	KMG	8L 
KWE	NKG	8L 
KWE	SIN	8L 
KWL	KMG	8L 
KWL	XMN	8L 
LHW	KMG	8L 
LHW	URC	8L 
NKG	KWE	8L 
NNG	FOC	8L 
NNG	KMG	8L 
PEK	KMG	8L 
PVG	HFE	8L 
PVG	KMG	8L 
SHA	YIC	8L 
SIN	KWE	8L 
SYM	KMG	8L 
SYX	KMG	8L 
TAO	WUH	8L 
TNA	KMG	8L 
TSN	CTU	8L 
TSN	DLC	8L 
TYN	HET	8L 
TYN	KMG	8L 
URC	LHW	8L 
URC	XNN	8L 
WUH	DLC	8L 
WUH	KMG	8L 
WUH	TAO	8L 
XIY	BAV	8L 
XIY	KMG	8L 
XMN	KWL	8L 
XNN	KMG	8L 
XNN	URC	8L 
YIC	KMG	8L 
YIC	SHA	8L 
YBL	YQQ	8P 
YBL	YVR	8P 
YLW	YXC	8P 
YPW	YVR	8P 
YQQ	YBL	8P 
YQQ	YVR	8P 
YVR	YBL	8P 
YVR	YPW	8P 
YVR	YQQ	8P 
YVR	YWL	8P 
YVR	YXC	8P 
YVR	YYJ	8P 
YVR	YZZ	8P 
YWL	YVR	8P 
YXC	YLW	8P 
YXC	YVR	8P 
YYJ	YVR	8P 
YZZ	YVR	8P 
ADA	IST	8Q 
ADB	IST	8Q 
AYT	IST	8Q 
AYT	KZN	8Q 
AYT	SVO	8Q 
CDG	IST	8Q 
ECN	IST	8Q 
ERZ	IST	8Q 
EZS	IST	8Q 
GNY	IST	8Q 
GZP	IST	8Q 
GZT	IST	8Q 
IST	ADA	8Q 
IST	ADB	8Q 
IST	AYT	8Q 
IST	CDG	8Q 
IST	ECN	8Q 
IST	ERZ	8Q 
IST	EZS	8Q 
IST	GNY	8Q 
IST	GZP	8Q 
IST	GZT	8Q 
IST	MLX	8Q 
IST	TZX	8Q 
KZN	AYT	8Q 
MLX	IST	8Q 
SVO	AYT	8Q 
TZX	IST	8Q 
AEP	PRA	8R 
AEP	ROS	8R 
AEP	SFN	8R 
BHI	REL	8R 
COR	MDZ	8R 
COR	ROS	8R 
CRD	NQN	8R 
CRD	REL	8R 
CRD	RGL	8R 
EQS	CRD	8R 
MDZ	COR	8R 
MDZ	NQN	8R 
NQN	CRD	8R 
NQN	MDZ	8R 
PDP	ROS	8R 
PRA	AEP	8R 
REL	BHI	8R 
REL	CRD	8R 
REL	EQS	8R 
RGA	RGL	8R 
RGL	CRD	8R 
RGL	RGA	8R 
RGL	USH	8R 
ROS	AEP	8R 
ROS	COR	8R 
ROS	PDP	8R 
SFN	AEP	8R 
AMM	BEN	8U 
AMM	TIP	8U 
BEN	AMM	8U 
BEN	CAI	8U 
BEN	CMN	8U 
BEN	IST	8U 
BEN	JED	8U 
BEN	TIP	8U 
BEN	TUN	8U 
CAI	BEN	8U 
CAI	TIP	8U 
CMN	BEN	8U 
CMN	TIP	8U 
DXB	TIP	8U 
FCO	TIP	8U 
HBE	TIP	8U 
IST	BEN	8U 
IST	TIP	8U 
JED	BEN	8U 
JED	TIP	8U 
SFA	TIP	8U 
TIP	AMM	8U 
TIP	BEN	8U 
TIP	CAI	8U 
TIP	CMN	8U 
TIP	FCO	8U 
TIP	HBE	8U 
TIP	IST	8U 
TIP	JED	8U 
TIP	SFA	8U 
TIP	TOB	8U 
TIP	TUN	8U 
TUN	BEN	8U 
TUN	TIP	8U 
BKI	PVG	9C 
BKK	PVG	9C 
CAN	SHA	9C 
CAN	SJW	9C 
CGD	KMG	9C 
CGD	SHA	9C 
CGQ	PVG	9C 
CKG	LYA	9C 
CKG	PVG	9C 
CKG	SHA	9C 
CKG	SJW	9C 
CNX	PVG	9C 
CTU	SHA	9C 
CTU	SJW	9C 
DLC	HGH	9C 
DLC	PVG	9C 
DLC	SJW	9C 
HET	SJW	9C 
HGH	DLC	9C 
HGH	KWL	9C 
HGH	SHE	9C 
HGH	SJW	9C 
HGH	SYX	9C 
HGH	SZX	9C 
HKG	PVG	9C 
HKT	PVG	9C 
HRB	PVG	9C 
HSG	PVG	9C 
JJN	SHA	9C 
KHH	PVG	9C 
KIX	PVG	9C 
KMG	CGD	9C 
KMG	MIG	9C 
KMG	PVG	9C 
KMG	SHA	9C 
KMG	SJW	9C 
KMG	ZYI	9C 
KWE	SHA	9C 
KWL	HGH	9C 
KWL	PVG	9C 
KWL	SJW	9C 
LHW	PVG	9C 
LYA	CKG	9C 
LYA	SHE	9C 
MFM	PVG	9C 
MIG	KMG	9C 
MIG	SHA	9C 
MIG	SHE	9C 
NKG	SHE	9C 
NNG	SHA	9C 
PVG	BKI	9C 
PVG	BKK	9C 
PVG	CGQ	9C 
PVG	CKG	9C 
PVG	CNX	9C 
PVG	DLC	9C 
PVG	HKG	9C 
PVG	HKT	9C 
PVG	HRB	9C 
PVG	KHH	9C 
PVG	KIX	9C 
PVG	KWL	9C 
PVG	MFM	9C 
PVG	NNG	9C 
PVG	SHE	9C 
PVG	SIN	9C 
PVG	SYX	9C 
PVG	TAK	9C 
PVG	TAO	9C 
PVG	TPE	9C 
PVG	XMN	9C 
PVG	ZHA	9C 
SHA	CAN	9C 
SHA	CGD	9C 
SHA	CKG	9C 
SHA	CTU	9C 
SHA	JJN	9C 
SHA	KMG	9C 
SHA	KWE	9C 
SHA	LHW	9C 
SHA	SJW	9C 
SHA	SWA	9C 
SHA	SYX	9C 
SHA	SZX	9C 
SHA	TAO	9C 
SHA	URC	9C 
SHA	XIY	9C 
SHA	XMN	9C 
SHA	ZUH	9C 
SHA	ZYI	9C 
SHE	HGH	9C 
SHE	LYA	9C 
SHE	MIG	9C 
SHE	NKG	9C 
SHE	PVG	9C 
SHE	SJW	9C 
SHE	SZX	9C 
SHE	XIY	9C 
SIN	PVG	9C 
SJW	CAN	9C 
SJW	CKG	9C 
SJW	CTU	9C 
SJW	DLC	9C 
SJW	HET	9C 
SJW	HGH	9C 
SJW	KMG	9C 
SJW	KWL	9C 
SJW	SHA	9C 
SJW	SHE	9C 
SJW	SZX	9C 
SJW	TPE	9C 
SJW	XMN	9C 
SWA	SHA	9C 
SYX	HGH	9C 
SYX	PVG	9C 
SYX	SHA	9C 
SZX	HGH	9C 
SZX	SHA	9C 
SZX	SHE	9C 
SZX	SJW	9C 
TAK	PVG	9C 
TAO	SHA	9C 
TPE	PVG	9C 
TPE	SJW	9C 
URC	SHA	9C 
URC	XIY	9C 
XIY	SHA	9C 
XIY	SHE	9C 
XIY	URC	9C 
XMN	PVG	9C 
XMN	SHA	9C 
XMN	SJW	9C 
ZHA	PVG	9C 
ZUH	PVG	9C 
ZUH	SHA	9C 
ZYI	KMG	9C 
ZYI	SHA	9C 
ATL	AZO	9E 
ATL	CHA	9E 
ATL	CID	9E 
ATL	CRW	9E 
ATL	CVG	9E 
ATL	EVV	9E 
ATL	FWA	9E 
ATL	GSO	9E 
ATL	GSP	9E 
ATL	LAN	9E 
ATL	MBS	9E 
ATL	MSP	9E 
ATL	SYR	9E 
ATL	TYS	9E 
ATL	XNA	9E 
AZO	ATL	9E 
CHA	ATL	9E 
CRW	ATL	9E 
CVG	ATL	9E 
DTW	MSY	9E 
EVV	ATL	9E 
FWA	ATL	9E 
GFK	TVF	9E 
GSO	ATL	9E 
GSP	ATL	9E 
JFK	MSY	9E 
LAN	ATL	9E 
LGA	MSY	9E 
MBS	ATL	9E 
MDT	ATL	9E 
MEM	MSY	9E 
MSP	ATL	9E 
MSP	MSY	9E 
MSY	DTW	9E 
MSY	JFK	9E 
MSY	LGA	9E 
MSY	MEM	9E 
MSY	MSP	9E 
SYR	ATL	9E 
TVF	GFK	9E 
TYS	ATL	9E 
XNA	ATL	9E 
ACK	BOS	9K 
ACK	EWB	9K 
ACK	HYA	9K 
ALB	BOS	9K 
ALB	MSS	9K 
ALB	OGS	9K 
AUG	BOS	9K 
BHB	BOS	9K 
BIL	GDV	9K 
BIL	GGW	9K 
BIL	HVR	9K 
BIL	SDY	9K 
BOS	ACK	9K 
BOS	ALB	9K 
BOS	AUG	9K 
BOS	BHB	9K 
BOS	HYA	9K 
BOS	LEB	9K 
BOS	RKD	9K 
BOS	RUT	9K 
BOS	SLK	9K 
CGI	STL	9K 
EWB	ACK	9K 
EWB	HPN	9K 
GDV	BIL	9K 
GGW	BIL	9K 
HPN	HYA	9K 
HPN	LEB	9K 
HVR	BIL	9K 
HYA	ACK	9K 
HYA	BOS	9K 
IRK	STL	9K 
LEB	BOS	9K 
LEB	HPN	9K 
MAZ	SJU	9K 
MSS	ALB	9K 
MWA	STL	9K 
OGS	ALB	9K 
OWB	STL	9K 
RKD	BOS	9K 
RUT	BOS	9K 
SDY	BIL	9K 
SJU	MAZ	9K 
SLK	BOS	9K 
STL	CGI	9K 
STL	IRK	9K 
STL	MWA	9K 
STL	OWB	9K 
STL	UIN	9K 
UIN	STL	9K 
YBL	YQQ	9M 
YBL	YVR	9M 
YDQ	YVR	9M 
YEG	YYC	9M 
YKA	YVR	9M 
YKA	YXS	9M 
YLL	YYC	9M 
YLW	YXS	9M 
YQQ	YBL	9M 
YQQ	YVR	9M 
YQZ	YVR	9M 
YQZ	YWL	9M 
YVR	YBL	9M 
YVR	YDQ	9M 
YVR	YKA	9M 
YVR	YQQ	9M 
YVR	YQZ	9M 
YVR	YWL	9M 
YWL	YQZ	9M 
YWL	YVR	9M 
YXS	YKA	9M 
YXS	YLW	9M 
YXS	YXT	9M 
YXS	YYC	9M 
YXS	YYD	9M 
YXT	YXS	9M 
YYC	YEG	9M 
YYC	YLL	9M 
YYC	YXS	9M 
YYD	YXS	9M 
BZE	CUN	9N 
BZE	FRS	9N 
BZE	MID	9N 
BZE	RTB	9N 
BZE	SAP	9N 
BZE	SPR	9N 
CUN	BZE	9N 
FRS	BZE	9N 
MID	BZE	9N 
RTB	BZE	9N 
SAP	BZE	9N 
SPR	BZE	9N 
AUC	BOG	9R 
BOG	AUC	9R 
BOG	BUN	9R 
BOG	EOH	9R 
BOG	FLA	9R 
BOG	IPI	9R 
BOG	MVP	9R 
BOG	PCR	9R 
BOG	PSO	9R 
BOG	TME	9R 
BOG	UIB	9R 
BOG	VVC	9R 
BUN	BOG	9R 
CLO	GPI	9R 
CLO	UIB	9R 
EOH	BOG	9R 
EOH	UIB	9R 
FLA	BOG	9R 
GPI	CLO	9R 
IPI	BOG	9R 
MVP	BOG	9R 
MVP	VVC	9R 
PCR	BOG	9R 
PCR	VVC	9R 
PSO	BOG	9R 
TME	BOG	9R 
UIB	BOG	9R 
UIB	CLO	9R 
UIB	EOH	9R 
VVC	BOG	9R 
VVC	MVP	9R 
VVC	PCR	9R 
AER	KIV	9U 
ATH	KIV	9U 
BLQ	KIV	9U 
BVA	KIV	9U 
DME	KIV	9U 
DUB	KIV	9U 
FCO	KIV	9U 
FRA	KIV	9U 
IST	KIV	9U 
KIV	AER	9U 
KIV	ATH	9U 
KIV	BLQ	9U 
KIV	BVA	9U 
KIV	DME	9U 
KIV	DUB	9U 
KIV	FCO	9U 
KIV	FRA	9U 
KIV	IST	9U 
KIV	LCA	9U 
KIV	LIS	9U 
KIV	OTP	9U 
KIV	SGC	9U 
KIV	STN	9U 
KIV	VCE	9U 
LCA	KIV	9U 
LIS	KIV	9U 
OTP	KIV	9U 
SGC	KIV	9U 
STN	KIV	9U 
VCE	KIV	9U 
AUA	CCS	9V 
AUA	MAR	9V 
BLA	CCS	9V 
BLA	MIA	9V 
BLA	PMV	9V 
BLA	PTY	9V 
BLA	VLN	9V 
BNS	CCS	9V 
CCS	AUA	9V 
CCS	BLA	9V 
CCS	BNS	9V 
CCS	MAR	9V 
CCS	MRD	9V 
CCS	VLV	9V 
MAR	AUA	9V 
MAR	CCS	9V 
MAR	VLN	9V 
MIA	BLA	9V 
MRD	CCS	9V 
PMV	BLA	9V 
PMV	CCS	9V 
PTY	BLA	9V 
VLN	BLA	9V 
VLN	MAR	9V 
VLV	CCS	9V 
ATQ	DEL	9W 
AUH	BLR	9W 
AUH	BOM	9W 
AUH	CCJ	9W 
AUH	COK	9W 
AUH	DEL	9W 
AUH	HYD	9W 
BHJ	BOM	9W 
BHO	BOM	9W 
BHO	DEL	9W 
BKK	BOM	9W 
BKK	DEL	9W 
BLR	AUH	9W 
BLR	BOM	9W 
BLR	CCU	9W 
BLR	CJB	9W 
BLR	COK	9W 
BLR	DEL	9W 
BLR	HYD	9W 
BLR	IDR	9W 
BLR	IXE	9W 
BLR	KUL	9W 
BLR	PNQ	9W 
BLR	VTZ	9W 
BOM	AUH	9W 
BOM	BHJ	9W 
BOM	BHO	9W 
BOM	BKK	9W 
BOM	BLR	9W 
BOM	BRU	9W 
BOM	CCJ	9W 
BOM	CCU	9W 
BOM	CJB	9W 
BOM	CMB	9W 
BOM	COK	9W 
BOM	DAC	9W 
BOM	DEL	9W 
BOM	DIU	9W 
BOM	DOH	9W 
BOM	DXB	9W 
BOM	HKG	9W 
BOM	HYD	9W 
BOM	IDR	9W 
BOM	IXC	9W 
BOM	IXE	9W 
BOM	IXU	9W 
BOM	JAI	9W 
BOM	JDH	9W 
BOM	JED	9W 
BOM	JNB	9W 
BOM	KTM	9W 
BOM	KUL	9W 
BOM	LHR	9W 
BOM	LKO	9W 
BOM	MCT	9W 
BOM	NAG	9W 
BOM	NBO	9W 
BOM	PNQ	9W 
BOM	RAJ	9W 
BOM	RPR	9W 
BOM	RUH	9W 
BOM	SIN	9W 
BOM	UDR	9W 
BOM	VTZ	9W 
BRU	BOM	9W 
BRU	DEL	9W 
BRU	EWR	9W 
BRU	YYZ	9W 
CCJ	AUH	9W 
CCJ	BOM	9W 
CCU	BLR	9W 
CCU	BOM	9W 
CCU	DAC	9W 
CCU	DEL	9W 
CCU	GAU	9W 
CCU	IXA	9W 
CCU	IXR	9W 
CCU	IXS	9W 
CCU	IXZ	9W 
CCU	VNS	9W 
CCU	VTZ	9W 
CJB	BLR	9W 
CJB	BOM	9W 
CMB	BOM	9W 
COK	AUH	9W 
COK	BLR	9W 
COK	BOM	9W 
COK	DOH	9W 
COK	MCT	9W 
COK	SHJ	9W 
DAC	BOM	9W 
DAC	CCU	9W 
DAC	DEL	9W 
DED	DEL	9W 
DEL	ATQ	9W 
DEL	AUH	9W 
DEL	BHO	9W 
DEL	BKK	9W 
DEL	BLR	9W 
DEL	BOM	9W 
DEL	BRU	9W 
DEL	CCU	9W 
DEL	DAC	9W 
DEL	DED	9W 
DEL	DOH	9W 
DEL	DXB	9W 
DEL	GAU	9W 
DEL	GOP	9W 
DEL	HKG	9W 
DEL	HYD	9W 
DEL	IDR	9W 
DEL	IXC	9W 
DEL	IXJ	9W 
DEL	IXR	9W 
DEL	JAI	9W 
DEL	JDH	9W 
DEL	KTM	9W 
DEL	KUL	9W 
DEL	LHR	9W 
DEL	LKO	9W 
DEL	PNQ	9W 
DEL	RPR	9W 
DEL	SIN	9W 
DEL	SXR	9W 
DEL	UDR	9W 
DEL	VNS	9W 
DIU	PBD	9W 
DOH	BOM	9W 
DOH	COK	9W 
DOH	DEL	9W 
DXB	BOM	9W 
DXB	DEL	9W 
DXB	IXE	9W 
EWR	BRU	9W 
GAU	CCU	9W 
GAU	DEL	9W 
GAU	IMF	9W 
GAU	IXS	9W 
GOP	DEL	9W 
HKG	BOM	9W 
HKG	DEL	9W 
HYD	AUH	9W 
HYD	BLR	9W 
HYD	BOM	9W 
HYD	DEL	9W 
HYD	KUL	9W 
HYD	PNQ	9W 
HYD	RJA	9W 
IDR	BLR	9W 
IDR	BOM	9W 
IDR	DEL	9W 
IDR	PNQ	9W 
IMF	GAU	9W 
IXA	CCU	9W 
IXC	BOM	9W 
IXC	DEL	9W 
IXE	BLR	9W 
IXE	BOM	9W 
IXE	DXB	9W 
IXJ	DEL	9W 
IXR	CCU	9W 
IXR	DEL	9W 
IXS	CCU	9W 
IXS	GAU	9W 
IXU	BOM	9W 
IXZ	CCU	9W 
JAI	BOM	9W 
JAI	DEL	9W 
JDH	BOM	9W 
JDH	DEL	9W 
JED	BOM	9W 
JNB	BOM	9W 
KTM	BOM	9W 
KTM	DEL	9W 
KUL	BLR	9W 
KUL	BOM	9W 
KUL	DEL	9W 
KUL	HYD	9W 
LHR	BOM	9W 
LHR	DEL	9W 
LKO	BOM	9W 
LKO	DEL	9W 
MCT	BOM	9W 
MCT	COK	9W 
NAG	BOM	9W 
NBO	BOM	9W 
PBD	BOM	9W 
PNQ	BLR	9W 
PNQ	BOM	9W 
PNQ	DEL	9W 
PNQ	HYD	9W 
PNQ	IDR	9W 
RAJ	BOM	9W 
RJA	HYD	9W 
RPR	BHO	9W 
RPR	BOM	9W 
RPR	DEL	9W 
RUH	BOM	9W 
SHJ	COK	9W 
SIN	BOM	9W 
SIN	DEL	9W 
SXR	DEL	9W 
UDR	BOM	9W 
UDR	DEL	9W 
VNS	CCU	9W 
VNS	DEL	9W 
VTZ	BLR	9W 
VTZ	BOM	9W 
VTZ	CCU	9W 
YYZ	BRU	9W 
JKH	SKG	A2 
KLX	SKG	A2 
SKG	JKH	A2 
SKG	KLX	A2 
ARN	KLX	A3 
ARN	SKG	A3 
ATH	AUH	A3 
ATH	BCN	A3 
ATH	BEG	A3 
ATH	BRU	A3 
ATH	BUD	A3 
ATH	CAI	A3 
ATH	CDG	A3 
ATH	CHQ	A3 
ATH	DME	A3 
ATH	FCO	A3 
ATH	FRA	A3 
ATH	GVA	A3 
ATH	HBE	A3 
ATH	IOA	A3 
ATH	IST	A3 
ATH	JKH	A3 
ATH	JKL	A3 
ATH	KGS	A3 
ATH	KVA	A3 
ATH	LCA	A3 
ATH	LHR	A3 
ATH	LYS	A3 
ATH	MAD	A3 
ATH	MAN	A3 
ATH	MJT	A3 
ATH	MRS	A3 
ATH	MUC	A3 
ATH	NTE	A3 
ATH	OSL	A3 
ATH	OTP	A3 
ATH	PHL	A3 
ATH	PRG	A3 
ATH	SKG	A3 
ATH	SOF	A3 
ATH	TBS	A3 
ATH	TIA	A3 
ATH	TXL	A3 
ATH	VIE	A3 
ATH	WAW	A3 
AUH	ATH	A3 
BCN	ATH	A3 
BEG	ATH	A3 
BRU	ATH	A3 
BUD	ATH	A3 
CAI	ATH	A3 
CDG	ATH	A3 
CDG	SKG	A3 
CHQ	ATH	A3 
CHQ	SKG	A3 
CPH	SKG	A3 
DME	ATH	A3 
DME	KGS	A3 
DME	SKG	A3 
FCO	ATH	A3 
FRA	ATH	A3 
FRA	SKG	A3 
GVA	ATH	A3 
GVA	OPO	A3 
HAJ	SKG	A3 
HBE	ATH	A3 
IOA	ATH	A3 
IST	ATH	A3 
JKH	ATH	A3 
JKL	ATH	A3 
JKL	KGS	A3 
KGS	ATH	A3 
KGS	DME	A3 
KGS	JKL	A3 
KLX	ARN	A3 
KLX	MUC	A3 
KVA	ATH	A3 
LCA	ATH	A3 
LCA	SKG	A3 
LHR	ATH	A3 
LYS	ATH	A3 
MAD	ATH	A3 
MAN	ATH	A3 
MJT	ATH	A3 
MJT	SKG	A3 
MRS	ATH	A3 
MUC	ATH	A3 
MUC	KLX	A3 
MUC	SKG	A3 
NTE	ATH	A3 
OSL	ATH	A3 
OTP	ATH	A3 
PHL	ATH	A3 
PRG	ATH	A3 
SKG	ARN	A3 
SKG	ATH	A3 
SKG	CDG	A3 
SKG	CHQ	A3 
SKG	CPH	A3 
SKG	DME	A3 
SKG	FRA	A3 
SKG	HAJ	A3 
SKG	LCA	A3 
SKG	MJT	A3 
SKG	MUC	A3 
SKG	STR	A3 
SOF	ATH	A3 
STR	SKG	A3 
TBS	ATH	A3 
TIA	ATH	A3 
TXL	ATH	A3 
VIE	ATH	A3 
WAW	ATH	A3 
ZRH	LIS	A3 
BYC	SRZ	A4 
BYC	TJA	A4 
CBB	TDD	A4 
CIJ	TDD	A4 
LPB	POI	A4 
LPB	SRZ	A4 
LPB	TDD	A4 
ORU	CBB	A4 
ORU	SRZ	A4 
POI	LPB	A4 
RIB	TDD	A4 
SRZ	BYC	A4 
SRZ	LPB	A4 
SRZ	ORU	A4 
SRZ	TDD	A4 
TDD	CBB	A4 
TDD	CIJ	A4 
TDD	LPB	A4 
TDD	RIB	A4 
TDD	SRZ	A4 
TJA	BYC	A4 
AGF	DCM	A5 
AGF	ORY	A5 
AJA	DCM	A5 
AJA	PIS	A5 
AMS	CFE	A5 
AMS	SXB	A5 
AUR	ORY	A5 
BES	LYS	A5 
BES	NCE	A5 
BIA	LIL	A5 
BLQ	LYS	A5 
BOD	FCO	A5 
BOD	LIL	A5 
BOD	LYS	A5 
BOD	NCE	A5 
BOD	NTE	A5 
BOD	SXB	A5 
BRU	LYS	A5 
BRU	NTE	A5 
CFE	AMS	A5 
CFE	LYS	A5 
CFE	NCE	A5 
CFR	LYS	A5 
CFR	NCE	A5 
CFR	ORY	A5 
DCM	AGF	A5 
DCM	AJA	A5 
DCM	ORY	A5 
ETZ	LYS	A5 
ETZ	NCE	A5 
FCO	BOD	A5 
FCO	LYS	A5 
FCO	SXB	A5 
FLR	LYS	A5 
LDE	ORY	A5 
LIL	BIA	A5 
LIL	BOD	A5 
LIL	LYS	A5 
LIL	MPL	A5 
LIL	NTE	A5 
LIL	SXB	A5 
LIL	TLS	A5 
LRH	ORY	A5 
LRH	PIS	A5 
LRT	ORY	A5 
LYS	BES	A5 
LYS	BLQ	A5 
LYS	BOD	A5 
LYS	BRU	A5 
LYS	CFE	A5 
LYS	CFR	A5 
LYS	ETZ	A5 
LYS	FCO	A5 
LYS	FLR	A5 
LYS	LIL	A5 
LYS	MPL	A5 
LYS	MRS	A5 
LYS	NTE	A5 
LYS	PIS	A5 
LYS	PRG	A5 
LYS	PUF	A5 
LYS	RNS	A5 
LYS	SXB	A5 
LYS	VCE	A5 
MPL	LIL	A5 
MPL	LYS	A5 
MPL	NTE	A5 
MPL	SXB	A5 
MRS	LYS	A5 
MRS	SXB	A5 
MRS	TLS	A5 
NCE	BES	A5 
NCE	BOD	A5 
NCE	CFE	A5 
NCE	CFR	A5 
NCE	ETZ	A5 
NCE	RNS	A5 
NCE	TLS	A5 
NTE	BOD	A5 
NTE	BRU	A5 
NTE	LIL	A5 
NTE	LYS	A5 
NTE	MPL	A5 
NTE	SXB	A5 
NTE	TLS	A5 
ORY	AGF	A5 
ORY	AUR	A5 
ORY	CFR	A5 
ORY	DCM	A5 
ORY	LDE	A5 
ORY	LRH	A5 
ORY	LRT	A5 
ORY	PGF	A5 
ORY	RDZ	A5 
ORY	UIP	A5 
PGF	ORY	A5 
PIS	AJA	A5 
PIS	LRH	A5 
PIS	LYS	A5 
PRG	LYS	A5 
PUF	LYS	A5 
RDZ	ORY	A5 
RNS	LYS	A5 
RNS	NCE	A5 
RNS	TLS	A5 
SXB	AMS	A5 
SXB	BOD	A5 
SXB	FCO	A5 
SXB	LIL	A5 
SXB	LYS	A5 
SXB	MPL	A5 
SXB	MRS	A5 
SXB	NTE	A5 
TLS	LIL	A5 
TLS	MRS	A5 
TLS	NCE	A5 
TLS	NTE	A5 
TLS	RNS	A5 
UIP	ORY	A5 
VCE	LYS	A5 
EBB	KSE	A8 
KSE	EBB	A8 
AMS	TBS	A9 
BUS	DME	A9 
BUS	TBS	A9 
CDG	TBS	A9 
DME	BUS	A9 
KUT	TBS	A9 
RIX	TBS	A9 
TBS	AMS	A9 
TBS	BUS	A9 
TBS	CDG	A9 
TBS	RIX	A9 
TBS	VIE	A9 
TBS	VKO	A9 
VIE	TBS	A9 
VKO	KUT	A9 
VKO	TBS	A9 
ABE	CLT	AA 
ABE	PHL	AA 
ABQ	LAX	AA 
ABQ	ORD	AA 
ABQ	PHX	AA 
ABZ	LHR	AA 
ACC	LHR	AA 
ADL	BNE	AA 
ADL	SYD	AA 
AGP	LHR	AA 
AKL	BNE	AA 
AKL	PPT	AA 
AKL	SYD	AA 
ALB	CLT	AA 
ALB	DCA	AA 
ALB	PHL	AA 
ALO	ORD	AA 
AMM	JFK	AA 
AMM	ORD	AA 
AMM	YUL	AA 
AMS	LHR	AA 
AMS	PHL	AA 
ANC	LAX	AA 
ANC	PHX	AA 
AQP	LIM	AA 
ARN	LHR	AA 
ART	ORD	AA 
ART	PHL	AA 
ASP	SYD	AA 
ASU	MIA	AA 
ATH	LHR	AA 
ATH	PHL	AA 
ATL	CLT	AA 
ATL	LHR	AA 
ATL	MIA	AA 
ATL	ORD	AA 
ATL	PHL	AA 
ATL	PHX	AA 
AUA	CLT	AA 
AUA	MIA	AA 
AUA	PHL	AA 
AUH	CMB	AA 
AUH	IAD	AA 
AUH	ISB	AA 
AUH	JFK	AA 
AUH	LHE	AA 
AUH	LHR	AA 
AUH	MCT	AA 
AUH	ORD	AA 
AUS	CLT	AA 
AUS	JFK	AA 
AUS	LAX	AA 
AUS	LHR	AA 
AUS	MSY	AA 
AUS	ORD	AA 
AUS	PHL	AA 
AUS	PHX	AA 
AVL	CLT	AA 
AVP	CLT	AA 
AVP	PHL	AA 
AZO	ORD	AA 
BCN	JFK	AA 
BCN	LHR	AA 
BCN	MIA	AA 
BCN	PHL	AA 
BDL	CLT	AA 
BDL	DCA	AA 
BDL	LAX	AA 
BDL	MIA	AA 
BDL	ORD	AA 
BDL	PHL	AA 
BDL	PIT	AA 
BFL	PHX	AA 
BGI	MIA	AA 
BGM	PHL	AA 
BGO	LHR	AA 
BGR	DCA	AA 
BGR	PHL	AA 
BHD	LHR	AA 
BHM	CLT	AA 
BHM	DCA	AA 
BHM	MIA	AA 
BHM	PHL	AA 
BJL	DKR	AA 
BKK	KUL	AA 
BLQ	LHR	AA 
BLR	LHR	AA 
BMI	ORD	AA 
BNA	CLT	AA 
BNA	DCA	AA 
BNA	JFK	AA 
BNA	LAX	AA 
BNA	LGA	AA 
BNA	MIA	AA 
BNA	ORD	AA 
BNA	PHL	AA 
BNE	ADL	AA 
BNE	AKL	AA 
BNE	CBR	AA 
BNE	CNS	AA 
BNE	DRW	AA 
BNE	LAX	AA 
BNE	MEL	AA 
BNE	PER	AA 
BNE	SYD	AA 
BNE	TSV	AA 
BOG	MIA	AA 
BOI	PHX	AA 
BOM	LHR	AA 
BOS	BUF	AA 
BOS	CLT	AA 
BOS	CUN	AA 
BOS	DCA	AA 
BOS	JFK	AA 
BOS	LAX	AA 
BOS	LGA	AA 
BOS	LHR	AA 
BOS	MAD	AA 
BOS	MDT	AA 
BOS	MIA	AA 
BOS	ORD	AA 
BOS	PDX	AA 
BOS	PHL	AA 
BOS	PHX	AA 
BOS	PIT	AA 
BOS	RIC	AA 
BOS	ROC	AA 
BOS	SAN	AA 
BOS	SEA	AA 
BOS	SYR	AA 
BRU	LHR	AA 
BRU	PHL	AA 
BSB	MIA	AA 
BSL	LHR	AA 
BTR	CLT	AA 
BTV	DCA	AA 
BTV	PHL	AA 
BUD	LHR	AA 
BUF	BOS	AA 
BUF	CLT	AA 
BUF	DCA	AA 
BUF	ORD	AA 
BUF	PHL	AA 
BUR	PDX	AA 
BUR	PHX	AA 
BUR	SEA	AA 
BWI	CLT	AA 
BWI	JFK	AA 
BWI	LHR	AA 
BWI	MIA	AA 
BWI	ORD	AA 
BWI	PHL	AA 
BWI	PHX	AA 
BZE	CLT	AA 
BZE	MIA	AA 
CAE	CLT	AA 
CAE	DCA	AA 
CAE	PHL	AA 
CAK	CLT	AA 
CAK	DCA	AA 
CAK	PHL	AA 
CBR	BNE	AA 
CBR	MEL	AA 
CBR	SYD	AA 
CCS	JFK	AA 
CCS	MIA	AA 
CCS	SJU	AA 
CDG	CLT	AA 
CDG	JFK	AA 
CDG	KUL	AA 
CDG	LHR	AA 
CDG	MIA	AA 
CDG	ORD	AA 
CDG	PHL	AA 
CHA	CLT	AA 
CHA	DCA	AA 
CHA	ORD	AA 
CHC	SYD	AA 
CHS	CLT	AA 
CHS	DCA	AA 
CHS	MIA	AA 
CHS	PHL	AA 
CID	ORD	AA 
CLE	CLT	AA 
CLE	JFK	AA 
CLE	MIA	AA 
CLE	ORD	AA 
CLE	PHL	AA 
CLO	MIA	AA 
CLT	ABE	AA 
CLT	ALB	AA 
CLT	ATL	AA 
CLT	AUA	AA 
CLT	AUS	AA 
CLT	AVL	AA 
CLT	AVP	AA 
CLT	BDL	AA 
CLT	BHM	AA 
CLT	BNA	AA 
CLT	BOS	AA 
CLT	BTR	AA 
CLT	BUF	AA 
CLT	BWI	AA 
CLT	BZE	AA 
CLT	CAE	AA 
CLT	CAK	AA 
CLT	CDG	AA 
CLT	CHA	AA 
CLT	CHS	AA 
CLT	CLE	AA 
CLT	CMH	AA 
CLT	CRW	AA 
CLT	CUN	AA 
CLT	CVG	AA 
CLT	CZM	AA 
CLT	DAB	AA 
CLT	DAY	AA 
CLT	DCA	AA 
CLT	DEN	AA 
CLT	DSM	AA 
CLT	DTW	AA 
CLT	DUB	AA 
CLT	EWN	AA 
CLT	EWR	AA 
CLT	FAY	AA 
CLT	FCO	AA 
CLT	FLL	AA 
CLT	FLO	AA 
CLT	FRA	AA 
CLT	GNV	AA 
CLT	GPT	AA 
CLT	GRU	AA 
CLT	GSO	AA 
CLT	GSP	AA 
CLT	HHH	AA 
CLT	HPN	AA 
CLT	HSV	AA 
CLT	HTS	AA 
CLT	IAD	AA 
CLT	IAH	AA 
CLT	ILM	AA 
CLT	IND	AA 
CLT	JAN	AA 
CLT	JAX	AA 
CLT	JFK	AA 
CLT	LAS	AA 
CLT	LAX	AA 
CLT	LGA	AA 
CLT	LHR	AA 
CLT	LIR	AA 
CLT	LIT	AA 
CLT	LYH	AA 
CLT	MBJ	AA 
CLT	MCI	AA 
CLT	MCO	AA 
CLT	MDT	AA 
CLT	MEM	AA 
CLT	MEX	AA 
CLT	MIA	AA 
CLT	MKE	AA 
CLT	MLB	AA 
CLT	MOB	AA 
CLT	MSP	AA 
CLT	MSY	AA 
CLT	MYR	AA 
CLT	NAS	AA 
CLT	OMA	AA 
CLT	ORD	AA 
CLT	ORF	AA 
CLT	PBI	AA 
CLT	PDX	AA 
CLT	PGV	AA 
CLT	PHF	AA 
CLT	PHL	AA 
CLT	PHX	AA 
CLT	PIT	AA 
CLT	PNS	AA 
CLT	PVD	AA 
CLT	PWM	AA 
CLT	RIC	AA 
CLT	ROC	AA 
CLT	RSW	AA 
CLT	SAN	AA 
CLT	SAT	AA 
CLT	SAV	AA 
CLT	SBY	AA 
CLT	SDF	AA 
CLT	SEA	AA 
CLT	SFO	AA 
CLT	SJO	AA 
CLT	SJU	AA 
CLT	SLC	AA 
CLT	SMF	AA 
CLT	SRQ	AA 
CLT	STL	AA 
CLT	SYR	AA 
CLT	TLH	AA 
CLT	TPA	AA 
CLT	TYS	AA 
CLT	VPS	AA 
CLT	XNA	AA 
CLT	YOW	AA 
CLT	YUL	AA 
CLT	YYZ	AA 
CMB	AUH	AA 
CMH	CLT	AA 
CMH	DCA	AA 
CMH	JFK	AA 
CMH	LAX	AA 
CMH	LGA	AA 
CMH	MIA	AA 
CMH	ORD	AA 
CMH	PHL	AA 
CMH	PHX	AA 
CMI	ORD	AA 
CNF	MIA	AA 
CNS	BNE	AA 
COU	ORD	AA 
CPH	LHR	AA 
CPT	LHR	AA 
CUN	BOS	AA 
CUN	CLT	AA 
CUN	JFK	AA 
CUN	MIA	AA 
CUN	ORD	AA 
CUN	PHL	AA 
CUN	PHX	AA 
CVG	CLT	AA 
CVG	DCA	AA 
CVG	JFK	AA 
CVG	MIA	AA 
CVG	ORD	AA 
CVG	PHL	AA 
CWB	POA	AA 
CZM	CLT	AA 
CZM	MIA	AA 
DAB	CLT	AA 
DAY	CLT	AA 
DAY	DCA	AA 
DAY	LGA	AA 
DAY	ORD	AA 
DAY	PHL	AA 
DCA	ALB	AA 
DCA	BDL	AA 
DCA	BGR	AA 
DCA	BHM	AA 
DCA	BNA	AA 
DCA	BOS	AA 
DCA	BTV	AA 
DCA	BUF	AA 
DCA	CAE	AA 
DCA	CAK	AA 
DCA	CHA	AA 
DCA	CHS	AA 
DCA	CLT	AA 
DCA	CMH	AA 
DCA	CRW	AA 
DCA	CVG	AA 
DCA	DAY	AA 
DCA	DSM	AA 
DCA	DTW	AA 
DCA	FAY	AA 
DCA	FLL	AA 
DCA	GSO	AA 
DCA	GSP	AA 
DCA	HHH	AA 
DCA	HPN	AA 
DCA	HSV	AA 
DCA	ILM	AA 
DCA	IND	AA 
DCA	ISP	AA 
DCA	JAN	AA 
DCA	JAX	AA 
DCA	JFK	AA 
DCA	LAS	AA 
DCA	LAX	AA 
DCA	LGA	AA 
DCA	LIT	AA 
DCA	MCI	AA 
DCA	MCO	AA 
DCA	MEM	AA 
DCA	MIA	AA 
DCA	MSP	AA 
DCA	MSY	AA 
DCA	MYR	AA 
DCA	NAS	AA 
DCA	OMA	AA 
DCA	ORD	AA 
DCA	ORF	AA 
DCA	PBI	AA 
DCA	PDX	AA 
DCA	PHL	AA 
DCA	PHX	AA 
DCA	PIT	AA 
DCA	PNS	AA 
DCA	PVD	AA 
DCA	PWM	AA 
DCA	ROC	AA 
DCA	RSW	AA 
DCA	SAN	AA 
DCA	SAV	AA 
DCA	SDF	AA 
DCA	SRQ	AA 
DCA	STL	AA 
DCA	SYR	AA 
DCA	TLH	AA 
DCA	TPA	AA 
DCA	TYS	AA 
DCA	VPS	AA 
DCA	YHZ	AA 
DCA	YUL	AA 
DCA	YYZ	AA 
DEL	LHR	AA 
DEN	CLT	AA 
DEN	LAX	AA 
DEN	LHR	AA 
DEN	MIA	AA 
DEN	ORD	AA 
DEN	PHL	AA 
DEN	PHX	AA 
DEN	SEA	AA 
DKR	BJL	AA 
DOH	IAD	AA 
DOH	IAH	AA 
DOH	JFK	AA 
DOH	ORD	AA 
DOH	PHL	AA 
DRO	PHX	AA 
DRW	BNE	AA 
DRW	SYD	AA 
DSM	CLT	AA 
DSM	DCA	AA 
DSM	ORD	AA 
DSM	PHX	AA 
DTW	CLT	AA 
DTW	DCA	AA 
DTW	LGA	AA 
DTW	MIA	AA 
DTW	ORD	AA 
DTW	PHL	AA 
DTW	PHX	AA 
DTW	YUL	AA 
DUB	CLT	AA 
DUB	JFK	AA 
DUB	LHR	AA 
DUB	ORD	AA 
DUB	PHL	AA 
DXB	LHR	AA 
EBB	LHR	AA 
EDI	LHR	AA 
ELM	PHL	AA 
ELP	LAX	AA 
ELP	ORD	AA 
ELP	PHX	AA 
ERI	PHL	AA 
EUG	LAX	AA 
EUG	PDX	AA 
EVV	ORD	AA 
EWN	CLT	AA 
EWR	CLT	AA 
EWR	HKG	AA 
EWR	LHR	AA 
EWR	MIA	AA 
EWR	ORD	AA 
EWR	ORY	AA 
EWR	PHL	AA 
EWR	PHX	AA 
EWR	SEA	AA 
EYW	MIA	AA 
EZE	JFK	AA 
EZE	MIA	AA 
FAR	ORD	AA 
FAT	LAX	AA 
FAT	PHX	AA 
FAY	CLT	AA 
FAY	DCA	AA 
FCO	CLT	AA 
FCO	JFK	AA 
FCO	LHR	AA 
FCO	ORD	AA 
FCO	PHL	AA 
FLG	PHX	AA 
FLL	CLT	AA 
FLL	DCA	AA 
FLL	ORD	AA 
FLL	PHL	AA 
FLL	PHX	AA 
FLO	CLT	AA 
FNT	ORD	AA 
FRA	CLT	AA 
FRA	KUL	AA 
FRA	LHR	AA 
FRA	PHL	AA 
FSD	ORD	AA 
FWA	ORD	AA 
GDL	LAX	AA 
GDL	PHX	AA 
GDL	SJC	AA 
GEG	PHX	AA 
GIB	LHR	AA 
GJT	PHX	AA 
GLA	LHR	AA 
GLA	PHL	AA 
GNV	CLT	AA 
GNV	MIA	AA 
GPT	CLT	AA 
GRB	ORD	AA 
GRR	ORD	AA 
GRU	CLT	AA 
GRU	JFK	AA 
GRU	LAX	AA 
GRU	MCO	AA 
GRU	MIA	AA 
GSO	CLT	AA 
GSO	DCA	AA 
GSO	LGA	AA 
GSO	MIA	AA 
GSO	PHL	AA 
GSP	CLT	AA 
GSP	DCA	AA 
GSP	PHL	AA 
GUA	MIA	AA 
GVA	LHR	AA 
GYE	JFK	AA 
GYE	MIA	AA 
GYE	UIO	AA 
HAJ	LHR	AA 
HAM	LHR	AA 
HEL	JFK	AA 
HEL	LHR	AA 
HEL	MAN	AA 
HHH	CLT	AA 
HHH	DCA	AA 
HKG	EWR	AA 
HKG	JFK	AA 
HKG	LAX	AA 
HKG	ORD	AA 
HKG	SFO	AA 
HMO	PHX	AA 
HNL	KIX	AA 
HNL	LAX	AA 
HNL	NGO	AA 
HNL	OAK	AA 
HNL	PHX	AA 
HNL	SJC	AA 
HNL	SYD	AA 
HPN	CLT	AA 
HPN	DCA	AA 
HPN	ORD	AA 
HPN	PHL	AA 
HSV	CLT	AA 
HSV	DCA	AA 
HSV	ORD	AA 
HTS	CLT	AA 
HVN	PHL	AA 
HYD	LHR	AA 
IAD	AUH	AA 
IAD	CLT	AA 
IAD	DOH	AA 
IAD	LAX	AA 
IAD	LHR	AA 
IAD	MIA	AA 
IAH	CLT	AA 
IAH	DOH	AA 
IAH	LAX	AA 
IAH	LHR	AA 
IAH	MIA	AA 
IAH	ORD	AA 
IAH	PHL	AA 
IAH	PHX	AA 
ICT	ORD	AA 
ILM	CLT	AA 
ILM	DCA	AA 
ILM	LGA	AA 
ILM	PHL	AA 
IND	CLT	AA 
IND	DCA	AA 
IND	JFK	AA 
IND	LAX	AA 
IND	MIA	AA 
IND	ORD	AA 
IND	PHL	AA 
IND	PHX	AA 
IPT	PHL	AA 
ISB	AUH	AA 
ISP	DCA	AA 
ISP	PHL	AA 
IST	LHR	AA 
ITH	PHL	AA 
JAN	CLT	AA 
JAN	DCA	AA 
JAX	CLT	AA 
JAX	DCA	AA 
JAX	MIA	AA 
JAX	ORD	AA 
JAX	PHL	AA 
JFK	AMM	AA 
JFK	AUH	AA 
JFK	AUS	AA 
JFK	BCN	AA 
JFK	BNA	AA 
JFK	BOS	AA 
JFK	BWI	AA 
JFK	CCS	AA 
JFK	CDG	AA 
JFK	CLE	AA 
JFK	CLT	AA 
JFK	CMH	AA 
JFK	CUN	AA 
JFK	CVG	AA 
JFK	DCA	AA 
JFK	DOH	AA 
JFK	DUB	AA 
JFK	EZE	AA 
JFK	FCO	AA 
JFK	GRU	AA 
JFK	GYE	AA 
JFK	HEL	AA 
JFK	HKG	AA 
JFK	IND	AA 
JFK	LAS	AA 
JFK	LAX	AA 
JFK	LCY	AA 
JFK	LHR	AA 
JFK	LIM	AA 
JFK	MAD	AA 
JFK	MAN	AA 
JFK	MCO	AA 
JFK	MIA	AA 
JFK	ORD	AA 
JFK	ORF	AA 
JFK	ORY	AA 
JFK	PHX	AA 
JFK	PIT	AA 
JFK	SAN	AA 
JFK	SCL	AA 
JFK	SEA	AA 
JFK	SFO	AA 
JFK	SJO	AA 
JFK	SJU	AA 
JFK	TPA	AA 
JFK	TXL	AA 
JFK	YUL	AA 
JFK	YYC	AA 
JFK	YYZ	AA 
JFK	ZRH	AA 
JNB	LHR	AA 
JNU	KTN	AA 
JUL	AQP	AA 
KIN	MIA	AA 
KIX	HNL	AA 
KTN	JNU	AA 
KTN	SEA	AA 
KUL	BKK	AA 
KUL	CDG	AA 
KUL	FRA	AA 
KUL	LHR	AA 
KUL	SIN	AA 
LAS	CLT	AA 
LAS	DCA	AA 
LAS	JFK	AA 
LAS	LAX	AA 
LAS	LGW	AA 
LAS	LHR	AA 
LAS	MIA	AA 
LAS	ORD	AA 
LAS	PHL	AA 
LAS	PHX	AA 
LAS	YEG	AA 
LAS	YVR	AA 
LAS	YYC	AA 
LAS	YYZ	AA 
LAX	ABQ	AA 
LAX	ANC	AA 
LAX	AUS	AA 
LAX	BDL	AA 
LAX	BNA	AA 
LAX	BNE	AA 
LAX	BOS	AA 
LAX	CLT	AA 
LAX	CMH	AA 
LAX	DCA	AA 
LAX	DEN	AA 
LAX	ELP	AA 
LAX	EUG	AA 
LAX	FAT	AA 
LAX	GDL	AA 
LAX	GRU	AA 
LAX	HKG	AA 
LAX	HNL	AA 
LAX	IAD	AA 
LAX	IAH	AA 
LAX	IND	AA 
LAX	JFK	AA 
LAX	LAS	AA 
LAX	LHR	AA 
LAX	LIH	AA 
LAX	LIM	AA 
LAX	MAD	AA 
LAX	MCO	AA 
LAX	MEL	AA 
LAX	MEX	AA 
LAX	MFR	AA 
LAX	MIA	AA 
LAX	MMH	AA 
LAX	MRY	AA 
LAX	OGG	AA 
LAX	OKC	AA 
LAX	ORD	AA 
LAX	PBI	AA 
LAX	PDX	AA 
LAX	PHL	AA 
LAX	PHX	AA 
LAX	PIT	AA 
LAX	PPT	AA 
LAX	PVG	AA 
LAX	RNO	AA 
LAX	SAF	AA 
LAX	SAN	AA 
LAX	SEA	AA 
LAX	SFO	AA 
LAX	SJC	AA 
LAX	SLC	AA 
LAX	SMF	AA 
LAX	STL	AA 
LAX	STS	AA 
LAX	SYD	AA 
LAX	TUS	AA 
LAX	XNA	AA 
LAX	YEG	AA 
LAX	YVR	AA 
LAX	YYC	AA 
LAX	YYZ	AA 
LBA	LHR	AA 
LCA	LHR	AA 
LGA	BNA	AA 
LGA	BOS	AA 
LGA	CLT	AA 
LGA	CMH	AA 
LGA	DAY	AA 
LGA	DCA	AA 
LGA	DTW	AA 
LGA	GSO	AA 
LGA	ILM	AA 
LGA	LIT	AA 
LGA	MIA	AA 
LGA	ORD	AA 
LGA	ORF	AA 
LGA	PBI	AA 
LGA	PHL	AA 
LGA	PIT	AA 
LGA	RIC	AA 
LGA	SDF	AA 
LGA	STL	AA 
LGA	TYS	AA 
LGA	XNA	AA 
LGA	YUL	AA 
LGA	YYZ	AA 
LGB	PDX	AA 
LGB	PHX	AA 
LGB	SEA	AA 
LGW	LAS	AA 
LGW	MCO	AA 
LGW	TPA	AA 
LHE	AUH	AA 
LHR	ABZ	AA 
LHR	ACC	AA 
LHR	AGP	AA 
LHR	AMS	AA 
LHR	ARN	AA 
LHR	ATH	AA 
LHR	ATL	AA 
LHR	AUH	AA 
LHR	AUS	AA 
LHR	BCN	AA 
LHR	BGO	AA 
LHR	BHD	AA 
LHR	BLQ	AA 
LHR	BLR	AA 
LHR	BOM	AA 
LHR	BOS	AA 
LHR	BRU	AA 
LHR	BSL	AA 
LHR	BUD	AA 
LHR	BWI	AA 
LHR	CDG	AA 
LHR	CLT	AA 
LHR	CPH	AA 
LHR	CPT	AA 
LHR	DEL	AA 
LHR	DEN	AA 
LHR	DUB	AA 
LHR	DXB	AA 
LHR	EBB	AA 
LHR	EDI	AA 
LHR	EWR	AA 
LHR	FCO	AA 
LHR	FRA	AA 
LHR	GIB	AA 
LHR	GLA	AA 
LHR	GVA	AA 
LHR	HAJ	AA 
LHR	HAM	AA 
LHR	HEL	AA 
LHR	HYD	AA 
LHR	IAD	AA 
LHR	IAH	AA 
LHR	IST	AA 
LHR	JFK	AA 
LHR	JNB	AA 
LHR	KUL	AA 
LHR	LAS	AA 
LHR	LAX	AA 
LHR	LBA	AA 
LHR	LCA	AA 
LHR	LIN	AA 
LHR	LIS	AA 
LHR	LYS	AA 
LHR	MAN	AA 
LHR	MIA	AA 
LHR	MRS	AA 
LHR	MUC	AA 
LHR	NBO	AA 
LHR	NCE	AA 
LHR	NCL	AA 
LHR	ORD	AA 
LHR	OSL	AA 
LHR	OTP	AA 
LHR	PHL	AA 
LHR	PHX	AA 
LHR	PRG	AA 
LHR	PSA	AA 
LHR	RTM	AA 
LHR	SAN	AA 
LHR	SEA	AA 
LHR	SFO	AA 
LHR	SOF	AA 
LHR	STR	AA 
LHR	SVG	AA 
LHR	TLS	AA 
LHR	TXL	AA 
LHR	VCE	AA 
LHR	VIE	AA 
LHR	WAW	AA 
LHR	YUL	AA 
LHR	YVR	AA 
LHR	YYC	AA 
LHR	YYZ	AA 
LHR	ZAG	AA 
LHR	ZRH	AA 
LIH	LAX	AA 
LIH	OAK	AA 
LIH	PHX	AA 
LIH	SJC	AA 
LIM	JFK	AA 
LIM	LAX	AA 
LIM	MIA	AA 
LIM	SCL	AA 
LIN	LHR	AA 
LIR	CLT	AA 
LIR	MIA	AA 
LIR	SJO	AA 
LIS	LHR	AA 
LIS	PHL	AA 
LIT	CLT	AA 
LIT	DCA	AA 
LIT	LGA	AA 
LIT	ORD	AA 
LPB	VVI	AA 
LRM	MIA	AA 
LSE	ORD	AA 
LYH	CLT	AA 
LYS	LHR	AA 
MAD	BOS	AA 
MAD	JFK	AA 
MAD	LAX	AA 
MAD	MIA	AA 
MAD	ORD	AA 
MAD	PHL	AA 
MAN	HEL	AA 
MAN	JFK	AA 
MAN	LHR	AA 
MAN	ORD	AA 
MAN	PHL	AA 
MAO	MIA	AA 
MAR	MIA	AA 
MBJ	CLT	AA 
MBJ	MIA	AA 
MBJ	ORD	AA 
MBJ	PHL	AA 
MCI	CLT	AA 
MCI	DCA	AA 
MCI	ORD	AA 
MCI	PHL	AA 
MCI	PHX	AA 
MCI	SEA	AA 
MCO	CLT	AA 
MCO	DCA	AA 
MCO	GRU	AA 
MCO	JFK	AA 
MCO	LAX	AA 
MCO	LGW	AA 
MCO	MIA	AA 
MCO	ORD	AA 
MCO	PHL	AA 
MCO	PHX	AA 
MCO	SAN	AA 
MCO	SEA	AA 
MCO	YYZ	AA 
MCT	AUH	AA 
MDT	BOS	AA 
MDT	CLT	AA 
MDT	ORD	AA 
MDT	PHL	AA 
MEL	ADL	AA 
MEL	BNE	AA 
MEL	CBR	AA 
MEL	LAX	AA 
MEL	PER	AA 
MEL	SYD	AA 
MEM	CLT	AA 
MEM	DCA	AA 
MEM	MIA	AA 
MEM	ORD	AA 
MEX	CLT	AA 
MEX	LAX	AA 
MEX	MIA	AA 
MEX	ORD	AA 
MEX	PHX	AA 
MFR	LAX	AA 
MGA	MIA	AA 
MHK	ORD	AA 
MIA	ASU	AA 
MIA	ATL	AA 
MIA	AUA	AA 
MIA	BCN	AA 
MIA	BDL	AA 
MIA	BGI	AA 
MIA	BHM	AA 
MIA	BNA	AA 
MIA	BOG	AA 
MIA	BOS	AA 
MIA	BSB	AA 
MIA	BWI	AA 
MIA	BZE	AA 
MIA	CCS	AA 
MIA	CDG	AA 
MIA	CHS	AA 
MIA	CLE	AA 
MIA	CLO	AA 
MIA	CLT	AA 
MIA	CMH	AA 
MIA	CNF	AA 
MIA	CUN	AA 
MIA	CVG	AA 
MIA	CWB	AA 
MIA	CZM	AA 
MIA	DCA	AA 
MIA	DEN	AA 
MIA	DTW	AA 
MIA	EWR	AA 
MIA	EYW	AA 
MIA	EZE	AA 
MIA	GNV	AA 
MIA	GRU	AA 
MIA	GSO	AA 
MIA	GUA	AA 
MIA	GYE	AA 
MIA	IAD	AA 
MIA	IAH	AA 
MIA	IND	AA 
MIA	JAX	AA 
MIA	JFK	AA 
MIA	KIN	AA 
MIA	LAS	AA 
MIA	LAX	AA 
MIA	LGA	AA 
MIA	LHR	AA 
MIA	LIM	AA 
MIA	LIR	AA 
MIA	LPB	AA 
MIA	LRM	AA 
MIA	MAD	AA 
MIA	MAO	AA 
MIA	MAR	AA 
MIA	MBJ	AA 
MIA	MCO	AA 
MIA	MEM	AA 
MIA	MEX	AA 
MIA	MGA	AA 
MIA	MSP	AA 
MIA	MSY	AA 
MIA	MVD	AA 
MIA	NAS	AA 
MIA	ORD	AA 
MIA	ORF	AA 
MIA	PHL	AA 
MIA	PHX	AA 
MIA	PIT	AA 
MIA	PNS	AA 
MIA	POP	AA 
MIA	PTY	AA 
MIA	REC	AA 
MIA	RIC	AA 
MIA	RTB	AA 
MIA	SAL	AA 
MIA	SAN	AA 
MIA	SAP	AA 
MIA	SCL	AA 
MIA	SDF	AA 
MIA	SDQ	AA 
MIA	SEA	AA 
MIA	SFO	AA 
MIA	SJO	AA 
MIA	SJU	AA 
MIA	SSA	AA 
MIA	STI	AA 
MIA	STL	AA 
MIA	TGU	AA 
MIA	TLH	AA 
MIA	TPA	AA 
MIA	TUL	AA 
MIA	TXL	AA 
MIA	UIO	AA 
MIA	YUL	AA 
MIA	YYZ	AA 
MKE	CLT	AA 
MKE	ORD	AA 
MKE	PHL	AA 
MKE	PHX	AA 
MLB	CLT	AA 
MLI	ORD	AA 
MMH	LAX	AA 
MOB	CLT	AA 
MRS	LHR	AA 
MRY	LAX	AA 
MRY	PHX	AA 
MSN	ORD	AA 
MSP	CLT	AA 
MSP	DCA	AA 
MSP	MIA	AA 
MSP	ORD	AA 
MSP	PHL	AA 
MSP	PHX	AA 
MSY	AUS	AA 
MSY	CLT	AA 
MSY	DCA	AA 
MSY	MIA	AA 
MSY	ORD	AA 
MSY	PHL	AA 
MUC	LHR	AA 
MUC	PHL	AA 
MVD	MIA	AA 
MYR	CLT	AA 
MYR	DCA	AA 
MYR	PHL	AA 
MZT	PHX	AA 
NAS	CLT	AA 
NAS	DCA	AA 
NAS	MIA	AA 
NAS	PHL	AA 
NBO	LHR	AA 
NCE	LHR	AA 
NCL	LHR	AA 
NGO	HNL	AA 
OAK	HNL	AA 
OAK	LIH	AA 
OAK	OGG	AA 
OAK	PDX	AA 
OAK	PHX	AA 
OAK	SEA	AA 
OGG	LAX	AA 
OGG	OAK	AA 
OGG	PHX	AA 
OGG	SJC	AA 
OGG	SMF	AA 
OKC	LAX	AA 
OKC	ORD	AA 
OMA	CLT	AA 
OMA	DCA	AA 
OMA	ORD	AA 
OMA	PHX	AA 
ONT	PDX	AA 
ONT	PHX	AA 
ONT	SEA	AA 
ORD	ABQ	AA 
ORD	ALO	AA 
ORD	AMM	AA 
ORD	ART	AA 
ORD	ATL	AA 
ORD	AUH	AA 
ORD	AUS	AA 
ORD	AZO	AA 
ORD	BDL	AA 
ORD	BMI	AA 
ORD	BNA	AA 
ORD	BOS	AA 
ORD	BUF	AA 
ORD	BWI	AA 
ORD	CDG	AA 
ORD	CHA	AA 
ORD	CID	AA 
ORD	CLE	AA 
ORD	CLT	AA 
ORD	CMH	AA 
ORD	CMI	AA 
ORD	COU	AA 
ORD	CUN	AA 
ORD	CVG	AA 
ORD	DAY	AA 
ORD	DCA	AA 
ORD	DEN	AA 
ORD	DOH	AA 
ORD	DSM	AA 
ORD	DTW	AA 
ORD	DUB	AA 
ORD	ELP	AA 
ORD	EVV	AA 
ORD	EWR	AA 
ORD	FAR	AA 
ORD	FCO	AA 
ORD	FLL	AA 
ORD	FNT	AA 
ORD	FSD	AA 
ORD	FWA	AA 
ORD	GRB	AA 
ORD	GRR	AA 
ORD	HKG	AA 
ORD	HPN	AA 
ORD	HSV	AA 
ORD	IAH	AA 
ORD	ICT	AA 
ORD	IND	AA 
ORD	JAX	AA 
ORD	JFK	AA 
ORD	LAS	AA 
ORD	LAX	AA 
ORD	LGA	AA 
ORD	LHR	AA 
ORD	LIT	AA 
ORD	LSE	AA 
ORD	MAD	AA 
ORD	MAN	AA 
ORD	MBJ	AA 
ORD	MCI	AA 
ORD	MCO	AA 
ORD	MDT	AA 
ORD	MEM	AA 
ORD	MEX	AA 
ORD	MHK	AA 
ORD	MIA	AA 
ORD	MKE	AA 
ORD	MLI	AA 
ORD	MSN	AA 
ORD	MSP	AA 
ORD	MSY	AA 
ORD	OKC	AA 
ORD	OMA	AA 
ORD	PBI	AA 
ORD	PDX	AA 
ORD	PEK	AA 
ORD	PHL	AA 
ORD	PHX	AA 
ORD	PIA	AA 
ORD	PIT	AA 
ORD	PSP	AA 
ORD	PVG	AA 
ORD	PVR	AA 
ORD	RIC	AA 
ORD	RNO	AA 
ORD	ROC	AA 
ORD	RST	AA 
ORD	RSW	AA 
ORD	SAN	AA 
ORD	SAT	AA 
ORD	SDF	AA 
ORD	SEA	AA 
ORD	SFO	AA 
ORD	SGF	AA 
ORD	SJC	AA 
ORD	SJU	AA 
ORD	SLC	AA 
ORD	SNA	AA 
ORD	STL	AA 
ORD	SUX	AA 
ORD	SYR	AA 
ORD	TOL	AA 
ORD	TPA	AA 
ORD	TUL	AA 
ORD	TUS	AA 
ORD	TVC	AA 
ORD	TXL	AA 
ORD	TYS	AA 
ORD	XNA	AA 
ORD	YKF	AA 
ORD	YUL	AA 
ORD	YVR	AA 
ORD	YYC	AA 
ORD	YYZ	AA 
ORF	CLT	AA 
ORF	DCA	AA 
ORF	JFK	AA 
ORF	LGA	AA 
ORF	MIA	AA 
ORF	PHL	AA 
ORY	EWR	AA 
ORY	JFK	AA 
OSL	LHR	AA 
OTP	LHR	AA 
PBI	CLT	AA 
PBI	DCA	AA 
PBI	LAX	AA 
PBI	LGA	AA 
PBI	ORD	AA 
PBI	PHL	AA 
PDX	BOS	AA 
PDX	BUR	AA 
PDX	CLT	AA 
PDX	DCA	AA 
PDX	LAX	AA 
PDX	LGB	AA 
PDX	OAK	AA 
PDX	ONT	AA 
PDX	ORD	AA 
PDX	PHL	AA 
PDX	PHX	AA 
PDX	SAN	AA 
PDX	SFO	AA 
PDX	SJC	AA 
PDX	SNA	AA 
PDX	YVR	AA 
PEK	ORD	AA 
PEK	SEA	AA 
PER	BNE	AA 
PER	MEL	AA 
PER	SYD	AA 
PGV	CLT	AA 
PHF	CLT	AA 
PHF	PHL	AA 
PHL	ABE	AA 
PHL	ALB	AA 
PHL	AMS	AA 
PHL	ART	AA 
PHL	ATH	AA 
PHL	ATL	AA 
PHL	AUA	AA 
PHL	AUS	AA 
PHL	AVP	AA 
PHL	BCN	AA 
PHL	BDL	AA 
PHL	BGM	AA 
PHL	BGR	AA 
PHL	BHM	AA 
PHL	BNA	AA 
PHL	BOS	AA 
PHL	BRU	AA 
PHL	BTV	AA 
PHL	BUF	AA 
PHL	BWI	AA 
PHL	CAE	AA 
PHL	CAK	AA 
PHL	CDG	AA 
PHL	CHS	AA 
PHL	CLE	AA 
PHL	CLT	AA 
PHL	CMH	AA 
PHL	CUN	AA 
PHL	CVG	AA 
PHL	DAY	AA 
PHL	DCA	AA 
PHL	DEN	AA 
PHL	DOH	AA 
PHL	DTW	AA 
PHL	DUB	AA 
PHL	ELM	AA 
PHL	ERI	AA 
PHL	EWR	AA 
PHL	FCO	AA 
PHL	FLL	AA 
PHL	FRA	AA 
PHL	GLA	AA 
PHL	GSO	AA 
PHL	GSP	AA 
PHL	HPN	AA 
PHL	HVN	AA 
PHL	IAH	AA 
PHL	ILM	AA 
PHL	IND	AA 
PHL	IPT	AA 
PHL	ISP	AA 
PHL	ITH	AA 
PHL	JAX	AA 
PHL	LAS	AA 
PHL	LAX	AA 
PHL	LGA	AA 
PHL	LHR	AA 
PHL	LIS	AA 
PHL	MAD	AA 
PHL	MAN	AA 
PHL	MBJ	AA 
PHL	MCI	AA 
PHL	MCO	AA 
PHL	MDT	AA 
PHL	MIA	AA 
PHL	MKE	AA 
PHL	MSP	AA 
PHL	MSY	AA 
PHL	MUC	AA 
PHL	MYR	AA 
PHL	NAS	AA 
PHL	ORD	AA 
PHL	ORF	AA 
PHL	PBI	AA 
PHL	PDX	AA 
PHL	PHF	AA 
PHL	PHX	AA 
PHL	PIT	AA 
PHL	PVD	AA 
PHL	PWM	AA 
PHL	RIC	AA 
PHL	ROC	AA 
PHL	RSW	AA 
PHL	SAN	AA 
PHL	SAT	AA 
PHL	SAV	AA 
PHL	SBY	AA 
PHL	SDF	AA 
PHL	SDQ	AA 
PHL	SEA	AA 
PHL	SFO	AA 
PHL	SJU	AA 
PHL	SLC	AA 
PHL	STL	AA 
PHL	SWF	AA 
PHL	SYR	AA 
PHL	TPA	AA 
PHL	TYS	AA 
PHL	VCE	AA 
PHL	YHZ	AA 
PHL	YOW	AA 
PHL	YUL	AA 
PHL	YYZ	AA 
PHL	ZRH	AA 
PHX	ABQ	AA 
PHX	ANC	AA 
PHX	ATL	AA 
PHX	AUS	AA 
PHX	BFL	AA 
PHX	BOI	AA 
PHX	BOS	AA 
PHX	BUR	AA 
PHX	BWI	AA 
PHX	CLT	AA 
PHX	CMH	AA 
PHX	CUN	AA 
PHX	DCA	AA 
PHX	DEN	AA 
PHX	DRO	AA 
PHX	DSM	AA 
PHX	DTW	AA 
PHX	ELP	AA 
PHX	EWR	AA 
PHX	FAT	AA 
PHX	FLG	AA 
PHX	FLL	AA 
PHX	GDL	AA 
PHX	GEG	AA 
PHX	GJT	AA 
PHX	HNL	AA 
PHX	IAH	AA 
PHX	IND	AA 
PHX	JFK	AA 
PHX	LAS	AA 
PHX	LAX	AA 
PHX	LGB	AA 
PHX	LHR	AA 
PHX	LIH	AA 
PHX	MCI	AA 
PHX	MCO	AA 
PHX	MEX	AA 
PHX	MIA	AA 
PHX	MKE	AA 
PHX	MRY	AA 
PHX	MSP	AA 
PHX	MZT	AA 
PHX	OAK	AA 
PHX	OGG	AA 
PHX	OMA	AA 
PHX	ONT	AA 
PHX	ORD	AA 
PHX	PDX	AA 
PHX	PHL	AA 
PHX	PIT	AA 
PHX	PSP	AA 
PHX	PVR	AA 
PHX	RNO	AA 
PHX	SAN	AA 
PHX	SAT	AA 
PHX	SBA	AA 
PHX	SBP	AA 
PHX	SEA	AA 
PHX	SFO	AA 
PHX	SJC	AA 
PHX	SLC	AA 
PHX	SMF	AA 
PHX	SNA	AA 
PHX	STL	AA 
PHX	TPA	AA 
PHX	TUS	AA 
PHX	YEG	AA 
PHX	YUM	AA 
PHX	YVR	AA 
PHX	YYC	AA 
PHX	ZIH	AA 
PIA	ORD	AA 
PIT	BDL	AA 
PIT	BOS	AA 
PIT	CLT	AA 
PIT	DCA	AA 
PIT	JFK	AA 
PIT	LAX	AA 
PIT	LGA	AA 
PIT	MIA	AA 
PIT	ORD	AA 
PIT	PHL	AA 
PIT	PHX	AA 
PIT	STL	AA 
PMC	PUQ	AA 
PNS	CLT	AA 
PNS	DCA	AA 
PNS	MIA	AA 
POA	MIA	AA 
POP	MIA	AA 
PPT	AKL	AA 
PPT	LAX	AA 
PRG	LHR	AA 
PSA	LHR	AA 
PSP	ORD	AA 
PSP	PHX	AA 
PSP	SFO	AA 
PTY	MIA	AA 
PVD	CLT	AA 
PVD	DCA	AA 
PVD	PHL	AA 
PVG	LAX	AA 
PVG	ORD	AA 
PVR	ORD	AA 
PVR	PHX	AA 
PVR	SAN	AA 
PVR	SFO	AA 
REC	MIA	AA 
RIC	BOS	AA 
RIC	CLT	AA 
RIC	LGA	AA 
RIC	MIA	AA 
RIC	ORD	AA 
RIC	PHL	AA 
RNO	LAX	AA 
RNO	ORD	AA 
RNO	PHX	AA 
ROC	BOS	AA 
ROC	CLT	AA 
ROC	DCA	AA 
ROC	ORD	AA 
ROC	PHL	AA 
RST	ORD	AA 
RSW	CLT	AA 
RSW	DCA	AA 
RSW	ORD	AA 
RSW	PHL	AA 
RTB	MIA	AA 
RTM	LHR	AA 
SAF	LAX	AA 
SAL	MIA	AA 
SAN	BOS	AA 
SAN	CLT	AA 
SAN	DCA	AA 
SAN	JFK	AA 
SAN	LAX	AA 
SAN	LHR	AA 
SAN	MCO	AA 
SAN	MIA	AA 
SAN	ORD	AA 
SAN	PDX	AA 
SAN	PHL	AA 
SAN	PHX	AA 
SAN	PVR	AA 
SAN	SEA	AA 
SAN	STS	AA 
SAN	YYC	AA 
SAP	MIA	AA 
SAT	CLT	AA 
SAT	ORD	AA 
SAT	PHL	AA 
SAT	PHX	AA 
SAV	CLT	AA 
SAV	DCA	AA 
SAV	PHL	AA 
SBA	PHX	AA 
SBP	PHX	AA 
SBY	CLT	AA 
SBY	PHL	AA 
SCL	JFK	AA 
SCL	LIM	AA 
SCL	MIA	AA 
SCL	PMC	AA 
SDF	CLT	AA 
SDF	DCA	AA 
SDF	LGA	AA 
SDF	MIA	AA 
SDF	ORD	AA 
SDF	PHL	AA 
SDQ	MIA	AA 
SDQ	PHL	AA 
SEA	BOS	AA 
SEA	BUR	AA 
SEA	CLT	AA 
SEA	DEN	AA 
SEA	EWR	AA 
SEA	JFK	AA 
SEA	KTN	AA 
SEA	LAX	AA 
SEA	LGB	AA 
SEA	LHR	AA 
SEA	MCI	AA 
SEA	MCO	AA 
SEA	MIA	AA 
SEA	OAK	AA 
SEA	ONT	AA 
SEA	ORD	AA 
SEA	PEK	AA 
SEA	PHL	AA 
SEA	PHX	AA 
SEA	SAN	AA 
SEA	SFO	AA 
SEA	SJC	AA 
SEA	SMF	AA 
SEA	SNA	AA 
SEA	STL	AA 
SEA	YVR	AA 
SFO	CLT	AA 
SFO	HKG	AA 
SFO	JFK	AA 
SFO	LAX	AA 
SFO	LHR	AA 
SFO	MIA	AA 
SFO	ORD	AA 
SFO	PDX	AA 
SFO	PHL	AA 
SFO	PHX	AA 
SFO	PSP	AA 
SFO	PVR	AA 
SFO	SEA	AA 
SGF	ORD	AA 
SIN	KUL	AA 
SJC	GDL	AA 
SJC	HNL	AA 
SJC	LAX	AA 
SJC	LIH	AA 
SJC	OGG	AA 
SJC	ORD	AA 
SJC	PDX	AA 
SJC	PHX	AA 
SJC	SEA	AA 
SJO	CLT	AA 
SJO	JFK	AA 
SJO	MIA	AA 
SJU	CCS	AA 
SJU	CLT	AA 
SJU	JFK	AA 
SJU	MIA	AA 
SJU	ORD	AA 
SJU	PHL	AA 
SLC	CLT	AA 
SLC	LAX	AA 
SLC	ORD	AA 
SLC	PHL	AA 
SLC	PHX	AA 
SMF	CLT	AA 
SMF	LAX	AA 
SMF	OGG	AA 
SMF	PHX	AA 
SMF	SEA	AA 
SNA	ORD	AA 
SNA	PDX	AA 
SNA	PHX	AA 
SNA	SEA	AA 
SOF	LHR	AA 
SRQ	CLT	AA 
SRQ	DCA	AA 
SSA	MIA	AA 
STI	MIA	AA 
STL	CLT	AA 
STL	DCA	AA 
STL	LAX	AA 
STL	LGA	AA 
STL	MIA	AA 
STL	ORD	AA 
STL	PHL	AA 
STL	PHX	AA 
STL	PIT	AA 
STL	SEA	AA 
STR	LHR	AA 
STS	LAX	AA 
STS	SAN	AA 
SUX	ORD	AA 
SVG	LHR	AA 
SWF	PHL	AA 
SYD	ADL	AA 
SYD	AKL	AA 
SYD	ASP	AA 
SYD	BNE	AA 
SYD	CBR	AA 
SYD	CHC	AA 
SYD	CNS	AA 
SYD	DRW	AA 
SYD	HNL	AA 
SYD	LAX	AA 
SYD	MEL	AA 
SYD	PER	AA 
SYR	BOS	AA 
SYR	CLT	AA 
SYR	DCA	AA 
SYR	ORD	AA 
SYR	PHL	AA 
TGU	MIA	AA 
TLH	CLT	AA 
TLH	DCA	AA 
TLH	MIA	AA 
TLS	LHR	AA 
TOL	ORD	AA 
TPA	CLT	AA 
TPA	DCA	AA 
TPA	JFK	AA 
TPA	LGW	AA 
TPA	MIA	AA 
TPA	ORD	AA 
TPA	PHL	AA 
TPA	PHX	AA 
TSV	BNE	AA 
TUL	MIA	AA 
TUL	ORD	AA 
TUS	LAX	AA 
TUS	ORD	AA 
TUS	PHX	AA 
TVC	ORD	AA 
TXL	JFK	AA 
TXL	LHR	AA 
TXL	MIA	AA 
TXL	ORD	AA 
TYS	CLT	AA 
TYS	DCA	AA 
TYS	LGA	AA 
TYS	ORD	AA 
TYS	PHL	AA 
UIO	GYE	AA 
UIO	MIA	AA 
VCE	LHR	AA 
VCE	PHL	AA 
VIE	LHR	AA 
VPS	CLT	AA 
VPS	DCA	AA 
VVI	MIA	AA 
WAW	LHR	AA 
XNA	CLT	AA 
XNA	LAX	AA 
XNA	LGA	AA 
XNA	ORD	AA 
YEG	LAS	AA 
YEG	LAX	AA 
YEG	PHX	AA 
YHZ	DCA	AA 
YHZ	PHL	AA 
YKF	ORD	AA 
YOW	CLT	AA 
YOW	PHL	AA 
YUL	AMM	AA 
YUL	CLT	AA 
YUL	DCA	AA 
YUL	DTW	AA 
YUL	JFK	AA 
YUL	LGA	AA 
YUL	LHR	AA 
YUL	MIA	AA 
YUL	ORD	AA 
YUL	PHL	AA 
YUM	PHX	AA 
YVR	LAS	AA 
YVR	LAX	AA 
YVR	LHR	AA 
YVR	ORD	AA 
YVR	PDX	AA 
YVR	PHX	AA 
YVR	SEA	AA 
YYC	JFK	AA 
YYC	LAS	AA 
YYC	LAX	AA 
YYC	LHR	AA 
YYC	ORD	AA 
YYC	PHX	AA 
YYC	SAN	AA 
YYZ	CLT	AA 
YYZ	DCA	AA 
YYZ	JFK	AA 
YYZ	LAS	AA 
YYZ	LAX	AA 
YYZ	LGA	AA 
YYZ	LHR	AA 
YYZ	MCO	AA 
YYZ	MIA	AA 
YYZ	ORD	AA 
YYZ	PHL	AA 
ZAG	LHR	AA 
ZIH	PHX	AA 
ZRH	JFK	AA 
ZRH	LHR	AA 
ZRH	PHL	AA 
ACE	CGN	AB 
ACE	HAM	AB 
ACE	LEJ	AB 
ACE	MUC	AB 
ACE	TXL	AB 
ACE	ZRH	AB 
AGP	CGN	AB 
AGP	HAM	AB 
AGP	MUC	AB 
AGP	STR	AB 
AGP	TXL	AB 
AGP	VIE	AB 
ALC	FRA	AB 
ALC	HAM	AB 
ALC	MUC	AB 
ALC	STR	AB 
ALC	TXL	AB 
ALC	ZRH	AB 
AMM	FRA	AB 
AMM	MUC	AB 
AMM	TXL	AB 
AMM	VIE	AB 
ARN	TXL	AB 
ARN	VIE	AB 
AUH	FRA	AB 
AUH	HKT	AB 
AUH	MUC	AB 
AUH	PEK	AB 
AUH	SIN	AB 
AUH	TXL	AB 
AYT	CGN	AB 
AYT	DRS	AB 
AYT	FMO	AB 
AYT	HAM	AB 
AYT	LEJ	AB 
AYT	MUC	AB 
AYT	PAD	AB 
AYT	STR	AB 
AYT	TXL	AB 
BCN	TXL	AB 
BCN	VIE	AB 
BDS	MUC	AB 
BDS	ZRH	AB 
BEG	FRA	AB 
BEG	STR	AB 
BEG	TXL	AB 
BKK	CNX	AB 
BNE	SIN	AB 
BRI	TXL	AB 
BSL	CTA	AB 
BSL	IBZ	AB 
BSL	LHR	AB 
BUD	TXL	AB 
CAG	MUC	AB 
CDG	VIE	AB 
CGN	ACE	AB 
CGN	AGP	AB 
CGN	AYT	AB 
CGN	IBZ	AB 
CGN	KGS	AB 
CGN	MUC	AB 
CGN	OLB	AB 
CGN	SAW	AB 
CGN	TXL	AB 
CHQ	VIE	AB 
CPH	TXL	AB 
CPH	VIE	AB 
CTA	BSL	AB 
CTA	FRA	AB 
CTA	MUC	AB 
CTA	STR	AB 
CTA	TXL	AB 
CTA	ZRH	AB 
DME	FRA	AB 
DME	MUC	AB 
DME	TXL	AB 
DRS	AYT	AB 
FAO	HAM	AB 
FAO	MUC	AB 
FAO	TXL	AB 
FCO	TXL	AB 
FCO	VIE	AB 
FDH	IBZ	AB 
FLR	STR	AB 
FLR	VIE	AB 
FMO	AYT	AB 
FMO	IBZ	AB 
FNC	LEJ	AB 
FNC	MUC	AB 
FNC	TXL	AB 
FNC	VIE	AB 
FNC	ZRH	AB 
FRA	ALC	AB 
FRA	AMM	AB 
FRA	AUH	AB 
FRA	BEG	AB 
FRA	CTA	AB 
FRA	DME	AB 
FRA	HEL	AB 
FRA	IBZ	AB 
FRA	LCY	AB 
FRA	LHR	AB 
FRA	MAD	AB 
FRA	RIX	AB 
FRA	TXL	AB 
FRA	VIE	AB 
GDN	TXL	AB 
GRZ	TXL	AB 
GVA	MAD	AB 
GWT	MUC	AB 
GWT	STR	AB 
GWT	TXL	AB 
GWT	ZRH	AB 
HAJ	IBZ	AB 
HAJ	LHR	AB 
HAJ	STR	AB 
HAJ	VIE	AB 
HAM	ACE	AB 
HAM	AGP	AB 
HAM	ALC	AB 
HAM	AYT	AB 
HAM	FAO	AB 
HAM	HEL	AB 
HAM	IBZ	AB 
HAM	KGS	AB 
HAM	LHR	AB 
HAM	MUC	AB 
HAM	OLB	AB 
HAM	RIX	AB 
HAM	SKG	AB 
HAM	STR	AB 
HAM	SZG	AB 
HAM	VIE	AB 
HEL	FRA	AB 
HEL	HAM	AB 
HEL	MUC	AB 
HEL	TXL	AB 
HEL	VIE	AB 
HEL	ZRH	AB 
HKT	AUH	AB 
HKT	BKK	AB 
IBZ	BSL	AB 
IBZ	CGN	AB 
IBZ	FDH	AB 
IBZ	FMO	AB 
IBZ	FRA	AB 
IBZ	HAJ	AB 
IBZ	HAM	AB 
IBZ	MUC	AB 
IBZ	PAD	AB 
IBZ	STR	AB 
IBZ	TXL	AB 
IBZ	ZRH	AB 
JFK	TXL	AB 
KGD	TXL	AB 
KGS	CGN	AB 
KGS	HAM	AB 
KGS	LEJ	AB 
KGS	MUC	AB 
KGS	TXL	AB 
KLX	VIE	AB 
KRK	TXL	AB 
KVA	MUC	AB 
LCA	VIE	AB 
LCY	FRA	AB 
LCY	ZRH	AB 
LEJ	ACE	AB 
LEJ	AYT	AB 
LEJ	FNC	AB 
LEJ	KGS	AB 
LGW	SZG	AB 
LHR	BSL	AB 
LHR	FRA	AB 
LHR	HAJ	AB 
LHR	HAM	AB 
LHR	MUC	AB 
LHR	ORY	AB 
LHR	STR	AB 
LHR	TXL	AB 
LHR	VIE	AB 
LHR	ZRH	AB 
MAD	FRA	AB 
MAD	GVA	AB 
MAD	MUC	AB 
MAD	TXL	AB 
MAD	VIE	AB 
MAD	ZRH	AB 
MIA	TXL	AB 
MJT	MUC	AB 
MUC	ACE	AB 
MUC	AGP	AB 
MUC	ALC	AB 
MUC	AMM	AB 
MUC	AUH	AB 
MUC	AYT	AB 
MUC	BDS	AB 
MUC	CAG	AB 
MUC	CGN	AB 
MUC	CTA	AB 
MUC	DME	AB 
MUC	FAO	AB 
MUC	FNC	AB 
MUC	GWT	AB 
MUC	HAM	AB 
MUC	HEL	AB 
MUC	IBZ	AB 
MUC	KGS	AB 
MUC	KVA	AB 
MUC	LHR	AB 
MUC	MAD	AB 
MUC	MJT	AB 
MUC	NAP	AB 
MUC	OLB	AB 
MUC	PVK	AB 
MUC	RIX	AB 
MUC	SAW	AB 
MUC	SKG	AB 
MUC	TXL	AB 
MUC	VIE	AB 
NAP	MUC	AB 
NAP	STR	AB 
NAP	TXL	AB 
NAP	ZRH	AB 
NCE	VIE	AB 
OLB	CGN	AB 
OLB	HAM	AB 
OLB	MUC	AB 
OLB	STR	AB 
OLB	TXL	AB 
OLB	VIE	AB 
OLB	ZRH	AB 
ORD	TXL	AB 
ORY	LHR	AB 
ORY	TXL	AB 
OSL	TXL	AB 
OTP	TXL	AB 
PAD	AYT	AB 
PAD	IBZ	AB 
PEK	NGO	AB 
PEK	TXL	AB 
PVK	MUC	AB 
PVK	VIE	AB 
RIX	FRA	AB 
RIX	HAM	AB 
RIX	MUC	AB 
RIX	TXL	AB 
SAW	CGN	AB 
SAW	MUC	AB 
SAW	STR	AB 
SAW	SXF	AB 
SIN	AUH	AB 
SIN	BNE	AB 
SKG	HAM	AB 
SKG	MUC	AB 
SKG	STR	AB 
SKG	TXL	AB 
SKG	VIE	AB 
SOF	TXL	AB 
STR	AGP	AB 
STR	ALC	AB 
STR	AYT	AB 
STR	BEG	AB 
STR	CTA	AB 
STR	FLR	AB 
STR	GWT	AB 
STR	HAJ	AB 
STR	HAM	AB 
STR	IBZ	AB 
STR	LHR	AB 
STR	NAP	AB 
STR	OLB	AB 
STR	SAW	AB 
STR	SKG	AB 
STR	TXL	AB 
STR	VCE	AB 
SXF	SAW	AB 
SZG	ACE	AB 
SZG	HAM	AB 
SZG	LGW	AB 
SZG	TXL	AB 
SZG	VIE	AB 
TXL	ACE	AB 
TXL	AGP	AB 
TXL	ALC	AB 
TXL	AMM	AB 
TXL	ARN	AB 
TXL	AUH	AB 
TXL	AYT	AB 
TXL	BCN	AB 
TXL	BEG	AB 
TXL	BRI	AB 
TXL	BUD	AB 
TXL	CGN	AB 
TXL	CPH	AB 
TXL	CTA	AB 
TXL	DME	AB 
TXL	FAO	AB 
TXL	FCO	AB 
TXL	FNC	AB 
TXL	FRA	AB 
TXL	GDN	AB 
TXL	GRZ	AB 
TXL	GWT	AB 
TXL	HEL	AB 
TXL	IBZ	AB 
TXL	JFK	AB 
TXL	KGD	AB 
TXL	KGS	AB 
TXL	KRK	AB 
TXL	LHR	AB 
TXL	MAD	AB 
TXL	MIA	AB 
TXL	MUC	AB 
TXL	NAP	AB 
TXL	OLB	AB 
TXL	ORD	AB 
TXL	ORY	AB 
TXL	OSL	AB 
TXL	OTP	AB 
TXL	PEK	AB 
TXL	RIX	AB 
TXL	SKG	AB 
TXL	SOF	AB 
TXL	STR	AB 
TXL	SZG	AB 
TXL	VCE	AB 
TXL	VIE	AB 
TXL	WAW	AB 
TXL	ZRH	AB 
VCE	STR	AB 
VCE	TXL	AB 
VIE	ACE	AB 
VIE	AGP	AB 
VIE	AMM	AB 
VIE	ARN	AB 
VIE	BCN	AB 
VIE	CDG	AB 
VIE	CHQ	AB 
VIE	CPH	AB 
VIE	FCO	AB 
VIE	FLR	AB 
VIE	FNC	AB 
VIE	FRA	AB 
VIE	HAJ	AB 
VIE	HAM	AB 
VIE	HEL	AB 
VIE	KLX	AB 
VIE	LCA	AB 
VIE	LHR	AB 
VIE	MAD	AB 
VIE	MUC	AB 
VIE	NCE	AB 
VIE	OLB	AB 
VIE	PVK	AB 
VIE	SKG	AB 
VIE	SZG	AB 
VIE	TXL	AB 
VIE	VLC	AB 
VIE	ZRH	AB 
VLC	VIE	AB 
WAW	TXL	AB 
ZRH	ACE	AB 
ZRH	ALC	AB 
ZRH	BDS	AB 
ZRH	CTA	AB 
ZRH	FNC	AB 
ZRH	GWT	AB 
ZRH	HEL	AB 
ZRH	IBZ	AB 
ZRH	LCY	AB 
ZRH	LHR	AB 
ZRH	MAD	AB 
ZRH	NAP	AB 
ZRH	OLB	AB 
ZRH	TXL	AB 
ZRH	VIE	AB 
GNM	SSA	ABJ
ABJ	BRU	AC 
ABJ	OUA	AC 
ADD	JED	AC 
AMS	CPH	AC 
ATL	DEN	AC 
ATL	YYZ	AC 
AUA	YYZ	AC 
AUH	YYZ	AC 
AZS	YUL	AC 
AZS	YYZ	AC 
BCN	YYZ	AC 
BDL	YUL	AC 
BDL	YYZ	AC 
BGI	YYZ	AC 
BJM	NBO	AC 
BKK	ICN	AC 
BNA	YYZ	AC 
BOG	YYZ	AC 
BOS	YHZ	AC 
BOS	YOW	AC 
BOS	YUL	AC 
BOS	YYZ	AC 
BRU	BJM	AC 
BRU	COO	AC 
BRU	DKR	AC 
BRU	DLA	AC 
BRU	KGL	AC 
BRU	LAD	AC 
BRU	OUA	AC 
BRU	YUL	AC 
BRU	YYZ	AC 
BWI	YYZ	AC 
CDG	YUL	AC 
CDG	YYZ	AC 
CKY	DKR	AC 
CLE	YYZ	AC 
CLT	YYZ	AC 
CMH	YYZ	AC 
COO	ABJ	AC 
CPH	AMS	AC 
CPH	OSL	AC 
CPH	VNO	AC 
CPH	WAW	AC 
CPH	YYZ	AC 
CUN	YUL	AC 
CUN	YYC	AC 
CUN	YYZ	AC 
CVG	YYZ	AC 
CZM	YUL	AC 
DCA	YOW	AC 
DCA	YUL	AC 
DCA	YYZ	AC 
DEL	BRU	AC 
DEN	ATL	AC 
DEN	MSY	AC 
DEN	YEG	AC 
DEN	YQR	AC 
DEN	YUL	AC 
DEN	YVR	AC 
DEN	YWG	AC 
DEN	YXE	AC 
DEN	YYC	AC 
DEN	YYZ	AC 
DKR	BRU	AC 
DKR	CKY	AC 
DLA	BRU	AC 
DLA	FIH	AC 
DOH	FRA	AC 
DTW	YYZ	AC 
DUB	YYZ	AC 
EBB	BRU	AC 
EWR	MSY	AC 
EWR	YEG	AC 
EWR	YUL	AC 
EWR	YVR	AC 
EWR	YYC	AC 
EWR	YYZ	AC 
EZE	SCL	AC 
FCO	YYZ	AC 
FIH	BRU	AC 
FIH	DLA	AC 
FLL	YUL	AC 
FLL	YYZ	AC 
FRA	DOH	AC 
FRA	JED	AC 
FRA	LCA	AC 
FRA	NAP	AC 
FRA	VLC	AC 
FRA	VNO	AC 
FRA	YOW	AC 
FRA	YUL	AC 
FRA	YVR	AC 
FRA	YYC	AC 
FRA	YYZ	AC 
GDN	CPH	AC 
GRU	YYZ	AC 
GVA	YUL	AC 
HAV	YYZ	AC 
HKG	YVR	AC 
HKG	YYZ	AC 
HNL	YVR	AC 
HOG	YUL	AC 
HOG	YYZ	AC 
IAD	MSY	AC 
IAD	YOW	AC 
IAD	YUL	AC 
IAD	YYZ	AC 
IAH	MSY	AC 
IAH	YEG	AC 
IAH	YUL	AC 
IAH	YYC	AC 
IAH	YYZ	AC 
ICN	BKK	AC 
ICN	YVR	AC 
IND	YYZ	AC 
IST	YYZ	AC 
JED	ADD	AC 
JED	FRA	AC 
JED	IST	AC 
JFK	YYZ	AC 
KGL	EBB	AC 
KGL	NBO	AC 
KIN	YYZ	AC 
LAD	FIH	AC 
LAS	YUL	AC 
LAS	YVR	AC 
LAS	YYC	AC 
LAS	YYZ	AC 
LAX	YLW	AC 
LAX	YUL	AC 
LAX	YVR	AC 
LAX	YYC	AC 
LAX	YYZ	AC 
LCA	FRA	AC 
LGA	YOW	AC 
LGA	YUL	AC 
LGA	YYZ	AC 
LHR	YEG	AC 
LHR	YHZ	AC 
LHR	YOW	AC 
LHR	YUL	AC 
LHR	YVR	AC 
LHR	YYC	AC 
LHR	YYT	AC 
LHR	YYZ	AC 
LIM	YYZ	AC 
LIR	YYZ	AC 
MBJ	YHZ	AC 
MBJ	YUL	AC 
MBJ	YYZ	AC 
MCI	YYZ	AC 
MCO	YUL	AC 
MCO	YYZ	AC 
MDT	YYZ	AC 
MEX	YVR	AC 
MEX	YYZ	AC 
MIA	GUA	AC 
MIA	YYZ	AC 
MKE	YYZ	AC 
MSP	YYZ	AC 
MSY	DEN	AC 
MSY	EWR	AC 
MSY	IAD	AC 
MSY	IAH	AC 
MSY	ORD	AC 
MSY	YYZ	AC 
MUC	SOF	AC 
MUC	YUL	AC 
MUC	YVR	AC 
MUC	YYZ	AC 
NAP	FRA	AC 
NAS	YYZ	AC 
NBO	BRU	AC 
OGG	YVR	AC 
ORD	MSY	AC 
ORD	YEG	AC 
ORD	YHZ	AC 
ORD	YOW	AC 
ORD	YQR	AC 
ORD	YUL	AC 
ORD	YVR	AC 
ORD	YWG	AC 
ORD	YXU	AC 
ORD	YYC	AC 
ORD	YYZ	AC 
OUA	ABJ	AC 
OUA	BRU	AC 
PDX	YVR	AC 
PDX	YYC	AC 
PEK	YVR	AC 
PEK	YYZ	AC 
PHL	YYZ	AC 
PHX	YYZ	AC 
PIT	YYZ	AC 
POP	YHZ	AC 
POP	YYZ	AC 
PVG	YVR	AC 
PVG	YYZ	AC 
PVR	YVR	AC 
PVR	YYC	AC 
ROC	YYZ	AC 
RSW	YYZ	AC 
SAN	YYZ	AC 
SCL	EZE	AC 
SCL	YYZ	AC 
SEA	YVR	AC 
SEA	YYZ	AC 
SFO	YEG	AC 
SFO	YUL	AC 
SFO	YVR	AC 
SFO	YYC	AC 
SFO	YYJ	AC 
SFO	YYZ	AC 
SJO	YYZ	AC 
SNU	YHZ	AC 
SNU	YUL	AC 
SNU	YYZ	AC 
STL	YYZ	AC 
SYD	YVR	AC 
SYR	YYZ	AC 
TPA	YYZ	AC 
TRD	CPH	AC 
VIE	YYZ	AC 
VLC	FRA	AC 
VNO	CPH	AC 
VNO	FRA	AC 
VRA	YUL	AC 
VRA	YYC	AC 
VRA	YYZ	AC 
WAW	CPH	AC 
WAW	YYZ	AC 
YBL	YQQ	AC 
YCD	YVR	AC 
YCG	YVR	AC 
YCG	YYC	AC 
YDF	YHZ	AC 
YDF	YYT	AC 
YDF	YYZ	AC 
YEG	DEN	AC 
YEG	EWR	AC 
YEG	IAH	AC 
YEG	LHR	AC 
YEG	ORD	AC 
YEG	SFO	AC 
YEG	YOW	AC 
YEG	YQR	AC 
YEG	YQU	AC 
YEG	YUL	AC 
YEG	YVR	AC 
YEG	YWG	AC 
YEG	YXE	AC 
YEG	YYC	AC 
YEG	YYZ	AC 
YEG	YZF	AC 
YFC	YHZ	AC 
YFC	YOW	AC 
YFC	YUL	AC 
YFC	YYZ	AC 
YHZ	BOS	AC 
YHZ	LHR	AC 
YHZ	ORD	AC 
YHZ	YDF	AC 
YHZ	YFC	AC 
YHZ	YOW	AC 
YHZ	YQM	AC 
YHZ	YQX	AC 
YHZ	YUL	AC 
YHZ	YYG	AC 
YHZ	YYT	AC 
YHZ	YYZ	AC 
YKA	YVR	AC 
YKA	YYC	AC 
YLW	LAX	AC 
YLW	YVR	AC 
YLW	YYC	AC 
YOW	BOS	AC 
YOW	DCA	AC 
YOW	FRA	AC 
YOW	IAD	AC 
YOW	LGA	AC 
YOW	LHR	AC 
YOW	ORD	AC 
YOW	YEG	AC 
YOW	YFC	AC 
YOW	YHZ	AC 
YOW	YQM	AC 
YOW	YUL	AC 
YOW	YVR	AC 
YOW	YWG	AC 
YOW	YXU	AC 
YOW	YYC	AC 
YOW	YYT	AC 
YOW	YYZ	AC 
YQG	YYZ	AC 
YQL	YYC	AC 
YQM	YHZ	AC 
YQM	YOW	AC 
YQM	YUL	AC 
YQM	YYZ	AC 
YQQ	YVR	AC 
YQR	DEN	AC 
YQR	ORD	AC 
YQR	YEG	AC 
YQR	YVR	AC 
YQR	YWG	AC 
YQR	YYC	AC 
YQR	YYZ	AC 
YQT	YWG	AC 
YQT	YYZ	AC 
YQU	YEG	AC 
YQU	YYC	AC 
YQX	YHZ	AC 
YQX	YYT	AC 
YQZ	YVR	AC 
YQZ	YWL	AC 
YSB	YYZ	AC 
YTS	YYZ	AC 
YTZ	YUL	AC 
YUL	AZS	AC 
YUL	BDL	AC 
YUL	BOS	AC 
YUL	BRU	AC 
YUL	CDG	AC 
YUL	CUN	AC 
YUL	CZM	AC 
YUL	DCA	AC 
YUL	DEN	AC 
YUL	EWR	AC 
YUL	FLL	AC 
YUL	FRA	AC 
YUL	GVA	AC 
YUL	HOG	AC 
YUL	IAD	AC 
YUL	IAH	AC 
YUL	LAS	AC 
YUL	LAX	AC 
YUL	LGA	AC 
YUL	LHR	AC 
YUL	MBJ	AC 
YUL	MCO	AC 
YUL	MUC	AC 
YUL	ORD	AC 
YUL	SFO	AC 
YUL	SNU	AC 
YUL	VRA	AC 
YUL	YEG	AC 
YUL	YFC	AC 
YUL	YHZ	AC 
YUL	YOW	AC 
YUL	YQM	AC 
YUL	YTZ	AC 
YUL	YVR	AC 
YUL	YWG	AC 
YUL	YYC	AC 
YUL	YYG	AC 
YUL	YYT	AC 
YUL	YYZ	AC 
YUL	ZBF	AC 
YUL	ZRH	AC 
YVR	AKL	AC 
YVR	DEN	AC 
YVR	EWR	AC 
YVR	FRA	AC 
YVR	HKG	AC 
YVR	HNL	AC 
YVR	ICN	AC 
YVR	LAS	AC 
YVR	LAX	AC 
YVR	LHR	AC 
YVR	MEX	AC 
YVR	MUC	AC 
YVR	OGG	AC 
YVR	ORD	AC 
YVR	PDX	AC 
YVR	PEK	AC 
YVR	PVG	AC 
YVR	PVR	AC 
YVR	SEA	AC 
YVR	SFO	AC 
YVR	SYD	AC 
YVR	YBL	AC 
YVR	YCD	AC 
YVR	YCG	AC 
YVR	YEG	AC 
YVR	YKA	AC 
YVR	YLW	AC 
YVR	YOW	AC 
YVR	YQR	AC 
YVR	YQZ	AC 
YVR	YUL	AC 
YVR	YWG	AC 
YVR	YWL	AC 
YVR	YXC	AC 
YVR	YXE	AC 
YVR	YXS	AC 
YVR	YXT	AC 
YVR	YXY	AC 
YVR	YYC	AC 
YVR	YYD	AC 
YVR	YYF	AC 
YVR	YYJ	AC 
YVR	YYZ	AC 
YWG	DEN	AC 
YWG	ORD	AC 
YWG	YEG	AC 
YWG	YOW	AC 
YWG	YQR	AC 
YWG	YQT	AC 
YWG	YUL	AC 
YWG	YVR	AC 
YWG	YXE	AC 
YWG	YYC	AC 
YWG	YYZ	AC 
YWL	YQZ	AC 
YWL	YVR	AC 
YXC	YVR	AC 
YXC	YYC	AC 
YXE	DEN	AC 
YXE	YEG	AC 
YXE	YVR	AC 
YXE	YWG	AC 
YXE	YYC	AC 
YXE	YYZ	AC 
YXH	YYC	AC 
YXS	YVR	AC 
YXT	YVR	AC 
YXU	ORD	AC 
YXU	YOW	AC 
YXU	YYZ	AC 
YXY	YVR	AC 
YYB	YYZ	AC 
YYC	CUN	AC 
YYC	DEN	AC 
YYC	EWR	AC 
YYC	FRA	AC 
YYC	IAH	AC 
YYC	LAS	AC 
YYC	LAX	AC 
YYC	LHR	AC 
YYC	ORD	AC 
YYC	PDX	AC 
YYC	PVR	AC 
YYC	SFO	AC 
YYC	VRA	AC 
YYC	YCG	AC 
YYC	YEG	AC 
YYC	YKA	AC 
YYC	YLW	AC 
YYC	YOW	AC 
YYC	YQL	AC 
YYC	YQR	AC 
YYC	YQU	AC 
YYC	YUL	AC 
YYC	YVR	AC 
YYC	YWG	AC 
YYC	YXC	AC 
YYC	YXE	AC 
YYC	YXH	AC 
YYC	YYJ	AC 
YYC	YYZ	AC 
YYC	YZF	AC 
YYD	YVR	AC 
YYF	YVR	AC 
YYG	YHZ	AC 
YYG	YUL	AC 
YYG	YYZ	AC 
YYJ	SFO	AC 
YYJ	YVR	AC 
YYJ	YYC	AC 
YYJ	YYZ	AC 
YYT	LHR	AC 
YYT	YDF	AC 
YYT	YHZ	AC 
YYT	YOW	AC 
YYT	YQX	AC 
YYT	YUL	AC 
YYT	YYZ	AC 
YYZ	ATL	AC 
YYZ	AUA	AC 
YYZ	AUH	AC 
YYZ	AZS	AC 
YYZ	BCN	AC 
YYZ	BDL	AC 
YYZ	BGI	AC 
YYZ	BNA	AC 
YYZ	BOG	AC 
YYZ	BOS	AC 
YYZ	BWI	AC 
YYZ	CDG	AC 
YYZ	CLE	AC 
YYZ	CLT	AC 
YYZ	CMH	AC 
YYZ	CPH	AC 
YYZ	CUN	AC 
YYZ	CVG	AC 
YYZ	DCA	AC 
YYZ	DEN	AC 
YYZ	DTW	AC 
YYZ	DUB	AC 
YYZ	EWR	AC 
YYZ	FCO	AC 
YYZ	FLL	AC 
YYZ	FRA	AC 
YYZ	GRU	AC 
YYZ	HAV	AC 
YYZ	HKG	AC 
YYZ	HOG	AC 
YYZ	IAD	AC 
YYZ	IAH	AC 
YYZ	IND	AC 
YYZ	IST	AC 
YYZ	JFK	AC 
YYZ	KIN	AC 
YYZ	LAS	AC 
YYZ	LAX	AC 
YYZ	LGA	AC 
YYZ	LHR	AC 
YYZ	LIM	AC 
YYZ	LIR	AC 
YYZ	MBJ	AC 
YYZ	MCI	AC 
YYZ	MCO	AC 
YYZ	MDT	AC 
YYZ	MEX	AC 
YYZ	MIA	AC 
YYZ	MKE	AC 
YYZ	MSP	AC 
YYZ	MSY	AC 
YYZ	MUC	AC 
YYZ	NAS	AC 
YYZ	ORD	AC 
YYZ	PEK	AC 
YYZ	PHL	AC 
YYZ	PHX	AC 
YYZ	PIT	AC 
YYZ	POP	AC 
YYZ	PVG	AC 
YYZ	ROC	AC 
YYZ	RSW	AC 
YYZ	SAN	AC 
YYZ	SCL	AC 
YYZ	SEA	AC 
YYZ	SFO	AC 
YYZ	SJO	AC 
YYZ	SNU	AC 
YYZ	STL	AC 
YYZ	SYR	AC 
YYZ	TPA	AC 
YYZ	VIE	AC 
YYZ	VRA	AC 
YYZ	WAW	AC 
YYZ	YDF	AC 
YYZ	YEG	AC 
YYZ	YFC	AC 
YYZ	YHZ	AC 
YYZ	YOW	AC 
YYZ	YQG	AC 
YYZ	YQM	AC 
YYZ	YQR	AC 
YYZ	YQT	AC 
YYZ	YSB	AC 
YYZ	YTS	AC 
YYZ	YUL	AC 
YYZ	YVR	AC 
YYZ	YWG	AC 
YYZ	YXE	AC 
YYZ	YXU	AC 
YYZ	YYB	AC 
YYZ	YYC	AC 
YYZ	YYG	AC 
YYZ	YYJ	AC 
YYZ	YYT	AC 
YYZ	YZR	AC 
YYZ	ZRH	AC 
YZF	YEG	AC 
YZF	YYC	AC 
YZR	YYZ	AC 
ZBF	YUL	AC 
ZRH	YUL	AC 
ZRH	YYZ	AC 
AAX	POJ	AD 
AFL	CGB	AD 
AJU	MCZ	AD 
AJU	REC	AD 
AJU	SSA	AD 
AJU	VCP	AD 
ARU	GRU	AD 
ARU	VCP	AD 
ATM	BEL	AD 
ATM	STM	AD 
AUX	BSB	AD 
AUX	MAB	AD 
AUX	PMW	AD 
BAZ	MAO	AD 
BEL	ATM	AD 
BEL	CNF	AD 
BEL	FOR	AD 
BEL	IMP	AD 
BEL	MAB	AD 
BEL	MAO	AD 
BEL	MCP	AD 
BEL	STM	AD 
BPS	CNF	AD 
BPS	SSA	AD 
BPS	VCP	AD 
BRA	BSB	AD 
BRA	SSA	AD 
BSB	AUX	AD 
BSB	BRA	AD 
BSB	CGB	AD 
BSB	CNF	AD 
BSB	GRU	AD 
BSB	MAB	AD 
BSB	PMW	AD 
BSB	UDI	AD 
BSB	VCP	AD 
BVB	MAO	AD 
BVH	CGB	AD 
CAC	CWB	AD 
CAC	VCP	AD 
CCM	VCP	AD 
CFB	PLU	AD 
CFB	VCP	AD 
CGB	AFL	AD 
CGB	BSB	AD 
CGB	BVH	AD 
CGB	CGR	AD 
CGB	CNF	AD 
CGB	GRU	AD 
CGB	GYN	AD 
CGB	LDB	AD 
CGB	MGF	AD 
CGB	OPS	AD 
CGB	PVH	AD 
CGB	ROO	AD 
CGB	VCP	AD 
CGR	CGB	AD 
CGR	CMG	AD 
CGR	GRU	AD 
CGR	VCP	AD 
CIZ	MAO	AD 
CMG	CGR	AD 
CNF	BEL	AD 
CNF	BPS	AD 
CNF	BSB	AD 
CNF	CGB	AD 
CNF	CPV	AD 
CNF	CWB	AD 
CNF	FOR	AD 
CNF	GRU	AD 
CNF	GYN	AD 
CNF	IMP	AD 
CNF	IPN	AD 
CNF	IZA	AD 
CNF	MAO	AD 
CNF	MOC	AD 
CNF	POA	AD 
CNF	RAO	AD 
CNF	REC	AD 
CNF	SLZ	AD 
CNF	SSA	AD 
CNF	UBA	AD 
CNF	UDI	AD 
CNF	VCP	AD 
CNF	VIX	AD 
CPV	PNZ	AD 
CWB	CAC	AD 
CWB	CNF	AD 
CWB	GRU	AD 
CWB	LDB	AD 
CWB	MGF	AD 
CWB	POA	AD 
CWB	VCP	AD 
DOU	VCP	AD 
ERN	TFF	AD 
FLN	VCP	AD 
FOR	BEL	AD 
FOR	CNF	AD 
FOR	JPA	AD 
FOR	NAT	AD 
FOR	PHB	AD 
FOR	REC	AD 
FOR	SLZ	AD 
FOR	THE	AD 
FOR	VCP	AD 
GRU	ARU	AD 
GRU	BSB	AD 
GRU	CGB	AD 
GRU	CGR	AD 
GRU	CNF	AD 
GRU	CWB	AD 
GRU	GYN	AD 
GRU	IOS	AD 
GRU	IPN	AD 
GRU	PLU	AD 
GRU	POA	AD 
GRU	REC	AD 
GRU	SSA	AD 
GVR	PLU	AD 
GYN	CGB	AD 
GYN	CNF	AD 
GYN	GRU	AD 
GYN	PMW	AD 
GYN	VCP	AD 
IMP	BEL	AD 
IMP	CNF	AD 
IOS	GRU	AD 
IOS	SSA	AD 
IOS	VCP	AD 
IPN	CNF	AD 
IPN	GRU	AD 
IPN	PLU	AD 
ITB	STM	AD 
IZA	CNF	AD 
IZA	VCP	AD 
JPA	FOR	AD 
JPA	SSA	AD 
JPA	VCP	AD 
JTC	VCP	AD 
LDB	CGB	AD 
LDB	CWB	AD 
LDB	MGF	AD 
LDB	POA	AD 
LDB	VCP	AD 
MAB	AUX	AD 
MAB	BEL	AD 
MAB	BSB	AD 
MAB	TUR	AD 
MAO	BAZ	AD 
MAO	BEL	AD 
MAO	BVB	AD 
MAO	CIZ	AD 
MAO	CNF	AD 
MAO	PIN	AD 
MAO	PVH	AD 
MAO	STM	AD 
MAO	TBT	AD 
MAO	TFF	AD 
MAO	VCP	AD 
MCP	BEL	AD 
MCZ	AJU	AD 
MCZ	REC	AD 
MCZ	VCP	AD 
MGF	CGB	AD 
MGF	CWB	AD 
MGF	LDB	AD 
MGF	POA	AD 
MGF	VCP	AD 
MOC	CNF	AD 
MOC	PLU	AD 
NAT	CNF	AD 
NAT	REC	AD 
NAT	VCP	AD 
OPS	CGB	AD 
PET	POA	AD 
PFB	POA	AD 
PFB	VCP	AD 
PHB	FOR	AD 
PHB	THE	AD 
PIN	MAO	AD 
PLU	AAX	AD 
PLU	CFB	AD 
PLU	GRU	AD 
PLU	GVR	AD 
PLU	IPN	AD 
PLU	MOC	AD 
PLU	POJ	AD 
PLU	UDI	AD 
PLU	VCP	AD 
PMW	AUX	AD 
PMW	BSB	AD 
PMW	GYN	AD 
PNZ	CNF	AD 
POA	CNF	AD 
POA	CWB	AD 
POA	GRU	AD 
POA	LDB	AD 
POA	MGF	AD 
POA	PET	AD 
POA	PFB	AD 
POA	RIA	AD 
POA	VCP	AD 
POA	XAP	AD 
POJ	PLU	AD 
PVH	CGB	AD 
PVH	MAO	AD 
PVH	RBR	AD 
RAO	CNF	AD 
RAO	VCP	AD 
RBR	PVH	AD 
REC	AJU	AD 
REC	CNF	AD 
REC	FOR	AD 
REC	GRU	AD 
REC	MCZ	AD 
REC	NAT	AD 
REC	SSA	AD 
REC	THE	AD 
REC	VCP	AD 
RIA	POA	AD 
ROO	CGB	AD 
RVD	VCP	AD 
SJL	TFF	AD 
SLZ	CNF	AD 
SLZ	FOR	AD 
SLZ	THE	AD 
SSA	AJU	AD 
SSA	BPS	AD 
SSA	BRA	AD 
SSA	CNF	AD 
SSA	GRU	AD 
SSA	IOS	AD 
SSA	JPA	AD 
SSA	REC	AD 
SSA	VCP	AD 
SSA	VIX	AD 
STM	ATM	AD 
STM	BEL	AD 
STM	ITB	AD 
STM	MAO	AD 
STM	TMT	AD 
TBT	MAO	AD 
TFF	ERN	AD 
TFF	MAO	AD 
TFF	SJL	AD 
THE	FOR	AD 
THE	PHB	AD 
THE	REC	AD 
THE	SLZ	AD 
THE	VCP	AD 
TMT	STM	AD 
TUR	BEL	AD 
UBA	CNF	AD 
UBA	VCP	AD 
UDI	BSB	AD 
UDI	CNF	AD 
UDI	PLU	AD 
UDI	VCP	AD 
VCP	AJU	AD 
VCP	ARU	AD 
VCP	BPS	AD 
VCP	BSB	AD 
VCP	CAC	AD 
VCP	CCM	AD 
VCP	CFB	AD 
VCP	CGB	AD 
VCP	CGR	AD 
VCP	CNF	AD 
VCP	CWB	AD 
VCP	DOU	AD 
VCP	FLN	AD 
VCP	FOR	AD 
VCP	GYN	AD 
VCP	IOS	AD 
VCP	IZA	AD 
VCP	JPA	AD 
VCP	JTC	AD 
VCP	LDB	AD 
VCP	MAO	AD 
VCP	MCZ	AD 
VCP	MGF	AD 
VCP	NAT	AD 
VCP	PFB	AD 
VCP	PLU	AD 
VCP	POA	AD 
VCP	RAO	AD 
VCP	REC	AD 
VCP	RVD	AD 
VCP	SSA	AD 
VCP	THE	AD 
VCP	UBA	AD 
VCP	UDI	AD 
VCP	VIX	AD 
VCP	XAP	AD 
VIX	CNF	AD 
VIX	SSA	AD 
VIX	VCP	AD 
XAP	POA	AD 
XAP	VCP	AD 
CGO	RMQ	AE 
CGO	TPE	AE 
FOC	TSA	AE 
HAN	RMQ	AE 
HGH	KHH	AE 
HGH	RMQ	AE 
HKG	RMQ	AE 
HUN	KHH	AE 
ICN	KHH	AE 
KHH	HGH	AE 
KHH	HUN	AE 
KHH	ICN	AE 
KHH	XMN	AE 
NKG	TPE	AE 
RMQ	CGO	AE 
RMQ	HAN	AE 
RMQ	HGH	AE 
RMQ	HKG	AE 
RMQ	SGN	AE 
SGN	RMQ	AE 
SHE	TPE	AE 
TPE	CGO	AE 
TPE	NKG	AE 
TPE	SHE	AE 
TPE	XMN	AE 
TPE	YNZ	AE 
TSA	FOC	AE 
TSA	WNZ	AE 
WNZ	TSA	AE 
XMN	KHH	AE 
XMN	TPE	AE 
YNZ	TPE	AE 
ABE	ATL	AF 
ABJ	CDG	AF 
ABQ	ATL	AF 
ABV	CDG	AF 
ABY	ATL	AF 
ABZ	CDG	AF 
AEX	ATL	AF 
AGP	CDG	AF 
AJA	LGG	AF 
AJA	LYS	AF 
AJA	MRS	AF 
AJA	NCE	AF 
AJA	NTE	AF 
AJA	ORY	AF 
AJA	TLS	AF 
ALB	ATL	AF 
AMM	CDG	AF 
AMS	AUH	AF 
AMS	BOD	AF 
AMS	BSL	AF 
AMS	CDG	AF 
AMS	CFE	AF 
AMS	DOH	AF 
AMS	HRE	AF 
AMS	KGL	AF 
AMS	KUL	AF 
AMS	LCY	AF 
AMS	LYS	AF 
AMS	MRS	AF 
AMS	NCE	AF 
AMS	NTE	AF 
AMS	SXB	AF 
AMS	TLS	AF 
AMS	TPE	AF 
AMS	UIO	AF 
ANR	LCY	AF 
ARN	CDG	AF 
ATH	CDG	AF 
ATH	MRS	AF 
ATH	TLS	AF 
ATL	ABE	AF 
ATL	ABQ	AF 
ATL	ABY	AF 
ATL	AEX	AF 
ATL	ALB	AF 
ATL	ATW	AF 
ATL	AUS	AF 
ATL	AVL	AF 
ATL	AVP	AF 
ATL	BDL	AF 
ATL	BHM	AF 
ATL	BMI	AF 
ATL	BNA	AF 
ATL	BOS	AF 
ATL	BQK	AF 
ATL	BRU	AF 
ATL	BTR	AF 
ATL	BTV	AF 
ATL	BUF	AF 
ATL	BWI	AF 
ATL	CAE	AF 
ATL	CAK	AF 
ATL	CDG	AF 
ATL	CHA	AF 
ATL	CHS	AF 
ATL	CID	AF 
ATL	CLE	AF 
ATL	CLT	AF 
ATL	CMH	AF 
ATL	COS	AF 
ATL	CRW	AF 
ATL	CSG	AF 
ATL	CUN	AF 
ATL	CVG	AF 
ATL	CZM	AF 
ATL	DAB	AF 
ATL	DAL	AF 
ATL	DAY	AF 
ATL	DCA	AF 
ATL	DEN	AF 
ATL	DHN	AF 
ATL	DSM	AF 
ATL	DTW	AF 
ATL	DUB	AF 
ATL	ECP	AF 
ATL	ELP	AF 
ATL	EVV	AF 
ATL	EWN	AF 
ATL	EWR	AF 
ATL	EYW	AF 
ATL	FAY	AF 
ATL	FCO	AF 
ATL	FLL	AF 
ATL	FNT	AF 
ATL	FRA	AF 
ATL	FSM	AF 
ATL	FWA	AF 
ATL	GDL	AF 
ATL	GNV	AF 
ATL	GPT	AF 
ATL	GRB	AF 
ATL	GRK	AF 
ATL	GRR	AF 
ATL	GSO	AF 
ATL	GSP	AF 
ATL	HPN	AF 
ATL	HSV	AF 
ATL	IAD	AF 
ATL	IAH	AF 
ATL	ICT	AF 
ATL	ILM	AF 
ATL	IND	AF 
ATL	JAN	AF 
ATL	JAX	AF 
ATL	JFK	AF 
ATL	LAS	AF 
ATL	LAX	AF 
ATL	LFT	AF 
ATL	LGA	AF 
ATL	LHR	AF 
ATL	LIT	AF 
ATL	MAD	AF 
ATL	MAN	AF 
ATL	MCI	AF 
ATL	MCO	AF 
ATL	MDT	AF 
ATL	MDW	AF 
ATL	MEM	AF 
ATL	MEX	AF 
ATL	MIA	AF 
ATL	MKE	AF 
ATL	MLB	AF 
ATL	MLI	AF 
ATL	MLU	AF 
ATL	MOB	AF 
ATL	MSN	AF 
ATL	MSP	AF 
ATL	MSY	AF 
ATL	MTY	AF 
ATL	MUC	AF 
ATL	MYR	AF 
ATL	NAS	AF 
ATL	OKC	AF 
ATL	OMA	AF 
ATL	ORD	AF 
ATL	ORF	AF 
ATL	PBI	AF 
ATL	PDX	AF 
ATL	PHF	AF 
ATL	PHL	AF 
ATL	PHX	AF 
ATL	PIA	AF 
ATL	PIT	AF 
ATL	PNS	AF 
ATL	PTY	AF 
ATL	PVD	AF 
ATL	PWM	AF 
ATL	RIC	AF 
ATL	ROC	AF 
ATL	RSW	AF 
ATL	SAN	AF 
ATL	SAT	AF 
ATL	SAV	AF 
ATL	SBN	AF 
ATL	SDF	AF 
ATL	SEA	AF 
ATL	SFO	AF 
ATL	SGF	AF 
ATL	SHV	AF 
ATL	SJO	AF 
ATL	SJU	AF 
ATL	SLC	AF 
ATL	SMF	AF 
ATL	SNA	AF 
ATL	SRQ	AF 
ATL	STL	AF 
ATL	STR	AF 
ATL	SYR	AF 
ATL	TLH	AF 
ATL	TPA	AF 
ATL	TUL	AF 
ATL	TUS	AF 
ATL	TYS	AF 
ATL	VLD	AF 
ATL	VPS	AF 
ATL	XNA	AF 
ATL	YUL	AF 
ATL	YYZ	AF 
ATW	ATL	AF 
AUH	AMS	AF 
AUH	CDG	AF 
AUS	ATL	AF 
AVL	ATL	AF 
BCN	CDG	AF 
BCN	JFK	AF 
BDL	ATL	AF 
BEG	CDG	AF 
BEL	STM	AF 
BES	CDG	AF 
BES	LCY	AF 
BES	MRS	AF 
BES	ORY	AF 
BES	SOU	AF 
BEY	CDG	AF 
BGF	NSI	AF 
BHM	ATL	AF 
BHX	CDG	AF 
BHX	LYS	AF 
BIA	LGG	AF 
BIA	LYS	AF 
BIA	MRS	AF 
BIA	NCE	AF 
BIA	NTE	AF 
BIA	ORY	AF 
BIO	CDG	AF 
BKK	CDG	AF 
BKK	CNX	AF 
BKK	HKT	AF 
BKK	KBV	AF 
BKO	CDG	AF 
BLQ	CDG	AF 
BLQ	LYS	AF 
BLR	CDG	AF 
BMI	ATL	AF 
BNA	ATL	AF 
BOD	AMS	AF 
BOD	CDG	AF 
BOD	FCO	AF 
BOD	MRS	AF 
BOD	NTE	AF 
BOD	ORY	AF 
BOG	CDG	AF 
BOM	CDG	AF 
BOS	ATL	AF 
BOS	CDG	AF 
BOS	LHR	AF 
BQK	ATL	AF 
BRE	CDG	AF 
BRU	ATL	AF 
BRU	JFK	AF 
BRU	LYS	AF 
BRU	NTE	AF 
BSB	CDG	AF 
BSL	AMS	AF 
BSL	CDG	AF 
BTR	ATL	AF 
BUD	CDG	AF 
BUF	ATL	AF 
BWI	ATL	AF 
BZV	CDG	AF 
CAE	ATL	AF 
CAI	CDG	AF 
CAK	ATL	AF 
CAN	CDG	AF 
CAN	CKG	AF 
CAN	HGH	AF 
CAN	SHE	AF 
CAN	SIN	AF 
CAN	WUH	AF 
CAY	ORY	AF 
CCS	CDG	AF 
CDG	ABJ	AF 
CDG	ABV	AF 
CDG	ABZ	AF 
CDG	AGP	AF 
CDG	AMM	AF 
CDG	AMS	AF 
CDG	ARN	AF 
CDG	ATH	AF 
CDG	ATL	AF 
CDG	AUH	AF 
CDG	BCN	AF 
CDG	BEG	AF 
CDG	BES	AF 
CDG	BEY	AF 
CDG	BGF	AF 
CDG	BHX	AF 
CDG	BIO	AF 
CDG	BKK	AF 
CDG	BKO	AF 
CDG	BLQ	AF 
CDG	BLR	AF 
CDG	BOD	AF 
CDG	BOG	AF 
CDG	BOM	AF 
CDG	BOS	AF 
CDG	BRE	AF 
CDG	BSB	AF 
CDG	BSL	AF 
CDG	BUD	AF 
CDG	BZV	AF 
CDG	CAI	AF 
CDG	CAN	AF 
CDG	CCS	AF 
CDG	CFE	AF 
CDG	CKY	AF 
CDG	CMN	AF 
CDG	COO	AF 
CDG	CPH	AF 
CDG	CVG	AF 
CDG	DEL	AF 
CDG	DKR	AF 
CDG	DLA	AF 
CDG	DTW	AF 
CDG	DUB	AF 
CDG	DXB	AF 
CDG	EDI	AF 
CDG	EVN	AF 
CDG	EWR	AF 
CDG	EXT	AF 
CDG	EZE	AF 
CDG	FCO	AF 
CDG	FIH	AF 
CDG	FLR	AF 
CDG	FRA	AF 
CDG	GOA	AF 
CDG	GRU	AF 
CDG	GVA	AF 
CDG	GYD	AF 
CDG	HAJ	AF 
CDG	HAM	AF 
CDG	HAN	AF 
CDG	HAV	AF 
CDG	HEL	AF 
CDG	HKG	AF 
CDG	IAD	AF 
CDG	IAH	AF 
CDG	ICN	AF 
CDG	IST	AF 
CDG	JED	AF 
CDG	JFK	AF 
CDG	JIB	AF 
CDG	JNB	AF 
CDG	KIX	AF 
CDG	KUL	AF 
CDG	LAD	AF 
CDG	LAX	AF 
CDG	LBV	AF 
CDG	LCA	AF 
CDG	LFW	AF 
CDG	LHR	AF 
CDG	LIM	AF 
CDG	LIN	AF 
CDG	LIS	AF 
CDG	LJU	AF 
CDG	LOS	AF 
CDG	LYS	AF 
CDG	MAD	AF 
CDG	MAN	AF 
CDG	MEX	AF 
CDG	MIA	AF 
CDG	MPL	AF 
CDG	MRS	AF 
CDG	MSP	AF 
CDG	MUC	AF 
CDG	NAP	AF 
CDG	NBO	AF 
CDG	NCE	AF 
CDG	NCL	AF 
CDG	NIM	AF 
CDG	NSI	AF 
CDG	NTE	AF 
CDG	ORD	AF 
CDG	OSL	AF 
CDG	OTP	AF 
CDG	OUA	AF 
CDG	PEK	AF 
CDG	PHL	AF 
CDG	PIT	AF 
CDG	PRG	AF 
CDG	PTY	AF 
CDG	PUF	AF 
CDG	PVG	AF 
CDG	RBA	AF 
CDG	RIX	AF 
CDG	RNS	AF 
CDG	ROB	AF 
CDG	RUH	AF 
CDG	SCL	AF 
CDG	SEA	AF 
CDG	SFO	AF 
CDG	SGN	AF 
CDG	SIN	AF 
CDG	SLC	AF 
CDG	SOF	AF 
CDG	STR	AF 
CDG	SVG	AF 
CDG	SVO	AF 
CDG	TBS	AF 
CDG	TLS	AF 
CDG	TNR	AF 
CDG	TUN	AF 
CDG	TXL	AF 
CDG	VCE	AF 
CDG	VGO	AF 
CDG	VIE	AF 
CDG	VLC	AF 
CDG	WAW	AF 
CDG	WUH	AF 
CDG	YUL	AF 
CDG	YYZ	AF 
CDG	ZAG	AF 
CDG	ZRH	AF 
CFE	AMS	AF 
CFE	CDG	AF 
CFE	ORY	AF 
CGK	KUL	AF 
CHA	ATL	AF 
CHS	ATL	AF 
CID	ATL	AF 
CKG	CAN	AF 
CKG	LXA	AF 
CKY	CDG	AF 
CLE	ATL	AF 
CLT	ATL	AF 
CMH	ATL	AF 
CMN	CDG	AF 
CMN	TLS	AF 
CNX	BKK	AF 
COO	CDG	AF 
CPH	CDG	AF 
CRW	ATL	AF 
CSG	ATL	AF 
CUN	ATL	AF 
CVG	ATL	AF 
CVG	CDG	AF 
CWB	BSB	AF 
CZM	ATL	AF 
DAB	ATL	AF 
DAL	ATL	AF 
DAY	ATL	AF 
DCA	ATL	AF 
DEL	CDG	AF 
DEN	ATL	AF 
DHN	ATL	AF 
DKR	CDG	AF 
DLA	CDG	AF 
DLA	SSG	AF 
DOH	AMS	AF 
DOH	MCT	AF 
DRS	LCY	AF 
DSM	ATL	AF 
DTW	ATL	AF 
DTW	CDG	AF 
DTW	FRA	AF 
DTW	LHR	AF 
DTW	MSY	AF 
DUB	ATL	AF 
DUB	CDG	AF 
DUB	JFK	AF 
DUB	LCY	AF 
DXB	CDG	AF 
EBB	AMS	AF 
ECP	ATL	AF 
EDI	CDG	AF 
EGC	EXT	AF 
EGC	SOU	AF 
ELP	ATL	AF 
EVN	CDG	AF 
EVV	ATL	AF 
EWN	ATL	AF 
EWR	ATL	AF 
EWR	CDG	AF 
EXT	CDG	AF 
EXT	EGC	AF 
EXT	RNS	AF 
EYW	ATL	AF 
EZE	CDG	AF 
EZE	MVD	AF 
FAY	ATL	AF 
FCO	ATL	AF 
FCO	BOD	AF 
FCO	CDG	AF 
FCO	LCY	AF 
FCO	LYS	AF 
FCO	MPL	AF 
FCO	MRS	AF 
FCO	NCE	AF 
FCO	SXB	AF 
FCO	TLS	AF 
FIH	CDG	AF 
FLL	ATL	AF 
FLR	CDG	AF 
FLR	LCY	AF 
FLR	LYS	AF 
FNA	CDG	AF 
FNT	ATL	AF 
FRA	ATL	AF 
FRA	CDG	AF 
FRA	DTW	AF 
FRA	JFK	AF 
FSM	ATL	AF 
FWA	ATL	AF 
GDL	ATL	AF 
GNV	ATL	AF 
GOA	CDG	AF 
GPT	ATL	AF 
GRB	ATL	AF 
GRK	ATL	AF 
GRR	ATL	AF 
GRU	CDG	AF 
GSO	ATL	AF 
GSP	ATL	AF 
GUA	ATL	AF 
GVA	CDG	AF 
GYD	CDG	AF 
GYE	AMS	AF 
HAH	NBO	AF 
HAJ	CDG	AF 
HAM	CDG	AF 
HAM	TLS	AF 
HAN	CDG	AF 
HAV	CDG	AF 
HEL	CDG	AF 
HKG	CDG	AF 
HKT	BKK	AF 
HNL	LAX	AF 
HPN	ATL	AF 
HRE	LUN	AF 
HRE	NBO	AF 
HSV	ATL	AF 
IAD	ATL	AF 
IAD	CDG	AF 
IAH	ATL	AF 
IAH	CDG	AF 
ICN	CDG	AF 
ICT	ATL	AF 
ILM	ATL	AF 
IND	ATL	AF 
IST	CDG	AF 
IST	MRS	AF 
JAN	ATL	AF 
JAX	ATL	AF 
JED	CDG	AF 
JFK	ATL	AF 
JFK	BCN	AF 
JFK	BRU	AF 
JFK	CDG	AF 
JFK	DUB	AF 
JFK	FRA	AF 
JFK	LHR	AF 
JFK	MAD	AF 
JFK	MSY	AF 
JFK	NCE	AF 
JIB	CDG	AF 
JNB	CDG	AF 
KBV	BKK	AF 
KGL	BJM	AF 
KGL	EBB	AF 
KIX	CDG	AF 
KMG	CAN	AF 
KUL	AMS	AF 
KUL	CDG	AF 
KUL	CGK	AF 
LAD	CDG	AF 
LAS	ATL	AF 
LAX	ATL	AF 
LAX	CDG	AF 
LAX	MSP	AF 
LAX	OGG	AF 
LAX	PPT	AF 
LBV	CDG	AF 
LCA	CDG	AF 
LCY	AMS	AF 
LCY	ANR	AF 
LCY	BES	AF 
LCY	DRS	AF 
LCY	DUB	AF 
LCY	FCO	AF 
LCY	FLR	AF 
LCY	LIN	AF 
LCY	NTE	AF 
LCY	ORY	AF 
LCY	RTM	AF 
LFT	ATL	AF 
LFW	CDG	AF 
LGA	ATL	AF 
LGG	AJA	AF 
LGG	BIA	AF 
LHR	ATL	AF 
LHR	BOS	AF 
LHR	CDG	AF 
LHR	DTW	AF 
LHR	JFK	AF 
LHR	MSP	AF 
LHR	SEA	AF 
LIG	SOU	AF 
LIL	MRS	AF 
LIL	NCE	AF 
LIM	CDG	AF 
LIN	CDG	AF 
LIN	LCY	AF 
LIN	ORY	AF 
LIR	ATL	AF 
LIS	CDG	AF 
LIT	ATL	AF 
LJU	CDG	AF 
LLW	LUN	AF 
LLW	NBO	AF 
LOS	CDG	AF 
LRH	PIS	AF 
LRH	SOU	AF 
LUN	AMS	AF 
LUN	HRE	AF 
LUN	LLW	AF 
LUN	NBO	AF 
LVI	HRE	AF 
LXA	CKG	AF 
LYS	AJA	AF 
LYS	AMS	AF 
LYS	BHX	AF 
LYS	BIA	AF 
LYS	BLQ	AF 
LYS	BRU	AF 
LYS	CDG	AF 
LYS	FCO	AF 
LYS	FLR	AF 
LYS	NCE	AF 
LYS	ORY	AF 
LYS	PIS	AF 
LYS	PRG	AF 
LYS	TLS	AF 
LYS	VCE	AF 
LYS	VIE	AF 
MAD	ATL	AF 
MAD	CDG	AF 
MAD	JFK	AF 
MAD	ORY	AF 
MAN	ATL	AF 
MAN	CDG	AF 
MAN	NTE	AF 
MAO	GRU	AF 
MBJ	ATL	AF 
MCI	ATL	AF 
MCO	ATL	AF 
MCT	DOH	AF 
MDT	ATL	AF 
MDW	ATL	AF 
MEM	ATL	AF 
MEX	ATL	AF 
MEX	CDG	AF 
MIA	ATL	AF 
MIA	CDG	AF 
MKE	ATL	AF 
MLB	ATL	AF 
MLI	ATL	AF 
MLU	ATL	AF 
MNL	TPE	AF 
MOB	ATL	AF 
MPL	CDG	AF 
MPL	FCO	AF 
MPL	ORY	AF 
MRS	AJA	AF 
MRS	AMS	AF 
MRS	ATH	AF 
MRS	BES	AF 
MRS	BIA	AF 
MRS	BOD	AF 
MRS	CDG	AF 
MRS	FCO	AF 
MRS	IST	AF 
MRS	LIL	AF 
MRS	NTE	AF 
MRS	ORY	AF 
MRS	PRG	AF 
MRS	RAK	AF 
MRS	RNS	AF 
MRS	SVO	AF 
MRS	TUN	AF 
MRS	TXL	AF 
MRS	VCE	AF 
MSN	ATL	AF 
MSP	ATL	AF 
MSP	CDG	AF 
MSP	LAX	AF 
MSP	LHR	AF 
MSP	MSY	AF 
MSP	SEA	AF 
MSP	SFO	AF 
MSY	ATL	AF 
MSY	DTW	AF 
MSY	JFK	AF 
MSY	MSP	AF 
MTY	ATL	AF 
MUC	ATL	AF 
MUC	CDG	AF 
MVD	EZE	AF 
MYR	ATL	AF 
NAP	CDG	AF 
NAS	ATL	AF 
NBO	CDG	AF 
NBO	HRE	AF 
NBO	KGL	AF 
NBO	LLW	AF 
NBO	LUN	AF 
NBO	LVI	AF 
NBS	SHE	AF 
NCE	AJA	AF 
NCE	AMS	AF 
NCE	BIA	AF 
NCE	CDG	AF 
NCE	FCO	AF 
NCE	JFK	AF 
NCE	LIL	AF 
NCE	LYS	AF 
NCE	NTE	AF 
NCE	ORY	AF 
NCE	SOU	AF 
\.