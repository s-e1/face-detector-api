PGDMP     .                    y            face_detector    13.1    13.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16452    face_detector    DATABASE     i   CREATE DATABASE face_detector WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Hebrew_Israel.1255';
    DROP DATABASE face_detector;
                postgres    false            �            1259    16471    login    TABLE     z   CREATE TABLE public.login (
    id integer NOT NULL,
    hash character varying(100) NOT NULL,
    email text NOT NULL
);
    DROP TABLE public.login;
       public         heap    postgres    false            �            1259    16469    login_id_seq    SEQUENCE     �   CREATE SEQUENCE public.login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.login_id_seq;
       public          postgres    false    203            �           0    0    login_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.login_id_seq OWNED BY public.login.id;
          public          postgres    false    202            �            1259    16457    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100),
    email text NOT NULL,
    entries bigint DEFAULT 0,
    joined timestamp without time zone NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16455    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    201            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    200            ,           2604    16474    login id    DEFAULT     d   ALTER TABLE ONLY public.login ALTER COLUMN id SET DEFAULT nextval('public.login_id_seq'::regclass);
 7   ALTER TABLE public.login ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            *           2604    16460    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201            �          0    16471    login 
   TABLE DATA           0   COPY public.login (id, hash, email) FROM stdin;
    public          postgres    false    203   �       �          0    16457    users 
   TABLE DATA           A   COPY public.users (id, name, email, entries, joined) FROM stdin;
    public          postgres    false    201   �       �           0    0    login_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.login_id_seq', 11, true);
          public          postgres    false    202            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 14, true);
          public          postgres    false    200            2           2606    16481    login login_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.login DROP CONSTRAINT login_email_key;
       public            postgres    false    203            4           2606    16479    login login_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.login DROP CONSTRAINT login_pkey;
       public            postgres    false    203            .           2606    16468    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    201            0           2606    16466    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    201            �     x�M�9��@  ���c�Fl�/ Ȏ���$�4����"�~f�|x<�#�?<�sv籴��M�����9�|�A.�\�ej��%%6�+�;�R���U�(�kS��r��&1K�"x�C[�%׉}�)�Gd��=_�0I�]�v��G_ݷ��%|e`�����w��mn�L���1 	ѓS��mvw8�K�[n@/�ف{a�g�+�L��b$�C��Qd'�g�W�j��t��=�z��R
Y$Ĉ�Y6}m�ec���N�i��܃S�V�{)\ˢ}�4�h�}�}�<�JMM����(��T��,���}i&k���e���p�W��nzȇ��l���}ߛ�T�B4\KF;<\�����O���,y����Q����eqk����A���+�m�.������«���G�f�td�FJ'�EG໙W�GK����yn9�1�c��儘ر��C$$��0�:J�3V�VS\F���I
㐚i�_�Y߻l�x�~�L�˩T�(�By�YϮ"'}:��N=�����uVjA=�?M�9��      �     x�}��n�0Eg�+��!���ǔ���]��h�Β�-��� U�"��^]R�鼟�he�>��	��#	��ג;�E�xF��)l�i�j��E	I��g��:�MC�൐ ���ž���\(#{u�����j�(wą�a
��b��o��%d��.�������T�Q5���S�v柷����10����$7@�Yl�c	ٱ��0^/���p_(b�T�޻PQFm�
&���$��G��q�ΗQSv/��?��     