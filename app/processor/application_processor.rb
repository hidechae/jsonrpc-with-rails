class ApplicationProcessor
  def input_setting
    fail 'method missing'
  end

  def initialize(params)
    @params = filter params
    fail Rpc::Error::InvalidParams.new(
      message: 'invalid parameter',
      data: { input_setting: input_setting, params: params }
    ) unless valid?
  end

  def execute
    fail 'method missing'
  end

  private

  def filter(params)
    filtered_parameters = {}
    input_setting.each_key do |key|
      filtered_parameters.store(key, params[key]) if params.key?(key)
    end
    filtered_parameters
  end

  def valid?
    input_setting.each do |key, setting|
      return false unless @params.key?(key) if setting[:required]
    end
    true
  end
end
