CREATE OR REPLACE FUNCTION get_first_user_id(cid integer)
RETURNS integer AS
$BODY$
  BEGIN
    RETURN (SELECT id FROM users WHERE id = cid);
  END
$BODY$
LANGUAGE plpgsql STABLE
