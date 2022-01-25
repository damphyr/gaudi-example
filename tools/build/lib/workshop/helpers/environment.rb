module Gaudi
  module Configuration
    module EnvironmentOptions
      # The DOCKER_REGISTRY to use for publishing
      def docker_registry
        mandatory("DOCKER_REGISTRY")
      end
    end
  end
end
