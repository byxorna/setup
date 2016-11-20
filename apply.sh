#!/bin/bash
root=$(dirname $0)
puppet apply --verbose --hiera_config $root/hiera.yaml --modulepath=$root/modules/ $root/manifests/site.pp
