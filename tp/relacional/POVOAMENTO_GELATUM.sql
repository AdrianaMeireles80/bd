USE GELATUM;

-- DROP DATABASE GELATUM;

-- POVOAMENTO DA TABELA CLIENTE
INSERT INTO Cliente
(nome_cliente, password_cliente, nome_utilizador, nif, email, telemovel, data_nascimento)
VALUES
		('Luke Galloway','_y','LGalloway13',4715,'Kevin@Ut.us',910200300,'1963-11-13'),
		('Merrill Page','>gW;}9J','Page1964',1117,'Kerry@parturient.net',910200308,'1964-10-26'),
		('Dale Sullivan','_vb0D','DaleS1',5448,'Mannix@leo.edu',910200316,'1967-01-06'),
		('Xanthus Sandoval','BFz/rei?=F','XSandy_19',1814,'Barbara@Phasellus.com',910200324,'1970-12-19'),
		('Damon Lewis','{','DL25',8260,'Tarik@inceptos.us',910200332,'1970-12-25'),
		('Sigourney England','K~+bB8H7p%','England_N1',3314,'Mufutau@tincidunt.org',910200340,'1972-06-01'),
		('Aladdin Lester','eKzRV6iv','_Aladdin_',6399,'Libby@natoque.com',910200348,'1976-11-13'),
		('Hop Clay','s#8z!;UDV','the_last_HOP(e)',5229,'Lysandra@morbi.gov',910200356,'1979-07-01'),
		('Elliott Day','hlSJ5d35','DAY79',2248,'Willa@Cras.net',910200364,'1979-08-14'),
		('Laurel Reynolds','@p>Dua','Reynolds',745,'Miriam@tristique.org',910200372,'1979-09-02'),
		('Thor Ortega','Z6pkl','Thor_lightning82',9166,'Jeanette@tempus.net',910200380,'1982-01-27'),
		('Selma Turner','(aI{ID`NfY','90Selma',2425,'Shea@montes.gov',910200388,'1990-11-16'),
		('Dale Rivers','OKiI-k_c','RiversDale',7381,'Keaton@odio.edu',910200396,'1991-05-12'),
		('Cally Hatfield','Xl_D~m1dT','CallyHat',2763,'Candace@lacus.us',910200404,'1991-10-15'),
		('Adele Lane','pwq!uoFX','Adele_#1',2992,'Kadeem@Cum.net',910200412,'1994-07-27'),
		('Maia Ramos','#H','last_Maia',1387,'Ciaran@Curae.edu',910200420,'1995-07-24'),
		('Freya Kirkland','a','Fkirk',5785,'Felicia@dignissim.org',910200428,'1995-12-18'),
		('Yen Puckett','~Jf Y~M!F','yenP96',3455,'Driscoll@Nam.gov',910200436,'1996-07-10'),
		('Jenette Brooks','OzeGLBz','J_Brooks',1296,'Alice@dictum.edu',910200444,'1998-10-08'),
		('Serena Walton',';q <o','68serena75',6875,'Ebony@ultricies.edu',910200452,'1998-12-04'),
		('Dylan Mills','CBoE{vLR','mills02',2320,'Gary@elit.org',910200460,'2002-05-24'),
		('Quamar Guthrie','847)','daltonGuthrie',1866,'Dalton@nostra.com',910200468,'2000-11-06'),
		('Maile Winters','jiW','winters_is_comming',2635,'Whoopi@In.net',910200476,'2001-11-25'),
		('Madonna Hooper','7v','queen_Madonna',2473,'Kirk@quam.gov',910200484,'2003-02-08'),
		('Nigel Saunders','fvRh','nigelSolomon',5521,'Solomon@libero.net',910200492,'2000-12-01'),
		('Ingrid Robinson',';DE:/-','ingridRbsn',6136,'Kevin@sem.us',910200500,'1965-06-26'),
		('Althea Fry','y%duoe/','fry_chicken',3012,'Shelly@commodo.gov',910200508,'1966-02-01'),
		('Russell Byers','_','russ_byers',1272,'Xanthus@scelerisque.net',910200516,'1967-04-14'),
		('Ira Evans',').Im~+','ira67',3451,'Armando@id.us',910200524,'1967-09-06'),
		('Nita Long','-]','longNight',8012,'Melodie@imperdiet.net',910200532,'1968-10-08'),
		('Nigel Hutchinson','p1&P','hutch74',5711,'Xenos@feugiat.gov',910200540,'1974-06-07'),
		('Myles Yang','/EX?','yang_miles',4458,'Belle@faucibus.org',910200548,'1979-11-04'),
		('Raja Howe','=jwG','raja_14_howe',6120,'Bianca@posuere.org',910200556,'1983-02-14'),
		('Linda Petty','O','lindapetty84',7632,'Allistair@Proin.gov',910200564,'1984-10-05'),
		('Edward Woods','W','edWood10',8048,'Nehru@orci.us',910200572,'1985-12-10'),
		('Carla Ayala','bm`0gBg','carla1023',8921,'Tanek@Integer.gov',910200580,'1985-12-22'),
		('Forrest Cleveland','f* IIt','forrest_not_gump',1197,'Robert@mi.com',910200588,'1988-10-23'),
		('Rajah Gilliam','2LqcllZ','rajaG11',5330,'Howard@Cras.com',910200596,'1988-11-26'),
		('Lareina Hammond','#<?','hamm1991',1741,'Marshall@ac.gov',910200604,'1991-03-10'),
		('Abigail Blankenship','=1odm]','abbyBlank',2068,'Kiayada@pede.net',910200612,'1991-03-10'),
		('Alexandra Levy','Q&6@','alexLevy',8507,'Jorden@porttitor.edu',910200620,'1993-02-20'),
		('Daquan Wiley','HW.WUj*a-','wileynotWonka',3529,'Talon@facilisis.org',910200628,'1993-12-16'),
		('Margaret Delacruz','r%O2}{','delacruz1994',6427,'Yvette@primis.gov',910200636,'1994-07-04'),
		('Leandra Haynes','HqQj1g','haynesL97',93,'Mufutau@Suspendisse.us',910200644,'1997-03-24'),
		('Thane Mccall','HNnPU','thane_the_man',6555,'Kyra@suscipit.com',910200652,'2000-11-28'),
		('Flynn Keith','Z(\b.IKFb.','20keithFlynn02',8159,'Guinevere@adipiscing.us',910200660,'2002-09-13'),
		('Allistair Blanchard','Uh','BlanchmyAllistair',5323,'Lawrence@primis.us',910200668,'1996-11-13'),
		('Aiko Combs','c(Q_3','aiko_jpn',5532,'Moses@id.org',910200676,'2003-05-20'),
		('Xavier David','Gu','professor_xavier',7138,'Kasper@tortor.us',910200684,'2003-06-17'),
		('Karina Alvarado','Wl#b','kAlvarado21',4245,'Basil@cursus.com',910200692,'2003-08-21');
-- SELECT * FROM Cliente;



-- POVOAMENTO DA TABELA FUNCIONARIO        
INSERT INTO Funcionario
(id_funcionario, nome_funcionario, password_funcionario)
VALUES
		(1,'Jose Lopes','jlopes78'),
        (id_funcionario,'Ana Costa','ac1986'),
        (id_funcionario,'Nuno Carvalho','carvalho00'),
        (id_funcionario,'Adriana Pereira','Apereira123');
-- SELECT * FROM Funcionario;



-- POVOAMENTO DA TABELA PEDIDO
INSERT INTO Pedido
(id_pedido,dataP,valor_total,tempo,pago,recolhido,desconto,id_funcionario,nif)
VALUES
		(1,'2015-06-01 12:02:00',6.6,15,1,1,1,2,4715),
        (id_pedido,'2015-06-01 14:08:00',2.4,15,1,1,1,2,1387),
        (id_pedido,'2015-06-01 02:00:00',2.1,15,1,1,1,2,1814),
        (id_pedido,'2016-06-04 00:04:00',10.5,15,1,1,1,3,7381),
        (id_pedido,'2015-06-03 20:00:00',7.5,15,1,1,1,2,8012),
        (id_pedido,'2015-06-07 00:10:00',18,15,1,1,1,1,1814),
        (id_pedido,'2017-08-28 08:08:08',2.1,10,1,1,1,1,4245);
-- SELECT * FROM Pedido;



-- POVOAMENTO DA TABELA GELADO_BASE
INSERT INTO Gelado_Base
(id_gelado,nome_gelado, composicao_gelado, preco_gelado, stock_gelado)
VALUES
		(1,'Gelado Morango', 'LEITE magro reconstituído, morangos (31%), açúcar, xarope de glucose e frutose, gordura de coco, LACTOSE e proteínas lácteas (LEITE), LEITE magro em pó, espessantes, emulsionante, sumo de beterraba concentrado, aromas, sumo de limão concentrado, corante', 0.70, 100),
		(id_gelado,'Gelado Chocolate', 'LEITE magro reconstituído, NATAS (20%), açúcar, cacau magro em pó (6.5%), gema de OVO, LEITE magro concentrado, espessante', 0.90, 100),
		(id_gelado,'Gelado Nata', 'LEITE magro reconstituído, NATAS (20%), açúcar, LEITE magro em pó, emulsionante, aromas', 0.80, 100),
		(id_gelado,'Gelado Noz', 'LEITE magro reconstituído, açúcar, água, NOZES (9%), gordura de coco, óleo de girassol, LACTOSE e proteínas lácteas (LEITE), emulsionante, espessantes, aromas, corante', 0.60, 100),
		(id_gelado,'Gelado Café', 'LEITE magro reconstituído, açúcar, NATAS,água, MANTEIGA concentrada, LACTOSE e proteínas lácteas (LEITE), café Arábica solúvel, pasta de cacau, aromas, extrato de café, açúcar caramelizado, manteiga de cacau, espessantes, emulsionante', 0.50, 100),
		(id_gelado,'Gelado Baunilha', 'LEITE magro reconstituído, NATAS (25%), açúcar, LEITE magro concentrado, gema de OVO, espessante, aromas naturais, extrato de baunilha, vagem de baunilha', 0.50, 100),
        (id_gelado,'Gelado Menta', 'LEITE magro reconstituído, NATAS (23%), açúcar, LEITE magro concentrado, gema de OVO, espessante, aromas naturais, extrato de menta', 0.80, 100);
-- SELECT * FROM Gelado_Base;



-- POVOAMENTO DA TABELA EXTRA
INSERT INTO Extra
(id_extra,nome_extra, composicao_extra, preco_extra, stock_extra)
VALUES
		(1,'Pepitas Chocolate', '100% Chocolate Negro', 0.10, 30),
		(id_extra,'Chantilly', '90% Natas, 9% Açúcar, 1% Baunilha', 0.20, 30),
		(id_extra,'M&Ms', '90% Chocolate, 10% Açúcar', 0.5, 30),
		(id_extra,'Caramelo', '100% Açúcar', 0.15, 30),
		(id_extra,'Oreo', 'Farinha de trigo, açúcar, gordura vegetal, óleo vegetal, cacau, açúcar, sal', 0.5, 30),
		(id_extra,'Kit Kat', 'Farinha de trigo, açúcar, gordura vegetal, óleo vegetal, cacau, açúcar, sal', 0.5, 30),
		(id_extra,'Simples','',0,100); 
-- SELECT * FROM Extra;



-- POVOAMENTO DA TABELA CRIACAO_GELADO
INSERT INTO Criacao_Gelado
(id_criacao,valor_criacao,id_gelado)
VALUES
		(1,0.8,1),
        (id_criacao,0.60,4),
        (id_criacao,1.50,6),
        (id_criacao,1.50,5),
        (id_criacao,3,7),
		(id_criacao,0.70,1);
-- SELECT * FROM Criacao_Gelado;



-- POVOAMENTO CRIACAO_GELADO__EXTRA
INSERT INTO Criacao_Gelado__Extra
(id_criacao,id_extra,quantidade_extra)
VALUES 
		(1,1,1),
        (2,7,1),
        (3,6,2),
        (4,4,2),
        (5,2,11),
        (6,7,1);
-- SELECT * FROM Criacao_Gelado__Extra;



-- POVOAMENTO PEDIDO__CRIACAO_GELADO
INSERT INTO Pedido__Criacao_Gelado
(id_pedido,id_criacao,quantidade_criacao)
VALUES
		(1,1,6),
        (2,1,3),
        (3,2,1),
        (4,3,7),
        (5,4,5),
        (1,2,3),
        (3,4,1),
        (6,5,6),
        (7,6,3);
-- SELECT * FROM Pedido__Criacao_Gelado;