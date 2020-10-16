defmodule Mix.Tasks.Utils do
  defmacro __using__([]) do
    quote do
      defp app_name() do
        Mix.Project.config()[:app]
        |> Atom.to_string()
      end

      defp app_vsn() do
        Mix.Project.config()[:version]
      end

      defp app_port() do
        Mix.Project.config()[:app]
        |> Application.get_env(:port)
        |> Integer.to_string()
      end
    end
  end
end
