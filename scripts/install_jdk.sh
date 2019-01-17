#!/bin/bash
set -euo pipefail

BUILD_DIR=$1
CACHE_DIR=$2
DEPS_DIR=$3
DEPS_IDX=$4

JDK_VERSION="11.0.1"

export JdkInstallDir=$BUILD_DIR/jdk

mkdir -p $JdkInstallDir

if [ ! -f $JdkInstallDir/jdk-11.0.1/bin/java ]; then
  # JDK_SHA256="fb26c30e6a04ad937bbc657a1b5bba92f80096af1e8ee6da6430c045a8db3a5b"
  URL=https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz

  echo "-----> Download jdk ${JDK_VERSION}"
  curl -s -L --retry 15 --retry-delay 2 $URL -o /tmp/jdk.tar.gz

  # DOWNLOAD_SHA256=$(shasum -a 256 /tmp/go.tar.gz | cut -d ' ' -f 1)

  # if [[ $DOWNLOAD_SHA256 != $JDK_SHA256 ]]; then
  #   echo "       **ERROR** SHA256 mismatch: got $DOWNLOAD_SHA256 expected $JDK_SHA256"
  #   exit 1
  # fi

  tar xzf /tmp/jdk.tar.gz -C $JdkInstallDir
  ls
  rm /tmp/jdk.tar.gz
  echo "jdk is installed"
fi
if [ ! -f $JdkInstallDir/jdk-11.0.1/bin/java ]; then
  echo "       **ERROR** Could not download jdk"
  exit 1
fi

