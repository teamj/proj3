-- addInitData.sql
-- Script to add some initial data
-- must run addInsertFuncs.sql first for this to work

-- Add users and suggestions records
insert into user_suggestion_view(first_name, last_name, username, password, 
  division, department, suggestion) values ('john','doe','userjohn','johnpass',
  'div1','dep1','johns suggestion');
insert into user_suggestion_view(first_name, last_name, username, password, 
  division, department, suggestion) values ('jane','doe','userjane','janepass',
  'div2','dep2','janes suggestion');
insert into user_suggestion_view(first_name, last_name, username, password, 
  division, department, suggestion) values ('bob','dole','userbob','bobpass',
  'div3','dep3','johns suggestion');
