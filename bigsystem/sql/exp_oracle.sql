prompt PL/SQL Developer import file
prompt Created on 2018年2月28日 by Administrator
set feedback off
set define off
prompt Creating SOS_SYS_LOG...
create table SOS_SYS_LOG
(
  login_id  VARCHAR2(50),
  login_ip  VARCHAR2(100),
  login_mac VARCHAR2(100),
  op_num    VARCHAR2(50),
  op_func   VARCHAR2(1000),
  op_date   DATE,
  op_note   VARCHAR2(1000)
)
tablespace DATAIM
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SOS_SYS_MENU_INFO...
create table SOS_SYS_MENU_INFO
(
  id        VARCHAR2(10),
  menuname  VARCHAR2(60),
  menudesc  VARCHAR2(200),
  zt        VARCHAR2(1),
  menutype  VARCHAR2(1),
  url       VARCHAR2(60),
  target    VARCHAR2(20),
  parentid  VARCHAR2(10),
  creator   VARCHAR2(10),
  creatdate DATE,
  nm        VARCHAR2(36)
)
tablespace DATAIM
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SOS_SYS_ROLE_INFO...
create table SOS_SYS_ROLE_INFO
(
  id         VARCHAR2(10),
  rolename   VARCHAR2(40),
  roledesc   VARCHAR2(100),
  zt         VARCHAR2(1),
  creator    VARCHAR2(10),
  createdate DATE,
  updater    VARCHAR2(6),
  updatedate DATE
)
tablespace DATAIM
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SOS_SYS_ROLE_MENU...
create table SOS_SYS_ROLE_MENU
(
  id         VARCHAR2(10),
  menuid     VARCHAR2(10) not null,
  roleid     VARCHAR2(10) not null,
  descr      VARCHAR2(100),
  zt         VARCHAR2(1),
  creator    VARCHAR2(10),
  createdate DATE,
  updater    VARCHAR2(6),
  updatedate DATE
)
tablespace DATAIM
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SOS_SYS_USER_ROLE...
create table SOS_SYS_USER_ROLE
(
  id        VARCHAR2(6),
  userid    VARCHAR2(50),
  roleid    VARCHAR2(50),
  descr     VARCHAR2(50),
  creator   VARCHAR2(50),
  creatdate DATE,
  zt        CHAR(1)
)
tablespace DATAIM
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SOS_USER...
create table SOS_USER
(
  id        VARCHAR2(10),
  loginid   VARCHAR2(20),
  password  VARCHAR2(20),
  usertype  VARCHAR2(2),
  username  VARCHAR2(30),
  adminid   VARCHAR2(20),
  contactno VARCHAR2(50),
  cityid    VARCHAR2(8),
  company   VARCHAR2(50),
  remark    VARCHAR2(500),
  adminflag CHAR(1),
  status    CHAR(1)
)
tablespace DATAIM
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table SOS_USER
  is '工号表';
comment on column SOS_USER.id
  is '编号 SEQ_SOS_USER';
comment on column SOS_USER.loginid
  is '工号';
comment on column SOS_USER.password
  is '密码';
comment on column SOS_USER.usertype
  is '用户类别 1-客服，2-营业，3-机房';
comment on column SOS_USER.username
  is '用户名称';
comment on column SOS_USER.adminid
  is '责任人';
comment on column SOS_USER.contactno
  is '联系方式';
comment on column SOS_USER.cityid
  is '地市编码';
comment on column SOS_USER.company
  is '公司';
comment on column SOS_USER.remark
  is '备注';
comment on column SOS_USER.adminflag
  is '0:管理员 1:普通工号';
comment on column SOS_USER.status
  is '0:正常 1:失效';

prompt Disabling triggers for SOS_SYS_LOG...
alter table SOS_SYS_LOG disable all triggers;
prompt Disabling triggers for SOS_SYS_MENU_INFO...
alter table SOS_SYS_MENU_INFO disable all triggers;
prompt Disabling triggers for SOS_SYS_ROLE_INFO...
alter table SOS_SYS_ROLE_INFO disable all triggers;
prompt Disabling triggers for SOS_SYS_ROLE_MENU...
alter table SOS_SYS_ROLE_MENU disable all triggers;
prompt Disabling triggers for SOS_SYS_USER_ROLE...
alter table SOS_SYS_USER_ROLE disable all triggers;
prompt Disabling triggers for SOS_USER...
alter table SOS_USER disable all triggers;
prompt Deleting SOS_USER...
delete from SOS_USER;
commit;
prompt Deleting SOS_SYS_USER_ROLE...
delete from SOS_SYS_USER_ROLE;
commit;
prompt Deleting SOS_SYS_ROLE_MENU...
delete from SOS_SYS_ROLE_MENU;
commit;
prompt Deleting SOS_SYS_ROLE_INFO...
delete from SOS_SYS_ROLE_INFO;
commit;
prompt Deleting SOS_SYS_MENU_INFO...
delete from SOS_SYS_MENU_INFO;
commit;
prompt Deleting SOS_SYS_LOG...
delete from SOS_SYS_LOG;
commit;
prompt Loading SOS_SYS_LOG...
insert into SOS_SYS_LOG (login_id, login_ip, login_mac, op_num, op_func, op_date, op_note)
values ('admin', '134.33.107.119', '00:0D:88:48:36:0B', null, 'admin登录成功', to_date('13-09-2016 14:59:02', 'dd-mm-yyyy hh24:mi:ss'), null);
commit;
prompt 59957 records loaded
prompt Loading SOS_SYS_MENU_INFO...
insert into SOS_SYS_MENU_INFO (id, menuname, menudesc, zt, menutype, url, target, parentid, creator, creatdate, nm)
values ('000001', '权限管理', '权限管理', '1', '0', '0', null, '000000', '000001', null, 'z01');
insert into SOS_SYS_MENU_INFO (id, menuname, menudesc, zt, menutype, url, target, parentid, creator, creatdate, nm)
values ('000000', '系统菜单', '系统菜单', '1', '0', '0', null, null, '000001', null, 'z');
insert into SOS_SYS_MENU_INFO (id, menuname, menudesc, zt, menutype, url, target, parentid, creator, creatdate, nm)
values ('000002', '工号管理', '工号管理', '1', '1', '../../user/userManage.do', 'main', '000001', '000001', null, 'z0101');
insert into SOS_SYS_MENU_INFO (id, menuname, menudesc, zt, menutype, url, target, parentid, creator, creatdate, nm)
values ('000003', '角色管理', '角色管理', '1', '1', '../sm/role/roleQuery.do', 'main', '000001', '000001', null, 'z0102');
insert into SOS_SYS_MENU_INFO (id, menuname, menudesc, zt, menutype, url, target, parentid, creator, creatdate, nm)
values ('000004', '菜单管理', '菜单管理', '1', '1', '../sm/menu/menuQuery.do', 'main', '000001', '000001', null, 'z0103');
insert into SOS_SYS_MENU_INFO (id, menuname, menudesc, zt, menutype, url, target, parentid, creator, creatdate, nm)
values ('000005', '修改密码', '修改密码', '1', '1', '../web/user/modifyPassWd.jsp', 'main', '000001', '000001', null, 'z0104');
insert into SOS_SYS_MENU_INFO (id, menuname, menudesc, zt, menutype, url, target, parentid, creator, creatdate, nm)
values ('000015', '查询统计', '查询统计', '1', '0', '0', null, '000000', 'admin', to_date('09-11-2016 15:26:46', 'dd-mm-yyyy hh24:mi:ss'), 'z04');
insert into SOS_SYS_MENU_INFO (id, menuname, menudesc, zt, menutype, url, target, parentid, creator, creatdate, nm)
values ('000016', '操作日志', '操作日志', '1', '1', '../sm/cxtj/czrz/czrz.jsp', null, '000015', 'admin', to_date('09-11-2016 15:27:01', 'dd-mm-yyyy hh24:mi:ss'), 'z0401');
insert into SOS_SYS_MENU_INFO (id, menuname, menudesc, zt, menutype, url, target, parentid, creator, creatdate, nm)
values ('000017', '个性查询', '个性查询', '1', '1', '../sm/cxtj/gxcx/gxcx.jsp', null, '000015', 'admin', to_date('09-11-2016 15:27:21', 'dd-mm-yyyy hh24:mi:ss'), 'z0402');
commit;
prompt 18 records loaded
prompt Loading SOS_SYS_ROLE_INFO...
insert into SOS_SYS_ROLE_INFO (id, rolename, roledesc, zt, creator, createdate, updater, updatedate)
values ('000002', '用户', 'USER账号', '1', 'admin', to_date('12-06-2017 18:22:23', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_INFO (id, rolename, roledesc, zt, creator, createdate, updater, updatedate)
values ('000003', '管理员', 'OPR', '1', 'admin', to_date('13-06-2017 10:53:01', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_INFO (id, rolename, roledesc, zt, creator, createdate, updater, updatedate)
values ('000001', '系统管理员', '系统管理员', '1', '000001', null, null, null);
commit;
prompt 3 records loaded
prompt Loading SOS_SYS_ROLE_MENU...
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000041', '000005', '000002', null, '0', 'admin', to_date('12-06-2017 18:25:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000042', '000006', '000002', null, '0', 'admin', to_date('12-06-2017 18:25:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000043', '000008', '000002', null, '0', 'admin', to_date('12-06-2017 18:25:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000044', '000007', '000002', null, '0', 'admin', to_date('12-06-2017 18:25:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000045', '000009', '000002', null, '0', 'admin', to_date('12-06-2017 18:25:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000046', '000010', '000002', null, '0', 'admin', to_date('12-06-2017 18:25:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000047', '000011', '000002', null, '0', 'admin', to_date('12-06-2017 18:25:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000048', '000012', '000002', null, '0', 'admin', to_date('12-06-2017 18:25:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000049', '000013', '000002', null, '0', 'admin', to_date('12-06-2017 18:25:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000050', '000014', '000002', null, '0', 'admin', to_date('12-06-2017 18:25:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000051', '000015', '000002', null, '0', 'admin', to_date('12-06-2017 18:25:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000052', '000016', '000002', null, '0', 'admin', to_date('12-06-2017 18:25:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000053', '000017', '000002', null, '0', 'admin', to_date('12-06-2017 18:25:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000054', '000005', '000002', null, '0', 'admin', to_date('12-06-2017 18:26:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000055', '000006', '000002', null, '0', 'admin', to_date('12-06-2017 18:26:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000056', '000008', '000002', null, '0', 'admin', to_date('12-06-2017 18:26:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000057', '000007', '000002', null, '0', 'admin', to_date('12-06-2017 18:26:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000058', '000009', '000002', null, '0', 'admin', to_date('12-06-2017 18:26:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000059', '000010', '000002', null, '0', 'admin', to_date('12-06-2017 18:26:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000060', '000011', '000002', null, '0', 'admin', to_date('12-06-2017 18:26:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000061', '000012', '000002', null, '0', 'admin', to_date('12-06-2017 18:26:23', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000062', '000013', '000002', null, '0', 'admin', to_date('12-06-2017 18:26:23', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000063', '000014', '000002', null, '0', 'admin', to_date('12-06-2017 18:26:23', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000064', '000015', '000002', null, '0', 'admin', to_date('12-06-2017 18:26:23', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000065', '000016', '000002', null, '0', 'admin', to_date('12-06-2017 18:26:23', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000066', '000017', '000002', null, '0', 'admin', to_date('12-06-2017 18:26:23', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000188', '000007', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000212', '000001', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:24', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000213', '000000', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:24', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000214', '000005', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:24', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000215', '000006', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:25', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000216', '000008', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:25', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000217', '000007', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:25', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000218', '000009', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:25', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000219', '000010', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:25', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000220', '000011', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:25', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000221', '000012', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:25', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000222', '000013', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:25', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000223', '000014', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:25', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000224', '000015', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:25', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000225', '000016', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:25', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000226', '000017', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:25', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000157', '000001', '000002', null, '1', 'admin', to_date('13-06-2017 10:51:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000158', '000000', '000002', null, '1', 'admin', to_date('13-06-2017 10:51:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000159', '000005', '000002', null, '1', 'admin', to_date('13-06-2017 10:51:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000160', '000006', '000002', null, '1', 'admin', to_date('13-06-2017 10:51:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000161', '000008', '000002', null, '1', 'admin', to_date('13-06-2017 10:51:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000162', '000007', '000002', null, '1', 'admin', to_date('13-06-2017 10:51:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000163', '000009', '000002', null, '1', 'admin', to_date('13-06-2017 10:51:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000164', '000010', '000002', null, '1', 'admin', to_date('13-06-2017 10:51:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000165', '000011', '000002', null, '1', 'admin', to_date('13-06-2017 10:51:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000166', '000012', '000002', null, '1', 'admin', to_date('13-06-2017 10:51:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000167', '000013', '000002', null, '1', 'admin', to_date('13-06-2017 10:51:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000168', '000014', '000002', null, '1', 'admin', to_date('13-06-2017 10:51:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000169', '000015', '000002', null, '1', 'admin', to_date('13-06-2017 10:51:32', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000170', '000016', '000002', null, '1', 'admin', to_date('13-06-2017 10:51:32', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000171', '000017', '000002', null, '1', 'admin', to_date('13-06-2017 10:51:32', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000174', '000008', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:06', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000175', '000007', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:06', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000176', '000009', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:06', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000177', '000010', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:06', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000178', '000011', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:06', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000179', '000012', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:06', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000180', '000013', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:06', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000181', '000014', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:06', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000182', '000015', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:06', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000183', '000016', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:07', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000184', '000017', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:07', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000185', '000005', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000186', '000006', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000187', '000008', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000189', '000009', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000190', '000010', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000191', '000011', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000192', '000012', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000193', '000013', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000194', '000014', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000195', '000015', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000196', '000016', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:32', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000197', '000017', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:32', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000198', '000000', '000003', null, '0', 'admin', to_date('13-06-2017 10:54:17', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000199', '000005', '000003', null, '0', 'admin', to_date('13-06-2017 10:54:17', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000200', '000006', '000003', null, '0', 'admin', to_date('13-06-2017 10:54:17', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000201', '000008', '000003', null, '0', 'admin', to_date('13-06-2017 10:54:17', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000202', '000007', '000003', null, '0', 'admin', to_date('13-06-2017 10:54:17', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000203', '000009', '000003', null, '0', 'admin', to_date('13-06-2017 10:54:17', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000204', '000010', '000003', null, '0', 'admin', to_date('13-06-2017 10:54:17', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000205', '000011', '000003', null, '0', 'admin', to_date('13-06-2017 10:54:18', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000206', '000012', '000003', null, '0', 'admin', to_date('13-06-2017 10:54:18', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000207', '000013', '000003', null, '0', 'admin', to_date('13-06-2017 10:54:18', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000208', '000014', '000003', null, '0', 'admin', to_date('13-06-2017 10:54:18', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000209', '000015', '000003', null, '0', 'admin', to_date('13-06-2017 10:54:18', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000210', '000016', '000003', null, '0', 'admin', to_date('13-06-2017 10:54:18', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000211', '000017', '000003', null, '0', 'admin', to_date('13-06-2017 10:54:18', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000067', '000001', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000068', '000002', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000069', '000003', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000070', '000004', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000071', '000005', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000072', '000006', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
commit;
prompt 100 records committed...
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000073', '000008', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000074', '000007', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000075', '000009', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000076', '000010', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000077', '000011', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000078', '000012', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000079', '000013', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000080', '000014', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000081', '000015', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:22', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000082', '000016', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:23', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000083', '000017', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:23', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000084', '000005', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:27', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000085', '000006', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:27', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000086', '000008', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:27', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000087', '000007', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:27', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000088', '000009', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:27', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000089', '000010', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:28', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000090', '000011', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:28', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000091', '000012', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:28', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000092', '000013', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:28', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000093', '000014', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:28', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000094', '000015', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:28', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000095', '000016', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:28', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000096', '000017', '000002', null, '0', 'admin', to_date('12-06-2017 18:29:28', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000112', '000000', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:35', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000113', '000005', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:35', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000114', '000006', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:35', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000115', '000008', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:35', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000116', '000007', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:35', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000117', '000009', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:35', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000118', '000010', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:35', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000119', '000011', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:36', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000120', '000012', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:36', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000121', '000013', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:36', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000122', '000014', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:36', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000123', '000015', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:36', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000124', '000016', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:36', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000125', '000017', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:36', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000126', '000001', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000127', '000000', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000128', '000005', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000129', '000006', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000130', '000008', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000131', '000007', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000132', '000009', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000133', '000010', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000134', '000011', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000135', '000012', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000136', '000013', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000137', '000014', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:44', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000138', '000015', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:44', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000139', '000016', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:44', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000140', '000017', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:44', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000141', '000001', '000002', null, '0', 'admin', to_date('13-06-2017 08:34:08', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000142', '000000', '000002', null, '0', 'admin', to_date('13-06-2017 08:34:08', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000143', '000004', '000002', null, '0', 'admin', to_date('13-06-2017 08:34:08', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000144', '000005', '000002', null, '0', 'admin', to_date('13-06-2017 08:34:08', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000145', '000006', '000002', null, '0', 'admin', to_date('13-06-2017 08:34:08', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000146', '000008', '000002', null, '0', 'admin', to_date('13-06-2017 08:34:08', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000147', '000007', '000002', null, '0', 'admin', to_date('13-06-2017 08:34:08', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000148', '000009', '000002', null, '0', 'admin', to_date('13-06-2017 08:34:08', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000149', '000010', '000002', null, '0', 'admin', to_date('13-06-2017 08:34:09', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000150', '000011', '000002', null, '0', 'admin', to_date('13-06-2017 08:34:09', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000151', '000012', '000002', null, '0', 'admin', to_date('13-06-2017 08:34:09', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000152', '000013', '000002', null, '0', 'admin', to_date('13-06-2017 08:34:09', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000153', '000014', '000002', null, '0', 'admin', to_date('13-06-2017 08:34:09', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000154', '000015', '000002', null, '0', 'admin', to_date('13-06-2017 08:34:09', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000155', '000016', '000002', null, '0', 'admin', to_date('13-06-2017 08:34:09', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000156', '000017', '000002', null, '0', 'admin', to_date('13-06-2017 08:34:09', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000172', '000005', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:06', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000173', '000006', '000003', null, '0', 'admin', to_date('13-06-2017 10:53:06', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000227', '000005', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000228', '000006', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000229', '000008', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000230', '000007', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000231', '000009', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000232', '000010', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000233', '000011', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000234', '000012', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000235', '000013', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000236', '000014', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000237', '000015', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000238', '000016', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000239', '000017', '000003', null, '0', 'admin', to_date('13-06-2017 10:55:47', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000240', '000001', '000003', null, '1', 'admin', to_date('13-06-2017 10:56:11', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000241', '000000', '000003', null, '1', 'admin', to_date('13-06-2017 10:56:11', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000242', '000005', '000003', null, '1', 'admin', to_date('13-06-2017 10:56:11', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000243', '000006', '000003', null, '1', 'admin', to_date('13-06-2017 10:56:11', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000244', '000008', '000003', null, '1', 'admin', to_date('13-06-2017 10:56:11', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000245', '000007', '000003', null, '1', 'admin', to_date('13-06-2017 10:56:11', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000246', '000009', '000003', null, '1', 'admin', to_date('13-06-2017 10:56:11', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000247', '000010', '000003', null, '1', 'admin', to_date('13-06-2017 10:56:11', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000248', '000011', '000003', null, '1', 'admin', to_date('13-06-2017 10:56:11', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000249', '000012', '000003', null, '1', 'admin', to_date('13-06-2017 10:56:11', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000250', '000013', '000003', null, '1', 'admin', to_date('13-06-2017 10:56:12', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000251', '000014', '000003', null, '1', 'admin', to_date('13-06-2017 10:56:12', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000252', '000015', '000003', null, '1', 'admin', to_date('13-06-2017 10:56:12', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000253', '000016', '000003', null, '1', 'admin', to_date('13-06-2017 10:56:12', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000254', '000017', '000003', null, '1', 'admin', to_date('13-06-2017 10:56:12', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000010', '000001', '000001', null, '1', 'admin', to_date('09-11-2016 15:29:58', 'dd-mm-yyyy hh24:mi:ss'), null, null);
commit;
prompt 200 records committed...
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000011', '000000', '000001', null, '1', 'admin', to_date('09-11-2016 15:29:58', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000012', '000002', '000001', null, '1', 'admin', to_date('09-11-2016 15:29:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000013', '000003', '000001', null, '1', 'admin', to_date('09-11-2016 15:29:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000014', '000004', '000001', null, '1', 'admin', to_date('09-11-2016 15:29:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000015', '000005', '000001', null, '1', 'admin', to_date('09-11-2016 15:29:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000016', '000006', '000001', null, '1', 'admin', to_date('09-11-2016 15:29:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000017', '000008', '000001', null, '1', 'admin', to_date('09-11-2016 15:29:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000018', '000007', '000001', null, '1', 'admin', to_date('09-11-2016 15:29:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000019', '000009', '000001', null, '1', 'admin', to_date('09-11-2016 15:29:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000020', '000010', '000001', null, '1', 'admin', to_date('09-11-2016 15:29:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000021', '000011', '000001', null, '1', 'admin', to_date('09-11-2016 15:29:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000022', '000012', '000001', null, '1', 'admin', to_date('09-11-2016 15:29:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000023', '000013', '000001', null, '1', 'admin', to_date('09-11-2016 15:29:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000024', '000014', '000001', null, '1', 'admin', to_date('09-11-2016 15:29:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000025', '000015', '000001', null, '1', 'admin', to_date('09-11-2016 15:29:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000026', '000016', '000001', null, '1', 'admin', to_date('09-11-2016 15:29:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000027', '000017', '000001', null, '1', 'admin', to_date('09-11-2016 15:29:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000028', '000005', '000002', null, '0', 'admin', to_date('12-06-2017 18:22:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000029', '000006', '000002', null, '0', 'admin', to_date('12-06-2017 18:22:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000030', '000008', '000002', null, '0', 'admin', to_date('12-06-2017 18:22:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000031', '000007', '000002', null, '0', 'admin', to_date('12-06-2017 18:23:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000032', '000009', '000002', null, '0', 'admin', to_date('12-06-2017 18:23:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000033', '000010', '000002', null, '0', 'admin', to_date('12-06-2017 18:23:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000034', '000011', '000002', null, '0', 'admin', to_date('12-06-2017 18:23:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000035', '000012', '000002', null, '0', 'admin', to_date('12-06-2017 18:23:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000036', '000013', '000002', null, '0', 'admin', to_date('12-06-2017 18:23:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000037', '000014', '000002', null, '0', 'admin', to_date('12-06-2017 18:23:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000038', '000015', '000002', null, '0', 'admin', to_date('12-06-2017 18:23:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000039', '000016', '000002', null, '0', 'admin', to_date('12-06-2017 18:23:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000040', '000017', '000002', null, '0', 'admin', to_date('12-06-2017 18:23:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000097', '000001', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:03', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000098', '000000', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:03', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000099', '000005', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:04', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000100', '000006', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:04', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000101', '000008', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:04', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000102', '000007', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:04', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000103', '000009', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:04', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000104', '000010', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:04', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000105', '000011', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:04', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000106', '000012', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:04', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000107', '000013', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:04', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000108', '000014', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:04', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000109', '000015', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:04', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000110', '000016', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:04', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into SOS_SYS_ROLE_MENU (id, menuid, roleid, descr, zt, creator, createdate, updater, updatedate)
values ('000111', '000017', '000002', null, '0', 'admin', to_date('13-06-2017 08:30:04', 'dd-mm-yyyy hh24:mi:ss'), null, null);
commit;
prompt 245 records loaded
prompt Loading SOS_SYS_USER_ROLE...
insert into SOS_SYS_USER_ROLE (id, userid, roleid, descr, creator, creatdate, zt)
values ('000005', '000005', '000002', null, 'admin', to_date('13-06-2017 10:56:31', 'dd-mm-yyyy hh24:mi:ss'), '0');
insert into SOS_SYS_USER_ROLE (id, userid, roleid, descr, creator, creatdate, zt)
values ('000006', '000005', '000002', null, 'admin', to_date('13-06-2017 10:56:51', 'dd-mm-yyyy hh24:mi:ss'), '0');
insert into SOS_SYS_USER_ROLE (id, userid, roleid, descr, creator, creatdate, zt)
values ('000011', '000003', '000002', null, 'admin', to_date('13-06-2017 11:04:00', 'dd-mm-yyyy hh24:mi:ss'), '0');
insert into SOS_SYS_USER_ROLE (id, userid, roleid, descr, creator, creatdate, zt)
values ('000012', '000003', '000002', null, 'admin', to_date('13-06-2017 11:04:11', 'dd-mm-yyyy hh24:mi:ss'), '1');
insert into SOS_SYS_USER_ROLE (id, userid, roleid, descr, creator, creatdate, zt)
values ('000013', '000002', '000002', null, 'admin', to_date('13-06-2017 11:04:32', 'dd-mm-yyyy hh24:mi:ss'), '1');
insert into SOS_SYS_USER_ROLE (id, userid, roleid, descr, creator, creatdate, zt)
values ('000014', '000007', '000002', null, 'admin', to_date('13-06-2017 11:04:45', 'dd-mm-yyyy hh24:mi:ss'), '1');
insert into SOS_SYS_USER_ROLE (id, userid, roleid, descr, creator, creatdate, zt)
values ('000015', '000006', '000002', null, 'admin', to_date('13-06-2017 11:04:52', 'dd-mm-yyyy hh24:mi:ss'), '1');
insert into SOS_SYS_USER_ROLE (id, userid, roleid, descr, creator, creatdate, zt)
values ('000016', '000008', '000002', null, 'admin', to_date('13-06-2017 11:05:56', 'dd-mm-yyyy hh24:mi:ss'), '1');
insert into SOS_SYS_USER_ROLE (id, userid, roleid, descr, creator, creatdate, zt)
values ('000004', '000009', '000002', null, 'admin', to_date('13-06-2017 08:32:24', 'dd-mm-yyyy hh24:mi:ss'), '1');
insert into SOS_SYS_USER_ROLE (id, userid, roleid, descr, creator, creatdate, zt)
values ('000007', '000005', '000003', null, 'admin', to_date('13-06-2017 10:57:42', 'dd-mm-yyyy hh24:mi:ss'), '0');
insert into SOS_SYS_USER_ROLE (id, userid, roleid, descr, creator, creatdate, zt)
values ('000008', '000005', '000002', null, 'admin', to_date('13-06-2017 10:57:42', 'dd-mm-yyyy hh24:mi:ss'), '0');
insert into SOS_SYS_USER_ROLE (id, userid, roleid, descr, creator, creatdate, zt)
values ('000009', '000005', '000002', null, 'admin', to_date('13-06-2017 10:57:47', 'dd-mm-yyyy hh24:mi:ss'), '0');
insert into SOS_SYS_USER_ROLE (id, userid, roleid, descr, creator, creatdate, zt)
values ('000001', '000001', '000001', null, '000001', to_date('04-11-2016 09:22:09', 'dd-mm-yyyy hh24:mi:ss'), '1');
insert into SOS_SYS_USER_ROLE (id, userid, roleid, descr, creator, creatdate, zt)
values ('000002', '000004', '000002', null, 'admin', to_date('12-06-2017 18:23:18', 'dd-mm-yyyy hh24:mi:ss'), '0');
insert into SOS_SYS_USER_ROLE (id, userid, roleid, descr, creator, creatdate, zt)
values ('000003', '000004', '000002', null, 'admin', to_date('12-06-2017 18:24:00', 'dd-mm-yyyy hh24:mi:ss'), '1');
insert into SOS_SYS_USER_ROLE (id, userid, roleid, descr, creator, creatdate, zt)
values ('000010', '000005', '000002', null, 'admin', to_date('13-06-2017 11:00:56', 'dd-mm-yyyy hh24:mi:ss'), '1');
commit;
prompt 16 records loaded
prompt Loading SOS_USER...
insert into SOS_USER (id, loginid, password, usertype, username, adminid, contactno, cityid, company, remark, adminflag, status)
values ('000001', 'admin', 'sdjnssap123!@#', '1', '管理员', '管理员', '1234567890', '0531', '管理员', '管理员工号', '0', '0');
commit;
prompt 9 records loaded
prompt Enabling triggers for SOS_SYS_LOG...
alter table SOS_SYS_LOG enable all triggers;
prompt Enabling triggers for SOS_SYS_MENU_INFO...
alter table SOS_SYS_MENU_INFO enable all triggers;
prompt Enabling triggers for SOS_SYS_ROLE_INFO...
alter table SOS_SYS_ROLE_INFO enable all triggers;
prompt Enabling triggers for SOS_SYS_ROLE_MENU...
alter table SOS_SYS_ROLE_MENU enable all triggers;
prompt Enabling triggers for SOS_SYS_USER_ROLE...
alter table SOS_SYS_USER_ROLE enable all triggers;
prompt Enabling triggers for SOS_USER...
alter table SOS_USER enable all triggers;
set feedback on
set define on
prompt Done.
