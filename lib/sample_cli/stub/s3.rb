Aws.config[:s3] = {
  stub_responses: {
    list_buckets: {
      buckets: [
        {
          name: 'foo'
        },
        {
          name: 'bar'
        }
      ]
    }
  }
}
