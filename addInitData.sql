-- addInitData.sql
-- Script to add some initial data
-- must run addInsertFuncs.sql first for this to work

-- Add users and suggestions records
insert into user_suggestion_view_init(first_name, last_name, username, password, 
  division, department, suggestion) values ('john','doe','johnuser','johnpass',
  'admin','admin','johns suggestion');
insert into user_suggestion_view_init(first_name, last_name, username, password, 
  division, department, suggestion) values ('jane','doe','janeuser','janepass',
  'TECH','TECH','janes suggestion');
insert into user_suggestion_view_init(first_name, last_name, username, password, 
  division, department, suggestion) values ('bill','clinton','billuser','billpass',
  'TECH','CENT','bills suggestion');
insert into user_suggestion_view_init(first_name, last_name, username, password, 
  division, department, suggestion) values ('tim','duncan','timuser','timpass',
  'TECH','ICS','tims suggestion');
insert into user_suggestion_view_init(first_name, last_name, username, password, 
  division, department, suggestion) values ('james','smith','jamesuser','jamespass',
  'LIBARTS','LIBARTS','james suggestion');
insert into user_suggestion_view_init(first_name, last_name, username, password, 
  division, department, suggestion) values ('smith','james','smithuser','smithpass',
  'LIBARTS','MATH','smiths suggestion');
insert into user_suggestion_view_init(first_name, last_name, username, password, 
  division, department, suggestion) values ('paul','jackson','pauluser','paulpass',
  'LIBARTS','SCI','pauls suggestion');
