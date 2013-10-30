#!/bin/bash
#########################################
HOME=/home/hoge
CURRENT=/home/hoge/webistrano
#########################################

#rvm 
#source "$HOME/.bashrc"
#source "$HOME/.rvm/scripts/rvm"
#PATH=$PATH:$HOME/.rvm/bin
#cd $CURRENT
#rvm use 1.9.3

#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


case "$1" in
	start)
		cd $CURRENT
		bundle exec unicorn_rails -E production -D
	;;
	stop)
		cd $CURRENT
		[ -e tmp/pids/unicorn.pid ] && pid=`cat tmp/pids/unicorn.pid`
		echo "unicorn stop"
		if [ -e tmp/pids/unicorn.pid ]; then
			echo "stopping ... unicorn"	
		else
			echo "unicorn was already stopping"
			exit 1
		fi
		while kill -0 $pid 2>/dev/null; do
			echo "waiting for unicorn to die"
			kill $pid
			sleep 1
		done
	;;
	*)
		echo "Error Argument"
		exit 1
	;;
esac
