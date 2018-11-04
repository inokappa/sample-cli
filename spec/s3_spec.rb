require 'spec_helper'
SampleCli::Stub.load 's3'

describe 'sample_cli check subcommand buckets' do
  it 'have bucket names' do
    expect(SampleCli::S3.new.buckets).to eq(%w(foo bar))
  end

  it 'have bucket names by cli' do
    output = capture(:stdout) { SampleCli::CLI.start(%w{buckets}) }
    expect(output).to match('foo\nbar\n')
  end
end

describe 'sample_cli check subcommand objects' do
  it 'have object keys' do
    expect(SampleCli::S3.new.objects('foo')).to match(%w(foo bar baz/key))
  end

  it 'have object keys by cli' do
    output = capture(:stdout) { SampleCli::CLI.start(%w{objects --bucket=foo}) }
    expect(output).to match('foo\nbar\nbaz/key\n')
  end
end
