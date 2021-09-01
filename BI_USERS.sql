CREATE OR REPLACE EDITIONABLE TRIGGER  "BI_USERS" 
  before insert on users 
  for each row 
begin 
  select users_seq.nextval into :new.id_user from dual; 
  :new.nume := upper(:new.nume); 
  :new.parola := hash_password(upper(:new.nume),:new.parola); 
end;

/
ALTER TRIGGER  "BI_USERS" ENABLE
/
