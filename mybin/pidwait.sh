#!/bin/bash
pidwait(){
	try=0
	while [[ $try -eq 0 ]]; do
		kill -0 "$1" || try=1 
		sleep 1
	done
}

