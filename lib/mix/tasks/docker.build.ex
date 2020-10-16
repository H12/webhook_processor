defmodule Mix.Tasks.Docker.Build do
  use Mix.Task
  use Mix.Tasks.Docker

  @shortdoc "Docker utilities for building releases"
  def run([env]) do
    build_image(env)

    {dir, _resp} = System.cmd("pwd", [])

    docker(
      "run -v #{String.trim(dir)}:/opt/build --rm -i " <>
        "#{app_name()}:latest /opt/build/bin/release #{env}"
    )
  end
end
