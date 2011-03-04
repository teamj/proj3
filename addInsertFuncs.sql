-- addInsertFuncs.sql - this script will make it easier to add Users and Suggestions
-- make sure that createTables.sql is run before this

-- create plpgsql language
drop language if exists plpgsql cascade;
create language plpgsql;



  
-- create function for adding Suggestion and returning id
create or replace function insertSuggestion(_suggestion text)
  returns integer as
  $func$
  begin
    execute 'insert into suggestions (suggestion, created_at, updated_at) values ('
      || quote_literal(_suggestion) || ',' || quote_literal(now()) || ',' || 
      quote_literal(now()) || ')';
    return currval('suggestion_id_seq');
  end;
  $func$
  language 'plpgsql';
  
-- create function for inserting into Users and Suggestions
create or replace function insertUserSuggestion(_userid integer, _suggestion text)
  returns boolean as
  $func$
  declare
    userid int;
    sql1 text;
  begin
    userid := _userid;
    sql1 := 'coalesce((select id from suggestions where suggestion = ' 
      || quote_literal(_suggestion) || '),insertSuggestion(' ||
      quote_literal(_suggestion) || '))';
    execute 'insert into user_suggestions (user_id, suggestion_id) values (' 
      || userid || ',' || sql1 || ')';
    return 't';
  end;
  $func$
  language 'plpgsql';
  

  
-- create rule
create or replace rule user_suggestion_ins as on insert to user_suggestion_view
  do instead select insertUserSuggestion(new.userid, new.suggestion);
