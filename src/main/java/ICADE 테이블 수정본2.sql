select * from tab;

DROP TABLE GOODS CASCADE CONSTRAINTS;
DROP TABLE GOODS_DETAIL CASCADE CONSTRAINTS;
DROP TABLE WISH CASCADE CONSTRAINTS;
DROP TABLE REFUND CASCADE CONSTRAINTS;
DROP TABLE ORDER_DETAIL CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE LEAVE CASCADE CONSTRAINTS;
DROP TABLE GOODS_KIND CASCADE CONSTRAINTS;
DROP TABLE GOODS_COLOR CASCADE CONSTRAINTS;
DROP TABLE DEVICE_KIND CASCADE CONSTRAINTS;
DROP TABLE CART CASCADE CONSTRAINTS;
DROP TABLE BOARD_NOTICE CASCADE CONSTRAINTS;
DROP TABLE BOARD_FAQ CASCADE CONSTRAINTS;
DROP TABLE BOARD_COMMENT CASCADE CONSTRAINTS;

PURGE RECYCLEBIN;

-- Member Table Create SQL
CREATE TABLE Member
(
    M_RANK            VARCHAR2(20)     NOT NULL, 
    M_ID              VARCHAR2(20)     NOT NULL, 
    M_PW              VARCHAR2(20)     NOT NULL, 
    M_NAME            VARCHAR2(20)     NOT NULL, 
    M_ZIPCODE         VARCHAR2(10)     NOT NULL, 
    M_ADDRESS1        VARCHAR2(100)    NOT NULL, 
    M_ADDRESS2        VARCHAR2(100)    NOT NULL, 
    M_EMAIL_ID        VARCHAR2(30)     NOT NULL, 
    M_EMAIL_DOMAIN    VARCHAR2(50)     NOT NULL, 
    M_CELLPHONE1      VARCHAR2(50)     NOT NULL, 
    M_CELLPHONE2      VARCHAR2(50)     NOT NULL, 
    M_CELLPHONE3      VARCHAR2(50)     NOT NULL, 
    M_POINT           NUMBER           NOT NULL, 
    M_DATE            DATE             NOT NULL, 
    M_NICKNAME        VARCHAR2(20)     NOT NULL, 
    CONSTRAINT MEMBER_PK PRIMARY KEY (M_ID)
);

ALTER TABLE Member
    ADD CONSTRAINT UC_M_NICKNAME UNIQUE (M_NICKNAME);


-- Goods Table Create SQL
CREATE TABLE Goods
(
    G_NUM          NUMBER          NOT NULL, 
    G_NAME         VARCHAR2(50)    NOT NULL, 
    G_PRICE        NUMBER          NOT NULL,
    G_CONTENT      VARCHAR2(4000)  NOT NULL, 
    G_DISCOUNT     NUMBER          NOT NULL, 
    G_PHOTO        VARCHAR2(40)    NOT NULL, 
    CONSTRAINT GOODS_PK PRIMARY KEY (G_NUM)
);

ALTER TABLE Goods
	ADD(G_SAVEFILENAME VARCHAR2(40) NOT NULL);
	
ALTER TABLE Goods MODIFY(G_DISCOUNT NUMBER NULL);

ALTER TABLE Goods DROP COLUMN G_COUNT;
ALTER TABLE Goods DROP COLUMN G_SELLCOUNT;

-- Goods_Kind Table Create SQL
CREATE TABLE Goods_Kind
(
    GK_NUM     NUMBER          NOT NULL, 
    GK_KIND    VARCHAR2(50)    NOT NULL, 
    CONSTRAINT GOODS_KIND_PK PRIMARY KEY (GK_NUM)
);

ALTER TABLE Goods_Kind
    ADD CONSTRAINT UC_GK_KIND UNIQUE (GK_KIND);


-- Device_Kind Table Create SQL
CREATE TABLE Device_Kind
(
    DK_CODE    NUMBER          NOT NULL, 
    DK_NAME    VARCHAR2(40)    NOT NULL, 
    CONSTRAINT DEVICE_KIND_PK PRIMARY KEY (DK_CODE)
);

ALTER TABLE Device_Kind
    ADD CONSTRAINT UC_DK_NAME UNIQUE (DK_NAME);


-- Goods_Color Table Create SQL
CREATE TABLE Goods_Color
(
    GC_CODE     NUMBER          NOT NULL, 
    GC_COLOR    VARCHAR2(20)    NOT NULL, 
    CONSTRAINT GOODS_COLOR_PK PRIMARY KEY (GC_CODE)
);

ALTER TABLE Goods_Color
    ADD CONSTRAINT UC_GC_COLOR UNIQUE (GC_COLOR);


-- Orders Table Create SQL
CREATE TABLE Orders
(
    O_NUM         NUMBER           NOT NULL, 
    O_ID          VARCHAR2(20)     NOT NULL, 
    O_DATE        DATE             NOT NULL, 
    O_NAME        VARCHAR2(20)     NOT NULL, 
    O_PH          VARCHAR2(13)     NOT NULL, 
    O_ZIPCODE     VARCHAR2(10)     NOT NULL, 
    O_ADDRESS1    VARCHAR2(100)    NOT NULL, 
    O_ADDRESS2    VARCHAR2(100)    NOT NULL, 
    O_STATUS      VARCHAR2(20)     NOT NULL, 
    O_WAY         VARCHAR2(15)     NOT NULL, 
    O_TOT         NUMBER           NOT NULL, 
    O_TNUM        NUMBER           NULL, 
    CONSTRAINT ORDERS_PK PRIMARY KEY (O_NUM)
);

ALTER TABLE Orders
    ADD CONSTRAINT FK_Orders_O_ID_Member_M_ID FOREIGN KEY (O_ID)
        REFERENCES Member (M_ID) ON DELETE CASCADE;


-- Goods_Detail Table Create SQL
CREATE TABLE Goods_Detail
(
    GD_NUM          NUMBER          NOT NULL, 
    GD_CODE         VARCHAR2(50)    NOT NULL, 
    GD_KIND_NUM     NUMBER          NOT NULL, 
    GD_DEVICE       NUMBER          NOT NULL, 
    GD_COLOR        NUMBER          NOT NULL, 
    GD_COUNT        NUMBER          NOT NULL, 
    GD_SELLCOUNT    NUMBER          NOT NULL, 
    CONSTRAINT GOODS_DETAIL_PK PRIMARY KEY (GD_CODE)
);

ALTER TABLE Goods_Detail
    ADD CONSTRAINT FK_Goods_Detail_GD_KIND_NUM_Go FOREIGN KEY (GD_KIND_NUM)
        REFERENCES Goods_Kind (GK_NUM);

ALTER TABLE Goods_Detail
    ADD CONSTRAINT FK_Goods_Detail_GD_DEVICE_Devi FOREIGN KEY (GD_DEVICE)
        REFERENCES Device_Kind (DK_CODE);

ALTER TABLE Goods_Detail
    ADD CONSTRAINT FK_Goods_Detail_GD_COLOR_Goods FOREIGN KEY (GD_COLOR)
        REFERENCES Goods_Color (GC_CODE);

ALTER TABLE Goods_Detail
    ADD CONSTRAINT FK_Goods_Detail_GD_NUM_Goods_G FOREIGN KEY (GD_NUM)
        REFERENCES Goods (G_NUM) ON DELETE CASCADE;


-- Board_Notice Table Create SQL
CREATE TABLE Board_Notice
(
    BN_NUM        NUMBER            NOT NULL, 
    BN_SUBJECT    VARCHAR2(50)      NOT NULL, 
    BN_CONTENT    VARCHAR2(2000)    NOT NULL, 
    BN_DATE       DATE              NOT NULL, 
    CONSTRAINT BOARD_NOTICE_PK PRIMARY KEY (BN_NUM)
);


-- Order_Detail Table Create SQL
CREATE TABLE Order_Detail
(
    OD_NUM         NUMBER          NOT NULL, 
    OD_CODE        VARCHAR2(50)    NOT NULL, 
    OD_NAME        VARCHAR2(50)    NOT NULL, 
    OD_DEVICE      NUMBER          NOT NULL, 
    OD_COLOR       NUMBER          NOT NULL, 
    OD_COUNT       NUMBER          NOT NULL, 
    OD_PRICE       NUMBER          NOT NULL, 
    OD_DISCOUNT    NUMBER          NOT NULL
);

-- Board_Comment Table Create SQL
CREATE TABLE Board_Comment
(
    BC_NUM        NUMBER            NOT NULL, 
    BC_BOARD      NUMBER            NOT NULL, 
    BC_ID         VARCHAR2(20)      NOT NULL, 
    BC_DATE       DATE              NOT NULL, 
    BC_PARENT     NUMBER            NOT NULL, 
    BC_CONTENT    VARCHAR2(1000)    NOT NULL, 
    BC_KIND       NUMBER            NULL, 
    CONSTRAINT BOARD_COMMENT_PK PRIMARY KEY (BC_NUM)
);

ALTER TABLE Board_Comment
    ADD CONSTRAINT FK_Board_Comment_BC_ID_Member_ FOREIGN KEY (BC_ID)
        REFERENCES Member (M_ID);

ALTER TABLE Board_Comment
    ADD CONSTRAINT FK_Board_Comment_BC_NUM_Goods_ FOREIGN KEY (BC_NUM)
        REFERENCES Goods (G_NUM) ON DELETE CASCADE;


-- Leave Table Create SQL
CREATE TABLE Leave
(
    L_NUM       NUMBER           NOT NULL, 
    L_ID        VARCHAR2(20)     NOT NULL, 
    L_NAME      VARCHAR2(20)     NOT NULL, 
    L_REASON    VARCHAR2(200)    NOT NULL, 
    L_DATE      DATE             NOT NULL, 
    L_PH        VARCHAR2(13)     NOT NULL, 
    CONSTRAINT LEAVE_PK PRIMARY KEY (L_NUM)
);


-- Refund Table Create SQL
CREATE TABLE Refund
(
    R_NUM       NUMBER           NOT NULL, 
    R_NAME      VARCHAR2(20)     NOT NULL, 
    R_ID        VARCHAR2(20)     NOT NULL, 
    R_BANK      VARCHAR2(20)     NOT NULL, 
    R_ACN       VARCHAR2(30)     NOT NULL, 
    R_REASON    VARCHAR2(100)    NOT NULL, 
    CONSTRAINT REFUND_PK PRIMARY KEY (R_NUM)
);


-- Cart Table Create SQL
CREATE TABLE Cart
(
    C_NUM      NUMBER           NOT NULL, 
    C_CODE     VARCHAR2(50)     NOT NULL, 
    C_ID       VARCHAR2(20)     NOT NULL, 
    C_NAME     VARCHAR2(100)    NOT NULL, 
    C_COUNT    NUMBER           NOT NULL, 
    CONSTRAINT CART_PK PRIMARY KEY (C_NUM)
);

ALTER TABLE Cart
    ADD CONSTRAINT FK_Cart_C_ID_Member_M_ID FOREIGN KEY (C_ID)
        REFERENCES Member (M_ID) ON DELETE CASCADE;

ALTER TABLE Cart
    ADD CONSTRAINT FK_Cart_C_CODE_Goods_Detail_GD FOREIGN KEY (C_CODE)
        REFERENCES Goods_Detail (GD_CODE);


-- Board_FAQ Table Create SQL
CREATE TABLE Board_FAQ
(
    BF_NUM        NUMBER            NOT NULL, 
    BF_SUBJECT    VARCHAR2(50)      NULL, 
    BF_CONTENT    VARCHAR2(2000)    NULL, 
    CONSTRAINT BOARD_FAQ_PK PRIMARY KEY (BF_NUM)
);


-- Wish Table Create SQL
CREATE TABLE Wish
(
    W_NUM     NUMBER          NOT NULL, 
    W_ID      VARCHAR2(20)    NOT NULL, 
    W_GNUM    NUMBER          NOT NULL, 
    W_NAME    VARCHAR2(50)    NOT NULL, 
    CONSTRAINT WISH_PK PRIMARY KEY (W_NUM)
);

ALTER TABLE Wish
    ADD CONSTRAINT FK_Wish_W_ID_Member_M_ID FOREIGN KEY (W_ID)
        REFERENCES Member (M_ID) ON DELETE CASCADE;

ALTER TABLE Wish
    ADD CONSTRAINT FK_Wish_W_GNUM_Goods_G_NUM FOREIGN KEY (W_GNUM)
        REFERENCES Goods (G_NUM) ON DELETE CASCADE;

        
insert into goods_kind values (1, '�⺻ ���̽�');
insert into goods_kind values (2, '�ֹ����� ���̽�');
insert into goods_kind values (3, '�ʸ�');
insert into goods_kind values (4, '��ī��/�ﰢ��');
insert into goods_kind values (5, '���̺�/������');
insert into goods_kind values (6, '�̾���');

commit;



insert into DEVICE_KIND values (1, '������ 5s');
insert into DEVICE_KIND values (2, '������ 6/6s');
insert into DEVICE_KIND values (3, '������ 6s+');
insert into DEVICE_KIND values (4, '������ 7/7s');
insert into DEVICE_KIND values (5, '������ 7s+');
insert into DEVICE_KIND values (6, '������ 8/8s');
insert into DEVICE_KIND values (7, '������ 8+');

insert into DEVICE_KIND values (8, '������ S7');
insert into DEVICE_KIND values (9, '������ S7 ����');
insert into DEVICE_KIND values (10, '������ S8');
insert into DEVICE_KIND values (11, '������ S8+');
insert into DEVICE_KIND values (12, '�����ó�Ʈ 9');

commit;

insert into GOODS_COLOR values (1, '��');
insert into GOODS_COLOR values (2, '����');
insert into GOODS_COLOR values (3, '���');
insert into GOODS_COLOR values (4, '��ũ');
insert into GOODS_COLOR values (5, '������');
insert into GOODS_COLOR values (6, '�ǹ�');

commit;

insert into device_kind values(999, '����');
insert into goods_color values (999, '����');
