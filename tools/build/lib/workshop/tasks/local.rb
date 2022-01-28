desc "Run the workshop devenv container"
task :"workshop:devenv" do
  include Devenv

  image_sourcefiles = Rake::FileList["#{$configuration.base}/src/devenv/**/*"]
  image_tag = content_tag(image_sourcefiles)

  docker_env = "--env HOST_UID=1000 --env HOST_GID=1000"
  mt_points = ["#{$configuration.out}/workshop:/workspace"]

  cmdline = "docker run --privileged -it -v #{mt_points.join(" -v")} #{docker_env} #{image_tag}"

  sh(cmdline) do |ok, res|
    # Exiting docker is not an error
  end
end
