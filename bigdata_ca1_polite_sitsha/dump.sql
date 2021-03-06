PGDMP                     
    v            bigdata_ca1_polite_sitsha    10.5    10.5 3    )           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            *           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            +           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            ,           1262    41100    bigdata_ca1_polite_sitsha    DATABASE     �   CREATE DATABASE bigdata_ca1_polite_sitsha WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_Ireland.1252' LC_CTYPE = 'English_Ireland.1252';
 )   DROP DATABASE bigdata_ca1_polite_sitsha;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            -           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            .           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    41114    actors    TABLE     _   CREATE TABLE public.actors (
    actor_id integer NOT NULL,
    name character varying(100)
);
    DROP TABLE public.actors;
       public         postgres    false    3            �            1259    41112    actors_actor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.actors_actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.actors_actor_id_seq;
       public       postgres    false    3    199            /           0    0    actors_actor_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.actors_actor_id_seq OWNED BY public.actors.actor_id;
            public       postgres    false    198            �            1259    41203    comments    TABLE     ~   CREATE TABLE public.comments (
    comment_id integer NOT NULL,
    user_id integer,
    post_id integer,
    comment text
);
    DROP TABLE public.comments;
       public         postgres    false    3            �            1259    41201    comments_comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comments_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.comments_comment_id_seq;
       public       postgres    false    206    3            0           0    0    comments_comment_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.comments_comment_id_seq OWNED BY public.comments.comment_id;
            public       postgres    false    205            �            1259    41133    movie_actors    TABLE     c   CREATE TABLE public.movie_actors (
    movie_id integer NOT NULL,
    actor_id integer NOT NULL
);
     DROP TABLE public.movie_actors;
       public         postgres    false    3            �            1259    41103    movies    TABLE     �   CREATE TABLE public.movies (
    movie_id integer NOT NULL,
    title text,
    writer character varying(100),
    year integer,
    franchise text,
    synopsis text
);
    DROP TABLE public.movies;
       public         postgres    false    3            �            1259    41101    movies_movie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.movies_movie_id_seq;
       public       postgres    false    197    3            1           0    0    movies_movie_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.movies_movie_id_seq OWNED BY public.movies.movie_id;
            public       postgres    false    196            �            1259    41187    posts    TABLE     �   CREATE TABLE public.posts (
    post_id integer NOT NULL,
    user_id integer,
    title character varying(100),
    body text
);
    DROP TABLE public.posts;
       public         postgres    false    3            �            1259    41185    posts_post_id_seq    SEQUENCE     �   CREATE SEQUENCE public.posts_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.posts_post_id_seq;
       public       postgres    false    3    204            2           0    0    posts_post_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.posts_post_id_seq OWNED BY public.posts.post_id;
            public       postgres    false    203            �            1259    41150    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(100),
    first_name character varying(100),
    last_name character varying(100)
);
    DROP TABLE public.users;
       public         postgres    false    3            �            1259    41148    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public       postgres    false    202    3            3           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
            public       postgres    false    201            �
           2604    41117    actors actor_id    DEFAULT     r   ALTER TABLE ONLY public.actors ALTER COLUMN actor_id SET DEFAULT nextval('public.actors_actor_id_seq'::regclass);
 >   ALTER TABLE public.actors ALTER COLUMN actor_id DROP DEFAULT;
       public       postgres    false    199    198    199            �
           2604    41206    comments comment_id    DEFAULT     z   ALTER TABLE ONLY public.comments ALTER COLUMN comment_id SET DEFAULT nextval('public.comments_comment_id_seq'::regclass);
 B   ALTER TABLE public.comments ALTER COLUMN comment_id DROP DEFAULT;
       public       postgres    false    205    206    206            �
           2604    41106    movies movie_id    DEFAULT     r   ALTER TABLE ONLY public.movies ALTER COLUMN movie_id SET DEFAULT nextval('public.movies_movie_id_seq'::regclass);
 >   ALTER TABLE public.movies ALTER COLUMN movie_id DROP DEFAULT;
       public       postgres    false    196    197    197            �
           2604    41190    posts post_id    DEFAULT     n   ALTER TABLE ONLY public.posts ALTER COLUMN post_id SET DEFAULT nextval('public.posts_post_id_seq'::regclass);
 <   ALTER TABLE public.posts ALTER COLUMN post_id DROP DEFAULT;
       public       postgres    false    203    204    204            �
           2604    41153    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public       postgres    false    202    201    202                      0    41114    actors 
   TABLE DATA               0   COPY public.actors (actor_id, name) FROM stdin;
    public       postgres    false    199   6       &          0    41203    comments 
   TABLE DATA               I   COPY public.comments (comment_id, user_id, post_id, comment) FROM stdin;
    public       postgres    false    206   6                  0    41133    movie_actors 
   TABLE DATA               :   COPY public.movie_actors (movie_id, actor_id) FROM stdin;
    public       postgres    false    200   &7                 0    41103    movies 
   TABLE DATA               T   COPY public.movies (movie_id, title, writer, year, franchise, synopsis) FROM stdin;
    public       postgres    false    197   Z7       $          0    41187    posts 
   TABLE DATA               >   COPY public.posts (post_id, user_id, title, body) FROM stdin;
    public       postgres    false    204   G9       "          0    41150    users 
   TABLE DATA               I   COPY public.users (user_id, username, first_name, last_name) FROM stdin;
    public       postgres    false    202   :       4           0    0    actors_actor_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.actors_actor_id_seq', 1, false);
            public       postgres    false    198            5           0    0    comments_comment_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.comments_comment_id_seq', 1, false);
            public       postgres    false    205            6           0    0    movies_movie_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.movies_movie_id_seq', 1, false);
            public       postgres    false    196            7           0    0    posts_post_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.posts_post_id_seq', 1, false);
            public       postgres    false    203            8           0    0    users_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);
            public       postgres    false    201            �
           2606    41119    actors actors_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (actor_id);
 <   ALTER TABLE ONLY public.actors DROP CONSTRAINT actors_pkey;
       public         postgres    false    199            �
           2606    41211    comments comments_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comment_id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public         postgres    false    206            �
           2606    41137    movie_actors movie_actors_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.movie_actors
    ADD CONSTRAINT movie_actors_pkey PRIMARY KEY (movie_id, actor_id);
 H   ALTER TABLE ONLY public.movie_actors DROP CONSTRAINT movie_actors_pkey;
       public         postgres    false    200    200            �
           2606    41111    movies movies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (movie_id);
 <   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_pkey;
       public         postgres    false    197            �
           2606    41195    posts posts_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (post_id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public         postgres    false    204            �
           2606    41155    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    202            �
           2606    41217    comments comments_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(post_id);
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_post_id_fkey;
       public       postgres    false    2715    204    206            �
           2606    41212    comments comments_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_user_id_fkey;
       public       postgres    false    202    2713    206            �
           2606    41143 '   movie_actors movie_actors_actor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movie_actors
    ADD CONSTRAINT movie_actors_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actors(actor_id);
 Q   ALTER TABLE ONLY public.movie_actors DROP CONSTRAINT movie_actors_actor_id_fkey;
       public       postgres    false    200    199    2709            �
           2606    41138 '   movie_actors movie_actors_movie_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movie_actors
    ADD CONSTRAINT movie_actors_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id);
 Q   ALTER TABLE ONLY public.movie_actors DROP CONSTRAINT movie_actors_movie_id_fkey;
       public       postgres    false    197    200    2707            �
           2606    41196    posts posts_user_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 B   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_user_id_fkey;
       public       postgres    false    2713    204    202               a   x��A
�0���S�	����Q)q�f �	�&z��7�b��]�q���b�_j�#=�4�&?�]0�����!7�Wi��ַl���^yU/�^ ��v      &   �   x����@D�ۯ*:�
팍�͆[��g��Ŀ����ͼL�׹sz�iÔ\2yx�Xѱ���g�:c	*yo�������ֆOH�M`� �Q4���*��ZE��UC�c��1
+��n��n\oy˂�iS_>�<��q ��c5�          $   x�3�4�2�4�2�4b.c ߘ��͸b���� C��         �  x��R]o�@|��� 5iA*oI �
P��֗��9�r�5���Ϯ�Ji��bEg�����,��5]���u��rs�;t�y���������&O�*�`g�d��3�d=�1�X{�����7���a�1Qh�+������b�|⺶�=�y�)9>@���} X��R,n?�{vG�^X��3t���f@���j!1�7hD	�#@���$i8�Ȇ��Ȍёh�d|aOn���}�p@�7�(���	&*B�QK-���˫g>�~y�3P�D�-��i���5r�Qu�M�*8yޠ1b��H"�s�Y�Kُ6u".6X�l�A������8���m��	�qO�fڊ2v�D'%��0mD+m@�~��͢|���~��5L:xj{���s=�
+@ǲ���3����Cw��M�����e����ӹ͏�j�\V�N8�����sl��\�l�5�S�UH��6�$^�p�(��/�*�      $   �   x�M�;n�@D��S�	�� EjC�&-��Lr��ai��g�v�@fl�� �J�[��s��
&��M+S3,ҍ�>��3U�&]Q&n^B���ݎ��T6�r~c�U��S�Q�=&�#��<�Z1�y~J��*��m0�b_J�#^�u����u���#�K�7��}�� H�\|�h�1.X�\�9>� XL\�      "   5   x�3�t��Oq/�t/JM��N�ˈ38�47)1=�$�,���b���� } �     