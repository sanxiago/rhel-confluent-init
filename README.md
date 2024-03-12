# To build the image
		docker build . \
			--build-arg cp_version=$CP_VERSION \
			--build-arg jdk_version=$JDK_VERSION \
			-t rhel-confluent-init:$CP_VERSION"_jdk_"$JDK_VERSION
# Or run the script to build all supported images
                bash makeme.sh

# To start a container with init you need the --priviliged flag and the --tmpfs /run and --tmfps /tmp i.e:
                docker run -it --privileged --tmpfs /tmp --tmpfs /run --name pod1 rhel-confluent-init:6.2_jdk_11 init
