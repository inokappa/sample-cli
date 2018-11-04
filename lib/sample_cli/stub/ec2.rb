Aws.config[:ec2] = {
  stub_responses: {
    describe_instances: {
      reservations: [
        {
          instances: [
            {
              instance_id: 'i-ec12345a'
            },
            {
              instance_id: 'i-ec12345b'
            }
          ]
        }
      ]
    }
  }
}
