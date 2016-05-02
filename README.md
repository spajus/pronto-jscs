# Pronto runner for JSCS

[![Gem Version](https://badge.fury.io/rb/pronto-jscs.png)](http://badge.fury.io/rb/pronto-jscs)

Pronto runner for [JSCS](http://jscs.info/), JavaScript Code Style checker.
[What is Pronto?](https://github.com/mmozuras/pronto)

## Prerequisites

You'll need to be able to run `jscs` from command line. See [jscs.info](http://jscs.info).

## Config

If you have a *.jscsrc* file in the root of your project, that will be used.
Alternatively the environment variable *JSCSRC_LOCATION* can specify an alternative location.
Otherwise, the *airbnb* config is used.
