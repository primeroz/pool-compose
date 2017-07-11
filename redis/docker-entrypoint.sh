#!/bin/bash

chown -R redis:redis /redis

exec $@
