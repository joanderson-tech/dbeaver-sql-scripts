SELECT * FROM pg_stat_activity where datname = 'portalsigeduc_desenv_rn_macau_comum';




SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE pid IN(18021
,18024);


ALTER DATABASE portalsigeduc_desenv_pb_duasestradas RENAME TO portalsigeduc_desenv_rn_macau;


18991,18993,18994,20571,20572


ALTER DATABASE portalsigeduc_desenv_pb_duasestradas_comum RENAME TO portalsigeduc_desenv_rn_macau_comum;

ALTER DATABASE portalsigeduc_desenv_pb_duasestradas RENAME TO portalsigeduc_desenv_rn_macau;


ALTER DATABASE portalsigeduc_desenv_pb_duasestradas RENAME TO portalsigeduc_desenv_rn_macau;
