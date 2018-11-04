module SampleCli
  class S3 < Client
    def s3
      @s3 ||= Aws::S3::Client.new
    end

    def buckets
      buckets = []
      list_buckets.each do |b|
        buckets << b.name
      end
      buckets
    end

    private

    def list_buckets
      s3.list_buckets.buckets
    end
  end
end
