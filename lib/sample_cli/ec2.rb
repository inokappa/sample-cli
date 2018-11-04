module SampleCli
  class Ec2 < Client
    def ec2
      @ec2 ||= Aws::EC2::Client.new
    end

    def instances
      instances = []
      list_instances.each do |r|
        r.instances.each do |i|
          instances << i.instance_id
        end
      end
      instances
    end

    private

    def list_instances
      ec2.describe_instances.reservations
    end
  end
end
