require 'yaml'

Puppet::Functions.create_function(:to_yaml) do
	dispatch :to_yaml do
		param 'Any', :data
	end

	def to_yaml(data)
		data.to_yaml
	end
end

