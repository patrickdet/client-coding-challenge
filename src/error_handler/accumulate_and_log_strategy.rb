module ErrorHandler
  class AccumulateAndLogStrategy
    def initialize
      @errors = []
    end

    def handle(error)
      @errors << error
    end

    def flush
      @errors.each { |error| puts "#{error.class}: #{error.message}\n#{error.backtrace}" }
    end
  end
end
