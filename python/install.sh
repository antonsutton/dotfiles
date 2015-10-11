#!/usr/bin/env bash
#
# Install Python related tools

set -e

pip install --upgrade setuptools
pip install --upgrade pip

pip install virtualenv
pip install virtualenvwrapper