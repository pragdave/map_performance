defmodule Measure do
  # based on https://erlangcentral.org/wiki/index.php/Measuring_Function_Execution_Time
  def timing(title, fun, iterations)
  when N > 0 do
    results = test_loop(fun, iterations, _times = [])
    length  = length(results)
    min     = Enum.min(results)
    max     = Enum.max(results)
    median  = results |> Enum.sort |> Enum.at(round(length/2))
    average = Enum.sum(results) / length
    IO.puts "#{title}\n#{String.duplicate("-", String.length(title))}\n"
    IO.puts("Range:   from #{min} to #{max}µs")
    IO.puts("Median:  #{median}µs")
    IO.puts("Average: #{average}µs\n\n")
    median
  end

  defp test_loop(_fun, 0, results), do: results
  defp test_loop(fun, iterations, results) do
    {time, _} = :timer.tc(fun)
    test_loop(fun, iterations-1, [time|results])
  end
end


defmodule MapTiming do

  @small_list   {    10, (100_001..100_010 |> Enum.shuffle) }
  @medium_list  {   100, (100_001..100_100 |> Enum.shuffle) }
  @large_list   {  1000, (100_001..101_000 |> Enum.shuffle) }
  @xlarge_list  { 10000, (100_001..110_000 |> Enum.shuffle) }

  @lists [ @small_list, @medium_list, @large_list, @xlarge_list ]

  def insertion(target) do
    for {size, list} <- @lists do
      fun = fn -> 
                 for key <- list, into: target.new, do: {key, key+1}
            end
      { size, Measure.timing("Insertion into #{target}. #{size} entries", fun, 10) }
    end
  end

  def access(target) do
    for {size, list} <- @lists do
      dict = for key <- list, into: target.new, do: {key, key+1}
      keys = Stream.iterate(100_001, &(&1+1)) |> Stream.take(size)
      fun = fn -> 
                 Enum.each(keys, fn key -> 
                                      target.get(dict, key)
                                 end)
            end
      { size, Measure.timing("Access into #{target}. #{size} entries", fun, 100) }
    end

  end

  def print_timings(title, fun, modules) do
    results = (for module <- modules do
      fun.(module)
    end)
    IO.puts(title)
    tlen = String.length(title) + 2
    :io.format(String.duplicate(" ", tlen))
    titles = for {count, _} <- hd(results) do
      :io.format("~6B  ", [count])
    end
    IO.puts ""
    for {module, result} <- Enum.zip(modules, results) do
      :io.format("~#{tlen}s", [inspect(module)])
      for {_count, value} <- result do
        :io.format("~6B  ", [value])
      end
      IO.puts ""
    end
    
  end

end

MapTiming.print_timings("insertion", &MapTiming.insertion/1, [Map, HashDict])
MapTiming.print_timings("access",    &MapTiming.access/1,    [Map, HashDict])




