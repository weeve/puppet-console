# Puppet module for disabling screen blanking on the console

## Overview

This Puppet module disables the default screen blanking after 10 minutes/screensaver on the Linux console

Made by Jason Wever

This module is released under the terms of the GPLv2 license.

## Requirements

This module requires that the Puppet Labs `stdlib` module be installed prior to usage.

## Usage

Default usage:
```puppet
  class { 'console': }
```
