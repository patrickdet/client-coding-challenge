module ErrorHandler
  class FailFastAndLogStrategy
    def initialize; end

    def handle(error)
      raise error
    end

    def flush; end
  end
end
