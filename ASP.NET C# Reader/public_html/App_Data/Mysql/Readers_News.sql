/*
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `categories` (`id`, `name`, `description`, `created`, `modified`) VALUES
(1, 'Fashion', 'Category for anythingnews related to fashion.', '2014-06-01 00:35:07', '2014-05-30 17:34:33'),
(2, 'Electronics', 'Gadgets, drones and more.', '2014-06-01 00:35:07', '2014-05-30 17:34:33'),
(3, 'Motors', 'Motor sports and more', '2014-06-01 00:35:07', '2014-05-30 17:34:54'),
(5, 'Movies', 'Movie products.', '0000-00-00 00:00:00', '2016-01-08 13:27:26'),
(6, 'Books', 'Kindle books, audio books and more.', '0000-00-00 00:00:00', '2016-01-08 13:27:47'),
(13, 'Sports', 'Drop into new winter gear.', '2016-01-09 02:24:24', '2016-01-09 01:24:24');

*/



CREATE TABLE IF NOT EXISTS `news` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`IdNew` int(11) ,
	`IdNewsPaper` int(11),
	`IdChannel` int(11),
    `Title` varchar(300) NOT NULL,
	`Description` varchar(8000) NULL,
	`PublishDate` datetime NOT NULL,
	`Link` varchar(1200) NULL,
	`Author` varchar(500) NULL,
	`Created` datetime NULL,
    `Diario` VARCHAR(255),
	`Categoria` VARCHAR(255),   
    PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `news_paper` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
    `IdNewsPaper` int(11),
    `Codigo` varchar(20) NOT NULL,
	`Nombre` varchar(128) NOT NULL,
	`Descripcion` varchar(4000) NULL,
	`RssNodeName` varchar(50) NULL,
	`Created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

 
CREATE TABLE IF NOT EXISTS `channel` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
    `IdChannel` int(11),
    `IdChannelType` int ,
    `IdNewsPaper` int ,
	`Codi` varchar(16) NOT NULL,
	`Description` varchar(255) NOT NULL,
	`descripcion2` varchar(255) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `channel_type` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
    `IdChannelType` int(11),
	`Codi` varchar(16) NOT NULL,
	`Description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
 

 
 CREATE TABLE IF NOT EXISTS `news_paper_url` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`IdNewsPaperUrl` int(11),
	`IdNewsPaper` int(11) NOT NULL,
	`IdChannel` int(11) NULL,
	`Url` varchar(2500) NOT NULL,
	`Enabled` bit NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
 
 
 
 
 
INSERT INTO `channel_type` (`IdChannelType`,`Codi`,`Description`)
VALUES  (1, 	'INDV', 	'Individual'),
		(2, 	'GENR', 	'Generico'); 

INSERT INTO `channel` (
`IdChannel`,`IdChannelType`,`IdNewsPaper`,`Codi`,`Description`,`descripcion2`) 
VALUES (19, 	2, 	5, 	'POLCA' ,	'Política' ,	'politica' ),
(20, 	2, 	5, 	'ECONO' ,	'Economía' ,	'economia' ),
(21, 	2, 	5, 	'DEPOR' ,	'Deportes' ,	''),
(22, 	2, 	5, 	'MUNDO' ,	'El Mundo' 	, ''),
(23, 	2, 	5, 	'SOCIEDAD' ,	'Sociedad', ''),
(24, 	1, 	6, 	'POLIC' ,	'Policiales' 	, ''),
(25, 	1, 	8, 	'UNICO' ,	'Canal unico para todos los tipos' ,	 ''),
(26, 	1, 	8, 	'NOTICIAS' 	,'noticias' ,	 '');

INSERT INTO `news_paper` (
		`IdNewsPaper`,`Codigo`,`Nombre`,`Descripcion`,`RssNodeName`,`Created`)
VALUES 	(5,	'GENERICO', 'Genérico', 'Diario inexistente utilizado para agrupar canales genericos a otros diarios',NULL,'2014-09-10 22:20:16.010'),
		(6,	'CLARIN',   'Clarin',	'Diario clarin online',	'item','2014-09-10 22:20:16.027'),
		(7,	'NACION',	'La Nación','Diario La Nación',		'entry','2014-09-10 22:20:16.060'),
		(8,'INFOBAE',	'Infobae',	'Diario Infobae',		'item','2014-09-10 22:20:16.077');

INSERT INTO `news_paper_url` (
	`IdNewsPaperUrl`,`IdNewsPaper`,`IdChannel`,`Url`,`Enabled`)
VALUES 	(1 ,	6 ,	19 ,	'http://clarin.feedsportal.com/c/33088/f/577688/index.rss',0), 
		(2 ,	6 ,	20 ,	'http://www.ieco.clarin.com/rss/', 	0 ),
		(3 ,	6 ,	21 ,	'http://www.clarin.com/rss/deportes/',1 ),
		(4 ,	6 ,	22 ,	'http://www.clarin.com/rss/mundo/',	1 ),
		(5 ,	6 ,	24 ,	'http://www.clarin.com/rss/policiales/', 	1 ),
		(6 ,	7 ,	19 ,	'http://contenidos.lanacion.com.ar/herramientas/rss/categoria_id=30',1 ),
		(7 ,	7 ,	20 ,	'http://contenidos.lanacion.com.ar/herramientas/rss/categoria_id=272', 	1), 
		(8 ,	7 ,	21 ,	'http://contenidos.lanacion.com.ar/herramientas/rss/categoria_id=131', 	1 ),
		(9 ,	7 ,	22 ,	'http://contenidos.lanacion.com.ar/herramientas/rss/categoria_id=7', 	1 ),
		(10, 	8 ,	19 ,	'http://cdn01.ib.infobae.com/adjuntos/162/rss/politica.xml', 	0 ),
		(11, 	8 ,	20 ,	'http://cdn01.ib.infobae.com/adjuntos/162/rss/economia.xml', 	0 ),
		(12, 	8 ,	21 ,	'http://cdn01.ib.infobae.com/adjuntos/162/rss/deportes.xml', 	0 ),
		(13, 	8 ,	23 ,	'http://cdn01.ib.infobae.com/adjuntos/162/rss/sociedad.xml', 	0 ),
		(14, 	6 ,	19 ,	'http://www.clarin.com/rss/politica/', 	1 ),
		(15, 	8 ,	25 ,	'http://www.infobae.com/argentina-rss.xml', 	1 );
        
 

select count(1) from `readers`.`news`;
truncate table `readers`.`news`;