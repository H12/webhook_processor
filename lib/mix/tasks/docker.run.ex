defmodule Mix.Tasks.Docker.Run do
  use Mix.Task
  use Mix.Tasks.Docker

  @shortdoc "Docker utilities for running releases"
  def run([env]) do
    if env != Atom.to_string(Mix.env()) do
      raise "provided environment must match MIX_ENV"
    end

    {dir, _resp} = System.cmd("pwd", [])

    docker(
      "run -v #{String.trim(dir)}:/opt/build --rm -p 127.0.0.1:8080:#{app_port()} " <>
        "-i #{app_name()}:latest " <>
        "_build/#{env}/rel/#{env}/bin/#{env} start"
    )
  end
end
