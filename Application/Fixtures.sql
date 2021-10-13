

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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.pancakes DISABLE TRIGGER ALL;

INSERT INTO public.pancakes (id, recipient, iban, email, amount, description, forwhat, notes, fileurl) VALUES ('72a3a03a-422c-46fd-be50-f4c9bbe90d62', 'Hugo', 'NL30ABNA3019410312', 'hpeters1024@gmail.com', 1, '', '', '', NULL);
INSERT INTO public.pancakes (id, recipient, iban, email, amount, description, forwhat, notes, fileurl) VALUES ('014cb984-0532-4b35-b858-c2269f39e231', 'Hugo', 'NL30ABNA3019410312', 'hpeters1024@gmail.com', 92939, '', '', '', NULL);
INSERT INTO public.pancakes (id, recipient, iban, email, amount, description, forwhat, notes, fileurl) VALUES ('c00db364-e422-4c53-93e6-6ce6a56b907c', 'Hugo', 'NL30ABNA3019410312', 'hpeters1024@gmail.com', 1, '', '', '', NULL);
INSERT INTO public.pancakes (id, recipient, iban, email, amount, description, forwhat, notes, fileurl) VALUES ('281bd742-b526-4c0b-8001-9c1c89e072a9', 'Hugo', 'NL30ABNA3019410312', 'hpeters1024@gmail.com', 100, '', '', '', NULL);
INSERT INTO public.pancakes (id, recipient, iban, email, amount, description, forwhat, notes, fileurl) VALUES ('e22b7bae-e135-4188-8a57-d8b19fb9bc76', 'Hugo', 'NL30ABNA3019410312', 'hpeters1024@gmail.com', 1, '', '', '', NULL);


ALTER TABLE public.pancakes ENABLE TRIGGER ALL;


