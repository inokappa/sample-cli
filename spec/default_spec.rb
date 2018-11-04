require 'spec_helper'

describe 'sample_cli check version' do
  it 'has a version number' do
    expect(SampleCli::VERSION).not_to be nil
  end

  it 'has a version number by cli' do
    output = capture(:stdout) { SampleCli::CLI.start(%w{version}) }
    expect(output).to match(SampleCli::VERSION)
  end
end

describe 'sample_cli check subcommand input' do
  it 'has a word by cli' do
    output = capture(:stdout) { SampleCli::CLI.start(%w{input hello}) }
    expect(output).to match(/hello/)
  end

  it 'has a error message by cli' do
    output = capture(:stdout) { SampleCli::CLI.start(%w{input}) }
    expect(output).to match(/Please input `word`/)
  end
end
