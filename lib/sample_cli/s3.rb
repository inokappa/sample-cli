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

    def objects(bucket)
      list_objects(bucket)
    end

    private

    def list_buckets
      s3.list_buckets.buckets
    end

    def list_objects(bucket)
      objects = []
      options = { bucket: bucket }
      loop do
        res = s3.list_objects_v2(options)
        objects << res.contents.map(&:key)
        options[:continuation_token] = res.next_continuation_token
        break unless options[:continuation_token]
      end
      objects.flatten
    end
  end
end
