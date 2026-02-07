-- Пароли от пользователей - qwe

INSERT INTO roles(name)
VALUES ('ADMIN'),
       ('USER');

INSERT INTO users(name, surname, email, password, enabled, role_id)
VALUES ('Denis', 'Eroshevskii', 'denis.eroshevskii@gmail.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'USER')),

       ('Admin', 'Admin', 'admin@filehub.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'ADMIN')),

       ('Ivan', 'Petrov', 'ivan.petrov@mail.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'USER')),

       ('Anna', 'Smirnova', 'anna.smirnova@mail.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'USER')),

       ('Alex', 'Kim', 'alex.kim@mail.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'USER')),
       ('Sergey', 'Ivanov', 'sergey.ivanov@mail.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'USER')),

       ('Olga', 'Sidorova', 'olga.sidorova@mail.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'USER')),

       ('Dmitry', 'Kuznetsov', 'dmitry.kuznetsov@mail.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'USER')),

       ('Maria', 'Popova', 'maria.popova@mail.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'USER')),

       ('Andrey', 'Volkov', 'andrey.volkov@mail.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'USER')),

       ('Elena', 'Fedorova', 'elena.fedorova@mail.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'USER')),

       ('Pavel', 'Morozov', 'pavel.morozov@mail.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'USER')),

       ('Natalia', 'Orlova', 'natalia.orlova@mail.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'USER')),

       ('Roman', 'Belov', 'roman.belov@mail.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'USER')),

       ('Irina', 'Nikolaeva', 'irina.nikolaeva@mail.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'USER')),

       ('Maxim', 'Egorov', 'maxim.egorov@mail.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'USER')),

       ('Tatiana', 'Alexeeva', 'tatiana.alexeeva@mail.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'USER')),

       ('Kirill', 'Semenov', 'kirill.semenov@mail.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'USER')),

       ('Yulia', 'Pavlova', 'yulia.pavlova@mail.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'USER')),

       ('Artem', 'Bogdanov', 'artem.bogdanov@mail.com',
        '$2a$12$EMStRx/8aQRc2h0RQ3WzA.Zvd.0d9jGfMeFJ/nboWVZiTPXVnxEii',
        true, (SELECT id FROM roles WHERE NAME = 'USER'));;

INSERT INTO content_types(name, mime_type, extension, description)
VALUES ('JPEG Image', 'image/jpeg', 'jpg', 'JPEG Image Format known as - JPEG/JPG format'),
       ('PNG Image', 'image/png', 'png', 'Portable Network Graphics known as - PNG format'),

       ('MP4 Video', 'video/mp4', 'mp4', 'MPEG-4 Video Format known as - MP4 format'),
       ('MP3 Audio', 'audio/mpeg', 'mp3', 'MPEG Audio Layer III known as - MP3 format'),

       ('ZIP Archive', 'application/zip', 'zip', 'ZIP Archive Format known as - ZIP format'),
       ('PDF Document', 'application/pdf', 'pdf', 'Portable Document Format known as - PDF format'),
       ('Text Document', 'text/plain', 'txt', 'Plain Text Document known as - TXT format'),

       ('Microsoft Word', 'application/msword', 'doc', 'Microsoft Word Document known as - DOC format'),
       ('Microsoft Excel', 'application/vnd.ms-excel', 'xls', 'Microsoft Excel Spreadsheet known as - XLS format'),
       ('Microsoft Word (OpenXML)', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'docx',
        'Microsoft Word Document in OpenXML format known as - DOCX format'),
       ('Microsoft Excel (OpenXML)', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'xlsx',
        'Microsoft Excel Spreadsheet in OpenXML format known as - XLSX format');

INSERT INTO file_categories(name, description)
VALUES ('Documents', 'Common document files like TXT, XLS, PDF, DOC, DOCX'),
       ('Images', 'Common image files like JPG, PNG, GIF, JPEG'),
       ('Videos', 'Common video files like MP4, AVI, FLV, MOV'),
       ('Audio', 'Common audio files like MP3, WAV, FLAC'),
       ('Archives', 'Common archive files like ZIP, RAR, 7Z');

INSERT INTO files(name, size, upload_date, user_id, file_category_id, content_type_id, is_public, path_name,
                  download_count)
VALUES ('Отчет по проекту', 204800, CURRENT_TIMESTAMP - INTERVAL '10' DAY,
        (SELECT id FROM users WHERE email = 'denis.eroshevskii@gmail.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'PDF Document'), true, 'files/report.pdf', 15),
       ('Резюме', 153600, CURRENT_TIMESTAMP - INTERVAL '5' DAY,
        (SELECT id FROM users WHERE email = 'denis.eroshevskii@gmail.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'Microsoft Word (OpenXML)'), false, 'files/resume.docx', 3),
       ('Бюджет на 2024', 409600, CURRENT_TIMESTAMP - INTERVAL '3' DAY,
        (SELECT id FROM users WHERE email = 'denis.eroshevskii@gmail.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'Microsoft Excel (OpenXML)'), true, 'files/budget.xlsx', 22),
       ('Конспект лекций', 102400, CURRENT_TIMESTAMP - INTERVAL '7' DAY,
        (SELECT id FROM users WHERE email = 'denis.eroshevskii@gmail.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'Text Document'), true, 'files/lectures.txt', 47),

       ('Фото природы', 5120000, CURRENT_TIMESTAMP - INTERVAL '15' DAY,
        (SELECT id FROM users WHERE email = 'denis.eroshevskii@gmail.com'),
        (SELECT id FROM file_categories WHERE name = 'Images'),
        (SELECT id FROM content_types WHERE name = 'JPEG Image'), true, 'files/nature.jpg', 89),
       ('Скриншот программы', 1024000, CURRENT_TIMESTAMP - INTERVAL '2' DAY,
        (SELECT id FROM users WHERE email = 'denis.eroshevskii@gmail.com'),
        (SELECT id FROM file_categories WHERE name = 'Images'), (SELECT id FROM content_types WHERE name = 'PNG Image'),
        true, 'files/screenshot.png', 31),
       ('Логотип компании', 256000, CURRENT_TIMESTAMP - INTERVAL '30' DAY,
        (SELECT id FROM users WHERE email = 'denis.eroshevskii@gmail.com'),
        (SELECT id FROM file_categories WHERE name = 'Images'),
        (SELECT id FROM content_types WHERE name = 'JPEG Image'), false, 'files/logo.jpg', 5),
       ('Диаграмма работы', 768000, CURRENT_TIMESTAMP - INTERVAL '12' DAY,
        (SELECT id FROM users WHERE email = 'denis.eroshevskii@gmail.com'),
        (SELECT id FROM file_categories WHERE name = 'Images'), (SELECT id FROM content_types WHERE name = 'PNG Image'),
        true, 'files/diagram.png', 18),

       ('Презентация продукта', 15728640, CURRENT_TIMESTAMP - INTERVAL '20' DAY,
        (SELECT id FROM users WHERE email = 'denis.eroshevskii@gmail.com'),
        (SELECT id FROM file_categories WHERE name = 'Videos'), (SELECT id FROM content_types WHERE name = 'MP4 Video'),
        true, 'files/presentation.mp4', 123),
       ('Обучающий урок', 31457280, CURRENT_TIMESTAMP - INTERVAL '25' DAY,
        (SELECT id FROM users WHERE email = 'denis.eroshevskii@gmail.com'),
        (SELECT id FROM file_categories WHERE name = 'Videos'), (SELECT id FROM content_types WHERE name = 'MP4 Video'),
        false, 'files/tutorial.mp4', 42),
       ('Запись встречи', 20971520, CURRENT_TIMESTAMP - INTERVAL '1' DAY,
        (SELECT id FROM users WHERE email = 'denis.eroshevskii@gmail.com'),
        (SELECT id FROM file_categories WHERE name = 'Videos'), (SELECT id FROM content_types WHERE name = 'MP4 Video'),
        true, 'files/meeting.mp4', 7),

       ('Запись подкаста', 10485760, CURRENT_TIMESTAMP - INTERVAL '8' DAY,
        (SELECT id FROM users WHERE email = 'denis.eroshevskii@gmail.com'),
        (SELECT id FROM file_categories WHERE name = 'Audio'), (SELECT id FROM content_types WHERE name = 'MP3 Audio'),
        true, 'files/podcast.mp3', 56),
       ('Музыка для работы', 8388608, CURRENT_TIMESTAMP - INTERVAL '18' DAY,
        (SELECT id FROM users WHERE email = 'denis.eroshevskii@gmail.com'),
        (SELECT id FROM file_categories WHERE name = 'Audio'), (SELECT id FROM content_types WHERE name = 'MP3 Audio'),
        false, 'files/work_music.mp3', 24),
       ('Звуковые эффекты', 5242880, CURRENT_TIMESTAMP - INTERVAL '22' DAY,
        (SELECT id FROM users WHERE email = 'denis.eroshevskii@gmail.com'),
        (SELECT id FROM file_categories WHERE name = 'Audio'), (SELECT id FROM content_types WHERE name = 'MP3 Audio'),
        true, 'files/sfx.mp3', 33),

       ('Проектные файлы', 20971520, CURRENT_TIMESTAMP - INTERVAL '14' DAY,
        (SELECT id FROM users WHERE email = 'denis.eroshevskii@gmail.com'),
        (SELECT id FROM file_categories WHERE name = 'Archives'),
        (SELECT id FROM content_types WHERE name = 'ZIP Archive'), true, 'files/project.zip', 19),
       ('Бэкап базы данных', 52428800, CURRENT_TIMESTAMP - INTERVAL '28' DAY,
        (SELECT id FROM users WHERE email = 'denis.eroshevskii@gmail.com'),
        (SELECT id FROM file_categories WHERE name = 'Archives'),
        (SELECT id FROM content_types WHERE name = 'ZIP Archive'), false, 'files/db_backup.zip', 2),
       ('Исходный код', 15728640, CURRENT_TIMESTAMP - INTERVAL '9' DAY,
        (SELECT id FROM users WHERE email = 'denis.eroshevskii@gmail.com'),
        (SELECT id FROM file_categories WHERE name = 'Archives'),
        (SELECT id FROM content_types WHERE name = 'ZIP Archive'), true, 'files/source_code.zip', 41),

       ('Договор аренды', 307200, CURRENT_TIMESTAMP - INTERVAL '4' DAY,
        (SELECT id FROM users WHERE email = 'denis.eroshevskii@gmail.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'PDF Document'), false, 'files/contract.pdf', 8),
       ('Чек лист задач', 51200, CURRENT_TIMESTAMP - INTERVAL '6' DAY,
        (SELECT id FROM users WHERE email = 'denis.eroshevskii@gmail.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'Microsoft Word'), true, 'files/checklist.doc', 27);

INSERT INTO files(name, size, upload_date, user_id, file_category_id, content_type_id, is_public, path_name,
                  download_count)
VALUES ('Административный отчет', 409600, CURRENT_TIMESTAMP - INTERVAL '2' DAY,
        (SELECT id FROM users WHERE email = 'admin@filehub.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'PDF Document'), false, 'files/admin_report.pdf', 3),

       ('Логи сервера', 1048576, CURRENT_TIMESTAMP - INTERVAL '1' DAY,
        (SELECT id FROM users WHERE email = 'admin@filehub.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'Text Document'), false, 'files/server_logs.txt', 1),

       ('Статистика пользователей', 204800, CURRENT_TIMESTAMP - INTERVAL '3' DAY,
        (SELECT id FROM users WHERE email = 'admin@filehub.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'Microsoft Excel (OpenXML)'), false, 'files/stats.xlsx', 2),

       ('Скриншот панели управления', 768000, CURRENT_TIMESTAMP - INTERVAL '5' DAY,
        (SELECT id FROM users WHERE email = 'admin@filehub.com'),
        (SELECT id FROM file_categories WHERE name = 'Images'),
        (SELECT id FROM content_types WHERE name = 'PNG Image'), false, 'files/admin_panel.png', 4),

       ('Резервная копия настроек', 5242880, CURRENT_TIMESTAMP - INTERVAL '7' DAY,
        (SELECT id FROM users WHERE email = 'admin@filehub.com'),
        (SELECT id FROM file_categories WHERE name = 'Archives'),
        (SELECT id FROM content_types WHERE name = 'ZIP Archive'), false, 'files/settings_backup.zip', 0),

       ('Инструкция по администрированию', 307200, CURRENT_TIMESTAMP - INTERVAL '10' DAY,
        (SELECT id FROM users WHERE email = 'admin@filehub.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'PDF Document'), true, 'files/admin_guide.pdf', 15),

       ('Запись вебинара для админов', 20971520, CURRENT_TIMESTAMP - INTERVAL '15' DAY,
        (SELECT id FROM users WHERE email = 'admin@filehub.com'),
        (SELECT id FROM file_categories WHERE name = 'Videos'),
        (SELECT id FROM content_types WHERE name = 'MP4 Video'), false, 'files/admin_webinar.mp4', 7),

       ('Шаблоны документов', 1024000, CURRENT_TIMESTAMP - INTERVAL '12' DAY,
        (SELECT id FROM users WHERE email = 'admin@filehub.com'),
        (SELECT id FROM file_categories WHERE name = 'Archives'),
        (SELECT id FROM content_types WHERE name = 'ZIP Archive'), true, 'files/templates.zip', 23),

       ('Диаграмма инфраструктуры', 1536000, CURRENT_TIMESTAMP - INTERVAL '8' DAY,
        (SELECT id FROM users WHERE email = 'admin@filehub.com'),
        (SELECT id FROM file_categories WHERE name = 'Images'),
        (SELECT id FROM content_types WHERE name = 'JPEG Image'), false, 'files/infrastructure.jpg', 3),

       ('Аудио инструкция', 5242880, CURRENT_TIMESTAMP - INTERVAL '20' DAY,
        (SELECT id FROM users WHERE email = 'admin@filehub.com'),
        (SELECT id FROM file_categories WHERE name = 'Audio'),
        (SELECT id FROM content_types WHERE name = 'MP3 Audio'), true, 'files/audio_guide.mp3', 12),

       ('Публичный FAQ', 204800, CURRENT_TIMESTAMP - INTERVAL '25' DAY,
        (SELECT id FROM users WHERE email = 'admin@filehub.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'PDF Document'), true, 'files/faq.pdf', 45),

       ('Мониторинг системы', 1048576, CURRENT_TIMESTAMP - INTERVAL '1' DAY,
        (SELECT id FROM users WHERE email = 'admin@filehub.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'Microsoft Excel'), false, 'files/monitoring.xls', 2),

       ('Обновление безопасности', 15728640, CURRENT_TIMESTAMP - INTERVAL '30' DAY,
        (SELECT id FROM users WHERE email = 'admin@filehub.com'),
        (SELECT id FROM file_categories WHERE name = 'Archives'),
        (SELECT id FROM content_types WHERE name = 'ZIP Archive'), false, 'files/security_update.zip', 1),

       ('Фото мероприятия', 3145728, CURRENT_TIMESTAMP - INTERVAL '18' DAY,
        (SELECT id FROM users WHERE email = 'admin@filehub.com'),
        (SELECT id FROM file_categories WHERE name = 'Images'),
        (SELECT id FROM content_types WHERE name = 'JPEG Image'), true, 'files/event_photo.jpg', 18),

       ('Видео конференции', 41943040, CURRENT_TIMESTAMP - INTERVAL '22' DAY,
        (SELECT id FROM users WHERE email = 'admin@filehub.com'),
        (SELECT id FROM file_categories WHERE name = 'Videos'),
        (SELECT id FROM content_types WHERE name = 'MP4 Video'), false, 'files/conference.mp4', 5);

INSERT INTO files(name, size, upload_date, user_id, file_category_id, content_type_id, is_public, path_name,
                  download_count)
VALUES ('Фотографии отпуска', 7340032, CURRENT_TIMESTAMP - INTERVAL '45' DAY,
        (SELECT id FROM users WHERE email = 'ivan.petrov@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Images'),
        (SELECT id FROM content_types WHERE name = 'JPEG Image'), false, 'files/vacation_photos.jpg', 8),

       ('Домашнее видео', 52428800, CURRENT_TIMESTAMP - INTERVAL '60' DAY,
        (SELECT id FROM users WHERE email = 'ivan.petrov@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Videos'),
        (SELECT id FROM content_types WHERE name = 'MP4 Video'), false, 'files/home_video.mp4', 3),

       ('Любимые песни', 15728640, CURRENT_TIMESTAMP - INTERVAL '35' DAY,
        (SELECT id FROM users WHERE email = 'ivan.petrov@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Audio'),
        (SELECT id FROM content_types WHERE name = 'MP3 Audio'), true, 'files/favorite_songs.mp3', 21),

       ('Личные документы', 2097152, CURRENT_TIMESTAMP - INTERVAL '20' DAY,
        (SELECT id FROM users WHERE email = 'ivan.petrov@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Archives'),
        (SELECT id FROM content_types WHERE name = 'ZIP Archive'), false, 'files/personal_docs.zip', 1),

       ('Рецепты', 307200, CURRENT_TIMESTAMP - INTERVAL '15' DAY,
        (SELECT id FROM users WHERE email = 'ivan.petrov@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'PDF Document'), true, 'files/recipes.pdf', 34),

       ('Скан паспорта', 512000, CURRENT_TIMESTAMP - INTERVAL '90' DAY,
        (SELECT id FROM users WHERE email = 'ivan.petrov@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Images'),
        (SELECT id FROM content_types WHERE name = 'PNG Image'), false, 'files/passport.png', 0),

       ('Записи лекций', 8388608, CURRENT_TIMESTAMP - INTERVAL '40' DAY,
        (SELECT id FROM users WHERE email = 'ivan.petrov@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Audio'),
        (SELECT id FROM content_types WHERE name = 'MP3 Audio'), true, 'files/lecture_recordings.mp3', 12),

       ('Коллекция мемов', 3145728, CURRENT_TIMESTAMP - INTERVAL '25' DAY,
        (SELECT id FROM users WHERE email = 'ivan.petrov@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Images'),
        (SELECT id FROM content_types WHERE name = 'JPEG Image'), true, 'files/memes.jpg', 67),

       ('Книги в PDF', 10485760, CURRENT_TIMESTAMP - INTERVAL '50' DAY,
        (SELECT id FROM users WHERE email = 'ivan.petrov@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Archives'),
        (SELECT id FROM content_types WHERE name = 'ZIP Archive'), true, 'files/books.zip', 28),

       ('Заметки по работе', 204800, CURRENT_TIMESTAMP - INTERVAL '5' DAY,
        (SELECT id FROM users WHERE email = 'ivan.petrov@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'Text Document'), false, 'files/work_notes.txt', 2),

       ('Фильмы для просмотра', 157286400, CURRENT_TIMESTAMP - INTERVAL '70' DAY,
        (SELECT id FROM users WHERE email = 'ivan.petrov@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Videos'),
        (SELECT id FROM content_types WHERE name = 'MP4 Video'), false, 'files/movies.mp4', 5),

       ('Музыкальные альбомы', 41943040, CURRENT_TIMESTAMP - INTERVAL '55' DAY,
        (SELECT id FROM users WHERE email = 'ivan.petrov@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Archives'),
        (SELECT id FROM content_types WHERE name = 'ZIP Archive'), true, 'files/music_albums.zip', 19);

INSERT INTO files(name, size, upload_date, user_id, file_category_id, content_type_id, is_public, path_name,
                  download_count)
VALUES ('Дипломная работа', 5242880, CURRENT_TIMESTAMP - INTERVAL '120' DAY,
        (SELECT id FROM users WHERE email = 'anna.smirnova@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'Microsoft Word (OpenXML)'), false, 'files/thesis.docx', 6),

       ('Фото портфолио', 15728640, CURRENT_TIMESTAMP - INTERVAL '80' DAY,
        (SELECT id FROM users WHERE email = 'anna.smirnova@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Images'),
        (SELECT id FROM content_types WHERE name = 'JPEG Image'), true, 'files/portfolio_photos.jpg', 42),

       ('Презентация проекта', 2097152, CURRENT_TIMESTAMP - INTERVAL '30' DAY,
        (SELECT id FROM users WHERE email = 'anna.smirnova@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'PDF Document'), true, 'files/project_presentation.pdf', 18),

       ('Запись интервью', 10485760, CURRENT_TIMESTAMP - INTERVAL '45' DAY,
        (SELECT id FROM users WHERE email = 'anna.smirnova@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Audio'),
        (SELECT id FROM content_types WHERE name = 'MP3 Audio'), false, 'files/interview.mp3', 3),

       ('Исследовательские данные', 8388608, CURRENT_TIMESTAMP - INTERVAL '60' DAY,
        (SELECT id FROM users WHERE email = 'anna.smirnova@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Archives'),
        (SELECT id FROM content_types WHERE name = 'ZIP Archive'), false, 'files/research_data.zip', 2),

       ('Видео резюме', 15728640, CURRENT_TIMESTAMP - INTERVAL '20' DAY,
        (SELECT id FROM users WHERE email = 'anna.smirnova@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Videos'),
        (SELECT id FROM content_types WHERE name = 'MP4 Video'), true, 'files/video_resume.mp4', 31),

       ('Сертификаты', 3145728, CURRENT_TIMESTAMP - INTERVAL '100' DAY,
        (SELECT id FROM users WHERE email = 'anna.smirnova@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Images'),
        (SELECT id FROM content_types WHERE name = 'PNG Image'), true, 'files/certificates.png', 15),

       ('Конспекты семинаров', 1048576, CURRENT_TIMESTAMP - INTERVAL '40' DAY,
        (SELECT id FROM users WHERE email = 'anna.smirnova@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'Text Document'), false, 'files/seminar_notes.txt', 7),

       ('Аудиокниги', 31457280, CURRENT_TIMESTAMP - INTERVAL '90' DAY,
        (SELECT id FROM users WHERE email = 'anna.smirnova@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Audio'),
        (SELECT id FROM content_types WHERE name = 'MP3 Audio'), true, 'files/audiobooks.mp3', 56),

       ('Шаблоны документов для работы', 5242880, CURRENT_TIMESTAMP - INTERVAL '25' DAY,
        (SELECT id FROM users WHERE email = 'anna.smirnova@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Archives'),
        (SELECT id FROM content_types WHERE name = 'ZIP Archive'), true, 'files/work_templates.zip', 23);

INSERT INTO files(name, size, upload_date, user_id, file_category_id, content_type_id, is_public, path_name,
                  download_count)
VALUES ('Код программы', 4194304, CURRENT_TIMESTAMP - INTERVAL '15' DAY,
        (SELECT id FROM users WHERE email = 'alex.kim@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Archives'),
        (SELECT id FROM content_types WHERE name = 'ZIP Archive'), true, 'files/program_code.zip', 38),

       ('Скриншоты багов', 2097152, CURRENT_TIMESTAMP - INTERVAL '8' DAY,
        (SELECT id FROM users WHERE email = 'alex.kim@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Images'),
        (SELECT id FROM content_types WHERE name = 'PNG Image'), false, 'files/bug_screenshots.png', 4),

       ('Техническая документация', 1572864, CURRENT_TIMESTAMP - INTERVAL '20' DAY,
        (SELECT id FROM users WHERE email = 'alex.kim@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'PDF Document'), true, 'files/tech_docs.pdf', 27),

       ('Демо видео программы', 20971520, CURRENT_TIMESTAMP - INTERVAL '12' DAY,
        (SELECT id FROM users WHERE email = 'alex.kim@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Videos'),
        (SELECT id FROM content_types WHERE name = 'MP4 Video'), true, 'files/program_demo.mp4', 49),

       ('Запись митапа', 31457280, CURRENT_TIMESTAMP - INTERVAL '5' DAY,
        (SELECT id FROM users WHERE email = 'alex.kim@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Videos'),
        (SELECT id FROM content_types WHERE name = 'MP4 Video'), true, 'files/meetup_recording.mp4', 16),

       ('Библиотеки зависимостей', 10485760, CURRENT_TIMESTAMP - INTERVAL '25' DAY,
        (SELECT id FROM users WHERE email = 'alex.kim@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Archives'),
        (SELECT id FROM content_types WHERE name = 'ZIP Archive'), true, 'files/dependencies.zip', 12),

       ('Логи тестирования', 524288, CURRENT_TIMESTAMP - INTERVAL '3' DAY,
        (SELECT id FROM users WHERE email = 'alex.kim@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'Text Document'), false, 'files/test_logs.txt', 2),

       ('Диаграмма архитектуры', 1048576, CURRENT_TIMESTAMP - INTERVAL '18' DAY,
        (SELECT id FROM users WHERE email = 'alex.kim@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Images'),
        (SELECT id FROM content_types WHERE name = 'JPEG Image'), true, 'files/architecture.jpg', 21),

       ('Аудио 1', 3000000, CURRENT_TIMESTAMP, (SELECT id FROM users WHERE email = 'ivan.petrov@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Audio'),
        (SELECT id FROM content_types WHERE name = 'MP3 Audio'), false, 'files/Аудио1.mp3', 0),

       ('Архив 1', 10485760, CURRENT_TIMESTAMP, (SELECT id FROM users WHERE email = 'ivan.petrov@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Archives'),
        (SELECT id FROM content_types WHERE name = 'ZIP Archive'), true, 'files/Архив1.zip', 0),

       ('Текстовый файл 1', 512, CURRENT_TIMESTAMP, (SELECT id FROM users WHERE email = 'ivan.petrov@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'Text Document'), true, 'files/ТекстовыйФайл1.txt', 0),

       ('Документ 2', 2048, CURRENT_TIMESTAMP, (SELECT id FROM users WHERE email = 'anna.smirnova@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'PDF Document'), true, 'files/Документ2.pdf', 0),

       ('Изображение 2', 4096, CURRENT_TIMESTAMP, (SELECT id FROM users WHERE email = 'anna.smirnova@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Images'),
        (SELECT id FROM content_types WHERE name = 'JPEG Image'), true, 'files/Изображение2.jpg', 0),

       ('Видео 2', 8000000, CURRENT_TIMESTAMP, (SELECT id FROM users WHERE email = 'anna.smirnova@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Videos'),
        (SELECT id FROM content_types WHERE name = 'MP4 Video'), false, 'files/Видео2.mp4', 0),

       ('Аудио 2', 4000000, CURRENT_TIMESTAMP, (SELECT id FROM users WHERE email = 'alex.kim@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Audio'),
        (SELECT id FROM content_types WHERE name = 'MP3 Audio'), true, 'files/Аудио2.mp3', 0),

       ('Архив 2', 20971520, CURRENT_TIMESTAMP, (SELECT id FROM users WHERE email = 'alex.kim@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Archives'),
        (SELECT id FROM content_types WHERE name = 'ZIP Archive'), false, 'files/Архив2.zip', 0),

       ('Текстовый файл 2', 1024, CURRENT_TIMESTAMP, (SELECT id FROM users WHERE email = 'alex.kim@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'Text Document'), true, 'files/ТекстовыйФайл2.txt', 0),

       ('Документ 3', 3072, CURRENT_TIMESTAMP, (SELECT id FROM users WHERE email = 'olga.sidorova@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'PDF Document'), false, 'files/Документ3.pdf', 0),

       ('Изображение 3', 3072, CURRENT_TIMESTAMP, (SELECT id FROM users WHERE email = 'olga.sidorova@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Images'),
        (SELECT id FROM content_types WHERE name = 'PNG Image'), true, 'files/Изображение3.png', 0),

       ('Видео 3', 10000000, CURRENT_TIMESTAMP, (SELECT id FROM users WHERE email = 'olga.sidorova@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Videos'),
        (SELECT id FROM content_types WHERE name = 'MP4 Video'), true, 'files/Видео3.mp4', 0),

       ('Аудио 3', 5000000, CURRENT_TIMESTAMP, (SELECT id FROM users WHERE email = 'sergey.ivanov@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Audio'),
        (SELECT id FROM content_types WHERE name = 'MP3 Audio'), true, 'files/Аудио3.mp3', 0),

       ('Архив 3', 15728640, CURRENT_TIMESTAMP, (SELECT id FROM users WHERE email = 'sergey.ivanov@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Archives'),
        (SELECT id FROM content_types WHERE name = 'ZIP Archive'), true, 'files/Архив3.zip', 0),

       ('Текстовый файл 3', 1536, CURRENT_TIMESTAMP, (SELECT id FROM users WHERE email = 'sergey.ivanov@mail.com'),
        (SELECT id FROM file_categories WHERE name = 'Documents'),
        (SELECT id FROM content_types WHERE name = 'Text Document'), false, 'files/ТекстовыйФайл3.txt', 0);
