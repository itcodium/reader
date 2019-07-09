CREATE DATABASE  IF NOT EXISTS `data_mining_go` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `data_mining_go`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: data_mining_go
-- ------------------------------------------------------
-- Server version	5.6.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `idLink` int(11) NOT NULL AUTO_INCREMENT,
  `idUrl` int(11) DEFAULT NULL,
  `link` varchar(300) DEFAULT NULL,
  `file_path` varchar(500) DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `fecha_proceso` timestamp NULL DEFAULT NULL,
  `fecha_parseo` timestamp NULL DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idLink`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT INTO `link` VALUES (1,1,' http://www.infobae.com/especiales/cyber-monday/','./webs/Infobae/1.html','python','2016-10-31 00:28:39',NULL,'2016-10-31 00:26:50',NULL),(2,1,'/deportes-2/2016/10/30/campeonato-de-primera-division-2016-fecha-8-arsenal-vs-river/','./webs/Infobae/2.html','python','2016-10-31 00:28:40',NULL,'2016-10-31 00:26:50',NULL),(3,1,'/america/america-latina/2016/10/30/la-oposicion-venezolana-participara-del-encuentro-con-el-chavismo-para-presentar-las-condiciones-para-el-dialogo/','./webs/Infobae/3.html','python','2016-10-31 00:28:43',NULL,'2016-10-31 00:26:50',NULL),(4,1,'/teleshow/infoshow/2016/10/30/raul-rizzo-tras-su-duro-cruce-con-nicolas-magaldi-a-los-neutrales-no-les-creo-mucho/','./webs/Infobae/4.html','python','2016-10-31 00:28:46',NULL,'2016-10-31 00:26:50',NULL),(5,1,'http://www.infobae.com/deportes/','./webs/Infobae/5.html','python','2016-10-31 00:28:49',NULL,'2016-10-31 00:26:50',NULL),(6,1,'/deportes-2/2016/10/30/kate-rodriguez-encendio-las-redes-con-su-disfraz-de-gatubela/','./webs/Infobae/6.html','python','2016-10-31 00:28:52',NULL,'2016-10-31 00:26:50',NULL),(7,1,'/deportes-2/2016/10/30/la-impactante-lesion-de-jorge-broun-que-lo-saco-del-partido/','./webs/Infobae/7.html','python','2016-10-31 00:28:56',NULL,'2016-10-31 00:26:50',NULL),(8,1,'/noticias/2016/10/30/gamez-a-marcelo-tinelli-le-robaron-las-elecciones-en-afa/','./webs/Infobae/8.html','python','2016-10-31 00:28:59',NULL,'2016-10-31 00:26:50',NULL),(9,1,'/sociedad/2016/10/30/10-consejos-para-tener-en-cuenta-por-el-cyber-mondey/','./webs/Infobae/9.html','python','2016-10-31 00:29:02',NULL,'2016-10-31 00:26:50',NULL),(10,1,'/america/america-latina/2016/10/30/ricardo-montaner-comparo-a-donald-trump-con-hugo-chavez-y-aseguro-que-si-el-magnate-gana-las-elecciones-de-estados-unidos-se-va-del-pais/','./webs/Infobae/10.html','python','2016-10-31 00:29:05',NULL,'2016-10-31 00:26:50',NULL),(11,1,'/politica/2016/10/30/el-sueldo-de-diputados-y-senadores-aumento-casi-un-50-y-hay-polemica/','./webs/Infobae/11.html','python','2016-10-31 00:29:08',NULL,'2016-10-31 00:26:50',NULL),(12,1,'/politica/2016/10/30/cristina-elisabet-kirchner-vinculo-a-mauricio-macri-con-posibles-allanamientos-a-su-casa-en-rio-gallegos/','./webs/Infobae/12.html','python','2016-10-31 00:29:12',NULL,'2016-10-31 00:26:50',NULL),(13,1,'/teleshow/paso-en-la-tv/2016/10/30/el-duro-cruce-entre-el-periodista-nicolas-magaldi-y-el-actor-raul-rizzo/','./webs/Infobae/13.html','python','2016-10-31 00:29:15',NULL,'2016-10-31 00:26:50',NULL),(14,1,'/politica/2016/10/30/el-operativo-del-kirchnerismo-para-acompanar-a-cristina-kirchner-a-los-tribunales-de-comodoro-py/','./webs/Infobae/14.html','python','2016-10-31 00:29:18',NULL,'2016-10-31 00:26:50',NULL),(15,1,'/economia/2016/10/30/los-destinos-turisticos-que-eligen-los-argentinos-para-2017/','./webs/Infobae/15.html','python','2016-10-31 00:29:21',NULL,'2016-10-31 00:26:50',NULL),(16,1,'/teleshow/infoshow/2016/10/30/entre-premios-felicidad-y-dramas-mirtha-legrand-sigue-siendo-la-duena-de-la-cabecera-de-la-mesa/','./webs/Infobae/16.html','python','2016-10-31 00:29:25',NULL,'2016-10-31 00:26:50',NULL),(17,1,'/deportes-2/2016/10/30/diego-maradona-16-recuerdos-increibles-de-mi-infancia-en-fiorito/','./webs/Infobae/17.html','python','2016-10-31 00:29:28',NULL,'2016-10-31 00:26:50',NULL),(18,1,'/america/deportes/2016/10/30/salto-la-reja-que-lo-separaba-de-la-tribuna-le-pego-una-brutal-patada-a-un-aficionado-y-fue-detenido/','./webs/Infobae/18.html','python','2016-10-31 00:29:31',NULL,'2016-10-31 00:26:50',NULL),(19,1,'/deportes-2/2016/10/30/la-noche-en-que-el-boxeo-vio-al-mejor-muhammad-ali-de-su-vida/','./webs/Infobae/19.html','python','2016-10-31 00:29:34',NULL,'2016-10-31 00:26:50',NULL),(20,1,'/teleshow/fotos-teleshow/2016/10/29/la-ceremonia-desde-adentro-toda-la-intimidad-de-los-famosos/','./webs/Infobae/20.html','python','2016-10-31 00:29:38',NULL,'2016-10-31 00:26:50',NULL),(21,1,'/deportes-2/2016/10/30/diego-maradona-56-anos-en-25-frases/','./webs/Infobae/21.html','python','2016-10-31 00:29:41',NULL,'2016-10-31 00:26:50',NULL),(22,1,'/sociedad/2016/10/30/una-carrera-de-drones-la-principal-atraccion-del-campus-party/','./webs/Infobae/22.html','python','2016-10-31 00:29:44',NULL,'2016-10-31 00:26:50',NULL),(23,1,'/america/mundo/2016/10/30/piloto-se-fotografio-desnudo-y-con-pornografia-en-pleno-vuelo/','./webs/Infobae/23.html','python','2016-10-31 00:29:47',NULL,'2016-10-31 00:26:51',NULL),(24,1,'/fotos/2016/10/30/la-ciudad-vive-a-pleno-la-noche-de-los-museos/','./webs/Infobae/24.html','python','2016-10-31 00:29:50',NULL,'2016-10-31 00:26:51',NULL),(25,1,'/espacio-no-editorial/2016/10/28/las-ofertas-mas-destacadas-en-la-previa-del-cyber-monday/','./webs/Infobae/25.html','python','2016-10-31 00:29:54',NULL,'2016-10-31 00:26:51',NULL),(26,1,'/politica/2016/10/29/el-tenso-cruce-entre-daniel-scioli-y-el-papa-del-nene-que-mato-a-un-ladron/','./webs/Infobae/26.html','python','2016-10-31 00:29:57',NULL,'2016-10-31 00:26:51',NULL),(27,1,'/america/america-latina/2016/10/30/el-milagroso-hallazgo-de-la-virgen-de-la-candelaria-protectora-de-punta-del-este-desaparecida-tras-el-ciclon/','./webs/Infobae/27.html','python','2016-10-31 00:30:00',NULL,'2016-10-31 00:26:51',NULL),(28,1,'/deportes-2/2016/10/30/terror-en-la-general-paz-balacera-entre-barras-de-chicago-y-tigre/','./webs/Infobae/28.html','python','2016-10-31 00:30:03',NULL,'2016-10-31 00:26:51',NULL),(29,1,'/teleshow/infoshow/2016/10/30/luisana-lopilato-viajo-de-urgencia-a-eeuu-por-la-salud-de-su-hijo-noah/','./webs/Infobae/29.html','python','2016-10-31 00:30:06',NULL,'2016-10-31 00:26:51',NULL),(30,1,'/politica/2016/10/30/maria-eugenia-vidal-reforzo-su-custodia-y-evalua-cambios-en-el-gabinete/','./webs/Infobae/30.html','python','2016-10-31 00:30:10',NULL,'2016-10-31 00:26:51',NULL),(31,1,'/politica/2016/10/30/el-plan-del-gobierno-que-inquieta-a-tierra-del-fuego/','./webs/Infobae/31.html','python','2016-10-31 00:30:13',NULL,'2016-10-31 00:26:51',NULL),(32,1,'/politica/2016/10/30/exclusivo-vidal-massa-larreta-y-monzo-juntos-para-mitigar-el-desorden-politico/','./webs/Infobae/32.html','python','2016-10-31 00:30:16',NULL,'2016-10-31 00:26:51',NULL),(33,1,'/tendencias/2016/10/29/la-atrapante-historia-del-estafador-que-vendio-la-torre-eiffel-dos-veces/','./webs/Infobae/33.html','python','2016-10-31 00:30:19',NULL,'2016-10-31 00:26:51',NULL),(34,1,'/politica/2016/10/30/un-concejal-de-avellaneda-fue-detenido-porque-manejaba-ebrio-y-armo-un-escandalo-con-la-policia/','./webs/Infobae/34.html','python','2016-10-31 00:30:22',NULL,'2016-10-31 00:26:51',NULL),(35,1,'/politica/2016/10/30/para-la-iglesia-los-subsidios-son-necesarios-pero-sin-trabajo-y-educacion-no-tienen-sentido/','./webs/Infobae/35.html','python','2016-10-31 00:30:27',NULL,'2016-10-31 00:26:51',NULL),(36,1,'/politica/2016/10/30/el-gobierno-bonaerense-advierte-que-necesita-un-endeudamiento-millonario-para-evitar-un-ajuste-feroz/','./webs/Infobae/36.html','python','2016-10-31 00:30:30',NULL,'2016-10-31 00:26:51',NULL),(37,1,'/sociedad/2016/10/30/ale-sergi-a-mi-me-conviene-componer-limpio/','./webs/Infobae/37.html','python','2016-10-31 00:30:33',NULL,'2016-10-31 00:26:51',NULL),(38,1,'/sociedad/2016/10/30/todo-empieza-en-la-mente/','./webs/Infobae/38.html','python','2016-10-31 00:30:36',NULL,'2016-10-31 00:26:51',NULL),(39,1,'/teleshow/fotos-teleshow/2016/10/29/la-alfombra-roja-de-los-martin-fierro-de-radio-en-fotos/','./webs/Infobae/39.html','python','2016-10-31 00:30:39',NULL,'2016-10-31 00:26:51',NULL),(40,1,'/vidriera/2016/10/30/la-comida-anual-del-proyecto-educar-2050/','./webs/Infobae/40.html','python','2016-10-31 00:30:42',NULL,'2016-10-31 00:26:51',NULL),(41,1,'http://www.infobae.com/teleshow/','./webs/Infobae/41.html','python','2016-10-31 00:30:46',NULL,'2016-10-31 00:26:51',NULL),(42,1,'/teleshow/infoshow/2016/10/30/los-mensajes-de-gianinna-para-diego-maradona-por-su-cumpleanos-te-amo-incondicionalmente-le-pese-a-quien-le-pese/','./webs/Infobae/42.html','python','2016-10-31 00:30:49',NULL,'2016-10-31 00:26:51',NULL),(43,1,'/teleshow/infoshow/2016/10/30/perimetral-bozal-legal-y-multas-millonarias-cuando-la-justicia-intervino-en-showmatch/','./webs/Infobae/43.html','python','2016-10-31 00:30:52',NULL,'2016-10-31 00:26:51',NULL),(44,1,'/teleshow/paso-en-la-tv/2016/10/30/videos-emotivo-reencuentro-entre-javier-portales-y-minguito/','./webs/Infobae/44.html','python','2016-10-31 00:30:55',NULL,'2016-10-31 00:26:51',NULL),(45,1,'/teleshow/infoshow/2016/10/30/en-miami-pampita-mostro-la-cola-y-pico-monaco-su-lomazo/','./webs/Infobae/45.html','python','2016-10-31 00:30:58',NULL,'2016-10-31 00:26:51',NULL),(46,1,'/teleshow/infoshow/2016/10/30/a-pesar-del-enojo-dalma-maradona-tambien-le-mando-un-mensaje-a-diego-en-el-dia-del-cumpleanos/','./webs/Infobae/46.html','python','2016-10-31 00:31:01',NULL,'2016-10-31 00:26:51',NULL),(47,1,'/teleshow/infoshow/2016/10/30/en-su-cumpleanos-maradona-inauguro-el-local-cafe-diego-en-dubai/','./webs/Infobae/47.html','python','2016-10-31 00:31:05',NULL,'2016-10-31 00:26:51',NULL),(48,1,'/opinion/2016/10/29/por-que-la-iglesia-apoyo-a-la-dictadura/','./webs/Infobae/48.html','python','2016-10-31 00:31:08',NULL,'2016-10-31 00:26:51',NULL),(49,1,'/opinion/2016/10/30/avanza-la-reforma-electoral/','./webs/Infobae/49.html','python','2016-10-31 00:31:12',NULL,'2016-10-31 00:26:51',NULL),(50,1,'/opinion/2016/10/30/10-razones-para-que-el-bcra-desaliente-el-uso-de-efectivo/','./webs/Infobae/50.html','python','2016-10-31 00:31:17',NULL,'2016-10-31 00:26:51',NULL),(51,1,'/opinion/2016/10/30/jorge-batlle-una-leccion-de-grandeza/','./webs/Infobae/51.html','python','2016-10-31 00:31:21',NULL,'2016-10-31 00:26:51',NULL),(52,1,'/opinion/2016/10/30/un-estado-coordinado-para-proteger-a-los-mas-debiles/','./webs/Infobae/52.html','python','2016-10-31 00:31:25',NULL,'2016-10-31 00:26:51',NULL),(53,1,'/opinion/2016/10/30/nicaragua-o-el-eterno-retorno-a-la-barbarie/','./webs/Infobae/53.html','python','2016-10-31 00:31:30',NULL,'2016-10-31 00:26:52',NULL),(54,1,'http://www.infobae.com/tendencias/','./webs/Infobae/54.html','python','2016-10-31 00:31:33',NULL,'2016-10-31 00:26:52',NULL),(55,1,'/tendencias/lifestyle/2016/10/29/michelle-obama-los-12-looks-de-gala-de-la-primera-dama-mas-carismatica/','./webs/Infobae/55.html','python','2016-10-31 00:31:36',NULL,'2016-10-31 00:26:52',NULL),(56,1,'/tendencias/2016/10/29/paternidad-anti-helicoptero-los-riesgos-fisicos-pueden-ayudar-a-una-mejor-crianza/','./webs/Infobae/56.html','python','2016-10-31 00:31:39',NULL,'2016-10-31 00:26:52',NULL),(57,1,'/turismo/2016/10/29/napa-valley-un-paseo-por-las-bodegas-mas-fascinantes-de-la-region-del-vino/','./webs/Infobae/57.html','python','2016-10-31 00:31:43',NULL,'2016-10-31 00:26:52',NULL),(58,1,'/tendencias/lifestyle/2016/10/29/david-lachapelle-a-solas-con-infobae-mis-imagenes-no-necesitan-subtitulos/','./webs/Infobae/58.html','python','2016-10-31 00:31:46',NULL,'2016-10-31 00:26:52',NULL),(59,1,'/turismo/2016/10/29/los-7-mejores-lugares-del-mundo-para-celebrar-halloween/','./webs/Infobae/59.html','python','2016-10-31 00:31:49',NULL,'2016-10-31 00:26:52',NULL),(60,1,'/autos/2016/10/29/los-concept-car-del-pasado-como-imagino-la-industria-a-los-autos-del-presente/','./webs/Infobae/60.html','python','2016-10-31 00:37:07',NULL,'2016-10-31 00:26:52',NULL),(61,1,'/diarios/2016/10/30/clarin-domingo-30-de-octubre-de-2016/','./webs/Infobae/61.html','python','2016-10-31 00:37:11',NULL,'2016-10-31 00:26:52',NULL),(62,1,'/deportes-2/2016/10/30/laprovittola-ya-se-luce-con-sus-jugadas-en-la-nba/','./webs/Infobae/62.html','python','2016-10-31 00:37:15',NULL,'2016-10-31 00:26:52',NULL),(63,1,'/deportes-2/2016/10/30/marcos-siebert-el-argentino-que-se-consagro-campeon-tras-vencer-al-hijo-de-michael-schumacher/','./webs/Infobae/63.html','python','2016-10-31 00:37:18',NULL,'2016-10-31 00:26:52',NULL),(64,1,'/deportes-2/2016/10/30/campeonato-de-primera-2016-fecha-8-newells-vs-san-lorenzo/','./webs/Infobae/64.html','python','2016-10-31 00:37:21',NULL,'2016-10-31 00:26:52',NULL),(65,1,'/deportes-2/2016/10/30/a-42-anos-de-la-pelea-en-la-selva-el-verdadero-combate-del-siglo/','./webs/Infobae/65.html','python','2016-10-31 00:37:24',NULL,'2016-10-31 00:26:52',NULL),(66,1,'/teleshow/paso-en-la-tv/2016/10/30/la-confesion-de-mirtha-legrand-yo-fumaba-20-cigarrillos-por-dia/','./webs/Infobae/66.html','python','2016-10-31 00:37:28',NULL,'2016-10-31 00:26:52',NULL),(67,1,'/teleshow/infoshow/2016/10/30/rocio-guirao-diaz-mostro-sus-curvas-con-una-sensual-bikini/','./webs/Infobae/67.html','python','2016-10-31 00:37:31',NULL,'2016-10-31 00:26:52',NULL),(68,1,'/teleshow/infoshow/2016/10/30/marama-y-rombai-cantan-su-ranking-de-canciones-favoritas/','./webs/Infobae/68.html','python','2016-10-31 00:37:34',NULL,'2016-10-31 00:26:52',NULL),(69,1,'/teleshow/paso-en-la-tv/2016/10/30/wisin-habla-por-primera-vez-de-la-muerte-de-su-bebe/','./webs/Infobae/69.html','python','2016-10-31 00:37:37',NULL,'2016-10-31 00:26:52',NULL),(70,1,'https://www.facebook.com/Infobae/','./webs/Infobae/70.html','python','2016-10-31 00:37:40',NULL,'2016-10-31 00:26:52',NULL),(71,1,'https://www.arcpublishing.com/','./webs/Infobae/71.html','python','2016-10-31 00:37:40',NULL,'2016-10-31 00:26:52',NULL),(72,1,'http://www.infobae.com/?noredirect','./webs/Infobae/72.html','python','2016-10-31 00:37:40',NULL,'2016-10-31 00:26:52',NULL),(73,2,'/politica/Investigaran-Cristina-Kirchner-Maximo-Florencia_0_1678032259.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(74,2,'/politica/Cristina-Kirchner-Buenos-Aires-corrupcion_0_1678032243.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(75,2,'/politica/Cristina-Kirchner-persecucion-Mauricio-Macri_0_1678032271.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(76,2,'/ciudades/Manana-aumenta-subte-viaje-costara_0_1678032227.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(77,2,'/deportes/futbol/river-plate/River-gran-chance-despegar_0_1678032188.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(78,2,'/deportes/futbol/san-lorenzo/San-Lorenzo-rotacion-visitar-Newells_0_1678032189.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(79,2,'http://www.clarin.com/deportes/estadisticas.html#posiciones',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(80,2,'/politica/Polemica-fuerte-aumento-diputados-senadores_0_1678032202.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(81,2,'/politica/Recalde-dietas-forma-financiar-politica_0_1678032234.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(82,2,'/policiales/Cae-empleada-brutal-crimen-patrona_0_1678032258.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(83,2,'/politica/Scioli-discusion-padre-chico-ladron_0_1678032182.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(84,2,'/politica/Corrupcion-Baezy-enfrentar-Cristina-Justicia_0_1677432361.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(85,2,'/politica/Cristina-Kirchner-distribucion-gobierno-horizontal_0_1678032217.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(86,2,'/opinion/FpV-Felicidades-Victoria_0_1678032183.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(87,2,'/deportes/futbol/atletico-rafaela/Rafaela-Colon-levantar-punteria_0_1678032193.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(88,2,'/deportes/futbol/godoy-cruz/Godoy-Cruz-quiere-estirar-positiva_0_1678032192.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(89,2,'/deportes/futbol/tigre/Graves-Tigre-Chicago-General-Paz_0_1678032214.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(90,2,'/deportes/automovilismo/Hamilton-gano-Mexico-F1-caliente_0_1678032232.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(91,2,'/mundo/pastor-evangelico-alcalde-Rio-Janeiro_0_1678032251.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(92,2,'/mundo/nuevo-sismo-sacudio-centro-Italia_0_1678032186.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(93,2,'/extrashow/tv/Raul-Rizzo-C5N-Nicolas-Magaldi_0_1678032206.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(94,2,'/policiales/Trafico-cocaina-causas-drogas-prision_0_1677432367.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:53',NULL),(95,2,'/mundo/Dayton-frustracion-crece-epidemia-drogas_0_1678032249.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:54',NULL),(96,2,'/politica/Indice-optimismo-numeros-Gobierno-Macri_0_1678032215.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:54',NULL),(97,2,'/sociedad/refugiada-victima-viveza-criolla-asado_0_1677432344.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:54',NULL),(98,2,'/sociedad/Furor-video-hombre-frena-acosador_0_1678032220.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:54',NULL),(99,2,'/extrashow/fama/Martin-Fierro-Radio-Minuto-entrega_0_1677432331.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:54',NULL),(100,2,'/deportes/futbol-internacional/insolita-agresion-futbolista-argentino-Chile_0_1678032194.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:54',NULL),(101,2,'/todoviajes/tendencias/Tendencias-destinos-tarifas-verano-viene_0_1678032212.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:54',NULL),(102,2,'/todoviajes/destinos/america-del-sur/playas-Brasil-Caribe_0_1676832434.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:54',NULL),(103,2,'/deportes/basquet/Ginobili-San-Antonio-sigue-invicto_0_1678032187.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:54',NULL),(104,2,'/deautos/a-fondo/chocan-moderno-ingenieria-hace-anos_0_1678032204.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:54',NULL),(105,2,'/ieco/Argentina-China-Macri-fantasmas-apertura-inversiones_0_1677432352.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:54',NULL),(106,2,'/ieco/economia/elecciones-peso-va-ganar-dolar_0_1676832429.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:54',NULL),(107,2,'/ieco/economia/Crece-lentamente-confianza-bancos_0_1676832394.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:54',NULL),(108,2,'/ieco/economia/mano-Sturzenegger_0_1676832460.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:54',NULL),(109,2,'/ieco/economia/Macri-prepara-futuro-Massa_0_1676832458.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:54',NULL),(110,2,'/ieco/economia/feliz-tiempo-importante-dinero_0_1676832418.html',NULL,'python',NULL,NULL,'2016-10-31 00:26:54',NULL),(111,3,'/1951810-hector-recalde-sobre-el-aumento-de-sueldo-a-los-diputados-supongo-que-los-que-se-quejaron-lo-habran-donado-al-garrahan',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(112,3,'/1951835-cristina-kirchner-volvio-a-capital-y-denuncio-una-operacion-judicial-en-su-contra',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(113,3,'/1951854-revelan-los-movimientos-de-dinero-entre-cristina-kirchner-y-su-hija-florencia',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(114,3,'/1951731-el-padre-del-chico-que-mato-a-un-ladron-cruzo-a-daniel-scioli',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(115,3,'/1950948-arsenal-river-torneo-primera-division-201617-fecha-8',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(116,3,'/1951811-los-golazos-de-newells-del-bombazo-de-formica-a-la-perla-de-maxi-rodriguez',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(117,3,'/1950945-newells-san-lorenzo-torneo-primera-division-201617-fecha-8',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(118,3,'/1951808-ordenan-la-detencion-de-los-presuntos-autores-del-crimen-del-presidente-de-la-editorial-sigmar',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(119,3,'/1951802-raul-rizzo-exploto-al-aire-y-nicolas-magaldi-lo-echo-del-programa',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(120,3,'/1951815-un-concejal-de-avellaneda-se-peleo-con-la-policia-tras-ser-detenido-por-manejar-borracho',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(121,3,'/1951765-martin-fierro-de-la-radio-2016-fernando-bravo-le-puso-nombre-y-apellido-a-los-empresarios-oportunistas-de-los-que-hablo-en-su-discurso',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(122,3,'/1951661-los-errores-politicos-condicionan-al-gobierno',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(123,3,'/1951630-cyber-monday-2016-claves-para-atravesarlo-sin-sufrir-estafas-ni-enganos',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(124,3,'/1951755-martin-fierro-de-la-radio-2016-amor-enojos-y-todo-lo-que-no-se-vio-de-la-ceremonia',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(125,3,'/1951777-italia-terremoto-umbria',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(126,3,'/1951786-el-futbolista-argentino-sebastian-pol-le-pego-una-patada-a-un-hincha-en-chile-fue-detenido-puede-recibir-una-dura-condena',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(127,3,'/1951781-el-show-de-nicolas-laprovittola-en-la-victoria-de-los-spurs-gran-jugada-de-doblefalta-y-una-asistencia-de-larga-distancia',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(128,3,'/1950031-jean-paul-gaultier-no-creo-que-haya-diversidad-en-el-mundo-de-la-moda',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(129,3,'/1942161-alberto-manguel-la-sociedad-le-teme-a-la-lectura-porque-lleva-al-cuestionamiento',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(130,3,'/1951362-por-que-un-argentino-votaria-a-hillary',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(131,3,'/1950722-john-malkovich-nunca-crei-mucho-en-nada',NULL,'python',NULL,NULL,'2016-10-31 00:26:55',NULL),(132,3,'/1950009-artistas-por-milo-lockett-una-de-las-artistas-conceptuales-mas-importantes-del-mundo-barbara-kruger',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(133,3,'/1951757-la-nacion-con-un-nuevo-formato-la-edicion-impresa-ahora-sera-un-compacto',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(134,3,'/1951759-profundidad-cercania-y-caracter-la-expansion-de-una-identidad-viva',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(135,3,'/1951758-un-diario-integrado-en-dos-versiones-para-dos-momentos',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(136,3,'/1951760-un-mundo-nuevo-y-un-suplemento-que-cambia-con-el',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(137,3,'/1951790-eeuu-discrimanacion-universidad-boston-tiffany-martinez-latina',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(138,3,'/1951804-mexico-nino-empanadas-acapulco-multimillonario-carlos-slim',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(139,3,'/1951493-bayala-el-publicista-que-llego-a-las-farc',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(140,3,'/1951736-se-profundiza-la-brecha-social-y-economica-en-el-conurbano-bonaerense',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(141,3,'/1951785-altura-de-campeona-cibulkova-dio-la-sorpresa-y-le-gano-la-final-del-masters-a-kerber',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(142,3,'/1951809-tc-werner-gano-en-la-pampa-quedo-primero-en-el-campeonato-y-luchara-por-el-titulo-con-rossi',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(143,3,'/1950944-godoy-cruz-aldosivi-torneo-primera-division-201617-fecha-8',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(144,3,'/1951834-manu-ginobili-celebro-otro-record-en-la-nba-con-una-nueva-victoria-de-san-antonio-spurs',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(145,3,'/1951791-papu-gomez-de-moda-en-italia-hizo-un-gol-uso-una-particular-cinta-de-capitan-y-esta-cerca-de-la-seleccion-local',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(146,3,'/1951817-andy-murray-conquisto-viena-y-esta-cada-vez-mas-cerca-de-destronar-a-novak-djokovic',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(147,3,'/1951812-cilic-en-gran-forma-para-enfrentar-a-la-argentina-en-la-copa-davis-gano-en-viena-y-se-acerca-al-masters',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(148,3,'/1950630-san-pablo-fashion-week',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(149,3,'/1951059-yellowstone-el-parque-que-no-es-puro-humo',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(150,3,'/1951737-se-enciende-la-pantalla-de-ln',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(151,3,'/1951368-los-falsos-facebook-live-desde-el-espacio-que-se-volvieron-virales',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(152,3,'/1736488-salta-la-otra-ruta-del-vino',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(153,3,'/1951389-9-videojuegos-de-terror',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(154,3,'/1950610-productos-de-estacion-3-recetas-con-esparragos-verdes-y-3-recetas-con-frutillas',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(155,3,'/1951801-lucho-aviles-yo-no-puedo-censurar-a-quienes-cazan-en-africa',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(156,3,'/1951796-el-blooper-de-calu-rivero-en-una-produccion-de-fotos',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(157,3,'/1951780-pampita-revoluciono-las-redes-con-una-impactante-foto',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(158,3,'/1951763-premios-martin-fierro-de-la-radio-2016-la-palabra-de-marcelo-longobardi-el-ganador-del-oro',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(159,3,'/1951648-martin-fierro-a-la-radio-2016-la-ceremonia-minuto-a-minuto',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(160,3,'/1951438-imagenes-de-la-memoria-el-arte-como-arma-para-la-paz-en-bogota',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(161,3,'/1951440-dylan-dijo-que-si-puede-ira-a-recibir-el-nobel',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(162,3,'/1951309-despues-de-niunamenos',NULL,'python',NULL,NULL,'2016-10-31 00:26:56',NULL),(163,3,'/1951306-que-es-hoy-vivir-bien-del-desarrollo-economico-al-bienestar',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(164,3,'/1951659-gritos-y-susurros-en-la-calle-el-palacio-y-el-circulo-rojo',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(165,3,'/1951680-salvese-quien-pueda',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(166,3,'/1951621-marcello-en-el-pais-de-los-espejos',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(167,3,'/1951666-limites-al-negocio-del-juego',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(168,3,'/1951660-manga-de-ladrones',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(169,3,'/1951681-taxis-hoteles-y-utopias-en-la-aldea-global',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(170,3,'/1951682-la-solidaridad-y-la-empatia-son-cosas-de-grandes',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(171,3,'/1951667-por-una-educacion-inclusiva',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(172,3,'http://www.lanacion.com.ar/1951802-raul-rizzo-exploto-al-aire-y-nicolas-magaldi-lo-echo-del-programa',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(173,3,'http://www.lanacion.com.ar/1951804-mexico-nino-empanadas-acapulco-multimillonario-carlos-slim',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(174,3,'http://www.lanacion.com.ar/1951731-el-padre-del-chico-que-mato-a-un-ladron-cruzo-a-daniel-scioli',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(175,3,'http://www.lanacion.com.ar/1951765-martin-fierro-de-la-radio-2016-fernando-bravo-le-puso-nombre-y-apellido-a-los-empresarios-oportunistas-de-los-que-hablo-en-su-discurso',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(176,3,'http://www.lanacion.com.ar/1951780-pampita-revoluciono-las-redes-con-una-impactante-foto',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(177,3,'/1951413-se-deberia-crecer-al-3-por-15-anos-y-sin-inflacion',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(178,3,'/1951768-como-seguir-adelanteen-una-crisis-de-reputacion',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(179,3,'/1951612-inundados-y-con-temor-a-mas-lluvias-para-los-productores-de-general-villegas-el-ano-esta-perdido',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(180,3,'/1951360-el-fenomeno-tesla',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(181,3,'/1951412-la-pata-floja-del-plan',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(182,3,'/1951452-las-claves-para-convertirse-en-una-empresa-de-electronica-que-exporta-desde-tierra-del-fuego',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(183,3,'/1951766-que-quieren-los-jovenes-vivir-el-presente-y-tener-su-propio-negocio',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(184,3,'http://www.conexionbrando.com.ar/1950720-el-hincha-joe-fernandez-y-su-amor-por-ferro',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(185,3,'http://www.revistaohlala.com/1951126-sos-una-solucionadora-serial',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(186,3,'http://www.rollingstone.com.ar/1951270-la-union-de-guns-n-roses-y-arnold-schwarzenegger',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(187,3,'http://www.hola.com.ar/1950868-jean-paul-gaultier-juliana-awada-es-inteligente-elegante-graciosa-parece-una-mujer-fuerte',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(188,3,'http://www.revistaohlala.com/1950613-francisco-saraceno-para-ser-partero-tuve-que-desafiar-prejuicios-y-legislaciones-obsoletas',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(189,3,'http://www.lugaresdeviaje.com/nota/outlets-de-new-york',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(190,3,'http://www.larevistadesusana.com/1949250-advanced-style-mujeres-maduras-que-son-iconos-de-estilo',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL),(191,3,'http://www.espacioliving.com/1951280-un-jardin-urbano-con-estilo-norteno',NULL,'python',NULL,NULL,'2016-10-31 00:26:57',NULL);
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `idLog` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `codi` varchar(128) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idLog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulo` (
  `idModulo` int(11) NOT NULL AUTO_INCREMENT,
  `codi` varchar(25) NOT NULL,
  `descripcion` varchar(140) DEFAULT NULL,
  `user` varchar(45) DEFAULT 'user()',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idModulo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (8,'NOTICIAS','Modulo para almacenar y procesar noticias.','python','2015-09-27 05:46:48',NULL);
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias`
--

DROP TABLE IF EXISTS `noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticias` (
  `idNoticia` int(11) NOT NULL AUTO_INCREMENT,
  `idLink` int(11) NOT NULL,
  `seccion` varchar(300) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `titulo` varchar(600) DEFAULT NULL,
  `volanta` varchar(255) DEFAULT NULL,
  `copete` varchar(1000) DEFAULT NULL,
  `autor` varchar(140) DEFAULT NULL,
  `autor_mail` varchar(100) DEFAULT NULL,
  `autor_copete` varchar(2000) DEFAULT NULL,
  `parrafos` text,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT NULL,
  `fecha_analisis_texto` timestamp NULL DEFAULT NULL,
  `user` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idNoticia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias`
--

LOCK TABLES `noticias` WRITE;
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url`
--

DROP TABLE IF EXISTS `url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url` (
  `idUrl` int(11) NOT NULL AUTO_INCREMENT,
  `idModulo` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(440) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `template_content` varchar(100) DEFAULT NULL,
  `template_link_parser` varchar(5000) DEFAULT NULL,
  `filterName` varchar(100) DEFAULT NULL,
  `filterValue` varchar(200) DEFAULT NULL,
  `enabled` bit(1) DEFAULT b'0',
  `user` varchar(45) DEFAULT 'user()',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT NULL,
  `urlcol` varchar(45) DEFAULT NULL,
  `urlcol1` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUrl`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url`
--

LOCK TABLES `url` WRITE;
/*!40000 ALTER TABLE `url` DISABLE KEYS */;
INSERT INTO `url` VALUES (1,8,'Infobae','Infobae es un diario digital argentino de actualidad y economía creado en 2002 por el empresario Daniel Hadad','http://www.infobae.com','div','href=article.a[\"href\"]','class','wrapper','','python','2015-10-03 06:24:59','2015-10-10 05:44:36',NULL,NULL),(2,8,'Clarin','Clarín es un diario matutino argentino publicado en la ciudad de Buenos Aires. Fue fundado por Roberto Noble el martes 28 de agosto de 1945.','http://www.clarin.com','article','href=article.a[\"href\"]','','','','python','2015-10-10 03:51:58','2015-10-10 05:43:48',NULL,NULL),(3,8,'La Nacion','Clarín es un diario matutino argentino publicado en la ciudad de Buenos Aires. Fue fundado por Roberto Noble el martes 28 de agosto de 1945.','http://www.lanacion.com.ar','article','href=article.h2.a[\"href\"]','','','','python','2015-10-10 16:48:49','2015-10-10 16:59:42',NULL,NULL);
/*!40000 ALTER TABLE `url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'data_mining_go'
--

--
-- Dumping routines for database 'data_mining_go'
--
/*!50003 DROP PROCEDURE IF EXISTS `info_LinkNoParsedCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `info_LinkNoParsedCount`(idUrl int)
BEGIN
	SELECT count(1)
	FROM data_mining.link a 
		left join data_mining.noticias b
	on a.idlink=b.idLink   
	where a.idurl=idUrl
	and b.idlink is null
    order by a.link;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `info_LinkNoParsedCountAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `info_LinkNoParsedCountAll`()
BEGIN
 	SELECT c.nombre,count(1)
	FROM data_mining.link a 
		left join data_mining.noticias b
			on a.idlink=b.idLink   
           left join data_mining.url c
			on a.idurl=c.idurl
	where b.idlink is null
		order by a.link;
      /* and a.idlink in (select id from data_mining.log
							 where codi!='READ_FILE'
							 and codi!='OTHER_HOST' )
    */
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `info_LinkNoParsedGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `info_LinkNoParsedGetAll`(idUrl int)
BEGIN
SELECT a.*
	FROM data_mining.link a 
		left join data_mining.noticias b
	on a.idlink=b.idLink   
	where a.idurl=idUrl
	 and b.idlink is null
    and a.idlink in (select id from data_mining.log
						 where codi!='READ_FILE'
						 and codi!='OTHER_HOST' )
 
    order by a.link;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `info_LinkNoParsedList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `info_LinkNoParsedList`()
BEGIN
	SELECT a.*
	FROM data_mining.link a 
		left join data_mining.noticias b
			on a.idlink=b.idLink   
           left join data_mining.url c
			on a.idurl=c.idurl
	where b.idlink is null
       group by c.nombre 
    order by a.link;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `info_ResetLinkToParse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `info_ResetLinkToParse`(pIdLink int)
BEGIN
	

  DELETE FROM data_mining.noticias
  WHERE idlink=pIdLink;
  
  DELETE FROM data_mining.log
  WHERE id=pIdLink;
  
  update data_mining.link
  SET fecha_parseo=null
  WHERE idlink=pIdLink;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `info_ResetProcessTables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `info_ResetProcessTables`()
BEGIN
	DELETE FROM data_mining.log;
    DELETE FROM data_mining.noticias;

	update data_mining.link
	SET fecha_parseo=null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `linkFechaParseoUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkFechaParseoUpdate`(pIdLink int)
BEGIN
	UPDATE link
    SET
	fecha_parseo=now()
 WHERE idLink=pIdLink;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `linkFechaProcesoUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkFechaProcesoUpdate`(pIdLink int,pPath varchar(500))
BEGIN
	UPDATE link
    SET
    file_path=pPath, 
	fecha_proceso=now()
 WHERE idLink=pIdLink;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `linkGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkGetAll`()
BEGIN
SELECT idLink,idUrl,link,user
FROM link;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `linkGetByFechaProceso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkGetByFechaProceso`( pFechaProceso datetime)
BEGIN
SELECT idLink,idUrl,link,user
FROM link
WHERE fecha_proceso= pFechaProceso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `linkGetByIdLink` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkGetByIdLink`(pIdLink int)
BEGIN
	SELECT b.idLink,b.idUrl,CONCAT(c.url, b.link) url,b.fecha_parseo,b.link,b.user  
	FROM data_mining.link b
		inner join data_mining.url c
			on c.idurl=b.idurl
	where b.idlink=pIdLink;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `linkGetByIdUrl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkGetByIdUrl`(pIdUrl int)
BEGIN
SELECT idLink,idUrl,link,user
FROM link
WHERE idUrl=pIdUrl;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `linkGetByLink` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkGetByLink`(pLink varchar(500))
BEGIN
SELECT idLink,idUrl,link,user
FROM link
WHERE link=pLink;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `linkGetToParse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkGetToParse`()
BEGIN
SELECT a.idLink,a.idUrl,b.url,b.nombre,a.link,a.file_path,a.user
FROM data_mining.link a
	INNER JOIN data_mining.url b
		ON a.idUrl=b.idUrl
WHERE a.fecha_parseo IS NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `linkGetToProcess` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkGetToProcess`(pIdUrl int)
BEGIN
SELECT a.idLink,a.idUrl,b.nombre,b.url,a.link,a.user  
FROM link  a 
	INNER JOIN url b
		ON a.idUrl=b.idUrl
WHERE fecha_proceso IS NULL
AND b.idUrl=pIdUrl
limit 7000 ; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `linkInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkInsert`(pIdUrl int,pLink varchar(500),pUser varchar(45))
BEGIN
	INSERT INTO link(idUrl,link,user)
	 VALUES (pIdUrl,pLink,pUser);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `logGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `logGetAll`(pDate datetime)
BEGIN
	if pDate is null then 
		select * 
		FROM data_mining.log
		where fecha_creacion;
    else    
		select * 
		FROM data_mining.log
		where fecha_creacion>=pDate;
    end if;    
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `logGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `logGetById`(pId INT)
BEGIN
	select * 
    FROM data_mining.log
	where id=pId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `logInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `logInsert`(pId int,pCodi varchar(128),pDescripcion varchar(2000),pUser varchar(45))
BEGIN
	INSERT INTO log(id,codi,descripcion,user)
	 VALUES (pId,pCodi,pDescripcion,pUser);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `moduloDeleteById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `moduloDeleteById`(pIdModulo int)
BEGIN
	DELETE 
	FROM Modulo
	WHERE idModulo=pIdModulo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `moduloGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `moduloGetAll`()
BEGIN
SELECT idModulo,codi,descripcion,user
FROM modulo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `moduloGetByCodi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `moduloGetByCodi`(pCodi varchar(45))
BEGIN
SELECT idModulo,codi,descripcion,user
FROM modulo
WHERE codi=pCodi;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `moduloGetByDescripcion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `moduloGetByDescripcion`(pDescripcion varchar(140))
BEGIN
SELECT idModulo,codi,descripcion,user
FROM modulo
WHERE descripcion=pDescripcion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `moduloInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `moduloInsert`(pCodi varchar(45),pDescripcion varchar(140),pUser varchar(45))
BEGIN
	INSERT INTO modulo(codi,descripcion,user)
	 VALUES (pcodi,pdescripcion,puser);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `moduloUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `moduloUpdate`(pIdModulo int,pCodi varchar(45),pDescripcion varchar(140),pUser varchar(45))
BEGIN
	UPDATE modulo
    SET
	idModulo=pIdModulo,
	codi=pCodi,
	descripcion=pDescripcion,
	user=pUser,
	fecha_modificacion=now()
    WHERE idModulo=pIdModulo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `noticiasDeleteById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `noticiasDeleteById`(pIdNoticia int)
BEGIN
	DELETE 
	FROM Noticias
	WHERE idNoticia=pIdNoticia;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `noticiasGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `noticiasGetAll`()
BEGIN
SELECT idNoticia,idLink,seccion,fecha,titulo,volanta,copete,autor,autor_mail,autor_copete,parrafos,fecha_analisis_texto
FROM noticias;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `noticiasGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `noticiasGetById`(pIdNoticia INT)
BEGIN
	SELECT a.*,b.link 
	FROM data_mining.noticias a
		inner join data_mining.link b
	on a.idlink=b.idLink    
	where idNoticia=pIdNoticia;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `noticiasGetByIdDiario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `noticiasGetByIdDiario`(pIdDiario int)
BEGIN
SELECT idNoticia,idDiario,idSeccion,fecha,titulo,volanta,copete,autor,autor_mail,autor_copete,parrafos
FROM noticias
WHERE idDiario=pIdDiario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `noticiasGetByIdLink` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `noticiasGetByIdLink`(pIdLink INT)
BEGIN
	SELECT a.* 
	FROM data_mining.noticias a
		inner join data_mining.link b
	on a.idlink=b.idLink    
	where b.idLink    =pIdLink;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `noticiasGetByIdSeccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `noticiasGetByIdSeccion`(pIdSeccion int)
BEGIN
SELECT idNoticia,idDiario,idSeccion,fecha,titulo,volanta,copete,autor,autor_mail,autor_copete,parrafos
FROM noticias
WHERE idSeccion=pIdSeccion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `noticiasGetTo_analyze_text` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `noticiasGetTo_analyze_text`()
BEGIN
	select a.idNoticia,a.idLink,c.nombre diario,a.seccion,a.fecha,a.titulo,a.volanta,a.copete,a.autor,a.autor_mail,a.autor_copete,a.parrafos 
	from data_mining.noticias a 
		inner join data_mining.link b
			on a.idlink=b.idlink
		   inner join data_mining.url c
			on c.idurl=b.idurl
	WHERE fecha_analisis_texto is null ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `noticiasInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `noticiasInsert`(pIdLink int(11),pSeccion varchar(300),pFecha datetime,pTitulo varchar(600),pVolanta varchar(255),pCopete varchar(1000),pAutor varchar(140),pAutor_mail varchar(100),pAutor_copete varchar(2000),pParrafos TEXT,pUser varchar(140))
BEGIN
	INSERT INTO data_mining.noticias(idLink,seccion, fecha, titulo, volanta,copete, autor, autor_mail, autor_copete, parrafos,user)
        VALUES (pIdLink,pSeccion,pFecha,pTitulo,pVolanta,pCopete,pAutor,pAutor_mail,pAutor_copete,pParrafos,pUser);
                
	UPDATE link
		SET fecha_parseo=now()
	WHERE idLink=pIdLink;
                
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `noticiasMarkTextAnalyzed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `noticiasMarkTextAnalyzed`(pIdNoticia int(11))
BEGIN
	UPDATE noticias
	SET fecha_analisis_texto=now()
	WHERE idNoticia=pIdNoticia;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `noticis_reprocess_StopWordsnoticias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `noticis_reprocess_StopWordsnoticias`()
BEGIN
	UPDATE data_mining.noticias
	SET fecha_analisis_texto=null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `urlEnabled` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `urlEnabled`(pIdUrl int,pValue bit)
BEGIN
UPDATE url
    SET
	enabled=pValue,
	fecha_modificacion=now()
WHERE IdUrl=pIdUrl;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `urlGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `urlGetAll`()
BEGIN
SELECT idUrl,idModulo,nombre,descripcion,url,template_content, template_link_parser,filterName,filterValue,user
FROM url;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `urlGetAllEnabled` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `urlGetAllEnabled`()
BEGIN
SELECT idUrl,idModulo,nombre,descripcion,url,template_content,template_link_parser,filterName,filterValue,enabled,user
FROM url
WHERE enabled=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `urlGetByNombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `urlGetByNombre`(pNombre varchar(100))
BEGIN
SELECT idUrl,idModulo,nombre,descripcion,url,template_link_parser,enabled,user
FROM url
WHERE nombre=pNombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `urlInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `urlInsert`(pIdModulo int,pNombre varchar(100),pDescripcion varchar(140),pUrl varchar(500),pTemplate_link_parser varchar(5000), pUser varchar(45))
BEGIN
	INSERT INTO url(idModulo,nombre,descripcion,url,template_link_parser,user)
	 VALUES (pIdModulo,pNombre,pDescripcion,pUrl,pTemplate_link_parser,pUser);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usersGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usersGetAll`()
BEGIN
    select id,username,email,password,enable,created_by,modified_by,creation_date,modification_date
    from stopwords.users;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-31 21:38:47
