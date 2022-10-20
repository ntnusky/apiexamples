# API-examples

This repository contains a couple of examples on how to use the openstack-API's
in various scripting-languages.

## Bash

The current bash-examples covers how to get a system-scoped token for a user
using username/password, and how to use this token to get users or domains based
on ID's or names. Example usage:

    $ export API=openstack.local
    $ ./get-token.sh logstash akeQtqrmDjF7VUHC > /dev/null
    $ ./get-user-from-name.sh admin default
    {
      "email": "post@localhost",
      "id": "d9fe458ae9ce4aafb40f7b2fad79145f",
      "name": "admin",
      "domain_id": "default",
      "enabled": true,
      "password_expires_at": null,
      "options": {},
      "links": {
        "self": "https://api.openstack.local:5000/v3/users/d9fe458ae9ce4aafb40f7b2fad79145f"
      }
    }
    $ ./get-user-from-id.sh d9fe458ae9ce4aafb40f7b2fad79145f
    {
      "email": "post@localhost",
      "id": "d9fe458ae9ce4aafb40f7b2fad79145f",
      "name": "admin",
      "domain_id": "default",
      "enabled": true,
      "password_expires_at": null,
      "options": {},
      "links": {
        "self": "https://api.openstack.local:5000/v3/users/d9fe458ae9ce4aafb40f7b2fad79145f"
      }
    }
    $ ./get-domain-from-name.sh DOMAIN
    {
      "id": "c6e124d84e8f4b89afaad2879216f7e2",
      "name": "DOMAIN",
      "description": "",
      "enabled": true,
      "tags": [],
      "options": {},
      "links": {
        "self": "https://api.openstack.local:5000/v3/domains/c6e124d84e8f4b89afaad2879216f7e2"
      }
    }
    $ ./get-domain-from-id.sh c6e124d84e8f4b89afaad2879216f7e2
    {
      "id": "c6e124d84e8f4b89afaad2879216f7e2",
      "name": "DOMAIN",
      "description": "",
      "enabled": true,
      "tags": [],
      "options": {},
      "links": {
        "self": "https://api.openstack.local:5000/v3/domains/c6e124d84e8f4b89afaad2879216f7e2"
      }
    }
