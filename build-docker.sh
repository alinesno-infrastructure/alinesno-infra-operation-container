# 接收指定环境参数
CONTAINER_NAME=$2
VERSION=$1
CR_NAMESPACE=$3

if [ ! $CR_NAMESPACE ]; then
  CR_NAMESPACE = "alinesno-infra-base"
fi
echo "当前版本为:$CR_NAMESPACE"

if [ ! $VERSION ]; then
  VERSION = "1.0.0"
fi
echo "当前版本为:$VERSION"

# 1. 构建镜像
docker build . -t registry-vpc.cn-shenzhen.aliyuncs.com/$CR_NAMESPACE/$CONTAINER_NAME:$VERSION

# 2. 推送镜像
docker push registry-vpc.cn-shenzhen.aliyuncs.com/$CR_NAMESPACE/$CONTAINER_NAME:$VVERSIONER
