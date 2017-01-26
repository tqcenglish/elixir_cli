defmodule AwesomeCli do
  @moduledoc """
  Documentation for AwesomeCli.
  """

  @doc """
  Hello world.

  ## Examples

      iex> AwesomeCli.hello
      :world

  """
  def hello do
    :world
  end

	def start(_type, _args) do
		AwesomeCli.Supervisor.start_link
	end

  def main(args) do
    args
     |> parse_args 
     |> do_process 
  end

  def parse_args(args) do
    options = OptionParser.parse(args)
    case options do
      {[name: name], _, _} -> IO.puts [name] 
      {[help: true], _, _} -> IO.puts "这是帮助消息" 
      _ -> :help 
    end
  end

  def do_process([name]) do
    IO.puts "Hello, #{name}!"
  end

  def do_process(:help) do
    IO.puts """
      Usage:
        ./awesome_cli -name [you name]
      Options:
        --help Show this help message.
      Description:
      prints out an awesome message.
    """
  end
end
