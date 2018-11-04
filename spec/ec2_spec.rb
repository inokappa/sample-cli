require 'spec_helper'
SampleCli::Stub.load 'ec2'

describe 'sample_cli check subcommand instances' do
  it 'have instance ids' do
    expect(SampleCli::Ec2.new.instances).to eq(%w(i-ec12345a i-ec12345b))
  end

  it 'have instance ids by cli' do
    output = capture(:stdout) { SampleCli::CLI.new.instances }
    expect(output).to eq("i-ec12345a\ni-ec12345b\n")
  end
end
