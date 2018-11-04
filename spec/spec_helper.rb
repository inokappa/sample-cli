# require "bundler/setup"
require "rspec"
require "sample_cli"

Aws.config.update(stub_responses: true)

def capture(stream)
  begin
    stream = stream.to_s
    eval "$#{stream} = StringIO.new"
    yield
    result = eval("$#{stream}").string
  ensure
    eval("$#{stream} = #{stream.upcase}")
  end
  result
end