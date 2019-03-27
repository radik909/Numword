# mix run benchee.exs
Benchee.run(%{
  "2282668687" => fn -> Numword.run("2282668687") end,
  "6686787825" => fn -> Numword.run("6686787825") end
})
