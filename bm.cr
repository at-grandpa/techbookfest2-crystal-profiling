require "benchmark"

n = 5000000
Benchmark.bm do |x|
  x.report("times:") { n.times do
    a = "1"
  end }
  x.report("upto:") { 1.upto(n) do
    a = "1"
  end }
end
