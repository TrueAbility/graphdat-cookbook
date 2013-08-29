
default['graphdat']['catalog'] = 'default'
default['graphdat']['data_url'] = 'http://www.graphdat.com/condenser'
default['graphdat']['recep_url'] = 'http://www.graphdat.com/reception/v2/msgpack'
default['graphdat']['agent_request_count_per_route'] = 1
default['graphdat']['agent_request_resp_time_per_route'] = 1
default['graphdat']['agent_request_cpu_time_per_route'] = 1
default['graphdat']['hostname'] = node.name

# The following *must* be set via node, role, or environment attributes
default['graphdat']['account_id'] = ""
default['graphdat']['project_id'] = ""
default['graphdat']['api_key'] = ""