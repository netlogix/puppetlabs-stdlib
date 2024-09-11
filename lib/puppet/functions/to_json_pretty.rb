require 'json'

Puppet::Functions.create_function(:to_json_pretty) do
  dispatch :to_json_pretty do
    param 'Variant[Hash, Array]', :data
    optional_param 'Boolean', :skip_undef
  end

  def to_json_pretty(data, skip_undef = false)
    if skip_undef
      if data.is_a? Array
        data = data.reject { |value| value.nil? }
      elsif data.is_a? Hash
        data = data.reject { |_, value| value.nil? }
      end
    end
    JSON.pretty_generate(data) << "\n"
  end
end
