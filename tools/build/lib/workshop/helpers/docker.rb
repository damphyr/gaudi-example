require_relative "execution"

module Docker
  include Execution
  # Docker commandlines in use by automation scripts
  module Commandlines
    # Pull an image
    def self.pull_image(image_tag)
      "docker image pull -q \"#{image_tag}\""
    end

    # Push a docker image
    def self.push_image(image_tag)
      "docker image push #{image_tag}"
    end

    # Tag an existing image
    def self.tag_existing(existing_tag, new_tag)
      "docker tag #{existing_tag} #{new_tag}"
    end

    def self.inspect_image(image_tag)
      "docker inspect #{image_tag}"
    end
  end

  def tag_existing(existing_tag, new_tag, system_config)
    cmdline = Docker::Commandlines.tag_existing(existing_tag, new_tag)
    run_command("Retag #{existing_tag}", cmdline, system_config)
  end

  def docker_image_exists?(image_tag, system_config)
    cmdline = Commandlines.inspect_image(image_tag)
    run_command("Inspect #{image_tag.split("/").last}", cmdline, system_config)
  rescue GaudiError
    return false
  end

  def pull_repository_image(tag, system_config)
    return if docker_image_exists?(tag, system_config)

    cmdline = Commandlines.pull_image(tag)
    run_command("Pull #{tag}", cmdline, system_config)
  end
end
