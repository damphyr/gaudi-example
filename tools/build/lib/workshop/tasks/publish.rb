namespace :publish do
  desc "Publish the workshop devenv to DockerHub"
  task :"workshop:devenv" do
    include Devenv
    include Docker
    include Execution
    registry = Devenv::REGISTRY
    image_sourcefiles = Rake::FileList["#{$configuration.base}/src/devenv/**/*"]
    content_tag = content_tag(image_sourcefiles)
    image_tag = default_devenv_tag

    [content_tag, image_tag].each do |tag|
      full_tag = full_tag(tag, registry)
      tag_existing(tag, full_tag, $configuration)

      cmdline = Docker::Commandlines.push_image(full_tag)
      run_command("Publish #{tag.split("/").last}", cmdline, $configuration)
    end
  end
end
