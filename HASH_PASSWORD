create or replace FUNCTION HASH_PASSWORD (p_user_name in varchar2, p_password  in varchar2)
return varchar2
is
  l_password varchar2(255);
  l_salt  varchar2(255) := '1739USFGOJN2T3HW89EFGOBN23R5SDFGAKL';

begin
    l_password := utl_raw.cast_to_raw (dbms_obfuscation_toolkit.md5(input_string => p_password ||
                                      substr(l_salt,4,14) ||
                                      p_user_name ||
                                      substr(l_salt,5,10)));
    return l_password;

end hash_password;
