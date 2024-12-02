use mydb;

 /* 1. Показать все публикации с их авторами (объединение и преобразование столбцов в строки).*/
/*SELECT naimenovanie AS book, GROUP_CONCAT(fullname ORDER BY fullname SEPARATOR ', ') AS authors
FROM publication
JOIN publication_has_author ON (publication.id=publication_has_author.publication_id)
JOIN author ON (publication_has_author.author_id=author.id)
GROUP BY publication_id
ORDER BY naimenovanie;
*/

/*2. Анализ публикационной активности сотрудников КФУ, а именно число публикаций и число цитирований из публикаций
SELECT fullname AS author, org_podrazdelenie as department, COUNT(*) AS kolvo, SUM(quotation) AS  sum_quotation
FROM publication
 JOIN publication_has_author ON (publication.id=publication_has_author.publication_id)
 JOIN author ON (publication_has_author.author_id=author.id)
WHERE organization='Казанский федеральный университет'
GROUP BY fullname
ORDER BY fullname;*/

/*3. Публикации с цитируемостью больше 3 по тематике "Математика", выпущенные в журналах из перечня ВАК */
SELECT naimenovanie AS book, quotation, tematika, nazvanie AS journal
FROM publication
JOIN journal ON (publication.journal_id=journal.id)
WHERE tematika = 'Математика' AND quotation >= '3' AND vak = '1'
ORDER BY naimenovanie;