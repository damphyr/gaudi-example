namespace :provision do
  desc "Pull the workshop devenv docker image from DockerHub"
  task :"workshop:devenv" do
    include Devenv
    include Docker

    Devenv.const_defined?(:REGISTRY) ? registry = Devenv::REGISTRY : registry = ""
    unless registry.empty?
      image_sourcefiles = Rake::FileList["#{$configuration.base}/src/devenv/**/*"]
      content_tag = content_tag(image_sourcefiles)
      full_tag = full_tag(content_tag, registry)

      pull_repository_image(full_tag, $configuration)
      tag_existing(full_tag, content_tag, $configuration)
    end
  end
end
