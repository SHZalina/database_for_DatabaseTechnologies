# База данных для учёта научных публикаций 📚
База данных была разработана в рамках курса __«Технологии баз данных»__ для хранения информации о различных публикациях, их авторах и журналах, в которых они были опубликованы. 

Среда разработки - __MySQL Workbench__.  ![image](https://github.com/user-attachments/assets/adfe9630-705f-4034-984e-7d2c7bf84bfd)


## Схема БД со связями
<p align="center">
  <img src="https://github.com/user-attachments/assets/e70716e5-06d7-4e23-842e-5a64da141e99" width="700">
</p>


1) Заполненная таблица __«author»__:
  <img src="https://github.com/user-attachments/assets/0b12e06d-c49a-4322-8ae3-5b5bfb7cca96" width="700">

2) Заполненная таблица __«publication_type»__:


   <img src="https://github.com/user-attachments/assets/c3c0fb60-d54a-4223-8362-765b96cd2dc1" width="300">

3) Заполненная таблица __«journal»__ (перед этим были внесены данные в родительскую таблицу «rubrika»):
  <img src="https://github.com/user-attachments/assets/cbc0653a-a288-418c-9cf5-0f8d24184b83" width="700">

4) Заполненная таблица __«publication»__:


   <img src="https://github.com/user-attachments/assets/da2504a9-6b3b-4c61-90dc-d60326bf2805" width="700">

5) Часть заполненной таблицы __«publication_has_author»__:



    <img src="https://github.com/user-attachments/assets/21285f93-9b31-446f-b9e3-d44ba9a07fd7" width="200">

## Запросы к базе данных - [selects_forDB](https://github.com/SHZalina/database_for_DatabaseTechnologies/blob/main/selects_forDB.sql)
* В результате работы первого запроса были выведены все публикации с их авторами. Данный запрос объединяет и преобразовывает значения столбцов c одинаковым id публикации в строки, сортирует выходные данные по алфавиту:
![запрос1](https://github.com/user-attachments/assets/2c90c8b0-1027-4cb2-9613-ec12b9545991)

* Второй запрос с  *__агрегирующими функциями COUNT__* и *__SUM__*. Он выводит авторов, которые являются сотрудниками КФУ, общее число их публикаций и общее число цитирований из публикаций:
![запрос2](https://github.com/user-attachments/assets/47b65c58-6523-44a6-9332-f7c9bca03f23)

* Третий запрос *__со составным условием__* для вывода публикаций с цитируемостью больше 3 по тематике "Математика", выпущенных в журналах из перечня ВАК и отсортированных по алфавиту:
![запрос3](https://github.com/user-attachments/assets/98875aa2-074a-4100-b5ff-8579e3d4875e)

Также были созданы представления по запросам, описанным выше. 

## Триггеры и хранимые процедуры - [triggers.txt](https://github.com/SHZalina/database_for_DatabaseTechnologies/blob/main/triggers.txt) и [procedures.txt](https://github.com/SHZalina/database_for_DatabaseTechnologies/blob/main/procedures.txt)
1. Триггер для того, чтобы вводимые ФИО для авторов начинались с заглавной буквы.
   Добавим нового автора и проверим созданный триггер:
```
INSERT INTO author
VALUES ('10', 'DEMIDOV DIMA', 'dsnbbsd', 'dss', 'ssss', ' мужской');
```
   ![trigger1](https://github.com/user-attachments/assets/8c1f6650-a6fb-4928-9954-06efc4c82cc7)
   
2. В таблице «publication» есть поле _quotation_, которое содержит в себе информацию о количестве цитирований конкретной публикации в других работах. Количество цитирований не может быть отрицательным. Реализованный триггер *__publ_qotation_in__*) не позволяет пользователю вводить отрицательные значения в данное поле, а триггер __publ_qotation_up__ – изменять текущее значение на отрицательное.
Для проверки работы данных триггеров попробуем изменить значение поля quotation на отрицательное записи с id = 3:
```
UPDATE publication
SET quotation = '-1'
WHERE id = 3;
```
Результат работы триггера:
![trigger23](https://github.com/user-attachments/assets/0898acdb-b500-466a-8a8a-66dfc099cfbd)

3. В таблице «journal» есть поле _amount_quotation_, которое содержит в себе суммарную цитируемость всех публикаций конкретного журнала, то есть сумму цитируемости всех публикаций, выпущенных данным журналом. Были написаны триггеры, которые будут обновлять значения в данном столбце, если происходит добавление, изменение или удаление научной публикации конкретного журнала - *__sum_quot_afterinsert__*,* __sum_quot_afterupdate__ *и *__sum_quot_afterdelete__*.
   Каждый из трех триггеров был успешно протестирован. Результат работы одного из них представлен ниже.
   ![триггер4](https://github.com/user-attachments/assets/f93a39be-e134-4b6f-b9fa-fae5fe9453b1)
   
4. Также была реализована хранимая процедура, которая получает в качестве входного параметра ФИО автора и возвращает информацию о его публикациях:



   ![bookby](https://github.com/user-attachments/assets/24e85621-950b-40a8-b721-9aff61053c55)
   
5. Вторая процедура добавляет нового автора. В качестве входных параметров получает id, ФИО автора, организацию, в которой тот работает или учится, подразделение, должность и пол:
  <img src="https://github.com/user-attachments/assets/c02090d0-817f-429f-bd66-c1ff851ae338" width="500">









