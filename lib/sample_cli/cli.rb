require 'sample_cli'

module SampleCli
  class CLI < Thor
    desc 'version', 'version print.'
    def version
      puts SampleCli::VERSION
    end

    desc 'input WORD', 'input words print.'
    def input(word = nil)
      puts 'Please input `word`' if word.nil?
      puts word
    end

    desc 'instances', 'list up instance ids.'
    def instances
      ec2 = SampleCli::Ec2.new
      puts ec2.instances
    end

    desc 'buckets', 'list up bucket name.'
    def buckets
      s3 = SampleCli::S3.new
      puts s3.buckets
    end

    desc 'objects', 'list up S3 objects.'
    option :bucket, type: :string, aliases: '-b', desc: 'specify S3 bucket.'
    def objects
      s3 = SampleCli::S3.new
      puts s3.objects(options[:bucket])
    end
  end
end
