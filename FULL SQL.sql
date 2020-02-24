BEGIN
   FOR cur_rec IN (SELECT object_name, object_type
                     FROM user_objects
                    WHERE object_type IN
                             ('TABLE',
                              'VIEW',
                              'PACKAGE',
                              'PROCEDURE',
                              'FUNCTION',
                              'SEQUENCE',
                              'SYNONYM',
                              'PACKAGE BODY'
                             ))
   LOOP
      BEGIN
         IF cur_rec.object_type = 'TABLE'
         THEN
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '" CASCADE CONSTRAINTS';
         ELSE
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '"';
         END IF;
      EXCEPTION
         WHEN OTHERS
         THEN
            DBMS_OUTPUT.put_line (   'FAILED: DROP '
                                  || cur_rec.object_type
                                  || ' "'
                                  || cur_rec.object_name
                                  || '"'
                                 );
      END;
   END LOOP;
END;


DDL/DML

CREATE TABLE ADMIN(
    ID_ADMIN		VARCHAR2 (10) NOT NULL ,
    NAMA_ADMIN 		VARCHAR2 (25) ,
    KONTAK_ADMIN 	VARCHAR2 (12) ,
    USERNAME_ADMIN 	VARCHAR2 (25) ,
    PASSWORD_ADMIN 	VARCHAR2 (25)
);
ALTER TABLE ADMIN ADD CONSTRAINT ADMIN_PK PRIMARY KEY ( ID_ADMIN );

CREATE TABLE PEMBELI(
    ID_PEMBELI		VARCHAR2 (10) NOT NULL ,
    NAMA_PEMBELI	VARCHAR2 (25) ,
    KONTAK_PEMBELI	VARCHAR2 (12) ,
    ALAMAT_PEMBELI	VARCHAR2 (50) ,
    POINT_PEMBELI	NUMBER
);
ALTER TABLE PEMBELI ADD CONSTRAINT PEMBELI_PK PRIMARY KEY ( ID_PEMBELI );

CREATE TABLE TOKO(
    ID_TOKO		    VARCHAR2 (10) NOT NULL ,
    NAMA_TOKO  	    VARCHAR2 (25) ,
    KONTAK_TOKO    	VARCHAR2 (12) ,
    LOKASI_TOKO   	VARCHAR2 (50) ,
    RATING_TOKO     NUMBER
);
ALTER TABLE TOKO ADD CONSTRAINT TOKO_PK PRIMARY KEY ( ID_TOKO );

CREATE TABLE TRANSAKSI(
    ID_TRANSAKSI   	    VARCHAR2 (10) NOT NULL ,
    ID_PEMBELI          VARCHAR2 (10) NOT NULL ,
    ID_BARANG           VARCHAR2 (10) NOT NULL ,
    ID_ADMIN       	    VARCHAR2 (10) NOT NULL ,
    TOTAL_PEMBAYARAN	NUMBER ,
    TGL_PEMBELIAN 	    DATE ,
    KUANTITAS 		    NUMBER
);
ALTER TABLE TRANSAKSI ADD CONSTRAINT TRANSAKSI_PK PRIMARY KEY ( ID_TRANSAKSI );

CREATE TABLE BARANG(
    ID_BARANG   		VARCHAR2 (10) NOT NULL ,
    NAMA_BARANG 		VARCHAR2 (25) ,
    JENIS_BARANG		VARCHAR2 (20) ,
    BERAT_BARANG		NUMBER ,
    HARGA_BARANG		NUMBER
);
ALTER TABLE BARANG ADD CONSTRAINT BARANG_PK PRIMARY KEY ( ID_BARANG ) ;

CREATE TABLE PENJUALAN(
    ID_PENJUALAN 	VARCHAR2 (10) NOT NULL ,
    ID_BARANG  		VARCHAR2 (10) NOT NULL ,
    ID_TOKO      	VARCHAR2 (10) NOT NULL
);
ALTER TABLE PENJUALAN ADD CONSTRAINT PENJUALAN_PK PRIMARY KEY ( ID_PENJUALAN ) ;

CREATE TABLE KUPON(
    KODE_KUPON	    	VARCHAR2 (10) NOT NULL ,
    ID_PEMBELI      	VARCHAR2 (10) NOT NULL ,
    NAMA_KUPON  	VARCHAR2 (25) ,
    TOTAL_POIN   	NUMBER ,
    TGL_PENGAMBILAN 	DATE ,
    TGL_KADALUARSA  	DATE
);
ALTER TABLE KUPON ADD CONSTRAINT KUPON_PK PRIMARY KEY ( KODE_KUPON );

ALTER SESSION SET nls_date_format = 'dd-MM-yyyy';
ALTER TABLE TRANSAKSI ADD CONSTRAINT TRANSAKSI_ADMIN_FK FOREIGN KEY ( ID_ADMIN ) REFERENCES ADMIN ( ID_ADMIN );
ALTER TABLE TRANSAKSI ADD CONSTRAINT TRANSAKSI_PEMBELI_FK FOREIGN KEY ( ID_PEMBELI ) REFERENCES PEMBELI ( ID_PEMBELI );
ALTER TABLE TRANSAKSI ADD CONSTRAINT TRANSAKSI_BARANG_FK FOREIGN KEY ( ID_BARANG ) REFERENCES BARANG ( ID_BARANG );
ALTER TABLE PENJUALAN ADD CONSTRAINT PENJUALAN_TOKO_FK FOREIGN KEY ( ID_TOKO ) REFERENCES TOKO ( ID_TOKO );
ALTER TABLE PENJUALAN ADD CONSTRAINT PENJUALAN_BARANG_FK FOREIGN KEY ( ID_BARANG ) REFERENCES BARANG ( ID_BARANG );
ALTER TABLE KUPON ADD CONSTRAINT KUPON_PEMBELI_FK FOREIGN KEY ( ID_PEMBELI ) REFERENCES PEMBELI ( ID_PEMBELI );

INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11001','JOHN','1076919811','JOHNUSER','JOHNPASS');
INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11002','ROBERT','8611770911','ROBERTUSER','ROBERTPASS');
INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11003','WILLIAN','4419724754','WILLIANUSER','WILLIANPASS');
INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11004','CHARLES','9168012822','CHARLESUSER','CHARLESPASS');
INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11005','DAVID','4465107632','DAVIDUSER','DAVIDPASS');
INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11006','JAMES','9268242722','JAMESUSER','JAMESPASS');
INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11007','RICHARD','5743448673','RICHARDUSER','RICHARDPASS');
INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11008','JOHANN','8017632241','JOHANNUSER','JOHANNPASS');
INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11009','GEORGE','3979655468','GEORGEUSER','GEORGEPASS');
INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11010','PAUL','3272593896','PAULUSER','PAULPASS');
INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11011','MARY','9934795856','MARYUSER','MARYPASS');
INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11012','ELIZABETH','3559066283','ELIZABETHUSER','ELIZABETHPASS');
INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11013','MARIA','9551653703','MARIAUSER','MARIAPASS');
INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11014','ANNE','3512032831','ANNEUSER','ANNEPASS');
INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11015','MARGARET','2506630098','MARGARETUSER','MARGARETPASS');
INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11016','SUSAN','3799020','SUSANUSER','SUSANPASS');
INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11017','RUTH','200190352','RUTHUSER','RUTHPASS');
INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11018','ANNA','9122248269','ANNAUSER','ANNAPASS');
INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11019','ALICE','1211827506','ALICEUSER','ALICEPASS');
INSERT INTO ADMIN (ID_ADMIN, NAMA_ADMIN, KONTAK_ADMIN, USERNAME_ADMIN, PASSWORD_ADMIN) VALUES ('11020','DOROTHY','2396778233','DOROTHYUSER','DOROTHYPASS');

INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1001','DIAMOND','121001','JAKARTA',5);
INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1002','RUBY','121002','JAKARTA',4);
INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1003','EMERALD','121003','JAKARTA',3);
INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1004','GETGOODS','121004','JAKARTA',5);
INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1005','A3','121005','JAKARTA',2);
INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1006','RUNE','121006','JAKARTA',4);
INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1007','BAGUS','121007','BANDUNG',5);
INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1008','JAYA','121008','BANDUNG',2);
INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1009','ISTORE','121009','BANDUNG',1);
INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1010','NIKE ','121010','BANDUNG',5);
INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1011','ADIDAS','121011','BANDUNG',4);
INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1012','PUMA ','121012','BANDUNG',2);
INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1013','YONEX','121013','BANDUNG',2);
INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1014','LI-NING','121014','BANDUNG',1);
INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1015','ASUS','121015','MALANG',1);
INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1016','VICTOR','121016','MALANG',5);
INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1017','MSI','121017','MALANG',3);
INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1018','SAMSUNG','121018','MALANG',3);
INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1019','ACER','121019','MALANG',4);
INSERT INTO TOKO (ID_TOKO, NAMA_TOKO, KONTAK_TOKO, LOKASI_TOKO, RATING_TOKO) VALUES ('TK1020','NOKIA','121020','MALANG',1);

INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121001','UZUMAKI','212232345','JL.KONOHA',2500);
INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121002','JIRAIYA','215676769','JL.BUAH BATU',2500);
INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121003','NARUTO','211234565','JL.JAUH',1500);
INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121004','SAKURA','214565434','JL.SUKABIRUS',1500);
INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121005','SASUKE','218765987','JL.MASUK',1500);
INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121006','NEJI','212345643','JL.LAMA',1500);
INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121007','BORUTO','210987548','JL.BARU',1500);
INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121008','MITSUKI','219875490','JL.RIBUT',500);
INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121009','HARUNO','219065987','JL.DAERAH',500);
INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121010','KAKASHI','211267894','JL.KOCAK',500);
INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121011','HARUNO','219065987','JL.DAERAH',1000);
INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121012','UCHIHA','212341235','JL.PANTAI',1000);
INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121013','HATAKE','215643678','JL.BANDARA',1000);
INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121014','SAI','215478631','JL.LUMPUR',1000);
INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121015','YAMATO','213987456','JL.SUKAPURA',1000);
INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121016','ASUMA','216498521','JL.SUKAMAJU',500);
INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121017','KIBA','210658942','JL.SUKADESA',500);
INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121018','KURENAI','210369874','JL.SUKAHATI',500);
INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121019','TENTEN','210364589','JL.SUKASUKA',500);
INSERT INTO PEMBELI (ID_PEMBELI, NAMA_PEMBELI, KONTAK_PEMBELI, ALAMAT_PEMBELI, POINT_PEMBELI) VALUES ('121020','GAARA','213654894','JL.SUKAKAMU',500);

INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1501','RUBY STONE','PERHIASAN',1,100000000);
INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1502','EMERALD STONE','PERHIASAN',2,150000000);
INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1503','DIAMOND NECKLE','PERHIASAN',1,170000000);
INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1504','BERAS','MAKANAN',50,70000);
INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1505','SOSIS','MAKANAN',1,40000);
INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1506','NUGGET AYAM','MAKANAN',1,30000);
INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1507','ASUS N331','ELEKTRONIK',3,15000000);
INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1508','ASUS N332','ELEKTRONIK',4,8500000);
INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1509','ASUS N333','ELEKTRONIK',2,20000000);
INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1510','ADIDAS NMD V1','SEPATU',1,1500000);
INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1511','ADIDAS NMD V2','SEPATU',1,1700000);
INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1512','PUMA X7','SEPATU',1,2700000);
INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1513','YONEX MX 4','ALAT OLAHRAGA',3,1400000);
INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1514','YONEX MX 5','ALAT OLAHRAGA',4,700000);
INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1515','MSI G662','ELEKTRONIK',5,13000000);
INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1516','MSI G663','ELEKTRONIK',5,16000000);
INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1517','SAMSUNG S8','ELEKTRONIK',4,8000000);
INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1518','SAMSUNG S9','ELEKTRONIK',3,12000000);
INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1519','ACER PREDATOR HELIOS 19','ELEKTRONIK',5,27000000);
INSERT INTO BARANG (ID_BARANG, NAMA_BARANG, JENIS_BARANG, BERAT_BARANG, HARGA_BARANG) VALUES ('BR1520','VICTOR SPEED 7','ALAT OLAHRAGA',6,10000000);

INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1901','121001','BR1505','11003',120000,'10-10-2018',3);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1902','121001','BR1506','11003',150000,'10-10-2018',5);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1903','121002','BR1504','11003',70000,'10-10-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1904','121004','BR1519','11004',27000000,'10-10-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1905','121005','BR1512','11005',2700000,'10-10-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1906','121008','BR1515','11006',13000000,'13-10-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1907','121008','BR1516','11007',16000000,'13-10-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1908','121008','BR1510','11008',3000000,'13-10-2018',2);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1909','121009','BR1501','11008',100000000,'18-11-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1910','121011','BR1513','11010',2800000,'18-11-2018',2);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1911','121011','BR1514','11010',700000,'18-11-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1912','121012','BR1507','11012',15000000,'18-11-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1913','121013','BR1505','11013',200000,'19-11-2018',5);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1914','121015','BR1509','11014',20000000,'17-09-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1915','121015','BR1510','11015',3000000,'17-09-2018',2);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1916','121016','BR1503','11015',170000000,'17-09-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1917','121018','BR1520','11015',10000000,'17-09-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1918','121018','BR1517','11018',8000000,'17-09-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1919','121019','BR1504','11020',280000,'25-12-2018',4);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1920','121020','BR1518','11020',12000000,'25-12-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1921','121001','BR1505','11003',120000,'10-10-2018',3);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1922','121001','BR1506','11003',150000,'10-10-2018',5);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1923','121002','BR1504','11003',70000,'10-10-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1924','121004','BR1519','11004',27000000,'10-10-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1925','121005','BR1512','11005',2700000,'10-10-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1926','121008','BR1515','11006',13000000,'13-10-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1927','121008','BR1516','11007',16000000,'13-10-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1928','121008','BR1510','11008',3000000,'13-10-2018',2);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1929','121009','BR1501','11008',100000000,'18-11-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1930','121011','BR1513','11010',2800000,'18-11-2018',2);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1931','121011','BR1514','11010',700000,'18-11-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1932','121012','BR1507','11012',15000000,'18-11-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1933','121013','BR1505','11013',200000,'19-11-2018',5);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1934','121015','BR1509','11014',20000000,'17-09-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1935','121015','BR1510','11015',3000000,'17-09-2018',2);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1936','121016','BR1503','11015',170000000,'17-09-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1937','121018','BR1520','11015',10000000,'17-09-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1938','121018','BR1517','11018',8000000,'17-09-2018',1);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1939','121019','BR1504','11020',280000,'25-12-2018',4);
INSERT INTO TRANSAKSI (ID_TRANSAKSI, ID_PEMBELI, ID_BARANG, ID_ADMIN, TOTAL_PEMBAYARAN, TGL_PEMBELIAN, KUANTITAS) VALUES ('TS1940','121020','BR1518','11020',12000000,'25-12-2018',1);

INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1401','BR1501','TK1001');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1402','BR1502','TK1002');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1403','BR1503','TK1003');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1404','BR1504','TK1008');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1405','BR1505','TK1008');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1406','BR1506','TK1008');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1407','BR1507','TK1015');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1408','BR1508','TK1015');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1409','BR1509','TK1015');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1410','BR1510','TK1011');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1411','BR1511','TK1011');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1412','BR1512','TK1012');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1413','BR1513','TK1013');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1414','BR1514','TK1013');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1415','BR1515','TK1017');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1416','BR1516','TK1017');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1417','BR1517','TK1018');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1418','BR1518','TK1018');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1419','BR1519','TK1019');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1420','BR1520','TK1016');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1421','BR1501','TK1001');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1422','BR1502','TK1002');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1423','BR1503','TK1003');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1424','BR1504','TK1008');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1425','BR1505','TK1008');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1426','BR1506','TK1008');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1427','BR1507','TK1015');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1428','BR1508','TK1015');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1429','BR1509','TK1015');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1430','BR1510','TK1011');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1431','BR1511','TK1011');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1432','BR1512','TK1012');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1433','BR1513','TK1013');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1434','BR1514','TK1013');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1435','BR1515','TK1017');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1436','BR1516','TK1017');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1437','BR1517','TK1018');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1438','BR1518','TK1018');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1439','BR1519','TK1019');
INSERT INTO PENJUALAN (ID_PENJUALAN, ID_BARANG, ID_TOKO) VALUES ('PJ1440','BR1520','TK1016');

INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2501','121001','KUPON DISKON 50%',2500,'17-08-2018','24-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2502','121002','KUPON DISKON 50%',2500,'10-08-2018','17-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2503','121003','KUPON DISKON 30%',1500,'17-08-2018','24-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2504','121004','KUPON DISKON 30%',1500,'17-08-2018','24-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2505','121005','KUPON DISKON 25%',1000,'10-08-2018','17-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2506','121006','KUPON DISKON 25%',1000,'10-08-2018','17-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2507','121007','KUPON DISKON 25%',1000,'10-08-2018','17-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2508','121008','KUPON BELANJA',500,'12-08-2018','15-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2509','121009','KUPON BELANJA',500,'12-08-2018','15-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2510','121010','KUPON BELANJA',500,'12-08-2018','15-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2511','121011','TIKET LIBURAN',1000,'14-08-2018','18-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2512','121012','TIKET LIBURAN',1000,'14-08-2018','18-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2513','121013','TIKET LIBURAN',1000,'14-08-2018','18-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2514','121014','TIKET LIBURAN',1000,'14-08-2018','18-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2515','121015','TIKET LIBURAN',1000,'14-08-2018','18-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2516','121016','KUPON BELANJA',500,'15-08-2018','17-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2517','121017','KUPON BELANJA',500,'15-08-2018','17-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2518','121018','KUPON BELANJA',500,'15-08-2018','17-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2519','121019','KUPON BELANJA',500,'15-08-2018','17-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2520','121020','KUPON BELANJA',500,'15-08-2018','17-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2521','121001','KUPON DISKON 50%',2500,'17-08-2018','24-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2522','121002','KUPON DISKON 50%',2500,'10-08-2018','17-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2523','121003','KUPON DISKON 30%',1500,'17-08-2018','24-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2524','121004','KUPON DISKON 30%',1500,'17-08-2018','24-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2525','121005','KUPON DISKON 25%',1000,'10-08-2018','17-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2526','121006','KUPON DISKON 25%',1000,'10-08-2018','17-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2527','121007','KUPON DISKON 25%',1000,'10-08-2018','17-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2528','121008','KUPON BELANJA',500,'12-08-2018','15-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2529','121009','KUPON BELANJA',500,'12-08-2018','15-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2530','121010','KUPON BELANJA',500,'12-08-2018','15-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2531','121011','TIKET LIBURAN',1000,'14-08-2018','18-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2532','121012','TIKET LIBURAN',1000,'14-08-2018','18-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2533','121013','TIKET LIBURAN',1000,'14-08-2018','18-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2534','121014','TIKET LIBURAN',1000,'14-08-2018','18-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2535','121015','TIKET LIBURAN',1000,'14-08-2018','18-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2536','121016','KUPON BELANJA',500,'15-08-2018','17-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2537','121017','KUPON BELANJA',500,'15-08-2018','17-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2538','121018','KUPON BELANJA',500,'15-08-2018','17-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2539','121019','KUPON BELANJA',500,'15-08-2018','17-08-2018');
INSERT INTO KUPON (KODE_KUPON, ID_PEMBELI, NAMA_KUPON, TOTAL_POIN, TGL_PENGAMBILAN, TGL_KADALUARSA) VALUES ('DP2540','121020','KUPON BELANJA',500,'15-08-2018','17-08-2018');









