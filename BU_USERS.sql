CREATE OR REPLACE EDITIONABLE TRIGGER  "BU_USERS" 
  before update on users 
  for each row 
begin 
  :new.nume := upper(:new.nume); 
  if :new.parola is not null then 
    :new.parola := hash_password(upper(:new.nume),:new.parola); 
  else 
    :new.parola := :old.parola; 
  end if; 
end;

/
ALTER TRIGGER  "BU_USERS" ENABLE
/
