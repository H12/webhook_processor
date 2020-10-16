defmodule Mix.Tasks.Docker do
  defmacro __using__([]) do
    quote do
      use Mix.Tasks.Utils

      defp build_image(env) do
        docker("build --build-arg ENV=#{env} -t #{app_name()}:latest .")
      end

      defp docker(cmd) do
        System.cmd("docker", String.split(cmd, " "), into: IO.stream(:stdio, :line))
      end

      def run([]) do
        raise ArgumentError, message: "target environment not provided"
      end
    end
  end

  def run(_) do
    Mix.Task.run("help", ["--search", "docker"])
  end
end
