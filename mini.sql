CREATE SEQUENCE my_sequence START WITH 1 INCREMENT BY 1;

CREATE TABLE PHONE_BOOK (
    id   NUMBER DEFAULT my_sequence.NEXTVAL PRIMARY KEY,
    name VARCHAR2(10),
    hp   VARCHAR2(20),
    tel  VARCHAR2(20)
);

DESC phone_book;

--DROP table phone_book;

INSERT INTO phone_book (
    name,
    hp,
    tel
) VALUES (
    '한대희',
    '010-2349-6510',
    '010-2349-6510'
);

INSERT INTO phone_book (
    name,
    hp,
    tel
) VALUES (
    '김선생',
    '010-2349-6510',
    '010-2349-6510'
);

SELECT
    *
FROM
    phone_book;
    
COMMIT;