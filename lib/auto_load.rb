module TheCity

  require THECITY_LIB_DIR + '/exceptions.rb'

  api_path = THECITY_LIB_DIR + '/api/'
  require api_path + 'api_object.rb'
  Dir["#{api_path}/*.rb"].each { |f| require(f) }

  cache_path = THECITY_LIB_DIR + '/cachers/'
  require cache_path + 'cache_adapter.rb'

  cache_file_path = THECITY_LIB_DIR + '/cachers/file/'
  Dir["#{cache_file_path}/*.rb"].each { |f| require(f) }

  readers_path = THECITY_LIB_DIR + '/readers/'
  require readers_path + 'api_reader.rb'
  Dir["#{readers_path}/*.rb"].each { |f| require(f) }

  writers_path = THECITY_LIB_DIR + '/writers/'
  require writers_path + 'api_writer.rb'
  Dir["#{writers_path}/*.rb"].each { |f| require(f) }

end