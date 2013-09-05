Graphdat Cookbook
=================

This cookbook configures the Graphdat Agent.


Requirements
------------

### packages

 * graphdat-agent
 

Supported Platforms
-------------------

Note that support for a platform is limited to the platforms that Graphdat
supports.  Currently, this cookbook is developed for:

 * Debian/Ubuntu
 

Attributes
----------

#### graphdat::default
```
default['graphdat']['catalog'] = 'default'
default['graphdat']['data_url'] = 'http://www.graphdat.com/condenser'
default['graphdat']['recep_url'] = 'http://www.graphdat.com/reception/v2/msgpack'
default['graphdat']['agent_request_count_per_route'] = 1
default['graphdat']['agent_request_resp_time_per_route'] = 1
default['graphdat']['agent_request_cpu_time_per_route'] = 1
default['graphdat']['hostname'] = node.name

# The following *must* be set via node, role, or environment attributes
default['graphdat']['account_id'] = nil
default['graphdat']['project_id'] = nil
default['graphdat']['api_key'] = nil
```

Usage
-----
#### graphdat::default

To enable, simply add `graphdat` to your node, role, or environments 
`run_list`.  

Example:

```json
{
  "name":"my_node",
  "default_attributes": {
    "graphdat": {
      "account_id": "XXX",
      "project_id": "XXX",
      "api_key": "api.XXXXX"
    }
  },
  "run_list": [
    "recipe[graphdat]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

This cookbook is released under the BSD (three-clause) License.  Please see 
the LICENSE file included with this software.

Authors: 

    * BJ Dierkes

