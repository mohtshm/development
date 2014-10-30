<?php
	$g_hostname = 'localhost';
	$g_db_type = 'mysql';
	$g_database_name = 'mantis_tracking';
	$g_db_username = 'root';
	$g_db_password = 'pws';	
	$g_allow_signup    = ON;  //allows the users to sign up for a new account
	$g_enable_email_notification = ON; //enables the email messages
	$g_phpMailer_method = PHPMAILER_METHOD_SMTP;
	$g_smtp_host = 'smtp.gmail.com';
	$g_smtp_connection_mode = 'ssl';
	$g_smtp_port = 465;
	$g_smtp_username = 'noreply@gmail.com'; //replace it with your gmail address
	$g_smtp_password = 'pws'; //replace it with your gmail password
	$g_administrator_email = 'xxx@gmail.com'; //this will be your administrator email address
	$g_allow_file_upload   = ON;
    $g_file_upload_method   = DISK;
    $g_attachments_file_permissions = 0400;
	$g_max_file_size      = 10000000; # 5 MB
    $g_allowed_files      = 'zip,bmp,gif,jpg,txt,rar,png,doc,mp4,vlc,xlsx,docx,pdf';
    $g_disallowed_files      = '';
    $g_document_files_prefix = 'doc';
    $g_absolute_path_default_upload_folder = 'C:/dump/mantisupload/';
	
	$g_status_enum_string = '10:new,20:feedback,30:acknowledged,40:confirmed,50:assigned,60:testing,70:rework,80:resolved,90:closed';
	
	$g_status_colors['testing'] = '#ACE7AE';
	$g_status_colors['rework'] = '#DCE7AE';
	
	$g_status_enum_workflow[NEW_]         ='50:assigned';
	$g_status_enum_workflow[ASSIGNED]     ='30:acknowledged';
	$g_status_enum_workflow[ACKNOWLEDGED] ='40:confirmed,20:feedback,60:testing';
	$g_status_enum_workflow[CONFIRMED]    ='20:feedback,60:testing';
	$g_status_enum_workflow[FEEDBACK]     ='40:confirmed,60:testing';
	$g_status_enum_workflow[TESTING]     ='70:rework,80:resolved';
	$g_status_enum_workflow[REWORK]      ='20:feedback,30:acknowledged,50:assigned';
	$g_status_enum_workflow[RESOLVED]     ='90:closed';	
   ?>
