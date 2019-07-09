SELECT * FROM hhrr_profile_matcher.hr_app_perfil;
SELECT * FROM hhrr_profile_matcher.hr_app_modulo;
SELECT * FROM hr_app_perfil_modulo;

/*
Perfil 
	administrador  1
    
Modulo 
	21	Perfil	

*/

INSERT INTO `hhrr_profile_matcher`.`hr_app_perfil_modulo` (`id_perfil`, `id_modulo`, `creado_por`, `fecha_creacion`) VALUES ('1', '21', 'test', '2018-06-01 00:00:00');
INSERT INTO `hhrr_profile_matcher`.`hr_app_perfil_modulo` (`id_perfil`, `id_modulo`, `creado_por`, `fecha_creacion`) VALUES ('1', '19', 'test', '2018-06-01 00:00:00');
INSERT INTO `hhrr_profile_matcher`.`hr_app_perfil_modulo` (`id_perfil`, `id_modulo`, `creado_por`, `fecha_creacion`) VALUES ('1', '16', 'test', '2018-06-01 00:00:00');
INSERT INTO `hhrr_profile_matcher`.`hr_app_perfil_modulo` (`id_perfil`, `id_modulo`, `creado_por`, `fecha_creacion`) VALUES ('1', '22', 'test', '2018-06-01 00:00:00');


/*
delete FROM hhrr_profile_matcher.hr_app_perfil
where perfil='test88';

delete FROM hhrr_profile_matcher.hr_app_modulo
where modulo='Test';
*/