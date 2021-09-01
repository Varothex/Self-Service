create or replace FUNCTION AUTHENTICATE_USER (p_username in varchar2, p_password in varchar2)
return boolean
is
  l_user_name       users.nume%type    := upper(p_username );
  l_password        users.parola%type;
  l_hashed_password varchar2(1000);
  l_count           number;

begin
    select count(*) 
    into l_count 
    from users
    where nume = l_user_name;
      
    if l_count > 0 then
        l_hashed_password := hash_password(l_user_name, p_password );
        select parola 
        into l_password 
        from users 
        where nume = l_user_name;

        if l_hashed_password = l_password then
            APEX_UTIL.SET_AUTHENTICATION_RESULT(0);
            return true;
        else
            APEX_UTIL.SET_AUTHENTICATION_RESULT(4);
            return false;
        end if;
  
    else
        APEX_UTIL.SET_AUTHENTICATION_RESULT(1);
        return false;
    end if; 

    APEX_UTIL.SET_AUTHENTICATION_RESULT(7);
    return false;

exception 
    when others then 
        APEX_UTIL.SET_AUTHENTICATION_RESULT(7);
        APEX_UTIL.SET_CUSTOM_AUTH_STATUS(sqlerrm);
        return false;

end authenticate_user;
