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

<STYLE type="text/css">
body {color:#003366}
.list0 {border:1px solid #A0BDEB;border-bottom: 2px solid #A0BDEB}
.list1 {border:1px solid #A0BDEB;border-bottom: 2px solid #A0BDEB; border-left:0px}
a.link {background:#FFFFFF;color:#383C93;font-weight:bold}
a.link:visited{background:#FFFFFF;color:#383C93;font-weight:bold}
a.link:hover {background:#FFFFE0;color:#383C93;font-weight:bold}
</STYLE>

<property name="context">@context;noquote@</property>
<property name="title">Quota</property>
<CENTER>
<table width="95%" cellpadding="5" cellspacing="0">
  <TR><TD COLSPAN="5"></TD></TR>
  <TR><!-- #quota-portlet. -->
    <TH class="list0">@username@</TH>
    <TH class="list1">#quota-portlet.global_quota#</TH>
    <TH class="list1">#quota-portlet.global_files#</TH>
    <TH class="list1">#quota-portlet.personal_quota#</TH>
    <TH class="list1">#quota-portlet.personal_files#</TH>
  </TR>
  <if @site_admin@>
    <TR>
        <TD class="list0" align="center">#quota-portlet.used#</TD>
        <TD class="list1" align="center">@gq_used@</TD>    
        <TD class="list1" align="center">@gf_used@</TD>
        <TD class="list1" align="center">@pq_used@</TD>
        <TD class="list1" align="center">@pf_used@</TD>
  </TR>
  </if><else>
  <TR>
        <TD class="list0" align="center">#quota-portlet.total#</TD>
        <TD class="list1" align="center">@gq_total@</TD>    
        <TD class="list1" align="center">@gf_total@</TD>
        <TD class="list1" align="center">@pq_total@</TD>
        <TD class="list1" align="center">@pf_total@</TD>
  </TR>
  <TR>
        <TD class="list0" align="center">#quota-portlet.used#</TD>
        <TD class="list1" align="center">@gq_used@</TD>    
        <TD class="list1" align="center">@gf_used@</TD>
        <TD class="list1" align="center">@pq_used@</TD>
        <TD class="list1" align="center">@pf_used@</TD>
  </TR>
   <TR>
        <TD class="list0" align="center">#quota-portlet.rest#</TD>
        <TD class="list1" align="center">@gq_rest@</TD>    
        <TD class="list1" align="center">@gf_rest@</TD>
        <TD class="list1" align="center">@pq_rest@</TD>
        <TD class="list1" align="center">@pf_rest@</TD>
  </TR>
  </else>
  
  <TR class="list-even">
    <TD class="list_c"  colspan="5">
                <A href="/quota/user-quota?user_id=@user_id@" class="link">#quota-portlet.user_details#</A>
                <if @inside_comm_p@ eq 1><if @admin@>&nbsp;|&nbsp;
                <A href="@comm_quota_url@?community_id=@community_id@" class="link">#quota-portlet.community_details#</A>
                </if></if>
        </TD>
  </TR>
</TABLE>
</CENTER>

