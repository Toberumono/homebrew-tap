if [$# != 1 ]; then
	echo "Invalid arguments.  Please enter the directory into which the WRF Runner configuration and executable files should be linked.  This directory need not exist."
else
	if [ "$(which brew)" == "" ]; then
		echo "brew is not int your path.  Please put it in your path before running this script."
		kill -INT $$
	fi
	echo "Linking into $1"
	if [! -e "$1" -o ! -d "$1" ]; then
		mkdir "$1"
	fi
	ln -s "$(brew --prefix)/bin/WRFRunner.jar" "$1/WRFRunner.jar"
	ln -s "$(brew --prefix)/etc/wrf-runner/configuration.json" "$1/configuration.json"
fi