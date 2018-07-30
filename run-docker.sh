set -x

image=$(docker images marrony/esp-link:latest -q)

if [ "$image" == "" ]; then
  docker build -f Dockerfile -t marrony/esp-link:latest .
fi

docker run --rm --name esp-link -v $(pwd):/home/esp-open-sdk/Esp-Link -w /home/esp-open-sdk/Esp-Link -it marrony/esp-link:latest
