=======
History
=======

0.4.1 (2026-07-02)
------------------

* Re-expose the ``datakit`` console script so ``uv tool install datakit-all``
  (and ``pipx install``) provide the CLI executable. A bare metapackage
  declares no executables of its own, so the tool installers previously
  refused to install any entry points.

0.4.0 (2026-07-02)
------------------

* First release of the ``datakit-all`` bundle metapackage.
* Installs ``datakit-core`` plus the standard AP plugin set
  (``datakit-project``, ``datakit-data``, ``datakit-github``, ``datakit-gitlab``)
  so ``uv tool install datakit-all`` provides the full CLI in one step.
