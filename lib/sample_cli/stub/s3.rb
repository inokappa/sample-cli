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
    },
    list_objects_v2: {
      contents: [
        {
          key: 'foo'
        },
        {
          key: 'bar'
        },
        {
          key: 'baz/key'
        }
      ]
    }
  }
}
