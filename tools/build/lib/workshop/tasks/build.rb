namespace :build do
  desc "Build the workshop devenv container image"
  task :"workshop:devenv" do
    include Devenv
    include Execution

    docker_out = File.join($configuration.out, "gaudi-devenv")
    sourcedir = "#{$configuration.base}/src/devenv"
    image_sourcefiles = Rake::FileList["#{sourcedir}/**/*"]

    mkdir_p(docker_out, :verbose => false)
    image_sourcefiles.each do |f|
      src = Pathname.new(f)
      tgt_file = File.join(docker_out, src.relative_path_from(sourcedir))
      mkdir_p(File.dirname(tgt_file))
      copy_entry(f, tgt_file)
    end
    content_tag = content_tag(image_sourcefiles)
    image_tag = default_devenv_tag
    tags = [image_tag, content_tag]
    tag_cmds = tags.map { |label| "-t #{label}" }.join(" ")
    cmdline = "docker build \"#{docker_out}\" #{tag_cmds}"
    run_command("Build #{tags.last} container image", cmdline, $configuration)
  end
end
