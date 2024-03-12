# Oldest supported image
VERSION="6.1"

# Change jdk version here
JDK_VERSION=11

# If true we build all images from $VERSION onwards
MAKE_ALL="true"

if [ $MAKE_ALL == "true" ]
then
# Pull list of available packages
for CP_VERSION in $(curl -s https://packages.confluent.io/rpm/ | egrep -o "[0-9]+\.[0-9]+" | uniq  | sort -n);
do
	# Do not build images older than $VERSION
	if [ $(echo "$CP_VERSION >= $VERSION" | bc -l ) -gt 0 ]
	then
		docker build . \
			--build-arg cp_version=$CP_VERSION \
			--build-arg jdk_version=$JDK_VERSION \
			-t rhel-confluent-init:$CP_VERSION"_jdk_"$JDK_VERSION
	fi
done
else
	                docker build . \
                        --build-arg cp_version=$VERSION \
                        --build-arg jdk_version=$JDK_VERSION \
                        -t rhel-confluent-init:$CP_VERSION"_jdk_"$JDK_VERSION

fi
