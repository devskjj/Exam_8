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

INSERT INTO files (id, name, size, upload_date, user_id,  file_category_id, content_type_id, is_public, path_name)
VALUES
    (1, 'asd', 84655, '2026-02-07 18:32:26.467802', 1, 1, 6, true, '07701644-d662-48e3-93dd-4a398c298593_3b1ead21-bc63-4c4d-adec-c59c7f32a2df_Calculus_II_Assignment_2025.pdf'),
    (2, 'zxcxc', 11, '2026-02-07 18:32:39.205827', 1, 1, 7, false, '5cf0b850-8a56-4712-bcc9-cd47ad2453c3_9491454d-e6eb-4735-a405-dee93c21df64_hello.txt'),
    (3, 'ttt', 1475312, '2026-02-07 18:32:51.818821', 1, 4, 4, true, 'cab8c1af-0a9e-47c3-8df1-6f8d065c4857_Красивая музыка на телефон.mp3'),
    (4, 'qwezxc', 84655, '2026-02-07 18:33:02.288570', 1, 1, 6, true, 'b4be2a91-69ca-4387-80ee-108375145633_3b1ead21-bc63-4c4d-adec-c59c7f32a2df_Calculus_II_Assignment_2025.pdf'),
    (5, 'jyhjy', 36123, '2026-02-07 18:33:12.547679', 1, 2, 2, true, '9cf8497f-e749-4e95-abd7-cf4730542686_ec5dd0d7-6d36-43cc-aa80-ee2a76d05476_logo.png'),
    (6, 'nggfhgd', 293868, '2026-02-07 18:34:58.165102', 1, 4, 4, true, '34e387b8-994d-4ccd-9e61-6f38b6897fa5_Vertu - Новый звонок.mp3'),
    (7, 'dsxqwe', 482208, '2026-02-07 18:35:09.861897', 1, 5, 5, true, '258a67a1-5cdd-4f53-9668-5b97095a0d49_fffa72db-3ce8-438b-8541-dc266290b34d_EatSmart API.zip'),
    (9, 'hbdfgdf', 482208, '2026-02-07 18:35:32.605777', 1, 1, 5, false, '44627d3e-b8e7-42ea-adaf-67c19a87325b_fffa72db-3ce8-438b-8541-dc266290b34d_EatSmart API.zip'),
    (10, 'qewqeads', 36123, '2026-02-07 18:35:50.250440', 1, 2, 2, true, 'aada6d88-e1c7-445b-9cdc-d7a2d386bfba_ec5dd0d7-6d36-43cc-aa80-ee2a76d05476_logo.png'),
    (11, 'video', 837706, '2026-02-07 18:37:18.127483', 1, 3, 3, true, '8bd553ba-34f3-4d24-9919-d06d0adbc49d_videoplayback.mp4'),
    (12, 'qqq', 1258906, '2026-02-07 18:37:36.328046', 1, 4, 3, false, '22fc5b54-7c13-43f9-93cc-b2130bc8e337_videoplayback-2.mp4'),
    (13, 'adss', 293868, '2026-02-07 18:37:59.141010', 2, 4, 4, true, 'b65d9735-445c-4a4c-b6b4-cdf4527d3c31_Vertu - Новый звонок.mp3'),
    (14, 'SSSSADA', 6346, '2026-02-07 18:38:10.036992', 2, 1, 5, true, '05638164-0723-4df8-819e-3a158c6d73c6_d4c1745a-eac1-4102-9ccc-b0a593fe71ec_error.ftlh.zip'),
    (15, 'oioyiiuiu', 1632383, '2026-02-07 18:38:21.907825', 2, 2, 1, true, '894044fc-8257-46ff-8da8-f89e58586ea1_m024t0224_f_gift_box_06sep22.jpg'),
    (16, 'ouioluioiuouioiu', 1258906, '2026-02-07 18:38:37.686798', 2, 3, 3, false, '9426c4aa-15eb-4684-8527-4fb27dc8edcc_videoplayback-2.mp4'),
    (17, 'znovl', 1344490, '2026-02-07 18:38:52.000454', 2, 4, 4, true, 'b0c8926c-7715-4ed4-af9c-f29d0681c3d9_Музыка из фильма Возвращение Будулая.mp3'),
    (19, 'asdasdqtrqwtgsevgf', 6346, '2026-02-07 18:39:08.670632', 2, 1, 5, true, 'ebeb37d4-d0bb-4cc0-b580-9e60b4249a01_d4c1745a-eac1-4102-9ccc-b0a593fe71ec_error.ftlh.zip'),
    (20, 'izyh', 36123, '2026-02-07 18:39:52.248397', 5, 2, 2, true, 'dc3d9da8-cf4a-40ed-a7c6-679dd5c48261_ec5dd0d7-6d36-43cc-aa80-ee2a76d05476_logo.png'),
    (22, 'yerytery', 482208, '2026-02-07 18:40:09.713960', 5, 5, 5, true, '20738ace-7b37-4d80-a468-e308750fac31_fffa72db-3ce8-438b-8541-dc266290b34d_EatSmart API.zip'),
    (23, 'hygjtyujtyu', 2402625, '2026-02-07 18:40:17.622180', 5, 2, 1, true, 'e6d61757-7fbd-4f51-8d97-2924e2951481_fried-chicken-breast-cheese-tomato-french-fries-ketchup-green-salad-side-view-jpg.jpg'),
    (24, 'vreoip', 1258906, '2026-02-07 18:40:27.422496', 5, 3, 3, true, '31928bb9-4444-4a35-b39c-ab30822ceb7a_videoplayback-2.mp4'),
    (25, 'tyerytr', 837706, '2026-02-07 18:40:40.153797', 5, 3, 3, true, 'cf0f6a0c-5208-41a6-a057-c35521b981dc_videoplayback.mp4'),
    (30, 'ytrytyty', 6346, '2026-02-07 18:47:06.261488', 3, 1, 5, false, 'd2e292da-4c46-4b83-b13b-0a0b5bcb96c8_d4c1745a-eac1-4102-9ccc-b0a593fe71ec_error.ftlh.zip'),
    (31, 'jytjuty', 2402625, '2026-02-07 18:47:21.008134', 3, 2, 1, true, '62b49136-51c5-4af4-a961-b177326387b0_fried-chicken-breast-cheese-tomato-french-fries-ketchup-green-salad-side-view-jpg.jpg'),
    (32, 'twy4ere', 2417474, '2026-02-07 18:47:30.078219', 3, 1, 5, true, 'b214161c-af3e-4d47-acb1-10449ead1ee8_TF51de1e5f-e0e8-4dd0-99f3-5b7584f7abdcad551a72_wac-31ccd963fe02.pptx');

ALTER TABLE files ALTER COLUMN id RESTART WITH 33;