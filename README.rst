.. image:: https://img.shields.io/pypi/v/datakit-all.svg
        :target: https://pypi.python.org/pypi/datakit-all

===========
Datakit-all
===========

This is the **bundle** distribution for Datakit: a metapackage that installs
the `datakit` command-line tool together with the Associated Press Data Team's
standard set of plugins.

Datakit is a pluggable command-line tool for managing the life cycle of data
projects. The core (``datakit-core``) is a thin wrapper around the Cliff_
framework; every command is provided by a plugin discovered through the
``datakit.plugins`` entry point.

This package pulls the following into a single environment:

- datakit-core_ — the ``datakit`` CLI itself
- datakit-project_ — ``project create`` / ``project templates``
- datakit-data_ — ``data init`` / ``push`` / ``pull`` / ``status``
- datakit-github_ — ``github integrate``
- datakit-gitlab_ — ``gitlab integrate`` / ``gitlab issues add``

Installation
============

The recommended install is as an isolated tool with uv_::

    $ uv tool install datakit-all

This gives you the CLI and every standard command in one step::

    $ datakit --help

You can also install it into a regular environment with pip::

    $ pip install datakit-all

Curated installs
================

If you only want a subset of plugins, skip this bundle and install the core
plus just the plugins you need. With uv::

    $ uv tool install datakit-core --with datakit-project --with datakit-data

Or run one off without a persistent install::

    $ uvx --with datakit-project datakit project create

Versioning
==========

This bundle is a *release train*: its version tracks the recommended
combination of plugins, not the version of any single component. Each
dependency is pinned with a lower bound, so ``uv tool upgrade datakit`` will
pick up newer compatible plugin releases.

.. _Cliff: https://docs.openstack.org/cliff/
.. _uv: https://docs.astral.sh/uv/
.. _datakit-core: https://github.com/associatedpress/datakit-core
.. _datakit-project: https://github.com/associatedpress/datakit-project
.. _datakit-data: https://github.com/associatedpress/datakit-data
.. _datakit-github: https://github.com/associatedpress/datakit-github
.. _datakit-gitlab: https://github.com/associatedpress/datakit-gitlab
