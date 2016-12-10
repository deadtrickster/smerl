defmodule Smerl.Mixfile do
  use Mix.Project

  def project do
    [app: :smerl,
     version: "0.0.1",
     description: description,
     package: package]
  end

  defp description do
    """
    Simple Metaprogramming for Erlang.
    """
  end

  defp package do
    [build_tools: ["rebar3"],
     maintainers: ["Ilya Khaprov", "Eric Bailey"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/deadtrickster/smerl"},
     files: ["bin", "src", "include", "README.md", "LICENSE", "rebar.config"]]
  end
end
