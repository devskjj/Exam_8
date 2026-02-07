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
