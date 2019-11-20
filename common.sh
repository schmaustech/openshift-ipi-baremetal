#!/bin/bash
LATEST_CI_IMAGE=$(curl https://openshift-release.svc.ci.openshift.org/api/v1/releasestream/4.3.0-0.ci/latest | grep -o 'registry.svc.ci.openshift.org[^"]\+')
export OPENSHIFT_RELEASE_IMAGE="${OPENSHIFT_RELEASE_IMAGE:-$LATEST_CI_IMAGE}"
export GOPATH=/home/bschmaus/go
export OCP_RELEASE=`echo $LATEST_CI_IMAGE|cut -d: -f2`
export UPSTREAM_REPO=$LATEST_CI_IMAGE
export LOCAL_REG='rhel8-ocp-auto.schmaustech.com:5000'
export LOCAL_REPO='ocp4/openshift4'
export LOCAL_SECRET_JSON="${HOME}/pull-secret.json"
export OPENSHIFT_INSTALL_RELEASE_IMAGE_OVERRIDE=${LOCAL_REG}/${LOCAL_REPO}:${OCP_RELEASE}
