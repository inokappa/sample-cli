require "spec_helper"
SampleCli::Stub.load "s3"

describe "sample_cli check subcommand buckets" do
  it "have bucket names" do
    expect(SampleCli::S3.new.buckets).to eq(["foo", "bar"])
  end

  it "have bucket names by cli" do
    output = capture(:stdout) { SampleCli::CLI.new.buckets() }
    expect(output).to match("foo\nbar\n")
  end
end