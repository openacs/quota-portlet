<%
    #
    #  Copyright (C) 2004 University of Valencia
    #
    #  This file is part of dotLRN.
    #
    #  dotLRN is free software; you can redistribute it and/or modify it under the
    #  terms of the GNU General Public License as published by the Free Software
    #  Foundation; either version 2 of the License, or (at your option) any later
    #  version.
    #
    #  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
    #  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
    #  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
    #  details.
    #
%>

<UL>
<if @site_admin@>
<!-- Enlace a la página de administración de cuotas para el SITE-ADMIN-->
<LI><a href="quota/admin/manage_site_quota">#quota-portlet.quota_admin#</a>

</if>
<!--# Enlace a la página de administración de cuotas para los profesores y administradores de curso-->
<!--<LI><a href="quota/admin/manage_community_quota">#quota-portlet.quota_admin#</a>-->
</UL>