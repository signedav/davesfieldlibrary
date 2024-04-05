-- kill the duplicates
DELETE FROM davsfldbrry_v1books_bookautor as ba1 WHERE (SELECT COUNT(*) FROM davsfldbrry_v1books_bookautor as ba2 WHERE ba1.t_ili_tid_book = ba2.t_ili_tid_book AND ba1.t_ili_tid_autor = ba2.t_ili_tid_autor) > 1;
-- kill the zombies
DELETE FROM davsfldbrry_v1books_bookautor WHERE t_ili_tid_book IS NULL OR t_ili_tid_autor IS NULL;
-- update the fks
UPDATE davsfldbrry_v1books_bookautor SET book = (SELECT T_Id FROM book WHERE T_Ili_Tid = t_ili_tid_book), autor = (SELECT T_Id FROM autor WHERE T_Ili_Tid = t_ili_tid_autor);

