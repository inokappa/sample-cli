module SampleCli
  class Client
    def initialize
      raise 'AWS_PROFILE does not exist.' unless ENV['AWS_PROFILE']
      raise 'AWS_REGION does not exist.' unless ENV['AWS_REGION']
    end
  end
end
