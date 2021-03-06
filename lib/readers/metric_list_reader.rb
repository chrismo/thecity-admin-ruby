module TheCity

  class MetricListReader < ApiReader

    # Constructor.
    #
    # @param options A hash of options for requesting data from the server.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(options = {}, cacher = nil) 
      page = options[:page] || 1

      #@class_key = "metric_list_#{page}"   
      @url_data_path = "/metrics"
      @url_data_params = {:page => page}
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

  end

end
