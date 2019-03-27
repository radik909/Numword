# mix run benchee.exs
Benchee.run(%{
  "run" => fn -> Numword.run("6686787825") end
})
