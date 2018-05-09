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

ad_page_contract {
    The display logic for the quota portlet
    @author Paco Soler (fransola@uv.es)    
        @author Agustin Lopez (Agustin.Lopez@uv.es)
    @creation-date 2005-12-15
    @version $Id: quota-portlet.tcl,v 0.2 2005-12-15

} -properties {
    context:onevalue
    user_id:onevalue
} -validate {

}

set context [list]
array set config $cf
set list_of_package_ids $config(package_id)
set user_id [ad_conn user_id]
set sep_package_ids [join $list_of_package_ids ", "]
if {[llength $list_of_package_ids] == 1} { set single_p "t"} else {set single_p "f"}
set context [list]
set shaded_p $config(shaded_p)
set quota_url "[ad_conn package_url]/quota/quota"
set community_id [dotlrn_community::get_community_id]
set pid 0
set site_admin [acs_user::site_wide_admin_p  -user_id $user_id]
set admin [dotlrn::user_can_admin_community_p -user_id $user_id -community_id $community_id]


if {$sep_package_ids == ""} {
  set sep_package_ids [dotlrn_community::get_package_id $community_id]
}
set one_instance_p [ad_decode [llength $list_of_package_ids] 1 1 0]
set package_id [ad_conn package_id]

if {[exists_and_not_null community_id]} {
    #We are in portal for one class or community
    set inside_comm_p 1
    set url_to_quota $quota_url
        set comm_quota_url "quota/quota"
} else {
    #We are in user portal
    set inside_comm_p 0
    set url_to_quota ""
        set comm_quota_url "../quota/quota"
}

# Get user information
db_1row get_user_info "select username, first_names, last_name  from acs_users_all where user_id = :user_id"

# Obtenemos quota global y del directorio personal máxima permitida para el usuario
set has_quota [db_0or1row get_user_quota "select * from user_quota where ref_user = :user_id"]  
  if {$has_quota} {
    set gq_total $global_quota
    set gf_total $global_files
        set pq_total $personal_quota 
        set pf_total $personal_files    
  } else {
    set gq_total [quota::get_parameter -param "MaxQuotaByUser"]
    set gf_total [quota::get_parameter -param "MaxFilesByUser"]
        set pq_total [quota::get_parameter -param "MaxQuotaByUserFolder"]
        set pf_total [quota::get_parameter -param "MaxFilesByUserFolder"]       
  }

# Obtenemos quota del directorio personal usada por del usuario
set used_pquota_and_pfiles [quota::get_used_pquota_and_pfiles -user_id $user_id]
set pq_used [lindex $used_pquota_and_pfiles 0]
set pf_used [lindex $used_pquota_and_pfiles 1]

# Quota directorio personal disponible
set pq_rest [expr $pq_total - $pq_used]
set pf_rest [expr $pf_total - $pf_used]

if {$pq_rest < 0} {
        set pq_rest 0
}

if {$pf_rest < 0} {
        set pf_rest 0
}

# Obtenemos quota global usada por del usuario
set used_quota_and_files [quota::get_used_quota_and_files -user_id $user_id]
set gq_used [lindex $used_quota_and_files 0]
set gf_used [lindex $used_quota_and_files 1]

set gq_used [expr $gq_used - $pq_used]
set gf_used [expr $gf_used - $pf_used]

# Quota disponible
set gq_rest [expr $gq_total - $gq_used]
set gf_rest [expr $gf_total - $gf_used]


ad_return_template




