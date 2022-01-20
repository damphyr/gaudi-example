require "digest"

module Devenv
  REGISTRY = "varzuehlke".freeze
  # The name of the docker repo/service. Combined with DEFAULT_VERSION it produces a tag 'gaudi-devenv:latest'
  SERVICE = "gaudi-devenv".freeze
  # The version used in the image tag by default
  DEFAULT_VERSION = "latest".freeze

  def default_devenv_tag
    "#{Devenv::SERVICE}:#{Devenv::DEFAULT_VERSION}"
  end

  def content_tag(image_sourcefiles)
    "#{Devenv::SERVICE}:#{content_version(image_sourcefiles)}"
  end

  # Tacks the registry behind local_tag
  def full_tag(local_tag, registry)
    "#{registry}/#{local_tag}"
  end

  # Calculate the SHA256 of the concatenated content of the given list of files after
  # line endings have been stripped
  def sha256(files)
    sha = Digest::SHA2.new
    files.each do |f|
      next if File.directory?(f)

      content = File.binread(f)
      # work around possible git checkout issues by removing CR and LF from the file
      content.gsub!("\n", "")
      content.gsub!("\r", "")
      sha << content
    end
    sha.hexdigest
  end

  # Returns a string to be used as an image tag
  def content_version(image_sourcefiles)
    "content-#{sha256(image_sourcefiles)}"
  end
end
