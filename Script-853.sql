BEGIN;
rollback;
CREATE SCHEMA quartz AUTHORIZATION sigeduc;
CREATE TABLE quartz.job_agendado (
	id_job_agendado int4 NOT NULL,
	nome varchar(255) NOT NULL,
	id_instituicao int4 NOT NULL,
	ativo boolean NOT NULL,
	CONSTRAINT tarefa_agendada_pkey PRIMARY KEY (id_job_agendado),
	CONSTRAINT id_instituicao FOREIGN KEY (id_instituicao) REFERENCES public.instituicao(id_instituicao)
);
CREATE TABLE quartz.job_execucao (
    job_name varchar(500) NULL,
    "exception" text NULL,
    dados_execucao text NULL,
    "time" int8 DEFAULT 0 NOT NULL
);
CREATE TABLE quartz.qrtz_calendars (
    sched_name varchar(120) NOT NULL,
    calendar_name varchar(200) NOT NULL,
    calendar bytea NOT NULL,
    CONSTRAINT qrtz_calendars_pkey PRIMARY KEY (sched_name, calendar_name)
);
CREATE TABLE quartz.qrtz_fired_triggers (
    sched_name varchar(120) NOT NULL,
    entry_id varchar(95) NOT NULL,
    trigger_name varchar(200) NOT NULL,
    trigger_group varchar(200) NOT NULL,
    instance_name varchar(200) NOT NULL,
    fired_time int8 NOT NULL,
    sched_time int8 NOT NULL,
    priority int4 NOT NULL,
    state varchar(16) NOT NULL,
    job_name varchar(200) NULL,
    job_group varchar(200) NULL,
    is_nonconcurrent bool NULL,
    requests_recovery bool NULL,
    CONSTRAINT qrtz_fired_triggers_pkey PRIMARY KEY (sched_name, entry_id)
);
CREATE INDEX idx_qrtz_ft_inst_job_req_rcvry ON quartz.qrtz_fired_triggers USING btree (sched_name, instance_name, requests_recovery);
CREATE INDEX idx_qrtz_ft_j_g ON quartz.qrtz_fired_triggers USING btree (sched_name, job_name, job_group);
CREATE INDEX idx_qrtz_ft_jg ON quartz.qrtz_fired_triggers USING btree (sched_name, job_group);
CREATE INDEX idx_qrtz_ft_t_g ON quartz.qrtz_fired_triggers USING btree (sched_name, trigger_name, trigger_group);
CREATE INDEX idx_qrtz_ft_tg ON quartz.qrtz_fired_triggers USING btree (sched_name, trigger_group);
CREATE INDEX idx_qrtz_ft_trig_inst_name ON quartz.qrtz_fired_triggers USING btree (sched_name, instance_name);
CREATE TABLE quartz.qrtz_job_details (
    sched_name varchar(120) NOT NULL,
    job_name varchar(200) NOT NULL,
    job_group varchar(200) NOT NULL,
    description varchar(250) NULL,
    job_class_name varchar(250) NOT NULL,
    is_durable bool NOT NULL,
    is_nonconcurrent bool NOT NULL,
    is_update_data bool NOT NULL,
    requests_recovery bool NOT NULL,
    job_data bytea NULL,
    CONSTRAINT qrtz_job_details_pkey PRIMARY KEY (sched_name, job_name, job_group)
);
CREATE INDEX idx_qrtz_j_grp ON quartz.qrtz_job_details USING btree (sched_name, job_group);
CREATE INDEX idx_qrtz_j_req_recovery ON quartz.qrtz_job_details USING btree (sched_name, requests_recovery);
CREATE TABLE quartz.qrtz_locks (
    sched_name varchar(120) NOT NULL,
    lock_name varchar(40) NOT NULL,
    CONSTRAINT qrtz_locks_pkey PRIMARY KEY (sched_name, lock_name)
);
CREATE TABLE quartz.qrtz_paused_trigger_grps (
    sched_name varchar(120) NOT NULL,
    trigger_group varchar(200) NOT NULL,
    CONSTRAINT qrtz_paused_trigger_grps_pkey PRIMARY KEY (sched_name, trigger_group)
);
CREATE TABLE quartz.qrtz_scheduler_state (
    sched_name varchar(120) NOT NULL,
    instance_name varchar(200) NOT NULL,
    last_checkin_time int8 NOT NULL,
    checkin_interval int8 NOT NULL,
    CONSTRAINT qrtz_scheduler_state_pkey PRIMARY KEY (sched_name, instance_name)
);
CREATE TABLE quartz.qrtz_triggers (
    sched_name varchar(120) NOT NULL,
    trigger_name varchar(200) NOT NULL,
    trigger_group varchar(200) NOT NULL,
    job_name varchar(200) NOT NULL,
    job_group varchar(200) NOT NULL,
    description varchar(250) NULL,
    next_fire_time int8 NULL,
    prev_fire_time int8 NULL,
    priority int4 NULL,
    trigger_state varchar(16) NOT NULL,
    trigger_type varchar(8) NOT NULL,
    start_time int8 NOT NULL,
    end_time int8 NULL,
    calendar_name varchar(200) NULL,
    misfire_instr int2 NULL,
    job_data bytea NULL,
    CONSTRAINT qrtz_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group),
    CONSTRAINT qrtz_triggers_sched_name_fkey FOREIGN KEY (sched_name,job_name,job_group) REFERENCES quartz.qrtz_job_details(sched_name,job_name,job_group)
);
CREATE INDEX idx_qrtz_t_c ON quartz.qrtz_triggers USING btree (sched_name, calendar_name);
CREATE INDEX idx_qrtz_t_g ON quartz.qrtz_triggers USING btree (sched_name, trigger_group);
CREATE INDEX idx_qrtz_t_j ON quartz.qrtz_triggers USING btree (sched_name, job_name, job_group);
CREATE INDEX idx_qrtz_t_jg ON quartz.qrtz_triggers USING btree (sched_name, job_group);
CREATE INDEX idx_qrtz_t_n_g_state ON quartz.qrtz_triggers USING btree (sched_name, trigger_group, trigger_state);
CREATE INDEX idx_qrtz_t_n_state ON quartz.qrtz_triggers USING btree (sched_name, trigger_name, trigger_group, trigger_state);
CREATE INDEX idx_qrtz_t_next_fire_time ON quartz.qrtz_triggers USING btree (sched_name, next_fire_time);
CREATE INDEX idx_qrtz_t_nft_misfire ON quartz.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time);
CREATE INDEX idx_qrtz_t_nft_st ON quartz.qrtz_triggers USING btree (sched_name, trigger_state, next_fire_time);
CREATE INDEX idx_qrtz_t_nft_st_misfire ON quartz.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_state);
CREATE INDEX idx_qrtz_t_nft_st_misfire_grp ON quartz.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_group, trigger_state);
CREATE INDEX idx_qrtz_t_state ON quartz.qrtz_triggers USING btree (sched_name, trigger_state);
CREATE TABLE quartz.qrtz_blob_triggers (
    sched_name varchar(120) NOT NULL,
    trigger_name varchar(200) NOT NULL,
    trigger_group varchar(200) NOT NULL,
    blob_data bytea NULL,
    CONSTRAINT qrtz_blob_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group),
    CONSTRAINT qrtz_blob_triggers_sched_name_fkey FOREIGN KEY (sched_name,trigger_name,trigger_group) REFERENCES quartz.qrtz_triggers(sched_name,trigger_name,trigger_group)
);
CREATE TABLE quartz.qrtz_cron_triggers (
    sched_name varchar(120) NOT NULL,
    trigger_name varchar(200) NOT NULL,
    trigger_group varchar(200) NOT NULL,
    cron_expression varchar(120) NOT NULL,
    time_zone_id varchar(80) NULL,
    CONSTRAINT qrtz_cron_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group),
    CONSTRAINT qrtz_cron_triggers_sched_name_fkey FOREIGN KEY (sched_name,trigger_name,trigger_group) REFERENCES quartz.qrtz_triggers(sched_name,trigger_name,trigger_group)
);
CREATE TABLE quartz.qrtz_simple_triggers (
    sched_name varchar(120) NOT NULL,
    trigger_name varchar(200) NOT NULL,
    trigger_group varchar(200) NOT NULL,
    repeat_count int8 NOT NULL,
    repeat_interval int8 NOT NULL,
    times_triggered int8 NOT NULL,
    CONSTRAINT qrtz_simple_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group),
    CONSTRAINT qrtz_simple_triggers_sched_name_fkey FOREIGN KEY (sched_name,trigger_name,trigger_group) REFERENCES quartz.qrtz_triggers(sched_name,trigger_name,trigger_group)
);
CREATE TABLE quartz.qrtz_simprop_triggers (
    sched_name varchar(120) NOT NULL,
    trigger_name varchar(200) NOT NULL,
    trigger_group varchar(200) NOT NULL,
    str_prop_1 varchar(512) NULL,
    str_prop_2 varchar(512) NULL,
    str_prop_3 varchar(512) NULL,
    int_prop_1 int4 NULL,
    int_prop_2 int4 NULL,
    long_prop_1 int8 NULL,
    long_prop_2 int8 NULL,
    dec_prop_1 numeric(13, 4) NULL,
    dec_prop_2 numeric(13, 4) NULL,
    bool_prop_1 bool NULL,
    bool_prop_2 bool NULL,
    CONSTRAINT qrtz_simprop_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group),
    CONSTRAINT qrtz_simprop_triggers_sched_name_fkey FOREIGN KEY (sched_name,trigger_name,trigger_group) REFERENCES quartz.qrtz_triggers(sched_name,trigger_name,trigger_group)
);
CREATE SEQUENCE quartz.job_agendado_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
COMMIT;