#!/usr/bin/v run

import os

if os.args.len == 11 {
	oname := os.args[1]
	opasswd := os.args[2]
	ssh := os.args[3]
	auser := os.args[4]
	apasswd := os.args[5]
	db_host := os.args[6]
	db_port := os.args[7]
	db_username := os.args[8]
	db_password := os.args[9]
	db_database := os.args[10]

	// Setup user on os
	mut cmd := os.exec('sh sh/setup_user.sh $oname $opasswd') or { panic(err) }
	if cmd.output != 'success' {
		println('Error: ${cmd.output}')
		exit(1)
	}

	if ssh == 'true' {
		cmd = os.exec('sh sh/setup_ssh.sh $oname') or { panic(err) }
		if cmd.output != 'success' {
			println('Error: ${cmd.output}')
			exit(1)
		}
	}
	
	// Setup tables in database
	os.exec('v run setup $db_host $db_port $db_username $db_password $db_database $auser $apasswd') or { panic(err) }
} else {
	println('install <os_username> <os_password> <ssh> <adminuser> <adminpassword> <db_host> <db_port> <db_username> <db_password> <db_database>')
	exit(1)
}