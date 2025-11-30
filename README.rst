Ansible Navigator Starter
=========================


Installation
------------

Install using pip in virtual environment::

    python3 -m venv venv
    venv/bin/python3 -m pip install -U pip
    venv/bin/python3 -m pip install -U ansible-navigator


Alternative install with script::

    bash ./setup_venv.sh
    source ./venv/bin/activate



Execution Environment
---------------------

Purpose
~~~~~~~

Ansible execution environments are container images that provide a portable environment for execution Ansible playbooks and roles.
    
Ansible execution environment encapsulate the dependencies:

* Ansible Core (``ansible --version``)
* Ansible Runner (``ansible-runner --version``)
* Python Version (``python3 --version``)
* Ansible Collections and Roles (``ls /usr/share/ansible/{collections,roles}``)
* Python Pip Packages (``python3 -m pip freeze``)



Builder
~~~~~~~

Build custom execution environment::

    ansible-navigator builder build -f builder/execution-environment.yml -c builder/context -t localhost/ee:latest -vvv

    podman images --f=reference=ee


Use custom execution environment

* Edit ``ansible-navigator.yml`` (ansible-navigator > execution-environment > image)



Documentation
-------------


List installed modules::

    ansible-navigator --ee=true doc -l


View info of installed module::

    ansible-navigator --ee=true doc ansible.posix.firewalld


Run Playbook
-------------

Run playbook::

    ansible-navigator --ee=true run projects/testing/test_debug_facts.yml -i inventory/local.yml


Run playbook with vault::

    ansible-navigator --ee=true run projects/testing/test_debug_vault_vars.yml -i inventory/example_local.yml -e @vault/example.yml --vault-id example@vault/example.pw



Run playbook with user prompts (e.g. ``--vault-id <VAULT_LABEL>@prompt``, ``--ask-vault-pass``,  ``--ask-become-pass``, ``-ask-pass``)::

    ansible-navigator --ee=true run projects/testing/test_debug_vault_vars.yml -i inventory/example_local.yml -e @vault/example.yml --ep --vault-id example@prompt




Replay Run History
------------------

Replay a prior run (NOTE: runs with user prompts ``--ep`` cannot be replayed)::

    ansible-navigator replay _history_/<FILENAME>



Inventory
---------

List inventory::

    ansible-navigator inventory -i inventory/example_local.yml --list --yaml
    ansible-navigator inventory -i inventory/example_ssh.yml --list --yaml



Linting
-------

Lint playbooks::

    ansible-navigator lint projects/


