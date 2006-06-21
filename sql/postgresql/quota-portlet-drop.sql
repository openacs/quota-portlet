--
-- Copyright (C) 2004 University of Valencia
--
--  This file is part of dotLRN.
--
--  dotLRN is free software; you can redistribute it and/or modify it under the
--  terms of the GNU General Public License as published by the Free Software
--  Foundation; either version 2 of the License, or (at your option) any later
--  version.
--
--  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
--  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
--  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
--  details.
--
--
--   Procedures to support the quota portlet
--
--   @author Paco Soler (fransola@uv.es)
--   @author Agustin Lopez (Agustin.Lopez@uv.es)
--   @creation-date 2005-12-15
--   @version $Id: quota-portlet-drop.sql,v 0.2 2005-12-15

create function inline_1()
returns integer as '
declare  
  ds_id portal_datasources.datasource_id%TYPE;
begin

  select datasource_id into ds_id
      from portal_datasources
     where name = ''quota_portlet'';

   if not found then
     RAISE EXCEPTION '' No datasource id found '', ds_id;
     ds_id := null;
   end if;

  if ds_id is NOT null then
    perform portal_datasource__delete(ds_id);
  end if;

        -- drop the hooks
        perform acs_sc_impl_alias__delete (
               ''portal_datasource'',
               ''quota_portlet'',
               ''GetMyName''
        );

        perform acs_sc_impl_alias__delete (
               ''portal_datasource'',
               ''quota_portlet'',
               ''GetPrettyName''
        );


        perform acs_sc_impl_alias__delete (
               ''portal_datasource'',
               ''quota_portlet'',
               ''Link''
        );

        perform acs_sc_impl_alias__delete (
               ''portal_datasource'',
               ''quota_portlet'',
               ''AddSelfToPage''
        );

        perform acs_sc_impl_alias__delete (
               ''portal_datasource'',
               ''quota_portlet'',
               ''Show''
        );

        perform acs_sc_impl_alias__delete (
               ''portal_datasource'',
               ''quota_portlet'',
               ''Edit''
        );

        perform acs_sc_impl_alias__delete (
               ''portal_datasource'',
               ''quota_portlet'',
               ''RemoveSelfFromPage''
        );

        -- Drop the binding
        perform acs_sc_binding__delete (
            ''portal_datasource'',
            ''quota_portlet''
        );

        -- drop the impl
        perform acs_sc_impl__delete (
                ''portal_datasource'',
                ''quota_portlet''
        );
        
        return 0;
end;' language 'plpgsql';

select inline_1();
drop function inline_1();

\i quota-admin-portlet-drop.sql




